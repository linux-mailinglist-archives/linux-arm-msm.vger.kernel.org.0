Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA1821D59A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 21:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726223AbgEOTF4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 May 2020 15:05:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbgEOTFz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 May 2020 15:05:55 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42BC4C05BD0A
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2020 12:05:54 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id 36so1181049uaf.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2020 12:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ILTNxRMhVaU1ppwKtb504YY35g+lEq0QuWy+iVUE2z8=;
        b=bMZEoYevT52u61nJD5we/u1JaG8jzU7khHbEmIItRoRo9c67denAC2dZI5n/GtGcte
         O6CuOaJk4AYaDQX4yq+aRjJIGv63nxepgB4RHH9gODQ+rlXq7MTS7sE4DkPKkJ4+uXL+
         cADO8rOPfT+7ANv5baePtF9UpQd+3uCS40EDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ILTNxRMhVaU1ppwKtb504YY35g+lEq0QuWy+iVUE2z8=;
        b=PteWVnuepOuiZKkRCOM01ZAtN79CpLD3ljL04VKIfKIE+bDVq9R10/t87GGLIkBoZF
         At1vkBDpMNXbySWNJEu1fBD9ea0MZlUkAt0d68xxLQRXYtqiKGLdax4r9S8DySzrdpu9
         1rAu/tp3sG7cfrKsnqyai3OUU04lzg3j9+LxRxOaeWRD/cup+K0HcJtCHh1f7LbY0Byy
         x4i5G9X3GfjzchZiqt91vryVWFC0enN1IjMJ3B8inYzQTWXeUUNrEKBZD0mIDWxSJO8E
         iiTpQ+/ytI0+hlEh5hQitGUQEkGA0xMXy9OVnyepRvYTOnOavLjP5rTpKIXNjK/YlBxy
         BLlw==
X-Gm-Message-State: AOAM533kzxdeZtwX0j5yGnsnhKs9h/6BDxjZnD19ueWVELgPwHDkIM4m
        o9txNkaT9daRqlrltLuH2M3w7uRTxNU=
X-Google-Smtp-Source: ABdhPJxWyJC3d1QsHd5VRvahYyok1C44yhn/ZfDZmnNf0dixn2wqUuq+zBCp0NPE0fZHxhS/A0x1EA==
X-Received: by 2002:ab0:c16:: with SMTP id a22mr3969762uak.135.1589569552620;
        Fri, 15 May 2020 12:05:52 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id b6sm791032vka.38.2020.05.15.12.05.51
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2020 12:05:51 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id u12so1902209vsq.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2020 12:05:51 -0700 (PDT)
X-Received: by 2002:a67:bd07:: with SMTP id y7mr3909984vsq.109.1589569551204;
 Fri, 15 May 2020 12:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <1588329036-18732-1-git-send-email-smasetty@codeaurora.org> <1588329036-18732-2-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1588329036-18732-2-git-send-email-smasetty@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 15 May 2020 12:05:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WXv9DYf7LWoFBvro=7Bzeb1_0bXAvRH-suzxnrCu+V2A@mail.gmail.com>
Message-ID: <CAD=FV=WXv9DYf7LWoFBvro=7Bzeb1_0bXAvRH-suzxnrCu+V2A@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: arm-smmu: Add sc7180 compatible string
To:     Sharat Masetty <smasetty@codeaurora.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, May 1, 2020 at 3:30 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> This patch simply adds a new compatible string for SC7180 platform.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 6515dbe..986098b 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -28,6 +28,7 @@ properties:
>            - enum:
>                - qcom,msm8996-smmu-v2
>                - qcom,msm8998-smmu-v2
> +              - qcom,sc7180-smmu-v2
>                - qcom,sdm845-smmu-v2
>            - const: qcom,smmu-v2

Is anything blocking this patch from landing now?

-Doug
