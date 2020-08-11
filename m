Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1945F2421FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 23:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbgHKVbx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 17:31:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbgHKVbw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 17:31:52 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FB5EC06174A
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 14:31:52 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id k13so126102plk.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 14:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=AfVxpgJxZ32N1LOm+xuOB6bkmTr53McK9vmsomA92LE=;
        b=ic5XdKk6gydxMYgraTNOoIX9Qr9I7gTNGubgAXooXrZz721fDPz4m2EjMsb00Sz127
         fbvckWvmv30KrMBqS0QhDkKbbJcxA7HlsSi94cHs+zcHYOvkq3S86i84M0rblZRajpOf
         IcSFe1DZhwHH7CyGIHN64J+Tvo+CwqO7p+XM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=AfVxpgJxZ32N1LOm+xuOB6bkmTr53McK9vmsomA92LE=;
        b=QVFCZc5pzSAVu7cs3j+KJETriGAoCJhPNkdDz+gJs9XQOmLj/YYYxwb9O+Gbc61jyU
         66sK15QZGqtzommYfTWuMIBTIJJ/xy2KqNQJKA1dEf3zabk/wkbwwtC8bhHtgtqDkB1i
         dQppNkxZ6w5ATV24V6PO1G9l1mINE61DyU+7v/CvC6UsjeO+rI2dCg3BXPBpmh1JjfRb
         P7ICL7ws5J3CHHj9sMcGskjmTo6wal/f8UjtuyMkQsyQzRfHjZasPEP7m++8uD5DRNUG
         hdDGJfWYWre8YW5yKAWXwNpLjaIYcxmmoNSa6hMx+l5Kw/SlOO8Z5teNfm8IX8k4IJiD
         onSA==
X-Gm-Message-State: AOAM530EUbidCn0qPm9YAI81rPeNueM20RMxys8eEjdN2Ndts0Dubshe
        uCH4i0n0ACALRXz4My+j3d4oug==
X-Google-Smtp-Source: ABdhPJyqL4TIDkhnnHdUryy4LGUhSjye4Oo+pBg8Wb1pq/wCqARm+tYcIqMsZ0lHBAcH7HwPz+7cPg==
X-Received: by 2002:a17:902:6ac3:: with SMTP id i3mr2101777plt.21.1597181511570;
        Tue, 11 Aug 2020 14:31:51 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id w15sm3796047pjk.13.2020.08.11.14.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 14:31:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1597058460-16211-8-git-send-email-mkshah@codeaurora.org>
References: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org> <1597058460-16211-8-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH v4 7/7] irqchip: qcom-pdc: Reset all pdc interrupts during init
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, linus.walleij@linaro.org, maz@kernel.org,
        mka@chromium.org
Date:   Tue, 11 Aug 2020 14:31:49 -0700
Message-ID: <159718150946.1360974.10983789401181131846@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-08-10 04:21:00)
> Clear previous kernel's configuration during init by resetting
> interrupts in enable bank to zero.

Can you please add some more information here about why we're not
clearing all the pdc irqs and only the ones that are listed in DT? Is
that because the pdc is shared between exception levels of the CPU and
so some irqs shouldn't be used? Does the DT binding need to change to
only list the hwirqs that are usable by the OS instead of the ones that
are usable for the entire system? The binding doesn't mention this at
all so I am just guessing here.

>=20
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
