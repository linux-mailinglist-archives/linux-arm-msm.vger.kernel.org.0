Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E87C57490F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 11:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238302AbiGNJb3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 05:31:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238303AbiGNJbC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 05:31:02 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45D952C666
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:30:41 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id bu42so1906705lfb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=SHM451NPbgKsmNQ8PtztjljKT0jHIg5pN+JDdK2LOGc=;
        b=JGBVhHIf2Ztn+/rTU20oGHT3tRc+uVB74gZZOjFy/Oq4+pilCf+trBlX2JYNeOWhfy
         HIsDDNEGlB/opLqgZwih4kcG9bVjpkXRKAQMQo/BBZnOL49xGsEEhHAtesqMWaf0sP2H
         4KM1n3403NMikdrDY5LvSOgXPvH+qMXNROXjvbBpy1Gpeo8Aq5tGC8DGkWwRcGuG4phH
         DNCHnWnaFiBGakxRgtEa6Omf+pisz8qLAJGenYcJR2QwM4uPnQGsciqVkCrq41L4sN0V
         mhm1vQhnA1idS6q7gUEmq7sWUrSZ4QPUs9jYOcvwfsFW8KQjI4mjQRqN8oBhgHG4jyDP
         9Pzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=SHM451NPbgKsmNQ8PtztjljKT0jHIg5pN+JDdK2LOGc=;
        b=vxbCjtZ7Bvp5a1E49zj6WE0Yfedxfm+G/mVIkR1N85g6U9s1RE3G6trDx6FBhrK9na
         XWU5kEkh6T2C4McbuC8aTzfAlyI8h/priDDNRZPFgBu6LkttocVASzTbLA9SeVJpZKlp
         5cJ4QRMYYAb8fDdluQ/ywzHDueo39/07SQQXwuR6XUfOb5IQZjQv8ozad5ShRBTDqrfr
         AAu8KipTkKP04UmYRFdgw84VenqpQ6kLO+dFjatfyDdlEDPDc1etXjGFXk3h4lhZxN3i
         66gt31KbMT8Srsgg74WOcc9Ebxkre19N98Id8nDXY0QVuXePuQ7Knmr5X5RIhJZmNcXI
         AGUw==
X-Gm-Message-State: AJIora+Fz1cTY0g3Fgm8DzuduolGOqgbzxz6jMLOr9wLWfy+kwh4hlgE
        rSV00ZVusSyJegzYYMr78u8W8A==
X-Google-Smtp-Source: AGRyM1vZbPmXWd/Rg+BwcDzMyac2id4EVE5D5arZiQqoCdYui/t3G6LCIBqQ6q4eve6FLfeArgfxkA==
X-Received: by 2002:a05:6512:22c8:b0:488:e69b:9311 with SMTP id g8-20020a05651222c800b00488e69b9311mr4450974lfu.564.1657791039566;
        Thu, 14 Jul 2022 02:30:39 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id k12-20020ac257cc000000b004811bf4999csm257295lfo.290.2022.07.14.02.30.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 02:30:39 -0700 (PDT)
Message-ID: <a2706253-41c1-84fa-2e17-053759888214@linaro.org>
Date:   Thu, 14 Jul 2022 11:30:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 28/30] phy: qcom-qmp-pcie-msm8996: drop pipe clock lane
 suffix
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220707134725.3512-1-johan+linaro@kernel.org>
 <20220707134725.3512-29-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220707134725.3512-29-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/07/2022 15:47, Johan Hovold wrote:
> The pipe clock is defined in the "lane" node so there's no need to keep
> adding a redundant lane-number suffix to the clock name.
> 
> Update driver to support the new binding where the pipe clock name has
> been deprecated by instead requesting the clock by index.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
> index 812d14afb5ec..af2f14a53b38 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
> @@ -872,7 +872,6 @@ int qcom_qmp_phy_pcie_msm8996_create(struct device *dev, struct device_node *np,
>  	struct qcom_qmp *qmp = dev_get_drvdata(dev);
>  	struct phy *generic_phy;
>  	struct qmp_phy *qphy;
> -	char prop_name[MAX_PROP_NAME];

Wait, it looks like your patchset is not bisectable. Be sure each commit
compiles cleanly.

Best regards,
Krzysztof
