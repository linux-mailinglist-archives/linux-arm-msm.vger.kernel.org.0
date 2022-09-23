Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 687655E80A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Sep 2022 19:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbiIWRZq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Sep 2022 13:25:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231253AbiIWRZo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Sep 2022 13:25:44 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11B9BE7411
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Sep 2022 10:25:42 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id w8so1289190lft.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Sep 2022 10:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=OrcelPIHikTCgBXX07kdh3ldwNlBjgUvFNgGfB7EFeg=;
        b=u/1/qxtErYtkN9+zPFiGnQdZwn2081IQed996TOtNe5sxlsZzGsy10AxB2KRGbfhmz
         7vQfKDndmz60rAunU0+Y4BRbVp0PJlUB7GGlBBec8yK6fdFbvfPp+c3gRlQAa3wk4XYR
         SsFglBZ7/2cBD6/ME3xZkN43TbL2oyKMS1aO4jUmHcIme0NfeFkfiXY2df8AUIYYMejA
         5otfhLywGRZHGCJgZOgeAwOm9Hf61HX+zcC644y1aFRwi3HyOtsdvzRn00kFolsHIIT5
         UUAb3s158TmWLdPOLnW6AxMYlahrK4NZzhiSEBeFfp2IupBLYz5W1XxeFFPNJRTvrg8K
         zUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=OrcelPIHikTCgBXX07kdh3ldwNlBjgUvFNgGfB7EFeg=;
        b=IQineWSmIsM70A+9POgAsGDzz0IxCGPrJ4Qtl1SVCpVxAP4JaaP7m2f5Qqg3UcLezA
         mi1VEfn6qPXVGGZ353e8mJTX+KhFi1tzIBdzzKrB5Vn6pp4/iQUAySDlCJPh3hCpyHXa
         DcepT1HZ4Vv96JQcXHJ8ORbUOPz2exbVa6tM9z7EUZ2t0gVtLM2rtgjl8xcCDxRoQTIa
         RM7b6x/neYgHe3huiTMPYV1k8qRpaQDoa4OqdqR3tVmeBOF2mK8DpTq0eLVHm9FHF4uu
         FKfLJRkVesDIt3RTthCPTS2c4nsTqz2XILSwe6gWMt4I3kebG4HGHFhZYTwvVwovNFy1
         vGsQ==
X-Gm-Message-State: ACrzQf17KeCZL6hZhiCD2ImhY8uImMbwTTpPJGUNOHu+lIBt/WYl45hv
        GHQ5dp1oPZhiNwQ0PZUwGHq3sA==
X-Google-Smtp-Source: AMsMyM6ZPGbEHKg4/6Ep9HeLzcfVYce6BoygYO/+x80dFQl1w0hIDyL0uSoJRSq4dh2CzzhKH+lirg==
X-Received: by 2002:a05:6512:10c8:b0:49c:14c5:e081 with SMTP id k8-20020a05651210c800b0049c14c5e081mr3718436lfg.615.1663953940276;
        Fri, 23 Sep 2022 10:25:40 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y1-20020a05651c106100b0026c16e9e45bsm1480801ljm.17.2022.09.23.10.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 10:25:39 -0700 (PDT)
Message-ID: <da5902dd-1a2d-7669-fb91-c7df5bb1addb@linaro.org>
Date:   Fri, 23 Sep 2022 19:25:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v8 6/7] remoteproc: qcom: Add efuse evb selection control
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        linux-remoteproc@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@quicinc.com,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org, devicetree@vger.kernel.org
References: <1663938340-24345-1-git-send-email-quic_srivasam@quicinc.com>
 <1663938340-24345-7-git-send-email-quic_srivasam@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1663938340-24345-7-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/09/2022 15:05, Srinivasa Rao Mandadapu wrote:
> Add efuse evb selection control and enable it for starting ADSP.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---

Thank you for your patch. There is something to discuss/improve.

> @@ -543,6 +549,17 @@ static int adsp_init_mmio(struct qcom_adsp *adsp,
>  		return PTR_ERR(adsp->qdsp6ss_base);
>  	}
>  
> +	efuse_region = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	if (!efuse_region) {
> +		adsp->lpass_efuse = NULL;
> +		dev_dbg(adsp->dev, "failed to get efuse memory region\n");
> +	} else {

This needs bindings updates in all users.

Best regards,
Krzysztof

