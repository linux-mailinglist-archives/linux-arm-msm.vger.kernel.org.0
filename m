Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5C4F4FEA6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 01:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbiDLXYZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 19:24:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbiDLXYK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 19:24:10 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 441CCCFBBF
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 15:11:00 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id w17-20020a056830111100b005b22c584b93so14282708otq.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 15:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=n/5q6ebK0JYN5I7SWFxTUh10KRu428isEGA+YMY0xN4=;
        b=sWx01FzQ52rz4TlVeDegxVNeDfmRcpQfNXdHuvalmZDAgtXROZkhFaSuKhNQNiEgKI
         WvlFxWz+QV5Kp6fkSTGX852h4t/pl5pqUJqvuJIOqiEc8LSxKkt8rUF1kXEbKFDR1EzA
         8+CdvnE7j9qnxeZC8NukluEOv3a4ZauSz4IIdkSmPZjE27pZPt3Ai6KPB1GJeHtjtnZJ
         f76ruUOfVhARU9cgrFz35mWiNg+SFn+TcMSHqSp5wIbAF7l8BJ4NOEdtAFeVCps1Pig9
         WZvxSzQLJqSs1bqX7Cgtx/9Ck/qm30gPflZI0IzmDZVBgu72PlUQJ227r/wzW9kqbs5v
         kdBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=n/5q6ebK0JYN5I7SWFxTUh10KRu428isEGA+YMY0xN4=;
        b=MHk/oWYSCm4PO5EH5NBmR0qIlpIYCOM5zsZrineN+zx9YEmm4nrePidCrOUqkRdPK0
         UBGc7RiqHnCXUMqEO7XDzaCI7uC2SnjFNYnfQzTjGGJr2638C75gJIadx1P8JEYglAqn
         XssnCqYw+Knkoql/FYmg1D3Fao7w4BV+w8/WP8/N6SvaDv3SbEEh65HUHHIIwswDP2gq
         gAlz72xZcKCyB5e8MLiaZhJSsojF0kp/HumD4D9V5MhBzLwC7x8hb4xLB6Lwta/Q0NWY
         F3yOSdlzkE0OuFEh8fA0P80zL2Yy3EUse4svqza+tf+RuGmWv/S7WL59ZQenWBB0EtcT
         nrew==
X-Gm-Message-State: AOAM532LSIwPQQz/+6Wt1mccB0iJDR9uG09TLOjV3AuqcOET/V+zClrt
        GS18fFp6S+6C/s5k/5ZB9NNxT8pWyK5f4V5/
X-Google-Smtp-Source: ABdhPJzM73G6wmlf7ocdRD76spYGYiPKpTlOlDLnwAhgIxZiQVyrqx/COh0e31S0X6g2LDDnvC7doA==
X-Received: by 2002:a9d:4709:0:b0:5cd:9619:890f with SMTP id a9-20020a9d4709000000b005cd9619890fmr13115445otf.118.1649798943160;
        Tue, 12 Apr 2022 14:29:03 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id 123-20020a4a0181000000b00324a1217e96sm13290162oor.35.2022.04.12.14.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 14:29:02 -0700 (PDT)
Date:   Tue, 12 Apr 2022 14:31:17 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] dmaengine: qcom: gpi: Add support for ee_offset
Message-ID: <YlXvpdmBRVaCVBRo@ripper>
References: <20220406132508.1029348-1-vkoul@kernel.org>
 <20220406132508.1029348-3-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220406132508.1029348-3-vkoul@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 06 Apr 06:25 PDT 2022, Vinod Koul wrote:

> Controller on newer SoCs like SM8450 have registers at at offset. Add
> ee_offset to driver_data and add this compatible for the driver.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/dma/qcom/gpi.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index 3429ceccd13b..0b402d923eae 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -2152,6 +2152,7 @@ static int gpi_probe(struct platform_device *pdev)
>  {
>  	struct gpi_dev *gpi_dev;
>  	unsigned int i;
> +	u32 ee_offset;
>  	int ret;
>  
>  	gpi_dev = devm_kzalloc(&pdev->dev, sizeof(*gpi_dev), GFP_KERNEL);
> @@ -2179,6 +2180,9 @@ static int gpi_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	ee_offset = (uintptr_t)device_get_match_data(gpi_dev->dev);
> +	gpi_dev->ee_base = gpi_dev->ee_base - ee_offset;
> +
>  	gpi_dev->ev_factor = EV_FACTOR;
>  
>  	ret = dma_set_mask(gpi_dev->dev, DMA_BIT_MASK(64));
> @@ -2282,9 +2286,10 @@ static int gpi_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id gpi_of_match[] = {
> -	{ .compatible = "qcom,sdm845-gpi-dma" },
> -	{ .compatible = "qcom,sm8150-gpi-dma" },
> -	{ .compatible = "qcom,sm8250-gpi-dma" },
> +	{ .compatible = "qcom,sdm845-gpi-dma", .data = (void *)0x0 },
> +	{ .compatible = "qcom,sm8150-gpi-dma", .data = (void *)0x0 },
> +	{ .compatible = "qcom,sm8250-gpi-dma", .data = (void *)0x0 },
> +	{ .compatible = "qcom,sm8450-gpi-dma", .data = (void *)0x10000 },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, gpi_of_match);
> -- 
> 2.34.1
> 
