Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF936E859
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2019 19:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728865AbfD2RH6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Apr 2019 13:07:58 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37678 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728847AbfD2RHz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Apr 2019 13:07:55 -0400
Received: by mail-lj1-f195.google.com with SMTP id b12so8885546lji.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2019 10:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6ehK/YFhlb7ZxAagjUyzZkge5JL22b1s+yiy6nCuiSk=;
        b=bOzaUCnxgAM5TOc+qPRvdsMIzXt+4DNke7FgxBySdG9v93p4OxCB18BJJNmwDv0des
         aKsVWZgKYeRTI2qt0Su/FcsVsuJtbCi7+A7leHMJ/qUPQIdlGNPMLzJR2flFoicfkqNl
         AsUi25cxz8MVUgnJ4OMjjjp3uSkByI5odZLxBnq6F7n9oAXBpoTO7a+QF1ITvp4bqhBt
         VIBdYTMXWNh1xI1N0TdSmrwKjVzKZhr7W0oRKDTve1hkzOZhUHoRZirYEGIqsqF2y249
         TrmecpX8cAH2nJ2LTc42VPzNVeDNSxJmvDG83NIyi++BM6IMJeX7zztLOwva6RFEOPsO
         QblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6ehK/YFhlb7ZxAagjUyzZkge5JL22b1s+yiy6nCuiSk=;
        b=IjVW9rKMk6PxmsfgJYninNzh5wxKSBcXFQFH8a7P/wbP1aI/bK0lLQGMSy6uT3UEim
         EOeP/S2TZtCLLHM2Uyqf68asRVO/lRQeWBLbYeLduPESnaYcXBmHqxE/mLcFq11grmqT
         ndxlcZub6w+D/uxB2/T9nwC2p3vrl2fIyCgSx4O1KFjZIfLoLFTSBJC8bC3ci+sG0axZ
         NV9H1QvZWniqL0Y5e8HT6ysw/gaCP4AkTm7Kp+xOKkU2DjPk9LqKhFUMV3dYuAsVyhNz
         sQ5meZvuvy0WaqOcSux5Z6y4nK7ZyHkBgkvdKq3vR/+dezwGyHfepg4bqxgtxMNlUBuV
         pq7A==
X-Gm-Message-State: APjAAAWnh2yrr5bGf47HatGA3xPr5qNDc/aIief46ah753LABHH5t0v5
        GXMH2iQoeYJXAH0BmHBP7JCQ8A==
X-Google-Smtp-Source: APXvYqwVrWESZs1otXMX9r4FErLdlXN+Vn5pyw32HfFs5QqWMDqyrTYf3l6xwugBOsqP7bysU0VMsw==
X-Received: by 2002:a2e:9956:: with SMTP id r22mr17859685ljj.143.1556557673502;
        Mon, 29 Apr 2019 10:07:53 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id w198sm7449083lff.10.2019.04.29.10.07.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2019 10:07:51 -0700 (PDT)
Date:   Mon, 29 Apr 2019 09:39:32 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Andy Gross <andygro@gmail.com>
Cc:     arm@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@baylibre.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 Defconfig updates for 5.2
Message-ID: <20190429163932.itif6tddapf4flek@localhost>
References: <1555997248-11513-1-git-send-email-agross@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1555997248-11513-1-git-send-email-agross@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 23, 2019 at 12:27:24AM -0500, Andy Gross wrote:
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/agross/linux.git tags/qcom-arm64-defconfig-for-5.2
> 
> for you to fetch changes up to 2e8382955a3efa133c2e9d8e154681a8aa2cd92d:
> 
>   arm64: defconfig: Enable stmmac qualcomm ethernet config (2019-04-18 23:32:25 -0500)
> 
> ----------------------------------------------------------------
> Qualcomm ARM64 Based defconfig Updates for v5.2
> 
> * Enable stmmac qualcomm ethernet
> 
> ----------------------------------------------------------------
> Vinod Koul (1):
>       arm64: defconfig: Enable stmmac qualcomm ethernet config

CONFIG_NET_DSA is a tristate, and you're enabling the driver as a module
already. CONFIG_NET_DSA should be =m as well to avoid bloating the main
kernel for non-rootfs-critical drivers.

Mind respinning?


Thanks,

-Olof
