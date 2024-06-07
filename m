Return-Path: <linux-arm-msm+bounces-22044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F9D900158
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 12:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61DFE283BB1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 10:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E3B9186288;
	Fri,  7 Jun 2024 10:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rq88oA6Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3191078C96
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jun 2024 10:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717757922; cv=none; b=rm17W2t9Bjspz1q15hut1w+sXeCoHi485fak5AFeDD/5Nfu70s+L/88ReSw/psg4UUh1OuAFerRH1Q5R7jr6fd2W34N7ubjFINSHMLFnhzIAhWHiRG8QfNnv1PfU1w2iYDnXd1A0KHipq2w7PrfYjb/7C9U2QrHh7jIY4GZftV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717757922; c=relaxed/simple;
	bh=pRUs8VmuZj5e7PO+Pf05N+Dt+BF9X0+42xniTidkx1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LfU/B9zBV7ivSGAu7I5Ahf/CfU2aBQfMvOpmEddsNJuI546df0YbToj1l00NtglgxRnIVVQXJY0pUBq+PPCXnvdiH0jPDfD6CeOJwONo58G/jLTVjeaVRYAXrMantekOJT9VgeidQ25WIBFK6W8c1J1LEzbvp6S8jorEff+mOp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rq88oA6Q; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52b87e8ba1eso2702899e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2024 03:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717757919; x=1718362719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pBhIdhEhaQ9KQdEpMg8LTKp34tylqUHftSlF1gdJzgw=;
        b=Rq88oA6QcC8VpghqHQTQ7JJzZZkllNWbm6JUPVqF8+9+xbvlg5/FrMLjIayab2Hkxu
         eDq8dx1v/q6ZoreDvuEdShPk9a8ecALP5krcCbyrX/khobWgp5OWii5bhAJOA7y+q+Ks
         pokDTNfyNFcks/3QXWzha5Z+c669Z/yISGQH/rsQtZZ/y8h2UjWRV8TZKxG6gH3kdqZ0
         OmPu7ljnLxhIDxF205Rehnvu45WbYAVOzaoRzj5kyM+5K8ymbo2p2yzrnm8IvrVozOlg
         RzHIAOeTMcCFuSawYO/P0CDZGL6CQvHQnLCko9tIbg9UBqADtE0pF8Kh04DpflGG1yDA
         5uFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717757919; x=1718362719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBhIdhEhaQ9KQdEpMg8LTKp34tylqUHftSlF1gdJzgw=;
        b=vcmEuA3b0j0slcp3USq4c0KeW7OAyu/DPXFnN8fxflAm746l4BV+dGpsYcUCtEdcaM
         0sdTg/TgmOHWkmG54IYIoufrufOvuqj7bXesR79UY6mtB0+R/wo/u2vxFEdsSOWkAbYe
         z2l7WzyBTjZm8kWxpF12MC9XFYMbdOKfDpfNqemf7rc69khl9uKummcV/aXwsHS+whK3
         zOQxBlbc/fdbtevGBVrqmV4vkmRIk2kdn8m00jsWdt7U4M3LMtPI6vfdA8tR9EFL0p8F
         BfcjsvzPpCpNZ8B1xajoBaLI0pzRPibHElLheffWYW/EfAefnyz9tGcJ9xngGIzwGhLq
         EFlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgWVkeS4uKJk4dApjxs5scLyMJ72NSc635jx8e5/nNZ9XkZGz3PRwzelij4Si5B+vz4R5kl8qXo1G3LRF8uJg2IRHk/wr5CovbUuuQpA==
X-Gm-Message-State: AOJu0Ywf7/yaAc5BBJd+PtLkO0roEBF+Vgo1rZ2KjSjZgChSFc+xJsNg
	o2VnkOes2nQ1SbJCjni68/pUxewDi7xUVRhCBOPmEAabXZwta/d/iHrDzK3YnTw=
