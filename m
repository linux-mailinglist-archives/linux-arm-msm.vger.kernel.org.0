Return-Path: <linux-arm-msm+bounces-101291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDG/CVHxzGknYAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:20:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F404137862C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DAD943009E34
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 10:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73E33BD64E;
	Wed,  1 Apr 2026 10:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ebvu3MHV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bZLEuRZk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A3D3D8907
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 10:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775037921; cv=none; b=Hdfx4x2Aasu3eYIU8UzaoEJRThQWkZ9Nycx+YpkPiQZnkeIF+wMJ8ftbcVH9YQhkJQtgKxbGemgDPAjN81mduB9x5NryS1RFxMa3YlSxBdc8JCON8rrL3B2n25AipGbIMhK7XKv3gPrEwUyxccYge1WWU7LV4SqG/w8pkJlmFns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775037921; c=relaxed/simple;
	bh=vznz2tV1Ns0YjEM8BW+T36U+5Yq5ihpKB4pW/NTtzt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uJiBHXpLLvZCXxK+Rhu3wCrd/NkhBPE2jaIokb4KreIdDXqptbxT1CmOQaORetTp9XXofUYHAbH1oD9w+Modrl/phGcF3EMZdxBC7TMN1CcXHlA+T8oz5nO7gi29dciY1nwSfYkj7j/ZId6VcCiC6LIcOb62FxnvvWom+g7qxdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ebvu3MHV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bZLEuRZk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6318C3KE718617
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 10:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oFk4MckO7vhSCoIPLfehPhdy1cYDQDKTBV4wM3MEXQs=; b=Ebvu3MHVVRZqRv94
	h9nqol5XXQreMdAM0bqRXcIIkvQSv4yp/rRAl81eAeYd5fsBFpgQWD7UORe2VaTr
	VFjMF43Epn0wMZMLHGpoH6dQKtctJjnS+Pq1orJmzU9Zjymsb0HZ1A7BxRgocOxu
	W45Jwb5xzwztOU5Y/V/3M/NDyew4EPjgF7XOD/cgkJjn2y4uMYhaFNL5TJFpJbEw
	JaufdwNSRnzwWbBjyuYm92kQXH97Jz3ydaMmHNQq5nBdDu68a36SdLfMp1koWneM
	0j6r4dcYs03jTlVStAzsIVY7JqER5yKunzjvsV+GGXWG6iR8kyBrFY0NkLobqsgg
	HozjDA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kcsue4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 10:05:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cfbd336c3eso254818585a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 03:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775037917; x=1775642717; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oFk4MckO7vhSCoIPLfehPhdy1cYDQDKTBV4wM3MEXQs=;
        b=bZLEuRZkFj+4ym58oED+pLdmM/gxQ5KY/DAwIA9AufmLi+J+8qbxpFoXpYDQluxDR1
         mzUsk/+MpT7wHQH1BCAggesuRaDcBT8Rki/P2APaa0s6hWxuQTWjHvexfYmvJWNZPDTa
         2NR7QFbe2al4HNNc/XtOx4wI+3ifytmzcL8yewz9NBEDWGylqCYHVMJcAoc3lFsq1rC+
         nEed5B5/qcnlUx0iUn5k98ZBYBBU0Jr/Jrx7yYTQECJw2giZYjiUfumaix1RENYDAaMm
         I05ppsC8fPIhcvhmP0gt39p6uJwle07zajdFry9DJdOB0AgJJFofVFMuOZtww3PeQSzx
         z7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775037917; x=1775642717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFk4MckO7vhSCoIPLfehPhdy1cYDQDKTBV4wM3MEXQs=;
        b=VVjxVePWZ4nepfzr9kYgRbz6lIUhes4qbMTEsrUhaVh9vw9i2FdPBcaLO3msTdrH22
         Xoq/w4VDcKCjGBqQsR14iIXCOId3Q2VYPvTh75lzXEvfK7TPqKEiZFLBCxJC3YtMF3DH
         PtdfWN6Lhq5Vv90mrQTHm+A010i80iPGM8KKLIj0yTQdWcXjHjqPw8u81xBn+l2Rx3+A
         /YA7vP71DXF6kYAvDhi+P0Ye4liFkQy/wL0grMRQStKgDLPKKYT02H6Jx33FlBVmN0/+
         Z2Zqtk7ToE3gOEJX3kpUbfhmaH+Yg23WcsZ+f+G+UtIp1G8Mtgp310Fu7K6mra6/2GqE
         pcXw==
