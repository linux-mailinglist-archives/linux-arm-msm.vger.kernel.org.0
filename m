Return-Path: <linux-arm-msm+bounces-115480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7xJzIs7aQ2orkQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 17:03:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8536E5B0B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 17:03:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PbDRoupy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fNiDibid;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115480-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115480-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89B743024151
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198A543C048;
	Tue, 30 Jun 2026 14:56:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A093BB9ED
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:56:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831406; cv=none; b=C54UriQEdQVzwS4uFUPV5uga3HigXx2wBapFuArxWlhVg3gGVht76jPVo9/u6pNOC8weLlA3+oHlGvcDGI223dYQO3RdCzPlPUJyEGwHZTto+Tu+dsQJg1YK2tJWtKE/Ws7sFUYlj6aXZvcVTFkSFIU7B+Jxe6koaUHGLikj/Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831406; c=relaxed/simple;
	bh=R3Og7UN2n8n9LTZTfx1vMc5jN8NgotgtqijYcSnTn/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WjTb5FvOAonLLwtspUaggeEs/Rp2fY4YvHLGWhJR60CMTAzz3cGCkYzcjPvOAoFNPVHGA5AbpyFzuteKo4Vyb00TJ4ME/X/gQyOj0Y+GN+pzqmQlEOGY9uNNxnDh9clesX/poEcXVZ4zS4+rk5z1Jb5L1Sz0cHiqA5/gvhBxAk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PbDRoupy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fNiDibid; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDVSv2116481
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dgvL7NjSVUKBYdOnhG+1nuU7W73bphG+krxfU0rVXsA=; b=PbDRoupy8AaJpDHU
	v96GzSIeByyyMFP7M7jBSf99kw2LGPuGrK6Fy46NaaaWPKbRw8Uj/ru2/e+TUgUR
	e49p5XQRsJDwMvFxug+yjpfKAn6ea7Ob46kdR3NgwDecfEULxYYrxXXQexzJkKMe
	rW66xObHFDh/d1N1ANIk8S66/4gUEcf9AuiGPcKxFM18rmynOUOShQXcyu91kaJZ
	mN44BrCe74H5URuZ7BznmzOdLIkSe1UzzNSSfakMvdkz0/Xw5fDqO+2kF7lBDeFL
	iJk2Ccbbuc3pindVV5jw6vFHAjPgZxseQClnZg3VhNGz3CY+etIHOdU4/LTdyF6r
	+M7DhA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9j4574-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:56:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c98a4ded1d7so718293a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782831403; x=1783436203; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dgvL7NjSVUKBYdOnhG+1nuU7W73bphG+krxfU0rVXsA=;
        b=fNiDibidiR5z5w3dtWU+I1/pLsQPybtmYNSD3oCVZrZDEBu7vWNwT8iQjS+zhq/e/j
         gVjoe4jOuy54Dd4dCzbTXw33fcJ3t8Wg/FNj7WXTlA+AbEjNJXVY/pFRr7Lu6yxmgbcz
         w75a7W/Krb8GoX2LknLYzZmsj3/2VplEOUP1klNpgjoBtrd10vf8RDfmP21L7Kr8zRlq
         hU9QqBHjFEgTV7H7asRUEp3UYQt6thbOfQXizZemqSmjqfHZQTxhY1Z1hbf4nnYiz6yC
         MKezsClf7ghNDFSmRd5rtq2t8qhMU6Pkof/dkLyvzVdqPuHYmijX+TWDQzgD4hRJdjjW
         sCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831403; x=1783436203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dgvL7NjSVUKBYdOnhG+1nuU7W73bphG+krxfU0rVXsA=;
        b=SD5Q//Qg0OcwtwIUrKBkfgrKVNkHVet2/b7eS54NhV9iUR/EwNRXVDVyokENuA79s0
         kvRLMbRl1gsjKYj8vBjAWQ8NpeN01DiHQwDr/Wajs0dHcqFddjduFN9MDm68yGHa8ndl
         Vy6WiYwZyTLCv6sm3zJ4smqp0sy5vfgKDQEzCUA5OZj0JhLv/iuznTlHtZ6p4P/przfI
         8DOu4fPogSg6np4nVk6NTO7PE9iuuVe3nLOVyQ6zQr51QDeBI0Fns2+YgdQtkmJg8CAK
         ljSVS4ZNrZG5b1uQTNYw6reeqy9Xm79yiXgaMevLRpXEQtEulIbVDt0CLxqIi/o4eqIH
         W0nQ==
X-Forwarded-Encrypted: i=1; AFNElJ+fiETX0rCrIiPn7+xzK3xaA1Smx0JD9Ryfw6Ej0WXx/INMQR85TmU2Du/aQl9tOw7ZkQGj1JV5TmLfa8Tc@vger.kernel.org
X-Gm-Message-State: AOJu0YxXWTOOOy5ovJV3GnCK2Wkxj+SpBsbh4L22XHT/KRqztxpXZ801
	vKj1H95TR9VSkPQgABlzc/t6UQo7vIEbIVlo8zcRtkPsNUq0QUvKl7cY0qIxNpP8pEU5buovMsg
	ZmaQ4Jt/ab5HfgwFo82zc+0rbSpLPy4uj2XLLL1otsFSjB83zNtMk+jUSlkv8FGRhYVSC
