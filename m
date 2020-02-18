Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A90F162F63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 20:07:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgBRTHf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 14:07:35 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46007 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbgBRTHf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 14:07:35 -0500
Received: by mail-pl1-f194.google.com with SMTP id b22so8440087pls.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2020 11:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XDlxGgCpGeqU3KzfKq+0G+pODQzyu67LnVcRDv+D+D4=;
        b=bBlb7kK0umzlqU+tMcH3s28HrHzKVOWGYgR0f+WFk8H08TYaiaZTu70twpujC0wnlL
         jvPAxB/i9TZ8TfXzYS00HfBLRn4AaFjHwPpED0345d9rY2hlt8VFBYtOMONkmQRbfwLa
         SfRGM16Ck3w2GMG+0yDfUWHKyfaxFrHzkq4HA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XDlxGgCpGeqU3KzfKq+0G+pODQzyu67LnVcRDv+D+D4=;
        b=oZ7a6OJY5oXKENAeaCLWqFpi3rtTksrFzy/hDppt3p05sZS1mKXbzlI9uDQyiBA3z4
         jQMgX8tmqBZWjILTa8RzOoRNgYTnYBtXU032W9NgPIjn4VjAsBR/uapPvHh4GNaDqr7G
         HM9lfKPsDna7AxaQRvKWoh3coGR6GS6fprE7BhtGdVWZvyNfEpRUyb9VERBtZFhnI731
         Wiz6GPtmXC06PiUymYqeYckyu21HcoMIEfg17HZKi6CRfqZwbRsj825+vjveI1lxFQTq
         b+t7jBXpW+fp6UWQWb+KDutEekwlQ7rCmro7NaDYJmwkO2Fde0MeKv6N8nJUcueacGuR
         rhMQ==
X-Gm-Message-State: APjAAAU5E+65cPfgHeYawrYt4R2F4u5P00FXYCnfQsEGqRbHWhKlUe2Q
        0i1qYrqnELBgBTL5Tmt4V649ew==
X-Google-Smtp-Source: APXvYqzQ9M1KsgU04ibpPhVZLv0ZY49qRY006V1Xcr4FsYN69DcQUVER/9RLVtPWkxP6bYsZHXAfTA==
X-Received: by 2002:a17:902:b718:: with SMTP id d24mr22854885pls.80.1582052854867;
        Tue, 18 Feb 2020 11:07:34 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id q25sm5175786pfg.41.2020.02.18.11.07.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2020 11:07:33 -0800 (PST)
Date:   Tue, 18 Feb 2020 11:07:31 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     robh+dt@kernel.org, agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        rojay@codeaurora.org, skakit@codeaurora.org, swboyd@chromium.org
Subject: Re: [PATCH V4 3/3] dt-bindings: geni-se: Add binding for UART pin
 swap
Message-ID: <20200218190731.GC15781@google.com>
References: <1581932212-19469-1-git-send-email-akashast@codeaurora.org>
 <1581932212-19469-4-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1581932212-19469-4-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Akash,

I didn't see a patch that implements the binding, did you post it?


On Mon, Feb 17, 2020 at 03:06:52PM +0530, Akash Asthana wrote:
> Add documentation to support RX/TX/CTS/RTS pin swap in HW.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
> index 11530df..7e4b9af 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
> @@ -165,6 +165,15 @@ patternProperties:
>            - description: UART core irq
>            - description: Wakeup irq (RX GPIO)
>  
> +      rx-tx-swap:
> +        description: RX and TX pins are swap.

s/swap/swapped/

> +
> +      cts-rts-swap:
> +        description: CTS and RTS pins are swap.

s/swap/swapped/

> +
> +      rx-tx-cts-rts-swap:
> +        description: RX-TX and CTS-RTS both pairs are swap.

I don't think this option adds much value, if both pairs are swapped
the above two properties can be set.

> +
>      required:
>        - compatible
>        - interrupts
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
