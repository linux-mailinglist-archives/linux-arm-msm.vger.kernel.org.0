Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D730AAFAB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2019 02:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390623AbfIFAJ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Sep 2019 20:09:58 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42883 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389682AbfIFAJ5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Sep 2019 20:09:57 -0400
Received: by mail-pg1-f195.google.com with SMTP id p3so2376065pgb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2019 17:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:to:from:cc:subject:user-agent:date;
        bh=h4nsJn/1T9sns7Kk7sgL5OwfvvymyiT6xd0EUZWovFU=;
        b=PK+uMGFpmKm12wwXuvnoqiECdaCsFZXhx5M+LSwSmO69Dvxrput6ocA2Nzja2O0Eor
         tXp5SYxO0JRljwkFpXrNMxW6sGCVOYbOGwKkQg45b4ahlzPeFGzBSRZ01yjcYeb4Ue/v
         P0Jc5SLw1xO12YJHxU4ZbkmzIXmPPNcW52qug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:to:from:cc:subject
         :user-agent:date;
        bh=h4nsJn/1T9sns7Kk7sgL5OwfvvymyiT6xd0EUZWovFU=;
        b=nz1D2WoKBaDpGgccURpEDUT1Yg7fX9qybZ2sohOJz/9wcKiBTB6gn3VzCuF0ncIziB
         DT/GMTLrYq4AT2FSUF4qHvX5cBAsdzAxFVile2zNKgv2n6X92a/sHV8IyG6FIDZyOImh
         NVskUG1Q024U+YJ7fngH1VEMCScl2iw8m8ExiVzeKhdZylCCnSt6lhNBN4XGxXAthzrQ
         8HiGpBp4CXSjh2aba5jK0zFyk3ddzP+ysgPXBlLfx+CsHQNYx5VnWkJU11risocFtNgv
         0m6qeeHQUTEb2R2cfjp9itmkDWb8QHgctrWqZ2BAzGlYO3oMutiy4Df8pGQHYf71q8cc
         Wv9w==
X-Gm-Message-State: APjAAAXKG2F733nrNM2+WxWdyzsMunWks4S1Vt04jg/2xTHwxcA7W5+O
        LG0CjGoyRNIzDVxe3W48xmAjZA==
X-Google-Smtp-Source: APXvYqxeWGMnmHi1inGFWBMslTfV6svSPZ3QN00hOUHzBZcdQEXzTNnDIcUU7sTXb+0Z/UPffhFLPA==
X-Received: by 2002:aa7:9aa5:: with SMTP id x5mr7095882pfi.16.1567728597089;
        Thu, 05 Sep 2019 17:09:57 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id g2sm4340815pfm.32.2019.09.05.17.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 17:09:56 -0700 (PDT)
Message-ID: <5d71a3d4.1c69fb81.8444a.b82b@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190829181203.2660-9-ilina@codeaurora.org>
References: <20190829181203.2660-1-ilina@codeaurora.org> <20190829181203.2660-9-ilina@codeaurora.org>
To:     Lina Iyer <ilina@codeaurora.org>, evgreen@chromium.org,
        linus.walleij@linaro.org, marc.zyngier@arm.com
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, rnayak@codeaurora.org
Subject: Re: [PATCH RFC 08/14] drivers: irqchip: pdc: Add irqchip set/get state calls
User-Agent: alot/0.8.1
Date:   Thu, 05 Sep 2019 17:09:55 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Lina Iyer (2019-08-29 11:11:57)
> From: Maulik Shah <mkshah@codeaurora.org>
>=20
> Add irqchip calls to set/get interrupt status from the parent interrupt

s/status/state?

> controller.

Can you add some comment on why you want to do this? I'm looking for
something like, "Add this support so we can replay edge triggered
interrupts detected in suspend by the PDC to its interrupt parent
(typically the GIC)".

>=20
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
