Return-Path: <linux-arm-msm+bounces-102214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KP1XI2NO1Wla4gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 20:35:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AC73B2F28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 20:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 65699301489D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 18:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6FD527E045;
	Tue,  7 Apr 2026 18:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VAzNrVHb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OTg7QCVm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC3440DFD3
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 18:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775586905; cv=none; b=CSlgDIi/8DyVvKzu1e0F4y2otq/XZYzHCm1v5GjbxEx+EsxfNY629hOnagy9jHQCGOVAF56ck0iyVk7zF0aWZplTQORGys4hXDG5W6eCtzkt6Npr2ErSnhQWsXh9eBFyhj4jk8bTTrLR3zCyrNpNrFD5sMik3cQHWrlktXWPvDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775586905; c=relaxed/simple;
	bh=e6zLGCWKG44Q6CpIMyHF06pldNfJdlFQblcr2W88R/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hA2cTzfzcSBjknm7aWg8TTlGTnN1yfUee+vWSo9PcJEy9h14MabwJDAAFkX7ga36xHm3C83KFcNrdERC8cdxALSvXJPLzrluLuFVX/JX5QIyJKUgGCU/U4Zva9xq2jIJpPqyzf+GBvLeE6g1V3AJE4XMBLwIlaN3SL/wwRDD6jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VAzNrVHb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OTg7QCVm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637DAaDP2550167
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 18:35:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1GSrAmuKrIi32WHQZ3k6P9UtXY6AROmfCS8TaAEi9bM=; b=VAzNrVHbGu1fuNrW
	BniHQ+kMFar5BQK+qOko0vJ1nkEO8zoGOkj9PoqCnIrOkVSBYiwQM/Gn3tfmKgJi
	oznSrDkOXKRmhFcuiZ1pnkUzYuZtC/rDOunTqV9vBo7mkZ6wY/F1BQlaA5hbrStj
	x1Fr5NBj+cVCFMbCUM73RDmC47JMdTsSwmqOikoIkAGig3mcOySFk/uACS3pxFha
	OZA13E+L5AtUkZphM72UulMlWpqt8YOyk63olOFD97pFWzGp2P8OtniUQFkl09ra
	L0ZA+FeTIGWj4gLVQwGA5DpauUxXREGUMjbqKNRjK4OS0bVdq2DfpFRgi2tyy9Hd
	vvcY9Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrec6wd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 18:35:03 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c83bd48afso3035801b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 11:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775586902; x=1776191702; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1GSrAmuKrIi32WHQZ3k6P9UtXY6AROmfCS8TaAEi9bM=;
        b=OTg7QCVmcCD7laWwdef4hfJvCZAf0L5AMstR3lqAC0fzwmkIaKuie/N9BxpHnCvjQX
         xoRt6I9CoEPpg135RgvQLjonXpmtIlLMm6fk/AmvHL8pICR+R+VVxws+9JCjmu4pQLil
         1k5iirE+RFDV18aD5g22s9Xv7HkHqn87lcrS/CWzvSVvbYammvqCv7PKD45G3zuB9eHh
         AhSys+Ki+ELAJXpZ8joF9rUZMaz1B5wnJy8COjRgzpSEP8a10InnPzKVydTYeDYXijm2
         /oSC+E07d/g+kdEVefBYoa9GteomH/7cDKoJrZ7E0DbxIifWTclL6QySxrQ4mHo3IIOy
         spsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775586902; x=1776191702;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GSrAmuKrIi32WHQZ3k6P9UtXY6AROmfCS8TaAEi9bM=;
        b=OL7OCefg5LYEZMa67X2kTG5LXG0rXnvZ2U0nZ097oixWmFxz5iWGZfxa5tf1Izs3yM
         AknHNu3bI9imIUQ1uoPJJWLh6ZfgpO7R2NtMZTIq2AwW+Veg5kkyZmRE05MIdMhwcpoa
         TGr9u4dTNGNNsqvkFQImSbLLGkSorPNPekvjvPgqEdWZgBvVFxHIEwzr6z/x5rZOlRCe
         Mx3/Z/8uwkAdmi5+yy6LxQWfsVvp+sknI0PI16hKdwUi2K+vWgpJOiGKkQWKDJDDooM5
         dSFUc7jF/7ln+83Lw6GbHDSC8qhXRjsUHm1X2qRyzyWWxLKEV9bruLi0DOk5MuW5ACzq
         S64Q==
