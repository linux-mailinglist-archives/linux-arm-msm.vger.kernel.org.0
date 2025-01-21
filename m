Return-Path: <linux-arm-msm+bounces-45668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E18FA17A98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 10:55:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03CEB3A3C9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 09:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067201BD9CE;
	Tue, 21 Jan 2025 09:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fn8OvIBw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0566ED2FB
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 09:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737453318; cv=none; b=IUt0IAGlWMP6/2pFex90/yB6fwN+oTmKfa50LML1ZbVuB6drGjlEGtL6POUuVMeGDJvcmQ0nj5vn+6CO1u7vbu9hBrUv4eQYDyhWdJkk9AxzCaZ/SZ0uf66bxiBKcZ/O5tisdrxnf5u8zKUMOvMAhAx0zBSGO43qR3O0xofFkTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737453318; c=relaxed/simple;
	bh=1i70z0fw9u5mjAwug0G9jRMjriIh6lEP5kexsFa1yLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CwGyahzief6Qcm3RtW9kQG8en/HRcd6ZY0Q9OfcdKPU12V+Y3fIDoVkt3FXxp1cO5/TbWIqbLlvSYvRhW/455fka1U5VJOG0KPY8bYo5qNu1GIV/dEara5+Ngc8MRDesrsmVcRZbusYl90S53Tl8jafBsY2CcrVM3vPC+GB2/9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fn8OvIBw; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436a39e4891so36595385e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 01:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737453315; x=1738058115; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BJEfTvcXUOg/2RMScN4VNlvtaWh5a7Q7ooc2IyVfYw8=;
        b=Fn8OvIBwLz2E6FFjrQR9afbMPE6dluFQHQnxLFqPC0sK4aPhINN1Y3EzEY2aZ2U4Ke
         nVR/sKixoM7P4LU4GTNoR9ZA5/swHaiEqw2QQ8WKdhn8gtD8F+WQ3t93X11bZZAp9cls
         s2z9DI24iI4xwTuf5sVnxDPGrhhvEKXAaUrGxRvTkh3bIzdBkbCLYZnRR2wmH/CGHurD
         0TsWT9UMGDVhUXGJl6byKhzwLdeYAhrcQos3hurOG6Ajw2g2Syc0AXujXgfe8Z1bbo7a
         7UVLveevXGUd9zXbUrq1ANJxWO8f3yPcZyHNxq/qtMc5re2k9n/ban3jZJB20BZbAEPE
         S39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737453315; x=1738058115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJEfTvcXUOg/2RMScN4VNlvtaWh5a7Q7ooc2IyVfYw8=;
        b=kDmkAIJ151ebhg2GcFGzhgdNqJnk2GJrCEnxZQvXDemapPnIBoCkRcVoS9HPSXjyPV
         JniegHpARNAhfS8Nih2e59zkaBee6gx7s9ruTmn6V/cxhyoRk9RWvMe82A9F18Ze89ys
         KzrSNcriIxptLC/2Wrm9sYaRB8X2406UX5QLDxYWs6RNSiDQGapMlK6/GKOgwGAuO4yQ
         VdTQyMhdgSrFqP4IN7KUn7FTQ7RRJgWbPvtEgDUFMti7dm4j+/yJJcmNly8s55mgfiJM
         OvL/d4pWcu4lGY0EX2V4r93wqV660Yi0JOLbVa/b9J1tuiJq3Ks/hit1FjltKyDFK7ZX
         Unuw==
X-Forwarded-Encrypted: i=1; AJvYcCWW9pwr3mhibsqM9u3KhvCmysUGOT///8p+S/vY2EgNpDx7XweUxSjl8HIST+2SRf858guvcqKwlG4IJWeo@vger.kernel.org
X-Gm-Message-State: AOJu0YxCfd6Rk7/eHwnSZaskEO+uz08VLAFMMetg22MkOrpYzi4SYY49
	CTh4zKGBEMrRtEUOMjvTJmIL4gheSs2DMwpxnT5pK3DMsdALFGyJ9egcdSotEko=
X-Gm-Gg: ASbGnctAH36VLLjAkExSVoA3VV96ecOJmbKpwe06nB6jYAKpktSf43ABLHV8jXtoagM
	VG4sRWeq9uWGbdPsQUrsapSGNYueAVdJVoL7KgFkR0UOiSHS8s5bcG6xrTsbeY4E+4pwoRNwh43
	jEKdjvbic7XKlf62SLLOSR8PxXYTwxxUq+3Ll4a6AmvktBi3e3VdHPUPbn4xaUh65Mer+2aIAKK
	9Gbm9V/8jOuoTwHNdbGL0pcH6BzMqTYrP8WJf+8E4apwIMt6wyJRyB5saERUKSjwrEG
