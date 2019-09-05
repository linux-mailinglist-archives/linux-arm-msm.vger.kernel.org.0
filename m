Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01C12A9AF1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2019 08:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731620AbfIEGy1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Sep 2019 02:54:27 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51964 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbfIEGy1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Sep 2019 02:54:27 -0400
Received: by mail-wm1-f68.google.com with SMTP id k1so1330739wmi.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2019 23:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=0vLES3KcXlbini5YZPkYzSNWuB2HCug+phEKjv2g50I=;
        b=aVMxM2zIRwBMfDICMK4DSKmd5ISvZcUcq13BUth0B8nv9QwXj8Dv9SgnF+Jdd0XlgY
         f79rQFvgQaAk81r/iFiByGiYD56Ah97+/qyesL/qzg0TwKgikG5qWH51yY59V45sAjpH
         om2JGIZ83c2Stmlon5oaht20cUk9luPtN/hzNcK2sZZENLT2Jd3jmWIb0BpKeNgjgSr0
         zxOhZAEVXkC7aI4cNLZzRGOL3+r8FEvgjvgYuOClhgNo/a7rE8hrqGVOejsnk5WKL+U+
         NXHYPf+rqjdKAzPOEsrrkPAT18hwij2RtHuYF44Y+zDAp7YRCCQGb0q6uBQODPqwcMPv
         /PSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=0vLES3KcXlbini5YZPkYzSNWuB2HCug+phEKjv2g50I=;
        b=kr0jHiJnR55dEfV8xczQdL05LZtd/zlInxh5tvtcNm3RrQqm3wx12ieqav8L+sqfFn
         DYNZ8HFgucpTpuOfc71shND1jiPV73FpiPH3NOdaJ6wdDf/pnIKY9buq3zp7lJy45w5o
         GpEKjrG31ImWHIPB3Z1IQtNWeKbNEgTuiRJYDNmZkjWt6YcI8uOMZ93CmByan7BE8bUa
         4+b65bn7Z6DLiajTr37dCxD4bTw/r8p2YbYfJrqaaCrDDTCKsyFGOTUzvus+LX92czZ+
         pqZRhqrGco/6wUQ0plVFceF+f2RVe+34WelImbTLxyBpE3tFXta7xz+zp6BZ68c9HGIQ
         QR1A==
X-Gm-Message-State: APjAAAWGMVMZB3IRYezElcOH1yab/fM0jd3BF9XNkxicB7KNUbsvmEkD
        TkODUFgGk/3Q3ZZCCg/LA5Nb3Q==
X-Google-Smtp-Source: APXvYqybtPbpgaySYMeYrQmaZI0zhXnSJyRoe+if2iMchmxVY7RVAH8EwyN919lmLDwHmgEQic9NmA==
X-Received: by 2002:a1c:c5cb:: with SMTP id v194mr1518468wmf.108.1567666464468;
        Wed, 04 Sep 2019 23:54:24 -0700 (PDT)
Received: from dell ([95.147.198.36])
        by smtp.gmail.com with ESMTPSA id v2sm3538896wmf.18.2019.09.04.23.54.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 23:54:24 -0700 (PDT)
Date:   Thu, 5 Sep 2019 07:54:23 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/1] soc: qcom: geni: Provide parameter error checking
Message-ID: <20190905065423.GV26880@dell>
References: <20190903135052.13827-1-lee.jones@linaro.org>
 <20190904031922.GC574@tuxbook-pro>
 <20190904084554.GF26880@dell>
 <20190904182732.GE574@tuxbook-pro>
 <20190904200130.GT26880@dell>
 <20190904202656.GB580@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190904202656.GB580@tuxbook-pro>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 04 Sep 2019, Bjorn Andersson wrote:

> On Wed 04 Sep 13:01 PDT 2019, Lee Jones wrote:
> 
> > On Wed, 04 Sep 2019, Bjorn Andersson wrote:
> > 
> > > On Wed 04 Sep 01:45 PDT 2019, Lee Jones wrote:
> > > 
> > > > On Tue, 03 Sep 2019, Bjorn Andersson wrote:
> > > > 
> > > > > On Tue 03 Sep 06:50 PDT 2019, Lee Jones wrote:
> [..]
> > > > With this simple parameter checking patch, the SE falls back to using
> > > > FIFO mode to transmit data and continues to work flawlessly.  IMHO
> > > > this should be applied in the first instance, as it fixes a real (null
> > > > dereference) bug which currently resides in the Mainline kernel.
> > > > 
> > > 
> > > Per the current driver design the wrapper device is the parent of the
> > > SE, I should have seen that 8bc529b25354 was the beginning of a game of
> > > whac-a-mole circumventing this design. Sorry for not spotting this
> > > earlier.
> > 
> > Right, but that doesn't mean that the current driver design is
> > correct.  ACPI, which is in theory a description of the hardware
> > doesn't seem to think so.  It looks more like we do this in Linux as a
> > convenience function to link the devices.  Instead this 'parent' seems
> > to be represented as a very small register space at the end of the SE
> > banks.
> 
> There's a larger register window containing one block of common
> registers followed by register blocks for each serial engine.
> 
> I don't know if we will need more of the common registers in the future,
> but for now you at least have the requirement that in order to operate
> the SEs you need to clock the wrapper. So the current DT model
> represents the hardware and the power/clocking topology.
> 
> The fact that you managed to boot the system with just ignoring all
> clocks is a surprise to me.

That is a prerequisite of UEFI/ACPI.  All clocks, registers, phys,
resets, etc must be configured by the firmware.  We should only need
to play with them for Power Management purposes (which requires the
PEP to be enabled).

> > > But if this is the one whack left to get the thing to boot then I think
> > > we should merge it.
> > 
> > Amazing, thank you!
> > 
> > Do you know how we go about getting this merged?  We only potentially
> > have 0.5 weeks (1.5 weeks if there is an -rc8 [doubtful]), so we need
> > to move fast.  Would you be prepared to send it to Linus for -fixes?
> > I'd do it myself, but this is a little out of my remit.
> > 
> 
> The "offending" commit was picked up mid June and no one noticed that it
> doesn't work until this week?

I think you're viewing this from the wrong angle.  The "ACPI
enablement" commit(s) merely prevented the use of the Clock and
Regulator APIs, as per the ACPI guidelines.  See [0].

Right.  Unfortunately, I developed this on top of our DT enablement
patches, which also included your Geni SE DMA and Regulator status
hacks, which meant I missed this and the above until now.

It's only now I've had the chance to attempt to boot raw Mainline that
these came to light, hence the last minute panic to try and fix them.

> Let's slap a Cc: stable@ on it and get it into v5.4-rc1 and it will show
> up in v5.3.1.

We *can* do that, however my fear is that the distros are going to be
releasing their new versions (next month) based on v5.3.  Which would
mean they will not boot on these platforms until they backport these
patches, which might be some months later.

This is the only issue that prevents ACPI from booting, meaning we can
at least make use of the distro installers when they are released.
The patch is very simple and low-risk, so ideally it would go into
-rc7.

[0] Documentation/arm64/arm-acpi.rst

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
