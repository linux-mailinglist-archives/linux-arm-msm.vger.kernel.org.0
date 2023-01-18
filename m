Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E7236720EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 16:16:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbjARPQk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 10:16:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232005AbjARPPq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 10:15:46 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48B134AA65
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 07:11:16 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id j17so6387957wms.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 07:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=78lYokYe+waq3HiNNjOXctpwq/OP5wkSDRDqSFk4TAY=;
        b=m0EIBUpH977o4AjCbdCqiWB8f9RmVT75RjaHmWM6Y0IiudCDPHtW7zYtWxNtFVXoD6
         cLEJZfIye53eea2Jo62OAn98OFiGnd6G1veaQ3UM8BB6xM7nuHVOdznbfv4Hp4m5K1F3
         TkWCh88t/fZk+cUOjxNjkNnaiJnyoLSEvPEhY4qWPsI+gZ1toUh56fYFD6trvJPS4VyU
         RVzQtTUqrAJjqaQklRtuP2pkqvvtlR7Gr3AVx+VsqUOaW0ACEnXS3obf1FfZYco0Axer
         kNdf0WdozC347rSFJmjvzyf914rxmzjdYqy9h/bF9enjUujD5O/8eXhyfjMAuKc/MLan
         YhQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=78lYokYe+waq3HiNNjOXctpwq/OP5wkSDRDqSFk4TAY=;
        b=tOs5vTBcshrAfRQe9RJJIA9OCdaP6ugBbQ7iBZNm98eRwGqtbmB+Uyj07+jUaPm4Ao
         FE7rs4TdxCtO44PumzN19WQSk+nJ9mhWg8uOAJqv95dvX4+7SlLKHgO0t6G/WIkASLto
         ob/4ak+hHNkv/aRbANQMbRxUPRC7JA+kfXOsPgeN/VR/IncWSbmEh0gZ4iIgwXIZ0k+A
         i7/h6U7gnPzaTbEDOzT7FgxIfY9zpFLJOJLdJwjBzPsn76dC1W3qCNP55D4gQysBoQ0Y
         G/ZavoGR2k9FmLVn3vxpQkt16GjPXDJ02oHO1SHS0HMu3+BqVqTu1SojloV5KEYAVLfg
         +FgQ==
X-Gm-Message-State: AFqh2koD3ewpH/g5UcUmN5aovXlJS0KwGmvxy7jUTBLe44hdJSgD9dNg
        SV8tfIX6hWr1o15i6UQIGRmX0A==
X-Google-Smtp-Source: AMrXdXtcmI77IZ7bZcRUw62GSf9vkynapW4LtGSczt2ytIHEtT2D+Ny2IsERJl0ugNJiQhmKbiEj8Q==
X-Received: by 2002:a05:600c:1f0b:b0:3da:fa80:62f9 with SMTP id bd11-20020a05600c1f0b00b003dafa8062f9mr7342774wmb.18.1674054674835;
        Wed, 18 Jan 2023 07:11:14 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bg1-20020a05600c3c8100b003db09eaddb5sm1525371wmb.3.2023.01.18.07.11.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 07:11:14 -0800 (PST)
Message-ID: <0c35ee6a-6908-88c7-5b96-81ab2a8771c9@linaro.org>
Date:   Wed, 18 Jan 2023 15:11:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 8/8] arm64: dts: qcom: Add msm8939 Sony Xperia M4 Aqua
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, agross@kernel.org,
        andersson@kernel.org, djakov@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        benl@squareup.com, shawn.guo@linaro.org, fabien.parent@linaro.org,
        leo.yan@linaro.org, dmitry.baryshkov@linaro.org
References: <20230117024846.1367794-1-bryan.odonoghue@linaro.org>
 <20230117024846.1367794-9-bryan.odonoghue@linaro.org>
 <cff5ed4b-ef6b-b573-2370-1fb55ae746fd@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <cff5ed4b-ef6b-b573-2370-1fb55ae746fd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/01/2023 14:42, Konrad Dybcio wrote:
>>   &sdhc_1 {
>> -	vmmc-supply = <&pm8916_l8>;
>> -	vqmmc-supply = <&pm8916_l5>;
>>   	pinctrl-names = "default", "sleep";
>>   	pinctrl-0 = <&sdc1_default_state>;
>>   	pinctrl-1 = <&sdc1_sleep_state>;
> This hunk doesn't belong in this patch..
> 
> 

bah.

squashing
