Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CADFC371E32
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 May 2021 19:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbhECRPM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 May 2021 13:15:12 -0400
Received: from mail-oo1-f41.google.com ([209.85.161.41]:33282 "EHLO
        mail-oo1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232410AbhECRMf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 May 2021 13:12:35 -0400
Received: by mail-oo1-f41.google.com with SMTP id j17-20020a4ad6d10000b02901fef5280522so75818oot.0;
        Mon, 03 May 2021 10:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HEwsaXMShI2GeSM41jio8xx76l9slgvd7XZXsac4VUg=;
        b=Oz3MXS3dcMZTfuEnvw5CT3iUEjJrOJPprDkk0HAa6scPbtSpnmUzuy+/hIWv0DB4FH
         qYgU4cpJms8hFOKYt60z2xEhQVo/0f18U4VZQqJszbuFlHlwnmW4Boug8W6Udhl5fGyB
         IV6FAqAdNxiDqXdmpViHomy5Lis40evTR/TV9y7ciJhorwqQazPqwP6ao4sySuR4OF3R
         gZgzbKFqXmjJR8pUD9LAROHASC1Uoga6Be4q4pT34syo+aFO7Ar+jl8hf1reSyDlpjhA
         /KdQV2ZKLgwo0aS1S6uTKMxFLbOCyQo/MG+6xf1XLvEQIPVga7K7rVqzM1gyeBDRb1ou
         QwPQ==
X-Gm-Message-State: AOAM530+7Jw8umg8UPVV3dAdV2Aw7aS/R7co/fsErmTZLwUQyZAY4wJb
        iBJ5kvpDEOVMQtqynVbMKQ==
X-Google-Smtp-Source: ABdhPJzB2X9md1pNaZpXDPwfhMw4IJJCmfgm9y0e4bZqmY3AfOUvTWL029kd9wuNRihOizFkPUmRuw==
X-Received: by 2002:a4a:9c8c:: with SMTP id z12mr16084980ooj.3.1620061901386;
        Mon, 03 May 2021 10:11:41 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q184sm84746oic.35.2021.05.03.10.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 10:11:40 -0700 (PDT)
Received: (nullmailer pid 2025724 invoked by uid 1000);
        Mon, 03 May 2021 17:11:39 -0000
Date:   Mon, 3 May 2021 12:11:39 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: display: msm/dsi: add
 qcom,dsi-phy-cphy-mode option
Message-ID: <20210503171139.GA2011901@robh.at.kernel.org>
References: <20210423172450.4885-1-jonathan@marek.ca>
 <20210423172450.4885-3-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210423172450.4885-3-jonathan@marek.ca>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 23, 2021 at 01:24:40PM -0400, Jonathan Marek wrote:
> Document qcom,dsi-phy-cphy-mode option, which can be used to control
> whether DSI will operate in D-PHY (default) or C-PHY mode.

Given this is a standard MIPI thing, I think this needs to be a common 
property. We already have phy bindings that use the phy cells to set the 
phy type which I think you should use here. See 
include/dt-bindings/phy/phy.h.

> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi.txt | 1 +
>  1 file changed, 1 insertion(+)

Note that this file is in the process of being converted to schema. 
That's been going on for at least the last year... :(
