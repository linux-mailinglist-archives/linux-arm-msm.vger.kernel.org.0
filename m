Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94D741FD857
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 00:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbgFQWF2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 18:05:28 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:44461 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbgFQWF1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 18:05:27 -0400
Received: by mail-io1-f67.google.com with SMTP id i4so1723693iov.11;
        Wed, 17 Jun 2020 15:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bIUyJbST3ILF2B5W5XHarSpDJ5TWO+TqPDggu/ATjbE=;
        b=guWuXQDuUeyJW6wPzc6PCDL9wZl+rgRxAnT/Db17RfGQGPqDHghtxpcLUUB1wtCNSg
         MOR30J74BV2zZDIwpxushvbugPNwj+d8k4OBfz309o9srqt62Z6ohuf+JBLCl6ZgsbKI
         rM2E+bxM/My08EFc1rg+zehYtAey59GG3DAOAMI1FlqQGnOtwr+3rdfArimGQqRL8Vu7
         eQoPocmWffdhYjzcOhusVD5XnT+pmbjw/Nf6sJAypO5iFnDEVOAvbD9fnOuxqzAZ0TWP
         D4cpHqzuzIrlfocHnlLUibLJMxP0MPslEFTB1rhHvJRJ2BKcjtbqQALuJdFwC+3RmuwC
         5Itg==
X-Gm-Message-State: AOAM533ecF01Ahp0i3sRsmTzOF7zs193KDyONfpKUWk90nlWymjlMGuh
        c14+YC/KN+qh3ivxBu/SODzTg+GH1g==
X-Google-Smtp-Source: ABdhPJy+l4gL0/jpC1lHY9VpNr7LIfu5zc9ll9NHo0F7QdjgaK+SdSHKI5mgaI6ATemem9fRGF4/Iw==
X-Received: by 2002:a02:3402:: with SMTP id x2mr1362929jae.11.1592431526609;
        Wed, 17 Jun 2020 15:05:26 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id d11sm636626iod.11.2020.06.17.15.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 15:05:26 -0700 (PDT)
Received: (nullmailer pid 2913414 invoked by uid 1000);
        Wed, 17 Jun 2020 22:05:24 -0000
Date:   Wed, 17 Jun 2020 16:05:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     open list <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "moderated list:ARM SMMU DRIVERS" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/8] dt-bindings: arm-smmu: Add sm8150 and sm8250
 compatible strings
Message-ID: <20200617220524.GA2913365@bogus>
References: <20200609194030.17756-1-jonathan@marek.ca>
 <20200609194030.17756-2-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200609194030.17756-2-jonathan@marek.ca>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 09 Jun 2020 15:40:19 -0400, Jonathan Marek wrote:
> Add compatible strings for sm8150 and sm8250 iommus to documentation.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
