Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 067A817A5AB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2020 13:51:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbgCEMuw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Mar 2020 07:50:52 -0500
Received: from mail-vk1-f195.google.com ([209.85.221.195]:37802 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbgCEMuw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Mar 2020 07:50:52 -0500
Received: by mail-vk1-f195.google.com with SMTP id t192so1562849vkb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2020 04:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+maOR+AepgKRd4QlRgZ+R5o7Ks/CO7J6rgykLOQhg3o=;
        b=Fy5hwIsSVhanXjlLscLM66eenX+BCtRtAYQCsCxjZKETTFVL603yeJm9AFRLD+sAAS
         2wCyCE5SzA4P6OHNlMe8oMswbyXdzcCCcwhvas/r/37ooGvLGxcOmm2m7x59fDE1LGlo
         fUDuYL5anWHgBbi+EgIpIN9dzRwP7IDMZRBne7yKfT51oHStdbSTwPcNjC+cxCMqCnJd
         wFbVHtcPnf3cR45aDau0mW4usFyVX06o29igp6GHGzgyWrkBrrNRt5s3KTIexsRyLZy8
         f1GgC2pag/n7Sno/FT+PEJx3l/sXaGnM1cdS4fSX0XqZOqiQDbYcttOuEvpS2XCqeVVD
         MZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+maOR+AepgKRd4QlRgZ+R5o7Ks/CO7J6rgykLOQhg3o=;
        b=Q83N6pbhnMxVyQ/jJP368A3o55M5bGoGpRR4mSp6ZtY23V/szCQjdM39YWNy7ezg7h
         GGGsKUoxdJKacBM2m8KppMVhHUwASGJaAMJ+3a695fMD2kLSuW6jDrf2FCNeNhjeXsq3
         Jn/Mu77T0RW7Cq5ad1Yufq6Fq3JuKXbYPnE1PyTyDQU1ld4e1mn38n2lhxhToDIqcdKR
         L6jownMnwakAo9MFI9xwLMDKV9m3YaHbqXpHzQD3NW6PEmUOi5Muzm0hAWTeGAv3f3T4
         pX4jBCopXpG/Y4X/iV9qysGF0PZLORxc18t36Ur+AEVFpGHzC4meaFET3icbCudCYFnn
         +yzg==
X-Gm-Message-State: ANhLgQ0yM3D0/gbUdMDr30edQjAlzG6WxG0ncwKkCHUQruw0/MMeI25T
        Vej850Y6s3oqZeQjR4VrNALUkan0oPxr12SYU6pISA==
X-Google-Smtp-Source: ADFU+vsfx2UzBfGovuaSXLUze7lcuI9cYphDPyIxas1YBiaNucPu3Q6rG2VUsSQJWjDBQnBGc8WRyzuMSoSg7SJIEcM=
X-Received: by 2002:ac5:c94f:: with SMTP id s15mr3982555vkm.79.1583412651049;
 Thu, 05 Mar 2020 04:50:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582528977.git.amit.kucheria@linaro.org>
 <59d24f8ec98e29d119c5cbdb2abe6d4644cc51cf.1582528977.git.amit.kucheria@linaro.org>
 <20200224184003.GA3607@bogus>
In-Reply-To: <20200224184003.GA3607@bogus>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Thu, 5 Mar 2020 18:20:40 +0530
Message-ID: <CAHLCerP1_xESMbLuSBsVz1XkrA0j_okbX+SxbefVSo4ttvX_fg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 3/3] dt-bindings: thermal: Add yaml bindings for
 thermal zones
To:     Rob Herring <robh@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Linux PM list <linux-pm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 25, 2020 at 12:10 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, 24 Feb 2020 12:55:37 +0530, Amit Kucheria wrote:
> > As part of moving the thermal bindings to YAML, split it up into 3
> > bindings: thermal sensors, cooling devices and thermal zones.
> >
> > The thermal-zone binding is a software abstraction to capture the
> > properties of each zone - how often they should be checked, the
> > temperature thresholds (trips) at which mitigation actions need to be
> > taken and the level of mitigation needed at those thresholds.
> >
> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > ---
> >  .../bindings/thermal/thermal-zones.yaml       | 302 ++++++++++++++++++
> >  1 file changed, 302 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/thermal/thermal-zones.yaml
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node

This one isn't due to my patch, I believe.

> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/thermal/thermal-zones.example.dt.yaml: thermal-sensor@c263000: interrupt-names: ['uplow'] is too short
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/thermal/thermal-zones.example.dt.yaml: thermal-sensor@c263000: interrupts: [[0, 506, 4]] is too short
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/thermal/thermal-zones.example.dt.yaml: thermal-sensor@c265000: interrupt-names: ['uplow'] is too short
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/thermal/thermal-zones.example.dt.yaml: thermal-sensor@c265000: interrupts: [[0, 507, 4]] is too short

Fixed. Just for my information, did the check somehow figure out that
this (incomplete) example needed the qcom-tsens.yaml binding (based on
compatible string?) and then apply those rules to throw this error?

Regards,
Amit
