Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8064262CF1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Sep 2020 12:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbgIIKTq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Sep 2020 06:19:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbgIIKTp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Sep 2020 06:19:45 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C71AAC061573
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2020 03:19:44 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id y15so1797736wmi.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2020 03:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MYtyV9sjpexCNQizdjqRW/SdiWDHf0KUeZqsLzbBBXw=;
        b=nvSB7U1YSQLRXpNDcMP9RUL4PGdEF8Pp4cI2ebpoYmMzEcjiDJLpG6b3HJObeEVAxL
         cijYVLuZEmfuyeKiiZN8Q6lt2h87SXNCljv8Xm5odSlNFG3IzsWZMaKBsHIF8GcmTvzX
         tAKWudAP91pOakcxDjcrP8IsABvDDWwVina9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MYtyV9sjpexCNQizdjqRW/SdiWDHf0KUeZqsLzbBBXw=;
        b=heuqRMGZ1u81zX7hcHX5iOOZzobgT+DZuE/7uSKcCMMRoKwDbls5GVMpXKK1QKkouI
         soNfm7xytYsEuYtS9Etg7zACdk3e8AGtzR49hd2V9aFAz96maGOt4SQATiELMrbtxG+J
         Rv5LZkHVDOecj5/w9Ind0PlbKQMozDu73YsMGSsZBPMtkAyze7QzKK9powiGjQabdYk2
         nPoBOJEXgw0Vhu7tahL5xfD88P6omgXoz2ddQlwXAdMqSOQ9yRSC6omK2FhUPsBQttyI
         ZWkLVCNJ85jOSvTZPpcmRR1BCmxkvTqHcNpNtfGvl2XufNm3206cuzITWXM/mm08zKeq
         QsXA==
X-Gm-Message-State: AOAM530ZYJueuUaRQcPKIxgkf4SSP9tWz1LuMxJO68mFv3B13tGYNp3c
        uPh6Z0D+jhs+N0eNMTYTU702m5MDowE1u+kWm74LsQ==
X-Google-Smtp-Source: ABdhPJyiGLD2o5Mp0hKfuqc3sTpSUwV4QU2ftFwRMsUfKEu8ElxuFddp9M1CKV0LCUYsOZUPyqBuF/zKTLMFrnRTRBU=
X-Received: by 2002:a7b:c3c8:: with SMTP id t8mr2821349wmj.101.1599646782754;
 Wed, 09 Sep 2020 03:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200907100039.1731457-1-cychiang@chromium.org>
 <20200907100039.1731457-3-cychiang@chromium.org> <20200908203357.GA861143@bogus>
 <CAFv8NwLMAkFhVT-ML7QHbnSkqmgh=5SrNSik5eSCTHB1=DGQ0A@mail.gmail.com>
In-Reply-To: <CAFv8NwLMAkFhVT-ML7QHbnSkqmgh=5SrNSik5eSCTHB1=DGQ0A@mail.gmail.com>
From:   Cheng-yi Chiang <cychiang@chromium.org>
Date:   Wed, 9 Sep 2020 18:19:16 +0800
Message-ID: <CAFv8NwJXyzUsCQZu1cU0t7NUJDpS_DyxZM=ZhU+jGoQj97i3Jw@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine bindings
To:     Rob Herring <robh@kernel.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Doug Anderson <dianders@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 9, 2020 at 5:23 PM Cheng-yi Chiang <cychiang@chromium.org> wrote:
>
> On Wed, Sep 9, 2020 at 4:34 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Mon, Sep 07, 2020 at 06:00:38PM +0800, Cheng-Yi Chiang wrote:
> > > Add devicetree bindings documentation file for sc7180 sound card.
> > >
> > > Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > > ---
> > >  .../bindings/sound/qcom,sc7180.yaml           | 143 ++++++++++++++++++
> > >  1 file changed, 143 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> > > new file mode 100644
> > > index 000000000000..ae809346ca80
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> > > @@ -0,0 +1,143 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/sound/qcom,sc7180.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Qualcomm Technologies Inc. SC7180 ASoC sound card driver
> > > +
> > > +maintainers:
> > > +  - Rohit kumar <rohitkr@codeaurora.org>
> > > +  - Cheng-Yi Chiang <cychiang@chromium.org>
> > > +
> > > +description:
> > > +  This binding describes the SC7180 sound card which uses LPASS for audio.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: qcom,sc7180-sndcard
> > > +
> > > +  audio-routing:
> > > +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> > > +    description:
> > > +      A list of the connections between audio components. Each entry is a
> > > +      pair of strings, the first being the connection's sink, the second
> > > +      being the connection's source.
> > > +
> > > +  model:
> > > +    $ref: /schemas/types.yaml#/definitions/string
> > > +    description: User specified audio sound card name
> > > +
> > > +  headset-jack:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description: phandle of the codec for headset detection
> > > +
> > > +  hdmi-jack:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description: phandle of the codec for hdmi jack detection
> >
> > You already have links to these devices. Why duplicate it here?
> >
> > What if you had 2 headsets? This doesn't scale.
> >
> Hi Rob, thanks for reviewing.
> There was some discussion in
> https://patchwork.kernel.org/patch/11737905/#23571643 about how to
> specify the dailink that has a headset jack.
> I would like to pass the information of headset jack and hdmi jack to
> the machine driver so the machine driver can call
> snd_soc_component_set_jack to set jack when init the corresponding link.
> Headset jack and hdmi jack will be treated differently for button and
> event type.
> Because of this, we can not just set a property "jack" in the link.
>
> As for the 2 headsets case (I guess you mean hp jack and mic jack), on
> this board we will not have this use case.
> If someone really wants to build hp jack and mic jack on the board
> based on this machine driver, we can add two more property hp-jack and
> mic-jack to specify that,
> as the machine driver will need to know the different jack types
> anyway. What do you think ?
>
> Or could you please suggest a proper way to pass such information ?
>
> Thanks!
> >
Alternatively we can probably do

                dai-link@0 {
                        link-name = "MultiMedia0";
                        reg = <0>;
                        cpu {
                                sound-dai = <&lpass_cpu 0>;
                        };
                        headset_jack;
                        codec {
                                sound-dai = <&alc5682 0>;
                        };
                };
                dai-link@2 {
                        link-name = "MultiMedia2";
                        reg = <2>;
                        cpu {
                                sound-dai = <&lpass_hdmi 0>;
                        };
                        hdmi_jack;
                        codec {
                                sound-dai = <&msm_dp>;
                        };
                };

Or even put the flag into codec {}.
Please let me know if you feel this is a better way.
I think it will make the driver code a little more complicated, but
the interface on dts might looks cleaner.
Thanks!

> > Rob
