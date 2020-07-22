Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF7D6228FB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jul 2020 07:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgGVFa2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jul 2020 01:30:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbgGVFa2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jul 2020 01:30:28 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4F13C0619DB
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 22:30:27 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id w126so408417pfw.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 22:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dl6zwzhq+FsMerc9qwgjpE1ja24WRPYdLlSyn3M9Lhc=;
        b=wFYPLNpIceaExhbJzjXzj6tDwJR+E2dHZTr/ewhWaneEnAkKVT4tW3ngs4Ana5WOY4
         JfAbIvMdjf1VIJe9UXtwIm9fjoqxZ4usIYpwHCVaZavJIFFd+fnrU6vME5UiA3OflLMv
         PjFwR9gTJfbDkCNCnxFjdkM5ybfl439hSbbNWHF+AANDuDpkYtixQfBLNPZswGRM2DZc
         A+KAoq8xOpfUBwZcC55ebWCtTICdrxK1ie00kDe8G4+14vi1XxzOFtfhfeTXnUap7efU
         QN1XAOgUSvgdOOotJ2DjwrU3ZOPO07v9BSL1HUBLvu0PwWszIbIqxbQX6Ez2fani/u8w
         0nmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dl6zwzhq+FsMerc9qwgjpE1ja24WRPYdLlSyn3M9Lhc=;
        b=NO8gFXW6eN1SVUkeLpAVrO/fM4+IF78VDIGaf5aqQJZjKU94FlCg3PIlh0eh3BY2Qt
         7zusJ1b32vFi6St4GqzVCD2ZkInfIZ8zRBUfMpcL84OFCAIEzXUm5XaTiV+ueOSzs+1p
         ve4qjqRE1B2GH8sStVAQchewpYOFpM4waeGLvNxOVS6Ytof4pO+JxpLMpHrTxZOf+klB
         jjmE532Yw29spPsgdRCWj/thmlWwfRu7W9Vxgtee7nd8bFdljfieSdrkEQEm2qbWcSUd
         ZZXjq7TNfMFqkjABrdnKDiLkgR/xv/OTErcnacsK5z279Jh5v+logVSG7sP4unZiwoN2
         UKwQ==
X-Gm-Message-State: AOAM532Wz827WfCPJ6thbDj8mvFk49rEth1HliiwR7NKGiNXOn141nt5
        tOBQVj7e7/lxtG3Lq60LWLqLKA==
X-Google-Smtp-Source: ABdhPJwOr+y0DG+QB+DOdgrlRofbLELHLiFlXrD3oG8oQpR/O3B/puROrAIHaF3LxSmr19O0mGHgVA==
X-Received: by 2002:a62:8fc6:: with SMTP id n189mr25703478pfd.10.1595395827137;
        Tue, 21 Jul 2020 22:30:27 -0700 (PDT)
Received: from localhost ([182.77.116.224])
        by smtp.gmail.com with ESMTPSA id ml8sm4857037pjb.47.2020.07.21.22.30.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jul 2020 22:30:26 -0700 (PDT)
Date:   Wed, 22 Jul 2020 11:00:23 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
        saravanak@google.com, Sibi Sankar <sibis@codeaurora.org>,
        Jonathan <jonathan@marek.ca>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH v5 0/6] Add support for GPU DDR BW scaling
Message-ID: <20200722053023.vwaoj5oqh4cazzzz@vireshk-mac-ubuntu>
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
 <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
 <20200720100131.6ux4zumbwqpa42ye@vireshk-mac-ubuntu>
 <CAF6AEGurrsd3nrbB=ktZjWfKTNbKwPHYwTFiZdD-NOW1T7gePQ@mail.gmail.com>
 <20200721032442.hv7l4q6633vnmnfe@vireshk-mac-ubuntu>
 <CAF6AEGuhQcRskGhrFvmCf5T3EcZ9S+3LRdZBiaDYqF34yZjd+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGuhQcRskGhrFvmCf5T3EcZ9S+3LRdZBiaDYqF34yZjd+A@mail.gmail.com>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21-07-20, 07:28, Rob Clark wrote:
> With your ack, I can add the patch the dev_pm_opp_set_bw patch to my
> tree and merge it via msm-next -> drm-next -> linus

I wanted to send it via my tree, but its okay. Pick this patch from
linux-next and add my Ack, I will drop it after that.

a8351c12c6c7 OPP: Add and export helper to set bandwidth

> Otherwise I can send a second later pull req that adds the final patch
> after has rebased to 5.9-rc1 (by which point the opp next tree will
> have presumably been merged

The PM stuff gets pushed fairly early and so I was asking you to
rebase just on my tree, so you could have sent the pull request right
after the PM tree landed there instead of waiting for rc1.

But its fine now.

-- 
viresh
