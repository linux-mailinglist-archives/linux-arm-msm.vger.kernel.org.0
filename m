Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9A4020A752
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 23:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405821AbgFYVSO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 17:18:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404016AbgFYVSM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 17:18:12 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFFB6C08C5C1;
        Thu, 25 Jun 2020 14:18:11 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id y18so3366241plr.4;
        Thu, 25 Jun 2020 14:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ml0ZT7PzS1Kij+Cv5CAAQj/ZaDAV3sSYmcfaMZxaUMw=;
        b=bhvqaCc2cTcis1QzUVntpKJ/7N7yQRCtXy76KJIrrkUvO75HpCSjA3POorsRqYgda6
         RSQeMtSZbdid1VofDezQgA494f7/88dieNdvjIY6I9QXUqRyA1d+/b/A3HVrw41g9LJJ
         PZkrXQWu7TdBeR3tT8EpHTZmIfY8BDUXnRM7lK71UMi+m4SCXZWWsoOE8AC0FaRo3DeS
         OwA26bQ4BCQuWn1UNa65D5yudfFGE543miaynvU3ObB09/toLdKEcToTE36eRHz2y0OJ
         NRf3NQItPWKJP2W9nGIF/YqcamIUda2EHHhvOC8VOKZhNmXOHt3TjZsemUewUb63fDrs
         h1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ml0ZT7PzS1Kij+Cv5CAAQj/ZaDAV3sSYmcfaMZxaUMw=;
        b=iTt2jcG9SmU6i0B70Ra03ovgwzDKDJu81rZRAulNve44lOn9o7pHYCauCT6zoBMU0T
         +bFFVkgBXesT8beMrqerlNMPNIRcYCQA+g1Kd3nkumEni3YJrjgMmJ8Mv9iIpfubXUBw
         40YH7jslBfiXu3/3+CPVCTLEo+n4bM5YEjYfYRrtBYgUkI5nrdsbkYaz5MvwrnV32Eqq
         adWuMlsQk7vRxS9GOW9h7OpkJoBgf1Ursok5jo4W0139P/Llu/8WrEnW30hrcbwlQVNd
         MBrV8M4gxdclfZ7cvx4MisaPwhvRN2be0n4ANyKDlm9GI28avvu9ZQ1EM0x0KU65f8Rz
         tsLA==
X-Gm-Message-State: AOAM532dWH8Zs7ZaPDBrzk79BY5PgGSuYGUkR7FxLoiaxh3eG3Xym1Qe
        3ANxsxy1fuyolOWRog7/bpk=
X-Google-Smtp-Source: ABdhPJwBDHD5iDgvxSTDTxa1YGry9WHhTtOhbcAmuwMxCTvF8qfwECcQrmnwFhDbZvIeONBdYLkXJA==
X-Received: by 2002:a17:902:70ca:: with SMTP id l10mr31673217plt.31.1593119891399;
        Thu, 25 Jun 2020 14:18:11 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x8sm9903077pff.54.2020.06.25.14.18.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 14:18:10 -0700 (PDT)
Date:   Thu, 25 Jun 2020 14:18:09 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCHv3 0/2] Convert QCOM watchdog timer bindings to YAML
Message-ID: <20200625211809.GA175066@roeck-us.net>
References: <cover.1581459151.git.saiprakash.ranjan@codeaurora.org>
 <c2b8fabcf82b27c7334482bd53ebba62@codeaurora.org>
 <20200621073320.GI128451@builder.lan>
 <ce4c2b44cb15af12b04c09f1786a6c1a@codeaurora.org>
 <20200625160042.GC149301@roeck-us.net>
 <3e3cf81452e33c9385900177d0630a11@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e3cf81452e33c9385900177d0630a11@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 26, 2020 at 12:52:31AM +0530, Sai Prakash Ranjan wrote:
> > > 
> > I don't think the watchdog mailing list has been copied on this series,
> > meaning I don't have a copy that I could apply if I wanted to.
> 
> I kept you in CC for all the revisions but missed adding watchdog list.
> Will resend with the appropriate lists added.
> 

I use patchwork to track patches, tags, and my responses. No patchwork,
no patch, no tags, and no tracking.

> > I also see
> > no evidence for a Reviewed-by: tag from Rob or any other DT maintainer.
> > 
> 
> Not sure why you think I would add reviewed-by tag from Rob without him
> giving one.

Same response as above.

Guenter
