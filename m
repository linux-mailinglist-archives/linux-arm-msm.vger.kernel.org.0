Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2667328C7A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Oct 2020 05:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727831AbgJMDrJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Oct 2020 23:47:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730566AbgJMDrI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Oct 2020 23:47:08 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81A0AC0613D2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2020 20:47:08 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id s9so10070958wro.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2020 20:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ndqNqzRXOPPB0ogWDEyLlyUsAwARJUaefBSahD5nDa4=;
        b=TUy1/e/8zdrtz/TDD9ZlkK4/DfeGPgRUa3QeDaYfeh4G1LHFulpMmCsbTwbGSEyBQK
         lAu8jh7FoG6cHbwFJSQeIx9iXkCE/ueGwcI2MrlJUnM/ojvgJ0zqYcQCHh3lZGIzQahy
         ZyzDEyzFbz4onJYf00FLDHv5UWWR6DCw8+OeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ndqNqzRXOPPB0ogWDEyLlyUsAwARJUaefBSahD5nDa4=;
        b=olyva0++aOPydL8ggq8f1nJYtVF6soqRr7KpzE28aHtA4XMqAMulgADzKKLqeWKJCk
         Ve7nhjOn+uzKv8D3rZMuvBp2zLd2Rw1AgkGUMRTpkRu/2bbfVJwNmJy7p89u1AVqp75Q
         WzwJP3z55X5CA6ELT0gPSD0Nlz5QCRsVRgQTUXlyrAMg/ILHyxgQrjBq8xWZayDOfPOj
         3v5jm+vTVv9+UdqqGWCbWrSBQU3EUOmi9eSGTlWiTXOxfbDRQLOrvBIR8alTCbNXW5p8
         vC5mrgk+aZhedbothhqApDDLDGZHdrtjKYfwR7pYMNFKXx0bCdhCBrcR/n/E1UMdw+jW
         5NYg==
X-Gm-Message-State: AOAM533BaYXKlHNWdty0vG3iLBXaI/AqLjTyRtVa+AhPSRUkdPdBqGYP
        GSy2J11Nek6zi/Be3U9NsQA3pBG155OvfHSGUy2MCQ==
X-Google-Smtp-Source: ABdhPJxLXiwL7qf220DKfHJQfoYxQlufVps95HZ1MB4kZujN6DOUdk3utBGFAuRuLvV4U9gUnbWpUWxLmoiRUK7RRoY=
X-Received: by 2002:a5d:6a43:: with SMTP id t3mr34196747wrw.426.1602560826699;
 Mon, 12 Oct 2020 20:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org> <20200914174812.GA4125843@bogus>
 <CAFv8NwLb4zKqc8BbRq5_B4PnGR+BAMZa2RpB0qjLez921j-diA@mail.gmail.com>
In-Reply-To: <CAFv8NwLb4zKqc8BbRq5_B4PnGR+BAMZa2RpB0qjLez921j-diA@mail.gmail.com>
From:   Cheng-yi Chiang <cychiang@chromium.org>
Date:   Tue, 13 Oct 2020 11:46:40 +0800
Message-ID: <CAFv8Nw+6YQnbQGYHRYua9pH-bdb2jSOXiTpf9Wi9jKjgcEwuoA@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine bindings
To:     Rob Herring <robh@kernel.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Dylan Reid <dgreid@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Takashi Iwai <tiwai@suse.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>, Patrick Lai <plai@codeaurora.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Mark Brown <broonie@kernel.org>,
        Srinivasa Rao <srivasam@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Doug Anderson <dianders@chromium.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Taniya Das <tdas@codeaurora.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 15, 2020 at 8:44 PM Cheng-yi Chiang <cychiang@chromium.org> wrote:
>
> On Tue, Sep 15, 2020 at 1:48 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Mon, 14 Sep 2020 16:06:18 +0800, Cheng-Yi Chiang wrote:
> > > Add devicetree bindings documentation file for sc7180 sound card.
> > >
> > > Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > > ---
> > >  .../bindings/sound/qcom,sc7180.yaml           | 130 ++++++++++++++++++
> > >  1 file changed, 130 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> > >
> >
> >
> > Please add Acked-by/Reviewed-by tags when posting new versions. However,
> > there's no need to repost patches *only* to add the tags. The upstream
> > maintainer will do that for acks received on the version they apply.
> >
> > If a tag was not added on purpose, please state why and what changed.
> >
>
> Hi Rob,
> There was a change between v9 and v10 on compatible string so I did
> not add your Reviewed-by.
> Now it is "qcom,sc7180-sndcard-rt5682-m98357-1mic" following Stephan's
> comment in
>
> https://patchwork.kernel.org/comment/23608881/
>
> to make compatible string more specific to board configuration.
> I only add the note to the cover letter. Sorry the cover letter became
> too long to follow.
> I will add the note in patch mail itself for future changes.
> Thanks for taking a look again.


Hi Rob,
Could you please kindly review this patch ?

v11 contains the compatible string  "qcom,sc7180-sndcard-rt5682-m98357-1mic"
following Stephan's suggestion in

"[v9,3/3] ASoC: qcom: sc7180: Add machine driver for sound card registration"
( https://patchwork.kernel.org/patch/11770201/#23608881 )

to specify the combination of components.

Please let me know if this looks good to you.
Thanks!
