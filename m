Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC51E4C593D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Feb 2022 05:19:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbiB0EUV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Feb 2022 23:20:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbiB0EUU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Feb 2022 23:20:20 -0500
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92522CED
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Feb 2022 20:19:43 -0800 (PST)
Received: by mail-oo1-xc2e.google.com with SMTP id i6-20020a4ac506000000b0031c5ac6c078so13349136ooq.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Feb 2022 20:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DOWQCle1yWXb74A6NwPdy7M5JNT4HpDC3FQ0vyWPTag=;
        b=IeylE/7EPIwORvE0KS/7Ameqd+Ni1fvuGcTyhvl9Q+CBocq+kWqmhUOzDExwG+binD
         b9NOZrJNqg8PSGZTql6noit2xRsPQlDHlz2uEkbZfPnkpQPgohVAEbkaulVLzCgms9aY
         mEMavWAD1EwN9ULfjmyBqjYWuob6fPjV9j0Xi9zyvLdCkbe649ctm4rO+ougQiWPqKQq
         TWZ0UYDBIL8HXreHEWovO+gTBa/jFnU8FvJ/jGr5lxO6qr80PzxK7DmeDtFSqBaugTx2
         Igm6D4I9aQ9VS4Z/qLMgBpDCSW6nsLnhMIRg662la8bTYY36QaOI6/l/mg3DTU0Jzttq
         7aQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DOWQCle1yWXb74A6NwPdy7M5JNT4HpDC3FQ0vyWPTag=;
        b=i9k007deDDQFeE4yDrK57r1YUFu6OLUNqviHTweIroV9T3rdGlQ+5Tyh9fHWOevkHU
         K7fVP3oAjccf4NzyCR6yqw13dWrtgtTXgF7Tm3Lb5xHWDSmmtyjSWQQ64ssVGknwWVRg
         LB/l4DI0tSGuvryNuft6qUh/lDQG9F0Cr7hLFYo16CIlUkuyHVEq3xu0sVR7plZ/RlVX
         6kM4gklMnzzSkL4T2JwAtztdAGT+adbfv5JnldUsl1jqXWThrtBVtepcVjbf2yRZH34I
         OpyHSN43BKlWUQog7zqWCiQ1FY3Ms9RG9Z9Dam6ihLVs/gIt48//1LW6bUQTr3uAO8Id
         t0jw==
X-Gm-Message-State: AOAM530Bx91zurDQWop5pY6yMgKLGdTeVWEwOhhR9FWPpCehJ/Ib1boP
        fysxnh6ZTxBehc8x3VoY1gSvt0jHcOFkFUguWmzL1g==
X-Google-Smtp-Source: ABdhPJzIp2ckX/5Fmg/5ZskGI2KaKSC4oRyfJHOpnu/S5EGTP1fU2fyV7LXsE25qAb1bhAdDLKuJeW4Nln8qhWSEhBA=
X-Received: by 2002:a4a:301c:0:b0:2dc:dcf1:8a62 with SMTP id
 q28-20020a4a301c000000b002dcdcf18a62mr6116378oof.7.1645935582815; Sat, 26 Feb
 2022 20:19:42 -0800 (PST)
MIME-Version: 1.0
References: <20220224123248.67073-1-bhupesh.sharma@linaro.org>
 <CAA8EJprRgsZRSXBQumveAn029j+w6xO8K2kZUO4rzZaefuYe7Q@mail.gmail.com>
 <CAH=2NtxQBS=c0W0cpX5EdNi12PrqiKEuzyvEtF8WrVE6nsU_rg@mail.gmail.com> <a6d28a2e-69fc-9bdf-da0d-28be35d9bfc2@linaro.org>
In-Reply-To: <a6d28a2e-69fc-9bdf-da0d-28be35d9bfc2@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Sun, 27 Feb 2022 09:49:31 +0530
Message-ID: <CAH=2NtwveafJxjNAY_2eRE1sKhEL2wKJhcF7a1THsJW_QiwSpQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,qmp: Mark '#clock-cells' as a
 'optional' property
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        robh+dt@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 27 Feb 2022 at 05:08, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 25/02/2022 12:16, Bhupesh Sharma wrote:
> > Hi Dmitry,
> >
> > Thanks for your review comments.
> >
> > On Thu, 24 Feb 2022 at 20:22, Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >>
> >> On Thu, 24 Feb 2022 at 15:33, Bhupesh Sharma <bhupesh.sharma@linaro.org> wrote:
> >>>
> >>> Since '#clock-cells' is not a required property for several
> >>> QCoM boards supporting qmp-phy(s) (for e.g. sm8150, sm8250 or sm8350 SoC
> >>> based boards), mark it as an optional property instead.
> >>
> >> I believe the description is not correct. the clock-cells should not
> >> be used at all, so it should be removed from the root node.
> >
> > Hmm.. 'clock-cells' is still used for describing qmp phy pcie nodes for certain
> > devices like 'msm8996.dtsi'. I am not sure if removing it would impact existing
> > dts files. But let me try cleaning them up in v2.
>
> Checked. Unless I'm mistaken, msm8996.dtsi doesn't use #clock-cells in
> root QMP PHY nodes.

Indeed. I meant that we made some cleanups already via
82d61e19fccb ("arm64: dts: qcom: msm8996: Move '#clock-cells' to QMP
PHY child node"),
but it seems a few dts still need to be cleaned up to move the
'#clock-cells' to QMP PHY child node instead of the root node.

I will send a fixed version in v2 :)

Regards,
Bhupesh
