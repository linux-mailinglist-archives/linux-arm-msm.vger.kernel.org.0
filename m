Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B67A21DD266
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 17:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728774AbgEUPyH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 11:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728295AbgEUPyF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 11:54:05 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C1D8C061A0F
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 08:54:05 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id a14so7579712ilk.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 08:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BfWoobLVAKfzMCiMZcNvEFreCxWJpDiylD9YHTs2DM8=;
        b=hkPi3G6+ffqyy54W13omYGNYelo1z8fPDbEUIslyzE6p6/MRNAcoFKAll6dV0rPZz/
         PLNHi8p7h/L1GdxnH8/vwJ7NSNrlNRk7ApAZoyU/lC1q6V+dfUtYlfBOp933NFKHP+Fb
         0atY4zRCNh71xBRkXSsNFrl6eb2bihQL9IuAT2tgeLH6NTGE4gsYD/e5f82DT3SCKUM3
         F574RYdrLYgihpu0nk9vJ1yksIcajeqrWo4Tev1/KKpd9LEIXu+ZVbTukPwYHjYqIoCV
         j2TWKcnqMoSgTNTpRO/+kxvWzZI4fsioPJ2IjGzsk96RppbCTPeLa07Og0UZY2vZcj78
         f2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BfWoobLVAKfzMCiMZcNvEFreCxWJpDiylD9YHTs2DM8=;
        b=nx7VrslmJ6NryJP59YehiTLZnTLET3p5G4p4ltGWyK8s7BIakEGQMx3LLcPEHOMUDC
         5g/ScVs08mbD0wR1Wb3gHEvgVbOZq+o6XwrWU0qJ6VvJfL8v2zUiY8g6tu51nOb2H2Bs
         5D7Di01MMxhlo6haTgIS3ugWbDJHzCwiFFR6g6pLQstDnTzjFT8RuHdgmaNcZ2zDzymo
         1aRkuB4+w1Kh+6zEz9DEsYc7+qHlm4LADFOuls2ZGMGEahro96gQtXt8Jr1ZrKtsPn5C
         WWXJCM/wE4kKKvU/e5Jk/zSWjKeJSCcdGSsbNKxCq/7BdpG2PLUh7qwqYrGMLS87Mval
         NJOg==
X-Gm-Message-State: AOAM531yTeo+PIqwmckMWyqpYit3PREdieTDPztd1CELNpKWHSpGrLip
        /199g6/H8CrCYdVrt+l2mVx+jJQkxm6jWhsRNK0Dsw==
X-Google-Smtp-Source: ABdhPJxSeqc9p+cZk7hCXVAfU51UL+rEUcfznzd6rZk0t9zdDUQgpdG5YvcK8wwCvzBe2YCoqfVICx4SnejEqjj53MI=
X-Received: by 2002:a92:89cf:: with SMTP id w76mr8990688ilk.57.1590076444041;
 Thu, 21 May 2020 08:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589558615.git.saiprakash.ranjan@codeaurora.org> <7b69c9752713ce22f04688e83ec78f8aa67c63dc.1589558615.git.saiprakash.ranjan@codeaurora.org>
In-Reply-To: <7b69c9752713ce22f04688e83ec78f8aa67c63dc.1589558615.git.saiprakash.ranjan@codeaurora.org>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 21 May 2020 09:53:53 -0600
Message-ID: <CANLsYkx9FsCXPYPzXhR5C6rFKEvBrYr5A6Reu=zAnLG_HVk7AQ@mail.gmail.com>
Subject: Re: [PATCHv3 2/2] dt-bindings: arm: coresight: Add support to skip
 trace unit power up
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Leo Yan <leo.yan@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Tingwei Zhang <tingwei@codeaurora.org>,
        Coresight ML <coresight@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 15 May 2020 at 10:23, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> From: Tingwei Zhang <tingwei@codeaurora.org>
>
> Add "qcom,skip-power-up" property to identify systems which can
> skip powering up of trace unit since they share the same power
> domain as their CPU core. This is required to identify such
> systems with hardware errata which stops the CPU watchdog counter
> when the power up bit is set (TRCPDCR.PU).
>
> Signed-off-by: Tingwei Zhang <tingwei@codeaurora.org>
> Co-developed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/arm/coresight.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
> index 846f6daae71b..e4b2eda0b53b 100644
> --- a/Documentation/devicetree/bindings/arm/coresight.txt
> +++ b/Documentation/devicetree/bindings/arm/coresight.txt
> @@ -108,6 +108,13 @@ its hardware characteristcs.
>         * arm,cp14: must be present if the system accesses ETM/PTM management
>           registers via co-processor 14.
>
> +       * qcom,skip-power-up: boolean. Indicates that an implementation can
> +         skip powering up the trace unit. TRCPDCR.PU does not have to be set
> +         on Qualcomm Technologies Inc. systems since ETMs are in the same power
> +         domain as their CPU cores. This property is required to identify such
> +         systems with hardware errata where the CPU watchdog counter is stopped
> +         when TRCPDCR.PU is set.
> +
>  * Optional property for TMC:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>
>         * arm,buffer-size: size of contiguous buffer space for TMC ETR
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
