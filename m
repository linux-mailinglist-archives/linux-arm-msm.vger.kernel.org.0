Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A712B3AD37F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 22:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232690AbhFRUVR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 16:21:17 -0400
Received: from mail-oi1-f177.google.com ([209.85.167.177]:39770 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbhFRUVR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 16:21:17 -0400
Received: by mail-oi1-f177.google.com with SMTP id m137so11853619oig.6;
        Fri, 18 Jun 2021 13:19:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jiQXZfDjv/bMwoJeG1sSXGsM9Ko4Tc89uAJiTFvr5JI=;
        b=YqBdQO+AWmpVrW+loaYeeoynpG52Bac8TDviMcrBt/luBnzIA9jBGaAwNlK4ZPAknF
         vrvcVrpSmdtEj1gCittT/K+WG/BN1wbXwHQCzSYbG/8SDHFwihzhXnuUL+2GKyjiyAas
         tPl8UX39HWNeYIP1fTTpOMfS0lFQwrGZTkM8rDwhC4pT4dpltV6t5A46pe9wpUXnoLhS
         UrYSB/3+UQBPc9y1xw/Fq+AobbuD/iG5lsc2L7nZixptLrDkYKBOdLQOuiBZrj/34ld1
         GP5UL9Gw8dMUbelWdfgORH2k5QqLH7g6CPNjKObFXXHOuGR6ngMwW6p/9FNZHTBKarjs
         zXvg==
X-Gm-Message-State: AOAM531gwgwUQiGHFxRazbboH5KAYKloYvZj+VQDLvpC32cWYxF/YZjj
        p/kdJHLoXKKaWYgtJEA2pmHpY0hAdA==
X-Google-Smtp-Source: ABdhPJykdNN32U0OzPulRNEKoM/kJ0rVZiENGRYIdnArFX2Rp7vPtuO/dx9FwqRA/NL2TVuEdqIk8g==
X-Received: by 2002:aca:a9c9:: with SMTP id s192mr8755488oie.130.1624047547243;
        Fri, 18 Jun 2021 13:19:07 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id 94sm2207535otj.33.2021.06.18.13.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 13:19:06 -0700 (PDT)
Received: (nullmailer pid 2811046 invoked by uid 1000);
        Fri, 18 Jun 2021 20:19:02 -0000
Date:   Fri, 18 Jun 2021 14:19:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     ohad@wizery.com, dianders@chromium.org, bjorn.andersson@linaro.org,
        sidgup@codeaurora.org, ulf.hansson@linaro.org,
        devicetree@vger.kernel.org, swboyd@chromium.org, rjw@rjwysocki.net,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, rishabhb@codeaurora.org,
        robh+dt@kernel.org, agross@kernel.org, mathieu.poirier@linaro.org
Subject: Re: [PATCH v2 01/13] dt-bindings: soc: qcom: aoss: Drop power-domain
 bindings
Message-ID: <20210618201902.GA2810988@robh.at.kernel.org>
References: <1623080372-13521-1-git-send-email-sibis@codeaurora.org>
 <1623080372-13521-2-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1623080372-13521-2-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 07 Jun 2021 21:09:20 +0530, Sibi Sankar wrote:
> The power-domains exposed by AOSS QMP node are used to notify the Always
> on Subsystem (AOSS) that a particular co-processor is up/down. These
> co-processors enter low-power modes independent to that of the application
> processor and their states are expected to remain unaltered across system
> suspend/resume cycles. To achieve this behavior let's drop the power-domain
> bindings and replace them with generic qmp_send interface instead.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
> 
> v2:
>  * Commit message update [Rob]
> 
>  .../devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt       | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
