Return-Path: <linux-arm-msm+bounces-56597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5580BAA7C52
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 00:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD7D417AE2C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 22:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461C321B9D1;
	Fri,  2 May 2025 22:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o0rDGCIt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B381621ABC3
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 22:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746225739; cv=none; b=KZx0LLBeIHImKa+i5vFnpXGChTV118gw2/CpXKcPHBDfjJIf49zAnITCxIUXGulAK0YMZF610uN404gd4EzQdngR2YP30I0iJvZR6aP2tiQqniPm6L/tijarMMAXXf97B2FzphmJK/IN4/DoHRKIAj0+jqBLVZLH3/dkrHBcKCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746225739; c=relaxed/simple;
	bh=m9NYJKIZt8NO6Wjo6GBayzciQLJLCP9eJPM0uU4PPEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3XKwwQMfQ7BMZayftvoDhJukz50a2cp0MGfJ0OSHz+pm5sGXa7VbD/Glzv7OCOyfoYsQAWGbaNOXFXe4Kf5Ld3t+cVKe1gxcyZ0XfvbMsSe/LqXlUnOSuHl8ng5draDIstjY/85QWO/4SjEG+aulXpJ8C3NhHi9bjmoZb5367c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0rDGCIt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KB8dK002259
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 May 2025 22:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=crpVW1GAkulPAn2rCtcCM15V
	7zLdAQEB19gyDBO//vQ=; b=o0rDGCItaBuJ7oSVDCFdg+Hg9eJDavqd86Et3mUL
	NEbIfFpmrYI+3mFz55vQZNEkz7/WvKKKTPjB/GYN2YWAODLJSc5g2BZlTn7I21k3
	kEygjn7PvAlEGDhNWhMxAeFHfJypIFCeU+HbybGR5g7PiJZHgSwPo8Ak5nD/xaMw
	jJP5NZ0bnekRZuJxbroXlY8Ws5qloKKGkFPYZh3MQmi8V0bIZ8OY7ZG7mhw/FlEy
	Ba1u3Vss6MPQGrfnNYf6BKghMpLjkSLQFRp8D4JGX/dt7vYxa7tiI84mh7TZ5o9r
	5rUS/7I7e1O60upU0vXG1jxD9cLySD65dntDraPqB0PlnQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ubskd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 22:42:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4768f9fea35so64247681cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 15:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746225735; x=1746830535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=crpVW1GAkulPAn2rCtcCM15V7zLdAQEB19gyDBO//vQ=;
        b=CICCnQ9htOmYY1ICztrkXD3zzpJxG6emvZVn4PvwgyjYY26pcyDcrcl4BZbtEOr46A
         E2dn0AEiudeQr60pdQHnzhnQtYf/byyje9J4p1jsQB+ot6UzdtSRg7pERGsbNAqTAJs8
         eDqXPFp/qugjJaNtS/efI2knLQh/alGAxH8UDcN8K82xh8czLBr7bXolYsNohhlNIgxr
         95Esss/f5WEhKJ1RCrygbVd/Dc8mR7oE/xDrdDkhtSyXrz39USbsHK3bHmmye4NhzFsf
         2aflEe0GSSPTtgbnF4Hswkk0xiSjYUQNkiV1F877n5MOlsj3lhVMkRQ4DUA0rruX+6hT
         KRFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUryr//FaeU28K1ZkfXfB0R3o8t5o8hstn9F5X7L63iErIpX+W8ZeraYG7mNR6/coEGL71FM/hAUk3AFWf+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2y5UaOPKYXAJd0rmJGN/0NPu9xx4qkiE9Fr8w8dtxWvihA0SA
	pRD6EtgwxFnODOhFJPdW0lcwVMR5Xcn5H/YTcIzljhgthxj/vjMFxLmTPiI/sKgiYiql7QWxcWF
	1TDd+N4o09Ps8J9VWGx3xtxoGylTdoQhVd6SYTgVguT0LHsXlPoM6r2TLSL/15peV
X-Gm-Gg: ASbGnctCW31SRmWw5K7r2rQ4IoDPAM6v5kSml5J3T3drW5Lbx2lSRCRCNwsx8r9+jpP
	enQDnDZ+wjKQVdSX4euxgIetaOhifgWIltT4hy1McE4kCVxDb190oBsORQycFRlGhwkl8YaYs6P
	jJ9xqUYhXQQR3IN8mDU4H8u8m1akMj0OsKaNgL63ZSdB2ylpiPM+ZN5EfEQuz4bh02zdOhOTl/2
	68atkfzW8GXbH7KYwfikAwzhLtrWFpEh5um9kUfLi8K1uPwZ2+OBd4zHoLZRGigd5Oti90uXWtI
	bA88Qsn4ZbSpFCbaCzCcE42XAtWS0PzaOom2+9Bw4RFeRBrjoEb7yGt4tZDhf4uQvvr83p0p8+Q
	=
