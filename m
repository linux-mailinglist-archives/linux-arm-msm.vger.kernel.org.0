Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 316AB435DF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 11:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbhJUJb4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 05:31:56 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:39851 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231308AbhJUJb4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 05:31:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634808580; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=PWbkCPMO+PW1QVTah0vArwReeYKjcKVCzAZnQ2H4qO4=; b=l6fWHid7jzyndV75kdym17z5iIgEyvhaChYUtGE+oIebQ2xQfh2d2XesRGOV427b9Jzg0Apz
 XMIAxJeJ0S7qn19qEtnW3n1l73W9TyM9IQAoV4drZ2C4mLa7wl/IcXcrNE8jqoFf3Ir0vZ7H
 4YMP9TuGqiRWk9+N9ev6s4fsnLU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 61713304321f240051e06fa2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 21 Oct 2021 09:29:40
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2D3ABC4361A; Thu, 21 Oct 2021 09:29:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [27.61.145.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DDA5FC4360C;
        Thu, 21 Oct 2021 09:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org DDA5FC4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH 1/3] dt-bindings: soc: qcom: stats: Document
 qcom,rpm-legacy-stats
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20211018110803.32777-1-stephan@gerhold.net>
 <20211018110803.32777-2-stephan@gerhold.net>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <b7254fba-3064-4b72-e9df-1b799d404769@codeaurora.org>
Date:   Thu, 21 Oct 2021 14:59:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211018110803.32777-2-stephan@gerhold.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Reviewed-by: Maulik Shah <mkshah@codeaurora.org>

Thanks,
Maulik

On 10/18/2021 4:38 PM, Stephan Gerhold wrote:
> Document an additional qcom,rpm-legacy-stats compatible that can be
> used similarly to qcom,rpm-stats for older RPM firmware versions that
> have the sleep stats at a fixed offset rather than a dynamic one.
> 
> Cc: Maulik Shah <mkshah@codeaurora.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>   Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
> index 99dff7d73b7e..566678d02008 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
> @@ -21,6 +21,8 @@ properties:
>       enum:
>         - qcom,rpmh-stats
>         - qcom,rpm-stats
> +      # For older RPM firmware versions with fixed offset for the sleep stats
> +      - qcom,rpm-legacy-stats
>   
>     reg:
>       maxItems: 1
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member of Code Aurora Forum, hosted by The Linux Foundation
