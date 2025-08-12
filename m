Return-Path: <linux-arm-msm+bounces-68643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DB5B21CAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 07:06:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A869C6201A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 05:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C86296BB5;
	Tue, 12 Aug 2025 05:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dT4ntOO7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10FD254B19
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754975140; cv=none; b=jRo6HDkrVGCCtenwSC+M8HcvhNqr98i8R2pYbakawAWyPtta9lF+J7Zec93ZS9tobHuIBUtwn5xpIhM3c7h4Ct+9h1GFdDGi5/eOrT4fLPEP0+X8q3QhWLS9VosOt0hv5KD+Naioo2J+6AH5E2Ah7RfHNN+2A0dHP2vw02cOiUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754975140; c=relaxed/simple;
	bh=QI1HnyqqGXFzazfF0kLLFQgBtZu2qOy6Z70INXj0J/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OMFK0CcfBttRs+ZASSid/jgTXk0xp54802rZz+GiWiZjGH9Xy3DXKtyTzHy1ZUr2ptoO9B3ejzJ+6CKYG7cJ4J4HxWsTTuOKEUcTMiHx3Qbh/3/RqycXpCrndOBlTITCVNzM6ra7hhY1zpQR2yQuiWAvoYEcnQWTWBMKzdpuIqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dT4ntOO7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BHLvFh029232
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HyY1Y88Y0ORrgrBRfShLFFoDdBhRhqgMxdPtmHpsxLc=; b=dT4ntOO7AgEts2E4
	YibCqph0yiqXySfAbVfDMQyXjy8BzyR0G06yFNASqSGrokOQilF+Uach7JjgXh3F
	BAsFNKTXBqZLuhRrsikgqfA6lttMGBV6MHgiXUu7KILbfx/RNtRBYavp8X20n+Jr
	TRQBATkc445DLOL5J3Jm4DezeGYPw936RsOQstg0Rrg//ySTQKU8lqu8HhqEpaOg
	dFZpz4k7WcWCNvE+EPY6mdo1XgImRhwMJcoL/tisXbd+48fRs2eWgEtxKspEU/84
	VRJ2g4XSd6pWr3xVX3D70cNzmNyK4kiIrfLvjXNgC0HxiNUUczlDow/9VvzxoF+R
	3p80NA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygmesym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:05:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2405fdb7c15so70645235ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 22:05:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754975136; x=1755579936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HyY1Y88Y0ORrgrBRfShLFFoDdBhRhqgMxdPtmHpsxLc=;
        b=Q92CgeDoXNKozQH3Ma0Qn0IdDmEm+iXtbWekq9EzPDt/Wo0lImeIF1oBJFqJgUzOcD
         zx0xppvR21KSSFwQGL7lKCUt5JdsbF2WUdDZxF1TOyXmAq6dBgmiouEMdSqAZSKOOg5y
         +H5SLLctwFt3U1QCmPTWWYhOU2eq3Iqy5qe7yh8d5SdjZXt15GPqKY/GtUsKwoAVowhq
         NF0bGqH/m/97woxeRgHCqA1FMZ7dyiOGGomRhkQy3r0hfgLtOZyBFqA4A/Hlf5azHbId
         TKoua9Dgn1Oz7lajAuDBbCZCTskReUGhQLMDMboWsN4ZBXKsTMGsDMlhxzVRWmVcVjV5
         /lTQ==
X-Gm-Message-State: AOJu0YxiVTuBoiYNi915vkDaapnTQEuqKSz7hb57msxaIHTYidgRNgYr
	kHV7ZKK+xKhAQ+OxWgbdzEkYWUMsorMXUCyZSAa74fMYwC/9T+gKsG832q4V4CcEoC5+veF4Mc0
	Ptv5WmxbnOmOV5Es+DH2g2s+GUl8s6NMTTWZ7B/Lhs0Ua764KWphV+/uPtgFJGHuLYKLj
X-Gm-Gg: ASbGncvmPiTpm6b1c2QneSnbJJPtcd16odG/aAcOFY0xUbUC12TVdiSoAQHB+hYag2M
	zIWdq30hZYep4DI6D5C/uWyflUYelI65QyouogsJ+ZkaHBsDUtu1/jXv9v7Y03Lq1AAxGwRVpSh
	kzl2UrnvoFANNnBFT4z2ptkz69KJC1/L6gkAMvTXfrlfODQKP81sq1eHs+ll6nxJV7KOeNmZF6M
	XMxr98GLkjdJMo+QVj7m6OI8A0KCRWDAgOnjAXGGhPgL/+0zcjarwsW0lLN1eFx2KtTwokQC5/r
	WOS7aYNJblkUhroplIInnJZZqi8uOlk6osNN9AvMX8K86PjOeA/LeD/lr/PkPCNEMXWS
