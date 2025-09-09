Return-Path: <linux-arm-msm+bounces-72800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F9BB4FF3D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 16:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2224C1BC2F74
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 14:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28231341655;
	Tue,  9 Sep 2025 14:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YbFniPHI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E1C31B82D
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 14:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757427788; cv=none; b=j80eXYqfS3Q7y+uGiNNDjAkpfoK4i6ggIwFE3d/aU8ZaiXHsRTlaK67OF2p+DU/DYIB+H27D95wfP8jYEaHgfkh8MAD0oAv1EyL6uLbbAZYKpqi5tQhkz1PYUlbpmy7VCIWn2Da7RZsCPZWGTD7d6eBEO7Xj4sv9WVnkW5TsfzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757427788; c=relaxed/simple;
	bh=mKWsNQPoATLy+KepXv37LhfBwPbT7GZrQkYC3ZjqgpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D/Lv1zHNvKWwSm4S6149d1Z8/rCAlSKh0OlMdoihNu7W7sCIyiGPuaNHE9OTPQlP7upqxoTc2dUVAF4rsH7w1dMLupUYpeb7JS2sx03rQ22+RTi00L2mp0Fikuv/zQJM55NxV64WnwVKD8X1W3KItfA8nr8Cb1WgYyHzUecbipA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YbFniPHI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LSqF029173
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 14:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h2X4u/C0hT0ZnsZtZ5WLCYHT
	XPjaXvBzP3cbcDi/Cho=; b=YbFniPHIo9davfYh/UqJaVAPE3OtZ3Tmf1oVQHjl
	8XHy2m84sdYjmVEqBiN+4A/chC1w40DaU3jMIxVZAjmpEfoUCX1xEAB6k1kLq7Qa
	R3eLZB8jCXjDcaoGWeWHY4imbBdWc6a+bXjX3LtiWsMZvdjOVIo0t4DfZrVGqg8Y
	SiWlU928L5tuqx+8zu7MA9kmOeRTZ86zSG/yZLz+hBsoAKKDeTeVgizt4XnIkqT8
	eabIomDAS8PW64huugCjt0r//isipB0vOvPQO6AzdZshMnD1OrT5X0qtfOTwWfwX
	IHu2D0qeD4f59RMScc+eY0UD2+9d2/Vwo5/W0oaGsyu/0Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8ggqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 14:23:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-720408622e2so120050186d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 07:23:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757427784; x=1758032584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2X4u/C0hT0ZnsZtZ5WLCYHTXPjaXvBzP3cbcDi/Cho=;
        b=Euu5uSYz+L1V8kEMkoOSGWd+jedpk1vfIXFHwzlpxNbRvJj8D8nMxCbvR2DeHVBrJn
         p9zUB8eVA6hHK7ffBhmZrejmeOYKlqY5O0uVIu8MNN9r+Uyc8NCW6eGW2qwuEw581Q0D
         LD9V4k76WfpG56lx94OPDuRkP8DdxEdqJ8lqO4t3Uvkgi/BMITum7vx5Qz/8ziRJG/YH
         5+JM3UIho4lHfQpohE99Fl6guhDiloUwB+I0UE9I3pTEFECgbDeUbKotQu9lodC+/Axf
         7aO5h12Uxxfc+6a3shefI8lSIQtJhIg5pala9f4oR+IdFg0BNbbvw/bjrElTpdln+DTy
         nV+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX20PUvNLeuKqudp2PMaqbsTNVfxli6ZibK1tHzNnfjWvJZzqtqbCl1guElqDGpr5K0B/H3jVKCR+VBHWgg@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg3qn3FjCiMxLULLoi6VT2O4zDA9FsS/PHHqMwQtnpsngCo0ui
	zX8kmBp48eAYZWUcM766BEF5Wm/sLU5A9orrpTjtpLQF1NR4XjrPgAa2OR/exJYBgdJh8NzOSRv
	EwIIgG1pcbBCLix6MMgDZxCmIVoOU4w1D2dCz8skN09SMNipQ/vLpbKlbGXNBPTcR+f2+
X-Gm-Gg: ASbGnctaJlWd6A1OnbYy3yEEDXmeSgkKmBjKbrvi7h2WpZCu7celS+17Pc4oyl9bl2Y
	xRulE7td4MqGbOzyq1/85GSSIX5vtUxk6QvhRtnrqS9KxpLbKfPOWPKq421uw7WjBlgKPHup3m4
	egY4o0OSyIvFK/n7ZxFCEEwIImf9a4ot9vqJhxyfuboJARw5lsBLvfCpQpJjZQutNnywo9jgibe
	zFCacqGaV8spi7CNVuPEejkN0S208FD2HmcP1PRme853N3+vB69b1/CGEDfrgeH2iNwtaSFwywq
	zPRcZduqR3s4mnyfdarAeRCTSfOIe9a4Wdd2mWNH9FU/MH8a5Vtg/zDZbMWnbIqQ3ThsJIZJZlf
	p0+P9Inq/yMVd0xt/tVuqbyV75ORnVYlarBDWES4EMGFDrLm87xbA
