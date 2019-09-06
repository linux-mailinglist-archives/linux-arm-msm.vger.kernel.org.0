Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8342AAFE5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2019 02:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391581AbfIFAjy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Sep 2019 20:39:54 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42018 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390825AbfIFAjy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Sep 2019 20:39:54 -0400
Received: by mail-pf1-f194.google.com with SMTP id w22so3073116pfi.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2019 17:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:to:from:cc:subject:user-agent:date;
        bh=UgLwGOLd9Qaofpb/EMRahwjwW4TzGd9hkLOFeY5MZAY=;
        b=VKalJm2EThnQ27lsNLgCNQVCIu2xu0aPd0QmMEODnmLKOaOclAraltTAFz5qlLmPsz
         OrIA51ux0pzJWcRc2yp/pmbwTzvDB4HOW92Frt21D4wp9mkgTWh2fR9CTKbeHFvVcS50
         49B6sW1p1h3yjjezZwnpLETheL6yUorgutylc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:to:from:cc:subject
         :user-agent:date;
        bh=UgLwGOLd9Qaofpb/EMRahwjwW4TzGd9hkLOFeY5MZAY=;
        b=PlMjduT/mqT7JgrAFmPgFGl23t7MgzeyQzmDdB66VLNyrYDsHUaW6S8yuJri71Qk3j
         gr11fMF9di4Q6eXDAXokAVd/a8dGjUbgk7C+99awhYe/4+0NrNh7XDjy4ABK5M8GMwyi
         V93496D6Ye6iNHYOuGeddcneVIjrY2xcbdQjsij77ua2q7f7nD/+F5eUlD/KBqnDSaQb
         60pnnZQI/Ad/SLqgvrzA1+vBTRPTp7lTaRA1o3zXpzdoLghMmklnQTBaR/orbUB56KlP
         1wxKuub8dCzfbl4NKI+SU3WOANxLyUX91yW6Reif7EUMskVwD0Vzx/Blu9KwvUSTLOdj
         iSYA==
X-Gm-Message-State: APjAAAVHjthklkvjdIQ5ZYrA99DliH0vZjFj8nn5wgXSCUauGmgCXnIl
        GogGmBAEArHIe9ce4vCPRlqckA==
X-Google-Smtp-Source: APXvYqzsUIedg/kFHh7n2df4VYVSimGTOumXrGupH6BrHebKIF4HmZ8VC2KdVr+TA3cvwdNwNGA7AQ==
X-Received: by 2002:a62:d45a:: with SMTP id u26mr4972214pfl.137.1567730393567;
        Thu, 05 Sep 2019 17:39:53 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 127sm7907733pfy.56.2019.09.05.17.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 17:39:53 -0700 (PDT)
Message-ID: <5d71aad9.1c69fb81.f469e.262f@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190829181203.2660-3-ilina@codeaurora.org>
References: <20190829181203.2660-1-ilina@codeaurora.org> <20190829181203.2660-3-ilina@codeaurora.org>
To:     Lina Iyer <ilina@codeaurora.org>, evgreen@chromium.org,
        linus.walleij@linaro.org, marc.zyngier@arm.com
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, rnayak@codeaurora.org,
        Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH RFC 02/14] drivers: irqchip: pdc: Do not toggle IRQ_ENABLE during mask/unmask
User-Agent: alot/0.8.1
Date:   Thu, 05 Sep 2019 17:39:52 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Lina Iyer (2019-08-29 11:11:51)
> When an interrupt is to be serviced, the convention is to mask the
> interrupt at the chip and unmask after servicing the interrupt. Enabling
> and disabling the interrupt at the PDC irqchip causes an interrupt storm
> due to the way dual edge interrupts are handled in hardware.
>=20
> Skip configuring the PDC when the IRQ is masked and unmasked, instead
> use the irq_enable/irq_disable callbacks to toggle the IRQ_ENABLE
> register at the PDC. The PDC's IRQ_ENABLE register is only used during
> the monitoring mode when the system is asleep and is not needed for
> active mode detection.

I think this is saying that we want to always let the line be sent
through the PDC to the parent irqchip, in this case GIC, so that we
don't get an interrupt storm for dual edge interrupts? Why does dual
edge interrupts cause a problem?

>=20
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
