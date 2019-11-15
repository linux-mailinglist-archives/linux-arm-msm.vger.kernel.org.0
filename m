Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6987FE564
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 20:05:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbfKOTE7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 14:04:59 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:46275 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbfKOTE6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 14:04:58 -0500
Received: by mail-pl1-f196.google.com with SMTP id l4so5269515plt.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2019 11:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=chB2lQnb1vKf6uRpoFg4TNMaaJ55sC12hmBK3aLqszk=;
        b=CUSxb6sBP0tmM7Gz09I+t2pSkfmXJJ5uYumzrQWDVLlGUYjIVifbUzC5RHb10KDmfi
         DwX59hSZ6iHXfAX0ex2CuQCpUCVOjzdjGPDPWg0aqAu4DJhSPmY1C1PjtzJPAj0fsVti
         otIJXEuw3oRwmbk4WtqJcwQWAVhrvdO5wkShA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=chB2lQnb1vKf6uRpoFg4TNMaaJ55sC12hmBK3aLqszk=;
        b=kOcrEBZNe35JtmX1tkhGBsqvC6xYFouSiXwYkSWZzEFRWkPCdEqL7TSGVDH2LpS/z6
         hyUA1/89LghARcRNW01jGGQMz74WViJUR8lkJt6/UjPWZbM0vpOJamrt+ByNDpXrM/8f
         iC/WZFjb7MEPkaXMNXKkFpHJAlwSjPJ5hx1O2ZbaDKdLOM8w5ZWPXYFwiYp5s10rNLW4
         Z2HqWGaWIQD/H7+4zVsgvI52MczHSLbWvVUMYnMy6fJDSIebjE6O1BWQ/G21npNJzRYo
         g/LgvOwcrUy43TwmRpnmOJFUNBLyJk7mmsdrlSKNnG+hyWffOl86AOoZjcA7HAi7q3Rc
         QMKw==
X-Gm-Message-State: APjAAAW8peXhRbf4faUGGFTLVv4w2o0iLskYMAZZ5GXwc3WUaImsFs/X
        +HN8V380c4CJTInWnDNq0A7bJw==
X-Google-Smtp-Source: APXvYqwwiiczI4GFg2Zuzkg82xa0Gdo+f0li8XiYNhq16d/H3SafeKg+SOMzc7wQ6fyn3LNnUKVnEg==
X-Received: by 2002:a17:90a:f0c8:: with SMTP id fa8mr10937962pjb.90.1573844696718;
        Fri, 15 Nov 2019 11:04:56 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id v23sm10902782pfm.175.2019.11.15.11.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 11:04:56 -0800 (PST)
Message-ID: <5dcef6d8.1c69fb81.c72c8.050f@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573756521-27373-7-git-send-email-ilina@codeaurora.org>
References: <1573756521-27373-1-git-send-email-ilina@codeaurora.org> <1573756521-27373-7-git-send-email-ilina@codeaurora.org>
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
To:     Lina Iyer <ilina@codeaurora.org>, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, maz@kernel.org
Subject: Re: [PATCH 06/12] genirq: Introduce irq_chip_get/set_parent_state calls
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 11:04:55 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Lina Iyer (2019-11-14 10:35:15)
> From: Maulik Shah <mkshah@codeaurora.org>
>=20
> On certain QTI chipsets some GPIOs are direct-connect interrupts to the
> GIC to be used as regular interrupt lines. When the GPIOs are not used
> for interrupt generation the interrupt line is disabled. But disabling
> the interrupt at GIC does not prevent the interrupt to be reported as
> pending at GIC_ISPEND. Later, when drivers call enable_irq() on the
> interrupt, an unwanted interrupt occurs.
>=20
> Introduce get and set methods for irqchip's parent to clear it's pending
> irq state. This then can be invoked by the GPIO interrupt controller on
> the parents in it hierarchy to clear the interrupt before enabling the
> interrupt.
>=20
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> [updated commit text and minor code fixes]
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

