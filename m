Return-Path: <linux-arm-msm+bounces-72596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B447B49331
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 17:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EC0F3AEE93
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 15:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038AB30DD1E;
	Mon,  8 Sep 2025 15:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ba92znfh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A8330AD0A
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 15:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757345214; cv=none; b=XJ+13fAM8LGvPoCky6mqzFIxeRhAEC3PSTnhDoV7p2TsmWEprZWfhKJNlXemGStahqNVvSZHZBDruhAg6OLH9SKK1HGWtfhQCbxwtQ0r35LyWiM5CWc9xaPuas15SrIqKgkaPZ+KxH3ocZVLEbPF5YNP86zl6N9ciSVjApn6NlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757345214; c=relaxed/simple;
	bh=c2bbXfddnnTPZ2N//WN5BYLOJywpqTytk4ukua322jU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=DUQXT4HZ9z3fb43VZC3k64oOj43Gxfrsw88CcRfGWwC9nSk37ilzMB4ivxu12dMdt5eft9g0+AzenRMNbQbeBaEPpY/mhnpn9okJ4aNej9w84PoiTY4UWPae7tQProCzGzEdTtGTsXVpnTv7CqjztZcBPt9XD5JDHAgLwxrMsog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ba92znfh; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3dce6eed889so3716331f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757345211; x=1757950011; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPiCYXc69M4SjfK5MFCW/PjpWwaPVtI+vQRtDqy3mEc=;
        b=Ba92znfh8xQshvqw0rAgAanbm+jLMpfVBYvLu+MiCcc43/xEclB5Hc7yc/h5aX5xW/
         /y6dtVhOdalvID+pfop2wq5dOXSyjVFo00WJGXucogdMLjktzelWMc3oYLg2YOnGjQTE
         EWlMM/swdcJ8Y57/sQrA+sez+D5Xzejo9e04Yt4HMnE/cBA8sJWSwlvASrOu4O0/r2CU
         LuTrPXorF7hQvoNFvlnAlrNCmYENcPlBStnseA4M+WOQk3FspzPZKobSMHrqiTkHeT0A
         B1RRRkxrGVkAkKiQ1pDWEpWiYjOXXYFostQtzJcpHPUddPu+auUd6GPFzlux7/2CxUsi
         0OBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757345211; x=1757950011;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yPiCYXc69M4SjfK5MFCW/PjpWwaPVtI+vQRtDqy3mEc=;
        b=okUVNJG1SUG7UqG136KfMKX2jeaI9P4xMNCy2O7+rlrWvG2NoW7UW62yqotda25tM2
         mLCF/mPZu5BZbITn6EHiyEmlMrPtxTsznDXByRbGtBQzzUPYDxNB1SbHc/p6RbG+b9Fz
         Pm0zU4FtXNhZaNqw6V0h6wd0TIBWCRQA49d0Wqea9cf+LE6kiTyP4oyqWUAiBWRzb9AM
         +fLIGIyZLFzGKufWJzn6rUc0LKzc/RDLJHrWkVUpMZEIMbFsjReHxLPZ7Dm1mWoKbwXH
         m8RlgnBe/OVeVo5TBtOwc00ag0ly+MTTs6uQ6EZ+Ys0zmbXI1UDXh/4+VOFYp8KJHNH+
         /Pcw==
X-Forwarded-Encrypted: i=1; AJvYcCUR9kf5n1MhihxVWsJXycbaVWureUMmXQsj74XyiKWmteX/sGjB/Vk2Wy1fgoaFVfjvAB0hchueHujSi3Im@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6DwpPbz/gG4ujK/HOmHe40YtmJRx+OeRgt2qTQ9Re2qZ62JjI
	xmA1KQCEb8654Y11+ariYx648va0JssF/HsqhcWA/4FFPSKouvTU3X2a0zIqX8XLVOs=
