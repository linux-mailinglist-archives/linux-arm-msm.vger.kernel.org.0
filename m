Return-Path: <linux-arm-msm+bounces-20564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0493F8CFC47
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 10:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DAE6B207E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 08:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAE316A347;
	Mon, 27 May 2024 08:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BE8AmMNa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D414369953
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 08:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716800278; cv=none; b=RXs3h0bqGVeXfDgdDSNLDnIooEfBKJ938dBr6vX0egrwhqSGehYcFSvzL6Hbhl1OYw4P/1f5s/cp1TKGnxE7K/pnPqghwXSuk8+V+f240MS27mUEXLGecx842k6fBgBqEra+jdkKI91MH048ZbioVOa++niVab1vujdQnkjputc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716800278; c=relaxed/simple;
	bh=sx/Xbo3SX+5vuaujIK/pI1wAkddz2tNUfcPfNXNe5XM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aeRMaLA34/onfTINpfR8OP/v+ZqrcYtTziYl9pIKzIpJ/ZIX+DqWVnWaP3EbDQJyfrWI/HIoZ2n4p9iCF/o33DyeTbmG1HLjAJreJPfkPlknAkB2ylWDcHtcX1SM5lLHuOPJHRLiEfoSGbDhpG28NEzwzifk33azJTSp9bYC0jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BE8AmMNa; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e3efa18e6aso49358111fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 01:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716800275; x=1717405075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RuAYanml29TlPX+qaYSWK4Mnqvbm8YMtF7p5HJx540g=;
        b=BE8AmMNabbbq9LwovXRogje11vRsVQKN+nT/1Q0rAGboNXBYKX0KRKaLCsXbk1z9Lv
         hJcAKaiQ6nhhfcKHcRGMP+3WIJ/INH+1jNcWnloK3iKnbABo6eFoanI50lmSzTagt/w+
         kUW2ezDaMYctmqPnagHr32LPQjVaEr8ACo7QdykaxDwAV8q+GdCfWJ95Gybglm9VFf6I
         aC6CokPc0YvjCHp/0Dyxv26DM2sdK+o5Gu/14jgCE3PzSAYRy5r358GM/s3r6o1+lVLB
         4qpmgkgFlJ4WsP1oJvtNfS7bdnSvWv4j0Ydd51GiPM/FXlUkMNco02G18hWXO8PDIHIt
         x3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716800275; x=1717405075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuAYanml29TlPX+qaYSWK4Mnqvbm8YMtF7p5HJx540g=;
        b=LqPFPbHbgMeggmiiY1Wf2/MNgTsxloHUfgX0t6Ze3DzZSFitNgCQG2eJpvuo0mry5u
         7VGita5kzcaibNs06egkJcY8WoaOE4H+tCwctItpPKf6xwM/I91cm2hqaaTASzdjMrGd
         XsE0eBABVUdstZ9/+dAt+RnOGSsiDctrjkFruuPp5PbbhF4w98nKoads8XkDVKer12z9
         /JmL1UulAE+qNVEHlLdxfVgr7XCI/ZWge9ZWQZSeuWvXYrRgX/iTGFYvLEoBlIfAgLWi
         eChfAfRpsv3mVh1HT/h8ph4WFF8CvV1bZXN7K+c9mBb4N4p/NBgSH7vScJ8h+MrJ4rvx
         dF3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXrLlNLL+DcSkjdlabFeADRJPrcSm8R0DF2yOUdz92pGLVYZMCJanvhv3Ghj4TMFTRafx57PYt+W3wn71ubwgflINrpQ/e444YfvpNmIw==
X-Gm-Message-State: AOJu0YwAd/6Mbxll5FNmxFHJDHgeaUvh6tU0twn7C4CJTOUX1qDBmkQB
	X0XvRIqjS9nwxlNF710MGwSZfOqjgRWUpEDxHIn0kQWUb1VylVCr5Pi0SJXKmK4=
X-Google-Smtp-Source: AGHT+IE5GcM3SspxXEKWWPuigZVFfTwI/IUPr7cLcilG6aZBnW9gHQCntqabHKDoUDrVc4BcSjCmsQ==
X-Received: by 2002:a2e:a795:0:b0:2e1:c97b:6f25 with SMTP id 38308e7fff4ca-2e95a096142mr32081911fa.1.1716800274837;
        Mon, 27 May 2024 01:57:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bf1a978sm18765661fa.125.2024.05.27.01.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 01:57:54 -0700 (PDT)
