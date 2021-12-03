Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE80467983
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Dec 2021 15:36:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381501AbhLCOj7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Dec 2021 09:39:59 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:16506 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381439AbhLCOj6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Dec 2021 09:39:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1638542189;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=DH5QNh/jjoJsGNSeHw7LpNq4K5gQZY61cJxKrCgXaY8=;
    b=RBhvp0KYk5ngjfVI3tVuwIiV9xwyQSEHcc5EdpmX1rDvr2Qtn6xsPNG+waKlwGL7E4
    L65mKhL5wDCSxHqkD7vdLr6yn8Y3yp6MpTuwtjNKLmspCRT8Tgyw71clJBcSv61vWtzQ
    Xs2PnGbphqdO7LZ3vRKAkLfAGeCpVpiDxeQcGHfx1fZL/vp6qmJAyRl/jLmYTSQvz/yA
    tx4JWkhrkUusLWSou4mFGOliqWdorixR7TOL7eBN9V3KuENBbUi58oqxwUMKPs7ZEW3g
    4T3O4pw4vKB8Imj2G/sN63iajr+QgBCMAiRhReEHkntrbR7g3p4sBxg5m54XKRdeHDRV
    Edxw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLUrKY7lg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.34.10 AUTH)
    with ESMTPSA id j03bcbxB3EaSvqD
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 3 Dec 2021 15:36:28 +0100 (CET)
Date:   Fri, 3 Dec 2021 15:36:22 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 5/5] ASoC: qcom: apq8016_sbc: Allow routing audio through
 QDSP6
Message-ID: <YaorZnQTwvXo6vrO@gerhold.net>
References: <20211202145505.58852-1-stephan@gerhold.net>
 <20211202145505.58852-6-stephan@gerhold.net>
 <455604c2-9b73-4b9b-2ce7-890aafe41845@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <455604c2-9b73-4b9b-2ce7-890aafe41845@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Srinivas,

Thanks for your review!

On Fri, Dec 03, 2021 at 10:35:08AM +0000, Srinivas Kandagatla wrote:
> I have tested DB410c this use case in the past using similar patch [1].
> 

Did you use a different modem DSP firmware? (An older one maybe?)
In my tests the newer ones seem to have QDSP6 audio completely broken,
my DB410c simply rebooted when I tried it.

> On 02/12/2021 14:55, Stephan Gerhold wrote:
> > The apq8016-sbc-sndcard is designed to be used with the LPASS drivers
> > (bypassing the combined audio/modem DSP in MSM8916/APQ8016).
> > Make it possible to use QDSP6 audio instead for the msm8916-qdsp6-sndcard.
> > 
> > This only requires adding some additional hooks that set up the DPCM
> > backends correctly. Similar code is already used in drivers for newer
> > SoCs such as apq8096.c, sdm845.c and sm8250.c.
> > 
> > A slightly different initialization sequence is used for the apq8016-sbc
> > and msm8916-qdsp6 sound card by defining the apq8016_sbc_add_ops()
> > function as device match data.
> 
> Other alternative is to reuse card->name populated from "qcom,model"
> property to differentiate between both of these.
> 
> This should also help in differentiating UCM configs.
> 

I have "qdsp6" in card->components to differentiate the setups in UCM
configs. I think this is a more flexible approach than adding it to the
card model. It can be checked in UCM using ${CardComponents}.

In my setup the card "model" identifies the device in use (e.g.
smartphone X with a stereo speaker setup). This device might use the
DSP bypass (apq8016-sbc-sndcard) or QDSP6 (msm8916-qdsp6-sndcard),
depending on user preference. In UCM this is detected by checking
if ${CardComponents} contains "qdsp6" or not.

The reason for supporting both setups is that they both have their
advantages and disadvantages. The DSP must be used when the modem is
needed, but otherwise the LPASS driver tends to give more easy control
about sample rate, latency etc.

> 
> > 
> > Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> 
> Few minor nits, other than that it LGTM,
> 
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> > ---
> >   sound/soc/qcom/apq8016_sbc.c | 134 +++++++++++++++++++++++++++++++++--
> >   1 file changed, 129 insertions(+), 5 deletions(-)
> > 
> > diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
> > index ba2a98268ee4..f9d69375320e 100644
> > --- a/sound/soc/qcom/apq8016_sbc.c
> > +++ b/sound/soc/qcom/apq8016_sbc.c
> > [...]
> > +static int msm8916_qdsp6_startup(struct snd_pcm_substream *substream)
> > +{
> > +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> > +	struct snd_soc_card *card = rtd->card;
> > +	struct apq8016_sbc_data *data = snd_soc_card_get_drvdata(card);
> > +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> > +	int mi2s, ret;
> > +
> > +	mi2s = qdsp6_dai_get_lpass_id(cpu_dai);
> > +	if (mi2s < 0)
> > +		return mi2s;
> > +
> > +	if (++data->mi2s_clk_count[mi2s] > 1)
> > +		return 0;
> > +
> 
> Am assuming that as you are not setting any DIGITAL CDC clock here you might
> be using an external codec.
> 

For apq8016-sbc the digital clock is controlled by msm8916-wcd-digital
through the reference in the device tree (<&gcc GCC_CODEC_DIGCODEC_CLK>).
It must be carefully managed, because it is needed for register access
in that driver.

Since QDSP6 also allows controlling this clock though LPAIF_DIG_CLK
it is a bit of a hack to bypass it using the GCC driver. However, I kept
the same setup for simplicity and it has been working just fine so far.

AFAICT in your commit you simply turn on the clock twice, once directly
using GCC and once indirectly via LPAIF_DIG_CLK in QDSP6. :-)

> > +	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, MI2S_BCLK_RATE, 0);
> > +	if (ret)
> > +		dev_err(card->dev, "Failed to enable LPAIF bit clk: %d\n", ret);
> > +	return ret;
> > +}
> > +
> > [...]
> > @@ -148,11 +266,16 @@ static const struct snd_soc_dapm_widget apq8016_sbc_dapm_widgets[] = {
> >   static int apq8016_sbc_platform_probe(struct platform_device *pdev)
> >   {
> > +	void (*add_ops)(struct snd_soc_card *card);
> >   	struct device *dev = &pdev->dev;
> >   	struct snd_soc_card *card;
> >   	struct apq8016_sbc_data *data;
> >   	int ret;
> > +	add_ops = device_get_match_data(&pdev->dev);
> > +	if (!add_ops)
> > +		return -EINVAL;
> 
> We will never hit the error case here because without a match we can not
> even enter the probe function.
> 

Theoretically it's possible to create platform devices through other
ways than the device tree (think of old board C files for example).
I agree that nobody should do that, but having this check here
at least avoids a NULL pointer dereference in this unlikely scenario.

Please let me know if I should remove it anyway, that's fine for me!

Thanks,
Stephan 
