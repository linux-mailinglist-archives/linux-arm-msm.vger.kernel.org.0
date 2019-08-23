Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2BA09A980
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2019 10:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387394AbfHWIAc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Aug 2019 04:00:32 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40711 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727874AbfHWIAc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Aug 2019 04:00:32 -0400
Received: by mail-lj1-f193.google.com with SMTP id e27so8001341ljb.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2019 01:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2MWurloFC424CUmSqLbHj0wb/3z06n1cb9tNRKzCOz0=;
        b=sA3b4HdX77h7s/fsgrnjxNpZZL2Q2H0A0yDHqxZ97wKFl/4wY6a1hIV5EQoqmrzZ7r
         f4Z8cqeST9COrJKBqhuaiYdi+KUCmgfbGSP1wKpdmxquge83gpeW3HfaT5SCIGS5uwVG
         3veKuafvjamg3UGf5XlzSwsesSMNOTzddh4Ge5Tqp+I26zHMONWLgzNiAq0o81va1Jc1
         emEV0eUjqLBewyOer5y+Dho936IyFhHQSxCZlZqIw1KZGcbRpXPMFujKyY+ryczpp+Yx
         sISvmhOjokZhZ62yOeO8PFUTc2yZ4Hf2TWU69qgzlCyG7Oq+xQhaGlB5ijax6S+LsHQL
         jClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2MWurloFC424CUmSqLbHj0wb/3z06n1cb9tNRKzCOz0=;
        b=ewMmfeOQ0KfibK6uXnnHoPAeW5wJ15ctJ6i2tvz2IBVdJo9i1xS/+weVZwf2FhZvWC
         GfObu7NxftIWUWypmMSi5BWGyvISK/vWxg/+AoBXea+qdru1Z6akW83FImxPAz9bJ3ML
         V9uRp1Jtia9SVlXDDgv5j+zg3g5OScCt16OiP9NAA067lV3pGjy72Zcy4A+E9ieRm7MV
         nJ08BBWOj5bapTtOVjKGZmfwBLEmqxugoJh1YTACY4JMOKIBAcZWEwFuSM7md6dZgZDr
         sYezBLm6l5A8DKt1TOfaMkZCh1RE9ND99tSJIsMV5DWU6oBH9Q0/+qYCmTxCM4IH+7rr
         81gg==
X-Gm-Message-State: APjAAAUqIgRsTiHgA9OY3Sku1fZZP+/w9xkdluN/uqmCf5HIkcNz07+8
        mbf6Q4XA2AT3hM8J8s2wbIizgzsCC2q9gCVDRYwxxQ==
X-Google-Smtp-Source: APXvYqzLQ5ClEUlmAOPmQjblokk+7eUHmNQEQGStJEPG0CbEku6phix8tVMaf7PE4m+a0XscjlciF/e0C/PJmTAj7dk=
X-Received: by 2002:a2e:781a:: with SMTP id t26mr2091021ljc.28.1566547230567;
 Fri, 23 Aug 2019 01:00:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190814123512.6017-1-vkoul@kernel.org> <20190814123512.6017-3-vkoul@kernel.org>
In-Reply-To: <20190814123512.6017-3-vkoul@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Aug 2019 10:00:19 +0200
Message-ID: <CACRpkdbANSzMbO2dDGrfFK=KP_ZCkoaOA7xG4zirhzo7hHG_ag@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: pinctrl: qcom-pmic-gpio: Add pm8150l support
To:     Vinod Koul <vkoul@kernel.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 14, 2019 at 2:36 PM Vinod Koul <vkoul@kernel.org> wrote:

> Add support for the PM8150l GPIO support to the Qualcomm PMIC GPIO
> binding.
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Patch applied.

Yours,
Linus Walleij
