Return-Path: <linux-arm-msm+bounces-4261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E0D80D523
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 19:18:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9AB53B20F2F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 18:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4749351032;
	Mon, 11 Dec 2023 18:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dhDVlUW1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 791E5C3
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 10:18:39 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40b27726369so50558575e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 10:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702318718; x=1702923518; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8thYOlqJrQn5jZopD7cqWotGI4PXXg/iBgbJKax2sYY=;
        b=dhDVlUW16eTncYKfQ0GyumZ1IcVXOn3Br/7YgiKQdWBiBNwjIRZqcaI0iwKpvW5LEw
         hvapNTZrZsEloJ1Q+yzeZW1uUe7s6FsKF6vX7ylFKQapQhAaYFJPe2KFXycK9u2dB0+3
         Wl0cY9iuw1yqsrBLyE31NAdy2mbYRhea10xCJSGuekOTaBmNwr6CC5j/KOMtm3MvzEHB
         cgH2aLpAgteRsJqsd+L2wAfmjKcTtYmQeSw9WZvmea5MHIaaC3NZ4/ayrRugXAe+Oqqz
         +GXUhqbhLAHqbed1PzxS0mhxwjvxLen18BWczqO8IGHtMBl5rZw7nFhdOX9AuAyz9M1d
         +7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702318718; x=1702923518;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8thYOlqJrQn5jZopD7cqWotGI4PXXg/iBgbJKax2sYY=;
        b=WR1djsPveQEbLQg01OUN3UeWHBvH6MXRHdwV1UyFyaIpA6Q4g1RHG5qkIsJhdZ4XmN
         lYFKj/9RZblu5xepI7QZTHHBnJ8SuTDTTBPhHvchnN7h+4/oxPY0sS/jZ1yAWoPJDA6/
         HfhPhIHFTKtkU/fSqY2af2yMdbGsza13HbpORb/3nmz9cdI1ewEexFi51bRUZG6uwN6z
         +HIBzPGvwuuYazc8jUQoR3SS0jZfdzjfx6mosEBM/0UsqXmyTCf4spSeOOX/Xy4L1Iuz
         izVj03H5HkHM66JzYSlXVx/flUdg61Dz/mO6+Z000ttUn+ri0HXV2YFR5Hw6LlVECXi5
         nNEg==
X-Gm-Message-State: AOJu0YzZwh8HxNGm26nOYOtZAwNDKT8CdWhgcQsByY07ZxuIyiSsEJ92
	rNAFRmaDg8f6T5n2rYgmX25roTvPLuBX4p5nXGY=
X-Google-Smtp-Source: AGHT+IHQys2ROL69+n2m3sKvTCeLuPfynm3RTxSyxKmW/m2g+YoxnHaaUdNqd8mK4RIukfYejVyC4A==
X-Received: by 2002:a05:600c:41c1:b0:40c:34b7:b849 with SMTP id t1-20020a05600c41c100b0040c34b7b849mr2809673wmh.118.1702318717888;
        Mon, 11 Dec 2023 10:18:37 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id lm11-20020a17090718cb00b00a1db76f99c8sm5223849ejc.93.2023.12.11.10.18.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 10:18:37 -0800 (PST)
Message-ID: <2641a7c9-19ab-4895-ba3e-89306f9dfe2b@linaro.org>
Date: Mon, 11 Dec 2023 18:18:36 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] ASoC: qcom: q6afe: provide fallback for digital
 codec clock
Content-Language: en-US
To: Stephan Gerhold <stephan@gerhold.net>
Cc: =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
 linux-arm-msm@vger.kernel.org, Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-sound@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20231029165716.69878-1-otto.pflueger@abscue.de>
 <20231029165716.69878-3-otto.pflueger@abscue.de>
 <d8ef8fe6-2856-40fc-a95e-5bf68c0f1a8b@linaro.org>
 <ZW2rQ-SsER-HPlF5@gerhold.net>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <ZW2rQ-SsER-HPlF5@gerhold.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stephan,

