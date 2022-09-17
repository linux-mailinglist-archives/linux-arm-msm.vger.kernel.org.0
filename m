Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0135BB909
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Sep 2022 17:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbiIQPPH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Sep 2022 11:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbiIQPPF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Sep 2022 11:15:05 -0400
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A08081834C;
        Sat, 17 Sep 2022 08:15:01 -0700 (PDT)
Date:   Sat, 17 Sep 2022 15:14:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1663427699; x=1663686899;
        bh=eWDqFDIvFR5JQnVuMQrV9w7kM4RnFZzBaWuIrAT3nUE=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID;
        b=nl42cTmE7w+zwi+S6rx+785dTdB3DQsD6bxAjm9LURItAvxmZNAiOLVASqbEnIW7a
         QuuYiHyBIsHfeouwBCvDpvyyeOFEGIA/OL2vxBG6qHh9XbnlIMDjn3Wzgd41XdYqR1
         CQhtz1WeF8Fko8PS4dmm4/+Bh/PJFTX5PKeoqrNA=
To:     Dylan Van Assche <me@dylanvanassche.be>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH] sound: soc: codecs: wcd-mbhc-v2: expose ALSA control for jack
Message-ID: <86ad4891-4544-9e53-5b92-e24758e97f88@connolly.tech>
In-Reply-To: <20220917144436.7802-1-me@dylanvanassche.be>
References: <20220917144436.7802-1-me@dylanvanassche.be>
Feedback-ID: 10753939:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17/09/2022 15:44, Dylan Van Assche wrote:
> Jack detection is currently fully functional via the input
> interface together with multimedia buttons, but is not exposed
> as an ALSA control. Therefore, ALSA clients such as PulseAudio
> do not pick up the jack detection events as they only support
> one of the possible interface (ALSA control or input interface,
> but not both). Expose the jack events as an ALSA control and input
> interface to provide ALSA clients both interfaces.
>
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>

Reviewed-by: Caleb Connolly <caleb@connolly.tech>
> ---
>   sound/soc/codecs/wcd-mbhc-v2.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v=
2.c
> index 98baef594bf3..e741b522cf10 100644
> --- a/sound/soc/codecs/wcd-mbhc-v2.c
> +++ b/sound/soc/codecs/wcd-mbhc-v2.c
> @@ -724,6 +724,10 @@ static int wcd_mbhc_initialise(struct wcd_mbhc *mbhc=
)
>
>   =09mutex_lock(&mbhc->lock);
>
> +=09ret =3D snd_jack_add_new_kctl (mbhc->jack->jack, "Headset Jack", WCD_=
MBHC_JACK_MASK);
> +=09if (ret)
> +=09=09dev_warn(component->dev, "failed creating Headset Jack kctl with e=
rr: %d\n", ret);
> +
>   =09/* enable HS detection */
>   =09if (mbhc->mbhc_cb->hph_pull_up_control_v2)
>   =09=09mbhc->mbhc_cb->hph_pull_up_control_v2(component,
> --
> 2.37.3
>

