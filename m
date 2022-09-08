Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F05765B2041
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 16:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbiIHONS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 10:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232014AbiIHONN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 10:13:13 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80A27BC12E
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 07:12:58 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id w8so27884141lft.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 07:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=IvrlMjmlOgVlugC/I6C+dg34QSdadLxD9KM1BW4vzoE=;
        b=soOA/J9vYytAZneHm0U7W6i09Qxcqz9AO+Y6bltVlfq6/TdZStHVe45k7Bd7utvD9D
         lG6IY/Xcna2rQ4qQdBmY4VeZhoN7YJ18rChB9LNgpIm7jupDnfZNalUvrGypRYoEhcAf
         zXbGsDZvtX0Jtwj1vuzr121Ood+ed9NEaoUUvyha7ZZWnmQTmF9g8KLUB1QTqb5HHBuO
         D4Pcas5ARyem7ixwPeLRkjisfgtylJOdStttmYGhAbkyLMmSpnZjqiGLxGouzZyGo8AJ
         DbcbCIU6SCl6YNvrjtxRk4KNKsEwVOLK/u9ZhiBGBawOxksQ5hKUrRODDcHiKRiYRJbG
         QE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=IvrlMjmlOgVlugC/I6C+dg34QSdadLxD9KM1BW4vzoE=;
        b=MoZeOExLUg64deqZF3leEDhBSQV09w8+/70rXR8neObfiCk5C98CIQ5H7Suv7w3Mcm
         IU9ruPISXoOkCtjUOl/ElPqJXQlButLzpKBMwghQKdLdAoT3u1Qv4/pSzB3K/3ULh5ks
         bGxtt1FXBlj3WzhXplhkQ+3efqcudGFYTwjHrHkOLdpbwhLoEvMmDF+Huyzrrwm5QiIi
         MFhjd70jLEru5IoZD3c/pH9iWt/aipQnikNuMWKosJQBBQXn2mnf60PjFlZJsdZCCcMs
         6DK8+Cn+hdJgYluuTVymxtwQNUPjfkiDLkQaIEXh5ytjQGygP/O61N7wckjwWJAgc3ld
         7t8w==
X-Gm-Message-State: ACgBeo0hXZu9i7vEKb6NUhMDkR4ETU6cR/OmuNdZCLwUNWvJnUH+mpCz
        SqnwENhBeKzLKdmUBucpK1FW+w==
X-Google-Smtp-Source: AA6agR7JaNtD8dc6ovzBxHPfuBetLBx+70XWJ7v06Hz9a28r88fkA3pOcTuGXmj0++Nkd2M2NUVt8A==
X-Received: by 2002:ac2:5d25:0:b0:497:a280:9825 with SMTP id i5-20020ac25d25000000b00497a2809825mr2686357lfb.409.1662646378110;
        Thu, 08 Sep 2022 07:12:58 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id j18-20020a056512345200b004979ec19387sm1531284lfr.305.2022.09.08.07.12.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 07:12:56 -0700 (PDT)
Message-ID: <2ce84764-c776-c754-8fea-705d652398d3@linaro.org>
Date:   Thu, 8 Sep 2022 16:12:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 08/11] arm64: dts: qcom: sdm660: Drop redundant phy-names
 from DSI controller
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
        sean@poorly.run, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, quic_mkrishn@quicinc.com,
        agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220907000105.786265-1-bryan.odonoghue@linaro.org>
 <20220907000105.786265-9-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220907000105.786265-9-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/09/2022 02:01, Bryan O'Donoghue wrote:
> phy-names has been marked deprecated. Remove it from the sdm660 DSI
> controller block.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