On 04/12/2023 10:34, Stephan Gerhold wrote:
> Hi Srini,
> 
> On Fri, Nov 17, 2023 at 01:26:43PM +0000, Srinivas Kandagatla wrote:
>> On 29/10/2023 16:57, Otto Pflüger wrote:
>>> When q6afe is used as a clock provider through q6afe-clocks.c, it uses
>>> an interface for setting clocks that is not present in older firmware
>>> versions. However, using Q6AFE_LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE
>>> as the codec MCLK in the device tree can be useful on older platforms
>>> too. Provide a fallback that sets this clock using the old method when
>>> an old firmware version is detected.
>>>
>>> MSM8916 did not need this because of a workaround that controls this
>>> clock directly through the GCC driver, but newer SoCs do not have this
>>> clock in their GCC drivers because it is meant to be controlled by the
>>> DSP.
>>>
>>> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
>>> ---
>>>    sound/soc/qcom/qdsp6/q6afe.c | 26 ++++++++++++++++++++++++++
>>>    1 file changed, 26 insertions(+)
>>>
>>> diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
>>> index 91d39f6ad0bd..f14d3b366aa4 100644
>>> --- a/sound/soc/qcom/qdsp6/q6afe.c
>>> +++ b/sound/soc/qcom/qdsp6/q6afe.c
>>> @@ -1111,6 +1111,32 @@ int q6afe_set_lpass_clock(struct device *dev, int clk_id, int attri,
>>>    	struct q6afe *afe = dev_get_drvdata(dev->parent);
>>>    	struct afe_clk_set cset = {0,};
>>> +	/*
>>> +	 * v2 clocks specified in the device tree may not be supported by the
>>> +	 * firmware. If this is the digital codec core clock, fall back to the
>>> +	 * old method for setting it.
>>> +	 */
>>> +	if (q6core_get_adsp_version() < Q6_ADSP_VERSION_2_7) {
>>> +		struct q6afe_port *port;
>>> +		struct afe_digital_clk_cfg dcfg = {0,};
>>> +		int ret;
>>> +
>>> +		if (clk_id != Q6AFE_LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE)
>>> +			return -EINVAL;
>>> +
>>> +		port = q6afe_port_get_from_id(dev, PRIMARY_MI2S_RX);
>>> +		if (IS_ERR(port))
>>> +			return PTR_ERR(port);
>>> +
>>> +		dcfg.i2s_cfg_minor_version = AFE_API_VERSION_I2S_CONFIG;
>>> +		dcfg.clk_val = freq;
>>> +		dcfg.clk_root = 5;
>>> +		ret = q6afe_set_digital_codec_core_clock(port, &dcfg);
>>> +
>>> +		q6afe_port_put(port);
>>
>> This redirection of clks looks totally confusing and hacky.
>> Why can not we do this from machine driver based something like this:
>>
>> if (q6core_get_adsp_version() < Q6_ADSP_VERSION_2_7)
>> 	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_DIG_CLK, freq, 0);
>>
> 
> Unfortunately this doesn't work for the digital codec clock. This clock
> is consumed and dynamically controlled by the msm8916-wcd-digital driver
> via the clk subsystem, not via ASoC sysclks.

Thankyou for explaining this, I see the issue, older firmware versions 
do not support setting internal digital codec core clock via 
AFE_PARAM_ID_CLOCK_SET.

we could do a better job here to allow NULL port arguments to 
q6afe_port_set_param_v2 and make this look much better.

Could you also add asoc mailing list in CC, I somehow missed these emails.


something like this should be much cleaner:

--------------------------------------->cut<----------------------------------

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 91d39f6ad0bd..8dec2c6c7bba 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -1031,14 +1031,13 @@ static int q6afe_port_set_param(struct 
q6afe_port *port, void *data,
                                psize, port->token);
  }