X-Received: by 2002:a05:622a:4a18:b0:47a:e70c:e1ac with SMTP id d75a77b69052e-48c30f6e31dmr57477321cf.9.1746225735441;
        Fri, 02 May 2025 15:42:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlIBZLX+XF9YXHrK8MhefSo38cVjTTSSX+WjsmilD5TLhYOiseMueK4E3PQfWe7nPXtR89dg==
X-Received: by 2002:a05:622a:4a18:b0:47a:e70c:e1ac with SMTP id d75a77b69052e-48c30f6e31dmr57476991cf.9.1746225735064;
        Fri, 02 May 2025 15:42:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f219dsm516000e87.206.2025.05.02.15.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 15:42:14 -0700 (PDT)
Date: Sat, 3 May 2025 01:42:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v5 06/24] clk: qcom: dispcc-sm8750: Fix setting rate byte
 and pixel clocks
Message-ID: <l6hwojjbk4e7eahoqcjprzululibhgrlpsv5zi7odicwx2wuvr@6difydf2mbz4>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-6-8cab30c3e4df@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-b4-sm8750-display-v5-6-8cab30c3e4df@linaro.org>
X-Proofpoint-GUID: CuSu-42uFPZkZB6mFThkR3u1lbeUq0Z7
X-Authority-Analysis: v=2.4 cv=bsxMBFai c=1 sm=1 tr=0 ts=68154a48 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=Fh2Cff8sOiI_5vdZZhwA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4NiBTYWx0ZWRfXxRm1S2Y2sIcL CcecFfXL6BjHDwDK9enF1Pl+tP2k7QKTYoHz9n1DdljCDgT83EhJX+juFC7QROqn8FStupfkN/2 Cw53pbUhNOLvmOqi/0RWFBgKx+PwpaeVqwh5xJJjpP7yQU5SvhC5HBG7loxNqT7Q6ZNeuR7nlG9
 /MJdiisbfWBIwNZgl/LPq3Dwna2NmGNdItXBWb0dktf4att+2frKhoyFwt/HS1JTL4zIRH0cKYd 070elgYpOdEnm/IO6Jk/gRWy4tYT+iVcNrEA/c+Xi2PyV1RMMxCzHJNWdqzu6qBx5X3iyn8g8eP RdsFTFQ74ti5TipEpAhSHm44NG4o+HH95MFmAvtTcQuPcH6THaMlra9X33GvMMRgFBlt/iPCYSk
 vqFsSiv1ZN3ZKNzNUrAlJMAjZ5xBB/9YhbLpnqV47AIZV2PKj3t/n0AlT1tzbt4r/McENt9j
X-Proofpoint-ORIG-GUID: CuSu-42uFPZkZB6mFThkR3u1lbeUq0Z7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=654
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020186

On Wed, Apr 30, 2025 at 03:00:36PM +0200, Krzysztof Kozlowski wrote:
> On SM8750 the setting rate of pixel and byte clocks, while the parent
> DSI PHY PLL, fails with:
> 
>   disp_cc_mdss_byte0_clk_src: rcg didn't update its configuration.
> 
> DSI PHY PLL has to be unprepared and its "PLL Power Down" bits in
> CMN_CTRL_0 asserted.
> 
> Mark these clocks with CLK_OPS_PARENT_ENABLE to ensure the parent is
> enabled during rate changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Patch is independent and can go via separate tree. Including here for
> complete picture of clock debugging issues.
> 
> Changes in v5:
> 1. New patch
> ---
>  drivers/clk/qcom/dispcc-sm8750.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
> index 877b40d50e6ff5501df16edcffb6cf3322c65977..d86f3def6dd06b6f6f7a25018a856dcc86fc48eb 100644
> --- a/drivers/clk/qcom/dispcc-sm8750.c
> +++ b/drivers/clk/qcom/dispcc-sm8750.c
> @@ -393,7 +393,7 @@ static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
>  		.name = "disp_cc_mdss_byte0_clk_src",
>  		.parent_data = disp_cc_parent_data_1,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_byte2_ops,
>  	},
>  };
> @@ -712,7 +712,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
>  		.name = "disp_cc_mdss_pclk0_clk_src",
>  		.parent_data = disp_cc_parent_data_1,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,

I assume that these flags should be set for DSI1 clocks too.

>  		.ops = &clk_pixel_ops,
>  	},
>  };
> 
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry

