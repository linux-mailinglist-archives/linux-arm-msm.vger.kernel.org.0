Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7574A19D603
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 13:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390823AbgDCLq5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Apr 2020 07:46:57 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44204 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390803AbgDCLq4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Apr 2020 07:46:56 -0400
Received: by mail-wr1-f67.google.com with SMTP id m17so8112001wrw.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2020 04:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=z4qKFg6qXiNpdW9Pcge07URxEO1f5F1p0WXHLjizMek=;
        b=cy0xGlAQCTV/PM6ifc1OO1V5FvGLvtNYEZO+HbG8tYM54s+gAqPm4ORNDjdKSXReC8
         MJzCdiQt4deFeu/7xCrD8ivzBosAwex55PpoXBpQvqwHm1P+pSLvxk14N4wJJtNQlFS8
         Tse8mAdJ43/j5goZZEBblM/M3/fe8RHWMLaAhDk4dYZ3RVqgFlhddSMH0QjwauU95uzD
         MEo8Bb9Z7F1+Rho5FivNBOA9FuYeOaPf+KlrloSPCXtAMtK+8FfwQwLFycPjPLmJFzD8
         EF9x01UeNB7/cxm+NnEBow5LOcfs+7jytKvRDkrzKfjSM1gvmu4OMnEY9KAmpnp4myuE
         PBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z4qKFg6qXiNpdW9Pcge07URxEO1f5F1p0WXHLjizMek=;
        b=tu9nu/Y/6fsAC8HQeaizlDW5Yqw/XknUqqAuk30DR0axMsh0KTuKGdettYdpRWO8Fs
         wwfUG1pjkLoj98SJ6IZ3r+YRijnJOG4ySwQxfnarsug9e9fkfQbLoRSPgIAw0vd6jWCi
         u3C5RjFp4l9nklslTPldam+5vcALHqtjoaZwZuHDLHb21JpRsN94DsbQe00Xtv3QA8mG
         4T84Rkv659WIoeNYKOTLsIibEojQzGc8NURQ8a/iG5RTBRxuNBKIgn5s0DUzVFcfDZFq
         KmjSckoHx2rZR+FDVKYcxSO5Ebjd4mZACOWRwV4XF/Ice6UBjy92zvZQXe/qdgCOBI98
         gB6w==
X-Gm-Message-State: AGi0Pubhald/VzPlScMcol4i/t1ef+i+p0MbIuYxyPhVAItkoTnfVNEr
        15wGXU8u2fUTOsaQnErahAFloQ==
X-Google-Smtp-Source: APiQypLGVZe/sOG4rt6Fih9z1DA1NrDQgRLiqudSb6Y23oGtTFFmse8DqJw+/x115r+9L2PbKAni/g==
X-Received: by 2002:a5d:674f:: with SMTP id l15mr8490276wrw.196.1585914414310;
        Fri, 03 Apr 2020 04:46:54 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id t81sm10970106wmb.15.2020.04.03.04.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 04:46:53 -0700 (PDT)
Date:   Fri, 3 Apr 2020 12:46:51 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     kgunda@codeaurora.org
Cc:     Rob Herring <robh@kernel.org>, bjorn.andersson@linaro.org,
        jingoohan1@gmail.com, lee.jones@linaro.org,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        linux-arm-msm@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: Re: [PATCH V4 1/4] backlight: qcom-wled: convert the wled bindings
 to .yaml format
Message-ID: <20200403114651.m6rholzufzqinanc@holly.lan>
References: <1584985618-25689-1-git-send-email-kgunda@codeaurora.org>
 <1584985618-25689-2-git-send-email-kgunda@codeaurora.org>
 <20200331175401.GA9791@bogus>
 <ac8f25113a3bb233c11fd7cd9e62c2cf@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac8f25113a3bb233c11fd7cd9e62c2cf@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 03, 2020 at 04:45:49PM +0530, kgunda@codeaurora.org wrote:
> On 2020-03-31 23:24, Rob Herring wrote:
> > On Mon, Mar 23, 2020 at 11:16:55PM +0530, Kiran Gunda wrote:
> > > diff --git
> > > a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> > > b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> > > new file mode 100644
> > > index 0000000..8a388bf
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> > > @@ -0,0 +1,184 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Binding for Qualcomm Technologies, Inc. WLED driver
> > > +
> > > +maintainers:
> > > +  - Lee Jones <lee.jones@linaro.org>
> > 
> > Should be the h/w owner (you), not who applies patches.
> > 
> will address in next post.
> <snip>
> will address in next post.
> <snip>
> will address in next post.
> <snip>
> will address in next post.
> <snip>
> will address in next post.
> <snip>
> will address in next post.
> <snip>
> will address in next post.
> <snip>
> will address in next post.
> <snip>
> will address in next post.

If you agree on all points raised I doubt there is any need for a point
by point reply since everyone who reads it will have to scroll down
simply to find out that you agree on all points.

Better just to acknowledge the feedback and reply to the first one
saying you'll agree on all points and will address all feedback in the
next revision (and then trim the reply to keep it short).


Daniel.
