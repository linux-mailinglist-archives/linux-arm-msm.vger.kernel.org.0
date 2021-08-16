Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88A603EDCBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Aug 2021 20:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231609AbhHPSCX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Aug 2021 14:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbhHPSCS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Aug 2021 14:02:18 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B528C061764
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Aug 2021 11:01:46 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id w13-20020a17090aea0db029017897a5f7bcso1454674pjy.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Aug 2021 11:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CQAn3RJnCnEKhUAHlpFfnDVdKYIBRS8GR6cHa78A0bI=;
        b=OiP/jE5lIKzaI86z/cSbkWq8KS+Zn367o727+x1oyIZCvtiHty5VuI3vR9Wd9m/DKC
         mrAvJapyrn3wsenqZ8mHt9roDOSCGfRyzs/k1mCcI1rBa1xvrOhQ1kmKQT1zcDOSS1FB
         9jlHPQve9GjHuRcHIygklthjRruh8CAuZ7VKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CQAn3RJnCnEKhUAHlpFfnDVdKYIBRS8GR6cHa78A0bI=;
        b=Otqy0pG9WKV+ilOcxP1443QZ5mQI3F2K5d8HUVBNiideHJmt2X1O6cmhi9HdwaZFX2
         HvmzAhFSoqtI7fvBjW6YD+dMV1VdVCrOX7K5g8TOItw1RpiPIXtBK02896lU2FTUePk2
         vazOOVKQD/+hC9eu1FWEPBHp0IJ0Dic7qFbbwJTUdJ3OXY3uQTnYxnIJspaRULX/JCG+
         dNwLD4hSkpI1ZbjSykTYgIRNoZpZ8J9bVF2zMiQELvUKM2Yzat0wXe9uPAMf8wSmNj30
         hZJvt3n556ExmW0W6tyHomtkOYJ7BLKwyNPMjHNLGrJHZxg6Ff+MpIDjkbwEXPf1MVH5
         uv9Q==
X-Gm-Message-State: AOAM532KITYyj0WbXPAeQJd6vYwxtRFcMd8UvoY+oTGX3HNYWr6mmBLr
        eZq58zyMG50HJAno9n7KTkPZEQ==
X-Google-Smtp-Source: ABdhPJwa1Xm3ePFA3SuM8XZOqgsVOXYMQm8FtguFpY+P9+T3EtyPVM2ryfi8HpcN6WgUHqWEMqbCBg==
X-Received: by 2002:a17:902:a609:b029:12b:858e:d116 with SMTP id u9-20020a170902a609b029012b858ed116mr104173plq.25.1629136905928;
        Mon, 16 Aug 2021 11:01:45 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:5cff:3a19:755c:1b91])
        by smtp.gmail.com with UTF8SMTPSA id x12sm63119pfu.21.2021.08.16.11.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Aug 2021 11:01:45 -0700 (PDT)
Date:   Mon, 16 Aug 2021 11:01:43 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sankeerth Billakanti <sbillaka@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        kalyan_t@codeaurora.org, abhinavk@codeaurora.org,
        dianders@chromium.org, khsieh@codeaurora.org,
        mkrishn@codeaurora.org
Subject: Re: [PATCH v1 2/2] dt-bindings: Add SC7280 compatible string
Message-ID: <YRqoB2UEJtVcr6AN@google.com>
References: <1628726882-27841-1-git-send-email-sbillaka@codeaurora.org>
 <1628726882-27841-3-git-send-email-sbillaka@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1628726882-27841-3-git-send-email-sbillaka@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 12, 2021 at 05:38:02AM +0530, Sankeerth Billakanti wrote:
> The Qualcomm SC7280 platform supports an eDP controller, add
> compatible string for it to msm/binding.
> 
> Signed-off-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 64d8d9e..23b78ac 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -17,6 +17,9 @@ properties:
>    compatible:
>      enum:
>        - qcom,sc7180-dp
> +      - qcom,sc8180x-dp
> +      - qcom,sc8180x-edp
> +      - qcom,sc7280-edp

This adds compatible strings for sc8180x and sc7280 (e)DP, however the
commit message only mentions sc7280. So either the commit message needs
and update or the sc8180x compatibles should be removed.

The driver change (https://patchwork.kernel.org/project/linux-arm-msm/patch/1628726882-27841-2-git-send-email-sbillaka@codeaurora.org/)
adds some (currently unused) 'io_start' addresses which are hardcoded,
I wonder if these should be in the device tree instead (and 'num_dp'
too?), if they are needed at all.
