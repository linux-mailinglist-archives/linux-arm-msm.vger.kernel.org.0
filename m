Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD6F4131876
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 20:16:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbgAFTPy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 14:15:54 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46021 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726739AbgAFTPx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 14:15:53 -0500
Received: by mail-pg1-f194.google.com with SMTP id b9so27281136pgk.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2020 11:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ebYvaopqdPQE4iTnO1QzF+XjovTSGvUJKDf1PFA/Ysc=;
        b=Pm7zqWzCezSNB83fb8CFkcOFMzH9M9mVXfza3NE3Afqi0/3y5dQQmFsVZCldUllf8A
         4WN0ip3LDbI7gPMFIbe30Ur6dUWDgkLjCYAscilpgsGJ/E9KcoLmUVbcFn3G993zDsJP
         e4zonurP3cAPpwUgnuDER6YeaO9btWzuZOVv+oZYzMPXaPykI/xqm/rycO8S6lPPWlyt
         wA4C2IjQSfvyC5SZ2YqaiSf3OrVCN2BBW9TDKH6gEUKME27aSBv6rjFkVFcWA5hYtErn
         m5wSxj7J3z6CP9BJnyzPcI/XwrCJ3Hm+T+mNT57BfS6jSEoWs3IEO8BGMhXDDphqaeXC
         ZQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ebYvaopqdPQE4iTnO1QzF+XjovTSGvUJKDf1PFA/Ysc=;
        b=LXeUrhZO1q/auMU2dIT4LDvThSN4WFctles0rB1zgbSNzHIbZtTkhYsZLcgHwKTsc5
         w/RLixI4+gmrkhsWtdis7tPjHqJcJ4o3vvfoQt3XZDumWHOMsJ7K2J5USK361Ud1330q
         NEIKSZ7JJKchsUg5Ooteh4VX16NVxKMBCXOn/YnyGTAh5pMXJhGFU/fsl6K+BYqLnIJi
         b9y6Ugc2clpSeklYHNSqXkIk5R1I06yweMjgNSxYAdnKPHvDVap4WOg9ormMCt0jGgHA
         ib2YJF2FTs6dERUfE8MqzIF9hDwpgSataOP/2LMq/L/w1APQVr70myi3eH+Qr4AG9DZP
         f1VA==
X-Gm-Message-State: APjAAAWXLlC11WUURZ/HiECGy+y20p8d9i+vz1bEHQUGmB/fO6gwSxgy
        wRA9Q2iKqYLVUNbkXB9qMg6hTw==
X-Google-Smtp-Source: APXvYqyTrMUuggjcjCVjWZThwMhUiBXsZlVSJjWQLamuL2PeE7k0ysia04/f3gpOxFjmjbjAKfnkBg==
X-Received: by 2002:a63:fe50:: with SMTP id x16mr93985603pgj.31.1578338153208;
        Mon, 06 Jan 2020 11:15:53 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k9sm25088975pjo.19.2020.01.06.11.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 11:15:52 -0800 (PST)
Date:   Mon, 6 Jan 2020 11:15:50 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajeshwari <rkambl@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        sanm@codeaurora.org, sivaa@codeaurora.org, manaf@codeaurora.org
Subject: Re: [PATCH v2 2/2] dt-bindings: thermal: tsens: Add configuration in
 yaml
Message-ID: <20200106191550.GW3755841@builder>
References: <1578317369-16045-1-git-send-email-rkambl@codeaurora.org>
 <1578317369-16045-3-git-send-email-rkambl@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578317369-16045-3-git-send-email-rkambl@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 06 Jan 05:29 PST 2020, Rajeshwari wrote:

> Added configuration in dt-bindings for SC7180.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Rajeshwari <rkambl@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index eef13b9..c0ed030 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -38,6 +38,7 @@ properties:
>            - enum:
>                - qcom,msm8996-tsens
>                - qcom,msm8998-tsens
> +              - qcom,sc7180-tsens
>                - qcom,sdm845-tsens
>            - const: qcom,tsens-v2
>  
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