X-Received: by 2002:a17:902:f68c:b0:240:900b:7550 with SMTP id d9443c01a7336-242fc21006fmr28005305ad.5.1754975136429;
        Mon, 11 Aug 2025 22:05:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFp8q7iEcoE6icwUvjRib+HG6J9UgPT0yWBcxWWwYRBGOzentck67PNXD0Zcb1/vkf9fjph/A==
X-Received: by 2002:a17:902:f68c:b0:240:900b:7550 with SMTP id d9443c01a7336-242fc21006fmr28005135ad.5.1754975136011;
        Mon, 11 Aug 2025 22:05:36 -0700 (PDT)
Received: from [10.217.217.159] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24304c2943asm373085ad.30.2025.08.11.22.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 22:05:35 -0700 (PDT)
Message-ID: <ed0341b3-4056-4826-bec7-e835a6da4fad@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 10:35:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: dispcc-sc7280: Add dispcc resets
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250811-sc7280-mdss-reset-v1-0-83ceff1d48de@oss.qualcomm.com>
 <20250811-sc7280-mdss-reset-v1-2-83ceff1d48de@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20250811-sc7280-mdss-reset-v1-2-83ceff1d48de@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfX2J7VAoUgGZ46
 S+Rim+i+bpeC3OL21LsPXrp6aWe4RyiIKirzCp7pUp6soYlSUXic9CIeYR2wUZL95vJG0XcLNYE
 ZGe8tzWvusp2AHZtTV3E/wA8yDPKFEYlCnhtIxTXGN0JQXg+UNOMNAPKOrOasSrKaQk9Lh/PYw4
 MVeVFxvg4eTXLXnQcHfd1T+HljHeu3vACtrrK2t/bTCyNxVIeClcfB3EWXv55aBhHIqoLXCUbor
 qaUL8+Oz0XHKx0gvwjQoY9DAgAv/vvEDXJYpsgq2E1dhsZDUao/4XxKxSMbrUeLe9P7Ng927tH9
 Iq4Z8LF1xh1mJaGaFKx7QAXWOviI5T9U6iQY3Vu9IL+sbHBoZhJKC/DN0uUqBHMhPA/lmJXe8dD
 qe3bZ6pX
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=689acba1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=NNVWRqRCdYL-THHIErAA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: VbzWA5pqXrE4NrZt8PUQMhsPelUwf5Hx
X-Proofpoint-ORIG-GUID: VbzWA5pqXrE4NrZt8PUQMhsPelUwf5Hx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035



On 8/12/2025 8:41 AM, Bjorn Andersson wrote:
> Like many other platforms the sc7280 display clock controller provides
> a couple of resets for the display subsystem. In particular the
> MDSS_CORE_BCR is useful to reset the display subsystem to a known state
> during boot, so add these.
> 

In this issue I believe the requirement is to have a clean sheet and
restart the MDSS explicitly. Historically MDSS never required a BCR reset.

> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-sc7280.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/clk/qcom/dispcc-sc7280.c b/drivers/clk/qcom/dispcc-sc7280.c
> index 8bdf57734a3d47fdf8bd2053640d8ef462677556..465dc06c87128182348a4e0ea384af779647bd84 100644
> --- a/drivers/clk/qcom/dispcc-sc7280.c
> +++ b/drivers/clk/qcom/dispcc-sc7280.c
> @@ -17,6 +17,7 @@
>  #include "clk-regmap-divider.h"
>  #include "common.h"
>  #include "gdsc.h"
> +#include "reset.h"
>  
>  enum {
>  	P_BI_TCXO,
> @@ -847,6 +848,11 @@ static struct gdsc *disp_cc_sc7280_gdscs[] = {
>  	[DISP_CC_MDSS_CORE_GDSC] = &disp_cc_mdss_core_gdsc,
>  };
>  
> +static const struct qcom_reset_map disp_cc_sc7280_resets[] = {
> +	[DISP_CC_MDSS_CORE_BCR] = { 0x1000 },
> +	[DISP_CC_MDSS_RSCC_BCR] = { 0x2000 },
> +};
> +
>  static const struct regmap_config disp_cc_sc7280_regmap_config = {
>  	.reg_bits = 32,
>  	.reg_stride = 4,
> @@ -861,6 +867,8 @@ static const struct qcom_cc_desc disp_cc_sc7280_desc = {
>  	.num_clks = ARRAY_SIZE(disp_cc_sc7280_clocks),
>  	.gdscs = disp_cc_sc7280_gdscs,
>  	.num_gdscs = ARRAY_SIZE(disp_cc_sc7280_gdscs),
> +	.resets = disp_cc_sc7280_resets,
> +	.num_resets = ARRAY_SIZE(disp_cc_sc7280_resets),
>  };
>  
>  static const struct of_device_id disp_cc_sc7280_match_table[] = {
> 

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


