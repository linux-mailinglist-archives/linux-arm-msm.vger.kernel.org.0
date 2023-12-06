Return-Path: <linux-arm-msm+bounces-3514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2570A80692B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 09:10:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D2D21C2112D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 08:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666CF17738;
	Wed,  6 Dec 2023 08:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zkJLkAI5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCDD410FC
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 00:10:33 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40bda47c489so48060915e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 00:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701850232; x=1702455032; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+gV9P+LLtbcV288f8bcnkug+5SdmrVHFSfaWr3WP8M=;
        b=zkJLkAI5tJzixB+SER/ohWSLc9yn+D0STy4lXbPvfX3eBwf2gNvw9PqtBHuZuMID/t
         ykwv0S165SjuocrOIs6c6KW94zONSsBZbehCa8tCNSt5TZ5cb+bEj5H/zzocqi1y6p6b
         EMM+/ZFgBLFLpBG8hPXkqHASbr2IwGfijXp9PUJllzvS6hBioroLWRoXEQIkIFJmdZaT
         OtAwu/rB6zqlxGg45h7t10rkuxagYZ3XLIaSQ0AeKJ0QtCUlb7JlFFFCzHZwdcqQX0d4
         WBGmGP3RT+ksS+Mv4UbwKCZuM1J6UtCHkOLcoxlee9ZkG/mIzmtNfB2kMBIoSgAqrVRO
         5WDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701850232; x=1702455032;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F+gV9P+LLtbcV288f8bcnkug+5SdmrVHFSfaWr3WP8M=;
        b=t4XZ4KSxDzm+ZUgT1HmjRe+GHiarpcgP6jaCAJSKWiFOCBV0fF/yMbC1gCx/mVBUHF
         Pv0kA+ql+xPT7JiOtP9r0RR6kRcm57j8p/d9Z79JbsOAur4ZEHloypkpRhmQ0O2EM2R7
         Vbddr1S4BOcsbhbi5ZO4I2qCCXm2sEeMBQ0GD6NzsqfLcO4IZOjfZH0INkhaYJuoY7WE
         TO69JJF0gvt/L6s8t1PpaXOXn4nANkoYjYup+EE899yvmHN72cS/lBVyfSqs3+DAdy61
         NfOelXKtbsnxELh7Z9mGZkfFB2cZgsm0NzP4jJLssVjszmhOVrNd2bZCE+xIC7gJi0Q9
         Fl3g==
X-Gm-Message-State: AOJu0YxUwGI0+try0mfaWtGdZWIra6NWkpWBy5vbndSX5z/IGLkCxsRr
	bD4SbU01Wz0EXyangT2DrzqdLA==
X-Google-Smtp-Source: AGHT+IF3+jzIgYagYuozgaSQvR5QgLTRcig4lGIsn6hG2LwuH0IBqpbb5tT5ziahhcs3FJWNjZfgbA==
X-Received: by 2002:a7b:cb91:0:b0:40b:5e59:c591 with SMTP id m17-20020a7bcb91000000b0040b5e59c591mr305772wmi.187.1701850231928;
        Wed, 06 Dec 2023 00:10:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:f855:6075:9365:8b70? ([2a01:e0a:982:cbb0:f855:6075:9365:8b70])
        by smtp.gmail.com with ESMTPSA id v21-20020a05600c471500b0040836519dd9sm21114204wmo.25.2023.12.06.00.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 00:10:31 -0800 (PST)
Message-ID: <99ec05e1-8bcd-48a5-84b6-760ac7c93317@linaro.org>
Date: Wed, 6 Dec 2023 09:10:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 5/5] ASoC: codecs: Add WCD939x Codec driver
Content-Language: en-US, fr
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1a09512c-aaff-4fb6-914e-db755ce6e667@suswa.mountain>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <1a09512c-aaff-4fb6-914e-db755ce6e667@suswa.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dan,

On 06/12/2023 06:39, Dan Carpenter wrote:
> Hi Neil,
> 
> kernel test robot noticed the following build warnings:

Thanks for the report, I'll fix all this
Neil

> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Neil-Armstrong/ASoC-dt-bindings-document-WCD939x-Audio-Codec/20231202-000916
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> patch link:    https://lore.kernel.org/r/20231201-topic-sm8650-upstream-wcd939x-codec-v2-5-94ed814b25aa%40linaro.org
> patch subject: [PATCH v2 5/5] ASoC: codecs: Add WCD939x Codec driver
> config: powerpc64-randconfig-r081-20231204 (https://download.01.org/0day-ci/archive/20231206/202312060127.FLhplIP3-lkp@intel.com/config)
> compiler: powerpc64-linux-gcc (GCC) 13.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060127.FLhplIP3-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202312060127.FLhplIP3-lkp@intel.com/
> 
> New smatch warnings:
> sound/soc/codecs/wcd939x.c:3168 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
> sound/soc/codecs/wcd939x.c:3221 wcd939x_swap_gnd_mic() warn: signedness bug returning '(-22)'
> 
> Old smatch warnings:
> sound/soc/codecs/wcd939x.c:3170 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
> sound/soc/codecs/wcd939x.c:3173 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
> sound/soc/codecs/wcd939x.c:3174 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
> sound/soc/codecs/wcd939x.c:3176 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
> sound/soc/codecs/wcd939x.c:3177 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
> sound/soc/codecs/wcd939x.c:3179 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
> 
> vim +/wcd939x +3168 sound/soc/codecs/wcd939x.c
> 
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3164  static int wcd939x_typec_mux_set(struct typec_mux_dev *mux,
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3165  				 struct typec_mux_state *state)
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3166  {
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3167  	struct wcd939x_priv *wcd939x = typec_mux_get_drvdata(mux);
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01 @3168  	unsigned int previous_mode = wcd939x->typec_mode;
> 
> The Kconfig should probably depend on CONFIG_TYPEC to avoid a crash here.
> 
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3169
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3170  	if (!wcd939x->wcd_mbhc)
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3171  		return -EINVAL;
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3172
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3173  	if (wcd939x->typec_mode != state->mode) {
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3174  		wcd939x->typec_mode = state->mode;
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3175
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3176  		if (wcd939x->typec_mode == TYPEC_MODE_AUDIO)
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3177  			return wcd_mbhc_typec_report_plug(wcd939x->wcd_mbhc);
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3178  		else if (previous_mode == TYPEC_MODE_AUDIO)
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3179  			return wcd_mbhc_typec_report_unplug(wcd939x->wcd_mbhc);
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3180  	}
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3181
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3182  	return 0;
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3183  }
> 
> [ snip ]
> 
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3216  static bool wcd939x_swap_gnd_mic(struct snd_soc_component *component, bool active)
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3217  {
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3218  	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3219
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3220  	if (!wcd939x->typec_analog_mux || !wcd939x->typec_switch)
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01 @3221  		return -EINVAL;
> 
> This is type bool.  return false?
> 
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3222
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3223  	/* Report inversion via Type Switch of USBSS */
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3224  	return typec_switch_set(wcd939x->typec_switch,
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3225  				wcd939x->typec_orientation == TYPEC_ORIENTATION_REVERSE ?
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3226  					TYPEC_ORIENTATION_NORMAL : TYPEC_ORIENTATION_REVERSE);
> 6c302e2f95b1d1 Neil Armstrong 2023-12-01  3227  }
> 


