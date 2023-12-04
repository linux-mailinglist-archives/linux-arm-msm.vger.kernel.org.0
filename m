Return-Path: <linux-arm-msm+bounces-3220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E037803055
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 11:35:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EAC41C209F9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 10:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6CD14F60;
	Mon,  4 Dec 2023 10:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="pKpMs9GY";
	dkim=permerror (0-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="uJV2WvJx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.80])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2B94B9;
	Mon,  4 Dec 2023 02:35:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701686089; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=B6jxp6YpDy3gWwRWyv+ojwyj/8Wx3GtPQfF3NUqjWsLwXGOY23RcvbScqLGdzSNyXk
    IUnA0tZBwocvUsNoGEV/jgs42CbVuivUJ613cdBAms6rlO53exhJ46xwi0YPh0IEdaVJ
    qdVH4QqngRxHpJ/0NTZukykbIUULNMpYafAm6J+ENSeI3FveHaOa4y4D+PSovUmbdup1
    BdoSKnKgPkpIj/7jgsdnDvF6luSw8UmZkfmQtMdgz9TNc13G7vhAtY+N2uleesiR5Sf8
    c6BRssVe6V3NiSp8D/3tSvHJCSU94k6t/1FRnsKFoY/S3SLFzk1bJ5oiYdYlhkVlf1uB
    EFiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1701686089;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=CHv9E0tocZhThOTvkGBLLpXTCKTNvN5GQ8q6pbKUvKY=;
    b=mG1ctqw0Qjl+BQjSIs8msaQMTlSyOS5EWy+DO3vu/vmX951iWJnyLRAzpBCN0AhLo6
    M2LU6j7CBBHQgr4tq4NqCZ/Ht+TBNbdnEBeE84KvXpilgXRBOlEpktCTH5xcM4RuDBhr
    TzIlzJAqrzsva3isZUS6n1+niG32IL6ucqaF9guzQAJRNYxTwC+IA0rSQ/4QVN6ujVIN
    2A1oPdI77FMpJQHDlMmN0zGNYmNEg7J0VQTVoRZUhXVlWhPdCQtIhiY5TGh7nE+3/lxE
    P5ETpII/fSXf+mCROzttAMu89ogPylHDVsYofRgYaVt79wNHUhlu6sAs5uI7+TyuXgzK
    g4QQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1701686088;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=CHv9E0tocZhThOTvkGBLLpXTCKTNvN5GQ8q6pbKUvKY=;
    b=pKpMs9GYnvmsTS2BH7lZtApM/4A4cnl14TRFZ4hfQSAJcNHFz8ZICK7yHZYUQLRyn9
    D88uiKlnj8aM4nlj8WDonjC1G3SEVW44hBua5+U8hbgHVjMsQUnqNdrWKD5Pn/rsBoct
    9J6L89u4maxo58jCQTTqD4WLBKPSIWfmD4Ns6AUKzTLRXBonTx5k755zlLAFMepwQe+n
    WZTy4Wrsun0Tq5MSM6cXL21pSPeWOLzDiWE0KaZYhyNJOxzKzKHnXgsYIwVQAQC0gKhx
    VXoIQtKSqXFtJsb9sW9L+pMAN7vmEggUneYyWn+pvJWgBnBb2qaENx4rWEQN/bd578KQ
    57SQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1701686088;
    s=strato-dkim-0003; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=CHv9E0tocZhThOTvkGBLLpXTCKTNvN5GQ8q6pbKUvKY=;
    b=uJV2WvJx96hjbeGK6zqpuT1m3EOf39CxJUjVka7+Sri/QJsGK1i/8W7T6LOO9Hsw86
    ACLbgUljQXVx/cUG0eCw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJD4peA8paF1A=="
Received: from gerhold.net
    by smtp.strato.de (RZmta 49.9.7 DYNA|AUTH)
    with ESMTPSA id R5487bzB4AYmA6d
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 4 Dec 2023 11:34:48 +0100 (CET)
Date: Mon, 4 Dec 2023 11:34:43 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>,
	linux-arm-msm@vger.kernel.org,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 2/4] ASoC: qcom: q6afe: provide fallback for digital
 codec clock
Message-ID: <ZW2rQ-SsER-HPlF5@gerhold.net>
References: <20231029165716.69878-1-otto.pflueger@abscue.de>
 <20231029165716.69878-3-otto.pflueger@abscue.de>
 <d8ef8fe6-2856-40fc-a95e-5bf68c0f1a8b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8ef8fe6-2856-40fc-a95e-5bf68c0f1a8b@linaro.org>

