Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 574BB3AD298
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 21:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234006AbhFRTPi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 15:15:38 -0400
Received: from mail-oi1-f180.google.com ([209.85.167.180]:44705 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231565AbhFRTPi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 15:15:38 -0400
Received: by mail-oi1-f180.google.com with SMTP id s17so2881284oij.11;
        Fri, 18 Jun 2021 12:13:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dl4FOlqLv4Z0Tulz8jAFPR7A25eMTlDbZSxoXS0J78s=;
        b=IrwDCT3/YLssH95Q8cmLkRRNJPeCYj+7sbvuof7L1L2Z1zqkh8T59pY0RHN+0qhlmW
         4wb8dwSZM9cDf3KOpwPY1JjE1fo5vj+NPvtC8qSE4bxusCnj1WiMsXb7iMpp4NEEnBPN
         +MtNilrrvf+wyXUAofosycIiScVg8ArQHJjTPfDQZ5mComJzop+8WTAJiXEYOkwxn+Ec
         f8TWoYrymSEo+GsZj0lwqOrGHjJ57TlfRYOViEdHqDBvN//eXGtbq4qsgkdUBZvCfQcc
         yyFfURJ+nA96GpLUnmSSYqC+px2vojWMRthssseEg7oB6mNJ6O6e9hBId5vm3Om5iFrL
         ejfg==
X-Gm-Message-State: AOAM531S3PzGIVmwaigZJsf1cmpfcd8b3BvMvS70L+uIS5Jxz7Ntl3g2
        RIpcM2HEj58DzpRif2sh/A==
X-Google-Smtp-Source: ABdhPJwWvWUw3Eoz7g/amv13AZe9VuDvwk0tm5r4DTID96jvLll7efVHE4u/i1wwFWcpThEVW/k4Uw==
X-Received: by 2002:a05:6808:2019:: with SMTP id q25mr15882040oiw.84.1624043607101;
        Fri, 18 Jun 2021 12:13:27 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id 79sm2215467otc.34.2021.06.18.12.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 12:13:26 -0700 (PDT)
Received: (nullmailer pid 2644851 invoked by uid 1000);
        Fri, 18 Jun 2021 19:13:23 -0000
Date:   Fri, 18 Jun 2021 13:13:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 1/3] dt-bindings: msm: dsi: add missing 7nm bindings
Message-ID: <20210618191323.GA2644798@robh.at.kernel.org>
References: <20210617144349.28448-1-jonathan@marek.ca>
 <20210617144349.28448-2-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617144349.28448-2-jonathan@marek.ca>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 17 Jun 2021 10:43:33 -0400, Jonathan Marek wrote:
> These got lost when going from .txt to .yaml bindings, add them back.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  .../bindings/display/msm/dsi-phy-7nm.yaml     | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