Date: Mon, 27 May 2024 11:57:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] phy: qcom: qmp-combo: register a typec mux to
 change the QPHY_MODE
Message-ID: <qgitwducxmox6vac6v3pmjxgrbizd2tk2fgxds4pjqinr2cefd@lbsrbit4xsdi>
References: <20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-0-a03e68d7b8fc@linaro.org>
 <20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-4-a03e68d7b8fc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-4-a03e68d7b8fc@linaro.org>

On Mon, May 27, 2024 at 10:42:36AM +0200, Neil Armstrong wrote:
> Register a typec mux in order to change the PHY mode on the Type-C
> mux events depending on the mode and the svid when in Altmode setup.
> 
> The DisplayPort phy should be left enabled if is still powered on
> by the DRM DisplayPort controller, so bail out until the DisplayPort
> PHY is not powered off.
> 
> The Type-C Mode/SVID only changes on plug/unplug, and USB SAFE states
> will be set in between of USB-Only, Combo and DisplayPort Only so
> this will leave enough time to the DRM DisplayPort controller to
> turn of the DisplayPort PHY.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 123 ++++++++++++++++++++++++++++--
>  1 file changed, 118 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 788e4c05eaf2..b55ab08d44c2 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -19,6 +19,7 @@
>  #include <linux/reset.h>
>  #include <linux/slab.h>
>  #include <linux/usb/typec.h>
> +#include <linux/usb/typec_dp.h>
>  #include <linux/usb/typec_mux.h>
>  
>  #include <drm/bridge/aux-bridge.h>
> @@ -1527,6 +1528,10 @@ struct qmp_combo {
>  
>  	struct typec_switch_dev *sw;
>  	enum typec_orientation orientation;
> +
> +	struct typec_mux_dev *mux;
> +	unsigned long mux_mode;
> +	unsigned int svid;
>  };
>  
>  static void qmp_v3_dp_aux_init(struct qmp_combo *qmp);
> @@ -3353,17 +3358,112 @@ static int qmp_combo_typec_switch_set(struct typec_switch_dev *sw,
>  	return 0;
>  }
>  
> -static void qmp_combo_typec_unregister(void *data)
> +static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *state)
> +{
> +	struct qmp_combo *qmp = typec_mux_get_drvdata(mux);
> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	enum qphy_mode new_mode;
> +	unsigned int svid;
> +
> +	if (state->mode == qmp->mode)
> +		return 0;
> +
> +	mutex_lock(&qmp->phy_mutex);
> +
> +	if (state->alt)
> +		svid = state->alt->svid;
> +	else
> +		svid = 0; // No SVID
> +
> +	if (svid == USB_TYPEC_DP_SID) {
> +		switch (state->mode) {
> +		/* DP Only */
> +		case TYPEC_DP_STATE_C:
> +		case TYPEC_DP_STATE_E:
> +			new_mode = QPHY_MODE_DP_ONLY;
> +			break;
> +
> +		/* DP + USB */
> +		case TYPEC_DP_STATE_D:
> +		case TYPEC_DP_STATE_F:
> +
> +		/* Safe fallback...*/
> +		default:
> +			new_mode = QPHY_MODE_COMBO;
> +			break;
> +		}
> +	} else {
> +		/* Only switch to USB_ONLY when we know we only have USB3 */
> +		if (qmp->mux_mode == TYPEC_MODE_USB3)
> +			new_mode = QPHY_MODE_USB_ONLY;
> +		else
> +			new_mode = QPHY_MODE_COMBO;
> +	}
> +
> +	if (new_mode == qmp->init_mode) {
> +		dev_dbg(qmp->dev, "typec_mux_set: same phy mode, bail out\n");
> +		qmp->mode = state->mode;
> +		goto out;
> +	}
> +
> +	if (qmp->init_mode != QPHY_MODE_USB_ONLY && qmp->dp_powered_on) {
> +		dev_dbg(qmp->dev, "typec_mux_set: DP is still powered on, delaying switch\n");
> +		goto out;
> +	}
> +
> +	dev_dbg(qmp->dev, "typec_mux_set: switching from phy mode %d to %d\n",
> +		qmp->init_mode, new_mode);
> +
> +	qmp->mux_mode = state->mode;
> +	qmp->init_mode = new_mode;
> +
> +	if (qmp->init_count) {
> +		if (qmp->usb_init_count)
> +			qmp_combo_usb_power_off(qmp->usb_phy);
> +		if (qmp->dp_init_count)
> +			writel(DP_PHY_PD_CTL_PSR_PWRDN, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
> +		qmp_combo_com_exit(qmp, true);
> +
> +		/* Now everything's powered down, power up the right PHYs */
> +
> +		qmp_combo_com_init(qmp, true);
> +		if (qmp->init_mode == QPHY_MODE_DP_ONLY && qmp->usb_init_count) {
> +			qmp->usb_init_count--;

Can we move this clause next to actually powering USB part off?

> +		} else if (qmp->init_mode != QPHY_MODE_DP_ONLY) {
> +			qmp_combo_usb_power_on(qmp->usb_phy);
> +			if (!qmp->usb_init_count)
> +				qmp->usb_init_count++;
> +		}
> +		if (qmp->init_mode != QPHY_MODE_USB_ONLY && qmp->dp_init_count)
> +			cfg->dp_aux_init(qmp);

Does dp_init_count reflect the actual necessity to bring up the DP part
up? Maybe we can unify the code between this function and
qmp_combo_typec_switch_set()? I don't like that it is unobvious whether
these two functions will results in the same state or not depending on
the order in which they are being called.

> +	}
> +
> +out:
> +	mutex_unlock(&qmp->phy_mutex);
> +
> +	return 0;
> +}
> +
> +static void qmp_combo_typec_switch_unregister(void *data)
>  {
>  	struct qmp_combo *qmp = data;
>  
>  	typec_switch_unregister(qmp->sw);
>  }
>  
> -static int qmp_combo_typec_switch_register(struct qmp_combo *qmp)
> +static void qmp_combo_typec_mux_unregister(void *data)
> +{
> +	struct qmp_combo *qmp = data;
> +
> +	typec_mux_unregister(qmp->mux);
> +}
> +
> +static int qmp_combo_typec_register(struct qmp_combo *qmp)
>  {
>  	struct typec_switch_desc sw_desc = {};
> +	struct typec_mux_desc mux_desc = { };
>  	struct device *dev = qmp->dev;
> +	int ret;
>  
>  	sw_desc.drvdata = qmp;
>  	sw_desc.fwnode = dev->fwnode;
> @@ -3374,10 +3474,23 @@ static int qmp_combo_typec_switch_register(struct qmp_combo *qmp)
>  		return PTR_ERR(qmp->sw);
>  	}
>  
> -	return devm_add_action_or_reset(dev, qmp_combo_typec_unregister, qmp);
> +	ret = devm_add_action_or_reset(dev, qmp_combo_typec_switch_unregister, qmp);
> +	if (ret)
> +		return ret;
> +
> +	mux_desc.drvdata = qmp;
> +	mux_desc.fwnode = dev->fwnode;
> +	mux_desc.set = qmp_combo_typec_mux_set;
> +	qmp->mux = typec_mux_register(dev, &mux_desc);
> +	if (IS_ERR(qmp->mux)) {
> +		dev_err(dev, "Unable to register typec mux: %pe\n", qmp->mux);
> +		return PTR_ERR(qmp->mux);
> +	}
> +
> +	return devm_add_action_or_reset(dev, qmp_combo_typec_mux_unregister, qmp);
>  }
>  #else
> -static int qmp_combo_typec_switch_register(struct qmp_combo *qmp)
> +static int qmp_combo_typec_register(struct qmp_combo *qmp)
>  {
>  	return 0;
>  }
> @@ -3609,7 +3722,7 @@ static int qmp_combo_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_node_put;
>  
> -	ret = qmp_combo_typec_switch_register(qmp);
> +	ret = qmp_combo_typec_register(qmp);
>  	if (ret)
>  		goto err_node_put;
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

