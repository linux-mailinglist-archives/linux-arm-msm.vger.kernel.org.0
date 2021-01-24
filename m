Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFF1F301F03
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jan 2021 22:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbhAXVwQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jan 2021 16:52:16 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166]:24516 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbhAXVwP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jan 2021 16:52:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1611524961;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:From:
        Subject:Sender;
        bh=NSnGwwqn9sdPtkfoFA8tFRtFDL/birwrCnYk8NJrUB4=;
        b=hr2pt92cWBv0ZHnyCVwblXzqlJtwGiz41JFpTxG9UAd+HF3cHOsEEVRQouX1xLQywy
        qSHDqREvtSEWeO85I3z4s5hwBRRlNWPxBKF1st5s3hQM18a56MGfEM5fkH9TjYUtegpy
        lxd/6sS2ik9a6VYXNfWpr2AJlAEfaepProdZ2oY1rvKfi1Ul+ugqh2RJ8WyWtqYEccfM
        BQP7O6ODK6jxhvpazxyQjUZ9o2QT8g/QMjdxyP2lBLLjXc3Uwcoefcuf72tnldrdQsL0
        uCeFrDkqCnmPGCbYWgjY4P5IqvErg/OmQo96XH+0jjpkBJ5gaBcgVD3vbyFzY9FIlvLV
        jgpg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7IczBa4o="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
        with ESMTPSA id R0a218x0OLnGiXN
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 24 Jan 2021 22:49:16 +0100 (CET)
Date:   Sun, 24 Jan 2021 22:49:12 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jonathan Albrieux <jonathan.albrieux@gmail.com>,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 0/3] Add initial support for BQ Aquaris X5
Message-ID: <YA3rTAx2vfOXPCMq@gerhold.net>
References: <20210124135409.5473-1-jonathan.albrieux@gmail.com>
 <20210124210119.GA27676@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210124210119.GA27676@amd>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Pavel,

On Sun, Jan 24, 2021 at 10:01:19PM +0100, Pavel Machek wrote:
> Hi!
> 
> > Aquaris X5 (Longcheer L8910) is a smartphone released by BQ in 2015.
> > 
> > As part of msm8916-mainline project, this series aims to bring initial
> > mainline support for it.
> 
> Good to see another phone being supported. Can I ask you to cc:
> phone-devel@vger.kernel.org with phone stuff?
> 
> > Features added:
> >  - SDHCI (internal and external storage)
> >  - USB Device Mode
> >  - UART
> >  - Regulators
> >  - WiFi/BT
> >  - Volume buttons
> >  - Vibrator
> >  - Touchkeys backlight
> >  - Accelerometer and gyroscope sensor
> >  - Magnetometer sensor
> 
> How close are you to having useful phone calls?
> 

You can do phone calls (with audio) and you can use mobile data, if you
have the patches for that. :) I'm trying to find time to finish up the
drivers needed for that, but I've been a bit short on time lately.

Actually we have come pretty far with MSM8916-based smartphones.
Most functionality is (somewhat) working at this point, the primary
open task is optimizing suspend/power consumption. Battery/charging
and camera is also tricky but works somewhat on some of the devices.

Most of the functionality is packaged in postmarketOS [1] and you can
find a list of the devices in the postmarketOS wiki [2]. Especially
the ones in the "community" category are quite similar in terms of
working functionality.

Stephan

[1]: https://postmarketos.org
[2]: https://wiki.postmarketos.org/wiki/Qualcomm_Snapdragon_410/412_(MSM8916)
