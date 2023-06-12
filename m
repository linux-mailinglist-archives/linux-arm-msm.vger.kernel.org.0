Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3278F72CE7F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 20:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236030AbjFLSef (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 14:34:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237360AbjFLSeb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 14:34:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8467F1991
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 11:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686594769;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qSuO83O2GJF69D20JvszqVCusWGni7xZeOtz58f06pw=;
        b=P1Gzm0BvCPN7KWcYUorr5D3fvJVkAGDa9p/j/PG+2h5kIVuKTNofQyGirvEUugLLMBzIMD
        dKh5l5KPdtRspWNPJcuP/Lw6dP5PLsH+bj8a72EN8z6l+yTayTnkbnh7L2whfUeMxLP5Fd
        BJOSzaB7QMsxJJpg7uuyEZEfS6GH2bY=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-dkDx_vBYMR-Adzxta0cBuA-1; Mon, 12 Jun 2023 14:32:47 -0400
X-MC-Unique: dkDx_vBYMR-Adzxta0cBuA-1
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-6b29bbec42aso2283469a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 11:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686594767; x=1689186767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSuO83O2GJF69D20JvszqVCusWGni7xZeOtz58f06pw=;
        b=OHDMvP+mQcryCD6a+xM6xdrnNbkYGf8e6KUDkIMSs1K/6y2pIJwraSTn99HrjB1sWq
         MwOaD94cC/w4gcbc1JmXVrzS+rZwJfB/CnG6SY0ltAqjQ+N8+UVwfON+rSFCSMwdZsGn
         n4kX/N4ptgWIWIPo3sG1ZJH0/TSSLnEb1HjRBN/okZ+4NKaQ0WI0tZbwych0DFdgEOsK
         sncIbwZyIqMUUgLTPlFq0/EvpyD994o18LHdSirGd6yT4LqbFG5lzTVsJp/+jo3bx3Ne
         w8qukeyZ4EdkHJRoRJXjJSqvOsBFGrtvJakbvmpcmci6Du2smA8H54dsVR6N55o4PgVT
         lVzA==
X-Gm-Message-State: AC+VfDxJMyPwWYNUfk7YJu241TLfGrGgusmLRCSbVZIXhswjjiXJGwQh
        2rVynE1TqI4yJ+VWB0IPHM7Sm8g0ItE6VwrgJFPW1k8+envGIeTzdFf0wRspOvi0Z7fP+1WB+T/
        zpSkEblkSSOXE4B3i98PCzBdleQ==
X-Received: by 2002:a05:6830:92:b0:6a5:dd70:38cd with SMTP id a18-20020a056830009200b006a5dd7038cdmr6651281oto.2.1686594767177;
        Mon, 12 Jun 2023 11:32:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5HntANaGm+HkD+UPQVxKZBUJkVk1zEqMvLrahjA8N+vIH05i26ddN13SkrcVSLU5flZVuT2A==
X-Received: by 2002:a05:6830:92:b0:6a5:dd70:38cd with SMTP id a18-20020a056830009200b006a5dd7038cdmr6651260oto.2.1686594766931;
        Mon, 12 Jun 2023 11:32:46 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::45])
        by smtp.gmail.com with ESMTPSA id w14-20020a056830060e00b006af9d8af435sm4138880oti.50.2023.06.12.11.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 11:32:46 -0700 (PDT)
Date:   Mon, 12 Jun 2023 13:32:43 -0500
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
Subject: Re: [PATCH 06/26] net: stmmac: dwmac-qcom-ethqos: rename a label in
 probe()
Message-ID: <20230612183243.5rkphsaqofi42bgc@halaney-x13s>
References: <20230612092355.87937-1-brgl@bgdev.pl>
 <20230612092355.87937-7-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612092355.87937-7-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 12, 2023 at 11:23:35AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The err_mem label's name is unclear. It actually should be reached on
> any error after stmmac_probe_config_dt() succeeds. Name it after the
> cleanup action that needs to be called before exiting.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 2da0738eed24..16e856861558 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -615,14 +615,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  	ethqos = devm_kzalloc(&pdev->dev, sizeof(*ethqos), GFP_KERNEL);
>  	if (!ethqos) {
>  		ret = -ENOMEM;
> -		goto err_mem;
> +		goto out_config_dt;
>  	}
>  
>  	ethqos->pdev = pdev;
>  	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
>  	if (IS_ERR(ethqos->rgmii_base)) {
>  		ret = PTR_ERR(ethqos->rgmii_base);
> -		goto err_mem;
> +		goto out_config_dt;
>  	}
>  
>  	data = of_device_get_match_data(&pdev->dev);
> @@ -634,16 +634,16 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  	ethqos->rgmii_clk = devm_clk_get(&pdev->dev, "rgmii");
>  	if (IS_ERR(ethqos->rgmii_clk)) {
>  		ret = PTR_ERR(ethqos->rgmii_clk);
> -		goto err_mem;
> +		goto out_config_dt;
>  	}
>  
>  	ret = ethqos_clks_config(ethqos, true);
>  	if (ret)
> -		goto err_mem;
> +		goto out_config_dt;
>  
>  	ret = devm_add_action_or_reset(&pdev->dev, ethqos_clks_disable, ethqos);
>  	if (ret)
> -		goto err_mem;
> +		goto out_config_dt;
>  
>  	ethqos->speed = SPEED_1000;
>  	ethqos_update_rgmii_clk(ethqos, SPEED_1000);
> @@ -662,11 +662,11 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  
>  	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
>  	if (ret)
> -		goto err_mem;
> +		goto out_config_dt;
>  
>  	return ret;
>  
> -err_mem:
> +out_config_dt:
>  	stmmac_remove_config_dt(pdev, plat_dat);
>  
>  	return ret;
> -- 
> 2.39.2
> 

