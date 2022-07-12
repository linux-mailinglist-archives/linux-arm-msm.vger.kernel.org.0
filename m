Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D447F571BE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 16:05:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbiGLOFT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 10:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiGLOFS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 10:05:18 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91C0D1EEC8
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 07:05:16 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id o8so4786349wms.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 07:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=EbY6tHWvazkWCJy7nC2dYFidxky+mMBT9U9QXeNX5cU=;
        b=MLC0wh2EgwMYH0EcbHriAtDyO31KDeTQWbD6NQsSgUNOLkezpf1tIaFlbW8iUOkd1b
         SU87E2ewuDbXUGszWnfnuKkwEUZsnr3BoKf0tFwX7BMvDGOmsAidSkiyYFW6xfbbxqE5
         pqm3LIFLRv/Zqx3e9VJ8366ubyFqfF1K1fYiKqTp69bZjZcTzD/L2iwmZUvlA9LlD7j1
         o6Qcv1w9/mcwbh7dVUO0Tl6qSqsdgZrPR29Yz13evMRw6UE31mkrqnDLwqi3wVy5GWWD
         DNr70ydMPDyQW+c7bbObVu3v34M43gCneH9gsEkeL2PFHCZQzglixIlwW7rTCqU1F99E
         a6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=EbY6tHWvazkWCJy7nC2dYFidxky+mMBT9U9QXeNX5cU=;
        b=oSPxvINuGOd9uLWvnJjFSIsFi+I6tY4YKEubdigdCavjySSPAQt0Fjy5U9b53pe2su
         7iGLeUt/vxmOB+2QjgdMp/PfM+AdLPUpeXwtgCAWjNcTloF0CAwKAXV5p8o3OTWzJnbA
         69hVoVQAQ/TajjaRuKjvn5Rc6VJEaGQVtc7BofatIB/KWPhBKmoWETTn1PoNtihYrM08
         mOgDVKEWYZo0INCKZoVk44Ze8UvWKodM/eUipkt/vSPk7dsNksvyPPDL7+a+TJcvj3IX
         Fm2vELM8JJOPWAxlpKkXHY3BCXLV2rKy8dU27K66M7smn8K0QtjKm95WmGbAkFSTgBvc
         tgVw==
X-Gm-Message-State: AJIora9/p+PE2/yFVe6xUl870e41kq5XFXSLwu4YpIIPXYuFKHmt+sNv
        lSHqzDj7SPRbUeTPHMwEMYTOyg==
X-Google-Smtp-Source: AGRyM1uGY0XfduxwS8+uCPx2vfjxyvO7CQwk7oXGPS8lpze0/6XyGfQCkpZ78lNX2XCQg2JunfpBuQ==
X-Received: by 2002:a05:600c:34ce:b0:3a0:3b4b:9022 with SMTP id d14-20020a05600c34ce00b003a03b4b9022mr4134479wmq.66.1657634714965;
        Tue, 12 Jul 2022 07:05:14 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id n35-20020a05600c502300b003a2d0f0ccaesm13628303wmr.34.2022.07.12.07.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 07:05:14 -0700 (PDT)
Date:   Tue, 12 Jul 2022 15:05:12 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Sumit Garg <sumit.garg@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        shawn.guo@linaro.org, bryan.odonoghue@linaro.org,
        nicolas.dechesne@linaro.org, mworsfold@impinj.com,
        andrey.konovalov@linaro.org
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs404: Fix incorrect USB2 PHYs
 assignment
Message-ID: <20220712140512.y7fezq2kjnuyq33b@maple.lan>
References: <20220711083038.1518529-1-sumit.garg@linaro.org>
 <20220711154632.w5qtmroc22qc7yqq@maple.lan>
 <CAFA6WYPUX8aLGScx7er=3-iqEU9Vp+TsQAck_BnLz1RNMbr9cQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFA6WYPUX8aLGScx7er=3-iqEU9Vp+TsQAck_BnLz1RNMbr9cQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 12, 2022 at 06:02:22PM +0530, Sumit Garg wrote:
> On Mon, 11 Jul 2022 at 21:16, Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > On Mon, Jul 11, 2022 at 02:00:38PM +0530, Sumit Garg wrote:
> > > Currently the DT for QCS404 SoC has setup for 2 USB2 PHYs with one each
> > > assigned to USB3 controller and USB2 controller. This assignment is
> > > incorrect which only works by luck: as when each USB HCI comes up it
> > > configures the *other* controllers PHY which is enough to make them
> > > happy. If, for any reason, we were to disable one of the controllers then
> > > both would stop working.
> > >
> > > This was a difficult inconsistency to be caught which was found while
> > > trying to enable USB support in u-boot. So with all the required drivers
> > > ported to u-boot, I couldn't get the same USB storage device enumerated
> > > in u-boot which was being enumerated fine by the kernel.
> > >
> > > The root cause of the problem came out to be that I wasn't enabling USB2
> > > PHY: "usb2_phy_prim" in u-boot. Then I realised that via simply disabling
> > > the same USB2 PHY currently assigned to USB2 host controller in the
> > > kernel disabled enumeration for USB3 host controller as well.
> > >
> > > So fix this inconsistency by correctly assigning USB2 PHYs.
> > >
> > > Fixes: 9375e7d719b3 ("arm64: dts: qcom: qcs404: Add USB devices and PHYs")
> > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> >
> > I've not got one of these board (nor any documentation for them) but the
> > description and change look OK. Thus FWIW:
> >
> > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> >
>
> Thanks Daniel for the review.

No worries.


> BTW, I did confirmed that this fix is correct with respect to
> documentation (SA2150P LINUX USB TECHNICAL OVERVIEW) as well:
>
> 2.1 USB memory addresses
> ■ USB3.0 core address starts with 0x7580000. USB3.0 is connected to:
>  □ SS PHY with start address as 0x78000
>  □ HS PHY with start address as 0x7a000.
> ■ USB2.0 core address starts with 0x78c0000; it is connected only to
> HS PHY with the start address as 0x7c000.

I didn't mean to imply the patch was in any way deficient (the patch
description showed your experimental method pretty clearly).  I just
wanted to be clear that I hadn't double checked anything outside of the
patch itself!


Daniel.
