Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0078127170
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 00:28:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbfLSX2y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 18:28:54 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:39921 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbfLSX2y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 18:28:54 -0500
Received: by mail-ot1-f66.google.com with SMTP id 77so9299218oty.6;
        Thu, 19 Dec 2019 15:28:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dZc4CLv8kZIr/vJ/6M0jIfH8aJfjaIHQ9haPA3itFeA=;
        b=PemubiL8E3Ae7YrNi9miMAleUyoov3fZb3/+NAtL8+cYD7yzY1BASoK3L51NNK98Bh
         Re3J6RNAKwF5YFnvGjvWkCP/oSPRgFTBAtFCreh/imUKP5316YwF5sgV8A+aUZ6wUhd+
         30e/fvEQtYLLu/jy+BDXjxkHx8Gmpbx3dvHNjUIWWE+wWGDxy0Jvhgv5xPTLYY07iHNf
         PhYutRZhqTn3jK1p+/iE7XtNf8o1u5WQvkM0ZAlQz6Gba2fTBGuZgnoBL87EWmtDF8Wg
         0tin2jxOWXFbrr7edoSd7vZK3MW/ewJyLHLZQG5JeTkDbHdybzE2kiwzYfdGHXl6cPK9
         lUew==
X-Gm-Message-State: APjAAAVKrs7n5/3zAR9jjKp/KWZ/hqtD7r/nlWVTUPQhCQcPDN8vzU3k
        p9toa1vn0Rlv+rj3WLTudQ==
X-Google-Smtp-Source: APXvYqz3vydD7qxl9vmrh9gJ7OwGh6nFWh3nanGC5T8eoWxhRvI9WO7VGvCC5pB/6mq8ImkuJ3zjFQ==
X-Received: by 2002:a9d:7552:: with SMTP id b18mr10985654otl.20.1576798133884;
        Thu, 19 Dec 2019 15:28:53 -0800 (PST)
Received: from localhost (ip-184-205-174-147.ftwttx.spcsdns.net. [184.205.174.147])
        by smtp.gmail.com with ESMTPSA id 97sm2696476otx.29.2019.12.19.15.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 15:28:52 -0800 (PST)
Date:   Thu, 19 Dec 2019 17:28:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: watchdog: Add compatible for QCS404,
 SC7180, SDM845, SM8150
Message-ID: <20191219232842.GB22811@bogus>
References: <cover.1576211720.git.saiprakash.ranjan@codeaurora.org>
 <3f871ae3818b46423430074689e33bc34b28aa1c.1576211720.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f871ae3818b46423430074689e33bc34b28aa1c.1576211720.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Dec 13, 2019 at 10:23:19AM +0530, Sai Prakash Ranjan wrote:
> Add missing compatible for watchdog timer on QCS404,
> SC7180, SDM845 and SM8150 SoCs.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  .../devicetree/bindings/watchdog/qcom-wdt.yaml       | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> index 4a42f4261322..ec25ce1c9e2e 100644
> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> @@ -12,6 +12,18 @@ maintainers:
>  properties:
>    compatible:
>      oneOf:
> +      - items:
> +          - const: qcom,apss-wdt-sc7180
> +          - const: qcom,kpss-wdt
> +      - items:
> +          - const: qcom,apss-wdt-sdm845
> +          - const: qcom,kpss-wdt
> +      - items:
> +          - const: qcom,apss-wdt-sm8150
> +          - const: qcom,kpss-wdt
> +      - items:
> +          - const: qcom,apss-wdt-qcs404
> +          - const: qcom,kpss-wdt

This can be one entry:

- items:
    - enum:
        - ...
    - const: qcom,kpss-wdt

>        - const: qcom,kpss-timer
>        - const: qcom,kpss-wdt
>        - const: qcom,kpss-wdt-apq8064
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
