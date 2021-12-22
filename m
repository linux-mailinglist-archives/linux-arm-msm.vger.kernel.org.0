Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21C2647D52D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Dec 2021 17:40:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231836AbhLVQkm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Dec 2021 11:40:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231571AbhLVQkk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Dec 2021 11:40:40 -0500
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2B7CC061401
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Dec 2021 08:40:34 -0800 (PST)
Received: by mail-oo1-xc2d.google.com with SMTP id t9-20020a4a8589000000b002c5c4d19723so984011ooh.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Dec 2021 08:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WyvrfuTJK2VZi0nK8upiFXDjt5MhcCRbIpxv5amoqxw=;
        b=G/22C9dgcx+k06yyQPtPgTl49SmY8WAzFIim/iFlJ4bHgRzvL19vqPZdNcGlFCRJGQ
         sqsUXLIdrwFDmC3EIqUIZJbAFS7IhpuFlzmdXiYV2TWKAQsYAIKXxBT6ENGPtMkNa54o
         S+DL5FMNTN16mMzzdGxbH8UeU+LTCQXs6DMRHAQ1NEKjIbeSZcOSKKJk3H2yFa2Ew7Cf
         UtoGwG9tA3l8dv0EJQsohdh8LmB/7b4NJA14ziBmsDI5UCb+2yixVpwUOoLzi5PrIizX
         qPBMBCve5TUx88PbREcgZkrPNL8T0BsYUtNu0yJ6ORAodV+ZWocfBItGcVfXXoYs+pZV
         dNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WyvrfuTJK2VZi0nK8upiFXDjt5MhcCRbIpxv5amoqxw=;
        b=y/EI4oebFFSvggrRYWcCANJ9OeyamW5YpbZbgsho7L4wAH0f8KC2FDEEfB0Cf3r8FB
         QvuBXxoabxcqh+qCxaJP0k1++B7w5L9V7cRioAmxNvfz0lU7p/On3lkIQzF6kY7THDVH
         qcnFFp+0ZcVsoVCszeXH8dXwOuefiaqhZ5ffK3ChLrrpi04R6yl/W7G1FHgqS1fl0HbU
         JbPP7vlWvdQeLPOE2LQWpHkhKlgbXabYtDcFgp0sC/OcN3EsEUErFn6IentOyJ9ahJlX
         fYTLJP7U1pJX0VLhhmESM3TFQbisKffDjtIWkL8wYuPgjvtf0guMhxaeOALqmA50hXcR
         IGfQ==
X-Gm-Message-State: AOAM530xzpqUnOr7jFu+aQwczxrP/a1uLS6BfQiZgRIL/O42hpA6FYfp
        pZL+N1xzOrXfAB6EgOSRyb6xGg==
X-Google-Smtp-Source: ABdhPJy+Cm1ygkkBAzM6nABs5piYt4o6uY4mKXGDO2c3sPUSC2VOIp2B1xGhvGOYpSNc9Ppx+yV18w==
X-Received: by 2002:a4a:d98c:: with SMTP id k12mr2334018oou.82.1640191234159;
        Wed, 22 Dec 2021 08:40:34 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j29sm420034ots.68.2021.12.22.08.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 08:40:33 -0800 (PST)
Date:   Wed, 22 Dec 2021 08:41:40 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Hemantg <hemantg@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Rocky Liao <rjliao@codeaurora.org>, hbandi@codeaurora.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        mcchou@chromium.org, saluvala@codeaurora.org
Subject: Re: [PATCH v4] arm64: dts: qcom: sc7280: Add bluetooth node on
 SC7280 IDP boards
Message-ID: <YcNVRNqAbfAYpCWH@ripper>
References: <1639587963-22503-1-git-send-email-bgodavar@codeaurora.org>
 <580E8974-EB7F-4493-BECC-4B09765A954D@holtmann.org>
 <YcNOvlVQaT80qPsx@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YcNOvlVQaT80qPsx@google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 22 Dec 08:13 PST 2021, Matthias Kaehlcke wrote:

> On Wed, Dec 22, 2021 at 08:54:56AM +0100, Marcel Holtmann wrote:
> > Hi Balakrishna,
> > 
> > > Add bluetooth SoC WCN6750 node for SC7280 IDP boards.
> > > 
> > > Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
> > > ---
> > > v4:
> > >  * updated commit subject
> > >  * Removed drive strength for bt_en
> > >  * updated swctrl_gpio name to sw_ctrl
> > > 
> > > v3:
> > >  * Addressed reviewers comments
> > >  * Added pin config for sw_ctrl line.
> > > v2:
> > >  * merged two patches into one
> > >  * Removed unused comments
> > >  * Removed pinmux & pin conf.
> > >  * Addressed reviewers comments
> > > 
> > > v1: initial patch
> > > ---
> > > arch/arm64/boot/dts/qcom/sc7280-idp.dts  |  4 ++++
> > > arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 36 ++++++++++++++++++++++++++++++++
> > > arch/arm64/boot/dts/qcom/sc7280-idp2.dts |  4 ++++
> > > 3 files changed, 44 insertions(+)
> > 
> > patch has been applied to bluetooth-next tree.
> 
> Thanks!
> 
> I would have expected though that a device tree change goes through
> the qcom tree. Maybe Bjorn should pick it too to avoid possible
> conflicts?

That would be preferable, I've picked a few patches in these files for
v5.17, so there's a risk for conflict as this reaches Linus.

Marcel, let me know if you drop this and I should pick it up.

Thanks,
Bjorn
