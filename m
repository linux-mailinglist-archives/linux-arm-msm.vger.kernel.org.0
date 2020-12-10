Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A82C2D6972
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 22:08:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393955AbgLJVHi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 16:07:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393937AbgLJVHY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 16:07:24 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 743F1C061793
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 13:06:44 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id t8so5305065pfg.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 13:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=sOXhUWYSO+7Ec2yrlVOKodV7VJPSDj5oaxzwn+tEHKw=;
        b=b/OBsaxyIhb4UxzGUoqUGRgM9AhFLZKn6suNn+TyZmbe4lwHMV1RyxJjIKoh0TKBh7
         k7begKjj3oAumNmQFzfJkxSXAkouZM9qkzHZUDXM4rBphWcr/DpgeasP5xdadHRiZl47
         /VUuMAr3i4BvFUn9impJznb+b4pMXo5RHp1Bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=sOXhUWYSO+7Ec2yrlVOKodV7VJPSDj5oaxzwn+tEHKw=;
        b=mqnjewL4c5tYIuhtrTMvhDNlqPMQMyBNQ+gP/4FeQIgJSAHsQOxV/R/X3XLFWBSVsE
         tmpnqTPv8c4pthvVUpabbYWMlE72XowA3gQFY7PdHkogXy3CmmIPIr+Wep8xoBx2qYgQ
         5WgZW1InxsMQeMfbdjizHOmT8QNUbVmsPn1BhmgauSAeOP3xOD5hG9gVMQy6Q+S9Zxhc
         dXnc68WNead9zTnarPcDKwYSjBdwUxc234SVQhrYHR2OyPK1E1o4YM/GdowpI4Q0g9sv
         O89VeNbOLVn+1orp97pU77FVdNjS6h6MXJM9xXsJBEEcF1uG+4zCDVUz/+OPC0iVi3fy
         YyuQ==
X-Gm-Message-State: AOAM532f3M8H2imzdh2Frv8Zz1OymIc/72uFRaGOSH8kuysUsixnEIze
        cTp8caYZ0p1MYbHT3PGWgS9uxp7Mfxnk7g==
X-Google-Smtp-Source: ABdhPJxeBjsKUmXUisDH7bsUh2rRFNSNmUNxpcMeRJM44Tz2B1oI1xfP7Iz1ngC8AwIRiEaH3LOLxw==
X-Received: by 2002:a17:90a:dac2:: with SMTP id g2mr5799573pjx.17.1607634403856;
        Thu, 10 Dec 2020 13:06:43 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id a19sm7097407pfi.130.2020.12.10.13.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 13:06:43 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201209163818.v3.2.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
References: <20201209163818.v3.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid> <20201209163818.v3.2.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
Subject: Re: [PATCH v3 2/3] pinctrl: qcom: Allow SoCs to specify a GPIO function that's not 0
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-gpio@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Date:   Thu, 10 Dec 2020 13:06:41 -0800
Message-ID: <160763440177.1580929.656020512153968577@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-12-09 16:41:02)
> There's currently a comment in the code saying function 0 is GPIO.
> Instead of hardcoding it, let's add a member where an SoC can specify
> it.  No known SoCs use a number other than 0, but this just makes the
> code clearer.  NOTE: no SoC code needs to be updated since we can rely
> on zero-initialization.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
