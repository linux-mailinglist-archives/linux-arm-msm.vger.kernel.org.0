Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 325935BE7A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 15:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231368AbiITNwV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 09:52:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231444AbiITNvs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 09:51:48 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B530481FC
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 06:51:46 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id b5so4411100wrr.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 06:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=x+vE1v09uZ5F67MZ186nd9KS7D/kqnY9dzU3Sc2cm8c=;
        b=XhvE8ANh8B5Dww2Wv/e97EJu2OELPLFbfmWOsT+jJ0iTHn7CaxSCCXpND4sW1wN9NX
         +w/69DK8HL64oTUwlpj7gV1/li8qu2EBdKlgzxHLZz2KnJYzdSDi8NEqJqfyho8Nlm4p
         uU9//viVQGl0ibAx9ZD6gJbZ+SXDNph5Y6svLHUMD3RUEImEiDe37SYuoeDaOuERd663
         jiLVYkV485fK50EA60rcZ0aHHAhDBTsVZJEB3J0Z6Bq1XcocEuhfowgrHp3qIthpye64
         ONPtAul7nePYiXfQUrzNwkSnqS00DwO9qoSxryRrF/pT3cf7G8ch6u+ISP1Or7A6vnG5
         lK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=x+vE1v09uZ5F67MZ186nd9KS7D/kqnY9dzU3Sc2cm8c=;
        b=W4dOVq+ra1TE7m2p7z+pzrgJYPjAOX5hZ79at/tOf1y+BG0bcDIXNs6Fq/JQrQmOk2
         9/Ya3HQqXtzlTROZQZUdEGOLxriAbrFAfqXB0Nm5/zWpFiU1LmBQ4BjmkKO8DPELEVae
         sRFx3uW8Ru8+3GcA7G2ssuM/p1IvJkMzXyzuQuS6No9Rg85dqBLGKZLLRgrTHy2gTP3c
         vwRwzVi1cODLYDsk3ILBjOf1riwFlxTS8xHXp302vRDp3SscAgBul4Ber/rCXhwX80sV
         LE8dpIKLcI5IHcWnGmWQzfSTjr253ct+WIjkKvcdIv9KLciXgLZCap229ibSsyEjcXS6
         prow==
X-Gm-Message-State: ACrzQf0IWm/zpjTnpJfk2AbbnbO9aM+ufF1Vfpj1/o9rUxbDWB2GCbGP
        Lp622gfYbxS9BmfZ+0kdMHlx1Q==
X-Google-Smtp-Source: AMsMyM4ZwPKKzmxB4U5B0iMQagpKk6Q0q0gf3Yiug7TATvkPxgEFQhhMD9HWIcyDrksD3KUBw3i7+A==
X-Received: by 2002:a5d:65c2:0:b0:228:68b7:e7b2 with SMTP id e2-20020a5d65c2000000b0022868b7e7b2mr13898091wrw.440.1663681904821;
        Tue, 20 Sep 2022 06:51:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7e10:f0f:43b2:9b5e? ([2a01:e0a:982:cbb0:7e10:f0f:43b2:9b5e])
        by smtp.gmail.com with ESMTPSA id i1-20020a1c5401000000b003b49bd61b19sm141483wmb.15.2022.09.20.06.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 06:51:44 -0700 (PDT)
Message-ID: <a5279480-dd66-7529-9632-08a63fa14ae6@linaro.org>
Date:   Tue, 20 Sep 2022 15:51:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 10/17] phy: qcom-qmp-pcie: drop unused config field
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20220920073826.20811-1-johan+linaro@kernel.org>
 <20220920073826.20811-11-johan+linaro@kernel.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro
In-Reply-To: <20220920073826.20811-11-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/09/2022 09:38, Johan Hovold wrote:
> Drop the unused mask_com_pcs_ready field from struct qmp_phy_cfg.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index 65825ca41e96..d22d2cf2fc18 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -1342,7 +1342,6 @@ struct qmp_phy_cfg {
>   
>   	unsigned int start_ctrl;
>   	unsigned int pwrdn_ctrl;
> -	unsigned int mask_com_pcs_ready;
>   	/* bit offset of PHYSTATUS in QPHY_PCS_STATUS register */
>   	unsigned int phy_status;
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
