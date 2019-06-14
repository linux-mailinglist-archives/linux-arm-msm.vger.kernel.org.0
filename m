Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09C71454B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2019 08:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725780AbfFNG24 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jun 2019 02:28:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:59156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725774AbfFNG24 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jun 2019 02:28:56 -0400
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 075B92175B;
        Fri, 14 Jun 2019 06:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560493735;
        bh=o6p9lVc+DYilRKtF9pajKsHYMRF8rkewSFkOlAnBRH8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JozXoOb8Ksc6M/jxRWxNQoCuZPK/5IvFkxh+M4O9zoywYnsSjvXltT2rFIopAZGVa
         8ZxAp9Gd4x/1rIddNzEm4o7sHNxGxeZPGt16LcX6QGhYmPS2av/K81y5kESJTLL6Kb
         6WEfM0zrV0/lz+O9Drbq/GrlfjzYye/Smlmr/ypM=
Received: by mail-lf1-f54.google.com with SMTP id y198so924707lfa.1;
        Thu, 13 Jun 2019 23:28:54 -0700 (PDT)
X-Gm-Message-State: APjAAAX6Yrp84LuT9kLmqzhtN3u/4nFnU50FfnIjBnRDMMEIYkA60JHO
        mqBNCxVFAAf6Thr/irUyoz4BGF3XQt0rbuCa8Zk=
X-Google-Smtp-Source: APXvYqzRXJBwqzBDJLXSnR6wciv/RpnSmt3qlpvlkhRIjxzRerMzGffvz309DswL+/k+vyTpR7UVS0Do0UtSVtBB5qM=
X-Received: by 2002:ac2:4d1c:: with SMTP id r28mr8998948lfi.159.1560493733233;
 Thu, 13 Jun 2019 23:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190613162703.986-1-tiny.windzz@gmail.com>
In-Reply-To: <20190613162703.986-1-tiny.windzz@gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 14 Jun 2019 08:28:42 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfU+nB-_K3ZP9XBFp5bfk-ZvbfSEW96LD4MbtkyWfQZHg@mail.gmail.com>
Message-ID: <CAJKOXPfU+nB-_K3ZP9XBFp5bfk-ZvbfSEW96LD4MbtkyWfQZHg@mail.gmail.com>
Subject: Re: [PATCH 01/10] iommu/exynos: convert to SPDX license tags
To:     Yangtao Li <tiny.windzz@gmail.com>
Cc:     joro@8bytes.org, Marek Szyprowski <m.szyprowski@samsung.com>,
        kgene@kernel.org, will.deacon@arm.com, robin.murphy@arm.com,
        agross@kernel.org, david.brown@linaro.org, robdclark@gmail.com,
        heiko@sntech.de, thierry.reding@gmail.com, jonathanh@nvidia.com,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 13 Jun 2019 at 18:27, Yangtao Li <tiny.windzz@gmail.com> wrote:
>
> Updates license to use SPDX-License-Identifier.
>
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/iommu/exynos-iommu.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Splitting this per driver is too much... it is not necessary. Such
changes should be done in one patch per subsystem.

Best regards,
Krzysztof
