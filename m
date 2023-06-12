Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7514972CE86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 20:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233661AbjFLSfi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 14:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238378AbjFLSfS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 14:35:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F24010E4
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 11:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686594879;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fA7PgHsHXUvTzj6r/c+oFo9WuyCUMyzAZAoI7rpa/bU=;
        b=czfQgql7+E/IrGkbFmngJjH/Wp37kHx7NdRSoUcIIWbVch7CimcLJW5iBpS1xLo7u6WrVV
        dE61Py53yxqCMFSsqLjxwC2BqYn2spB2UYdbpQrEuyfZEZLNnP5eOV9rM7B9lWLuoOgMA4
        KYpzH7VeBl2/j7Ul5Hk5Oi22UkYknSY=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-2mueMIWVNMu15owzAhmxNw-1; Mon, 12 Jun 2023 14:34:37 -0400
X-MC-Unique: 2mueMIWVNMu15owzAhmxNw-1
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6b2c266f5b9so3207533a34.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 11:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686594877; x=1689186877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fA7PgHsHXUvTzj6r/c+oFo9WuyCUMyzAZAoI7rpa/bU=;
        b=fOzjTmKLme1FfmkAPTA75bhK1GeuDRtzjY5nsQw5ihVl2jGrJzdVXizUdZop9J/mC+
         duYN6FV2jZqLFoG3xQhvDOsw9nji0EpSIGKUOeblFlbQTEwEx5LASKX7WNEtX8Vuaii5
         6NZTL9vj/uL+UudIXaXfZN60+Bo+xtsbBaHpqUzg9a+alL/ywnPVtXNxKnlc2x+ZtLKR
         UoKtK9JZbCnb4Lhz4ZefZT4RY9XXNvF5nCQ3Vs9ekpxxiMTkyeu2Cu1ENCBdDTfih6W1
         Edp/I0XQrt6rBKYooWtbAWcIAz13kr4GdO9wBUbx30Tbgx1oynMWvqKR6sTwF5drwbCk
         H5Hg==
X-Gm-Message-State: AC+VfDzk9X2u+M2UIqE6/w5Vohz0qRXyU4J/Ci1jhVW02vUIqEeIO0Ox
        xEQWPjwcJHgAAW1MrkexR3q7QHZ6wgl6qoXbKG2ma4qI8PHPitcJCvNoC8RVW9p7Jy5Rk+cJ5c0
        wdSgvgU2AC8ukyoE/4HHc5eH/8g==
X-Received: by 2002:a9d:6299:0:b0:6b2:b82c:1418 with SMTP id x25-20020a9d6299000000b006b2b82c1418mr6159662otk.9.1686594876853;
        Mon, 12 Jun 2023 11:34:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ71QwPMhZSycXjuAG8mCHe8g88dFSFJqGDZsnw2ZprTbOlJNax+lvJcUSmy8K0z+ff8r52HsQ==
X-Received: by 2002:a9d:6299:0:b0:6b2:b82c:1418 with SMTP id x25-20020a9d6299000000b006b2b82c1418mr6159634otk.9.1686594876618;
        Mon, 12 Jun 2023 11:34:36 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::45])
        by smtp.gmail.com with ESMTPSA id q21-20020a056830019500b006b2a31ec95dsm4137128ota.65.2023.06.12.11.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 11:34:36 -0700 (PDT)
Date:   Mon, 12 Jun 2023 13:34:33 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 07/26] net: stmmac: dwmac-qcom-ethqos: tweak the order of
 local variables
Message-ID: <20230612183433.ii23wc2yie5n25vs@halaney-x13s>
References: <20230612092355.87937-1-brgl@bgdev.pl>
 <20230612092355.87937-8-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612092355.87937-8-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 12, 2023 at 11:23:36AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Make sure we follow the reverse-xmas tree convention.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 16e856861558..28d2514a8795 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -594,9 +594,9 @@ static void ethqos_clks_disable(void *data)
>  static int qcom_ethqos_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
> +	const struct ethqos_emac_driver_data *data;
>  	struct plat_stmmacenet_data *plat_dat;
>  	struct stmmac_resources stmmac_res;
> -	const struct ethqos_emac_driver_data *data;
>  	struct qcom_ethqos *ethqos;
>  	int ret;
>  
> -- 
> 2.39.2
> 

