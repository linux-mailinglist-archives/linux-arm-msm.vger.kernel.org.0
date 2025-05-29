Return-Path: <linux-arm-msm+bounces-59799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66485AC7B05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 11:29:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22D3C17EC9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 09:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 626E821C9E0;
	Thu, 29 May 2025 09:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MrYV0FHd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39612214232;
	Thu, 29 May 2025 09:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748510941; cv=none; b=YCk7qTJkY+Rwn+VY31eLCC2aKWOMaGhkV7QNlCzOrHjleSi4tiYLRgRo6AbCpfzP76+Urz+N2zhWF09B27rcJ/IJ+eErTSXIr9zRDQQaCv6RtzCtJcppzNZ4EM3LkE1960HoF3yjBdOvSIlhucu2I1IFM9AziATkQY51sVL7suE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748510941; c=relaxed/simple;
	bh=spEV9ue8lpgqikSwTwjY7Vm1up+ErcHyiwchXneWVmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YW0r/s0WxEWzHRJsbjk0cb6rNcEsdJdyG0EWk8HDJ+32kuCnMJbjAZxLXeVs7HbfmSMb0ySDE19ftbjFeTBKRnZ3FbEVPtosrstjxI+yPiRvfWdwYdT26LMYuRL3PkBcAZzvVh5PuhyTsjepx2ExunL3VAs/smqvNujEjRbRJDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MrYV0FHd; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf680d351so11909785e9.0;
        Thu, 29 May 2025 02:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748510936; x=1749115736; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d7Qgkw+FjtErEbydIY5tdmXfEMzQTCAQIwwevRaOxjo=;
        b=MrYV0FHdIHwmglqjHHjYjlGFXAXZLIFg1IG2nFrEHlSN/yKuVkMR39UuMnTfgafpfO
         DdOcENl/glwhX4tZvp+zQRBW7y//Wla2t67ubIJ8CoCxkH04A9w/APiS1FhbQwBy95rH
         sA7NjPYrW3yyxjRW7lhDaifQBICON5H96mWClnBUKb0nXJXOe2i3ZKGtjHgGGgfbCkp8
         i9PAx2N7xv4WqXwLrbJODgfxuZ8i3N0VeONHLmhwRqqF01wCbvbxANPb/tY3eeyw9LvN
         +RlF8AIQobi6RFkIkfF5DT/rrObU2sMTN64vykkShylyW0kyGNiIByP2+u11FtjVJcJe
         1kwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748510936; x=1749115736;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d7Qgkw+FjtErEbydIY5tdmXfEMzQTCAQIwwevRaOxjo=;
        b=Dmbaps3jOhHdtPLzfKYkSLnvElUnCID+Qc2UW+kEsOCUgPAu8shO5423H/s7gsp/mx
         J2Ci5PT1T0ojGpzukPNSCjQ4DyPqiYS1cNruC75uVlK7N6dOfEs6iDlx31YRTbhLDqtc
         T9d0bxBw6q2XnvWbVkrTaQfc09gql5fYjN204arIkVjxaKhJZCiIakhTyAb9dtAkFqRL
         XvgN/4WZ5QwCK8wCNz/AarjR7UwBkxagHPxv/KrUGnr/9yFjonaU8e+7926B04frb/D7
         8sXEDLHA9CMveHYs6K4XPLrcZvpm/V1RiPtWA5O8LcwOLlq5vDueuesaNHUzMqh6xq/i
         KlMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgMjJQ8UA9YqxNEyHip9GW/nHidKue/ru9pv471FuqdG6jpUyl3E9CNdr892gLj1Z+wCJA9RqkSDGT6pXW@vger.kernel.org, AJvYcCWtaQdgT48cUgKZsaSKQETcfagePE6wQUQK4Qmo6fR0Qrz68eEWgs3PhvuV+Ujhqi/5IsQ8WxRAIII1f3a7@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz8oWM1sD6Z+12gwZn5Hm+7G210NGzJg52DjldjOAanLJrQKqU
	4HgkkbVBCcnSWzkio0W1OcqdRIrOdNU61jnP+ZVIIUnezxIwvPtG4XM6
