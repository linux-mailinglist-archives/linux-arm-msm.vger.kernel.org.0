Return-Path: <linux-arm-msm+bounces-87934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3837FCFF9AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 20:00:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 288AF3002D1D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 19:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8CEB3A782E;
	Wed,  7 Jan 2026 16:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="esLRBjqq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jYS45blW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D700F3A640D
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 16:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767803221; cv=none; b=LGVim6BlKO5zi1jrF1aKDKZBgmin8Maw2i8AGoz8gI2NhUbxvZULRLe4GNTK90fujFCi5Ut0tSHnN183ZFcCun1/vPxB4gihbd/TOQB0Zd2QHsV+VtqoY8M955WKSxPEIHtYMLzFMVIQsM/y9b1r6HP4mjJx09ayM6Vktcqg00c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767803221; c=relaxed/simple;
	bh=ocjlV2HNIOFaE2jQ+fliyYjPnubqT/6CSs4aX2Mnn8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tzlCotuR0D+Vrh4LPLCYik7NYoJb/zdrRmpkiuYaCz1iB0f4D5mY+AcMvIsG/zy2716OvJ7xTccAZ+NLEJ6lmYIr36d02XPfFaG9NYgms8TdgxL7JnXBjNglrGjuLvBV752EtHP9AE3nEVN0lH5leWep2jxXT56YSZnDN0BK9RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=esLRBjqq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jYS45blW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607GAT2f2578098
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 16:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d5wxY3w6nk1EMOzJrQAcU/6BJWx1PGSRo+JS7Wyl/dA=; b=esLRBjqqLnzL1eWg
	btTcXwq6QWcEVWyXOuxTHoX6LNhhS5pZeIM/n3RKsSCnnmE6syAb9UNvN1EiKz5W
	5GAb29vWcPaGoMJ3xOAjFh3aVITPxIRlrEdjeix3HgIb754PGnY4+3/2KiTi5XR7
	+y+QG9EHAWI6xlPUWQ04Nyob7yE5Irt608LxWsSJFwKfdrsprL49m7sQgp6R5hQo
	/RpgVL4Ci2GEgzU7vVDC3owtCvqT+1ssM4wO+85VqWnudolMfWl0aj5MPw6LC+DS
	qQeI7K93AJSQ+5uYdqm3ns4WURb/f9OYq483Hlr5IoWNgrHFPiTB26cvh1RlnUvB
	cyAb0g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhm659eyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 16:26:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0d59f0198so25822425ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 08:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767803209; x=1768408009; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d5wxY3w6nk1EMOzJrQAcU/6BJWx1PGSRo+JS7Wyl/dA=;
        b=jYS45blWJHn+5/s2iqs/E7x5FRg/8aIPtR5/3JkDNyzuVmXzU6FVTwp3Wzo6o4ss1u
         72JbMN/zKbrhOg7gjXEZ+TPwPv8i5NzB3Pc9o39fEl8s3gkuEUb+O+mfHCzAth5iULgV
         Iss8ED0Bz+rZaCBReJb1vsnP/sb0UxaIkbIZ60wcctN9vBmfwfLku13qjDXDH01j2HOs
         wk8MPqtXCqd8NQtYPB+sqoW+YLzK9V2W3TGi++bBk1BhuAxvrrN+nFD4zdcq8sh6+6Eb
         ua8P51UmHeSf/jfO3CyW9S2Cfjct/62aNo6C6tyVRier+StQOWCHZJwDIjnktvSckVck
         u31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803209; x=1768408009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d5wxY3w6nk1EMOzJrQAcU/6BJWx1PGSRo+JS7Wyl/dA=;
        b=vzdOdsfUQ/JuzsFSnE6rEvdtKILHWfKDkMDgveL0XActk3Bs/PePEimcwVl5fTg6qT
         Au/+3BVk8ZxQGieUtSNkYmhkKlH8d963gOCT4ITO/2GtP8xtVXu/a1yIhn8JK8P4FmLM
         1lqwyYqetHNCcc/1SzacKTnzRCx+finiKhTdu6E9ECMaLvuyxOOXQTfkcl7n79VSrIoo
         v2C3yFTIfRliJZ2BAdYuTOyFeyPlQ3/Gki1xSpToGZMG9u3S6O3Bfuuy0n1KUQ2l1peD
         hXbMmVEjcRhHgEsyTqNO0AXFfKCOpE/L3vKN+kDyI/f/0rC+f3AF0dIX45j3d3LmLTmc
         BVIA==
X-Gm-Message-State: AOJu0Ywl9Yp26sv913q33z/UoUBn9LGOsUVn+EnqyBgffCQr8lmEnnIc
	bi+NoUal4h6cOwCGxzE+bLMiwOCywBQKAUMBPCE1R34z3pNg7Qf2bbvzpuEQLWhsfTu0DdzoVqJ
	8Tu3nbma/1QaMYfkYuXeCwMHlEOnxVZnrfRjrM3XeIzQZOGUeTxgfjCsftT24t4O3VSnx
X-Gm-Gg: AY/fxX4exQ8E2VNZBCI2AAmrGfySL+j5ngIMsAsqDdubYrV6KhuLAboPdXGRe1pW5dI
	hGDnpUQUsudoXgkFVpQhFo1n9Z3YA88eWPanCbws3NFmxHzxE0hbMFUEDXSumjmO6OHSomufV1I
	LBCx2X/hJk7CJklW4Ivrvmv/068h40519ZweXphpGcJrOlcYUOdGAZKYIjtDz0EFSrNes0ihqsK
	jtB/PKJrW/2gF0sV1k1rh29zXS9/LSgYD5ExwkwAj56yZqUYEa8bXWeSPE0SaQVKC9OqN8T5/ty
	EcKZCnQ8pqVVDVIUTTnK323QjTsxocAEihwn8HORif/B9IFXcvjrxZjl19nQumV3kvp+sxA9K3z
	ljYKs5ZtqViAs3tdfSvA1yuDYe6Tt4Fv58pTSDQ==
