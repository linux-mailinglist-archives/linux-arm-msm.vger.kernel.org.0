Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 373699F147
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2019 19:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730262AbfH0RNo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Aug 2019 13:13:44 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44489 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727064AbfH0RNo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Aug 2019 13:13:44 -0400
Received: by mail-oi1-f195.google.com with SMTP id k22so15540948oiw.11;
        Tue, 27 Aug 2019 10:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZT59bHFCQxNUysxnKx4v2xMJcoeiALfAwa3rgtRRpmY=;
        b=F9uphlYR1TynQZyTOVQ7AHpq3i8Qud+Vf2z0pPBlS1Po34fy/KZkbTWjk9Zg+ah7HJ
         hsJpnWY/Axc4EWD9IAsY4ycjT3rE3enhqLKUBpzqJPHDrV4UO3//6WlJ8lYmKhvCFmEO
         +HUWXJuo2+tMoMc4YwHG9T1RqlYZsAsArDO8yVhTtYydtpGHx8F+rZk1F3w6qVenUafJ
         eRQTcEeMCxIYUpqXujXOtQRYw/u8S0V5LoC3JjpYyCBWFiZWWAiqHVaFItjJi0PsAmF9
         v76CKTDSP/DgjxtCItfD4ILrhUf+L8UAMG2HlpKQUxvZFSGNc3gkuAZTm0KgMS9QV2Vf
         E54w==
X-Gm-Message-State: APjAAAVNXrlogCdHAPmELA2Re5fORfHyO3hBYNt+yUkd4WyTDZA0DyeR
        TPLWLKEgATbGiSg6TwLWMQ==
X-Google-Smtp-Source: APXvYqxslgK0PstOcKY7gHX+NFLxSs5mbQ5emm9JZKa41JXdGW49/ncn4EIxqEgVRmEBPuRT6rgQSg==
X-Received: by 2002:a54:4092:: with SMTP id i18mr5226801oii.66.1566926023468;
        Tue, 27 Aug 2019 10:13:43 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f21sm5458620otq.7.2019.08.27.10.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 10:13:42 -0700 (PDT)
Date:   Tue, 27 Aug 2019 12:13:42 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        Mark Rutland <mark.rutland@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 2/7] dt-bindings: arm-smmu: Add Adreno GPU variant
Message-ID: <20190827171342.GA29932@bogus>
References: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
 <1566327992-362-3-git-send-email-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1566327992-362-3-git-send-email-jcrouse@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 20 Aug 2019 13:06:27 -0600, Jordan Crouse wrote:
> Add a compatible string to identify SMMUs that are attached
> to Adreno GPU devices that wish to support split pagetables.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>  Documentation/devicetree/bindings/iommu/arm,smmu.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
