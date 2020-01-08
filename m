Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FEDC133BEC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 07:54:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726079AbgAHGyp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jan 2020 01:54:45 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:47040 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgAHGyp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jan 2020 01:54:45 -0500
Received: by mail-pf1-f193.google.com with SMTP id n9so1101044pff.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2020 22:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:subject:to:from:user-agent:date;
        bh=jrDSpPlac7LfKsNtNNcdyco4L0d7qWfB7luT8Ldf28Y=;
        b=I69W7MImSC2wNVx/FY0O7PzWcgYEwrZUPpWt7h55LmqvKIrIQDJUgcvL643IVqK6mN
         bvfR68TMy3Dls/cKYwYlmiG8iVgRgxM2v08um2gSy4qJG0HRE4DwpZOvX88psHT0NT2z
         b/Q/gp1vjy0nAnB5/nlsA9NHEByMbm188IcJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:subject:to:from
         :user-agent:date;
        bh=jrDSpPlac7LfKsNtNNcdyco4L0d7qWfB7luT8Ldf28Y=;
        b=DHKclvXP6uxuLhUyY80sqA5dXBUmGL7mH1AdHzXebB1J8LuB7zplRWI4U+osCgt7aW
         ZczZYSpmT72SNmsZy0D34IWGyFzSqxgJuZC5zIcLFR2j9A4iyxawzsVOv3ZfvuWcZIlQ
         18gRqvt/b98W+l8G4hH2toznf5VPSXZu8yf3MbGujeijAXeX1y1GRL1mObc+dLh5DCLA
         vy1mIRdzPhR7iGfaUO7cgy4SG5xRO3+Rllgu96y9NjXfeSKvXI38anRgnd0R1rfecZQa
         t5Bxt2RkhvqyRjoobw7jEPQLyEJXVwDT9IEhhTVFAvZ5LAMQNtbaH1RfeDFKKY/fruSQ
         vc3Q==
X-Gm-Message-State: APjAAAVjm5cneiby906RdRV01RkDcUMH/5Kz71HD1H08A4PCnBXVK0sT
        x2Wcv6VIJS2oI/vYbfJvzyqS/w==
X-Google-Smtp-Source: APXvYqz8or0Ls9NkRnH1QhAOAttYIbiRMPl/me//+J1jryiU1iq3zijNwoGBlvn8iwQILz//9BLm+w==
X-Received: by 2002:a63:1b54:: with SMTP id b20mr3695731pgm.312.1578466484350;
        Tue, 07 Jan 2020 22:54:44 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x11sm1836650pfn.53.2020.01.07.22.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 22:54:43 -0800 (PST)
Message-ID: <5e157cb3.1c69fb81.4f0ae.6172@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200108064253.GB4023550@builder>
References: <1578431066-19600-1-git-send-email-eberman@codeaurora.org> <20200108064253.GB4023550@builder>
Cc:     agross@kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        saiprakash.ranjan@codeaurora.org, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        Brian Masney <masneyb@onstation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/17] Restructure, improve target support for qcom_scm driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Elliot Berman <eberman@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Tue, 07 Jan 2020 22:54:43 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2020-01-07 22:42:53)
> On Tue 07 Jan 13:04 PST 2020, Elliot Berman wrote:
>=20
> > This series improves support for 32-bit Qualcomm targets on qcom_scm dr=
iver and cleans
> > up the driver for 64-bit implementations.
> >=20
> > Currently, the qcom_scm driver supports only 64-bit Qualcomm targets an=
d very
> > old 32-bit Qualcomm targets. Newer 32-bit targets use ARM's SMC Calling
> > Convention to communicate with secure world. Older 32-bit targets use a
> > "buffer-based" legacy approach for communicating with secure world (as
> > implemented in qcom_scm-32.c). All arm64 Qualcomm targets use ARM SMCCC.
> > Currently, SMCCC-based communication is enabled only on ARM64 config and
> > buffer-based communication only on ARM config. This patch-series combin=
es SMCCC
> > and legacy conventions and selects the correct convention by querying t=
he secure
> > world [1].
> >=20
> > We decided to take the opportunity as well to clean up the driver rathe=
r than
> > try to patch together qcom_scm-32 and qcom_scm-64.
> >=20
>=20
> Series applied.

Without the change-ids presumably? I was going to review the patch
series tomorrow but I guess no more need! ;-)