X-Gm-Gg: ASbGncvRRy+QQAx0c6Y0Kt0rNF9Lif85SgHiQ1h8NvnIEyAtKBHyPGCew/VqJ/jEY5p
	3vKmRn35GQjbfLx6oKyx3j/c8vFWjKYLNTbn2nGK7JtYXacBDEJrrkF2nPbuFANfn1cUth7cpad
	Oh8DphiAsYBjxSPU6zc5/oohjqGmBRoyjQFenPtqyKmWDL92jqOp1v2R4fpwGdFSwAvAEzG3CKa
	AadFwd3CC5TNco4Ut0A7aU5c9UwlJbWhfzucA+/6wIWhWE3f9oUbm9xDPgsc6hFnVGomm1Azsqx
	eCTRYvlt0eEqhZSHfz6fTMyTkm1DgtZqgygSite7VJ+A/bx53uHYpryXX8w=
X-Google-Smtp-Source: AGHT+IFyob3sOyeaThAioC5DaGtLkXgmUWKgiG2MIRAU2xX+mObPRH4YL11OEXgTlKMuuUSMYg+PQw==
X-Received: by 2002:a05:6000:290a:b0:3a3:7ba5:9a68 with SMTP id ffacd0b85a97d-3a4eeda32c5mr2216564f8f.18.1748510936105;
        Thu, 29 May 2025 02:28:56 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe2b35dsm1442285f8f.0.2025.05.29.02.28.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 02:28:55 -0700 (PDT)
Message-ID: <dcd4174f-c3b2-4686-b429-68ec378f9a6c@gmail.com>
Date: Thu, 29 May 2025 10:28:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] ASoC: codecs: Constify regmap configuration static
 variables
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Oder Chiou <oder_chiou@realtek.com>, Srinivas Kandagatla <srini@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
 <20250528-asoc-const-unused-v1-1-19a5d07b9d5c@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srini.kernel@gmail.com>
In-Reply-To: <20250528-asoc-const-unused-v1-1-19a5d07b9d5c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/28/25 8:59 PM, Krzysztof Kozlowski wrote:
> Static arrays/structs for regmap configuration like 'struct
> reg_default', 'struct reg_sequence' and others are not modified so can
> be changed to const for more safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/cs35l36.c        | 2 +-
>  sound/soc/codecs/da7218.c         | 2 +-
>  sound/soc/codecs/da7219.c         | 4 ++--
>  sound/soc/codecs/es8375.c         | 2 +-
>  sound/soc/codecs/max98363.c       | 2 +-
>  sound/soc/codecs/max98373-i2c.c   | 2 +-
>  sound/soc/codecs/max98373-sdw.c   | 2 +-
>  sound/soc/codecs/max98388.c       | 2 +-
>  sound/soc/codecs/max98390.c       | 2 +-
>  sound/soc/codecs/max98396.c       | 4 ++--
>  sound/soc/codecs/max98504.c       | 2 +-
>  sound/soc/codecs/max98520.c       | 2 +-
>  sound/soc/codecs/max98927.c       | 2 +-
>  sound/soc/codecs/rt722-sdca-sdw.c | 2 +-
>  sound/soc/codecs/wcd938x.c        | 2 +-
>  sound/soc/codecs/wsa881x.c        | 4 ++--
>  sound/soc/codecs/wsa883x.c        | 2 +-
>  sound/soc/codecs/wsa884x.c        | 2 +-

