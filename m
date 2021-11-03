Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7945F444AC9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Nov 2021 23:18:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230397AbhKCWVZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Nov 2021 18:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbhKCWVW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Nov 2021 18:21:22 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 290ADC061714
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Nov 2021 15:18:45 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id g25-20020a9d5f99000000b0055af3d227e8so1148496oti.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Nov 2021 15:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KbAK3E9gZ0Rf65SdcooIGvTrnplapjhc1zBGEcQwMw0=;
        b=FxVPe4f6LLQG7z67e383KouBmt/gDlXT01XhIyLpbOX1ubzbbveB/WebH8mdxVvBux
         BoQH4kuafbBqw6mw9q2LJ5bCsnmHZjtsQis9+tdQGfJEaHQtqef8LpIiCNjy4zhacaad
         m2NtcBHHSDnN+apNFNe73D1Cuixq/t5Rdm+xilmYnpWW0EbPBnJ0FHq9wO6rWLyJVII1
         Xg32sN6EyH9QtS5md7S68uOiB819/jerOrmoyhxNGFQeiTm7iCDv8frX9kEA4BZzI620
         aS7Pe8/2CPHahmk+nHDWlTKg9OlZO4wzwtgcpkZHdW1TRpqXLUggXsjQGEn8Lpn4/vUi
         Y7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KbAK3E9gZ0Rf65SdcooIGvTrnplapjhc1zBGEcQwMw0=;
        b=Tzfh/rxAXUh0Xn9M07VrFelYbHToasrJWR/rY8Mo1BVEWF1bcolv8PX41/skq4YBkq
         wdP1j2SADxmLAdlZkFhtsYHqhNwvBtOrlO2Ntl6epSfz/7Wk3h57aq2s+KxAXJc7Sivt
         bYildFn9pxZH39yHVYtxvQz02C62yEHOyfYqaEMxwqplXBU7PxIUkgQcbRSdOKV/DJeo
         n6m5m35/hbbccX+5W7f+9p14S4tMA97rcMEpWXqqVu2tWOwgFeFhupKEiztu6S8UffmO
         XAuGQtck3rbm7NjOmus3XDGiet0Hjmo/pzW0OrAYT2R6nTrtzgg96zcVAA+gUlz835C5
         tg+Q==
X-Gm-Message-State: AOAM5320JbcHk5eIwLWmjC+9LSg44f0c6DXX1THvdfLKHNH+kOne68Qp
        T9Si+Sg7Y+hRKFfKgdpvPWbwrg==
X-Google-Smtp-Source: ABdhPJwE3gWlnEHH4Dmdjy/djjbu/ePiC4Xgep2d/Vs4xE4zOZ7x255+QMBS6qvbjDXdOMBbreC0yQ==
X-Received: by 2002:a9d:774c:: with SMTP id t12mr28285120otl.282.1635977924469;
        Wed, 03 Nov 2021 15:18:44 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s21sm879524otp.57.2021.11.03.15.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 15:18:43 -0700 (PDT)
Date:   Wed, 3 Nov 2021 15:20:24 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Fenglin Wu <quic_fenglinw@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        sboyd@kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        collinsd@codeaurora.org, subbaram@codeaurora.org
Subject: Re: [PATCH v1] dt-bindings: convert qcom,spmi-pmic-arb binding to
 YAML format
Message-ID: <YYMLKCspjdyaKWUK@ripper>
References: <1635836275-8873-1-git-send-email-quic_fenglinw@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1635836275-8873-1-git-send-email-quic_fenglinw@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 01 Nov 23:57 PDT 2021, Fenglin Wu wrote:
[..]
> diff --git a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml
> new file mode 100644
> index 0000000..05bb114
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml
> @@ -0,0 +1,122 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SPMI PMIC Arbiter
> +
> +maintainers:
> +  - Fenglin Wu <quic_fenglinw@quicinc.com>
> +
> +description: |
> +  The SPMI PMIC Arbiter is found on Snapdragon chipsets. It is an SPMI
> +  controller with wrapping arbitration logic to allow for multiple
> +  on-chip devices to control a single SPMI master.
> +
> +  The PMIC Arbiter can also act as an interrupt controller, providing
> +  interrupts to slave devices.
> +
> +  See Documentation/devicetree/bindings/spmi/spmi.yaml for the generic
> +  SPMI controller binding requirements for child nodes.
> +
> +properties:
> +  $nodename:
> +    pattern: "^qcom,spmi@.*"

Node names should never contain "qcom,". Seems the agreed upon node
named should be "spmi@.*".

The rest looks like a reasonable conversion to me.

[..]
> +examples:
> +  - |
> +    qcom,spmi@fc4cf000 {

Regards,
Bjorn