-static int q6afe_port_set_param_v2(struct q6afe_port *port, void *data,
+static int q6afe_port_set_param_v2(struct q6afe *afe, struct q6afe_port 
*port, void *data,
                                    int param_id, int module_id, int psize)
  {
         struct afe_port_cmd_set_param_v2 *param;
         struct afe_port_param_data_v2 *pdata;
-       struct q6afe *afe = port->afe;
         struct apr_pkt *pkt;
-       u16 port_id = port->id;
+       u16 port_id = port ? port->id : 0;
         int ret, pkt_size;
         void *p, *pl;

@@ -1059,7 +1058,7 @@ static int q6afe_port_set_param_v2(struct 
q6afe_port *port, void *data,
         pkt->hdr.pkt_size = pkt_size;
         pkt->hdr.src_port = 0;
         pkt->hdr.dest_port = 0;
-       pkt->hdr.token = port->token;
+       pkt->hdr.token = port ? port->token : 0;
         pkt->hdr.opcode = AFE_PORT_CMD_SET_PARAM_V2;

         param->port_id = port_id;
@@ -1083,7 +1082,7 @@ static int q6afe_port_set_param_v2(struct 
q6afe_port *port, void *data,
  static int q6afe_port_set_lpass_clock(struct q6afe_port *port,
                                  struct afe_clk_cfg *cfg)
  {
-       return q6afe_port_set_param_v2(port, cfg,
+       return q6afe_port_set_param_v2(port->afe, port, cfg,
                                        AFE_PARAM_ID_LPAIF_CLK_CONFIG,
                                        AFE_MODULE_AUDIO_DEV_INTERFACE,
                                        sizeof(*cfg));
@@ -1099,7 +1098,7 @@ static int q6afe_set_lpass_clock_v2(struct 
q6afe_port *port,
  static int q6afe_set_digital_codec_core_clock(struct q6afe_port *port,
                                               struct 
afe_digital_clk_cfg *cfg)
  {
-       return q6afe_port_set_param_v2(port, cfg,
+       return q6afe_port_set_param_v2(port->afe, port, cfg,
 
AFE_PARAM_ID_INT_DIGITAL_CDC_CLK_CONFIG,
                                        AFE_MODULE_AUDIO_DEV_INTERFACE,
                                        sizeof(*cfg));
@@ -1117,6 +1116,22 @@ int q6afe_set_lpass_clock(struct device *dev, int 
clk_id, int attri,
         cset.clk_attri = attri;
         cset.clk_root = clk_root;
         cset.enable = !!freq;
+       if (q6core_geti_adsp_version() < Q6_ADSP_VERSION_2_7) {
+               struct afe_digital_clk_cfg dcfg = {0,};
+
+               switch (clk_id) {
+               /* DSP firmware versions below 2.7 do not support 
configuring internal
+                * digital codec core clk using AFE_PARAM_ID_CLOCK_SET */
+               case: Q6AFE_LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE:
+                       dcfg.i2s_cfg_minor_version = 
AFE_API_VERSION_I2S_CONFIG;
+                       dcfg.clk_val = freq;
+                       dcfg.clk_root = 5;
+                       return q6afe_set_digital_codec_core_clock(port, 
&dcfg);
+
+               default:
+                     break;
+               }
+       }

         return q6afe_set_param(afe, NULL, &cset, AFE_PARAM_ID_CLOCK_SET,
                                AFE_MODULE_CLOCK_SET, sizeof(cset),
@@ -1493,7 +1508,7 @@ int q6afe_port_start(struct q6afe_port *port)
         int pkt_size;
         void *p;

-       ret  = q6afe_port_set_param_v2(port, &port->port_cfg, param_id,
+       ret  = q6afe_port_set_param_v2(afe, port, &port->port_cfg, param_id,
                                        AFE_MODULE_AUDIO_DEV_INTERFACE,
                                        sizeof(port->port_cfg));
         if (ret) {
@@ -1503,7 +1518,7 @@ int q6afe_port_start(struct q6afe_port *port)
         }

         if (port->scfg) {
-               ret  = q6afe_port_set_param_v2(port, port->scfg,
+               ret  = q6afe_port_set_param_v2(afe, port, port->scfg,
 
AFE_PARAM_ID_PORT_SLOT_MAPPING_CONFIG,
                                         AFE_MODULE_TDM, 
sizeof(*port->scfg));
                 if (ret) {

--------------------------------------->cut<----------------------------------

Thanks,
Srini

> 
> Using q6afe-clocks a typical setup in the DT would look like:
> 
> 	lpass_codec: audio-codec@771c000 {
> 		compatible = "qcom,msm8916-wcd-digital-codec";
> 		reg = <0x0771c000 0x400>;
> 		clocks = <&xo_board>,
> 			 <&q6afecc LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE
> 				   LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> 		clock-names = "ahbix-clk", "mclk";
> 		#sound-dai-cells = <1>;
> 	};
> 
> However, this works only for newer firmware versions (>= 2.7), not for
> older firmware versions controlling this clock via LPAIF_DIG_CLK.
> 
> We need a way to describe this independent from the firmware version in
> the DT, since there are SoCs such as MSM8909 where both firmware
> versions have been used (perhaps even on the same device depending on
> which firmware version you have installed).
> 
> Any solution involving the machine driver will inevitably end up in a
> "chicken-and-egg" problem: The machine driver needs the codec drivers to
> probe successfully, but the msm8916-wcd-digital driver first needs the
> digital codec clock (mclk) to probe successfully.
> 
> I agree that these kind of checks in the qdsp6 code are a bit hacky, but
> in my opinion it's still far better than exposing this firmware
> detection problem to the device tree.
> 
> Do you see any other straightforward way to solve this for the digital
> codec clock consumed by msm8916-wcd-digital?
> 
> Thanks,
> Stephan

