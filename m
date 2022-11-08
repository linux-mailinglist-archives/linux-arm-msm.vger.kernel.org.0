Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA4162071F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 04:02:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233221AbiKHDCs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 22:02:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233128AbiKHDCs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 22:02:48 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F21552F67E;
        Mon,  7 Nov 2022 19:02:46 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id l2so8017978qtq.11;
        Mon, 07 Nov 2022 19:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wTgvsmQCgbUJy/uyEBLIwEwJeivJlDp4X00FjEbm73U=;
        b=KpGOTlZpFF56PAJz4Zyiyj1+AE/0+obLPnwKtXkayi9BgHyMd1LEnld1njeN3AVfgp
         9UT1CWH3HOhFEJzbQVxOzORHS5x6yip2l+gMDq/lFqFvzbdTS152Ur80e0112btw6Bt1
         XB1mDSrtSD2Gz1yQEEmuhqap1RdI8vGjsaVVoe0MRVarxfgS/cSUw6cb1rN4+YZL7tWr
         aLK8X9eTQg/KDyhYNBD1uyNc74TH6V5SsdcM7Wfw6O2f6fp71is/cQY0P/fnaZGgDQzV
         7Ov6CJDUXtgzHjoOPsEYHR5WQt6vgYzBRZk2+OYc6boRZB3obYz8k5TB6LAU1hh40RrY
         6+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTgvsmQCgbUJy/uyEBLIwEwJeivJlDp4X00FjEbm73U=;
        b=UWErregtJcdpoGd6kBPyXu5zE3xnAponH+0jlvd7pKFgqrnrr4UPCUWZaKOYSGp6n4
         ZS3HK0UyT20O+qKcChcUcCQ2aGeBjg4FFITTKQ250mHjJVvStuIiJWuJ3hLejJQ870yp
         n/QHMzA+Q9VEUqTPHvkW6Hcbs/87Ul0mq0QtqAduJlwGa84c45nzZGp8onwoUJDXvbbc
         KCB5/eMhZg+vy8Pg/afexNC3McD4tGzJ3UwOqAgSg3ZDTO6tAirEWtFqy+fLiLQV01lI
         R3z1bqe4dl4w/zZDrNmKRf+E16mtB2ZHdCYs65Z0wh9K8JFQYSEmiXRjxZPHyd3vzN0H
         xxSQ==
X-Gm-Message-State: ANoB5pm4WX41NGz+xnK/ZYAUkjZ4YWVA9hZxt9fLI31MSsza+mfMwZdj
        gHnkZ5MpcZ5VuCRLsxEmtHc=
X-Google-Smtp-Source: AA0mqf5kH5sVly/98XYjDeDQdqiaVJGNbUetyTPauSbsmbjnkjfzzoiUBE6uGJvjanAM9rKdnAswHg==
X-Received: by 2002:ac8:5c07:0:b0:3a5:946e:8b7e with SMTP id i7-20020ac85c07000000b003a5946e8b7emr4462095qti.385.1667876566133;
        Mon, 07 Nov 2022 19:02:46 -0800 (PST)
Received: from localhost ([2607:fea8:a2e2:2d00::61cc])
        by smtp.gmail.com with ESMTPSA id ay14-20020a05620a178e00b006bb366779a4sm8347893qkb.6.2022.11.07.19.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 19:02:45 -0800 (PST)
Date:   Mon, 7 Nov 2022 22:02:44 -0500
From:   Richard Acayan <mailingradian@gmail.com>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 0/1] iommu: SMMU for SDM670
Message-ID: <Y2nG1ExgpYVm2sY+@mailingradian>
References: <20221108025847.58352-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108025847.58352-1-mailingradian@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 07, 2022 at 09:58:48PM -0500, Richard Acayan wrote:
> Changes since v3:
>  - drop driver patch

This is v4. I forgot to increment the version in the subject header. My
apologies.

> 
> Changes since v2:
>  - rewrite driver patch (2/2)
>  - rebase on (1/2):
>    https://lore.kernel.org/linux-iommu/20221102184420.534094-1-dmitry.baryshkov@linaro.org/
>  - reset review process (1-2/2)
> 
> Changes since v1 (no emails related to this series since last week):
>  - accumulate tags (both were added because it seems like the discussion
>    ended in agreement to keep adding compatible strings to the driver)
> 
> This adds the compatible string for the Qualcomm Snapdragon 670's SMMU. The
> SMMU is necessary for GENI I2C, included in initial bringup because it
> doesn't need non-trivial patches except for patches conventionally added
> before the initial device tree (global clock controller and pinctrl).
> 
> Richard Acayan (1):
>   dt-bindings: iommu: arm-smmu: add sdm670 compatible
> 
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> -- 
> 2.38.1
> 
