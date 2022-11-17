Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9848462D8D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Nov 2022 12:06:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234629AbiKQLFx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Nov 2022 06:05:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239456AbiKQLFr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Nov 2022 06:05:47 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 071861C7
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 03:05:45 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id u11so2236040ljk.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 03:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H79PCsWOjfEqpOk1WFG4TnCf2WN438wq80ZX5yexXOg=;
        b=QufErdbCBesXqzrLX1ymdvrzEH6hnAxrPLpEb+rHyoZzgJMw+FBKPoa4pTZMyDg1dG
         tqu5qgkYuEmhHoHrFJUrC9VRRGSCWT4P8eWn7072B7znSUtJE5UP1tB5zb1Blr/0xyJZ
         qEWSviJCYuVRMJVXvAZkj1/T8BVgDhMaQQ66ZhmYCTUt6hbT39TgoG5g2tPZ1lt9of1a
         ZR7FNyonYn7TwqN3PUZ4ntmgfur9Nev2OpmdSTHmNtlp898KGSw/zZnVhZuCKgUvotsP
         jz5YpaXYgk+Xi9Ggz0taZAsnn/PECR6XPWIt8ehtQS9aR3NnAKu1pptsM1ittW5lZ8zw
         BmIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H79PCsWOjfEqpOk1WFG4TnCf2WN438wq80ZX5yexXOg=;
        b=Ihmlfp5xSMByypsReVunSJDKb8gccB9SJpnArDgzj5gQp13ChM6QGc1rw7AUaqg5Wa
         xyV2eTUZ1GjAnbVkvP4X3WlqgLpscDDNjah1VCc0UBgEV5k/CfAHENoV/zUY8gBs/PcU
         ZBmzNwMOw8JQIVvkHCRLDCybu/JJ9IhoVDcq77nSL0ZnBlh/dQ1BCq0aLmC/ArT2r7Fm
         +RxZk3jOTA7E9GePvTSyRxOrzMmMCP6IU4rpVbFKjFyByGLlOS7U/dtIUOyn0MmQ5pNm
         d7tEo1TYPbxSGFsJSu790okTDcprC4Kkw7EOB03CGd5+9CvZcwgwPni6hBgQOJ9u/jpB
         8+9Q==
X-Gm-Message-State: ANoB5plvFBPNoeJOoxBR/tIQSx5ZHmYj7C6KqsQTtB0u0a2iPQ5hzoXv
        EVyR29xEgL06pSj+iftusdQIeQ==
X-Google-Smtp-Source: AA0mqf7O5EPAr9dQvYZFAHqEVkox84vcNuC8UEmqLdh8U2We1VSkRZCNs17ByvKNBBdIX3FG+vgD2Q==
X-Received: by 2002:a2e:b62e:0:b0:277:1888:e14b with SMTP id s14-20020a2eb62e000000b002771888e14bmr772795ljn.339.1668683144307;
        Thu, 17 Nov 2022 03:05:44 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id 8-20020ac25f08000000b0049602a81111sm96840lfq.107.2022.11.17.03.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 03:05:43 -0800 (PST)
Message-ID: <bc175bb7-cecf-1a47-172f-f23e5bac2d51@linaro.org>
Date:   Thu, 17 Nov 2022 12:05:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] arm64: dts: qcom: msm8994: Drop spi-max-frequency
 from SPI host
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221117105845.13644-1-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117105845.13644-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/11/2022 11:58, Konrad Dybcio wrote:
> This is a device property, not a bus host one.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

