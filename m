Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A19A6C10A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Mar 2023 12:20:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbjCTLUu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 07:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbjCTLTY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 07:19:24 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB9ABBDF6
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 04:19:16 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id az3-20020a05600c600300b003ed2920d585so8918373wmb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 04:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679311155;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jBoWwikoG1lYZMCX3FZwSPiYaLshiMfIcbcmJhOvA+s=;
        b=WEhdIetC8Yrq0C1OZY/x5yGPKslxqUm1NFEJTgK8CgCcA/gU62jy6R68KIG1+SQMRq
         HNpXWXfG9838k37cl9FB+2mqASOTMjlK6+d7FZlP12d9N1796AYcEg5P8vFBMr/EAU1N
         59Lb+roHT2ynAU6Mv5Zryd26Hjw0C7XVp2lqOa6i30fd0SblMsxlx/DXU/JEtaKZdHFy
         evKN8cdYJOOJItO6uI47ezHf3yqW5zGZECZyuDHcZJ2j8bz4v2Kn8gvWnqNyMbAOgmH3
         5RJ10ROhxiak4hmDt/3NE+qHrFR4O8h8iArWFcp8Zdr7Y+oWIfek1j57sfok1uDQP5YX
         x42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679311155;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jBoWwikoG1lYZMCX3FZwSPiYaLshiMfIcbcmJhOvA+s=;
        b=ieedxG3ZhwFO2zJ8gtbGgdEVFpX6mVmLTEM4caFP9BeEJyNs+lSMBtPeIYKp96JLU6
         PYpKEfRvvqzGVzrZC8q57Hypk4Eee5zVDATnFHixricEmzrYe/9cHVPEL4S1YNOPwbre
         BBe6Rz25WMD9OWY2ydf2HE/qeAjZ5EXDKvboc6VLiEKnI6tNT5w/f0ze9Ppz3W/V/6+e
         NdO26Annv2+/vVjBN9+heB7rrCBFzh9V+j0XeIo9QcOVK32iLTs1D5TLsrGDvk1W7BQ9
         m0sYXWhzA3SdcpJSASUWHcfReDbONIvhEJdXiPwD82oSq0nmXNr7B5pqo62qWPBZnFku
         d5hQ==
X-Gm-Message-State: AO0yUKVsR4xv5QPB5nczA4VJdgyENg0M879fR3cH+UN/xdMS5A7b0eZ9
        RVVmLNdDP4lzHsja2aJkqa0Q7g==
X-Google-Smtp-Source: AK7set+fAcl57SjqUyXQUgKaxCIhVo0WvtYh8WATSMV+PmsGg1BmWwhsXbqQ9xfiMSYqDImCrISerQ==
X-Received: by 2002:a05:600c:3b99:b0:3ed:234d:b0c0 with SMTP id n25-20020a05600c3b9900b003ed234db0c0mr25029322wms.13.1679311154972;
        Mon, 20 Mar 2023 04:19:14 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id a3-20020adffb83000000b002c561805a4csm8628416wrr.45.2023.03.20.04.19.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 04:19:14 -0700 (PDT)
Message-ID: <d77bc289-2781-6fb1-6ca5-09991a02715b@linaro.org>
Date:   Mon, 20 Mar 2023 11:19:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 13/18] phy: qcom-qmp: Register as a typec switch for
 orientation detection
Content-Language: en-US
To:     neil.armstrong@linaro.org, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-14-bryan.odonoghue@linaro.org>
 <bd873706-4b3f-69dc-e2e3-9757ea405e31@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <bd873706-4b3f-69dc-e2e3-9757ea405e31@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/03/2023 11:15, Neil Armstrong wrote:
>> +    def_bool PHY_QCOM_QMP=y && TYPEC=y || PHY_QCOM_QMP=m && TYPEC
>> +    help
>> +      Register a type C switch from the QMP PHY driver for type C
>> +      orientation support.  This has dependencies with if the type C 
>> kernel
>> +      configuration is enabled or not.  This support will not be 
>> present if
>> +      USB type C is disabled.
> 
> Is there a reason to only enable the TypeC logic with a config ?
> 
> If unlinked from DT it won't be used, so no need to add a new config for 
> that.
> 
> Neil

ack, np
