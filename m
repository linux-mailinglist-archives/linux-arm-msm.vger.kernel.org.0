Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0072232515F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 15:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232139AbhBYOON (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 09:14:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232601AbhBYOOA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 09:14:00 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5AB8C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 06:13:20 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id u26so3687376pfn.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 06:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6GRnt6B0rkMdijhyPK+LOQenXT16QusFxuJUZwPGnoI=;
        b=ec2Cqlnjp5L/PkD+qIoyrmnalU727PH/kH8AqB0rndmLCL8YL4goS/cCVanLqFLSDa
         W7hGFfuLNczvWBvVCyClNFYw23i+WY+tAG4FaXfyv4DrUNfMc81792XAFdWEFGqWePXH
         OsmVfXeLD6seR6crSMUz/0zYa8ZRzt7ZnFKkBl8fXGVXHzeMhWKeQTu9QAi7DJrghnmh
         x2NIN14de7+51sRogn3VCvwyFHSQaNmXLV6DonQ1NJRNgokEVbm4mdzSvVBqATCDYmW7
         BfHRV+3evhkiz6SSk7++RgBaPJUhketRc1FW32EpUydXJfBwz05e9yB14+8dXZniQE+G
         KbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6GRnt6B0rkMdijhyPK+LOQenXT16QusFxuJUZwPGnoI=;
        b=cb6zGisidKSlq4mh9gmvIKllSThI7fXw2a0oiWo78zg5Ix+uj7ob3uiXybaWDjm448
         6Mvwkt3izzqajPhjO3aNYwnG4OXX7EkLAn7GUHD5oHPwuR8wA7axO2+Et5F+tTilUm83
         kJzAHNPrBFTzjDsElJRTS/S+3tADi3Z2ovQv0hdIGgOJ6wCJ92RLixlUQ/JYosDgy/PU
         TfWIc80y8K59Xb6t6AG7CixYxHHJoJW15oxYvJxKv80t/Rome34DI02f98pFgBQ5ZK4M
         pB6JXpvEiGrK3zXItZEm6tWKWSYIpkL23w1Kr4aQ/hSELlPd75y58ie7PSipZ81bkk2m
         wz6w==
X-Gm-Message-State: AOAM531h29mf4bs561BLB59jmuvtkqrhwJszzWF5guxuILfaIMlpVcKY
        tUFrS5crzkS0k7n7W2t8iCIn
X-Google-Smtp-Source: ABdhPJxCKIIraurp8E/tB6EnsRt0GUuQBaxFvG9yZRUgCH1ru3ko7H3yzXQLBKbLMDXrDh6DdIAY6A==
X-Received: by 2002:a63:1d45:: with SMTP id d5mr3177334pgm.52.1614262400156;
        Thu, 25 Feb 2021 06:13:20 -0800 (PST)
Received: from work ([103.66.79.45])
        by smtp.gmail.com with ESMTPSA id e24sm5953495pjr.13.2021.02.25.06.13.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 06:13:19 -0800 (PST)
Date:   Thu, 25 Feb 2021 19:43:15 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH 4/9] dt-bindings: mailbox: qcom-ipcc: Add compatible for
 SC7280
Message-ID: <20210225141315.GC28614@work>
References: <cover.1614244789.git.saiprakash.ranjan@codeaurora.org>
 <b666817f1c72278a5b839437ea2e5c26b587ec36.1614244789.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b666817f1c72278a5b839437ea2e5c26b587ec36.1614244789.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 25, 2021 at 03:00:20PM +0530, Sai Prakash Ranjan wrote:
> Add IPCC compatible for SC7280 SoC.
> 
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> index 168beeb7e9f7..06419543d235 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> @@ -24,6 +24,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - qcom,sc7280-ipcc
>            - qcom,sm8250-ipcc
>        - const: qcom,ipcc
>  
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
