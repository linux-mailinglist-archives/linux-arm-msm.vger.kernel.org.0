Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA3C6E6A3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Apr 2023 18:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbjDRQyS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Apr 2023 12:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbjDRQyR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Apr 2023 12:54:17 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57AE7D329
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 09:54:03 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f086770a50so18195305e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 09:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681836842; x=1684428842;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ey5lQr/8K2KSsJSCyNLSxeb/2SqrLz0TU7PqzjXxMzg=;
        b=tv4UQkdxH6jK+rFbo+m7w4WO7NClXUgYHnoFg7YjuRJjbElr06IETeeqmWMSP4JrU3
         gl8OpE0I7ajZyMaBPoMVWlMmAi74pDsx3WuanruP1oqKUOrr3HI3o93eVDDAOViy4Sov
         mTP+YvlO+jzlzsrm4rb0sNzbHr9DTPQNHlQ91DgiifxAIv3rARitwo13j8AoEYX5Cta5
         OVt8p2O3iRs7Tn8v4INJp1Wb9LFC+23uNfWU1LV5BBqzD37096z8HFyv0EKU9Gj//OIH
         Opa1PA33VPFXWMxOD/96zoVcYWtHFbVMuQ4r0BkbIsd0WDUbN3VjNUwSVPpvhQQXwB9l
         5vig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681836842; x=1684428842;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ey5lQr/8K2KSsJSCyNLSxeb/2SqrLz0TU7PqzjXxMzg=;
        b=I7syazXG4LsWqvSq6m6JO8fzW/Pc8TOPgwdqbKrBV1WVPjV83Ygsh2MkEsJJ3a7kVf
         52sqcnXEGVeh912Ji+AXl29o6rQ0obSBBzlh9FPNd1EQxzoucxstGdfFVu2pGK0L6pNL
         TjViFeQTD0ymbBlFWQUPWrBR43IumfZF5mQNjwDZCKk/IDYaOxS58BP7BFq774gMHIMY
         RQKYrByuKVcGNhxtmTxA+ng9bfKeZVI8xA6kUjPiY5qRQiPnWXyxXn+7BUkVbLHJB5om
         h7YHiH4guEq+/WTO4/5RNsIVOpeOEhqcQG3lqgdt4XBs45GEoUr+CK+BmbZ87pWMCr8a
         Ua1w==
X-Gm-Message-State: AAQBX9eVo1j8owCDvqKOzzJ4Ek/0jiP4Rq/BZdkhId2wCyNqt6s4CLza
        0vQrmyIDRxRap+mkr65IE8fv+Q==
X-Google-Smtp-Source: AKy350YRuogy27oxIbW2jcWt5exZazJt8OeEbhyAXPT9UUaolz4oUs70Pjzn7Z64vo3RQ8DMyfhXVQ==
X-Received: by 2002:adf:ea86:0:b0:2f0:2dd5:ee7 with SMTP id s6-20020adfea86000000b002f02dd50ee7mr2455463wrm.36.1681836841751;
        Tue, 18 Apr 2023 09:54:01 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d15-20020adfef8f000000b002fb9e73d5e5sm3496847wro.60.2023.04.18.09.54.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 09:54:01 -0700 (PDT)
Message-ID: <594e4217-2594-1f8d-130c-c676dcc2b3ad@linaro.org>
Date:   Tue, 18 Apr 2023 17:54:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 14/14] phy: qcom-qmp: Register as a typec switch for
 orientation detection
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        caleb.connolly@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Wesley Cheng <wcheng@codeaurora.org>
References: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
 <20230413113438.1577658-15-bryan.odonoghue@linaro.org>
 <20230418125723.r7fkxgrs2ncxbb7j@ripper>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230418125723.r7fkxgrs2ncxbb7j@ripper>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/04/2023 13:57, Bjorn Andersson wrote:
>> +	dev_dbg(qmp->dev, "Toggling orientation current %d requested %d\n",
>> +		qmp->orientation, orientation);
>> +
>> +	qmp->orientation = orientation;
>> +
>> +	if (orientation == TYPEC_ORIENTATION_NONE) {
>> +		if (qmp->init_count)
>> +			ret = qmp_combo_dp_power_off(dp_phy);
>> +	} else {
>> +		if (!qmp->init_count)
>> +			ret = qmp_combo_dp_power_on(dp_phy);
>> +	}
> This sequence is crashing my laptop, need some more time to debug the
> actual cause.
> 
> Regards,
> Bjorn
> 

https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-23-04-17-pm8150b-tcpm-qcom-wrapper-typec-mux

This works for me on sm8250 nicely - I can transition from device to 
host and back again in both orientations - I'm about to send out V6 with 
this contained, I haven't tried/enabled it on x13s yet though.

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/2c80c630636f1739bde4c1aac2b20940b84daf71

---
bod
