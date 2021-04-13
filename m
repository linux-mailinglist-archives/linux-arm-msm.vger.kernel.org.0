Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95E8235E94E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Apr 2021 00:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232866AbhDMW4w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Apr 2021 18:56:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232807AbhDMW4t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Apr 2021 18:56:49 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1647DC061756
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Apr 2021 15:56:29 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id 101-20020a9d0d6e0000b02902816815ff62so11769321oti.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Apr 2021 15:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=05tcFWzhbtWsvn6Zxp27oA5RVQLTs+bfFK4lyYf+pGM=;
        b=pliwmgsovw+yFwa/mMH2LoycsBcfgDmUzhL8qi3LrJW1iZ1dXo7trilveY0UtSAeAp
         Ns2c3I4NsTX1p7Di1gVj3Pcnr/tjmJpLZ3DcdKJc9MQRNSPfuS6SkV9X5epK5hNlBLN9
         sOA9SogmpP9duN0eCahKttyQlp8IeUlN6BL95KXwY19ioK2V+WSnhN3eKxHeBc17fIgK
         NeFAeMYqhPPZwnq9t1W+Qoeem2w/P1Q1N5B29b8KJ/zEicUULJk+6MZegH9SaFMBnihF
         eIe6XX6CiCM8Cs/EG6uiRHjdYuBZuAdApuMHuaLYMw8rv8K85vB3ED26/JgELsIvevOf
         X6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=05tcFWzhbtWsvn6Zxp27oA5RVQLTs+bfFK4lyYf+pGM=;
        b=teMVRyHnUc4KSn7hvjdLptLZU+hvvyoO+0YvrytlKpb8fPKkAe5J+Ck4pBVB20Y6zn
         wbZVYpHsBuYYhvP+1pcd92x4CUWk6ACX1jlr+GuyJghk7PoukXWX+wpabXHpXr2ls0M0
         ZJzzlworG89lw0LGv6Woi1Wu57JEqWh3WVea60yyvzlu1edT3uXxwuRugWt96PysLpN3
         LJK8M/V76dHBay3IXbF0ZXuC6WBTTX75yG9XpQ4/zaPuTRmRu5uUZXZcQnO9vXvqf2tM
         WbwgMD2OAbbAe8MSCrfTBdrj2brwlNxn7cmQT1endTc/uKR1lMOH7oamMerngB19eGKc
         Autg==
X-Gm-Message-State: AOAM530VovhGijpWN2FMs24t5/Cn3oVw12RGCs0ioP6EPW1AJjGhtqyQ
        NmzUVuUBkdg64lAT32+ipFBvtw==
X-Google-Smtp-Source: ABdhPJxKzFDMgJaO10usW8e30+Jpx744w03sBogKaKo+QDQnMzyczHj74g+S3A/O77a/Y2s7cNyr7g==
X-Received: by 2002:a05:6830:2117:: with SMTP id i23mr2174974otc.170.1618354588449;
        Tue, 13 Apr 2021 15:56:28 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g5sm3113575oiy.24.2021.04.13.15.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 15:56:28 -0700 (PDT)
Date:   Tue, 13 Apr 2021 17:56:26 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Ajit Pandey <ajitp@codeaurora.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: Add "dmic_clk_en" for
 sc7180-trogdor-coachz
Message-ID: <YHYhmlniOVKkwy96@builder.lan>
References: <20210315133924.v2.1.I601a051cad7cfd0923e55b69ef7e5748910a6096@changeid>
 <CAD=FV=ViWgXzudGAiVLakaKuGK_gEnUxQ8nOkZjCrxQHjdGx9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=ViWgXzudGAiVLakaKuGK_gEnUxQ8nOkZjCrxQHjdGx9w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 12 Apr 18:16 CDT 2021, Doug Anderson wrote:

> Bjorn,
> 
> On Mon, Mar 15, 2021 at 1:39 PM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > This was present downstream. Add upstream too. NOTE: upstream I
> > managed to get some sort of halfway state and got one pinctrl entry in
> > the coachz-r1 device tree. Remove that as part of this since it's now
> > in the dtsi.
> >
> > Cc: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> > Cc: Ajit Pandey <ajitp@codeaurora.org>
> > Cc: Judy Hsiao <judyhsiao@chromium.org>
> > Cc: Cheng-Yi Chiang <cychiang@chromium.org>
> > Cc: Stephen Boyd <swboyd@chromium.org>
> > Cc: Matthias Kaehlcke <mka@chromium.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > This applies atop the patch ("arm64: dts: qcom: Add sound node for
> > sc7180-trogdor-coachz") [1].
> >
> > NOTE: downstream this property was present in each of the board
> > revisions. There's actually no longer any reason for this and I'll
> > shortly post a downstream patch to fix this.
> >
> > [1] https://lore.kernel.org/r/20210313054654.11693-3-srivasam@codeaurora.org/
> >
> > Changes in v2:
> > - Remove the pinctrl from the -r1
> >
> >  .../boot/dts/qcom/sc7180-trogdor-coachz-r1.dts   | 13 -------------
> >  .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi     | 16 ++++++++++++++++
> >  2 files changed, 16 insertions(+), 13 deletions(-)
> 
> I guess this patch missed the boat for 5.13? Can it get queued up for
> 5.14 whenever that happens?
> 

Meh, I scraped the inbox and thought I got everything that was ready
picked up. I'll check with Arnd, otherwise it's staged for v5.14 now.

Regards,
Bjorn
