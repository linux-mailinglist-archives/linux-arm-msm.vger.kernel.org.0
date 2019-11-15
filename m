Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1A07FE53F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 19:48:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbfKOSsw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 13:48:52 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38227 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbfKOSsv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 13:48:51 -0500
Received: by mail-pf1-f194.google.com with SMTP id c13so7105189pfp.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2019 10:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=fmszmsa19doMDiKVkd5JyjEU2EGslIacVXAuEqSrae8=;
        b=MJ2Vf728p+IDQNuwMyN+qBbVI4AXW+zK1iJOm+FRbwoS7HdhDVqUq9ABoFNp9GHfv1
         +w6YXWJM4nwTjAD7AuZ6fu5mqIU+7o5jh9j+jy/TQduvLgQeHCwDgSeMfTxXlq79hKWH
         vlfF83jP9VXR0ao9aRPL6TBrqTLUtSrSX9izA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=fmszmsa19doMDiKVkd5JyjEU2EGslIacVXAuEqSrae8=;
        b=eQ5cbDyDyB/sjgC4ghLePTrzm6qkh339a/dHq3Vg1TEAt/KHHlaOIuSOEV+o/U9iL9
         lXFeKIKRhs/KaBNuWUCjUkSZr/fu8BzixJLtLkmDNViG4ACIvKvDkGs4EYAFGLc7mwn2
         E0oBcsGyFs/1OYmVL0/d2J2LKlybpAI5KeR3MiOl2zF6OymzCAKwJ6Oj19xaZJD9uTbF
         j9jHtanKw8/ZrEm9fyU71t8lJDDRfqesES+PcAViuAxen5uo77Cyg5OAd2ntygos4l/o
         rFOwoU6P4m5WdRTds0IbFGFHRQr0t1BlSASkFk6UC44Qgul3guHA4pZZmLaOzSXtj6DO
         2nmg==
X-Gm-Message-State: APjAAAXKhO6idBKLoHfqu1KWD9txm0y0vhlW8Hg/pp2n9wuZEaJGg8AI
        S5nn5Fm/bbsMs5KJ0pyCnDIcAw==
X-Google-Smtp-Source: APXvYqw6HSHHsj7mgPXycNxOL2uo40yDdeVwbGg5kQPzgO7awllnUIimHBetpe8MbKVK5Gxm3+WLjQ==
X-Received: by 2002:a63:5508:: with SMTP id j8mr17243237pgb.97.1573843729530;
        Fri, 15 Nov 2019 10:48:49 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id k6sm8741468pfi.119.2019.11.15.10.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 10:48:49 -0800 (PST)
Message-ID: <5dcef311.1c69fb81.f78a4.b0ee@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573756521-27373-3-git-send-email-ilina@codeaurora.org>
References: <1573756521-27373-1-git-send-email-ilina@codeaurora.org> <1573756521-27373-3-git-send-email-ilina@codeaurora.org>
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
To:     Lina Iyer <ilina@codeaurora.org>, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, maz@kernel.org
Subject: Re: [PATCH 02/12] drivers: irqchip: qcom-pdc: update max PDC interrupts
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 10:48:48 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Lina Iyer (2019-11-14 10:35:11)
> Newer SoCs have increased the number of interrupts routed to the PDC
> interrupt controller. Update the definition of max PDC interrupts.
>=20
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

