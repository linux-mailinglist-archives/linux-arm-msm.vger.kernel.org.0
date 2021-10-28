Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD9243F245
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 00:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231409AbhJ1WHv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 18:07:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231290AbhJ1WHv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 18:07:51 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A5EC061745
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 15:05:24 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id n11so2274307oig.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 15:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=K9UBnDgY425QDygPvGt3o1Td/4RRZ5EAJhMXHkdozRU=;
        b=FM0rLYNu1+ErBFuS26Bd+y+C6G51CyTBQZ2r5DkqkLzOKvN6ApYpobItt2PNtXDs2b
         AzSg5WVoRoSBQT3oB8FrHN/bGv5G2+wGLFKpfZXPZS0KBpTTXlKTovdMsKIDLF9yGKjx
         gkv/ZVNFnzoKgHcc7DKHaXnrk7PlDgQFf1CwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=K9UBnDgY425QDygPvGt3o1Td/4RRZ5EAJhMXHkdozRU=;
        b=VktQR4509kaB71WAkPijEEXPeJ0D+ERTymoSczPufqDyG2VvqdCIfr9uxLJuGWKe6z
         vhlY9yjgHKM5YseossVkLjOxKRGwMJJN+ZgeNofRrDa7oPTELPRYf+fw07tiMmcKkneJ
         LaH8nUiuA3FYy68w/e0rry9Jlvp8hAQ9AWsD48MwJyCjSIlVe+XTv0MZmjJ21Bdnboyw
         PQ5/ZthJuFnf9BwvsWoWcnxOmpffNHuJ6u5pNFIKJvSoiTO0skJQh5uCBpzvE3AXQOXA
         QIWTj6O6V6aShV+SlnbG5H+45h45Bl1wGB8ZOR0csSXyqX6TEBoJu3P5A43zlIyevQva
         VtxQ==
X-Gm-Message-State: AOAM531PZ/omg92E0hks2tgN8dpjRVqwegwl5EvjNBKC5cAUHb0WaHjK
        dvy3xIAc3ca2MrtSNt+NspJTwm1/DQJ83oi/KBDfEw==
X-Google-Smtp-Source: ABdhPJwg2zw1/jW0y61U8U7GYDUhUDAXyhoBEIGD5TwRhN4mcpqiCyxsEbT8u9/uL4TUn7cBNIBdRV+TaG1F7YXwbzk=
X-Received: by 2002:a05:6808:2124:: with SMTP id r36mr5286797oiw.64.1635458723366;
 Thu, 28 Oct 2021 15:05:23 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 Oct 2021 15:05:22 -0700
MIME-Version: 1.0
In-Reply-To: <1635408817-14426-2-git-send-email-pillair@codeaurora.org>
References: <1635408817-14426-1-git-send-email-pillair@codeaurora.org> <1635408817-14426-2-git-send-email-pillair@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 28 Oct 2021 15:05:22 -0700
Message-ID: <CAE-0n53_qNfsdXa2eLY3g74bpq2HhN2DjSGCe0gCwDfovnWPdw@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] dt-bindings: remoteproc: qcom: adsp: Convert
 binding to YAML
To:     Rakesh Pillai <pillair@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        ohad@wizery.com, p.zabel@pengutronix.de, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibis@codeaurora.org, mpubbise@codeaurora.org, kuabhs@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rakesh Pillai (2021-10-28 01:13:35)
> Convert Qualcomm ADSP/CDSP Remoteproc devicetree
> binding to YAML.
>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---

Found it. I think it hit spam :(

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml
> new file mode 100644
> index 0000000..90ca7e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml
> @@ -0,0 +1,161 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/qcom,qcs404-cdsp-pil.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm QCS404 CDSP Peripheral Image Loader
> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +description:
> +  This document defines the binding for a component that loads and boots firmware
> +  on the Qualcomm Technology Inc. CDSP.

What does CDSP mean? Can you spell out the acronym once?

> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,qcs404-cdsp-pil
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      The base address and size of the qdsp6ss register
> +
> +  interrupts-extended:

I think the recommendation is to use interrupts and the schema will know
to treat interrupts-extended the same.

> +    items:
> +      - description: Watchdog interrupt
> +      - description: Fatal interrupt
> +      - description: Ready interrupt
> +      - description: Handover interrupt
> +      - description: Stop acknowledge interrupt
> +
