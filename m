Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A2082CE33D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 00:58:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727807AbgLCX51 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 18:57:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731473AbgLCX51 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 18:57:27 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7E02C061A56
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Dec 2020 15:56:14 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id h3so4210502oie.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Dec 2020 15:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Tj/eqYhhAQcKhYafB9RPIyuN5cfJ1B/TPw46tE9Fbis=;
        b=Cv0f1XYlFWVeIv0CnpbmITuX9a/QfNIUokjvwnG1Y0tpB/b4WTNLEgsx2GqHYbwmbX
         bvhqEZ/ouLGsCDneKK0NjCs+MOlgw4gyuxVtxu5QAnpiqTh+ijsMRzYylX4ynJBTDsrU
         OzSOWrY03hNVSMfLHOQO9/r2RtcCwUrGj+SsK0GoABwDOaddcMNCUBqvhCuQIv+YlQxp
         hGlZhtQX2ph3prAyNeYbNocnwO1T2aIHyqwwAyZBYsn1RYBDDfQJ4TcRZgL9yLuPo8mF
         jO9f19aonKqQ35gSQu21U8SdFeMqcnNavI6kmjc1DwFFbg0PIJDPW5SZZMfbVA+2mOJq
         KnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Tj/eqYhhAQcKhYafB9RPIyuN5cfJ1B/TPw46tE9Fbis=;
        b=kikdulmMeRUsaTkIyn5D5PRLPPQwVv4C8YeUjH6uW+HmHag4q2Yqo/sv68TtOG1V0b
         naE4tkLc+JmphoZEnxvtoU1bycoWwTGT4wptsd8jWYVrq5OIDyq0ElwwM8qWam9LKAF4
         AWu8lR1IVqXqtOxGA9+35XhZ4Ia2wMKWQfa0A73Q9umwW6nh2YN+JUPIjp506KA8pWnj
         7Qsos8vnIdJK4ExrP1UZ97NrrKYgIiVXRoviCXjDWDPCamB40KCOtN6RpbGJuJpO4OQW
         w0h9utejvvpoI0rBP+6r/sa4OFMUEL/vphkQw5jAV+0pUOhVkkE1dIm5JDT5OBoScUpI
         pCHg==
X-Gm-Message-State: AOAM531SCeeVc+yvCX2/eALI9WJyelG8WI9RL7EfejutXOGkPDne4bQA
        E1M+XMlku0biC32Dd1KawXmI29hj/p4HvA==
X-Google-Smtp-Source: ABdhPJzQPweT/buGuh+MWJkK+6cjezKR9RTV5x/u3ct6Fn8EYBV5akr7cubnndZ8rc/R3woJjd/r1w==
X-Received: by 2002:aca:728b:: with SMTP id p133mr1227521oic.125.1607039774149;
        Thu, 03 Dec 2020 15:56:14 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j16sm268488oot.24.2020.12.03.15.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 15:56:13 -0800 (PST)
Date:   Thu, 3 Dec 2020 17:56:11 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: clock: Add RPMHCC bindings for SM8350
Message-ID: <X8l7Gwekn2UHO/2z@builder.lan>
References: <20201203070241.2648874-1-vkoul@kernel.org>
 <20201203070241.2648874-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203070241.2648874-2-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 03 Dec 01:02 CST 2020, Vinod Koul wrote:

> Add bindings and update documentation for clock rpmh driver on SM8350.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> index a46a3a799a70..3037eb98c810 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> @@ -21,6 +21,7 @@ properties:
>        - qcom,sdm845-rpmh-clk
>        - qcom,sm8150-rpmh-clk
>        - qcom,sm8250-rpmh-clk
> +      - qcom,sm8350-rpmh-clk
>  
>    clocks:
>      maxItems: 1
> -- 
> 2.26.2
> 