X-Gm-Gg: ASbGncspXVmYaDBAuCmNRw7neYdffJiuWwUJhqkWOnhOJKcQDScjVkbjyEH0lFiJPPl
	mb466TOdlN3SemPUCZMN5up2n/zt2Bo5OJ0AII5lEaBeCD0hdSHnIq4MW3EMSJdUP5X+g38hu3/
	NYsMK0GU7jnDxRQMajVMYA7sjqAtlRnfns4eegY90m/PuPT54ksCjNvx0k6IwnNg7xfp1HpGTmw
	O0C7zOk89zaqKeq57bdF89SI5UPxJc4ujQ0/yWlgyvF8tXlEjrtoX53lDtgIRpc2qtWMBmoYZmL
	IXUvXX9Ps/pwaWKDMmyItpysDPwdL2CpkVXPzkpQy4pLJ1zamgpwenT3PGEFYEgnSwC625Oys8c
	Xb2D5PrY5vmHQ4uSgRyEErfzc25+XzcxFQ59D6kCFs8SdJdnw
X-Google-Smtp-Source: AGHT+IHyT1kvUh0D0uxOlH1UOjqnYhuFKux5DQV7Wqv9yZfJ69T3JfIzMfV8HzGez+9kUbOha0nGkw==
X-Received: by 2002:a5d:64c3:0:b0:3ce:f9b7:4db with SMTP id ffacd0b85a97d-3e642f92844mr5597472f8f.24.1757345210937;
        Mon, 08 Sep 2025 08:26:50 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:1299:47dd:d3d7:b7cf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d978ab6fc7sm26976124f8f.45.2025.09.08.08.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 08:26:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Sep 2025 16:26:49 +0100
Message-Id: <DCNIVW9XSSY3.3H7TSNFDH7TKT@linaro.org>
To: "Srinivas Kandagatla" <srini@kernel.org>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Stephen Boyd" <sboyd@kernel.org>, "Lee Jones" <lee@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Srinivas Kandagatla"
 <srinivas.kandagatla@oss.qualcomm.com>, <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v3 2/3] ASoC: codecs: add new pm4125 audio codec driver
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20250814-pm4125_audio_codec_v1-v3-0-31a6ea0b368b@linaro.org>
 <20250814-pm4125_audio_codec_v1-v3-2-31a6ea0b368b@linaro.org>
 <df884334-c850-4ae9-b5e8-63cb834ae259@kernel.org>
In-Reply-To: <df884334-c850-4ae9-b5e8-63cb834ae259@kernel.org>

Hi Srini,

On Fri Aug 15, 2025 at 4:36 PM BST, Srinivas Kandagatla wrote:
>

[..]

> I manged to test this one, found 2 issues.
>
> 1. incorrect mic bias handling, results in recording stop working.
> 2. memory corruption leading to kernel crash.
>
> More details below..
>
>> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.c=
om>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com=
>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  sound/soc/codecs/Kconfig      |   18 +
>>  sound/soc/codecs/Makefile     |    8 +
>>  sound/soc/codecs/pm4125-sdw.c |  547 +++++++++++++
>>  sound/soc/codecs/pm4125.c     | 1793 ++++++++++++++++++++++++++++++++++=
+++++++
>>  sound/soc/codecs/pm4125.h     |  313 +++++++
>>  5 files changed, 2679 insertions(+)

>> --- /dev/null
>> +++ b/sound/soc/codecs/pm4125-sdw.c
>> @@ -0,0 +1,547 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights =
reserved.
>> +// Copyright, 2025 Linaro Ltd
>
>
>> +
>> +static struct pm4125_sdw_ch_info pm4125_sdw_rx_ch_info[] =3D {
>> +	WCD_SDW_CH(PM4125_HPH_L, PM4125_HPH_PORT, BIT(0)),
>> +	WCD_SDW_CH(PM4125_HPH_R, PM4125_HPH_PORT, BIT(1)),
>> +	WCD_SDW_CH(PM4125_COMP_L, PM4125_COMP_PORT, BIT(0)),
>> +	WCD_SDW_CH(PM4125_COMP_R, PM4125_COMP_PORT, BIT(1)),
> Issue 1: we are adding only 4 channels here however the mixer Switches
> that lookup this table is more than 4.
>> +};
>> +
>> +static struct pm4125_sdw_ch_info pm4125_sdw_tx_ch_info[] =3D {
>> +	WCD_SDW_CH(PM4125_ADC1, PM4125_ADC_1_2_DMIC1L_BCS_PORT, BIT(0)),
>> +	WCD_SDW_CH(PM4125_ADC2, PM4125_ADC_1_2_DMIC1L_BCS_PORT, BIT(1)),
>
> Same issue here,
>> +};
>> +

