Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA8D040F24C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 08:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233584AbhIQG06 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Sep 2021 02:26:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233552AbhIQG06 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Sep 2021 02:26:58 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A224FC061764
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 23:25:36 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id y63-20020a9d22c5000000b005453f95356cso4644955ota.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 23:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=ICEs66mzOrWw5DoGNjzQDzMrnyfZ+Z+NkVU0FU1eIqM=;
        b=ffB/SHZAlTYkRT/UiB9ZGJAejN4vLBrCabhGLPTmaUVzTGPciu7V/RhWZ2Ppcswr7L
         EFLXxWZHPfm6dA0V6y1vovBZH/lwgO66e/TDYrfCFOi0lC0uLSPap141TNp0R5Jn4h9P
         MnX7NdiUb/ajqWy+cZqQcA1GSznY+yOkhMW5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=ICEs66mzOrWw5DoGNjzQDzMrnyfZ+Z+NkVU0FU1eIqM=;
        b=QUk8iABfESPC00QmSuvlEW/xJe+qvhUS3NWfLSG0enBxuqavTXcGiHHGXCzYu4GUg+
         h2wy9aFDo4WjQZtrYYYIgfcDsYwensFMuG354/L7cHFqK6sGOwUEdR5AyrWpiNa150yz
         UzZlhzPIftr8apZH6TJr21udTzEoDNjncBijzwsmRckXcuZ6Qq5/ch6JMDh51S7Q5gHt
         E9Qh9aM53XnzZHvgu6tUfrzULaU31Qm4RcP+ebBQ3tqQD7AeSnUzlTntiXHDVH8K2+4y
         /1VIBOzHUGa+omWpQT0pSAuLBMF+lbd3ovvrASqSr+VyEne6sT34ixl8jIlAoYU81TOL
         P8PQ==
X-Gm-Message-State: AOAM533zSGjMM6CKFWl/2CTK6AZH9dJoZc22xQiSTJ7cjBBpu4SIRBhF
        QpZ0rCF8hxvu4t5TIZe9uKqTMUtUaACSiu/9I1AVMw==
X-Google-Smtp-Source: ABdhPJyDW1VAO7a/TQ1CU2vowcY3A3hOPeoUkpVMQrtweBg2luyz25xyyE+y6zVDUbyY0eP6EHeblTMoRnpczu07QOc=
X-Received: by 2002:a05:6830:719:: with SMTP id y25mr7949091ots.77.1631859936068;
 Thu, 16 Sep 2021 23:25:36 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Sep 2021 23:25:35 -0700
MIME-Version: 1.0
In-Reply-To: <1631811353-503-3-git-send-email-pillair@codeaurora.org>
References: <1631811353-503-1-git-send-email-pillair@codeaurora.org> <1631811353-503-3-git-send-email-pillair@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 16 Sep 2021 23:25:35 -0700
Message-ID: <CAE-0n51KBYjZvwGNy06_okmEWjEfRLQO54CYaY6-JnbBk6kOhA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: remoteproc: qcom: Add SC7280 WPSS support
To:     Rakesh Pillai <pillair@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        ohad@wizery.com, p.zabel@pengutronix.de, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibis@codeaurora.org,
        mpubbise@codeaurora.org, kuabhs@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rakesh Pillai (2021-09-16 09:55:52)
> @@ -78,6 +84,10 @@ properties:
>        Phandle reference to a syscon representing TCSR followed by the
>        three offsets within syscon for q6, modem and nc halt registers.
>
> +  qcom,qmp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Reference to the AOSS side-channel message RAM.
> +
>    qcom,smem-states:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      description: States used by the AP to signal the Hexagon core
> @@ -117,6 +127,33 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,sc7280-wpss-pil
> +    then:

Honestly I find this if/else to be a huge tangle. Why not split the
binding so that each compatible is a different file? Then it is easier
to read and see what properties to set.

> +      properties:
> +        interrupts-extended:
> +          maxItems: 6
> +          items:
> +            - description: Watchdog interrupt
> +            - description: Fatal interrupt
> +            - description: Ready interrupt
