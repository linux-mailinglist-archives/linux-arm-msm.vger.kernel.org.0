Return-Path: <linux-arm-msm+bounces-61227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A10AD8E9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 16:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C62CA3ADA54
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 14:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78012E7630;
	Fri, 13 Jun 2025 13:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7VQVCT8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BA01A254C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 13:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822952; cv=none; b=TnJsVRTZsacnUywFUX5BpeeL+R/MkiBfmBAZfuF9gvvmgHPUniSScqOKxm+ekYXZu75NXoBeV7KHTzdwp3F1GScfj2OT0KLs7ql7JdZSBoquQTOqmxmK4uwv7UYA0olucL/C78hu8UAlKzeaYzcbdyDW4fbaX70wKfm81cI7gMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822952; c=relaxed/simple;
	bh=KNXCXrF+j2T8I1ypanB+X6BsW/BqOwDMq8vqIoJvGxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cEyZoLgjz3xISA6tBEDzDzw9iVa88+U7D8n5RbrCi5S2XkxvzMxHQ5723//BCEd+aYIyzdUlNr6CikV1ghCgxHlEZ3j5xnWlPv/hjLDW4ky5Cluv1DOxp5JxljtfEY3I22DnD9xONOnLBiz2g1rzjrNm0q3IH9pZsILvVWvcIpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7VQVCT8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D8JBAL013543
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 13:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=09nQsxE00Mvx2k0TtRA846Ly
	yDMUTZCjP/kMqwwpmL0=; b=T7VQVCT8wCTyByd7oPuY2aZ8QDGtNKWsobOSnwgN
	iHLaXeqxFCr5Y/9OW5sZsjGOCER+LVAkeB+PLtw6IagFxKZAYz7BZ/8uyzC7b//i
	9oYTF+T3JJV7ur+a3AkbAj5twvDO+r3V8oxZ4eCW1IQKcX6cE5H+zKmlx93CJlrB
	FSc1xh0/xCGlnd5sMk0na1LTl8XxGApUqQxTt8PL9mRvDtMhAI9Wp44hz3XTNouG
	F/0ptRh6OeIikb1QjD57KsFVusuUvkn10RRCV5UINtJGcIPK74DK3w+0D6EoVQTS
	FSDPv5/R9UEwfsR5q5i5RXQVm8GfvMaf+kg2n0cDw+iSoA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476fmnk95y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 13:55:43 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fafc5092daso59577566d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 06:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749822942; x=1750427742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09nQsxE00Mvx2k0TtRA846LyyDMUTZCjP/kMqwwpmL0=;
        b=k59x0slIoeIsfy698OvFeUUcjeOAoa9JLcnsEb2KqdpvE4k1nmQ97f+59tsk1dVxKz
         nFp0tI5GuMmp7V28JuVkGI77SjdzsrkeEy+dR9olxTHIcRdljk5AtTRp90RWO91PRlgX
         aEhpTWpJ9wmAV7LwdaluLX8UFVqMNTfwSaWNHPSGmOekUyoLnggU+T1fIFRiDj5OS7GJ
         C4nZOP4g7MDU9co1pI0V87JpusEXJtEUyK1PyEo10BdQ7EYIcIVCeW6ncFKgCLNDFGj9
         XpQA4TvZgv3nc/Umn3mOX3lrajiNkdyK8wFMGBE0whdlKI3sxT408umjqSkTY7jjGICq
         HIfg==
X-Forwarded-Encrypted: i=1; AJvYcCUpURcPK5EWup+1d9VnOmgITpNWKaPU+Vo1jasH+mbbcqBs9w5m60sZiEla8haAf8aJ8HvVXRNIXzDvzHIL@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+1RxYN/AWmbpqVRxBOInDvY+h4yH18CfXKo6clUq11QeOdlEm
	kigK7gKSYadDll5Ykc7kX04gwENDxuENqEPrBMB3h7FHlIh8EZtW5Z2LcAm/z1aClVAoeB5GaFm
	Sdplr7pcreYETDqXKMyGbbYMfSrpsaCSRxuyB7ZmUeT+91PO3DuldoRz53ZD1+tQOIhhX
