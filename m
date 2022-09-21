Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A46825BF76D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 09:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbiIUHQH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Sep 2022 03:16:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbiIUHPr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Sep 2022 03:15:47 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C88A7B1DE
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 00:15:42 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id bq9so8332234wrb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 00:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=+2gYSefCpFz7zvMbQh2X85Wn00eX/c1TWwJPLjqJoy0=;
        b=gwU08wStlOFrKlZQfEJeakYCknAHImXsSTWe7Xisb2aQLxIlPLQL7oUI7KoI3P3cxY
         BW+JorASkKbERot1olyykBjavzrFfltPOP2gHOnjl1s8VWs5Fq/YDq9XBl6zefWJ88k6
         poz4W6s6co1xPZ6ffOBg6lOiwDQkXbKFb+zxolNcM3nEfYf1rUjQ6MqlxQ+XM0u9Q+IV
         rjzDTJAJI29dzOg5zyDYpom/trWz7VkLyG0IDx2AZWY6EszkRXP/QHGeJJWuHhg+aqtO
         uXC8Gek5ND6xi/ZP5+pr8qTVZUCshi+c0OBGLimXnZa/fZ3THFFFYD3XLgSVDQxdDpl5
         NZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=+2gYSefCpFz7zvMbQh2X85Wn00eX/c1TWwJPLjqJoy0=;
        b=V0nOIsXlMcbzfFF5uW/JRB8TIapWMBg1fCVjOAvSomWw7JzGcpTlZxDJdUo3aEGFiz
         N7hoVGQdnQ6J12MzyrD+ORtRN/ELEnPwZuDBekZgJPimUmA60dCWXSQlqrbx7sED74Xp
         ObQ3VMeAu17q+X43ThPfpcNzElfFUHCh1M2w3Cy1iC5zFzruR/Lq15UVq4FYE7P4sybd
         fVV8Wi2PgBGM4udeBqSwYxNVJkm+fdUHEcnyHcfWPan+D7tvHUcpgJhW5xw2/Q8fndwo
         JFf+hrGc5/w3FZ5GKGbcg0Kui/YJcAo5vj/zXEykDIb8VCqbP0DFN83cyDZ7/EZ/4FEF
         qHHg==
X-Gm-Message-State: ACrzQf2jqisYI+4XXy6sYeJbg2A2+6UjM0vFOMIttGaQXwmKpZhYKpKP
        gOO+4jAHFQeUMAsw9XGXU2vw0udOlflrBNkE
X-Google-Smtp-Source: AMsMyM4l+dv6ILSnOFRB+lqQJkUCQ4UqYtSAyTOTRWjncL+oQlrSqcK9Y5ONbXxQYPLx2Xhs+QnrCA==
X-Received: by 2002:a05:6000:18a1:b0:22a:f4c2:c9d3 with SMTP id b1-20020a05600018a100b0022af4c2c9d3mr11112021wri.92.1663744540929;
        Wed, 21 Sep 2022 00:15:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8ce3:ff4e:ae9b:55f3? ([2a01:e0a:982:cbb0:8ce3:ff4e:ae9b:55f3])
        by smtp.gmail.com with ESMTPSA id b4-20020a5d4b84000000b00228a6ce17b4sm1747887wrt.37.2022.09.21.00.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 00:15:40 -0700 (PDT)
Message-ID: <fcf8368c-7423-a350-c637-86b9adecaca1@linaro.org>
Date:   Wed, 21 Sep 2022 09:15:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/2] soc: qcom: smd-rpm: Add SM6375 compatible
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220921004534.151990-1-konrad.dybcio@somainline.org>
 <20220921004534.151990-2-konrad.dybcio@somainline.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro
In-Reply-To: <20220921004534.151990-2-konrad.dybcio@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/09/2022 02:45, Konrad Dybcio wrote:
> Add a compatible for the SM6375 SoC.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> Changes since v1:
> - changed the compatible to match the style used in the file
> 
>   drivers/soc/qcom/smd-rpm.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
> index 413f9f4ae9cd..15671a917fb9 100644
> --- a/drivers/soc/qcom/smd-rpm.c
> +++ b/drivers/soc/qcom/smd-rpm.c
> @@ -246,6 +246,7 @@ static const struct of_device_id qcom_smd_rpm_of_match[] = {
>   	{ .compatible = "qcom,rpm-sdm660" },
>   	{ .compatible = "qcom,rpm-sm6115" },
>   	{ .compatible = "qcom,rpm-sm6125" },
> +	{ .compatible = "qcom,rpm-sm6375" },
>   	{ .compatible = "qcom,rpm-qcm2290" },
>   	{ .compatible = "qcom,rpm-qcs404" },
>   	{}

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