X-Received: by 2002:a05:6214:f63:b0:70e:d82:703c with SMTP id 6a1803df08f44-73941de3724mr124936856d6.49.1757427783997;
        Tue, 09 Sep 2025 07:23:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+8if6eNbTpzHKsyNkm+8kJ+WHyQl9Ap4iWvgtn+1Z4Nqh0b/WPPZlhr5A1An/PL5BbFnfIA==
X-Received: by 2002:a05:6214:f63:b0:70e:d82:703c with SMTP id 6a1803df08f44-73941de3724mr124936256d6.49.1757427783207;
        Tue, 09 Sep 2025 07:23:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c934besm39228031fa.24.2025.09.09.07.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:23:01 -0700 (PDT)
Date: Tue, 9 Sep 2025 17:23:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] drm/msm/dsi/phy: Fix reading zero as PLL rates when
 unprepared
Message-ID: <xkzlobhynrw3ylelnzwh7u5chigtytizy6vyc7gp4un5du4lcb@nssqq3f5pv7s>
References: <20250908094950.72877-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908094950.72877-2-krzysztof.kozlowski@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX/oMoZ7HilWpL
 4dgEdBDEI4dwuHe7CaQSGbeyU19ELDk1Kggl2JLjpj/MWQlUqO3oODxzNkTpVss51lbef3PcTGe
 3g2f9KBHG9dDnCafPmTF/rUus2fZrZcTgDvKb1ajO3s7jvQUML3FNemZMrPXBm8nXDLQOSscBrn
 Bqr2AJw/ImhIDMmEeKwav0ugSYKWYstv96wb4iV/A+GgRIB0rKcyS2coec/xdAbJs9bNOHvuxw5
 DgFS5HPeqRghp2mt7hcoOazKPmuWfSCrw4A5xbAqAPUS5dlE5ocGpWy2LStni9WpfapHZ7lw6nn
 CwHPYW7CCVTs1xWUiBQ8ms6UJxVrAvaQNIXbzbn17nXcw0CvfNQlNHH3OETIsi6kJ6eG+qSz78x
 2Th/yFji
X-Proofpoint-ORIG-GUID: 5SSvhQeDcMW2C_FECRnvoh8-PiKHEip3
X-Proofpoint-GUID: 5SSvhQeDcMW2C_FECRnvoh8-PiKHEip3
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c03849 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=p65op6kECmbMoyNqUPAA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

On Mon, Sep 08, 2025 at 11:49:51AM +0200, Krzysztof Kozlowski wrote:
> Hardware Programming Guide for DSI PHY says that PLL_SHUTDOWNB and
> DIGTOP_PWRDN_B have to be asserted for any PLL register access.
> Whenever dsi_pll_7nm_vco_recalc_rate() or dsi_pll_7nm_vco_set_rate()
> were called on unprepared PLL, driver read values of zero leading to all
> sort of further troubles, like failing to set pixel and byte clock
> rates.
> 
> Asserting the PLL shutdown bit is done by dsi_pll_enable_pll_bias() (and
> corresponding dsi_pll_disable_pll_bias()) which are called through the
> code, including from PLL .prepare() and .unprepare() callbacks.
> 
> The .set_rate() and .recalc_rate() can be called almost anytime from
> external users including times when PLL is or is not prepared, thus
> driver should not interfere with the prepare status.
> 
> Implement simple reference counting for the PLL bias, so
> set_rate/recalc_rate will not change the status of prepared PLL.
> 
> Issue of reading 0 in .recalc_rate() did not show up on existing
> devices, but only after re-ordering the code for SM8750.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Continuing changelog from "drm/msm: Add support for SM8750" where this
> was part of.
> 
> Changes in v7:
> - Rebase
> - I did not remove ndelay(250) as discussed with Dmitry, because:
>   1. Indeed the HPG does not mention any delay needed, unlike PHY 10 nm.
>   2. However downstream source code for PHY 3+4+5 nm has exactly these
>      delays. This could be copy-paste or could be intentional workaround
>      for some issue about which I have no clue. Timings are tricky and
>      I don't think I should be introducing changes without actually
>      knowing them.
> - Add Rb tags
> - Link to v6: https://lore.kernel.org/r/20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org
> 
> Changes in v6:
> 1. Print error on pll bias enable/disable imbalance refcnt
> 
> Changes in v5:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 53 +++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

