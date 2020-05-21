Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD16F1DD2D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 18:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbgEUQLp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 12:11:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbgEUQLo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 12:11:44 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67B57C061A0E
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 09:11:44 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id s3so9499882eji.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 09:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eBNlt0Cc3AKR340fcGvb6vXpN125/gl2y4oSYwBgYK0=;
        b=EqHa/17El0o6+Cu7eVf9sBrousgorP3QI3woImwqEWxv2FlS1YMl0oWDWoMFWPQK40
         F1eK2G603VsFrbARn7L+LdCeCnZZjnv9adHzokplCljNOHRS0wDAxMLv2/Kj5QGnWIKS
         9PnHf5/ND0RwTHSvyNRhsktdDxYB5uHMYb9idIJK6d9G4J6ns9a97pDrJThGL18zLcHz
         74IKUUSt/mTHYN/LHdd+cPd64e/aotSDY9aENkAoJ+tvM5jXQ4UTVczUjLua0/xaihPy
         MnFs6ew02036GA11XX6SQY3oxW5cjB5bFdrfNzc3UijzQnHsuByLe1koRo3kVArRPYNN
         hHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eBNlt0Cc3AKR340fcGvb6vXpN125/gl2y4oSYwBgYK0=;
        b=fSBNRznr5XGKSSuZM9CpU6j3VRPIG4jem3DrEr0V3An67wxBIKypeBFUjhg43vCSRg
         HBksPNRaK98gChd/uTqHoMsCshpj5M6o0xSVHVNxJxLahCra9MeVtuzYXBHdO9Rw7Pkl
         wtClLMMzc24TiFz0YVo3r62y9G/j7VkrX/HPrlawGme7YQIGSjHunSocpVaTVoU+dv85
         X/uWcXjyh99tjI5wH4GD5KbkSdYd0R2Fa0fX0DKuTrm0RNkTBouh4R0lqyG7THefdiPT
         jbFBGBF7ah1qrBvsxe/4hILB78Qe6GIHSHwrfBBT6jE1bXqfkKK/KmcoPPtOgzE14Enk
         qrBg==
X-Gm-Message-State: AOAM533bPrsIeNKkpGIto5GpOtRYSSubWbPDJxr+AM0/C06M5mwOYWnW
        I606k2WbBjL3mYL/Ou79UIVo8F2Rbd5KeGpQsDp55g==
X-Google-Smtp-Source: ABdhPJxGrPCh+N0iQi99b+JXuuxuPOhEPM0HGvOFC+mP3Ce2ExXyPoAYxVlLGSL8ct75JzzbIKg6G+CDqC/Q3sJu8u0=
X-Received: by 2002:a17:906:6094:: with SMTP id t20mr4534291ejj.359.1590077503013;
 Thu, 21 May 2020 09:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589894597.git.saiprakash.ranjan@codeaurora.org> <c9d7748393ece489f9c8510925c2ddb1608db5b0.1589894597.git.saiprakash.ranjan@codeaurora.org>
In-Reply-To: <c9d7748393ece489f9c8510925c2ddb1608db5b0.1589894597.git.saiprakash.ranjan@codeaurora.org>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Thu, 21 May 2020 17:11:32 +0100
Message-ID: <CAJ9a7VjnchycwGPVDpyRMFyLXddcivKct8wfhYgOVmyOnAMbSA@mail.gmail.com>
Subject: Re: [PATCHv2 4/4] dt-bindings: arm: coresight: Add optional property
 to replicators
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-msm@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 19 May 2020 at 14:37, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Add an optional boolean property "qcom,replicator-loses-context" to
> identify replicators which loses context when AMBA clocks are removed
> in certain configurable replicator designs.
>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/arm/coresight.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
> index 846f6daae71b..b598a5f0037d 100644
> --- a/Documentation/devicetree/bindings/arm/coresight.txt
> +++ b/Documentation/devicetree/bindings/arm/coresight.txt
> @@ -121,6 +121,12 @@ its hardware characteristcs.
>         * interrupts : Exactly one SPI may be listed for reporting the address
>           error
>
> +* Optional property for configurable replicators:
> +
> +       * qcom,replicator-loses-context: boolean. Indicates that the replicator
> +         will lose register context when AMBA clock is removed which is observed
> +         in some replicator designs.
> +
>  Graph bindings for Coresight
>  -------------------------------
>

Reviewed-by Mike Leach <mike.leach@linaro.org>

> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
> _______________________________________________
> CoreSight mailing list
> CoreSight@lists.linaro.org
> https://lists.linaro.org/mailman/listinfo/coresight



--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
