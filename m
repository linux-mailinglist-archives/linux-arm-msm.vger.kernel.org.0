Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE6B81BE75A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 21:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgD2T2p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 15:28:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726775AbgD2T2o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 15:28:44 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF09CC03C1AE
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 12:28:44 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id x10so2913989oie.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 12:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HrWcuaUF1HhijaMJhHIxXSdQF25IxURehoKzpWG38wE=;
        b=oz6BuGxKcLsvPcSWuaD64ljtycmubLeGNLddDXfMv1UECC45aLYmESQWtiSmV8I3MQ
         iN5/smqBbdtg+Z+YUOoYxdi+Xd8gCgs5IvJzZFmsI0iwEdFwud4v6J+WR5YEp0uWU5OR
         OgJIasumbfRiXfs+nivQF5cNevC7pPoRzHLQ6v3JfTJ9A8LMw1EEEXw+3LKemlxnjWSJ
         2k9xs2UvTAjEaohgFL2r54LiXObxbHfXxsmC1u6t3czJAFeFJByvXy31x110Kga1x3+A
         FcTmoXr0lJECl2QS5y01sUS8VR4sDTAtLuaG5oVDcw+ech1DRlg9u13eSWjZiLUz2hQK
         SAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HrWcuaUF1HhijaMJhHIxXSdQF25IxURehoKzpWG38wE=;
        b=GORW60Lw6Hi0KzlPLVA5VOKJKNO1GbUTclmpCTBY10o/G64VN6FRvVj+55qTDFs2gx
         fI2j6RVGJPTMjJmQEdE+UyV50lwFcIWYgNeQ9AAhZl36X7YDhdEC6NZ5hyMeN9iDjyOk
         t+xG4Rf8vDF4hW4hGDrp5mmBwOdtCs1+VDwutvq/9IabR9CT4aWHD6qB+7yiyuws4U2S
         wF20DjUKljQbXhehoI0zfj6ahhqg3SZxruo0lwlhhg0gCouX2IOoYqvoiORbeoynjuMs
         OxOPkj50EOOyjauvx31/H9lGqQj3YMIWYVXvpGE055oItxtpmRHcG2liNf0bg/t/Jxkv
         03tQ==
X-Gm-Message-State: AGi0Puam3WhI53rI8gcc2B61Xt2lZds5KkcAhZ5rXTpjUMQAub26L2fw
        EJKR1c9pBWYPdKDyzIk0ZjugLvlXeBSYTCth9fFcwg==
X-Google-Smtp-Source: APiQypJdKenEudzwmRCZsVJROESba9igAfdi955cc/HXfQHfGJhnwpqdCdg1cSi3aWNuxlg4vPxYVVubva8Ng3NxLiY=
X-Received: by 2002:aca:1b0f:: with SMTP id b15mr2859389oib.96.1588188524148;
 Wed, 29 Apr 2020 12:28:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200429110726.448625-1-robert.marko@sartura.hr> <20200429.115946.788260021055034651.davem@davemloft.net>
In-Reply-To: <20200429.115946.788260021055034651.davem@davemloft.net>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Wed, 29 Apr 2020 21:28:33 +0200
Message-ID: <CA+HBbNHRyk4_nmV0HyRH=x1-L+-DFd7SQKhX6APnJA0oNEtBNA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/3] net: phy: mdio: add IPQ40xx MDIO support
To:     David Miller <davem@davemloft.net>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        robh+dt@kernel.org, Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 29, 2020 at 8:59 PM David Miller <davem@davemloft.net> wrote:
>
> From: Robert Marko <robert.marko@sartura.hr>
> Date: Wed, 29 Apr 2020 13:07:24 +0200
>
> > This patch series provides support for the IPQ40xx built-in MDIO interface.
> > Included are driver, devicetree bindings for it and devicetree node.
>
> The DT changes don't apply cleanly to net-next, please respin.
Sorry about that, I accidentally based the patch on DTS that has USB
nodes in it.
USB patches are also in the process of being upstreamed.

I will send a v5 ASAP.
Thanks
>
> Thanks.
