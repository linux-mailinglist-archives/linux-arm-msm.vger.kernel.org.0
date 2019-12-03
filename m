Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E28B21104DB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2019 20:14:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727409AbfLCTOj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Dec 2019 14:14:39 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:40515 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbfLCTOj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Dec 2019 14:14:39 -0500
Received: by mail-oi1-f193.google.com with SMTP id 6so4386787oix.7;
        Tue, 03 Dec 2019 11:14:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gRLlFC9D1u1hwI1d/EbEjZ94RjJCTsPp84ZAxR2T34c=;
        b=ei6mwQVlV7G7iyCTc0pFj5HarMuHAiwmogb1A/NPsUU1ZJXNY8mT4osiFc3vqy49zQ
         YNqF78SmPPfrCW70EXbkN8BxA7ZezbS4iAdDx+Z4FEh6p15xkSfCqayE22myO4nIyUWZ
         18pok4LaYWazldY4u3356hMzOprFrMVY/1UDTavR+/Sfa0b98hOkanWa6E+Zaq36y4cH
         cWQ4nAXjYSLJEB+QGVKnjWNMZ9PlQ6mHoZHymKjzSk2sc5GIfY7LKFHuslWVCBBungU8
         X6F3bgv8OzBtsGcUu432gqjED13dqwVp94z3M3Q8/7zhMi88b1qq69vLbH02/A8NK1CL
         Zn+g==
X-Gm-Message-State: APjAAAUdwwRMMiRKRSJXqRoM7W8HkhdAKh59TQiZHv2IsuvbVn/n0wWf
        vDWKJkX/MWgvfHxz5S7njA==
X-Google-Smtp-Source: APXvYqwfW6cNdzLLtGnRM6Eeh4eI3J0OXPCG+lnr/0NSOIKOUhB/2E6cGltU8AStJzERHBVHvLKFWQ==
X-Received: by 2002:aca:b2c5:: with SMTP id b188mr1686191oif.55.1575400477922;
        Tue, 03 Dec 2019 11:14:37 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w72sm1413333oie.49.2019.12.03.11.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 11:14:37 -0800 (PST)
Date:   Tue, 3 Dec 2019 13:14:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     iommu@lists.linux-foundation.org, robin.murphy@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: arm-smmu: Add Adreno GPU variant
Message-ID: <20191203191436.GA11606@bogus>
References: <1574465484-7115-1-git-send-email-jcrouse@codeaurora.org>
 <0101016e95751ea5-da4da251-ddba-4017-9258-b2cfd4e06f7f-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016e95751ea5-da4da251-ddba-4017-9258-b2cfd4e06f7f-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 22, 2019 at 11:31:51PM +0000, Jordan Crouse wrote:
> Add a compatible string to identify SMMUs that are attached
> to Adreno GPU devices that wish to support split pagetables.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