X-Gm-Gg: ASbGncvn7cKETfOhtGDjjkmt2Fdg2XQvv/Sxkt3yHkosqxY+b7EPV/TeSOo1KNtsAjl
	jMZCP8SwzyUBoZ9P1TAKuoj2+S+D0vfzCA5TAwdQIWmlviUp1fmno/0ZKAo87xzokYadB5n/dF0
	XLsZ2sXbyEmiZ5viv83utpSO7N0GepPaHaBSC25lTeOSSFME2MhqLhf8fHj8jrNCzhzcq7m5qIO
	MIgUq8/3Q5z6bn+ASSsYkqhwORPYeIwrCqXESf7I3vl/1XFYtVPZ0CCdPMsT+H+lsWnw3I32QfU
	RfBYivfl6J/hNrbDlATLt9RuRwMd7nbdWizfuSraRFFQD/3kQLSv+f47k3Y1k6LuO4WB1V5ET35
	8W25vqGc8K3O3WWX62mEfRnfDFAvvAqw8Tjw=
X-Received: by 2002:a05:6214:b61:b0:6fa:acd8:4c00 with SMTP id 6a1803df08f44-6fb45b1e941mr11722336d6.9.1749822941878;
        Fri, 13 Jun 2025 06:55:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuqX7iMTWJknAvFETNbyvSvd1M84Lw+KAGiQ2bx2IaPl+AHeAS0/aicGlgOi2ER5+IELUvug==
X-Received: by 2002:a05:6214:b61:b0:6fa:acd8:4c00 with SMTP id 6a1803df08f44-6fb45b1e941mr11722026d6.9.1749822941300;
        Fri, 13 Jun 2025 06:55:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1dbd80sm453029e87.187.2025.06.13.06.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 06:55:39 -0700 (PDT)
Date: Fri, 13 Jun 2025 16:55:37 +0300
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
        Dmitry Baryshkov <lumag@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v6 08/17] drm/msm/dsi/phy: Fix reading zero as PLL rates
 when unprepared
Message-ID: <n5djafe2bm4cofoa3z4urfogchhfacybzou763nelttgfspo25@bywfd5febe6g>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-8-ee633e3ddbff@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-b4-sm8750-display-v6-8-ee633e3ddbff@linaro.org>
X-Proofpoint-ORIG-GUID: yqhIV77VIToh0qZuxFgI1xEsvnEUyMSE
X-Proofpoint-GUID: yqhIV77VIToh0qZuxFgI1xEsvnEUyMSE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwMiBTYWx0ZWRfXyOzSWydyrpk5
 +6SiDY23Lb9ihtuh7oAFqw4yLgWQ8TX3oAZAKSFmCXtqZYuJNxJ5+AX818X4MQQ6SUyk0Lexcjy
 VpDm0y0ToNvBBh8+oAubuB+0uXRGHy7NwUVky1xDjkvaDVllyIkEtqRUQX7MZ7BC6kBMwM7T0bM
 GShn5TB5J1rgJhVrTPbLFg3zRLsxUuFNl3kiNO61gLtL+E+MjvKAGnlE3gKQQA4qNRjNC2byq6p
 gbIWXv9TakYLO+hCt7ZoJUHT0P1aixa3ZYX0o8WKqwglaDB2Ub6FkJmzWeh2ijybOCt1WofBo5p
 Rm+KQJykECvPll61m6rcNJl+XchaWJ/KK0mMqdaY90KDkl3D7VzZMjhTXVfqcdAz/roKFP8ka8C
 4SHpdqmvygaB0C7U3bR8S5fxK0x7z+Z9DcWnSO6b7LWKwhf4UPzwE0wnFGhHWfDKs88/aeC9
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=684c2ddf cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=Y2o_y9hPy4cS9qKCgcUA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130102

