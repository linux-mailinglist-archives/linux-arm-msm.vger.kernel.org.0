Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 050B62A6E76
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Nov 2020 21:03:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731600AbgKDUDE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Nov 2020 15:03:04 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:33858 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731394AbgKDUDE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Nov 2020 15:03:04 -0500
Received: by mail-oi1-f194.google.com with SMTP id c21so8485281oic.1;
        Wed, 04 Nov 2020 12:03:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oBqDX2AjknVBn06K8/u+vt1ooNK8RMqy/l2tyn5+RE8=;
        b=Os/yX1tMpL2Ku6JL91ePkLtpaxzbfARvH2GtxbTQxbJe3R8lNO8IpsfvGOugj0o3Nu
         nteNHNAr+xaEehMEz0v0a/ehYI2SeSzWsNkFhk/jV7llOtm8UAGW3WectvcW1Ck3HmIv
         u9VUS6qspri3PBN3eQmB4gaQ38m+IbM2wxndEI7jxNJh236iHsa3JOXSmNOKg5nWQl8J
         ZTB1etulVsc+8nXYXJu5WadzeZBQJctIDY1fdHzZE97iQgJI+SgIAQ7fO4X9PU+n7pjU
         22nhypsgEo6hK4V0holckrnnMycQ3PcupSchElr/zHCe7KmHk0rvqAZtl4kvwkTyFg3q
         zniQ==
X-Gm-Message-State: AOAM533e4GmOMWc2MIgQxyxybCobiUzaSr+DbVH3hcHp+JF80qaAhxxa
        9sxakDmFR6R3SMgBFXLaTg==
X-Google-Smtp-Source: ABdhPJwScFjt5SJiTj7x04SzO5UJDiz4X8g4A1clj71IAewexTQOZdLGaJUnD77962i4rsrTIwSVtQ==
X-Received: by 2002:aca:eb06:: with SMTP id j6mr3334409oih.144.1604520181850;
        Wed, 04 Nov 2020 12:03:01 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h8sm660259otm.72.2020.11.04.12.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 12:03:01 -0800 (PST)
Received: (nullmailer pid 4037168 invoked by uid 1000);
        Wed, 04 Nov 2020 20:03:00 -0000
Date:   Wed, 4 Nov 2020 14:03:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        mka@chromium.org
Subject: Re: [PATCH v5 3/3] dt-bindings: drm/msm/gpu: Add cooling device
 support
Message-ID: <20201104200300.GA4036650@bogus>
References: <1604054832-3114-1-git-send-email-akhilpo@codeaurora.org>
 <1604054832-3114-3-git-send-email-akhilpo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604054832-3114-3-git-send-email-akhilpo@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 30 Oct 2020 16:17:12 +0530, Akhil P Oommen wrote:
> Add cooling device support to gpu. A cooling device is bound to a
> thermal zone to allow thermal mitigation.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