X-Google-Smtp-Source: AGHT+IFN+/Ulyj4CwXzze+VR77TqlAAim9U99xctcP1kZZn/i+KqjTbOyWR88Y+G5DoLrMkVoNvbDg==
X-Received: by 2002:a5d:4f0b:0:b0:385:e0d6:fb73 with SMTP id ffacd0b85a97d-38bf56624a8mr12912498f8f.15.1737453315261;
        Tue, 21 Jan 2025 01:55:15 -0800 (PST)
Received: from linaro.org ([86.123.96.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3275562sm13166638f8f.66.2025.01.21.01.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 01:55:14 -0800 (PST)
Date: Tue, 21 Jan 2025 11:55:13 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Wenbin Yao <quic_wenbyao@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, p.zabel@pengutronix.de,
	dmitry.baryshkov@linaro.org, quic_qianyu@quicinc.com,
	neil.armstrong@linaro.org, manivannan.sadhasivam@linaro.org,
	quic_devipriy@quicinc.com, konrad.dybcio@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] phy: qcom: pcie: Determine has_nocsr_reset
 dynamically
Message-ID: <Z49vAXdhROVm93TW@linaro.org>
References: <20250121094140.4006801-1-quic_wenbyao@quicinc.com>
 <20250121094140.4006801-2-quic_wenbyao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121094140.4006801-2-quic_wenbyao@quicinc.com>

On 25-01-21 17:41:39, Wenbin Yao wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Decide the in-driver logic based on whether the nocsr reset is present
> and defer checking the appropriateness of that to dt-bindings to save
> on boilerplate.
> 
> Reset controller APIs are fine consuming a nullptr, so no additional
> checks are necessary there.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index 873f2f9844c6..ac42e4b01065 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -2793,8 +2793,6 @@ struct qmp_phy_cfg {
>  
>  	bool skip_start_delay;
>  
> -	bool has_nocsr_reset;
> -
>  	/* QMP PHY pipe clock interface rate */
>  	unsigned long pipe_clock_rate;
>  
> @@ -3685,7 +3683,6 @@ static const struct qmp_phy_cfg sm8550_qmp_gen4x2_pciephy_cfg = {
>  
>  	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
>  	.phy_status		= PHYSTATUS_4_20,
> -	.has_nocsr_reset	= true,
>  
>  	/* 20MHz PHY AUX Clock */
>  	.aux_clock_rate		= 20000000,
> @@ -3718,7 +3715,6 @@ static const struct qmp_phy_cfg sm8650_qmp_gen4x2_pciephy_cfg = {
>  
>  	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
>  	.phy_status		= PHYSTATUS_4_20,
> -	.has_nocsr_reset	= true,
>  
>  	/* 20MHz PHY AUX Clock */
>  	.aux_clock_rate		= 20000000,
> @@ -3836,7 +3832,6 @@ static const struct qmp_phy_cfg x1e80100_qmp_gen4x2_pciephy_cfg = {
>  
>  	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
>  	.phy_status		= PHYSTATUS_4_20,
> -	.has_nocsr_reset	= true,
>  };
>  
>  static const struct qmp_phy_cfg x1e80100_qmp_gen4x4_pciephy_cfg = {
> @@ -3870,7 +3865,6 @@ static const struct qmp_phy_cfg x1e80100_qmp_gen4x4_pciephy_cfg = {
>  
>  	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
>  	.phy_status		= PHYSTATUS_4_20,
> -	.has_nocsr_reset	= true,
>  };
>  
>  static const struct qmp_phy_cfg x1e80100_qmp_gen4x8_pciephy_cfg = {
> @@ -3902,7 +3896,6 @@ static const struct qmp_phy_cfg x1e80100_qmp_gen4x8_pciephy_cfg = {
>  
>  	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
>  	.phy_status		= PHYSTATUS_4_20,
> -	.has_nocsr_reset	= true,
>  };
>  
>  static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)
> @@ -4203,11 +4196,14 @@ static int qmp_pcie_reset_init(struct qmp_pcie *qmp)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to get resets\n");
>  
> -	if (cfg->has_nocsr_reset) {
> -		qmp->nocsr_reset = devm_reset_control_get_exclusive(dev, "phy_nocsr");
> -		if (IS_ERR(qmp->nocsr_reset))
> +	qmp->nocsr_reset = devm_reset_control_get_exclusive(dev, "phy_nocsr");
> +	if (IS_ERR(qmp->nocsr_reset)) {
> +		if (PTR_ERR(qmp->nocsr_reset) == -ENOENT ||
> +		    PTR_ERR(qmp->nocsr_reset) == -EINVAL)
> +			qmp->nocsr_reset = NULL;
> +		else
>  			return dev_err_probe(dev, PTR_ERR(qmp->nocsr_reset),
> -						"failed to get no-csr reset\n");
> +					     "failed to get no-csr reset\n");
>  	}
>  
>  	return 0;
> -- 
> 2.34.1
> 

