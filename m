Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADF30269A4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 02:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgIOAQa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 20:16:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgIOAQ1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 20:16:27 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A08AC061788
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 17:16:26 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id c18so1855025qtw.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 17:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LsGfWYQGWaSkenFi7u0jeJ7jaIE45XkTKdo773tfIo4=;
        b=HnlVHdWMKK+zxUWOpCnXM7RcA7CK+odBmdldGqWyBcADjVwanynSlyKecNhmGevpow
         TgfhswFnw2Ue+CRTeARdrg9Hf+98cMP0JK1hjO5UVeUF4FRpqkBfUpVZKXZl0MuvSTzr
         oHSKLlVYRe48XqM63Oo4fxnIc4jZzjTxP+iTTEdnu4F/mfONfQFLMQVW502/GTQd6O8S
         xH4ZaUpGsjq8hnY8SdwW4D+RfCni2atgW9HHMpn58gENJO4wdfEIat+qm5DVt6ipjP2j
         stPsq3EBNJ7eKBHkJReiO3mIackNAgJJ6vc7kk7jKyD6LaQd2uQIRVluzeCCYKzQdBj5
         2wLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LsGfWYQGWaSkenFi7u0jeJ7jaIE45XkTKdo773tfIo4=;
        b=IcAIQBhKu9FSx4YmlNomzSN23mN6S2HWHj9ril/rWSkJgl1bMeWpX8M+d7lDXfkTIN
         BK2sLJVWbC3nr8KkmOuJWGfVRx1N6paDa5xQQmMVMA1CHuQfwSSiFVG/yG6lmVlEd5AV
         UywxD5DyfIG0GufK6TcSzCYn2BWBFFMYy9Qf86vVyyRLY06auotIGgxpG99tVpcIdVgF
         uqst0OS6QHD0D3pUGYgPNVuFAm7TAk9JB+6aK7KVyqRPL123pp6DPWocMmujjhizGG4H
         t4lWyWxaDH+tXmYMIxbZHLaL/kx1h/VLQ3tiRqQl1cXPMeGtUklDdq4+QY9z/mYWvdYU
         bFiw==
X-Gm-Message-State: AOAM531MfKi9NIdHSYF6p8vNEh3ipeIsPT4e5KzSJMpzmP0fKcTSYc/r
        379PLqi7fDWwauJ/UpHJVq3unw==
X-Google-Smtp-Source: ABdhPJzr0hulD9LdxSdM3Ot8AK3fHr+uKyYh91toMF64cU/P0R5h97DXVp+bHnh/OQk1zDTQs4N/1g==
X-Received: by 2002:aed:2fc5:: with SMTP id m63mr3363940qtd.313.1600128985219;
        Mon, 14 Sep 2020 17:16:25 -0700 (PDT)
Received: from uller (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
        by smtp.gmail.com with ESMTPSA id d5sm16212910qtm.36.2020.09.14.17.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 17:16:24 -0700 (PDT)
Date:   Tue, 15 Sep 2020 00:16:23 +0000
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>, gregkh@linuxfoundation.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com,
        dianders@chromium.org
Subject: Re: [PATCH V6 0/4] Add wakeup support over UART RX
Message-ID: <20200915001623.GB471@uller>
References: <1600091917-7464-1-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600091917-7464-1-git-send-email-skakit@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 14 Sep 13:58 UTC 2020, satya priya wrote:

> Changes in V2:
>  - As per Matthias's comment added wakeup support for all the UARTs
>    of SC7180.
>  - Added sleep state in sc7180-idp.dts file.
>  - Modify the if check in set_mctrl API in serial driver to avoid
>    making RFR high during suspend.
> 
> Changes in V3:
>  - As per Matthias's comments modify the idp dts pin config to keep
>    only the required pin settings.
>  - Remove the extra parentheses from serial driver patch.
> 
> Changes in V4:
>  - As per Matthias's comments, change the commit text to mention why
>    GPIO function needs to be selected in sleep.
>  - Add separate patch for improvements made in pin conf settings.
> 
> Changes in V5:
>  - Moved pinctrl and interrupt configuration to board specific files.
>  - Added new patch for trogdor board specific changes.
> 
> Changes in V6:
>  - As per Doug's comments, fixed nits in patch 2 and 3.
>  - As per Bjorn's comments changed the commit text and rationale for
>    rts, tx and rx in patch 2 and 3.
> 
> satya priya (4):
>   arm64: dts: qcom: sc7180: Improve the uart3 pin config for sc7180-idp
>   arm64: dts: qcom: sc7180: Add wakeup support for BT UART on sc7180-idp
>   arm64: dts: qcom: sc7180-trogdor: Add wakeup support for BT UART

Applied these...

>   tty: serial: qcom_geni_serial: Fix the UART wakeup issue

...expecting Greg to pick this one up.

Thanks,
Bjorn

> 
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts      | 65 +++++++++++++++++++++++++---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 54 +++++++++++++++++++++++
>  drivers/tty/serial/qcom_geni_serial.c        |  2 +-
>  3 files changed, 114 insertions(+), 7 deletions(-)
> 
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
