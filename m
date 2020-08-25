Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 031142511D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Aug 2020 08:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbgHYGCb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Aug 2020 02:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725792AbgHYGCb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Aug 2020 02:02:31 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D61F2C061574;
        Mon, 24 Aug 2020 23:02:30 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id u21so14254031ejz.0;
        Mon, 24 Aug 2020 23:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=qC9lIs0ZMoKFIjAQ0dU6hymT0FL8xlJ8yoO3siCb5Ck=;
        b=ikjYeM4IpIjVvaDRvrGRwBZ//8j+vKTQRqv04vDMB6WSfGp8WqCimzdUeZZNLo2RhH
         GgFcLSppsiEJNu5l6rVe/50vcA2UyaAExdtuiwxGDAS1PdqVI+giIoFnLmCeVvK6iUx1
         P0+y+spVBwOx3hs1MoodeMaSJZS5ytZ3vcJoJoL0KhA7FHCPyVb0SoU0Q7CLsvjVPT4Q
         UxrU1Xfp3xZJjlTVkRfKF9g2O3vxXJuTekQ6tzgRqBh81TyGKi1bsO701FDB5i0l4jcE
         /M9iNSKhYXscRbvYpWFKW6L0ZDE4T5zGjAdLkiUAmIR7Gh/dMW5JEjcx2A3Vb4h5GHig
         FBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=qC9lIs0ZMoKFIjAQ0dU6hymT0FL8xlJ8yoO3siCb5Ck=;
        b=nN34FSjc0aSrTeqH5zwC5NCy0ZgfqXKnb1vKaMRnuJo9vuC2AZ0hNUvuauITolzfWN
         FFVIWpNdcHTD3o3bPd6m2vAgxxtYt/kSdiIuSvTejqyzIEOQekKJIQltLcmmxyzKP5jh
         1GF3VvHCZg2+YVgdWHMHnPevuCts2n3pRGmysMflRj3JHB6SJOQCxvZg0n7bkwTZwsTx
         EAPxY1ZxNX7CS6QsbX7y3ZqbkHzPux5Cu/OuR1LG1uB454F9mlzlceQ0Rrgu5UZS37nP
         +7iDetaagGSRlpkifpIBBhwBqoJVdGi+GvG00ta0l+LNL2H2Fs3p21DE3acNb1UM156k
         l7KQ==
X-Gm-Message-State: AOAM532df8cT72pVD9b3SJ/D6GMWNvxh3kLIq2vxF4DVkX3tLdgrBi1v
        7uKfHNMYRdNigoIK/CHQVZI=
X-Google-Smtp-Source: ABdhPJx7BcwdkWuyTL1fcGA4WKrD1Ua/Boe3SCTZg3mXO1upBsJa6ovPylNYOLvY4VRa3hj6TVJd7A==
X-Received: by 2002:a17:906:3e0a:: with SMTP id k10mr9384552eji.148.1598335349584;
        Mon, 24 Aug 2020 23:02:29 -0700 (PDT)
Received: from felia ([2001:16b8:2d83:7500:a091:6d55:fb72:2347])
        by smtp.gmail.com with ESMTPSA id h16sm12541220ejf.120.2020.08.24.23.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 23:02:28 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date:   Tue, 25 Aug 2020 08:02:21 +0200 (CEST)
X-X-Sender: lukas@felia
To:     Will Deacon <will@kernel.org>
cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>, kernel-team@android.com,
        iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
        Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: update QUALCOMM IOMMU after Arm SSMU drivers
 move
In-Reply-To: <20200821161101.GF21517@willie-the-truck>
Message-ID: <alpine.DEB.2.21.2008250801050.5419@felia>
References: <20200802065320.7470-1-lukas.bulwahn@gmail.com> <20200821161101.GF21517@willie-the-truck>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On Fri, 21 Aug 2020, Will Deacon wrote:

> On Sun, Aug 02, 2020 at 08:53:20AM +0200, Lukas Bulwahn wrote:
> > Commit e86d1aa8b60f ("iommu/arm-smmu: Move Arm SMMU drivers into their own
> > subdirectory") moved drivers/iommu/qcom_iommu.c to
> > drivers/iommu/arm/arm-smmu/qcom_iommu.c amongst other moves, adjusted some
> > sections in MAINTAINERS, but missed adjusting the QUALCOMM IOMMU section.
> > 
> > Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> > 
> >   warning: no file matches    F:    drivers/iommu/qcom_iommu.c
> > 
> > Update the file entry in MAINTAINERS to the new location.
> > 
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> > Will, please ack.
> 
> Typo in subject: s/SSMU/SMMU/
> 
> With that:
> 
> Acked-by: Will Deacon <will@kernel.org>
> 
> > Joerg, please pick this minor non-urgent patch for your -next branch.
> 
> Joerg -- can you queue this as a fix for 5.9-rc, please?
>
Will, Joerg, I addressed the typo.

Ignore PATCH v1; and take v2 instead:

https://lore.kernel.org/lkml/20200825053828.4166-1-lukas.bulwahn@gmail.com/

Thanks,

Lukas