X-Gm-Message-State: AOJu0Ywd0iZEdJY0MPmLwwNL7f0qzFakbigHplwVw+98+qaWzLL6k5CR
	SYnZXHCdP2D8YePVUzAVYIWImaTlYPbTt9aaN89uSwas6YgjtVcF1nRXK2tSmyd8h640Anb9ehi
	9q6PVB6BcyY1/vPkZMtxY0t82wTsSGwXuHtZApoJQg84KlvS21QgjqwA6YZxpISQvFzYW
X-Gm-Gg: AeBDiev47HNIfMQfKQKs+rnxgSWc8dbwDTAYG6Kce4MKyhaLKxBol0E7V23GLSyfqsA
	1jqQcSHR3Vpu9Aq/J1oRaIwO5RNQB9FMuzw6jsJ/zVfjP6AR/sNyQG3MoYKMnUq2xQDQJ5MgWjM
	fbUqtIoStuGkUnexOD2D4vTp4AGTQmDwd2yurn38W6LQbD1O52/5mZHGqJC16nUw+WL3ipB2qZA
	IOeTIfNcClrMLX3+9m432nh4RHhPCnr01KvdQQPvXVDLyKdnDJWhp9uq8JKxH6OKcjy4Vv1yE32
	ErldqKFvpn7oZyfG+xYRhiTvAjzvMIPe4FWpaRdCPoGSwXrjzlyu2A3UOUmrtMSVH0eFnyxxo9k
	c3I9ONWe0cyFuad6WiW3gKTFdLheZpkmnhsVBUbssdVrNer2fMg==
X-Received: by 2002:a05:6a00:2e85:b0:824:3bd9:aac6 with SMTP id d2e1a72fcca58-82d0da66c8emr18127708b3a.16.1775586902401;
        Tue, 07 Apr 2026 11:35:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e85:b0:824:3bd9:aac6 with SMTP id d2e1a72fcca58-82d0da66c8emr18127675b3a.16.1775586901889;
        Tue, 07 Apr 2026 11:35:01 -0700 (PDT)
Received: from [192.168.1.58] ([49.205.241.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c9ba21sm24353765b3a.51.2026.04.07.11.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 11:35:01 -0700 (PDT)
Message-ID: <b204ebc2-8260-45aa-af33-5fbe680acd12@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 00:04:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: crypto: qcom-qce: Add Qualcomm Eliza QCE
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260407-crypto-qcom-eliza-v1-0-40f61a1454a2@oss.qualcomm.com>
 <20260407-crypto-qcom-eliza-v1-1-40f61a1454a2@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260407-crypto-qcom-eliza-v1-1-40f61a1454a2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OKEXGyaB c=1 sm=1 tr=0 ts=69d54e57 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Rz+oJFlrletnL8nt2WZDKg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Xf1yJYGQRHwPKPLo8RgA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: UcHZIr0u6Z4Ki8l9a9uMlFxhHAHUZc8z
X-Proofpoint-ORIG-GUID: UcHZIr0u6Z4Ki8l9a9uMlFxhHAHUZc8z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE2OCBTYWx0ZWRfX6773EB3naOJc
 mgivUm0mmNyK/KYTsgfc70MheCgE5Yqr4yJ9l4LebFFgbj9uZKP7AzF706JZ4L87Km3OOHrASbX
 rpme2eSYRsOPtd0aqTv0t1pf7FGf3cDqWTDyewG+4PKO/97gfuyZagOfHY8rNx84ifpw74bbSwn
 NndW875pu/UXE/kTSA8eCtUKcQ4J9J42zm+bp+C8mfGo82lA+qnfcQmvNBC2wpFELdfn61dkpXj
 INUlxIs+3uSmv3mzhiynaT+NScK3m7BDlCtcQ0Sc0ArMSlIFJG5yRZ2gKIe8yXbrCZ9Rj26R2It
 gpqtYptNqKFP5Vgr8Mh1n4QXkYDwFGMxHJeKfknO1AWrkr4Vi6KuJrgwTUxWzxkxogVcP/XSTTF
 tgzmtqY7lLWXPvkz5ydZPeqU7wqt3gVwMYXI+ENeUgIVHLsGx7Fop+oKXRWuNIMcb4TYi43qJrs
 9LbkXxvY4DwitQdUZRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_04,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070168
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102214-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,gondor.apana.org.au,davemloft.net,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 93AC73B2F28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/7/2026 7:21 PM, Krzysztof Kozlowski wrote:
> Document the QCE crypto engine on Qualcomm Eliza SoC, fully compatible
> with earlier generations.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Regards,
Harshal


