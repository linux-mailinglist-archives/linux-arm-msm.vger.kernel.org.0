Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B6ED2DDD12
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Dec 2020 03:52:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731514AbgLRCwg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Dec 2020 21:52:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727079AbgLRCwf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Dec 2020 21:52:35 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5441C0617B0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Dec 2020 18:51:55 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id w6so662391pfu.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Dec 2020 18:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=ul+JQXSNam3Jh6+49O94MwvKAzXGAJzUccEcBcdHWAs=;
        b=G42IndBReRqVZg+a2MKBCb1Kt4lvbF/WksJWYeKee00AmCVPkhoe12N+igTMnPs45K
         MuUMt7Et/HKLyEo+4sPBXph5sJD74t1/+Iw+f6zebD11w1O6iabrgvphBzxkxe4kyFef
         nc9nRW4sg0ffad3/Ol1YKAhOt2Ycpb8gAek78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=ul+JQXSNam3Jh6+49O94MwvKAzXGAJzUccEcBcdHWAs=;
        b=pwL1ebaYyTqKUB+/5dgYHM2astmy0J3tkXDi11GrKSXaEU5xZiaoWJFii+VCCuU0jM
         douXYWEOxiFsOt9NYqAR8bTjrIY5/W9xhoYvVO8zEk2Ut2vZXW9wrY2GcvidTktOmwTz
         bu2eZKbev6C6SBLNpAXnxzYW0kp8JMKdOcVokTrAa7SvO5TZLshbGwBkLxjoJZ5HBj6D
         dYgWnebVFexVMqM28G6KQ7tmabI4sdzWXI6ozPZtZnSlFcR4xfHryzKkNgy1ZDuSf5hM
         iCcSZzKH4MKW+i/Mh/LI5G8aA7S5X1Xs0QJyy90dNPMvzMpn+K5UyA9SluMnpfKwsfHv
         tk4A==
X-Gm-Message-State: AOAM533Hpc1tNnwUhqPaaDa+Kk0rPtCDCZqW/9DnfYr4AoO/zsGON/I4
        osHvF2SdXx/CfL0ChTO1F+fxPA==
X-Google-Smtp-Source: ABdhPJwg5+G+1UyV/hGw2/rBQu+naxSAN5HNPZscRDaWeHpeyp1drWCU5fDXVg/R//PgykEOZubs6g==
X-Received: by 2002:a62:1617:0:b029:1a3:c265:a50c with SMTP id 23-20020a6216170000b02901a3c265a50cmr2150152pfw.77.1608259915209;
        Thu, 17 Dec 2020 18:51:55 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id u9sm6943347pfl.143.2020.12.17.18.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 18:51:54 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=XBMYpxLMqEDEwnpVGjtL+iUvCCmXWDrdwngMa-BWGM+w@mail.gmail.com>
References: <20201216144114.v2.1.I99ee04f0cb823415df59bd4f550d6ff5756e43d6@changeid> <20201216144114.v2.3.I07afdedcc49655c5d26880f8df9170aac5792378@changeid> <160817939232.1580929.12113046418592056259@swboyd.mtv.corp.google.com> <CAD=FV=XBMYpxLMqEDEwnpVGjtL+iUvCCmXWDrdwngMa-BWGM+w@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] spi: spi-geni-qcom: Don't try to set CS if an xfer is pending
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Mark Brown <broonie@kernel.org>, msavaliy@qti.qualcomm.com,
        Akash Asthana <akashast@codeaurora.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>
To:     Doug Anderson <dianders@chromium.org>
Date:   Thu, 17 Dec 2020 18:51:52 -0800
Message-ID: <160825991289.1580929.8225600641746583053@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Doug Anderson (2020-12-17 13:35:08)
>=20
> If we wanted to truly make this driver super robust against ridiculous
> interrupt latencies then, presumably, we could handle the SPI timeout
> ourselves but before timing out we could check to see if the
> interrupts were pending.  Then we could disable our interrupts,
> synchronize our interrupt handler, handle the interrupt directly, and
> then re-enable interrupts.  If we did this then transfers could
> continue to eek their way through even if interrupts were completely
> blocked.  IMO, it's not worth it.  I'm satisfied with not crashing and
> not getting the state machine too out-of-whack.
>=20

Ok that's fair. If it's not worth the effort then let's drop this idea.
