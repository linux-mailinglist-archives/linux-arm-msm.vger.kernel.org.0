Return-Path: <linux-arm-msm+bounces-57413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C470AB115E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 13:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6569D1BA642D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 11:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FDAF28ECEE;
	Fri,  9 May 2025 11:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yol464HE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E1022D4DF;
	Fri,  9 May 2025 11:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788423; cv=none; b=j4NwX12CeEBAYUILuksM6267r8XZmUiIsa0kznJ9oB7+icKDtRzodzvQJ3dEvWe+qE6rGNo0iEOS0S+3zMGH0iMib3A+6tTWR7d39/Bk7fX/hti428Ik01kx1rDR+gLs7Y3z/T2TiHgFr8yn3zsF8s+myIZ7NUqPFTT3pxrx65Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788423; c=relaxed/simple;
	bh=2Tdk/ggnV2o8yYP333sAqJkvwS68DEaai1lsBGWcxD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=n3+dCizq49wF4iK3dhOBB2FoNwb673UvdavNr/J1iiinJEMkqWrtGF0l7rFBOzyh3FftuHsZQNLj7lLmt47noWJXB6nVrI/xXt2WhWj8qLiypJb6ASmjK349BOzJPKDt88HKEn5uTwPPUtGpuzDtlIkXOgUvYYmuoFyi77uj6XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yol464HE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0036BC4CEE4;
	Fri,  9 May 2025 11:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746788419;
	bh=2Tdk/ggnV2o8yYP333sAqJkvwS68DEaai1lsBGWcxD8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Yol464HEg9vqDFyUQwRQdKN1UWEhk9KYXiCXOeDP9VA9AHis3MlaysFFHGzKZx+Xj
	 ta32azC/YHYsNNUqJCMxCFf24taYkWZY2u0ma6FjzV48ySRS2vIRIeBKG8eNxHd9L5
	 h9Cp1J5bqPLrX4bjTQoNDsTSbIaHWeTdglyJglnmeZDc4yw3pzL/YEeK63Jhi2G+c2
	 lqZQuuVqjsiJj0VGruvTexguP6vBUJr23uoclvwLiMK0HS9ZqNZKpo7wOHDv8sBtu2
	 9a0t2UnHlSPZ0ucGYNUeLMrinF5/7ZB9pNlb4WkdYlRqJKSlybS5ezPLnTdpZFediB
	 dRJigYvY+eHXw==
Message-ID: <c797e8b2-9d9b-4fc2-a8bd-f88cadcc94b6@kernel.org>
Date: Fri, 9 May 2025 12:00:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ASoC: qcom: use drvdata instead of component to keep
 id
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <87a57o2amc.wl-kuninori.morimoto.gx@renesas.com>
 <878qn82alv.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <878qn82alv.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Thanks for the patch,

On 5/8/25 01:46, Kuninori Morimoto wrote:
> qcom lpass is using component->id to keep DAI ID (A).
> 
> (S)	static int lpass_platform_pcmops_open(
> 				sruct snd_soc_component *component,
> 				struct snd_pcm_substream *substream)
> 	{			                          ^^^^^^^^^(B0)
> 		...
> (B1)		struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
> (B2)		struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
> 		...
> (B3)		unsigned int dai_id = cpu_dai->driver->id;
> 
> (A)		component->id = dai_id;
> 		...
> 	}
> 
> This driver can get dai_id from substream (B0 - B3).
> In this driver, below functions get dai_id from component->id (A).
> 
> (X)	lpass_platform_pcmops_suspend()
> (Y)	lpass_platform_pcmops_resume()
> (Z)	lpass_platform_copy()
> 
> Here, (Z) can get it from substream (B0 - B3), don't need to use
> component->id (A). On suspend/resume (X)(Y), dai_id can only be obtained
> from component->id (A), because there is no substream (B0) in function
> parameter.
> 
> But, component->id (A) itself should not be used for such purpose.
> It is intilialized at snd_soc_component_initialize(), and parsed its ID
> (= component->id) from device name (a).
> 
> 	int snd_soc_component_initialize(...)
> 	{
> 		...
> 		if (!component->name) {
> (a)			component->name = fmt_single_name(dev, &component->id);
> 			...                                     ^^^^^^^^^^^^^
> 		}
> 		...
> 	}
> 
> On this driver, drvdata : component = 1 : 1 relatationship (b)
> 
> (b)	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
> 
> drvdata can be used on lpass_platform_pcmops_open() (S),
> lpass_platform_pcmops_suspend()/lpass_platform_pcmops_resume() (X)(Y).
> 
> We can keep dai_id on drvdata->id instead of component->id (A). Let's do it.
> 
Current code seems to be broken to start with.
May be we can fix that and also get rid of usage of component->id together.

From what I see that there are many regmaps that the driver cares about
however its only managing one(either dp or i2s) in component suspend
resume-path.

i2s regmap is mandatory however other regmaps are setup based on flags
like hdmi_port_enable and codec_dma_enable.

