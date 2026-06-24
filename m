Return-Path: <linux-arm-msm+bounces-114371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OTN0Nhf4O2qlgwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 17:30:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6A16BFA97
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 17:30:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fTBfZGje;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="aEB/TlsP";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114371-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114371-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9110630356F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 15:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3D943D905F;
	Wed, 24 Jun 2026 15:24:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE8E3D9DD1
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 15:24:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782314671; cv=none; b=h+6rb4VnUW5lYQyeIC+HBL+G17Ap0rFE3t/IV5QoFR5rsneuaxr6xN6r8fY66r/L8mUEzcxqnubGi9FFWq45d+OXNuTNvUhcP05oMQFmKrE24QWrg+xQWTs1HUwM4x4DmtseSgoxfowVkVV46M8Umd4nwMZNKZVadvwEmmoP7dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782314671; c=relaxed/simple;
	bh=NIFqQ5VLQEybFPbf8kx/MQ9a3MhIR+vN3+q09x1MJnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EFpLR/BaFFBB3+2FY/hzNVGCCtTuKKedJN6YP3BQFjxMetKGbh+NxjV6ssCq2JIum7kRrLtZxN/B2VjQRf/WMR0xJd92Ps4nZbHaK8fNgiC32aQIJDNkUNMrU91EwlBxu060F15LA3cMWNpcaA/XEKnJAF9d5PwRWbOmg6e97rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fTBfZGje; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aEB/TlsP; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OEfwOu3078685
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 15:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hjwRC0IlwgSgiL2c9VHAX/AhDHtnXxRe7151xT3/ODw=; b=fTBfZGjeHvyz8W4j
	WDD6AK+h7jOGUQOaAAdxWSgm5Bfo2somcrA5WOUtzVa4BGUsInTmQtn5NrLivw6w
	QMZbGX6p+DuqZxOtOQ0XdeJLSlk/cKC2xZOojkZMvKMBihmMG/vCFnQvZqxiD3bt
	YobFQ0qvkqMddb2cykgo8ZnxoPFJcxI7UCITEd2EdFT2Kez0avO0yX7du2gDRurf
	uUCPRVUNrIHUq7ZddeHJCIL80zQP48STnmRoG9pl32GMEo+3rEDZcrv1qS/bOajV
	9a/bCKIouG6/JLOeu/HsJvYpmvfYpXLkMUA5o/aJrdd+l2dSdtg6mK108Lu5jj7n
	ekeVug==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05bfawq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 15:24:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c7ef28ce24so3497455ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 08:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782314669; x=1782919469; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hjwRC0IlwgSgiL2c9VHAX/AhDHtnXxRe7151xT3/ODw=;
        b=aEB/TlsPdhPPsAH2yUCcI/I8DoOL/BQT31h32bYTMop/ikgpbG71IApi+VrSC+QyQd
         1Mci5JlvIx2/OBbfAHsyn08RlbF4juuYh+toY7mW1gtvhFofuz1kR1jXEzE5YRuv11n7
         mCNYmuHaX6BzuvMApxAjRSsVSaex2abljFX3MLP3cZ+I5xfZO80fEOeMKLNNcKBDe9Wq
         vq9OjiGBqPbL7SATBDZo6cCQW3XoUsZ5LmH3dI5q48uoTrpv4OT23rToZIBDSDH2KaTM
         c4X6CoQ1f+o5bh0gSKRB2TtuwAt1pikyGzEZyaNeAWUv4HVDfXou4bBwKrAwF5QpF/2E
         i3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782314669; x=1782919469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hjwRC0IlwgSgiL2c9VHAX/AhDHtnXxRe7151xT3/ODw=;
        b=UAMsIjwsykjDljsuJ0N3uUVOoy5oHY98AkezZKtSmnnLSmUlbHICoRCaI9IBRFXW+Q
         3JbOc/LmzKmUATmtSPYKya2ABlOCu/9cmvqLK35Pkxfm4JrqJu8U0csF8zxyX3HjL4ui
         ZXQqFi6fIEz/OX9p7Pvcep9bUSar4h+8QUMLcWeTvR/5epf1aXWxjXK6tTV8jOAG5BjR
         +CQGWi8tYDO8OeBqaxjKCEWXxwFKSIPglMBlMjQg2h8mVtI6m61ZrwJgjgKTqW1rJ0Yc
         44joJHzfO1u92Uu2NXlmBAWhrHPHpX399KgajbFQo3RJXAmnFtRzzsRS5EeCne/Lz6xe
         HR2Q==