Hi Srini,

On Fri, Nov 17, 2023 at 01:26:43PM +0000, Srinivas Kandagatla wrote:
> On 29/10/2023 16:57, Otto Pflüger wrote:
> > When q6afe is used as a clock provider through q6afe-clocks.c, it uses
> > an interface for setting clocks that is not present in older firmware
> > versions. However, using Q6AFE_LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE
> > as the codec MCLK in the device tree can be useful on older platforms
> > too. Provide a fallback that sets this clock using the old method when
> > an old firmware version is detected.
> > 
> > MSM8916 did not need this because of a workaround that controls this
> > clock directly through the GCC driver, but newer SoCs do not have this
> > clock in their GCC drivers because it is meant to be controlled by the
> > DSP.
> > 
> > Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> > ---
> >   sound/soc/qcom/qdsp6/q6afe.c | 26 ++++++++++++++++++++++++++
> >   1 file changed, 26 insertions(+)
> > 
> > diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
> > index 91d39f6ad0bd..f14d3b366aa4 100644
> > --- a/sound/soc/qcom/qdsp6/q6afe.c
> > +++ b/sound/soc/qcom/qdsp6/q6afe.c
> > @@ -1111,6 +1111,32 @@ int q6afe_set_lpass_clock(struct device *dev, int clk_id, int attri,
> >   	struct q6afe *afe = dev_get_drvdata(dev->parent);
> >   	struct afe_clk_set cset = {0,};
> > +	/*
> > +	 * v2 clocks specified in the device tree may not be supported by the
> > +	 * firmware. If this is the digital codec core clock, fall back to the
> > +	 * old method for setting it.
> > +	 */
> > +	if (q6core_get_adsp_version() < Q6_ADSP_VERSION_2_7) {
> > +		struct q6afe_port *port;
> > +		struct afe_digital_clk_cfg dcfg = {0,};
> > +		int ret;
> > +
> > +		if (clk_id != Q6AFE_LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE)
> > +			return -EINVAL;
> > +
> > +		port = q6afe_port_get_from_id(dev, PRIMARY_MI2S_RX);
> > +		if (IS_ERR(port))
> > +			return PTR_ERR(port);
> > +
> > +		dcfg.i2s_cfg_minor_version = AFE_API_VERSION_I2S_CONFIG;
> > +		dcfg.clk_val = freq;
> > +		dcfg.clk_root = 5;
> > +		ret = q6afe_set_digital_codec_core_clock(port, &dcfg);
> > +
> > +		q6afe_port_put(port);
> 
> This redirection of clks looks totally confusing and hacky.
> Why can not we do this from machine driver based something like this:
> 
> if (q6core_get_adsp_version() < Q6_ADSP_VERSION_2_7)
> 	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_DIG_CLK, freq, 0);
> 

Unfortunately this doesn't work for the digital codec clock. This clock
is consumed and dynamically controlled by the msm8916-wcd-digital driver
via the clk subsystem, not via ASoC sysclks.

Using q6afe-clocks a typical setup in the DT would look like:

	lpass_codec: audio-codec@771c000 {
		compatible = "qcom,msm8916-wcd-digital-codec";
		reg = <0x0771c000 0x400>;
		clocks = <&xo_board>,
			 <&q6afecc LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE
				   LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
		clock-names = "ahbix-clk", "mclk";
		#sound-dai-cells = <1>;
	};

However, this works only for newer firmware versions (>= 2.7), not for
older firmware versions controlling this clock via LPAIF_DIG_CLK.

We need a way to describe this independent from the firmware version in
the DT, since there are SoCs such as MSM8909 where both firmware
versions have been used (perhaps even on the same device depending on
which firmware version you have installed).

Any solution involving the machine driver will inevitably end up in a
"chicken-and-egg" problem: The machine driver needs the codec drivers to
probe successfully, but the msm8916-wcd-digital driver first needs the
digital codec clock (mclk) to probe successfully.

I agree that these kind of checks in the qdsp6 code are a bit hacky, but
in my opinion it's still far better than exposing this firmware
detection problem to the device tree.

Do you see any other straightforward way to solve this for the digital
codec clock consumed by msm8916-wcd-digital?

Thanks,
Stephan

