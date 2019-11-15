Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E262FE55B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 20:03:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbfKOTDk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 14:03:40 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34803 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbfKOTDk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 14:03:40 -0500
Received: by mail-pl1-f196.google.com with SMTP id h13so5299534plr.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2019 11:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=Sf8hVOxBk+v+gxcir+4F57LHQMoNbCBmUatVAasXqUI=;
        b=dpf+SQ7cYXFz8VFGhLaCxFlRNFwVU6io27htd8W8xZUqH6T/6LpIu3esdT9VZd8Q7r
         xMYQSaYQdDb4Oiizw9nbCBE8kf3gxnYVSXg2dBFNd3Bv1c32jPzgxiBZx7y102b9q7DA
         C/mQuicgQzz+HBv485SrFyAtj4gg/bXeggYdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=Sf8hVOxBk+v+gxcir+4F57LHQMoNbCBmUatVAasXqUI=;
        b=UwtXSbA8UDH5CsPmdXOPVmZs6XWC6q1rpyANYVgkOWffiHIBXjvpDAXFkUS8Kkdd7O
         96ZqJ0nXwc1tXv/FFLRenHDyXN46KtjPLvg95ZUcZOGLW4jG0OqLneUyVG2nx38YdhLt
         trmzNUnPKAkBk6rfbzMH2DIDPxlQUqpUynp7oXpXFVzJeuqz0pQWzpMhExunfqyRMnSr
         h6vA5SNS9wurXcz7LKnRoX5SdNorWU4C1cNlNlbQ2/Bhjud4nxij/EGyQxeKkHCpC6BY
         AnNvDAirYdrHg2dIw5vXAYsE2v6I0TcMrxJSDRCMai/lQh06G1f8WeojQWhrp4+fYofd
         vlHA==
X-Gm-Message-State: APjAAAWV5ihRlHIKUs/He2lcvIE5oe/BpzQ5cqyDbr7ciiAQvpKFbppM
        m9ShHuCUZeM6tHes0fBrYh0HfQ==
X-Google-Smtp-Source: APXvYqy46D/+eMdkJKqRHNHKY3j4WXnNRliCzO00Y7Go8wO+7xzyw5HOgUHHtReWL9NDepjOlQCqdQ==
X-Received: by 2002:a17:90a:4d8f:: with SMTP id m15mr11777246pjh.71.1573844619605;
        Fri, 15 Nov 2019 11:03:39 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id a6sm12317493pja.30.2019.11.15.11.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 11:03:38 -0800 (PST)
Message-ID: <5dcef68a.1c69fb81.3dc50.3afe@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573756521-27373-5-git-send-email-ilina@codeaurora.org>
References: <1573756521-27373-1-git-send-email-ilina@codeaurora.org> <1573756521-27373-5-git-send-email-ilina@codeaurora.org>
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
To:     Lina Iyer <ilina@codeaurora.org>, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, maz@kernel.org
Subject: Re: [PATCH 04/12] drivers: irqchip: add PDC irqdomain for wakeup capable GPIOs
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 11:03:38 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Lina Iyer (2019-11-14 10:35:13)
> Introduce a new domain for wakeup capable GPIOs. The domain can be
> requested using the bus token DOMAIN_BUS_WAKEUP. In the following
> patches, we will specify PDC as the wakeup-parent for the TLMM GPIO
> irqchip. Requesting a wakeup GPIO will setup the GPIO and the
> corresponding PDC interrupt as its parent.
>=20
> Co-developed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

