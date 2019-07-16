Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1BA6A489
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2019 11:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727829AbfGPJHQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jul 2019 05:07:16 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:44992 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727105AbfGPJHQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jul 2019 05:07:16 -0400
Received: by mail-ed1-f66.google.com with SMTP id k8so18822347edr.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2019 02:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=I9zYEq8OFEbVpJer2Tv3zWZvHxZnxrPEy9YXzm5hW3E=;
        b=jVSOIxdw446a+o8BYLVYYGg5IMs05dyf37q/ADNKTCwEod7L/7+EunPYbSghKFfkjc
         EPopEXJIpzE+x1mG2bSZNlUKHCXC5YZdxNsX4okhltRLNACQhPemH6fFpoNhEKJIsVH3
         0Yql/A2XGciBDq1AW8dhKO6q+tSEBCwdCo/kk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=I9zYEq8OFEbVpJer2Tv3zWZvHxZnxrPEy9YXzm5hW3E=;
        b=ZyRqSzBdj7uWDkuLLd/Qquenmt5Wr2938paNsxMioXkBn/pJFBvdK7Y1/FpAJ5sPNH
         /6gHs1y1xojKktjm0ZPWOaxSH3FdCZKZ1cywrMwyGNC8i3PUFmzwsrecM+fOueGz9AAd
         b/4SP3MpGi7V9pFHt7/90WNQeSA9McJBrix3KJ9sxVfNEE78Tqi4LOp/WhwUJvdTgBz7
         h+TcC7y9JnMaFvumtKPLStPnF9C2nC2ZPLQFZP9GM7bC3hDFdaww5lGp+PYgK/feAGsd
         HmBVB3yRMTBXm44rU0NOusKT7fcN7pLk0pq/g8RDsSTdZg6XR//DJXu4Wvju9kj7vLZR
         RWXw==
X-Gm-Message-State: APjAAAW398R/MUFELQJ7eNYE/x08MmvtDqNgYVaQu/kpZ/OMng5G9ww5
        K0z20AU/1Kt7QUPGXLg7zGM=
X-Google-Smtp-Source: APXvYqz1SaqX3EV9WdhysWFHXB3kEpANL5IKDHtMYu6Pa12298jeoeX++0r54iCbKMiUhb8wR9JHPg==
X-Received: by 2002:a50:9918:: with SMTP id k24mr27533596edb.173.1563268035208;
        Tue, 16 Jul 2019 02:07:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id q21sm4249063ejo.76.2019.07.16.02.07.14
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 16 Jul 2019 02:07:14 -0700 (PDT)
Date:   Tue, 16 Jul 2019 11:07:12 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jeykumar Sankaran <jsanka@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, seanpaul@chromium.org,
        robdclark@gmail.com, pdhaval@codeaurora.org
Subject: Re: [RFC] Expanding drm_mode_modeinfo flags
Message-ID: <20190716090712.GY15868@phenom.ffwll.local>
References: <1562870805-32314-1-git-send-email-jsanka@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1562870805-32314-1-git-send-email-jsanka@codeaurora.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 11, 2019 at 11:46:44AM -0700, Jeykumar Sankaran wrote:
>     Hello All, 
>     	drm_mode_modeinfo::flags is a 32 bit field currently used to
>     describe the properties of a connector mode. I see the least order 22 bits
>     are already in use. Posting this RFC to discuss on any potential plans to 
>     expand the bit range support of this field for growing mode properties and 
>     ways to handle one such property needed by the msm dpu driver.
> 
>     msm drivers support panels which can dynamically switch between
>     video(active) and command(smart) modes. Within video mode, they also support
>     switching between resolutions seamlessly i.e. glitch free resolution switch.
>     But they cannot do a seamless switch from a resolutions from video to
>     command or vice versa. Clients need to be aware for these capablities before
>     they switch between the resolutions. Since these capabilities are identified
>     per drm_mode, we are considering the below two approaches to handle this
>     use case.
> 
>     Option 1:
>     Attached patch adds flag values to associate a drm_mode to video/command
>     mode and to indicate its capability to do a seamless switch.
> 
>     Option 2:
>     drm_mode_modeinfo can expose a new "private_flags" field to handle vendor
>     specific mode flags. Besides the above mentioned use case, we are also
>     expoloring methods to handle some of our display port resolution switch use
>     cases where the DP ports can be operated in a tiled/detiled modes. This 
>     approach will provide a standard channel for drm driver vendors for their 
>     growing need for drm_mode specific capabilities.
> 
>     Please provide your inputs on the options or any upstream friendly
>     recommendation to handle such custom use cases.
> 
>     Thanks and Regards,
>     Jeykumar S.
> 
> Jeykumar Sankaran (1):
>   drm: add mode flags in uapi for seamless mode switch

I think the uapi is the trivial part here, the real deal is how userspace
uses this. Can you pls post the patches for your compositor?

Also note that we already allow userspace to tell the kernel whether
flickering is ok or not for a modeset. msm driver could use that to at
least tell userspace whether a modeset change is possible. So you can
already implement glitch-free modeset changes for at least video mode.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
