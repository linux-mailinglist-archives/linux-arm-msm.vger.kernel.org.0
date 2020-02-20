Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCC6216697C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 22:02:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729006AbgBTVCo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Feb 2020 16:02:44 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44997 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728582AbgBTVCo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Feb 2020 16:02:44 -0500
Received: by mail-pg1-f193.google.com with SMTP id g3so2518827pgs.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2020 13:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yCWhyMONDF7/2d7s+slz/xE4GsVXYJ+VIwzdQklkW/U=;
        b=JsoqIRD4xomQetfHM7XtcK7FHq/ipSAEkJsVnBvyST4DrAaAZF6BueSVgo/A0us1yb
         ELSgSfno5PgHnoJm/NzqbsG8qQ02kmK3xDxajwkASRuGLEPI5+BMdVoxVksurm9wJ1Hp
         6IrSh0MG+2h1RvRA1zHGLa4KQ8N8MtjmIgGKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yCWhyMONDF7/2d7s+slz/xE4GsVXYJ+VIwzdQklkW/U=;
        b=TS/pz1XY4c+HClEi+UGTPhlaGrU1WHkA3GC9J2SzoYupymICHg1yqty9BW7D0L+N6P
         FPCi4fG0lqP8FbI+msz5T0gKFUrXls8adwo2B5iLjw7bMTS+1wtsSQ0h183T7IvUxK8r
         zyt59gL+aX4ptUjqE9LmQ11uGbhmr8oWC27wjjIBqsLIg2kmJljIwGgOOs+b0tjDD2aq
         V6Xc8yKFrUgviBD61AXQ97x3D3Nfj5+tWeIhN10M9OCVpfOOcdLdY2akp997dZEiyypE
         QrjJGKB/HdShXOnh7TN3EfM73/NUxORwIsd9KezT07zIfhoVnrqkIeaKL9XIsVLeNFjG
         DP2A==
X-Gm-Message-State: APjAAAWaM/0azYo6XwYwhcu272aMvP0t4ZeIJI6XLpnFRiuggcGhGhHL
        huAJeOf945u4kETSypM7l+8UJw==
X-Google-Smtp-Source: APXvYqybBEIA4/pqHt8cShquf8H+vaT94NLFSfun4J2uEKy/wjt157bBu3t/D8co6V54Gr/xmMNoZQ==
X-Received: by 2002:a63:565e:: with SMTP id g30mr3053334pgm.206.1582232563637;
        Thu, 20 Feb 2020 13:02:43 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id o73sm341592pje.7.2020.02.20.13.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2020 13:02:43 -0800 (PST)
Date:   Thu, 20 Feb 2020 13:02:42 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        jcrouse@codeaurora.org, dianders@chromium.org
Subject: Re: [PATCH] dt-bindings: arm-smmu: update the list of clocks
Message-ID: <20200220210242.GC24720@google.com>
References: <1582186342-3484-1-git-send-email-smasetty@codeaurora.org>
 <1582186342-3484-2-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1582186342-3484-2-git-send-email-smasetty@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 20, 2020 at 01:42:22PM +0530, Sharat Masetty wrote:
> This patch adds a clock definition needed for powering on the GPU TBUs
> and the GPU TCU.
> 
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 6515dbe..235c0df 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -28,6 +28,7 @@ properties:
>            - enum:
>                - qcom,msm8996-smmu-v2
>                - qcom,msm8998-smmu-v2
> +              - qcom,sc7180-smmu-v2

The addition of the compatible string isn't (directly) related with $subject,
this should be done in a separate patch.
