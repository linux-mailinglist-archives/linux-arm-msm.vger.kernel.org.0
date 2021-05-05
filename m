Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68044374B75
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 May 2021 00:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234542AbhEEWoU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 May 2021 18:44:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234708AbhEEWoL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 May 2021 18:44:11 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2D67C06134E
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 May 2021 15:43:11 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id j20so3097016ilo.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 May 2021 15:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AMvqVLaQgP9SZ02av5Xb9uNNcb2canxCwjD7q3lTwm4=;
        b=DItsHr6eNdQb25/vXeyH9zREbIvrZUZd2DmN0nwXlUBvYvueQJUH5vo2AUb36lBv2L
         fodxXzHol4XTKMES5Q+nABfGcDNUS0hedJ8QE3IkoLltrPODrQ4Io901OdQbyQGpI9TW
         4QcNyUgzSmtnvfkD5gdYrVdq1C9GxbOOpshKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AMvqVLaQgP9SZ02av5Xb9uNNcb2canxCwjD7q3lTwm4=;
        b=MCQU0K0SiEdQEZEbjoWNNdp3goLRiDIRlZFIHt7PxFQx8qwWYMkrBtFvfXk93MpQs1
         PEnNi78vdUoLqNZdoYAgUhIQosIUxfemdQGWd+DpdZZeQ6+6Cip+Z7bIh07Md6w4Wbx3
         SLGlX5qgLKCUW/9+XZ9FPY2Y0u/eN9GDYOZdCxQd37IaCkzE6ojbozCsK9MJscbgyv9T
         7mnuAeU+4cnC2cFpsqQO7QnBq74m9sbclzMI17HF6wiHidBv6JeW4P9mNlBpcuwbWoHR
         5cReC/ztZ5Ud2jdJtB9LNKPRYRXvZ2+rGvARkDoqg5NQj5rwibBmWsaoqao7XMILPkYU
         RanA==
X-Gm-Message-State: AOAM532owUfj7Mzt74mC/LditsKmPLGk4npA00GuaMa3yWleEH131B8T
        IfkM+lJSElRSajZtlI4xbHrJSA==
X-Google-Smtp-Source: ABdhPJw4+aModkOR1CL4tGwxKVaInDrJMi+2xFdAf4BJf3oqi/3HhawuE8nuXEZmg5LgtQDbSH/z6g==
X-Received: by 2002:a92:c566:: with SMTP id b6mr1201152ilj.162.1620254591251;
        Wed, 05 May 2021 15:43:11 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id q1sm374703ilj.4.2021.05.05.15.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 May 2021 15:43:10 -0700 (PDT)
Subject: Re: [PATCH v1 7/7] dt-bindings: net: qcom-ipa: Document
 qcom,msm8998-ipa compatible
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>, elder@kernel.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, davem@davemloft.net,
        kuba@kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, phone-devel@vger.kernel.org
References: <20210211175015.200772-1-angelogioacchino.delregno@somainline.org>
 <20210211175015.200772-8-angelogioacchino.delregno@somainline.org>
From:   Alex Elder <elder@ieee.org>
Message-ID: <9998f8ed-b656-4496-b70d-83a0ee43d646@ieee.org>
Date:   Wed, 5 May 2021 17:43:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210211175015.200772-8-angelogioacchino.delregno@somainline.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/11/21 11:50 AM, AngeloGioacchino Del Regno wrote:
> MSM8998 support has been added: document the new compatible.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

The upstream file affected here now has a slightly different
format.  I will implement this change, credit you for having
first proposed it, and will include a link to your original
message.

					-Alex

> ---
>   Documentation/devicetree/bindings/net/qcom,ipa.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> index b063c6c1077a..9dacd224b606 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> @@ -46,6 +46,7 @@ properties:
>       oneOf:
>         - items:
>             - enum:
> +              - "qcom,msm8998-ipa"
>                 - "qcom,sdm845-ipa"
>                 - "qcom,sc7180-ipa"
>   
> 