correct thing for suspend resume path to handle is by checking these
flags, instead of using component->id.

------------------>cut<----------------------------------
diff --git a/sound/soc/qcom/lpass-platform.c
b/sound/soc/qcom/lpass-platform.c
index 9946f12254b3..d8b0a637b1c6 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -202,7 +202,6 @@ static int lpass_platform_pcmops_open(struct
snd_soc_component *component,
        struct regmap *map;
        unsigned int dai_id = cpu_dai->driver->id;

-       component->id = dai_id;
        data = kzalloc(sizeof(*data), GFP_KERNEL);
        if (!data)
                return -ENOMEM;
@@ -1190,13 +1189,14 @@ static int lpass_platform_pcmops_suspend(struct
snd_soc_component *component)
 {
        struct lpass_data *drvdata =
snd_soc_component_get_drvdata(component);
        struct regmap *map;
-       unsigned int dai_id = component->id;

-       if (dai_id == LPASS_DP_RX)
+       if (drvdata->hdmi_port_enable) {
                map = drvdata->hdmiif_map;
-       else
-               map = drvdata->lpaif_map;
+               regcache_cache_only(map, true);
+               regcache_mark_dirty(map);
+       }

+       map = drvdata->lpaif_map;
        regcache_cache_only(map, true);
        regcache_mark_dirty(map);

@@ -1207,15 +1207,21 @@ static int lpass_platform_pcmops_resume(struct
snd_soc_component *component)
 {
        struct lpass_data *drvdata =
snd_soc_component_get_drvdata(component);
        struct regmap *map;
-       unsigned int dai_id = component->id;
+       int ret;

-       if (dai_id == LPASS_DP_RX)
+       if (drvdata->hdmi_port_enable) {
                map = drvdata->hdmiif_map;
-       else
-               map = drvdata->lpaif_map;
+               regcache_cache_only(map, false);
+               ret = regcache_sync(map);
+               if (ret)
+                       return ret;
+       }

+       map = drvdata->lpaif_map;
        regcache_cache_only(map, false);
+
        return regcache_sync(map);
 }

 static int lpass_platform_copy(struct snd_soc_component *component,
@@ -1224,7 +1230,9 @@ static int lpass_platform_copy(struct
snd_soc_component *component,
                               unsigned long bytes)
 {
        struct snd_pcm_runtime *rt = substream->runtime;
-       unsigned int dai_id = component->id;
+       struct snd_soc_pcm_runtime *soc_runtime =
snd_soc_substream_to_rtd(substream);
+       struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
+       unsigned int dai_id = cpu_dai->driver->id;
        int ret = 0;

        void __iomem *dma_buf = (void __iomem *) (rt->dma_area + pos +
-------------------->cut<-----------------------

--srini	
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/qcom/lpass-platform.c | 10 ++++++----
>  sound/soc/qcom/lpass.h          |  1 +
>  2 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index 9946f12254b3..676018b8134a 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -202,7 +202,7 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
>  	struct regmap *map;
>  	unsigned int dai_id = cpu_dai->driver->id;
>  
> -	component->id = dai_id;
> +	drvdata->id = dai_id;
>  	data = kzalloc(sizeof(*data), GFP_KERNEL);
>  	if (!data)
>  		return -ENOMEM;
> @@ -1190,7 +1190,7 @@ static int lpass_platform_pcmops_suspend(struct snd_soc_component *component)
>  {
>  	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
>  	struct regmap *map;
> -	unsigned int dai_id = component->id;
> +	unsigned int dai_id = drvdata->id;
>  
>  	if (dai_id == LPASS_DP_RX)
>  		map = drvdata->hdmiif_map;
> @@ -1207,7 +1207,7 @@ static int lpass_platform_pcmops_resume(struct snd_soc_component *component)
>  {
>  	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
>  	struct regmap *map;
> -	unsigned int dai_id = component->id;
> +	unsigned int dai_id = drvdata->id;
>  
>  	if (dai_id == LPASS_DP_RX)
>  		map = drvdata->hdmiif_map;
> @@ -1224,7 +1224,9 @@ static int lpass_platform_copy(struct snd_soc_component *component,
>  			       unsigned long bytes)
>  {
>  	struct snd_pcm_runtime *rt = substream->runtime;
> -	unsigned int dai_id = component->id;
> +	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
> +	unsigned int dai_id = cpu_dai->driver->id;
>  	int ret = 0;
>  
>  	void __iomem *dma_buf = (void __iomem *) (rt->dma_area + pos +
> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
> index de3ec6f594c1..7663dafef18a 100644
> --- a/sound/soc/qcom/lpass.h
> +++ b/sound/soc/qcom/lpass.h
> @@ -93,6 +93,7 @@ struct lpaif_dmactl {
>  
>  /* Both the CPU DAI and platform drivers will access this data */
>  struct lpass_data {
> +	int id;
>  
>  	/* AHB-I/X bus clocks inside the low-power audio subsystem (LPASS) */
>  	struct clk *ahbix_clk;


