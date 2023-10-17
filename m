Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3037CC8C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Oct 2023 18:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbjJQQ20 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Oct 2023 12:28:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233260AbjJQQ2Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Oct 2023 12:28:25 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3543ED
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 09:28:22 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-32d9cb5e0fcso3817376f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 09:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697560101; x=1698164901; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HQvXsaetNqAcFhMUG/2hK+pMDdXGtzxBnDJfKLjQOWI=;
        b=NyBUxD/xEt8gzDTui6ihLOfdNJAnCdXVmxbYOwqf6MKSs3f1jpB0/pXLU2owluQ49e
         kCcu8eiOUavtQR8/b4be5rU+EIWB4BX9vCsLChxec+wRefaURPk48sAGNILZptXQ1de/
         REj0BKBM6xHoL/39klHGWzy+vTR5oZIDGNa3dGO0hdaMr8l8iOZ8n3v19InSm+cZEKJo
         3KgIuQ/w+mD4afwIxSEXvAEdPSDwKf94oYAlPquc9Habr2gXtTkzphBvCAlcBSuaUNUa
         uj7Jlfodzrny8HgVPIOhWAINLBvRlQcGWKzoPw03yn6hx6r5a90tn4YfX+5fQqloqAd8
         kS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697560101; x=1698164901;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HQvXsaetNqAcFhMUG/2hK+pMDdXGtzxBnDJfKLjQOWI=;
        b=pGtB8QV/eUAC/t1cxEnoreJ2gFAnVJUzBXfb0Obcq035lVuikLMw5D2bmDpAeiMWyR
         KxqZRNle6echxq4lhnCosU4UN887hkXqvLIJ7JL+U+D4xk3G77j7wGo7ra3H4CGPu9al
         yMQPw0MB9BlYlx7EMqspRA6d6loXVk7lTO0WgOVUJ2wYt3I6fHlyS0+p5S7GC47boga9
         NTTWvb1sjtikQHq3NNZqJ5v1YqJa6QlmdgVud3oojUT6YfYUdiVoPxn+ZwGA7XFUilc5
         a5g58n4etRUR4lng4hpQLoG71Kgthy5Lveh63Qnk4AxDTjVeGng3PN6xzlC4YGG5/NdQ
         eduw==
X-Gm-Message-State: AOJu0YyG2O9BmBOH+H3H2cUCpnw1srF8197Hblwxx7ojWfrOM1sETYfS
        /MDq+MqLk7mfic2g6ZSgKF0E/A==
X-Google-Smtp-Source: AGHT+IHQcHoYySq8QpN4wpHWzqsBjw0L1AxQwuXVricWOgMzTjZ743oMCFukODi/CgNHu7nEXgxtpw==
X-Received: by 2002:a5d:62d1:0:b0:32d:90f7:ce4f with SMTP id o17-20020a5d62d1000000b0032d90f7ce4fmr2133052wrv.38.1697560101213;
        Tue, 17 Oct 2023 09:28:21 -0700 (PDT)
Received: from [172.30.204.57] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id d15-20020a05600c34cf00b004063d8b43e7sm10257184wmq.48.2023.10.17.09.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 09:28:20 -0700 (PDT)
Message-ID: <f87ee117-ad72-40b8-9246-ddbd7dbe9383@linaro.org>
Date:   Tue, 17 Oct 2023 18:28:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] remoteproc: qcom_wcnss: Add WCN3680B compatible
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Kalle Valo <kvalo@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org
References: <20231015-fp3-wcnss-v1-0-1b311335e931@z3ntu.xyz>
 <20231015-fp3-wcnss-v1-2-1b311335e931@z3ntu.xyz>
 <f342446c-7afb-414c-a4d5-1eff03fe397e@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <f342446c-7afb-414c-a4d5-1eff03fe397e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/16/23 07:35, Krzysztof Kozlowski wrote:
> On 15/10/2023 22:03, Luca Weiss wrote:
>> Add a compatible for the WCN3680B chip used with some Qualcomm SoCs.
>>
>> It shares the same regulator setup as WCN3680, so we can reuse the
>> driver data for that.
>>
>> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
>> ---
>>   drivers/remoteproc/qcom_wcnss_iris.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/remoteproc/qcom_wcnss_iris.c b/drivers/remoteproc/qcom_wcnss_iris.c
>> index dd36fd077911..22acc609105f 100644
>> --- a/drivers/remoteproc/qcom_wcnss_iris.c
>> +++ b/drivers/remoteproc/qcom_wcnss_iris.c
>> @@ -99,6 +99,7 @@ static const struct of_device_id iris_of_match[] = {
>>   	{ .compatible = "qcom,wcn3660", .data = &wcn3660_data },
>>   	{ .compatible = "qcom,wcn3660b", .data = &wcn3680_data },
>>   	{ .compatible = "qcom,wcn3680", .data = &wcn3680_data },
>> +	{ .compatible = "qcom,wcn3680b", .data = &wcn3680_data },
> 
> Just make devices compatible and no need for this driver change.
Or reconsider given <ZS1MTAHq6GLW6RAK@gerhold.net>

Konrad
