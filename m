Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 817B53C8A16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 19:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbhGNRy1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 13:54:27 -0400
Received: from mail-io1-f48.google.com ([209.85.166.48]:45645 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbhGNRy1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 13:54:27 -0400
Received: by mail-io1-f48.google.com with SMTP id y16so3156228iol.12;
        Wed, 14 Jul 2021 10:51:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2gRDlQp1MuAFlJu92QnqeuWzzqqzSrOhJUVuS7wmyLA=;
        b=ckY8ABCVrUvCMi/tkhduMJPbVDkCxb85zMvq5bN8K/LdoTlqjb9P8TuREXupnA6kLk
         BlmSzbvqdod6IBcDJ8rtGEwJDScFWosuTe0p+LpDFHjdqBd0Fcxfek0GF9XqxGZB2TV7
         U4tdBTsWmnbsH42id5WD8oODX1AnVRG/63kzyplh6TNmljhrf2hT78UdB7qoq+z7w+7I
         uNKai4lbEILpOIVq6bT3bZ8UF7MiUrwFpzAL2jKMVvUO5l8ZesaIoml29d4vp4aB9Uvt
         0Ht70WmV31EN9iCKFsbXPuDGHbb5ksHxlBtjih/OX4amVn8H9mhEF0GDObt8A8utaPVg
         mxdA==
X-Gm-Message-State: AOAM530lhN2IEXOKNU076X3MCkpDw/aJxzZkRiYUBNqL8oIr/HD4E6lu
        q3/SYSWk8RDuskUdJdaapQ==
X-Google-Smtp-Source: ABdhPJwOTz4yShdDPDvuRzHUrKX45LAoc/ClPXV6RlW1pZulnt5dgHTyt+IGhykIU67hkb84JbN4Qg==
X-Received: by 2002:a02:2b27:: with SMTP id h39mr10077711jaa.62.1626285094249;
        Wed, 14 Jul 2021 10:51:34 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id p21sm1680316iog.37.2021.07.14.10.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 10:51:33 -0700 (PDT)
Received: (nullmailer pid 2832837 invoked by uid 1000);
        Wed, 14 Jul 2021 17:51:31 -0000
Date:   Wed, 14 Jul 2021 11:51:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rajeev Nandan <rajeevny@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org, mkrishn@codeaurora.org,
        freedreno@lists.freedesktop.org, dmitry.baryshkov@linaro.org,
        linux-arm-msm@vger.kernel.org, sean@poorly.run,
        devicetree@vger.kernel.org, jonathan@marek.ca, robdclark@gmail.com,
        abhinavk@codeaurora.org, kalyan_t@codeaurora.org,
        dri-devel@lists.freedesktop.org, robh+dt@kernel.org
Subject: Re: [v2 1/3] dt-bindings: msm/dsi: Add sc7280 7nm dsi phy
Message-ID: <20210714175131.GA2832803@robh.at.kernel.org>
References: <1624365748-24224-1-git-send-email-rajeevny@codeaurora.org>
 <1624365748-24224-2-git-send-email-rajeevny@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1624365748-24224-2-git-send-email-rajeevny@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 22 Jun 2021 18:12:26 +0530, Rajeev Nandan wrote:
> The SC7280 SoC uses the 7nm (V4.1) DSI PHY driver.
> 
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> ---
> 
> Changes in v2:
> - New
>   This patch depends on [1] (dt-bindings: msm: dsi: add missing 7nm bindings)
> 
> [1] https://lore.kernel.org/linux-arm-msm/20210617144349.28448-2-jonathan@marek.ca/
> 
>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
