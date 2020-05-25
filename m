Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18C281E124A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2020 18:02:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391154AbgEYQB7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 12:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391039AbgEYQB6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 12:01:58 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3CB0C08C5C0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 09:01:58 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id r2so6505083ila.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 09:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ndTklb7/SAZk4bUIoOKID+ziy4QQzei1SxmS+QITaNQ=;
        b=Okfa0myw3gWvHcsvCG+LrNu8vo8bECwM1NcFblymMQAiGT7+y9eHEr8NC5z6+N8JzK
         mzlw3h7rltmPg5jkXMl04Me9kIbZlJYjsG8Urh65mRdyktu03LLIpv77czeeIpVw8Sru
         x6DqR6REiEic6JH/kXXTOsijnyICa34jR95UnPtu86+3N8w52mTLttUjUQRtPFCY/AZA
         vG6P/pea15LJdJxDU3EvCTPMiuu5DCbxndnPe4cnBnNZF2ZxKEZ4qbok33u/ix0NGgf/
         NluPSBy63jZnk1Nbp5nADhjP36FybTKqPGJNjjHqjN3ow+fOetbQDP+cAHrBoMqBGVCR
         wFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ndTklb7/SAZk4bUIoOKID+ziy4QQzei1SxmS+QITaNQ=;
        b=hUpwK8wEOpxgu0b9sXH2bOBirw3MzYrGv5o091r75SDe+q008ojc4OAm4RW6yd3aPg
         JfG925CDkR7HwDMoEClOaBrS9IyyyXLXI3+Mr84HKoB5uQgdrWeVNu8z7FFezTqT5xRo
         m3PiHrUZOVevz8Gb2mcCyb6fEgMjGC+VV8cSj2jTez1PS6iqQADhGUxmJ7SRKfRD+6lb
         H7F2KWDiI/WD9UgGul7HJAxLQpiKwcv/vz6Fu5Oh/B7NE9cYw+MebKOvN82w575S/uj4
         vs92dvoIdi5CW1B9JrBqlGjL4F2jknId9spKQ+hfNLy28gcgtn4j7LuKRWbRXODw6HQf
         qPHA==
X-Gm-Message-State: AOAM532toYpE6eSwJKWBNqLZ16bubOEjWT+wzLjnG5r6JqXvadv4OoLd
        vALnIgXZJSdwmQJQgczzVgbbs1dOaSwzoI0F7rU5gQ==
X-Google-Smtp-Source: ABdhPJzdCyCnVR8DkEpN7qEDDAtmWOw4EM3xPxchVD4sgi/TBYuoYYkIjzb27DvgzVuornpYLqRjO0idnxc4E75ZQnI=
X-Received: by 2002:a92:89cf:: with SMTP id w76mr24457702ilk.57.1590422517999;
 Mon, 25 May 2020 09:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590171891.git.saiprakash.ranjan@codeaurora.org> <ccfe8a5ede0523436508e31085322ccdab8f972a.1590171891.git.saiprakash.ranjan@codeaurora.org>
In-Reply-To: <ccfe8a5ede0523436508e31085322ccdab8f972a.1590171891.git.saiprakash.ranjan@codeaurora.org>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Mon, 25 May 2020 10:01:47 -0600
Message-ID: <CANLsYkwhjbyspLjbnp4XYCcRNFUkBs46QjWYBTza1scGDtNSmQ@mail.gmail.com>
Subject: Re: [PATCHv3 2/2] dt-bindings: arm: coresight: Add optional property
 to replicators
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 22 May 2020 at 12:37, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Add an optional boolean property "qcom,replicator-loses-context" to
> identify replicators which loses context when AMBA clocks are removed
> in certain configurable replicator designs.
>
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
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

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> +
>  Graph bindings for Coresight
>  -------------------------------
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