X-Received: by 2002:a17:903:b07:b0:295:b46f:a6c2 with SMTP id d9443c01a7336-2a3ee4aaebamr26013565ad.37.1767803208644;
        Wed, 07 Jan 2026 08:26:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhDyZ20m0wTcSTXbF6lfqRcelUkGiEtoEtFdPGDtyUaLrGrVdvkZP+XFYxhXeMEZoWEcVI0Q==
X-Received: by 2002:a17:903:b07:b0:295:b46f:a6c2 with SMTP id d9443c01a7336-2a3ee4aaebamr26013275ad.37.1767803208116;
        Wed, 07 Jan 2026 08:26:48 -0800 (PST)
Received: from [192.168.0.195] ([49.204.25.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2df6sm55741685ad.61.2026.01.07.08.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 08:26:47 -0800 (PST)
Message-ID: <fff70f1c-3c5c-4e50-b0b5-c3eb10f67cdd@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 21:56:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: dispcc-sdm845: Enable parents for pixel
 clocks
To: petr.hodina@protonmail.com,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, David Heidelberg <david@ixit.cz>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260107-stability-discussion-v2-1-ef7717b435ff@protonmail.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260107-stability-discussion-v2-1-ef7717b435ff@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XpL3+FF9 c=1 sm=1 tr=0 ts=695e8949 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=9zcPrCpDFr6Yft4RwatP3w==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=sfOm8-O8AAAA:8
 a=fry8jdqtyFT-MZpSCxoA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: DrUN4dzCarok_u17T61TKEnOyT4miBZJ
X-Proofpoint-GUID: DrUN4dzCarok_u17T61TKEnOyT4miBZJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEyOSBTYWx0ZWRfXyKHZ1AvlWg0j
 hjbhUN/s+vKnyYmWrKv/Tl0OMYyFqn+cfkz/v22P4P+OElRvLNTiu8mmvwSsCGrEGMQt2E0vrqb
 Hs8wB+DqbppuoQGAM7LkPU4f0D3TEY45TDRfD57qQe9xaSn+eb0r3FkYnEOCpSL2x8Ud8RCX+/0
 sQHJTpAl4mhB0GzBxK4Ul+yVhWfgdfeeCQCxUguAEnfaCyt4GsYX/PyvQA+cGH5mi39eNEtToOo
 aOP1FNFG/SS7hx43eDEzge7CMbaleA3kokgLqxJ7UEYCHlbHfiCTwh84WNkfj1y6oC6erk4Dz3G
 dq7ioPr2AjHnuLOD+PjoB7592ns/J5gQH6aFza96+0L75vuUuRS4WgxJwLiqGtrp/M3AKLjqaT5
 KDk2e0VNnoL1m3AVSE7Deedy2/qT9q8CtVsSmN4ZhiYi3sr5OXHfoXBdvuif8go/MozOxQ1CQPz
 vDF4HUWxC7/oNnXUu1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070129



On 1/7/2026 5:14 PM, Petr Hodina via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Add CLK_OPS_PARENT_ENABLE to MDSS pixel clock sources to ensure parent
> clocks are enabled during clock operations, preventing potential
> stability issues during display configuration.
> 
> Fixes: 81351776c9fb ("clk: qcom: Add display clock controller driver for SDM845")
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> ---
> We are currently running the latest linux-next snapshots (next-202511*
> and next-202512*) and have encountered random freezes and crashes on the
> Pixel 3, as well as crash dumps on the OnePlus 6 and 6T.
> 

Are there any changes between next-202511* and next-202512* on the
display PLL side which is causing a side effect on the pixel clock(pclk)?

> This commit fixes the stability issue. I've checked other SDM dispcc
> files and they also contain this configuration.
> 
> For safety I also set the configuration for `disp_cc_mdss_pclk1_clk_src`
> though it should be sufficient only for `disp_cc_mdss_pclk0_clk_src`.
> 
> Kind regards,
> Petr
> ---
> Changes in v2:
> - Remove commits from v1 and introduce proper fix.
> - Link to v1: https://lore.kernel.org/r/20251213-stability-discussion-v1-0-b25df8453526@ixit.cz
> ---
>  drivers/clk/qcom/dispcc-sdm845.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
> index 2f9e9665d7e9..78e43f6d7502 100644
> --- a/drivers/clk/qcom/dispcc-sdm845.c
> +++ b/drivers/clk/qcom/dispcc-sdm845.c
> @@ -280,7 +280,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
>  		.name = "disp_cc_mdss_pclk0_clk_src",
>  		.parent_data = disp_cc_parent_data_4,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_pixel_ops,
>  	},
>  };
> @@ -295,7 +295,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk1_clk_src = {
>  		.name = "disp_cc_mdss_pclk1_clk_src",
>  		.parent_data = disp_cc_parent_data_4,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_pixel_ops,
>  	},
>  };
> 
> ---
> base-commit: f96074c6d01d8a5e9e2fccd0bba5f2ed654c1f2d
> change-id: 20251212-stability-discussion-d16f6ac51209
> 
> Best regards,

-- 
Thanks,
Taniya Das