On Tue, Jun 10, 2025 at 04:05:46PM +0200, Krzysztof Kozlowski wrote:
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
> Changes in v6:
> 1. Print error on pll bias enable/disable imbalance refcnt
> 
> Changes in v5:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 53 +++++++++++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 7ea608f620fe17ae4ccc41ba9e52ba043af0c022..82baec385b3224c8b3e36742230d806c4fe68cbb 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -109,6 +109,7 @@ struct msm_dsi_phy {
>  	struct msm_dsi_dphy_timing timing;
>  	const struct msm_dsi_phy_cfg *cfg;
>  	void *tuning_cfg;
> +	void *pll_data;
>  
>  	enum msm_dsi_phy_usecase usecase;
>  	bool regulator_ldo_mode;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 4df865dfe6fe111297f0d08199c515d3b5e5a0b6..22f80e99a7a7514085ef80ced1cf78876bcc6ba3 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -88,6 +88,13 @@ struct dsi_pll_7nm {
>  	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG1 register */
>  	spinlock_t pclk_mux_lock;
>  
> +	/*
> +	 * protects REG_DSI_7nm_PHY_CMN_CTRL_0 register and pll_enable_cnt
> +	 * member
> +	 */
> +	spinlock_t pll_enable_lock;
> +	int pll_enable_cnt;
> +
>  	struct pll_7nm_cached_state cached_state;
>  
>  	struct dsi_pll_7nm *slave;
> @@ -101,6 +108,9 @@ struct dsi_pll_7nm {
>   */
>  static struct dsi_pll_7nm *pll_7nm_list[DSI_MAX];
>  
> +static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll);
> +static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll);
> +
>  static void dsi_pll_setup_config(struct dsi_pll_config *config)
>  {
>  	config->ssc_freq = 31500;
> @@ -316,6 +326,7 @@ static int dsi_pll_7nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
>  	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(hw);
>  	struct dsi_pll_config config;
>  
> +	dsi_pll_enable_pll_bias(pll_7nm);
>  	DBG("DSI PLL%d rate=%lu, parent's=%lu", pll_7nm->phy->id, rate,
>  	    parent_rate);
>  
> @@ -333,6 +344,7 @@ static int dsi_pll_7nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
>  
>  	dsi_pll_ssc_commit(pll_7nm, &config);
>  
> +	dsi_pll_disable_pll_bias(pll_7nm);
>  	/* flush, ensure all register writes are done*/
>  	wmb();
>  
> @@ -361,24 +373,47 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
>  
>  static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
>  {
> +	unsigned long flags;
>  	u32 data;
>  
> +	spin_lock_irqsave(&pll->pll_enable_lock, flags);
> +	--pll->pll_enable_cnt;
> +	if (pll->pll_enable_cnt < 0) {
> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
> +		DRM_DEV_ERROR_RATELIMITED(&pll->phy->pdev->dev,
> +					  "bug: imbalance in disabling PLL bias\n");
> +		return;
> +	} else if (pll->pll_enable_cnt > 0) {
> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
> +		return;
> +	} /* else: == 0 */
> +
>  	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>  	data &= ~DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>  	writel(0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
>  	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
> +	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>  	ndelay(250);

What is this ndelay protecting? Is is to let the hardware to wind down
correctly? I'm worried about dsi_pll_disable_pll_bias() beng followed up
by dsi_pll_enable_pll_bias() in another thread, which would mean that
corresponding writes to the REG_DSI_7nm_PHY_CMN_CTRL_0 can come up
without any delay between them.

>  }
>  
>  static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
>  {
> +	unsigned long flags;
>  	u32 data;
>  
> +	spin_lock_irqsave(&pll->pll_enable_lock, flags);
> +	if (pll->pll_enable_cnt++) {
> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
> +		WARN_ON(pll->pll_enable_cnt == INT_MAX);
> +		return;
> +	}
> +
>  	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>  	data |= DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>  	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>  
>  	writel(0xc0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
> +	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>  	ndelay(250);
>  }
>  
> @@ -519,6 +554,7 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
>  	u32 dec;
>  	u64 pll_freq, tmp64;
>  
> +	dsi_pll_enable_pll_bias(pll_7nm);
>  	dec = readl(base + REG_DSI_7nm_PHY_PLL_DECIMAL_DIV_START_1);
>  	dec &= 0xff;
>  
> @@ -543,6 +579,8 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
>  	DBG("DSI PLL%d returning vco rate = %lu, dec = %x, frac = %x",
>  	    pll_7nm->phy->id, (unsigned long)vco_rate, dec, frac);
>  
> +	dsi_pll_disable_pll_bias(pll_7nm);
> +
>  	return (unsigned long)vco_rate;
>  }
>  
> @@ -578,6 +616,7 @@ static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
>  	void __iomem *phy_base = pll_7nm->phy->base;
>  	u32 cmn_clk_cfg0, cmn_clk_cfg1;
>  
> +	dsi_pll_enable_pll_bias(pll_7nm);
>  	cached->pll_out_div = readl(pll_7nm->phy->pll_base +
>  			REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
>  	cached->pll_out_div &= 0x3;
> @@ -589,6 +628,7 @@ static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
>  	cmn_clk_cfg1 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>  	cached->pll_mux = FIELD_GET(DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK, cmn_clk_cfg1);
>  
> +	dsi_pll_disable_pll_bias(pll_7nm);
>  	DBG("DSI PLL%d outdiv %x bit_clk_div %x pix_clk_div %x pll_mux %x",
>  	    pll_7nm->phy->id, cached->pll_out_div, cached->bit_clk_div,
>  	    cached->pix_clk_div, cached->pll_mux);
> @@ -807,8 +847,10 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
>  
>  	spin_lock_init(&pll_7nm->postdiv_lock);
>  	spin_lock_init(&pll_7nm->pclk_mux_lock);
> +	spin_lock_init(&pll_7nm->pll_enable_lock);
>  
>  	pll_7nm->phy = phy;
> +	phy->pll_data = pll_7nm;
>  
>  	ret = pll_7nm_register(pll_7nm, phy->provided_clocks->hws);
>  	if (ret) {
> @@ -891,8 +933,10 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>  	u32 const delay_us = 5;
>  	u32 const timeout_us = 1000;
>  	struct msm_dsi_dphy_timing *timing = &phy->timing;
> +	struct dsi_pll_7nm *pll = phy->pll_data;
>  	void __iomem *base = phy->base;
>  	bool less_than_1500_mhz;
> +	unsigned long flags;
>  	u32 vreg_ctrl_0, vreg_ctrl_1, lane_ctrl0;
>  	u32 glbl_pemph_ctrl_0;
>  	u32 glbl_str_swi_cal_sel_ctrl, glbl_hstx_str_ctrl_0;
> @@ -1000,10 +1044,13 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>  		glbl_rescode_bot_ctrl = 0x3c;
>  	}
>  
> +	spin_lock_irqsave(&pll->pll_enable_lock, flags);
> +	pll->pll_enable_cnt = 1;
>  	/* de-assert digital and pll power down */
>  	data = DSI_7nm_PHY_CMN_CTRL_0_DIGTOP_PWRDN_B |
>  	       DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>  	writel(data, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
> +	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>  
>  	/* Assert PLL core reset */
>  	writel(0x00, base + REG_DSI_7nm_PHY_CMN_PLL_CNTRL);
> @@ -1115,7 +1162,9 @@ static bool dsi_7nm_set_continuous_clock(struct msm_dsi_phy *phy, bool enable)
>  
>  static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
>  {
> +	struct dsi_pll_7nm *pll = phy->pll_data;
>  	void __iomem *base = phy->base;
> +	unsigned long flags;
>  	u32 data;
>  
>  	DBG("");
> @@ -1141,8 +1190,12 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
>  	writel(data, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>  	writel(0, base + REG_DSI_7nm_PHY_CMN_LANE_CTRL0);
>  
> +	spin_lock_irqsave(&pll->pll_enable_lock, flags);
> +	pll->pll_enable_cnt = 0;
>  	/* Turn off all PHY blocks */
>  	writel(0x00, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
> +	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
> +
>  	/* make sure phy is turned off */
>  	wmb();
>  
> 
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry

