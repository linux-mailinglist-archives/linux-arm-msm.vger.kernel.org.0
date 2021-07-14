Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CBEE3C8BE3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 21:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbhGNTjc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 15:39:32 -0400
Received: from mail-il1-f172.google.com ([209.85.166.172]:46746 "EHLO
        mail-il1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbhGNTjb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 15:39:31 -0400
Received: by mail-il1-f172.google.com with SMTP id y6so2716387ilj.13;
        Wed, 14 Jul 2021 12:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zCob8KnLhd7BVyF49DM2VLmSQ+kXCXBfTyyPAmEAwzI=;
        b=Lwll3maTAauMq/kmig6/+L4RVxM5ZmCkKVoKN6R/WnWoA5JcFkvTUvdQ9MYDXx4uj4
         KIgoPJzLwbI+h+0Yn02U/Iq9nXglt56ZCkmjJyUbB6ESt4Ju6IxFsw+9QiZuVUwYtgTW
         kWPEpG4JyS34WVZ4l2vCa9o9x0h27IKACr3cPq88Wz7WegE7yCVrM9L4gMhatyoYxX9H
         NVYV4pCK0KjRSp75P7Kv64JmmQUg5kMSwAQ/cgmZFXrTZ4Xq6gm3QIlKOQiBDts/a9Nc
         sj1XsOp/xVJIsI+CT2pSkjBC29EbRP4s+6vC4D0jQm5qDA72z2Jjgd9Xdvni8xGWXbYh
         2lzg==
X-Gm-Message-State: AOAM532peqNAHBol5t9xL+9R41DaVc+fdKAF5KVcwbvvWklobOBYQV9e
        51o9gCVe+jTTMemH3Q8zCw==
X-Google-Smtp-Source: ABdhPJwKha/W8xIOBtkVzmhR5IEcLbaVE7Ber5zf4dzP6xubPe/9bWpTYcvAquj0RFBEywrVCkppQQ==
X-Received: by 2002:a92:4a0d:: with SMTP id m13mr7916538ilf.129.1626291398220;
        Wed, 14 Jul 2021 12:36:38 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id n5sm1829683ilo.78.2021.07.14.12.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 12:36:37 -0700 (PDT)
Received: (nullmailer pid 3154413 invoked by uid 1000);
        Wed, 14 Jul 2021 19:36:33 -0000
Date:   Wed, 14 Jul 2021 13:36:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     dianders@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        saiprakash.ranjan@codeaurora.org, robin.murphy@arm.com,
        linux-arm-kernel@lists.infradead.org, swboyd@chromium.org,
        p.zabel@pengutronix.de, will@kernel.org, joro@8bytes.org,
        linux-kernel@vger.kernel.org, mathieu.poirier@linaro.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        robh+dt@kernel.org
Subject: Re: [PATCH 1/9] dt-bindings: remoteproc: qcom: pas: Add SC7280 MPSS
 support
Message-ID: <20210714193633.GA3154320@robh.at.kernel.org>
References: <1624564058-24095-1-git-send-email-sibis@codeaurora.org>
 <1624564058-24095-2-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1624564058-24095-2-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 25 Jun 2021 01:17:30 +0530, Sibi Sankar wrote:
> Add MPSS PAS support for SC7280 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
