Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA5864BA25
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 15:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbfFSNjG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jun 2019 09:39:06 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45133 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730340AbfFSNjG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jun 2019 09:39:06 -0400
Received: by mail-lf1-f66.google.com with SMTP id u10so12130799lfm.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2019 06:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0VIXks4JVJi6NW7o9HNww47+bDvO8ASarITv0RvaBUo=;
        b=TqIC1pHo984jnhUkBBpDE0frE4b7fL4HoMZfMOx6EY0sGxeCVv0XkMOMEFBvyjOgmQ
         JHVJ9qYUVIZmg76cGOylZeRwyVluGLhfQiLWSM0tF/Kzq0GhtEsWFpjrsAqv2nj5kWa4
         1mtTk7zYKgzyt1hptU5230z6b5TZIVaqRuAbPeVnL1rEtW1W5Tclzj0SHw8QxQyrsGuY
         1D7ox+dUdrqpErS+26V31uEc+jk97Bywe+Wo7/szLRJwuSUF2OJiskKzTxy2ME4QO484
         TQ36ueN6d7/Zz6G1J0tF3dMAF8UJaow8GIwibn1c3Hh2Nr3toVeaDHJwpJFX5xZm003n
         a9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0VIXks4JVJi6NW7o9HNww47+bDvO8ASarITv0RvaBUo=;
        b=OsF1a+GlmnL116jAQxZVOfSgMS6uP2FoLsDz9zizi+bzBWAOWlH8PVqKRwEIJyyCO4
         hx2epdjmOT3pIlpDHNMD+seHUdb+7Ggg3NL4ykvXatNphh6Ln16l2tMsiY5QrvMi9el7
         d5sPAQEZmqMpHMNzlDLX4CnmDA9FZO5jBYgexemyKTkmXOnHKDAFkz9P7HVdQ6Bi7P1/
         LNw8dHbIa/FJA42CxrkHWDA5lTYn3Q3/glSGXUoWPTccZwk0iVjyCSIKJg8K0wnoM8Te
         AMivHmI2T5t7iPYFWJnAAXn96NjEIQNx7MgebkYZQt+GkQoONWWR1O2Qy3WAvvSnQSCi
         CDxg==
X-Gm-Message-State: APjAAAUnLqv6XyAKGIQB8TkYhFTEUImM2hEi4cakL009ErKyKndoEx3t
        W52ehiH7arvOz5rucaebUpnaJg==
X-Google-Smtp-Source: APXvYqzr/XXLfjI7uNapd/di0jPGKmIFm17xwjLoTuYr6O6ArJTj+H64hYp1vfV66Fz4Kz20uLWHkQ==
X-Received: by 2002:a19:4a49:: with SMTP id x70mr24014323lfa.151.1560951544755;
        Wed, 19 Jun 2019 06:39:04 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id q13sm2665763lfk.65.2019.06.19.06.39.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2019 06:39:03 -0700 (PDT)
Date:   Wed, 19 Jun 2019 06:17:44 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>, arm@kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: qcom: qcs404: Add reset-cells to GCC node
Message-ID: <20190619131744.qk56iqqd4cxttdxp@localhost>
References: <1560053972-32273-1-git-send-email-agross@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560053972-32273-1-git-send-email-agross@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jun 08, 2019 at 11:19:32PM -0500, Andy Gross wrote:
> This patch adds a reset-cells property to the gcc controller on the QCS404.
> Without this in place, we get warnings like the following if nodes reference
> a gcc reset:
> 
> arch/arm64/boot/dts/qcom/qcs404.dtsi:261.38-310.5: Warning (resets_property):
> /soc@0/remoteproc@b00000: Missing property '#reset-cells' in node
> /soc@0/clock-controller@1800000 or bad phandle (referred from resets[0])
>   also defined at arch/arm64/boot/dts/qcom/qcs404-evb.dtsi:82.18-84.3
>   DTC     arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb
> arch/arm64/boot/dts/qcom/qcs404.dtsi:261.38-310.5: Warning (resets_property):
> /soc@0/remoteproc@b00000: Missing property '#reset-cells' in node
> /soc@0/clock-controller@1800000 or bad phandle (referred from resets[0])
>   also defined at arch/arm64/boot/dts/qcom/qcs404-evb.dtsi:82.18-84.3
> 
> Signed-off-by: Andy Gross <agross@kernel.org>

Applied to arm/dt. Thanks!


-Olof
