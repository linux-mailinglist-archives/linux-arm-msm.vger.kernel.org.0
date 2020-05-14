Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D542F1D41BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 01:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728357AbgENXiC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 19:38:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728347AbgENXiC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 19:38:02 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A3E9C061A0C
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 16:38:02 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id v63so76819pfb.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 16:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QK2T0t/Jj0JFQe8jONLMLZrHIHWtDY8wi6hh+6HVsZc=;
        b=mYnOUX8GzYHSabSOa5Twez7NHxPD2GmAYqgM4bH8a0VNgWLtlOkVTW5tuAvMEvimR7
         Etu0z5LT+oPBLhSpHfTCojRjVsrV0q4wrwVu37uzHLuWl78dm4a7u8QwE6iJ/SwN/uBR
         hs/g4khJraR7/bYg5/+yRId7SUocqo1MZCIUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QK2T0t/Jj0JFQe8jONLMLZrHIHWtDY8wi6hh+6HVsZc=;
        b=Y/ogDtSuKaF4VppJsATL8uBAgoP66WraOHDrDPCxMkBHy6I7tQbRtkymL7DQj+Yw4a
         +8dv1l/3gXkC77BkUp0B4G3d2TxXJbSI3tkUfYNuaFFghdHgJsUjCg9yOflOTAbMv/9u
         oXmcJM4/7rlZTOscAZX3tGm3aWktmWdYKotv18lOtuSmv7nO2yGctDX+n93Knbqd/N4+
         CGxKcEytkmUWcEcrBg0gcgp9XI2ogQr5wtFrKMwzvDmLA3+Ef5JCmyD+AIezVFlkY+sc
         CbB8xGABzv4EdXBr3Jl4sKWLP0NtGFNvMM8znO5HZLs+Km3Bmha6mVmiC307GY7+O23X
         9urA==
X-Gm-Message-State: AOAM533queRsqzUsqY1u4OJdl/6NfGGKPHJ6+F/3HLib1EBZqvbmK48n
        JMYnimeWVbQkvW+MHW9fp9rgLw==
X-Google-Smtp-Source: ABdhPJzr+P5MYAMvALz8QCCQYXEbupCUs1nuQKmzDf3JHLzo0/rZUuIfcPI9IrPK0NfSNUeQxUHy5g==
X-Received: by 2002:a63:4c5b:: with SMTP id m27mr502104pgl.198.1589499481632;
        Thu, 14 May 2020 16:38:01 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id 14sm276163pfy.38.2020.05.14.16.38.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 16:38:00 -0700 (PDT)
Date:   Thu, 14 May 2020 16:37:59 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        georgi.djakov@linaro.org
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sc7180: Add interconnect bindings
 for GPU
Message-ID: <20200514233759.GR4525@google.com>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
 <1589453659-27581-2-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1589453659-27581-2-git-send-email-smasetty@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sharat,

On Thu, May 14, 2020 at 04:24:14PM +0530, Sharat Masetty wrote:

> Subject: arm64: dts: qcom: sc7180: Add interconnect bindings for GPU
>
> This patch adds the interconnect bindings to the GPU node. This enables
> the GPU->DDR path bandwidth voting.

This patch doesn't add any bindings, it adds the interconnects/interconnect
configuration for the GPU

The order of the patches in this series is a bit odd. Typically you would
start with the binding changes ("dt-bindings: drm/msm/gpu: Document gpu
opp table" in this case), then the code needed to support these changes,
and finally the DT bits for the specific devices/platforms making use
of the new 'feature'.

It doesn't really matter once the series has landed since the end result
is exactly the same, however it's the logical order in which most
reviewers read your patches, and typically also the order in which the
patches land (especially when multiple trees are involved).
