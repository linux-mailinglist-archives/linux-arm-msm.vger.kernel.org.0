Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9EBE54A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2019 21:50:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727630AbfJYTul (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Oct 2019 15:50:41 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41049 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbfJYTul (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Oct 2019 15:50:41 -0400
Received: by mail-ot1-f66.google.com with SMTP id 94so2848129oty.8;
        Fri, 25 Oct 2019 12:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qVkVUWF6C75bWwuL/Q+bcf4h2Yae+1F4CxhdxnJ2xzM=;
        b=OHyJaMyQC1KcB9Zh09xEy2dNYpbXJ8Sgj9+NuUvmaPZKBLm387fCJXGfGdMS9Mi+Yf
         towNXWJFgsN55tpj8RRWqjQH48T09wfhBp6u47faDCQ/e2FMCjboaLomgYx4nHwc4V1x
         pipUaC5pv7ef59Pxr3Crk/MhnuNHzmnOlXN1o572kE0mfTA6FoefHNpUvwEpQLkxqBFm
         H1IfM4ImwJTzGvnOduaIJWhZRNLjcf6KRuqhRJt7T7LFWU7XpQE19gMGmGb5VmZyc0oF
         hXNP9LKclB+b7IGa/COReiyKCLo8dnDVyLUkdl+Aq5hB+aiUZHRgOmAmC5sPgIRO8HtD
         g8UQ==
X-Gm-Message-State: APjAAAVvXtrTr4CGOjZVc1EqwIB46ts3zqNdY3ksD//jpLKspYAfGiZg
        lPNb94fXYmndALmhM9aM/w==
X-Google-Smtp-Source: APXvYqyZxCXgZgW9z01wZaLugEiIu1pfXmUjfVQdm3VcHS2Je1gjxEGandeuoMJ/1SfA4kIGUQUTSA==
X-Received: by 2002:a9d:784e:: with SMTP id c14mr4262465otm.317.1572033040446;
        Fri, 25 Oct 2019 12:50:40 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b4sm813465oiy.30.2019.10.25.12.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 12:50:39 -0700 (PDT)
Date:   Fri, 25 Oct 2019 14:50:39 -0500
From:   Rob Herring <robh@kernel.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v3 01/11] dt-bindings: qcom: Add SC7180 bindings
Message-ID: <20191025195039.GA21665@bogus>
References: <20191023090219.15603-1-rnayak@codeaurora.org>
 <20191023090219.15603-2-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191023090219.15603-2-rnayak@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 23, 2019 at 02:32:09PM +0530, Rajendra Nayak wrote:
> Add a SoC string 'sc7180' for the qualcomm SC7180 SoC.
> Also add a new board type 'idp'
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index e39d8f02e33c..0a60ea051541 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -36,6 +36,7 @@ description: |
>    	mdm9615
>    	ipq8074
>    	sdm845
> +  	sc7180

Where's the schema?

>  
>    The 'board' element must be one of the following strings:
>  
> @@ -46,6 +47,7 @@ description: |
>    	sbc
>    	hk01
>    	qrd
> +  	idp
>  
>    The 'soc_version' and 'board_version' elements take the form of v<Major>.<Minor>
>    where the minor number may be omitted when it's zero, i.e.  v1.0 is the same
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