For sound/soc/codecs/wsa* an sound/soc/codecs/wcd*

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  18 files changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
> index b49c6905e8727d7c07fd10e668507ca07bf2cff5..b60697ff7a506dccf3dba1b01faa985761bbbc42 100644
> --- a/sound/soc/codecs/cs35l36.c
> +++ b/sound/soc/codecs/cs35l36.c
> @@ -129,7 +129,7 @@ static const struct cs35l36_pll_config cs35l36_pll_sysclk[] = {
>  	{27000000,	0x3F, 0x0A},
>  };
>  
> -static struct reg_default cs35l36_reg[] = {
> +static const struct reg_default cs35l36_reg[] = {
>  	{CS35L36_TESTKEY_CTRL,			0x00000000},
>  	{CS35L36_USERKEY_CTL,			0x00000000},
>  	{CS35L36_OTP_CTRL1,			0x00002460},
> diff --git a/sound/soc/codecs/da7218.c b/sound/soc/codecs/da7218.c
> index 5f2f67e3bd29240acfa0d53a0892c8e92f711c1f..a7539e1a18939683558accd207b57324a1ce6aeb 100644
> --- a/sound/soc/codecs/da7218.c
> +++ b/sound/soc/codecs/da7218.c
> @@ -3033,7 +3033,7 @@ static const struct snd_soc_component_driver soc_component_dev_da7218 = {
>   * Regmap configs
>   */
>  
> -static struct reg_default da7218_reg_defaults[] = {
> +static const struct reg_default da7218_reg_defaults[] = {
>  	{ DA7218_SYSTEM_ACTIVE, 0x00 },
>  	{ DA7218_CIF_CTRL, 0x00 },
>  	{ DA7218_SPARE1, 0x00 },
> diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
> index 3958e88a244563c81b373cab38bc221fc8ba795e..221577574525a5fd60180a4441331d7db88f50e2 100644
> --- a/sound/soc/codecs/da7219.c
> +++ b/sound/soc/codecs/da7219.c
> @@ -2312,7 +2312,7 @@ static void da7219_handle_pdata(struct snd_soc_component *component)
>   * Regmap configs
>   */
>  
> -static struct reg_default da7219_reg_defaults[] = {
> +static const struct reg_default da7219_reg_defaults[] = {
>  	{ DA7219_MIC_1_SELECT, 0x00 },
>  	{ DA7219_CIF_TIMEOUT_CTRL, 0x01 },
>  	{ DA7219_SR_24_48, 0x00 },
> @@ -2443,7 +2443,7 @@ static const struct regmap_config da7219_regmap_config = {
>  	.cache_type = REGCACHE_RBTREE,
>  };
>  
> -static struct reg_sequence da7219_rev_aa_patch[] = {
> +static const struct reg_sequence da7219_rev_aa_patch[] = {
>  	{ DA7219_REFERENCES, 0x08 },
>  };
>  
> diff --git a/sound/soc/codecs/es8375.c b/sound/soc/codecs/es8375.c
> index decc86c92427c0c61a1531fb0fed1d9b853449d5..d12b3dc9e1f7fc03b8737e6b001b44c0d51c1b93 100644
> --- a/sound/soc/codecs/es8375.c
> +++ b/sound/soc/codecs/es8375.c
> @@ -619,7 +619,7 @@ static bool es8375_writeable_register(struct device *dev, unsigned int reg)
>  	}
>  }
>  
> -static struct regmap_config es8375_regmap_config = {
> +static const struct regmap_config es8375_regmap_config = {
>  	.reg_bits = 8,
>  	.val_bits = 8,
>  	.max_register = ES8375_REG_MAX,
> diff --git a/sound/soc/codecs/max98363.c b/sound/soc/codecs/max98363.c
> index 950105e5bffdc2c7606e10e7af6f3cf97ece5b4c..fd6830a7579d4860c8bc4fdd26d05698834ddcc2 100644
> --- a/sound/soc/codecs/max98363.c
> +++ b/sound/soc/codecs/max98363.c
> @@ -14,7 +14,7 @@
>  
>  #include "max98363.h"
>  
> -static struct reg_default max98363_reg[] = {
> +static const struct reg_default max98363_reg[] = {
>  	{MAX98363_R2021_ERR_MON_CTRL, 0x0},
>  	{MAX98363_R2022_SPK_MON_THRESH, 0x0},
>  	{MAX98363_R2023_SPK_MON_DURATION, 0x0},
> diff --git a/sound/soc/codecs/max98373-i2c.c b/sound/soc/codecs/max98373-i2c.c
> index 56c4ba1f37826f279df4007b0de36fa932257b8f..f58b8c8625a7061fc9564c9f84dd95d77df33b72 100644
> --- a/sound/soc/codecs/max98373-i2c.c
> +++ b/sound/soc/codecs/max98373-i2c.c
> @@ -23,7 +23,7 @@ static const u32 max98373_i2c_cache_reg[] = {
>  	MAX98373_R20B6_BDE_CUR_STATE_READBACK,
>  };
>  
> -static struct reg_default max98373_reg[] = {
> +static const struct reg_default max98373_reg[] = {
>  	{MAX98373_R2000_SW_RESET, 0x00},
>  	{MAX98373_R2001_INT_RAW1, 0x00},
>  	{MAX98373_R2002_INT_RAW2, 0x00},
> diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
> index 6088278e6503dc7ea743ccc439cd6365c7475017..43b52bda6ad5297d856123aa515e0019f4866097 100644
> --- a/sound/soc/codecs/max98373-sdw.c
> +++ b/sound/soc/codecs/max98373-sdw.c
> @@ -26,7 +26,7 @@ static const u32 max98373_sdw_cache_reg[] = {
>  	MAX98373_R20B6_BDE_CUR_STATE_READBACK,
>  };
>  
> -static struct reg_default max98373_reg[] = {
> +static const struct reg_default max98373_reg[] = {
>  	{MAX98373_R0040_SCP_INIT_STAT_1, 0x00},
>  	{MAX98373_R0041_SCP_INIT_MASK_1, 0x00},
>  	{MAX98373_R0042_SCP_INIT_STAT_2, 0x00},
> diff --git a/sound/soc/codecs/max98388.c b/sound/soc/codecs/max98388.c
> index 99986090b4a63a9759763881f3004d0e509e53cd..076f15a9867e13527324354cd6364ade3bca4846 100644
> --- a/sound/soc/codecs/max98388.c
> +++ b/sound/soc/codecs/max98388.c
> @@ -18,7 +18,7 @@
>  #include <sound/tlv.h>
>  #include "max98388.h"
>  
> -static struct reg_default max98388_reg[] = {
> +static const struct reg_default max98388_reg[] = {
>  	{MAX98388_R2000_SW_RESET, 0x00},
>  	{MAX98388_R2001_INT_RAW1, 0x00},
>  	{MAX98388_R2002_INT_RAW2, 0x00},
> diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
> index 76296176f9486f72a9d6077a0c69a475e277ed88..a8a282ff9fc5abfbf6c6bdc7fc209ed15bda0cfd 100644
> --- a/sound/soc/codecs/max98390.c
> +++ b/sound/soc/codecs/max98390.c
> @@ -23,7 +23,7 @@
>  
>  #include "max98390.h"
>  
> -static struct reg_default max98390_reg_defaults[] = {
> +static const struct reg_default max98390_reg_defaults[] = {
>  	{MAX98390_INT_EN1, 0xf0},
>  	{MAX98390_INT_EN2, 0x00},
>  	{MAX98390_INT_EN3, 0x00},
> diff --git a/sound/soc/codecs/max98396.c b/sound/soc/codecs/max98396.c
> index c1888cd83dbc6fe2d418012dc1a9b1c58c3ded86..4b4e1fc98a6da5bf3a713133ce974b2f09161ed4 100644
> --- a/sound/soc/codecs/max98396.c
> +++ b/sound/soc/codecs/max98396.c
> @@ -16,7 +16,7 @@ static const char * const max98396_core_supplies[MAX98396_NUM_CORE_SUPPLIES] = {
>  	"dvddio",
>  };
>  
> -static struct reg_default max98396_reg[] = {
> +static const struct reg_default max98396_reg[] = {
>  	{MAX98396_R2000_SW_RESET, 0x00},
>  	{MAX98396_R2001_INT_RAW1, 0x00},
>  	{MAX98396_R2002_INT_RAW2, 0x00},
> @@ -174,7 +174,7 @@ static struct reg_default max98396_reg[] = {
>  	{MAX98396_R21FF_REVISION_ID, 0x00},
>  };
>  
> -static struct reg_default max98397_reg[] = {
> +static const struct reg_default max98397_reg[] = {
>  	{MAX98396_R2000_SW_RESET, 0x00},
>  	{MAX98396_R2001_INT_RAW1, 0x00},
>  	{MAX98396_R2002_INT_RAW2, 0x00},
> diff --git a/sound/soc/codecs/max98504.c b/sound/soc/codecs/max98504.c
> index 6b6a7ece4cecc3d114da276faf859c8176955300..c94142768c818228aae8b90c636cfd6b496e9859 100644
> --- a/sound/soc/codecs/max98504.c
> +++ b/sound/soc/codecs/max98504.c
> @@ -35,7 +35,7 @@ struct max98504_priv {
>  	unsigned int brownout_release_rate;
>  };
>  
> -static struct reg_default max98504_reg_defaults[] = {
> +static const struct reg_default max98504_reg_defaults[] = {
>  	{ 0x01,	0},
>  	{ 0x02,	0},
>  	{ 0x03,	0},
> diff --git a/sound/soc/codecs/max98520.c b/sound/soc/codecs/max98520.c
> index adf5a898c6df5b10661861f6329ca54db6445f1a..2bf8976c1828210d2e6106f08e571df650640606 100644
> --- a/sound/soc/codecs/max98520.c
> +++ b/sound/soc/codecs/max98520.c
> @@ -16,7 +16,7 @@
>  #include <sound/tlv.h>
>  #include "max98520.h"
>  
> -static struct reg_default max98520_reg[] = {
> +static const struct reg_default max98520_reg[] = {
>  	{MAX98520_R2000_SW_RESET, 0x00},
>  	{MAX98520_R2001_STATUS_1, 0x00},
>  	{MAX98520_R2002_STATUS_2, 0x00},
> diff --git a/sound/soc/codecs/max98927.c b/sound/soc/codecs/max98927.c
> index 55cc18451a2d26e0ad72031d5017d68c215240ef..0e9b8970997cf6485a775a3187b1470f93b5c057 100644
> --- a/sound/soc/codecs/max98927.c
> +++ b/sound/soc/codecs/max98927.c
> @@ -19,7 +19,7 @@
>  #include <sound/tlv.h>
>  #include "max98927.h"
>  
> -static struct reg_default max98927_reg[] = {
> +static const struct reg_default max98927_reg[] = {
>  	{MAX98927_R0001_INT_RAW1,  0x00},
>  	{MAX98927_R0002_INT_RAW2,  0x00},
>  	{MAX98927_R0003_INT_RAW3,  0x00},
> diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
> index 609ca0d6c83a1f28c73a0981f2a8f857816e5eb2..70700bdb80a14374321d1d8d8744356484ac01ac 100644
> --- a/sound/soc/codecs/rt722-sdca-sdw.c
> +++ b/sound/soc/codecs/rt722-sdca-sdw.c
> @@ -147,7 +147,7 @@ static int rt722_sdca_mbq_size(struct device *dev, unsigned int reg)
>  	}
>  }
>  
> -static struct regmap_sdw_mbq_cfg rt722_mbq_config = {
> +static const struct regmap_sdw_mbq_cfg rt722_mbq_config = {
>  	.mbq_size = rt722_sdca_mbq_size,
>  };
>  
> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
> index d9b61eab029af3d4782620ee017fc84fbd26ce0b..342d1f7d5dee3ac2d703e5b5602aef9ca2987158 100644
> --- a/sound/soc/codecs/wcd938x.c
> +++ b/sound/soc/codecs/wcd938x.c
> @@ -275,7 +275,7 @@ static const struct regmap_irq wcd938x_irqs[WCD938X_NUM_IRQS] = {
>  	REGMAP_IRQ_REG(WCD938X_IRQ_HPHR_SURGE_DET_INT, 2, 0x08),
>  };
>  
> -static struct regmap_irq_chip wcd938x_regmap_irq_chip = {
> +static const struct regmap_irq_chip wcd938x_regmap_irq_chip = {
>  	.name = "wcd938x",
>  	.irqs = wcd938x_irqs,
>  	.num_irqs = ARRAY_SIZE(wcd938x_irqs),
> diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
> index 6627d2da372206eff879f8f3bd5fae9ddc0757d7..d479521a6d504ee45797be8ea99206a4b1787f73 100644
> --- a/sound/soc/codecs/wsa881x.c
> +++ b/sound/soc/codecs/wsa881x.c
> @@ -202,7 +202,7 @@
>  	SOC_SINGLE_EXT_TLV(xname, reg, shift, max, invert, \
>  			   snd_soc_get_volsw, wsa881x_put_pa_gain, tlv_array)
>  
> -static struct reg_default wsa881x_defaults[] = {
> +static const struct reg_default wsa881x_defaults[] = {
>  	{ WSA881X_CHIP_ID0, 0x00 },
>  	{ WSA881X_CHIP_ID1, 0x00 },
>  	{ WSA881X_CHIP_ID2, 0x00 },
> @@ -346,7 +346,7 @@ static const struct reg_sequence wsa881x_vi_txfe_en_2_0[] = {
>  };
>  
>  /* Default register reset values for WSA881x rev 2.0 */
> -static struct reg_sequence wsa881x_rev_2_0[] = {
> +static const struct reg_sequence wsa881x_rev_2_0[] = {
>  	{ WSA881X_RESET_CTL, 0x00, 0x00 },
>  	{ WSA881X_TADC_VALUE_CTL, 0x01, 0x00 },
>  	{ WSA881X_INTR_MASK, 0x1B, 0x00 },
> diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
> index f04d99c66f332e18fe4c201f78360416c1607466..13c9d4a6f01537e448a5595f489c1716eb2053f2 100644
> --- a/sound/soc/codecs/wsa883x.c
> +++ b/sound/soc/codecs/wsa883x.c
> @@ -572,7 +572,7 @@ static const struct sdw_port_config wsa883x_pconfig[WSA883X_MAX_SWR_PORTS] = {
>  	},
>  };
>  
> -static struct reg_default wsa883x_defaults[] = {
> +static const struct reg_default wsa883x_defaults[] = {
>  	{ WSA883X_REF_CTRL, 0xD5 },
>  	{ WSA883X_TEST_CTL_0, 0x06 },
>  	{ WSA883X_BIAS_0, 0xD2 },
> diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
> index fd6ebc25fe894a5981df4e39d10d0f27d21c3a25..07d8a2645404ec49d4b12297d79bbddbe2950a4c 100644
> --- a/sound/soc/codecs/wsa884x.c
> +++ b/sound/soc/codecs/wsa884x.c
> @@ -899,7 +899,7 @@ static const struct sdw_port_config wsa884x_pconfig[WSA884X_MAX_SWR_PORTS] = {
>  	},
>  };
>  
> -static struct reg_default wsa884x_defaults[] = {
> +static const struct reg_default wsa884x_defaults[] = {
>  	{ WSA884X_BG_CTRL,			0xa5 },
>  	{ WSA884X_ADC_CTRL,			0x00 },
>  	{ WSA884X_BOP1_PROG,			0x22 },
> 