X-Forwarded-Encrypted: i=1; AJvYcCVIXb5SFFD63v5cTkjRQAURnoI7cixxkLjNdFwl3n390EepoX+jF4Og264ohxwvx7RLGNgrEZvEnBMTYwpL@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+i06jHHPgzTtnDjWhaZF9D5Cex655El0TzYTsK0fgbZOowxfL
	LPTB47QKY4saTfuPC/X0S8VGqIXBC/DGUxw7oYs6Dq7/USTtCgPCQ/Id/7zZ0Xeu4M3mMmAd9Dr
	zZKvnxDIgpnaWUt59yBAx0ALeFNnz4skcgg9JBARjpovVJqFcfYopU0Lpo3JZFKuNBvTt
X-Gm-Gg: ATEYQzywmQBM8KZWfp1pgxruCKozBOIVa0MdvpGEeKm36TpF++i2zjccVC/Y4njYPwH
	bLPT1NYlcJPWu/+FnfV4dDJZJ1hvK7e8IuBHdV4VFL96bNlckrV3BeGtoBUedbrtY/OE4Jpp7uC
	YzuCiiMc53IuKNbPZW+T4P82msdFqjCj6jzEtgrhJj0HtmwflPw5hK7jBqaXbl15D9ePCaW3zlm
	0BlxYfE/RAO9cVl+XDiJAn4okmVAidIWViISQzJ5p3CBuUTj9FnWw1U021cNX+u+fjcevp0ujEb
	7mB9nvPjKM0WUyj64RoBlmeLBG14yrQTtdHKwdg8P6PyuLJQm/BNLxBtwUBR5QrsI72nawoda+d
	O9WSlcNDqfcYZ9+xy5lWw/fOpOIukVRVJvY4ohwnhYhQqLjUHVFDf4YvkotzEc3FVt+ZFgTF7PD
	Z3UQg=
X-Received: by 2002:a05:620a:6891:b0:8d2:394a:d3ed with SMTP id af79cd13be357-8d2394ad88dmr30623885a.5.1775037917071;
        Wed, 01 Apr 2026 03:05:17 -0700 (PDT)
X-Received: by 2002:a05:620a:6891:b0:8d2:394a:d3ed with SMTP id af79cd13be357-8d2394ad88dmr30620785a.5.1775037916700;
        Wed, 01 Apr 2026 03:05:16 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66d953b351bsm853986a12.30.2026.04.01.03.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 03:05:15 -0700 (PDT)
Message-ID: <2971b14a-eb0c-4c5b-bcb4-dcf8f6759a31@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 12:05:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: spmi: glymur-spmi-pmic-arb: Add
 compatible for Hawi
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, Stephen Boyd
 <sboyd@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com
References: <20260401-hawi-spmi-v1-0-c40963041078@oss.qualcomm.com>
 <20260401-hawi-spmi-v1-1-c40963041078@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-hawi-spmi-v1-1-c40963041078@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5MSBTYWx0ZWRfX7e/Jy+dVtxN0
 RtCAViLXTM6P8LbwkDmn+8EqvRzOXIilnyoKLo7lqqVxZG0fp1VX5kTq0U1nIa2b5QGqCVsxoxT
 YQ1QIfT0VY1OzjN7LVnCqucwS+aQbychYcPxKdpvq4kxGGdAKjWKNguCRvP2tlJCx/wLNXfKvS1
 O03xoPhgYmAqZ1yfYq5bEw/Q5KVM7QXg0M1Qwjfs3+BEeQaD0g0u0HGbdGrnNj6LvtXZePCQ9w9
 etV5/s59i+yKpFyTu6Q+Fgxh+i82hnatbhvqYKEU1IkjJmDTRsNMyXTmPYomiNMsemYs1fPRaqs
 Tj2JUYQKjaIpW9qj4vK63A1wrN1iI16IYbF8q0z9Ll09RGS2HOKIRq9vFdaJUDLxDe0PSfcstN6
 7yHDO6zmiiATNZpN3qtyu3iCc/wryJ3d8kxYxuz81HAckEdTlYkco4pJtzCJEI6fJyztyUt7pRs
 AWEGRlundVp+elLMvaA==
X-Authority-Analysis: v=2.4 cv=KNlXzVFo c=1 sm=1 tr=0 ts=69cceddd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=1ITcerkRxF6bofEJBuUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: V9o2ipKD69nzZEheoSmEkrfk__SLoH2I
X-Proofpoint-GUID: V9o2ipKD69nzZEheoSmEkrfk__SLoH2I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010091
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101291-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F404137862C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/1/26 11:41 AM, Fenglin Wu wrote:
> Add a string for hawi-spmi-pmic-arb which is a compat of
> glymur-spmi-pmic-arb.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---

Considering the driver change wrt the failure bits, I'm on the verge of
calling these two compatible.. I suppose one can argue either way since
the end result is mostly identical

Konrad