X-Gm-Gg: AfdE7cn3kR4+jxt7t261J3x+QLgzDaDfwmln2PerMqhBKl759qRck7FsuKsgR9sGfgY
	NOd23g2CidijKtsHx1QOL5weoUFuaebnCt31gu6D5W2eD8NHxrGQe/aAP+acHW3L83rWtVB0D0l
	6+uKxrfe+YH70VZXpngvUZ3vqWlNHmcmDIKpFTNklmntJkNsIgx0vunJOA67YAfeupWNXNKkwJs
	oq+by3SfA9NJT9MFlP0Xr++HmUouQnyYBWTkDxq8RAi1ewiijMtU08L5s1LQh+OrikdTmyM6bNo
	oJtJLrErbyOFnptxH0EB+PoxcRsVLxHDK4meZrAEFFKMRgP6DDa+hfC9AuFzaPhEfdjcjoEl8sb
	+CA4TE13Mx1QIh7xfTCJCSKCSLEAWJEFM
X-Received: by 2002:a05:6a21:687:b0:3bd:187e:2de with SMTP id adf61e73a8af0-3bfdc359071mr646910637.25.1782831402845;
        Tue, 30 Jun 2026 07:56:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:687:b0:3bd:187e:2de with SMTP id adf61e73a8af0-3bfdc359071mr646883637.25.1782831402423;
        Tue, 30 Jun 2026 07:56:42 -0700 (PDT)
Received: from [192.168.1.6] ([171.76.81.78])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9bc02082ebsm1824121a12.26.2026.06.30.07.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 07:56:41 -0700 (PDT)
Message-ID: <68dc89e8-2c91-497f-a665-4a7a8ad2bc76@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 20:26:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: embedded-controller: qcom,hamoa-crd-ec:
 Add Purwa IOT EVK
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260629-ec_support_for_purwa_evk-v1-0-e082b70138d6@oss.qualcomm.com>
 <20260629-ec_support_for_purwa_evk-v1-1-e082b70138d6@oss.qualcomm.com>
 <20260630-unstoppable-phoenix-of-dew-9f0bd5@quoll>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260630-unstoppable-phoenix-of-dew-9f0bd5@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: feoopVTGcB6ifv5hg-JTuhxum9_fCsng
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE0MCBTYWx0ZWRfX01nAS1GlGbla
 FgmnfxG3cFG6RwpYgiRmDe3RGgzOVNPpwxTgHS5Np7c2YzfD8gzvzsl8i5ZcAFN5k5egMgNR2Lp
 1xP7S6YtDzKGYuptBnSPKHz3V7iKlIctKJk4moN1rKUokpTkXfVh0r/oSTHPCKrNfL7X5tXOmtm
 6gZVAjvtzurcsrD6ZNycSjR7SsIKlqkmXyq0uDwPHTtvvcVahO2ykalX67mY6RJJLVkvZ76Nwh3
 CASxsgmqZiE27tWj9ECVA28ibti5PGHVD4uNX9nBV0RimnWqYQMA8i9/fUTiuqqC+iaxhJ2+zHO
 HEfZEzxcrmovPlOewI1M8LE+07kXbwN1nKk26rydNTxliyLlwa8YUvvRgml3I9F4QGe8bGa17xL
 TbMBCvYEJYzNyAdOobHH6yYqWbIJXtfv3JMd7dA5Z8dR69dpFyhAw4eq1q3wNtR8JctsVVKl/t0
 HShGZRcjaBIz0RYqazw==
X-Proofpoint-GUID: feoopVTGcB6ifv5hg-JTuhxum9_fCsng
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE0MCBTYWx0ZWRfX+5U5WwsbdTlV
 T+jxgJNECqIq1D07TtRC8oXPyqJ3g0X2l/MtxQtwf44ZlPH6MsHBIc81ReQJiYLgaviDmhJng/T
 lRU1HcZUqJbwqPUrC69POy9TZO9CGCE=
X-Authority-Analysis: v=2.4 cv=SINykuvH c=1 sm=1 tr=0 ts=6a43d92c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Tlw+mRs2SjLwfDc/NrL+bQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=QOAcj8qZypVd95KNxhoA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300140
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115480-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF8536E5B0B



On 6/30/2026 12:49 PM, Krzysztof Kozlowski wrote:
> On Mon, Jun 29, 2026 at 04:10:17PM +0530, Anvesh Jain P wrote:
>> Document the qcom,purwa-iot-evk-ec compatible for the embedded controller
>> found on Purwa IOT EVK boards. Like the other reference designs, it uses
> 
> EC on an IoT device? This needs some explanation of hardware.
> 
> Best regards,
> Krzysztof
> 

The "IOT EVK" boards are full Snapdragon reference/development kits, not
small sensor-class IoT devices. Like the CRD, the Purwa IOT EVK carries
an on-board embedded controller (on a separate MCU) that handles fan
control, temperature sensors and EC state-change/suspend notifications.
The existing hamoa-iot-evk board already documents the same EC via
qcom,hamoa-iot-evk-ec.

If needed I can expand the commit message to explain this.

-- 
Best Regards,
Anvesh


