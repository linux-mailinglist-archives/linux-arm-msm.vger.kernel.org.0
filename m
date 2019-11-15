Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B2FCFE5B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 20:34:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbfKOTeh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 14:34:37 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36760 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726549AbfKOTeh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 14:34:37 -0500
Received: by mail-pf1-f195.google.com with SMTP id b19so7164219pfd.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2019 11:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=H84pwGxmH+W2D5GMkQ1r4ZDA2UfLVwXz8afXZRba2DI=;
        b=fP2Gc25k8esFyAA6tnM15lD1mfWq5CQC8OoswU1CcnqOuDbD7HHx68kIexzMVP+t7V
         OSuHA/E6JEKy0vO1zg/cFiZLDrwe6u6CdFAbrQtsUMCK9b3I7yE6ybQY8PKW+P22X9Qq
         jbg20eVhdHuxoTKmBzw04nv/YGfcHyh3Sjnqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=H84pwGxmH+W2D5GMkQ1r4ZDA2UfLVwXz8afXZRba2DI=;
        b=gwjlMlqRGCVv2JCecBNSyU9eENHjE7IVnBc6IIoZjsCv9Ff2qkJ7Cdxr1y6zA5AFzI
         YhZopJIOnp7AaeR0bo6hNlCZ4+N0S+Y8Npdq0tml/nv4rJSXbYyfpn5uNbXLuedlaDJh
         Z0CtT3yLlPfHVC+dMNKdyrcfMe0PZL5AErtPjsU6yLa6YbhzhGVbOBjHcq7brbYFYOtL
         OoAfHVVn51ujlL8xV7Glp2IP0Fwe0xWiwGEayhtwbFoSxrP7aV5oeDzG7ntPCJX72RZD
         zHPFVOI9LHQJT93xZ4oBGgkbEqkDRg7MeSPpkDWZ7US9Jes4ue0hGINXivsvgnj+Lkgq
         fZYg==
X-Gm-Message-State: APjAAAVzW5uva2QGKvRrXpeRQ/y9c2i/nF9AR0PlRXLOBETwU/phC+ap
        Zlh/mu+fnXNBN86+IuKCx5WFmg==
X-Google-Smtp-Source: APXvYqz6cATt1IqIlRmta4gmunzU7FDj1GjrNhJUNMsTkqBckqt8QaoVAlCXKdDwVyeS+yvGTMohHQ==
X-Received: by 2002:aa7:97a8:: with SMTP id d8mr16682718pfq.234.1573846476915;
        Fri, 15 Nov 2019 11:34:36 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id a3sm11006517pfo.71.2019.11.15.11.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 11:34:36 -0800 (PST)
Message-ID: <5dcefdcc.1c69fb81.188a8.0a27@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573756521-27373-13-git-send-email-ilina@codeaurora.org>
References: <1573756521-27373-1-git-send-email-ilina@codeaurora.org> <1573756521-27373-13-git-send-email-ilina@codeaurora.org>
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
To:     Lina Iyer <ilina@codeaurora.org>, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, maz@kernel.org
Subject: Re: [PATCH 12/12] arm64: defconfig: enable PDC interrupt controller for Qualcomm SDM845
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 11:34:35 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Lina Iyer (2019-11-14 10:35:21)
> Enable PDC interrupt controller for SDM845 devices. The interrupt
> controller can detect wakeup capable interrupts when the SoC is in a low
> power state.
>=20
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

