Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2EDA222F52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jul 2020 01:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbgGPXpR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 19:45:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbgGPXpN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 19:45:13 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A76CAC08C5CE
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 16:45:13 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id t6so5740779pgq.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 16:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7HMps4EVe5QouaH170Ni6vFF1hKv4OVRQ58+hvK869s=;
        b=a5rn2ThYvk32OHonppZRgr0gWChDuOIPVBbDLQ1uQhEBEWduMAs8sxC7Wtn5610Kwf
         BciU3PiM4HVbTqEi+YdL05OTqTb7BhYaltbnoIY1SK98AUoRxrJlxTW7LgrHy8yaaFzg
         wHc8SukhPm1z3uRr1c6PYMn6oqqCyyOOZztVtJfyLTr/Rw9rWqSwpZ1q30JamSf1DvS4
         cK+9L1/ntRGxVe4zJRnol1izTRhavFA1NySWDPzwZ39usxUlrRmIR0YXRyolCBGhoqhD
         myQZ6X+dn2KLMSc73YoDPqwaaCFslzde3FXdY5+5qBfVbX8WlFGpZY3zk9f4aIRfvls5
         3E3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7HMps4EVe5QouaH170Ni6vFF1hKv4OVRQ58+hvK869s=;
        b=rABo9pNs6TLZ1bDL8GiEW1Veu9D44XJmU11JsIL3yhXkHQs+KMnX9+2dAkzMsm+6KY
         sqZgqiDkhoV5CTiGTvdxlCnfTjcqlxktkfI6cesT09kv/lSpQ5SfmIaUM7BKuyEbEP3H
         dUmjdaSqDyX7uiv+bpu8bG0jTuJ2Jntgmusl2PSqD85m9PfbQSi5OvBnJ0cJ7QMhUMlK
         GMMwxQhRu5ALBgu2Rx5U8k9876gsDBBCNsrQD2AHV3+FjFsI4COxk6swcTKvtFVcrEQD
         HNOHNSwcCGCfHp9Y2N9x/uHpEEpg+EFHtZi7jOgN2crL5gRd52Gzt24Z8sL7DuL5uD6q
         93PA==
X-Gm-Message-State: AOAM533Oos/a+DdF5vQ10E7rzQo59EK+bSwV54HZ+PTXXRtmtIcgMSP4
        jlUshjgeTDV7dDVWUkTf5NQBgg==
X-Google-Smtp-Source: ABdhPJwmfESAulSis3weUqV/31ICtbnWJSbR9MqBo6uiZUCmpXjfWM5F052GbpZ/gabM+1BDHHe16A==
X-Received: by 2002:a65:4786:: with SMTP id e6mr6275744pgs.258.1594943113069;
        Thu, 16 Jul 2020 16:45:13 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o8sm5752304pgb.23.2020.07.16.16.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 16:45:12 -0700 (PDT)
Date:   Thu, 16 Jul 2020 16:43:10 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     stanimir.varbanov@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org
Subject: Re: [PATCH v2 1/4] dt-bindings: media: venus: Add an optional power
 domain for perf voting
Message-ID: <20200716234310.GH1218486@builder.lan>
References: <1594878139-3402-1-git-send-email-rnayak@codeaurora.org>
 <1594878139-3402-2-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594878139-3402-2-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 15 Jul 22:42 PDT 2020, Rajendra Nayak wrote:

> Add an optional power domain which when specified can be used for
> setting the performance state of Venus.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
> This is a resend of https://lore.kernel.org/patchwork/patch/1241077/
> 
>  Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml    | 6 +++++-
>  Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml | 6 +++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> index 55f2d67..1e8675b 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> @@ -25,12 +25,16 @@ properties:
>      maxItems: 1
>  
>    power-domains:
> -    maxItems: 2
> +    minItems: 2
> +    maxItems: 3
>  
>    power-domain-names:
> +    minItems: 2
> +    maxItems: 3
>      items:
>        - const: venus
>        - const: vcodec0
> +      - const: opp-pd

In line with Rob's question, the "opp power-domain" seems like a
software construct, wouldn't this be better named e.g. "cx"?

Regards,
Bjorn

>  
>    clocks:
>      maxItems: 5
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
> index 157dff8..437286d 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
> @@ -25,13 +25,17 @@ properties:
>      maxItems: 1
>  
>    power-domains:
> -    maxItems: 3
> +    minItems: 3
> +    maxItems: 4
>  
>    power-domain-names:
> +    minItems: 3
> +    maxItems: 4
>      items:
>        - const: venus
>        - const: vcodec0
>        - const: vcodec1
> +      - const: opp-pd
>  
>    clocks:
>      maxItems: 7
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
