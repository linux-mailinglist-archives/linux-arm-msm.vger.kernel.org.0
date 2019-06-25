Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 278E954FB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2019 15:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729835AbfFYNEZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 09:04:25 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41033 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728706AbfFYNEZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 09:04:25 -0400
Received: by mail-lf1-f67.google.com with SMTP id 136so12575373lfa.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2019 06:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wHDI9J2V46AreMDztiNynfQnp1GMzSLYSH3qsAERslk=;
        b=pgzGiP1T7skarqD32Mpgo2wd2OPX7DOqj6+nU4Aw7ct8jcR4l8XrjchxAdg2Kb5ChV
         XHEUHuJjd61SUE2rMfpPo24Oq0La+XX0KB39etzW/6cz0Is7S0b0J3k8gN6iTgsWXk4L
         FBAc0p3KNjKmy8I++sAVbmBkbvJH89csCHHPH5ohEw1OKSZIp65vRcyZofEdDghbsVjr
         wcV/saGiM5DtSB1r7MOIrBuFkD2k6HnDs0VfOThEqg7vqY/H3e8AKfQKJC4PbVU4YF0D
         Y1ejY8KgMLFxnvcz+ittXr0oqFcihqpsmnQLjPjS6rJUVs9My1W17BuWHGA9X/RGR6to
         6QwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wHDI9J2V46AreMDztiNynfQnp1GMzSLYSH3qsAERslk=;
        b=omPuG6QJMmoxXVqrCVrjczZaOLGpqTXU6dqJl/3uL3Xs1U1tWR14rtbpA3CBQFabUx
         TgFhqHCpC17mM/YeLe+5JTjx/ok3cUya5y/s9nC8BgPzSpcag9nhgRbVSM/cUb3UTpKe
         hmbBhs115ps3Mh7cKCXj72AexAiO3NFdLOLI/B2o5jXL5VNnemeCAskEVE9f147Ls7VE
         8wfgjlb6pcJKvDZ4/ApmKO+E/PPfnINn/AXK/N4SedHUYiTnKI3QJU8yFrqH3crBGkwZ
         k8WBtJClDoJAFR4OqK0lRQRBbzqx5JQKLXhPuLBXUYXJbUdT6sqG1e3BRCs54aDeTehU
         M6nA==
X-Gm-Message-State: APjAAAUCVPRHtN4ya5mzlaAOJ364YL91TY8WAFzMDqWINfZfxE55W9El
        2oI40oBDFraZlwmhcKpnhr9t+Q==
X-Google-Smtp-Source: APXvYqxLhcQ29Q9w06c9KAetFvO74uNTbpH4aLACUO+K1MkqKosHGb6nLJq1zkgUQnN/lmPzq76vIw==
X-Received: by 2002:a19:f601:: with SMTP id x1mr79056973lfe.182.1561467863327;
        Tue, 25 Jun 2019 06:04:23 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id m17sm2249201lji.16.2019.06.25.06.04.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2019 06:04:22 -0700 (PDT)
Date:   Tue, 25 Jun 2019 05:13:50 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Andy Gross <agross@kernel.org>
Cc:     arm@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Qualcomm Defconfig updates for 5.3
Message-ID: <20190625121350.5w5oaz5ott7s7qoe@localhost>
References: <1561006911-28519-1-git-send-email-agross@kernel.org>
 <1561006911-28519-2-git-send-email-agross@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1561006911-28519-2-git-send-email-agross@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 20, 2019 at 12:01:49AM -0500, Andy Gross wrote:
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-defconfig-for-5.3
> 
> for you to fetch changes up to 817bbbb7749decb99262dc3bb1569a579eea5ba8:
> 
>   ARM: qcom_defconfig: add support for USB networking (2019-06-16 11:31:50 -0700)
> 
> ----------------------------------------------------------------
> Qualcomm ARM Based defconfig Updates for v5.3
> 
> * Add support for USB networking
> * Add support for display related options

Merged, thanks!


-Olof