X-Forwarded-Encrypted: i=1; AHgh+RpdKpiDSFCC3MMeEKFw/2+yzKQ9B14VFDGlUrll3YHHNdT4EtlD6DGUUJPDxLwGY8B3EfGLQsbrQT11y0Xd@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5LWP0SE77trFauOsXC2CiOYt0GnnbLCXDwjjR/TQ+66ujs+Tc
	UB3B4jCvV+SsDWkeWE91ltJ++oPzddBhz0KDPP5goviwNCKgcHpPTDUa+N66BB6FMRLkytsPFol
	Q2B0PMudgUFWaPCYW7HU4F0O+7Ni3jDpb2KScPQ08caq+PezuRX1neQl/4iKE/8idcrfX
X-Gm-Gg: AfdE7cl683RkvISrMgnvL8OPuoeROsSbN1S8iyKfUIvS27Dw8RA2b8XrEUqO8qEoezo
	9ME8xZC1jpKYyOtC9HMv1N20gY2JRAwumJg4SJf+5qQLdNZAlq2AEXOU09wTgbqkiecLjoxpDtm
	6cXiTwa8JybhhYa8J5bA+CT7qLO35wcKAlCcUVe4uJdHBczTBwdbxp0mQpEFexyjBgoY9sZGV+p
	qM7DB7HwmrPCatRmVK5lKGv5nCQY+Ck+A8AGedD550QmdC/JrjLkH5FkjR4vOeJuPQJc96U/BO3
	NDzMmy6Ads41SSVKQREbUN0ZDtbOIBx6LtlIVj1Mc7RrQkoEd+6Fz9CNI+ws1d3/IBq2teuIb1H
	Juiv6JgI0Lr4W6h/92S3S7XJwCjjBGG6KSJC0dIATMuAG
X-Received: by 2002:a17:902:f68f:b0:2c0:c3ac:4ae6 with SMTP id d9443c01a7336-2c7c769409amr78275075ad.19.1782314669400;
        Wed, 24 Jun 2026 08:24:29 -0700 (PDT)
X-Received: by 2002:a17:902:f68f:b0:2c0:c3ac:4ae6 with SMTP id d9443c01a7336-2c7c769409amr78274685ad.19.1782314668780;
        Wed, 24 Jun 2026 08:24:28 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ac9285sm774625ad.11.2026.06.24.08.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 08:24:28 -0700 (PDT)
Message-ID: <8e49dffc-f525-494b-9489-8451aea6c7dd@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 20:54:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/16] media: iris: add Gen2 firmware support on the
 Agatti platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-14-583b42770b6a@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-14-583b42770b6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X8Bi7mTe c=1 sm=1 tr=0 ts=6a3bf6ae cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=PGH3J_xsYvR7KH8m7zgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: lMJ3FVtDqookFwz6pFGDl_6Y10WqdyYq
X-Proofpoint-ORIG-GUID: lMJ3FVtDqookFwz6pFGDl_6Y10WqdyYq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDEyOSBTYWx0ZWRfXzi1/TGfJpzbp
 ECLdrEzIAUgCf570fLMDscJR7zPGsQbtqL48QnfydHvrLz1hWXScEVf4tHzCP8U+GCPNL60P5vt
 88uqCw/lTfdCZlXAIsOzSfJvhm+qHIw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDEyOSBTYWx0ZWRfXxFygtM+hXpKm
 7Ji72ETELZyVY7xV/dqDlQrKhCEtzmqaHorKSfHhXFIAOI+zYaYt5XtO9lXwG7r6X5iy7GBQflN
 JRhYDLqilBL7dBh5ENno7nY8a9IwAgOtolq5gr433goyOjLVT8WlKo5grpDMvgKi9oF1Iw4mzDY
 Y0lnmHF+WcvhOoPxq+kjFhr3nHGq1AUOS5eHeI8CHN57LWLJ/dWLSslrOTezQ7G5yLE+1lPz8dx
 yVuvDL/ZiG0WUL8kTo1VaYmByqJ4UJIeRJdwJDGeHTZaLKM6MSKdZe6tChJ7uUsssPplfn+lbjl
 0NSrjQe4JasWmfVu+3VSQ/wQi6JgxuiSFHgy1dIvGpd/5AP4MjkszUoXBRh9oiUtK74CIyfMVIt
 EZy9oVi1hnYDHTjIFsLIVlO8NXfCcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114371-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C6A16BFA97


On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> 
> Agatti platform is using HFI Gen1 firmware, which is considered to be
> legacy firmware branch. Follow the example of the SC7280 platform and
> extend the driver with supporting both HFI Gen1 and Gen2 firmwares for
> this platform. Like HFI Gen1 this firmware doesn't have PIPE property
> (but unlike Gen1 buffer sizes are calculated on the driver side).
> 
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 613 +++++++++++++++++++++
>   .../platform/qcom/iris/iris_platform_common.h      |   1 +
>   .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  |  11 +-
>   3 files changed, 623 insertions(+), 2 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

