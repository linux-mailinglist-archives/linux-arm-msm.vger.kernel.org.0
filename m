Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EFCE3072E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 10:40:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232076AbhA1Jj0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jan 2021 04:39:26 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.167]:19547 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232466AbhA1Jag (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jan 2021 04:30:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1611826058;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
        From:Subject:Sender;
        bh=ggZcq1KRQ/pdSEYJdxgcAOgsVpYsxLJwddK5gt6xtlg=;
        b=a+te04OOr9mo/KRqXVvzw3BBi/E+Jc/Sdv3h/v4T+kfmGG++zHgXOyrdCNOACpdHrr
        1xQ98/ASaqS/PuPn1lfNY4oBlTMZS9ektTIncbfqowGJcnVfX79TbsHiDX76RfdYFObn
        ayXHyoj5VoTN1pxiiyMIc1Rjk1i63KYFcDvpU2rgdG6cF3qt8GGd8WGgKOq00r2uILrx
        5/d/mVTMPm7C68IajcEi6HHGC0UxNFeEeXusnHKi9KJSYxj7B9bagRBuhmPHRhNT5S6N
        rENCbMYEhcJ5CR2SYc+wHxmSjVrrovwYF1YcdDt1oiZ6EIBK/i/n2dVksjguFYuaS9rB
        JB7g==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j9IczEaYo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 47.16.0 DYNA|AUTH)
        with ESMTPSA id L06318x0S9RV36x
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 28 Jan 2021 10:27:31 +0100 (CET)
Date:   Thu, 28 Jan 2021 10:27:19 +0100
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
Message-ID: <YBKDa1irydOUaXag@gerhold.net>
References: <20210124135409.5473-1-jonathan.albrieux@gmail.com>
 <20210124210119.GA27676@amd>
 <YA3rTAx2vfOXPCMq@gerhold.net>
 <20210127222407.GD24799@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210127222407.GD24799@amd>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 27, 2021 at 11:24:07PM +0100, Pavel Machek wrote:
> > > How close are you to having useful phone calls?
> > 
> > You can do phone calls (with audio) and you can use mobile data, if you
> > have the patches for that. :) I'm trying to find time to finish up the
> > drivers needed for that, but I've been a bit short on time lately.
> 
> > Most of the functionality is packaged in postmarketOS [1] and you can
> > find a list of the devices in the postmarketOS wiki [2]. Especially
> > the ones in the "community" category are quite similar in terms of
> > working functionality.
> 
> I know about postmarketOS (I even contributed a bit some time ago),
> and watch it from time to time. Currently I'm using old Nokia 6151 for
> phone calls, but would not mind switching. Work is ongoing in Droid 4
> land -- phone calls are also "almost there". But the almost seems to
> be a lot of work :-(.
> 

It's fairly simple on Qualcomm SoCs once audio DSP and modem are working
(which is not that simple). I basically just tell the audio DSP to
stream voice call audio to the audio ports and then it does that without
involving the kernel.

It seems to work quite well, so far no one complained about quality or
something like that. Not sure if anyone is actively using it already
though :)

The work left is mainly making the driver more generic so it can work on
other Qualcomm SoCs as well (right now I have some things hardcoded).
Also, I still haven't fully figured out what is the best way to
integrate it into ASoC/UCM/..., so that it can be easily activated when
starting a voice call.

Stephan
