Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A71DAFA36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2019 12:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725616AbfIKKTm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Sep 2019 06:19:42 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34022 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727551AbfIKKTm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Sep 2019 06:19:42 -0400
Received: by mail-lj1-f195.google.com with SMTP id h2so12934432ljk.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2019 03:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y3147zBZhw/UX51VlglkVVRHJRKcmU6+Mh2CpbRNH1Q=;
        b=Gbl/3eu/vRbHPX5XNV0bq9/xamdbVPSy6srUKEYj9dLP0KlXQermQi/0BhYAMKVK7D
         FwgtjLbYFvTB8hOlFy9jp5ewb8DxvFcq0yCsfUb1lkbDFhkNrZ7s0gG6xY+dPT/avqnk
         JUQLntIlCF0fyPJUnyZGFpKXEH93uEKlGdEIXxUZPhVEEUI7frf2VgPkX8NK7YlfNlnF
         n212L19y0FiO12PVM/Lba/WgNePOhgz9m0dD2X/TkPlLYtR1qo1N2TPWq61wdn9LJAzR
         ip83lhH+KsS3/Mkt+AxXfhqt4Eayu16KARqRVKfChpoGPHxIpFIqswRIErt6af19j/LZ
         aaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y3147zBZhw/UX51VlglkVVRHJRKcmU6+Mh2CpbRNH1Q=;
        b=SdiRMd7K8iZLsfO9/H0/V44jvKRV4BEhGLEg3cc9S4jbDENDejPrEJigMdBS0gmm5a
         7biu6Hmso3KfJoKaGnWPaWYXICn01zgSibgyqHIsg4THgfmN3rMPPEIZsUMh9AGsxEix
         1EFIbdyt/FQEKwr7pRqxgzeEYcxPDo9V2rbZOZKCmJY15wXqgzOCmSSKTCjoxbvaDZdI
         hqexbVKGTm/2NnsKWVt7bD6iyaFkc5AGPg1Wgg9d303VCHPcZr6B6f8lU6O1T/TG+MKm
         FbJrotsHgFbtv9KYg/WHskp46NO+FjEZ45YD34kyDqBF10pFPeJ4EOHIdKAEZuHr0v/W
         PUdw==
X-Gm-Message-State: APjAAAVfE9FQyvT+ubalir5uJAw4Td7mJydZTNToXeXTE4wCpY7xmAls
        x2GMjaDS6oBwEySX8qMv1M3yvom9xoUdadRn8gaQUw==
X-Google-Smtp-Source: APXvYqzB5BVgv6AQnPfWAutofN/bDoNRjMTME5RBOuMqvBevxj/0paBL/L/Gw6RJVZRAhcMdHPv5ejElCDlE9+NqdtA=
X-Received: by 2002:a2e:654a:: with SMTP id z71mr22927335ljb.37.1568197178805;
 Wed, 11 Sep 2019 03:19:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190829181203.2660-1-ilina@codeaurora.org> <20190829181203.2660-10-ilina@codeaurora.org>
In-Reply-To: <20190829181203.2660-10-ilina@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Sep 2019 11:19:27 +0100
Message-ID: <CACRpkdbhNY8N=LMG6wwYw9bAnL4HmAqj8WMpsLsqvh8PvaQ52A@mail.gmail.com>
Subject: Re: [PATCH RFC 09/14] drivers: pinctrl: msm: fix use of deprecated
 gpiolib APIs
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        mkshah@codeaurora.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 29, 2019 at 7:35 PM Lina Iyer <ilina@codeaurora.org> wrote:

> Replace gpiochip_irqchip_add() and gpiochip_set_chained_irqchip() calls
> by populating the gpio_irq_chip data structures instead.
>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>

This is mostly fixed upstream I think, but:

> +       chip->irq.fwnode = pctrl->dev->fwnode;

This fwnode assignment is missing though.

Sorry for the constant churn and required rebasing...

Yours,
Linus Walleij
