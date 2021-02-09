Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39A9331599C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 23:43:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233939AbhBIWlP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 17:41:15 -0500
Received: from mail-yb1-f171.google.com ([209.85.219.171]:43485 "EHLO
        mail-yb1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234279AbhBIWVI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 17:21:08 -0500
Received: by mail-yb1-f171.google.com with SMTP id y128so19726662ybf.10;
        Tue, 09 Feb 2021 14:20:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SlJYVzGrF/v0+x0oHuZIqAVMK0/LnnWcJ7EHFt4lQkg=;
        b=tG8At/1JUG2nAjnhRpDzWPcdJd5OFdcafolMV848BXMFOTNiLCoaPld8UEue9Al1i0
         dBAWEHvgHa7USyHOpk6mZrhT/e5Hs5CUZUThHjNuxmtrxnCggcZVfHrUM8c2ixyRCc+s
         RajGWzKhe0P8uEEBqvNIiTFSzLoxyDh0KIV/tfX0bRL++L0C2PdhQeehHzQSRP+uaT5o
         dGVveZ6YBUtK03zSjNV8mIZAWrS4ghcuMHhfB90TSoqD2lkiRTCZiIUV2/oigNT970Yi
         KwYpI8RB/+9Ek+f8keDhhUBVPOkwW03mL0zlTrIh3sEaL86e4UIsYIpkcfHIhWa4/TdT
         ZcxQ==
X-Gm-Message-State: AOAM533FZVI8Hn96lA3A4weE7PtARAOePDlIrCnmsIdQkNYIESfl/Eu0
        qxOoPqSKsWqKLef2mFQKQufQRI3wnw==
X-Google-Smtp-Source: ABdhPJyGze51CK6bAWc9wp3PXYJxwQHgBwO5z4h+p/+6kWME840SpqsLaeRt8Vvv4Ini2iFxwmezuw==
X-Received: by 2002:a9d:ee7:: with SMTP id 94mr17073555otj.342.1612906789894;
        Tue, 09 Feb 2021 13:39:49 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g6sm4534260ooh.29.2021.02.09.13.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 13:39:49 -0800 (PST)
Received: (nullmailer pid 243652 invoked by uid 1000);
        Tue, 09 Feb 2021 21:39:48 -0000
Date:   Tue, 9 Feb 2021 15:39:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Asutosh Das <asutoshd@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        "James E . J . Bottomley" <jejb@linux.ibm.com>
Subject: Re: [PATCH v2] scsi: dt-bindings: ufs: Add sm8250, sm8350 compatible
 strings
Message-ID: <20210209213948.GA243591@robh.at.kernel.org>
References: <20210204165234.61939-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210204165234.61939-1-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 04 Feb 2021 22:22:34 +0530, Vinod Koul wrote:
> Document "qcom,sm8250-ufshc" and "qcom,sm8350-ufshc" compatible string.
> Use of "qcom,sm8250-ufshc" is already present upstream, so add misiing
> documentation. "qcom,sm8350-ufshc" is for UFS HC found in SM8350 SoC.
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  - add Bjorn's ack
>  - split from phy series
> 
>  Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