Okay. Let's fix it as you suggested.


>> diff --git a/sound/soc/codecs/pm4125.c b/sound/soc/codecs/pm4125.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..fc320152b9254e4412cbf593=
cdc456ee159d071f
>> --- /dev/null
>> +++ b/sound/soc/codecs/pm4125.c
>> @@ -0,0 +1,1793 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights =
reserved.
>> +// Copyright (c) 2025, Linaro Ltd
>> +
>
>> +static int pm4125_rx_clk_enable(struct snd_soc_component *component)
>> +{
>> +	struct pm4125_priv *pm4125 =3D snd_soc_component_get_drvdata(component=
);
>> +
>> +	if (atomic_read(&pm4125->rx_clk_cnt))
>> +		return 0;
>> +
>> +	snd_soc_component_write_field(component, PM4125_DIG_SWR_CDC_RX_CLK_CTL=
,
>> +				      PM4125_DIG_SWR_ANA_RX_CLK_EN_MASK,
>> +				      PM4125_DIG_SWR_RX_CLK_ENABLE);
>> +	snd_soc_component_write_field(component, PM4125_DIG_SWR_CDC_RX_CLK_CTL=
,
>> +				      PM4125_DIG_SWR_ANA_RX_DIV2_CLK_EN_MASK,
>> +				      PM4125_DIG_SWR_RX_CLK_ENABLE);
>> +	usleep_range(5000, 5100);
>> +
>> +	pm4125_global_mbias_enable(component);
>
> Please remove handing of mbias calls directly this is racing, Please
> handle it via dapm widgets directly. If not we will endup with switching
> off micbias off while recording is in progress or recording will
> continue assuming that micbias is on, but some path can switch it off.

Please see below, there are problems with playback without pm4125_global_mb=
ias_enable().

>> +
>> +	snd_soc_component_write_field(component, PM4125_ANA_HPHPA_FSM_CLK,
>> +				      PM4125_ANA_HPHPA_FSM_DIV_RATIO_MASK,
>> +				      PM4125_ANA_HPHPA_FSM_DIV_RATIO_68);
>> +	snd_soc_component_write_field(component, PM4125_ANA_HPHPA_FSM_CLK,
>> +				      PM4125_ANA_HPHPA_FSM_CLK_DIV_EN_MASK,
>> +				      PM4125_ANA_HPHPA_FSM_CLK_DIV_ENABLE);
>> +	snd_soc_component_update_bits(component, PM4125_ANA_NCP_VCTRL, 0x07, 0=
x06);
>> +	snd_soc_component_write_field(component, PM4125_ANA_NCP_EN,
>> +				      PM4125_ANA_NCP_ENABLE_MASK,
>> +				      PM4125_ANA_NCP_ENABLE);
>> +	usleep_range(500, 510);
>> +
>> +	atomic_inc(&pm4125->rx_clk_cnt);
>> +
>> +	return 0;
>> +}
>> +
>> +static int pm4125_rx_clk_disable(struct snd_soc_component *component)
>> +{
>> +	struct pm4125_priv *pm4125 =3D snd_soc_component_get_drvdata(component=
);
>> +
>> +	if (!atomic_read(&pm4125->rx_clk_cnt)) {
>> +		dev_err(component->dev, "clk already disabled\n");
>> +		return 0;
>> +	}
>> +
>> +	atomic_dec(&pm4125->rx_clk_cnt);
>> +
>> +	snd_soc_component_write_field(component, PM4125_ANA_HPHPA_FSM_CLK,
>> +				      PM4125_ANA_HPHPA_FSM_CLK_DIV_EN_MASK,
>> +				      PM4125_ANA_HPHPA_FSM_CLK_DIV_DISABLE);
>> +	snd_soc_component_write_field(component, PM4125_ANA_HPHPA_FSM_CLK,
>> +				      PM4125_ANA_HPHPA_FSM_DIV_RATIO_MASK,
>> +				      0x00);
>> +	snd_soc_component_write_field(component, PM4125_ANA_NCP_EN,
>> +				      PM4125_ANA_NCP_ENABLE_MASK,
>> +				      PM4125_ANA_NCP_DISABLE);
>> +	snd_soc_component_write_field(component, PM4125_DIG_SWR_CDC_RX_CLK_CTL=
,
>> +				      PM4125_DIG_SWR_ANA_RX_DIV2_CLK_EN_MASK,
>> +				      PM4125_DIG_SWR_RX_CLK_DISABLE);
>> +	snd_soc_component_write_field(component, PM4125_DIG_SWR_CDC_RX_CLK_CTL=
,
>> +				      PM4125_DIG_SWR_ANA_RX_CLK_EN_MASK,
>> +				      PM4125_DIG_SWR_RX_CLK_DISABLE);
>> +	pm4125_global_mbias_disable(component);
>> +
>> +	return 0;
>> +}
>> +
>> +
>
> %s/^\n\n/\r/