X-Google-Smtp-Source: AGHT+IGwurAV2ObQ2ikkqbB73N/NRCRyMNzsURTroyyeyk3A/xI2ByWyFDa/AOI35OfN6jvpgbWzjw==
X-Received: by 2002:ac2:4d89:0:b0:516:c5c2:cba8 with SMTP id 2adb3069b0e04-52bb9f64ccemr1690971e87.12.1717757919391;
        Fri, 07 Jun 2024 03:58:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb434dde7sm494604e87.309.2024.06.07.03.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 03:58:38 -0700 (PDT)
Date: Fri, 7 Jun 2024 13:58:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, perex@perex.cz, lgirdwood@gmail.com, 
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	krzk+dt@kernel.org, neil.armstrong@linaro.org, krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH v2 1/2] ASoC: codecs: lpass-macro: add helpers to get
 codec version
Message-ID: <gda23tcdsoddyamedjd5sej4fhpjru65fqbhk4htc35kqyr3ts@glxyvqqw6x75>
References: <20240606122559.116698-1-srinivas.kandagatla@linaro.org>
 <20240606122559.116698-2-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606122559.116698-2-srinivas.kandagatla@linaro.org>

On Thu, Jun 06, 2024 at 01:25:58PM +0100, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> LPASS Digital codec have changes in register layout across multiple
> versions. Add a proper way read the codec version allowint all the lpass
> macro drivers (tx, rx, wsa, va) to configure the registers correctly.
> 
> LPASS VA macro has the required registers to read the codec version.
> Read the the version and make it available to other lpass codec macros
> using the common helper functions.
> 
> Existing method of using LPASS IP version is not accurate as the same
> the codec versioning is totally independent of LPASS IP block versions.

So it's possible for two platforms have the same LPASS IP version, but
different codec versions?

> 
> These helper functions should be able to provide a convient way to get
> the codec version, and will help scale the drivers in right direction.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/lpass-macro-common.c | 14 +++++++++++
>  sound/soc/codecs/lpass-macro-common.h | 35 +++++++++++++++++++++++++++
>  sound/soc/codecs/lpass-va-macro.c     | 29 ++++++++++++++++++++++
>  3 files changed, 78 insertions(+)
> 
> diff --git a/sound/soc/codecs/lpass-macro-common.c b/sound/soc/codecs/lpass-macro-common.c
> index da1b422250b8..a640bf88a6cd 100644
> --- a/sound/soc/codecs/lpass-macro-common.c
> +++ b/sound/soc/codecs/lpass-macro-common.c
> @@ -11,6 +11,8 @@
>  
>  #include "lpass-macro-common.h"
>  
> +static int lpass_codec_version;
> +
>  struct lpass_macro *lpass_macro_pds_init(struct device *dev)
>  {
>  	struct lpass_macro *l_pds;
> @@ -66,5 +68,17 @@ void lpass_macro_pds_exit(struct lpass_macro *pds)
>  }
>  EXPORT_SYMBOL_GPL(lpass_macro_pds_exit);
>  
> +void lpass_macro_set_codec_version(int version)
> +{
> +	lpass_codec_version = version;
> +}
> +EXPORT_SYMBOL_GPL(lpass_macro_set_codec_version);
> +
> +int lpass_macro_get_codec_version(void)
> +{
> +	return lpass_codec_version;
> +}
> +EXPORT_SYMBOL_GPL(lpass_macro_get_codec_version);

Is it really just a global variable, no locking, no device?

