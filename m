Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF89AFE5A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 20:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbfKOTeH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 14:34:07 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43277 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726881AbfKOTeG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 14:34:06 -0500
Received: by mail-pg1-f196.google.com with SMTP id l24so6433141pgh.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2019 11:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=xLEUh/riVKZl3nidz8hFnBNoktlKjKDj3uK+ry9UxX8=;
        b=AsfKMKZ9ndpJ4sIxnYyEH1N4U+Wl2uLHno30dFzLbAEXcvDzizC9PAIX/TYn7WSt52
         rGs7VKxK+mOsZYoVBFoaPOHSyx8Dh8GN47fHLWSB1Ohb9kDasF3YL6FznaILFDFF+Wzz
         E4sSZdHdQfCxbK9MxIwQUfFMiXZUQBY8cxnOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=xLEUh/riVKZl3nidz8hFnBNoktlKjKDj3uK+ry9UxX8=;
        b=Gkhf89DMiIt7pG12TtTH9k9i/MrLWcei4yC4rtIEitKbwNt4v6w8IlHZKTWxUBOQFP
         g0vIW0/GdNQ6gL2hmG8MI0flblXaJXzfjGV+XhjAj+9aBFQApRw2KtZgx/17JL/pio6v
         41+ASEKuq0s9AOgdPPOvAPMuZZYSSIzferTgAZUovuGey/JgEgL+i3L+qS96Q4HPzIlk
         2GSc/NT/37pumVi6xW9Yxea2QAQa7B0FD9sM/aaoRntlTQa2XDNO8FGYI8Lu7esy0xjx
         Oy/wwG1OF1gSWV6t4rLf+0niZ6KaqkfTaiwQTC3siN2KvsS4ouPpJPPMkeOMN1IFpogU
         L4cA==
X-Gm-Message-State: APjAAAXbi+acPxDRzgX1ZCvDVQwq6t77qSxx9X2SpX9u6VTqtQjxd+dv
        N3QbziiN5/KqCl6wQIAo9Z0HtA==
X-Google-Smtp-Source: APXvYqxLZRa0pdBNJMyUWus8AtY6DYfVyFRfJsSDK0k4G3/rSZaowBAP8ZcdXr04p+oOmZ9mMtiazg==
X-Received: by 2002:a63:1065:: with SMTP id 37mr17973207pgq.31.1573846444406;
        Fri, 15 Nov 2019 11:34:04 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id f185sm12255392pfb.183.2019.11.15.11.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 11:34:03 -0800 (PST)
Message-ID: <5dcefdab.1c69fb81.1c363.3d12@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573756521-27373-11-git-send-email-ilina@codeaurora.org>
References: <1573756521-27373-1-git-send-email-ilina@codeaurora.org> <1573756521-27373-11-git-send-email-ilina@codeaurora.org>
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
To:     Lina Iyer <ilina@codeaurora.org>, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, maz@kernel.org
Subject: Re: [PATCH 10/12] arm64: dts: qcom: add PDC interrupt controller for SDM845
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 11:34:03 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Lina Iyer (2019-11-14 10:35:19)
> Add PDC interrupt controller device bindings for SDM845.
>=20
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

