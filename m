Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F307133C20
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 08:21:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbgAHHVz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jan 2020 02:21:55 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34218 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbgAHHVz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jan 2020 02:21:55 -0500
Received: by mail-pg1-f193.google.com with SMTP id r11so1133011pgf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2020 23:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jmjSHyh8e2hWoS9VNgQYqmjoW9dzxrAkCZTJgt4c8a0=;
        b=EEYjC5BtwzCaCivduEjoDalehEw3p0Y6rtv2zTijE4RYYdKUSR1mTkTPIOVSzi0y/R
         hjYcAnLBhBLqKw9V9ekeus1AxZS8F3l3smoW1YG0SiW4iWaS93fVAT2DARhNa7UJRzGN
         iWX4AUIadf5vxwCwg6GS9xbr79CuOYLKKpASzOHdVYTkhFtNjTRl7i7Z7CTNYN/jpRcp
         +FHMPRblJcIm9bPYVQktK2D1K5msPY5lRZR6722lTS1ehRSqC5SXz6fiQkbBjDxYIydd
         6y1rrhmG9tSwjNXOmD5luMOX8Ovw1URsFooBIn0urgukoXhzTI4la0ajYt0sCVkjI1Hg
         tzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jmjSHyh8e2hWoS9VNgQYqmjoW9dzxrAkCZTJgt4c8a0=;
        b=GLqHmLLfsu48Z64U4u8wAI/T1l6/iH2iX8uC8Hfs1fPLPFhke0ho8ZqEkiv7359gHT
         PRJFCdIYTQ0MksKGdfOjdHAsSsLgZeSIrg5N1P4oc7yMW789NBnaIXDuKdNUSX1cD7jq
         59vC1cR3keeeaqPIJrAHG9b0zWa2U1w1Y+qUT9k5HJBHRIKC7X4St25o82j3y8VGcIPt
         N1MqDef47E3CVWX2xXISzesPKamPxui4YYW63O4hTgsYs5dnykYbyzoz0fCAZmE4lQqw
         +ZHB08kSrH7jMwP+ZDhT6lsGTCo5lshze+Pm8+9R8TY+NgSKZICk8s9qc9C0oqQnoNhm
         u4Yg==
X-Gm-Message-State: APjAAAVrqYjaxzzxB95nn4RwY1o4j4NaEGap1RZ1Q256/jR1KP2KoE/X
        HNUpXfdZVKBAPZxDyQEa+qBJZA==
X-Google-Smtp-Source: APXvYqwR9ThWO3EzrxMnQyo4YaXsMwgg0CBErRFQPRm+ld9Bktk2BryEH7fAlMNpDOL9NUALgiCXVA==
X-Received: by 2002:a62:7fcd:: with SMTP id a196mr3525439pfd.208.1578468114212;
        Tue, 07 Jan 2020 23:21:54 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u23sm2027296pfm.29.2020.01.07.23.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 23:21:53 -0800 (PST)
Date:   Tue, 7 Jan 2020 23:21:50 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Elliot Berman <eberman@codeaurora.org>, agross@kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        saiprakash.ranjan@codeaurora.org, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        Brian Masney <masneyb@onstation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/17] Restructure, improve target support for
 qcom_scm driver
Message-ID: <20200108072150.GK738324@yoga>
References: <1578431066-19600-1-git-send-email-eberman@codeaurora.org>
 <20200108064253.GB4023550@builder>
 <5e157cb3.1c69fb81.4f0ae.6172@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e157cb3.1c69fb81.4f0ae.6172@mx.google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 07 Jan 22:54 PST 2020, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2020-01-07 22:42:53)
> > On Tue 07 Jan 13:04 PST 2020, Elliot Berman wrote:
> > 
> > > This series improves support for 32-bit Qualcomm targets on qcom_scm driver and cleans
> > > up the driver for 64-bit implementations.
> > > 
> > > Currently, the qcom_scm driver supports only 64-bit Qualcomm targets and very
> > > old 32-bit Qualcomm targets. Newer 32-bit targets use ARM's SMC Calling
> > > Convention to communicate with secure world. Older 32-bit targets use a
> > > "buffer-based" legacy approach for communicating with secure world (as
> > > implemented in qcom_scm-32.c). All arm64 Qualcomm targets use ARM SMCCC.
> > > Currently, SMCCC-based communication is enabled only on ARM64 config and
> > > buffer-based communication only on ARM config. This patch-series combines SMCCC
> > > and legacy conventions and selects the correct convention by querying the secure
> > > world [1].
> > > 
> > > We decided to take the opportunity as well to clean up the driver rather than
> > > try to patch together qcom_scm-32 and qcom_scm-64.
> > > 
> > 
> > Series applied.
> 
> Without the change-ids presumably?

Of course.

> I was going to review the patch series tomorrow but I guess no more
> need! ;-)
> 

Thanks, I do appreciate the intention :)

Regards,
Bjorn
