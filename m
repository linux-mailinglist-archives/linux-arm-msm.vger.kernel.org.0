Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 835F0A93AF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2019 22:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730219AbfIDU1A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Sep 2019 16:27:00 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39498 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbfIDU1A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Sep 2019 16:27:00 -0400
Received: by mail-pg1-f195.google.com with SMTP id u17so44486pgi.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2019 13:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gHXopKFHzfE49twF88UvtmDlbMN38YDZW1AoH7082oE=;
        b=DLUsWH99wenvPEpVvVSfF1d0qo3YVU2SKaU3twQDF4nwTd/7vJuMNynkyGX3R6VOse
         SqIGJx0ao5UDaFQ6u8d4ybCAMVVZ2n0wH3v0tY2XkqWJGQeZ88YWs+8sexlyUHS9n4yx
         t5FdYBhkD3lP1E7k+nc75Ex0NDzJZOplSjl6q9N9j9vQw/7jadVr9gXaNx7ff4cGoRf1
         icrBkr3XgeQVMoU3SIm+i96fdWRSHRwOrGxip2CjAELbyoAm1wZM+E7YMSpkZ8PYwNoe
         loRuEBKLEPVRn2BBWmx7mSyTi0uwGCrbIU91woKz9C8RpojEkGNN01LdP+ieI/H1QVxW
         RpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gHXopKFHzfE49twF88UvtmDlbMN38YDZW1AoH7082oE=;
        b=dpVarycLli92wSox0m9Y0DDV9GnCOUnoARsgq+rhw9noyp39pt21ujp9LzPfKtAIns
         z+KXj97HsPtlSIAkhedf4JghuIMqkSrNaQY3eLvxg8kSZa5OwqO6GIq0HyzMl/dFmoVE
         OhZak28aSBwN/xxhdIFr3zbhHAx4o8ER90qLLgz1Mzxvccunn26qEwTyaTT23uIqVFSr
         Wy5TuQgotiAkrhm79yNUsHskez5fVXcZ8RtBv0qD0jdPBBxsCwRzx2s8SYULUR0d+bxT
         zuWVJ+qSRKh7q6XPecsnH1waXbnCKuNqTYjfVixgZGOnbXpzQxRSLqOmxo942ERFdiHO
         ooMA==
X-Gm-Message-State: APjAAAX7h0ESZMBdBhq2Ewb2QFVX/wDhIrveA6meYh95WvUV3OzfdIH0
        ewhKk2UfbjWVJbUigEw6hAcE4w==
X-Google-Smtp-Source: APXvYqxFPUmP/jYPMT2DzWP/8rdwbetVerpvv8p9rtrq4YREH6sU5CzRKastQRxLomV0nVAQjILaYw==
X-Received: by 2002:a62:1955:: with SMTP id 82mr32346422pfz.256.1567628819360;
        Wed, 04 Sep 2019 13:26:59 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y194sm660594pfg.186.2019.09.04.13.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 13:26:58 -0700 (PDT)
Date:   Wed, 4 Sep 2019 13:26:56 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     agross@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/1] soc: qcom: geni: Provide parameter error checking
Message-ID: <20190904202656.GB580@tuxbook-pro>
References: <20190903135052.13827-1-lee.jones@linaro.org>
 <20190904031922.GC574@tuxbook-pro>
 <20190904084554.GF26880@dell>
 <20190904182732.GE574@tuxbook-pro>
 <20190904200130.GT26880@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190904200130.GT26880@dell>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 04 Sep 13:01 PDT 2019, Lee Jones wrote:

> On Wed, 04 Sep 2019, Bjorn Andersson wrote:
> 
> > On Wed 04 Sep 01:45 PDT 2019, Lee Jones wrote:
> > 
> > > On Tue, 03 Sep 2019, Bjorn Andersson wrote:
> > > 
> > > > On Tue 03 Sep 06:50 PDT 2019, Lee Jones wrote:
[..]
> > > With this simple parameter checking patch, the SE falls back to using
> > > FIFO mode to transmit data and continues to work flawlessly.  IMHO
> > > this should be applied in the first instance, as it fixes a real (null
> > > dereference) bug which currently resides in the Mainline kernel.
> > > 
> > 
> > Per the current driver design the wrapper device is the parent of the
> > SE, I should have seen that 8bc529b25354 was the beginning of a game of
> > whac-a-mole circumventing this design. Sorry for not spotting this
> > earlier.
> 
> Right, but that doesn't mean that the current driver design is
> correct.  ACPI, which is in theory a description of the hardware
> doesn't seem to think so.  It looks more like we do this in Linux as a
> convenience function to link the devices.  Instead this 'parent' seems
> to be represented as a very small register space at the end of the SE
> banks.
> 

There's a larger register window containing one block of common
registers followed by register blocks for each serial engine.

I don't know if we will need more of the common registers in the future,
but for now you at least have the requirement that in order to operate
the SEs you need to clock the wrapper. So the current DT model
represents the hardware and the power/clocking topology.

The fact that you managed to boot the system with just ignoring all
clocks is a surprise to me.

> > But if this is the one whack left to get the thing to boot then I think
> > we should merge it.
> 
> Amazing, thank you!
> 
> Do you know how we go about getting this merged?  We only potentially
> have 0.5 weeks (1.5 weeks if there is an -rc8 [doubtful]), so we need
> to move fast.  Would you be prepared to send it to Linus for -fixes?
> I'd do it myself, but this is a little out of my remit.
> 

The "offending" commit was picked up mid June and no one noticed that it
doesn't work until this week?

Let's slap a Cc: stable@ on it and get it into v5.4-rc1 and it will show
up in v5.3.1.

Regards,
Bjorn