> +
>  MODULE_DESCRIPTION("Common macro driver");
>  MODULE_LICENSE("GPL");
> diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
> index d98718b3dc4b..f6f1bfe8eb77 100644
> --- a/sound/soc/codecs/lpass-macro-common.h
> +++ b/sound/soc/codecs/lpass-macro-common.h
> @@ -18,6 +18,18 @@ enum lpass_version {
>  	LPASS_VER_11_0_0,
>  };
>  
> +enum lpass_codec_version {
> +	LPASS_CODEC_VERSION_1_0 = 1,
> +	LPASS_CODEC_VERSION_1_1,
> +	LPASS_CODEC_VERSION_1_2,
> +	LPASS_CODEC_VERSION_2_0,
> +	LPASS_CODEC_VERSION_2_1,
> +	LPASS_CODEC_VERSION_2_5,
> +	LPASS_CODEC_VERSION_2_6,
> +	LPASS_CODEC_VERSION_2_7,
> +	LPASS_CODEC_VERSION_2_8,
> +};
> +
>  struct lpass_macro {
>  	struct device *macro_pd;
>  	struct device *dcodec_pd;
> @@ -25,5 +37,28 @@ struct lpass_macro {
>  
>  struct lpass_macro *lpass_macro_pds_init(struct device *dev);
>  void lpass_macro_pds_exit(struct lpass_macro *pds);
> +void lpass_macro_set_codec_version(int version);
> +int lpass_macro_get_codec_version(void);
> +
> +static inline const char *lpass_macro_get_codec_version_string(int version)
> +{
> +	switch (version) {
> +	case LPASS_CODEC_VERSION_2_0:
> +		return "v2.0";
> +	case LPASS_CODEC_VERSION_2_1:
> +		return "v2.1";
> +	case LPASS_CODEC_VERSION_2_5:
> +		return "v2.5";
> +	case LPASS_CODEC_VERSION_2_6:
> +		return "v2.6";
> +	case LPASS_CODEC_VERSION_2_7:
> +		return "v2.7";
> +	case LPASS_CODEC_VERSION_2_8:
> +		return "v2.8";
> +	default:
> +		break;
> +	}
> +	return "NA";
> +}
>  
>  #endif /* __LPASS_MACRO_COMMON_H__ */
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index 6eceeff10bf6..0ae9e6377e3a 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -1461,6 +1461,33 @@ static int va_macro_validate_dmic_sample_rate(u32 dmic_sample_rate,
>  	return dmic_sample_rate;
>  }
>  
> +static void va_macro_set_lpass_codec_version(struct va_macro *va)
> +{
> +	int core_id_0 = 0, core_id_1 = 0, core_id_2 = 0, version;
> +
> +	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_0, &core_id_0);
> +	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_1, &core_id_1);
> +	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_2, &core_id_2);
> +
> +	if ((core_id_0 == 0x01) && (core_id_1 == 0x0F))
> +		version = LPASS_CODEC_VERSION_2_0;
> +	if ((core_id_0 == 0x02) && (core_id_1 == 0x0E))
> +		version = LPASS_CODEC_VERSION_2_1;
> +	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x50 || core_id_2 == 0x51))
> +		version = LPASS_CODEC_VERSION_2_5;
> +	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x60 || core_id_2 == 0x61))
> +		version = LPASS_CODEC_VERSION_2_6;
> +	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x70 || core_id_2 == 0x71))
> +		version = LPASS_CODEC_VERSION_2_7;
> +	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x80 || core_id_2 == 0x81))
> +		version = LPASS_CODEC_VERSION_2_8;
> +
> +	lpass_macro_set_codec_version(version);
> +
> +	dev_info(va->dev, "LPASS Codec Version %s\n",
> +			lpass_macro_get_codec_version_string(version));

dev_dbg, please.

> +}
> +
>  static int va_macro_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1554,6 +1581,8 @@ static int va_macro_probe(struct platform_device *pdev)
>  			goto err_npl;
>  	}
>  
> +	va_macro_set_lpass_codec_version(va);
> +
>  	if (va->has_swr_master) {
>  		/* Set default CLK div to 1 */
>  		regmap_update_bits(va->regmap, CDC_VA_TOP_CSR_SWR_MIC_CTL0,
> -- 
> 2.21.0
> 

-- 
With best wishes
Dmitry

