Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5296B9978
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2019 00:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727984AbfITWGx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Sep 2019 18:06:53 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36941 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727537AbfITWGw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Sep 2019 18:06:52 -0400
Received: by mail-pf1-f193.google.com with SMTP id y5so5429948pfo.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Sep 2019 15:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:from:subject:user-agent:date;
        bh=keJKsM9t+Xigd272OZzAyt226ZPdGo/jAWLvUfQ5wNg=;
        b=PDmNZgbiTd6S/mK/lf1xKNhWO0cvcN5mV/7OrKAcwgswsVjtZO/yP5Rxa4WR8ULprf
         9LYMu/N7i83y68aLVXTkYKt6FWU+ZXTvxSkjGQiOuG84tTbEugIBbmhdeGSBXJZl8Ln2
         /AGFgzojhIFiHJ98HXwuAteqHhtnP4WJiKFZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:date;
        bh=keJKsM9t+Xigd272OZzAyt226ZPdGo/jAWLvUfQ5wNg=;
        b=Uug4fwZbyAJTGndO8voS+bF5SgpDRe2rwY8dfkO5roa5RaENL/hd7F30VPUl+9sK5c
         Ez9fg/lO5suu5XC3TGc5EDVl1ZOZMMVNy9StqJOZd6+MTFHK9R70LH2vDD9OCKE2G5EO
         +dk5bCzUNYGunOS12b75oz/w/9mdFZZm8ioVUCgrqZL5/BcF931bW0p+6YVGAuANnxVp
         ojRsQS+3N+n+D04K3rMX/zgr4Cajb0HHwzuhMPvu2iG1o9JxEFKixDRrO1mQopqJJEBl
         Ul/ZeiBaU1q0R7MJmPFKQocBn5T5+ouRBINvmDz+GLyTz8Ru4CWoNFZshDFsQWvC7YjP
         DJJA==
X-Gm-Message-State: APjAAAU6T9mCvMwKga9rfz3jtsd5Sqr0k1GdBj0BsRUfQwW8Yd8qxAJt
        79F856lJDMnHqVHqM7gcsJD1VA==
X-Google-Smtp-Source: APXvYqzqp81x+edwioSnkLtQmLPvjwAP5YqR7sWHghyWn8edm5LRXIdWACjo8diBzbx3My46M/XTdw==
X-Received: by 2002:a17:90a:3d08:: with SMTP id h8mr7295943pjc.12.1569017212156;
        Fri, 20 Sep 2019 15:06:52 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id w65sm3624680pfb.106.2019.09.20.15.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2019 15:06:51 -0700 (PDT)
Message-ID: <5d854d7b.1c69fb81.8a4b3.9784@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <bab194b89c269f4ab47fecf8292455476fdef604.1569015835.git.amit.kucheria@linaro.org>
References: <cover.1569015835.git.amit.kucheria@linaro.org> <bab194b89c269f4ab47fecf8292455476fdef604.1569015835.git.amit.kucheria@linaro.org>
Cc:     linux-pm@vger.kernel.org
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        masneyb@onstation.org
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v4 15/15] drivers: thermal: tsens: Add interrupt support
User-Agent: alot/0.8.1
Date:   Fri, 20 Sep 2019 15:06:50 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Amit Kucheria (2019-09-20 14:52:30)
> Depending on the IP version, TSENS supports upper, lower and critical
> threshold interrupts. We only add support for upper and lower threshold
> interrupts for now.
>=20
> TSENSv2 has an irq [status|clear|mask] bit tuple for each sensor while
> earlier versions only have a single bit per sensor to denote status and
> clear. These differences are handled transparently by the interrupt
> handler. At each interrupt, we reprogram the new upper and lower threshold
> in the .set_trip callback.
>=20
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

