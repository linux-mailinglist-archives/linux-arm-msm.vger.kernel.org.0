Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B02CAF2153
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 23:04:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727700AbfKFWEV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 17:04:21 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41072 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726957AbfKFWEV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 17:04:21 -0500
Received: by mail-lj1-f195.google.com with SMTP id m9so27919982ljh.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Nov 2019 14:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=b4Y1JPpjGMsxvPxn35W51flX+hoR/EOYHK+rzP1aHWU=;
        b=yHivMyiQij6HNG22rsWf26KBLWEI0yzWYNqfVYXuognM2nw2gJHeKPFxasY5VUVa8h
         kZXae0rnxEe1UABLDYhpmyl2ovMKRLAN/satzWx8LVMT2ZH0namNhozNhmo193OB0lJc
         JvrEp34RYW1CIOUFlPhWxYEyqAtOPECL8L77RuXj+Gz6jrx371DCD5b1DFNCJGEhWnVM
         u1rGVky8AuwgixhGFXeyo5Z+ZHosjyco1FHT3sCLxM20Gql/Ie8rbe/pXef/RMd9qW5+
         uV5Q51kRo/y00h/SbRLVpVGjQemvl0v26b4+k4q2jdd9TOdjxY8rDTjYSZz4imceJS53
         Ubmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=b4Y1JPpjGMsxvPxn35W51flX+hoR/EOYHK+rzP1aHWU=;
        b=W4Dx42ndFBHlQkx9TnSqzxVDiL9o7bhaTEJdXJ/FtNVP/U7qSpdQFORf11JjNwYXHU
         TJlsGP6e7D7b4EQgFwPtZrBmMHIUTliOsEwBZze6qBRPZcjsXvM2tMjIY5Opzb1Eg+eA
         bf+kwW9BulDL/ZQBYN99R6pzqwhYbM/VQAvykY0FKVtXPhPk06CWbIYgIK4uTRfJpOWB
         Is8sK6tjGB9LFwPJNlZDGMt754D7E6J5/yk/IQLjpG0gXRBQOpBatM47aAl4bSOMZs4l
         GOerO9YhLoUjJAXOv2Ocdk2oR5D5tOqKgebspMR4vdW/NtN9pQ5khOJMNA+AcvaTG6t/
         Tfyw==
X-Gm-Message-State: APjAAAXLCawKVhPXGra96nfPxOoeketidpvZNp92KbpbywveuDLprwnP
        LgZJN4mgC/TnMk5L2/+y6ci0Xw==
X-Google-Smtp-Source: APXvYqy+Q/ffmMrHnPVMwxBzqY/VK8fGVA2u7nV7S2PwD1HF/DzGA/s6as59bd/04V/o3XsSAgeQhA==
X-Received: by 2002:a2e:b053:: with SMTP id d19mr3680770ljl.36.1573077859341;
        Wed, 06 Nov 2019 14:04:19 -0800 (PST)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id r4sm39612ljn.64.2019.11.06.14.04.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Nov 2019 14:04:18 -0800 (PST)
Date:   Wed, 6 Nov 2019 14:04:06 -0800
From:   Olof Johansson <olof@lixom.net>
To:     Andy Gross <agross@kernel.org>
Cc:     arm@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@baylibre.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 Defconfig updates for 5.5
Message-ID: <20191106220406.4aoq5suvwww6c3ov@localhost>
References: <1573068840-13098-1-git-send-email-agross@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573068840-13098-1-git-send-email-agross@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 06, 2019 at 01:33:56PM -0600, Andy Gross wrote:
> The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:
> 
>   Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.5
> 
> for you to fetch changes up to a36612b7469cf76953cf237a2b9a62f6c97730bb:
> 
>   arm64: defconfig: Enable Qualcomm watchdog driver (2019-10-20 23:04:59 -0700)
> 
> ----------------------------------------------------------------
> Qualcomm ARM64 Based defconfig Updates for v5.5
> 
> * Enable Qualcomm cpufreq, watchdog, prng, socinfo, SPI, and QSPI controllers
> * Enable SN65DSI86 display bridge
> * Enable QCA Bluetooth over Uart
> * Enable various Qualcomm remoteproc dependencies
> 
> ----------------------------------------------------------------
> Bjorn Andersson (6):
>       arm64: defconfig: Enable Qualcomm remoteproc dependencies
>       arm64: defconfig: Enable Qualcomm SPI and QSPI controller
>       arm64: defconfig: Enable Qualcomm socinfo driver
>       arm64: defconfig: Enable Qualcomm CPUfreq HW driver


Hi, this turns on the driver as =y, when the option is tristate. Other
cpufreq drivers are also modules. Is this driver truly needed to be
a built-in for a generic defconfig?


-Olof
