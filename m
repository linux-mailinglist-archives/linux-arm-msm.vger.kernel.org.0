Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7C053BBE3A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jul 2021 16:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbhGEOdg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Jul 2021 10:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbhGEOdf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Jul 2021 10:33:35 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C23D2C061574
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jul 2021 07:30:58 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id x21-20020a17090aa395b029016e25313bfcso72333pjp.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jul 2021 07:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qCX0zqI0eQXVpUhdOeIljsrEhyXkSFc8ZHVG8DOrOfo=;
        b=hhiMI4R6zydKTznJcV8joyAdL09Mn8PR3l4s92ExtC/hDylAApwIRXBg5EmvwFbE8w
         T2TFBHe5C0xXOIr406keJ5p5+zTsRlSvri1NC4SV7tDoKdBGJrgYJwUSTniDNXOtot+4
         Si4Taz/9GcqlHnpypRsxlg1W0kT9ch6dLeWc8imemr6ZnKCambJ7uDGL2+AtrPV2a8PE
         QINYv0INIAumkolHUgI/Sranme6xPN8YkIDKhAi1C91+3nEgYhMtaDesjLIz0q8tj6Vf
         XG61msJhy/vACNJUlHmtwH185SdFkkBVxQAIdPDod8BhOWJ5339x7HS+HTTvMhw6vcrP
         RO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qCX0zqI0eQXVpUhdOeIljsrEhyXkSFc8ZHVG8DOrOfo=;
        b=lpJIUQvPEoeQ/Yy9yiJ9SlAhWcYX0+xhJGvUNcy4yvAJ/28MZWniWpE4lo/2Eth4eA
         aZsh2o3sKITtMQlQk2PZRhkPxegSSaC6Wnb/fS3duvIAocgVoRWiIZQ2IY7E7+JGjr2/
         6/S5OfCo45IFpCeAWuRrqxK+y/KC+ZXTGvzcpeXA6feysqmKAaJ/fzfsadHEB/1zjbrD
         58qOsYCIX8KbejLvnNyip9o8rDr06rt8YkzwQpXVdvyni8BI82RdaRKPXsRwoXlw/JBV
         t8cHamowBXsepth3lFY2bA/K6Sm200DiXq7d4zH6578rGgcLiHlAL1zqwbh3bztOOriO
         9GTQ==
X-Gm-Message-State: AOAM530YL/T/4u9YLGqr8i2SIfENktg5GDrpAnT8Zrft7ZzxbT32CHF8
        g7xmZ76kb9j59dQfs/UvLoM=
X-Google-Smtp-Source: ABdhPJzbjAlVB+N2u0Xd2IZAFCqgYzh5K+zJ+VsL2kc2RNXE5E180B06wBsqArVIp4xnErpN4dteSA==
X-Received: by 2002:a17:90b:164c:: with SMTP id il12mr15355402pjb.44.1625495458209;
        Mon, 05 Jul 2021 07:30:58 -0700 (PDT)
Received: from localhost ([2409:4042:2696:1624:5e13:abf4:6ecf:a1f1])
        by smtp.gmail.com with ESMTPSA id x13sm11382532pjk.37.2021.07.05.07.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 07:30:57 -0700 (PDT)
Date:   Mon, 5 Jul 2021 20:00:54 +0530
From:   Amey Narkhede <ameynarkhede03@gmail.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Amey Narkhede <ameynarkhede03@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>
Subject: Re: [PATCH] iommu: qcom: Revert "iommu/arm: Cleanup resources in
 case of probe error path"
Message-ID: <20210705143054.nxy4ii6t6npj22ov@archlinux>
References: <CGME20210705065703eucas1p2e89258a2fc286896b755047e06f514cb@eucas1p2.samsung.com>
 <20210705065657.30356-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210705065657.30356-1-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/07/05 08:56AM, Marek Szyprowski wrote:
> QCOM IOMMU driver calls bus_set_iommu() for every IOMMU device controller,
> what fails for the second and latter IOMMU devices. This is intended and
> must be not fatal to the driver registration process. Also the cleanup
> path should take care of the runtime PM state, what is missing in the
> current patch. Revert relevant changes to the QCOM IOMMU driver until
> a proper fix is prepared.
>
Apologies for the broken patch I don't have any arm machine to test the
patches. Is this bug unique to qcom iommu?
[...]

Thanks,
Amey