s/^/Ok\n/

>> +static int pm4125_codec_enable_rxclk(struct snd_soc_dapm_widget *w, str=
uct snd_kcontrol *kcontrol,
>> +				     int event)
>> +{
>> +	struct snd_soc_component *component =3D snd_soc_dapm_to_component(w->d=
apm);
>> +
>> +	switch (event) {
>> +	case SND_SOC_DAPM_PRE_PMU:
>>=20
>> +static const struct snd_kcontrol_new pm4125_snd_controls[] =3D {
>> +	SOC_SINGLE_EXT("HPHL_COMP Switch", SND_SOC_NOPM, 0, 1, 0,
>
>     SOC_SINGLE_EXT("HPHL_COMP Switch", PM4125_COMP_L, 0, 1, 0, ?
>
>> +		       pm4125_get_compander, pm4125_set_compander),
>> +	SOC_SINGLE_EXT("HPHR_COMP Switch", SND_SOC_NOPM, 1, 1, 0,
>
>        SOC_SINGLE_EXT("HPHR_COMP Switch", PM4125_COMP_R, 1, 1, 0,?
>
>> +		       pm4125_get_compander, pm4125_set_compander),
>
> This is same issue in one of the WCD codec, which am going to send fixes
> along with my original wcd fixes series.

So this was in other codecs for years, right?

>> +
>> +	SOC_SINGLE_TLV("HPHL Volume", PM4125_ANA_HPHPA_L_GAIN, 0, 20, 1,
>> +		       line_gain),
>> +	SOC_SINGLE_TLV("HPHR Volume", PM4125_ANA_HPHPA_R_GAIN, 0, 20, 1,
>> +		       line_gain),
>> +	SOC_SINGLE_TLV("ADC1 Volume", PM4125_ANA_TX_AMIC1, 0, 8, 0,
>> +		       analog_gain),
>> +	SOC_SINGLE_TLV("ADC2 Volume", PM4125_ANA_TX_AMIC2, 0, 8, 0,
>> +		       analog_gain),
>> +
>> +	SOC_SINGLE_EXT("HPHL Switch", PM4125_HPH_L, 0, 1, 0,
>> +		       pm4125_get_swr_port, pm4125_set_swr_port),
>> +	SOC_SINGLE_EXT("HPHR Switch", PM4125_HPH_R, 0, 1, 0,
>> +		       pm4125_get_swr_port, pm4125_set_swr_port),
>
> <---
>> +	SOC_SINGLE_EXT("LO Switch", PM4125_LO, 0, 1, 0,
>> +		       pm4125_get_swr_port, pm4125_set_swr_port),--->
>
>> +
>> +	SOC_SINGLE_EXT("ADC1 Switch", PM4125_ADC1, 1, 1, 0,
>> +		       pm4125_get_swr_port, pm4125_set_swr_port),
>> +	SOC_SINGLE_EXT("ADC2 Switch", PM4125_ADC2, 1, 1, 0,
>> +		       pm4125_get_swr_port, pm4125_set_swr_port),
> <-----------------
>> +	SOC_SINGLE_EXT("DMIC0 Switch", PM4125_DMIC0, 1, 1, 0,
>> +		       pm4125_get_swr_port, pm4125_set_swr_port),
>> +	SOC_SINGLE_EXT("DMIC1 Switch", PM4125_DMIC1, 1, 1, 0,
>> +		       pm4125_get_swr_port, pm4125_set_swr_port),
>> +	SOC_SINGLE_EXT("MBHC Switch", PM4125_MBHC, 1, 1, 0,
>> +		       pm4125_get_swr_port, pm4125_set_swr_port),
>> +	SOC_SINGLE_EXT("DMIC2 Switch", PM4125_DMIC2, 1, 1, 0,
>> +		       pm4125_get_swr_port, pm4125_set_swr_port),
> -------------->
> Please delete these entires as there are no entires for any of this
> channels in pm4125_sdw_rx_ch_info or pm4125_sdw_tx_ch_info.
>
> Side effect of this out of boundary array access is memory corruption as
> we will set port_config values based on port index which could be
> negative in this cases resulting in writing to othe members of
> pm4125_sdw_priv struct.


Ack. I applied your changes that you suggested.


>> +};
>> +
>> +static const struct snd_kcontrol_new adc1_switch[] =3D {
>> +	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
>> +};
>> +
>> +static const struct snd_kcontrol_new adc2_switch[] =3D {
>> +	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
>> +};
>> +
>> +static const struct snd_kcontrol_new dmic1_switch[] =3D {
>> +	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
>> +};
>> +
>> +static const struct snd_kcontrol_new dmic2_switch[] =3D {
>> +	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
>> +};
>> +
>> +static const struct snd_kcontrol_new ear_rdac_switch[] =3D {
>> +	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
>> +};
>> +
>
> during my test i had to do below code changes to get things working.
> Please feel free to wrap it into your next version.
>
> ----------------------->cut<----------------------------------
> diff --git a/sound/soc/codecs/pm4125.c b/sound/soc/codecs/pm4125.c
> index fc320152b925..12d4be1f7149 100644
> --- a/sound/soc/codecs/pm4125.c
> +++ b/sound/soc/codecs/pm4125.c
> @@ -264,8 +264,6 @@ static int pm4125_rx_clk_enable(struct
> snd_soc_component *component)
>                                       PM4125_DIG_SWR_RX_CLK_ENABLE);
>         usleep_range(5000, 5100);
>
> -       pm4125_global_mbias_enable(component);
> -
>         snd_soc_component_write_field(component, PM4125_ANA_HPHPA_FSM_CLK=
,
>                                       PM4125_ANA_HPHPA_FSM_DIV_RATIO_MASK=
,
>                                       PM4125_ANA_HPHPA_FSM_DIV_RATIO_68);
> @@ -309,8 +307,6 @@ static int pm4125_rx_clk_disable(struct
> snd_soc_component *component)
>         snd_soc_component_write_field(component,
> PM4125_DIG_SWR_CDC_RX_CLK_CTL,
>                                       PM4125_DIG_SWR_ANA_RX_CLK_EN_MASK,
>                                       PM4125_DIG_SWR_RX_CLK_DISABLE);
> -       pm4125_global_mbias_disable(component);
> -
>         return 0;
>  }

This doesn't work. Playback has two issues: 1) volume is very low and proba=
bly
not adjustable and 2) sound during playback dies after a couple of seconds.

Returning these global_mbias() calls restores the good behaviour.

Maybe let's make a widget out of it? In such case I am not sure about
routing meaning that I not sure which paths do require mbias enable.

Best regards,
Alexey

