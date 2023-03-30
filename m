Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89A6E6D12C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 01:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231452AbjC3XDm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 19:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231418AbjC3XDl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 19:03:41 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D0B710410
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 16:03:33 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id g19so13494532lfr.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 16:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680217411;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WZn4tyYY9BCk7s1Po6/aemP10gDlKI2Kq9xH5VdIvl8=;
        b=aKcdq2Z5swALULKu0fcI6Tg/BGE3/u0bz80ty7vwu0t4w9Vmt+kLbOGEpgw2lGj1T7
         6JmOB94VEVARY30TRkoquGGMi0Zt2u8p6wbwebhBBNgcQII9v+cRRgiQNBcCXQ/nRcGa
         MZh8yedvaUtp1mOlMrv/6+aq8fUTh9oF1nPoY0dVOx7Eby+VoUIvmtaHHcOjjhOcCHM5
         mcwWEk/TrmO5b9wJIMx2C0FmVWJisimMbl65cKCyniTFets+GwE9FOAMpFHlgFMIY0dZ
         Yhja6m1+RuERXKcEO+8qIO3STt9QVXuF35zOl8K0Kkyf7DtbVTqe58RM4q0MmJG/U3jg
         Sw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680217411;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WZn4tyYY9BCk7s1Po6/aemP10gDlKI2Kq9xH5VdIvl8=;
        b=HQCWFCpU4KTOg30mubuAH2NHSvfNdiVAQOj8cQZiRm1YDnfTqLlgijhrVZdeBzdYhR
         oPBZ1A5Rvardy6t4xjyGH54ATjJXmICzY0zW4Ft5Iy0IpRyU1VCPHS5pd8VC2XANKHWl
         XHfWevn2vKIcqNv78EtQKo3PCTMm41HXnc2tQkCoGqdelPsvXFTdSc3mrjMwkXFUUaXH
         na/2JO87gsgKnVgXJhEyj/kNnFto51UpdOY9wYnLo0UN9pK7apq4oeWqdSETyWXMLKnJ
         Pe42hNKc1IZ9S6KsPeKfdK6VplNJaRVToofMnnyMkkuJKvRX5+166EVPjSL76O5162ws
         t0nw==
X-Gm-Message-State: AAQBX9fnmFGgRmDZ5DdZDHD41y12WQTY2vJ2yvYv5Ki4uAS79uVMRZ7c
        NU+D631vjNr2yS2WDl49ip7G/w==
X-Google-Smtp-Source: AKy350YRKh/QIHzo45/fUtf7azJj4YT7oA/lSCOramU1kvawSFT12Tm6ZdnXLF+sBh2OXuUdGLIErA==
X-Received: by 2002:a19:ae17:0:b0:4eb:2529:cbb2 with SMTP id f23-20020a19ae17000000b004eb2529cbb2mr1958614lfc.49.1680217411529;
        Thu, 30 Mar 2023 16:03:31 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id s5-20020a19ad45000000b004e845b49d81sm122275lfd.140.2023.03.30.16.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 16:03:31 -0700 (PDT)
Message-ID: <39058df7-6080-b38a-f4a8-0a4015982ca6@linaro.org>
Date:   Fri, 31 Mar 2023 01:03:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 3/3] remoteproc: qcom: pas: add SDM845 SLPI compatible
Content-Language: en-US
To:     Dylan Van Assche <me@dylanvanassche.be>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230330164633.117335-1-me@dylanvanassche.be>
 <20230330164633.117335-4-me@dylanvanassche.be>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230330164633.117335-4-me@dylanvanassche.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 30.03.2023 18:46, Dylan Van Assche wrote:
> Add a compatible for the SDM845 SLPI to the Qualcomm remoteproc q6v5_pas
> driver. The SLPI is the same as in SM8150, SM8250, SM8350, and SM8450,
> so use the same resource in the driver.
> 
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/remoteproc/qcom_q6v5_pas.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index b96020c93e58..f3a7ae503bd1 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1169,6 +1169,7 @@ static const struct of_device_id adsp_of_match[] = {
>  	{ .compatible = "qcom,sdm660-adsp-pas", .data = &adsp_resource_init},
>  	{ .compatible = "qcom,sdm845-adsp-pas", .data = &sdm845_adsp_resource_init},
>  	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &sdm845_cdsp_resource_init},
> +	{ .compatible = "qcom,sdm845-slpi-pas", .data = &sdm845_slpi_resource_init},
>  	{ .compatible = "qcom,sdx55-mpss-pas", .data = &sdx55_mpss_resource},
>  	{ .compatible = "qcom,sm6115-adsp-pas", .data = &adsp_resource_init},
>  	{ .compatible = "qcom,sm6115-cdsp-pas", .data = &cdsp_resource_init},
