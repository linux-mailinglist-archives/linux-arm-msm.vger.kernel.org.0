Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 832D03EB30B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Aug 2021 10:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239724AbhHMI6f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Aug 2021 04:58:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239362AbhHMI6f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Aug 2021 04:58:35 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80DFCC0617AD
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Aug 2021 01:58:08 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id m18so14724205ljo.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Aug 2021 01:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Go/2+Nr8/IPd0gMcjz2kJs/syLb1QNBBenHOoL/xe0=;
        b=Az3XzF1K+Slxm41YO7BXtPTbH8PCX6lQvvTdftzW4AJ+LI8DRJgXFJkX8x5B0qPk83
         MJ9yOeq5iQlm3Mv7HC6cqkVfcJaqsSQmEDgGsOD5EvPza99LRSbI5WJnCBQAdS1Vpac5
         XEpCKVR1KLpu6RJJm1mPASkYP+ZBwsGRa0zX6d6C097S1utT3q0Mptb77LjaKIzqgge8
         8gJ0EUkbxmCbjZJbpvGRhIrtVB6u2wcfVqZ9EiLgpGv2KKKtXfZTBz2Qp4A2XcjBPp9V
         5ukEITiwo6t3HMeAhrpfcpD4XXDkqkv+zzDVkcQZmHOVqRSdCUvu9LxkDp2ldzogvnWy
         j4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Go/2+Nr8/IPd0gMcjz2kJs/syLb1QNBBenHOoL/xe0=;
        b=hQWyLM9AkSx3P4IKb2yLmWBpaCvCD+2D70HA5eNQu+b3lHTlgi6pZCotI/A6X3wLYa
         tcoir8hyKH2pLUA0Fj04MHCFRckynKcAFrZ0H7Oo+h/exLESJRmqZ0G0PzqrHqd5m1jB
         QYWsJQivxC5yA+Iw9t7gx6dE8oG8yXoa4q4SSrujiFGtb20Q/PNngnEYrusb4PLfM9HV
         ZBbCYHPgf5Pm4BpFa17RySgVs+ff2ciDjObBaUF6RWrnEp5kkAkzteSXenUxKbJYeNom
         VUCZ7W3vzSh9b/t+LujrCZej06f+tyQrK7MV+mfkGZ8RTpq+HcXTMqltWjQiHXrWHIa0
         zLmw==
X-Gm-Message-State: AOAM530lPH5Ek3yOhAMafk3zsEhM5mbHz9i7wx1ew5CViDfxursZoJwK
        GkMBCuan3j9iywCPbkEeM4JuUryQluh2c6q0DcZGrA==
X-Google-Smtp-Source: ABdhPJyNaVTxTCBGNCrzgLPEQnUlZnlrJKZgtztD/0Ef7Ohf6blBSKOY6Thc5Lxa3SIc8Fig9WbOq4LhwcWuOaNywa8=
X-Received: by 2002:a2e:89c1:: with SMTP id c1mr1083515ljk.273.1628845086850;
 Fri, 13 Aug 2021 01:58:06 -0700 (PDT)
MIME-Version: 1.0
References: <1628830531-14648-1-git-send-email-skakit@codeaurora.org> <1628830531-14648-2-git-send-email-skakit@codeaurora.org>
In-Reply-To: <1628830531-14648-2-git-send-email-skakit@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Aug 2021 10:57:55 +0200
Message-ID: <CACRpkdZteWY6X+prHeAF0rtPVbCk+X9=ZYgpjgAMH24LhOjhaQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: qcom: spmi-gpio: correct parent irqspec translation
To:     satya priya <skakit@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Collins <collinsd@codeaurora.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Satya/David,

nice work on identifying this bug!

On Fri, Aug 13, 2021 at 6:56 AM satya priya <skakit@codeaurora.org> wrote:
>
> From: David Collins <collinsd@codeaurora.org>
>
> pmic_gpio_child_to_parent_hwirq() and
> gpiochip_populate_parent_fwspec_fourcell() translate a pinctrl-
> spmi-gpio irqspec to an SPMI controller irqspec.  When they do
> this, they use a fixed SPMI slave ID of 0 and a fixed GPIO
> peripheral offset of 0xC0 (corresponding to SPMI address 0xC000).
> This translation results in an incorrect irqspec for secondary
> PMICs that don't have a slave ID of 0 as well as for PMIC chips
> which have GPIO peripherals located at a base address other than
> 0xC000.
>
> Correct this issue by passing the slave ID of the pinctrl-spmi-
> gpio device's parent in the SPMI controller irqspec and by
> calculating the peripheral ID base from the device tree 'reg'
> property of the pinctrl-spmi-gpio device.
>
> Signed-off-by: David Collins <collinsd@codeaurora.org>
> Signed-off-by: satya priya <skakit@codeaurora.org>

Is this a regression or is it fine if I just apply it for v5.15?
I was thinking v5.15 since it isn't yet used in device trees.

Yours,
Linus Walleij
