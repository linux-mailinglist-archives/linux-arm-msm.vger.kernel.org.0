Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE92772E24B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 13:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240959AbjFMLyP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jun 2023 07:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236342AbjFMLyN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jun 2023 07:54:13 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE612135
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 04:54:11 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-970028cfb6cso974821666b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 04:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686657250; x=1689249250;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xU6yN1IIA+6UwdBgt828/NiFur95ZAvJWWZKM66bpZA=;
        b=pbNPJPLJzd+VW9/5QjUJGqDTvRKCjzZjGlpDvWh9kA/5ldR0qhtDppy957c7QfPFqE
         uBJow20o8qkFP8bUAIaVD5H3iGMX1W1KNiGk08O1IhlrCL+FmXH9tWGniu141rDlrVJT
         sFpwIkkX3ubwdg8PiVzxPQU3ovJf/xfG/bpwxl24LNBLETWhqNDOwefRM/YON3hLm3lu
         cnWeadglU0yeqe6KaHluGHj7VUyG/wFsKjXv3sZ2unrbZJn5sUKbhoZO3Dt9lI1BT2Xw
         ZJlkX0fCXg0eWc+Bt4CheMP0s0zEzzLdVBI53Z6YJskfzO/xxiXCEuDnzuX4rbmulWAu
         AGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686657250; x=1689249250;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xU6yN1IIA+6UwdBgt828/NiFur95ZAvJWWZKM66bpZA=;
        b=Uokj+Cyr2Trn6Iq442jh/9P/vmkav1gamX3T4u+GPMNgJQ8xqOtI/DF87NrSx3dBdd
         /EZBqcfjTizxSXJPH8kEOE4+x5Ci5Qmudh+T8Fylveva5UpIseAtob71dqKGcwn4xaUf
         GjxT0MFHDNHMbhgx19bZbtDIzeuspmi66Ea0Blz856DVxztmEXVfJs/c0afhmKAoDXvD
         M4SLpao9BVzyC8llMINUVyAFx7gjyQGK+6smaU55x4OBeEpz+Qat29x0z0RaKSt5D03a
         eeMCU5aHymoSFvCqyIJ7J1fsSoEumEc65KfDoLL73tCMo3BwAcx3y4S90oYc76nCZwut
         c2ZA==
X-Gm-Message-State: AC+VfDytfauy/JH7rkLkk2OCvVLUmTC67nRFMFMA5dqyWHvrdLb+iq1q
        qkIzQBSeRsxrsKOZ1iytOZEKvQ==
X-Google-Smtp-Source: ACHHUZ4Z7G/vVQ715ReLAU2YsEmtH2Yw//I0SbDXHKPqLXwGL9N3doGeITkVAw65IJS9dH2OXCvTTA==
X-Received: by 2002:a17:907:e8a:b0:977:c5b1:974b with SMTP id ho10-20020a1709070e8a00b00977c5b1974bmr13452293ejc.34.1686657250305;
        Tue, 13 Jun 2023 04:54:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id rv14-20020a17090710ce00b00977c88d70c6sm6499105ejb.192.2023.06.13.04.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 04:54:09 -0700 (PDT)
Message-ID: <5851627e-2972-f860-e965-dc8e73b01225@linaro.org>
Date:   Tue, 13 Jun 2023 13:54:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 5/8] qcom: pmic_glink: enable altmode for SM8550
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20230601-topic-sm8550-upstream-type-c-v3-0-22c9973012b6@linaro.org>
 <20230601-topic-sm8550-upstream-type-c-v3-5-22c9973012b6@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230601-topic-sm8550-upstream-type-c-v3-5-22c9973012b6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/06/2023 09:55, Neil Armstrong wrote:
> Altmode is also supported for SM8550, allow it.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/soc/qcom/pmic_glink.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
> index c87056769ebd..8af06bdc6f5a 100644
> --- a/drivers/soc/qcom/pmic_glink.c
> +++ b/drivers/soc/qcom/pmic_glink.c
> @@ -342,13 +342,9 @@ static const unsigned long pmic_glink_sm8450_client_mask = BIT(PMIC_GLINK_CLIENT
>  							   BIT(PMIC_GLINK_CLIENT_ALTMODE) |
>  							   BIT(PMIC_GLINK_CLIENT_UCSI);
>  
> -/* Do not handle altmode for now on those platforms */
> -static const unsigned long pmic_glink_sm8550_client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
> -							   BIT(PMIC_GLINK_CLIENT_UCSI);
> -
>  static const struct of_device_id pmic_glink_of_match[] = {
>  	{ .compatible = "qcom,sm8450-pmic-glink", .data = &pmic_glink_sm8450_client_mask },

Orientation and maybe all of the USB-related properties do not look like
sm8450 specific, but PM8350B. That's where CC_OUT pin is. I don't think
we represented this correctly, but rather copy-pasted downstream solution...

Best regards,
Krzysztof

