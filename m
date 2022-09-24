Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A80C45E8A1A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 10:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233967AbiIXIUe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 04:20:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233760AbiIXIUM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 04:20:12 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEA7F264B3
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 01:19:07 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id z20so2350106ljq.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 01:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=IUE/+MWwacfn51Izxt1vXbrhqVbso0tR1cYYPVZ3iMA=;
        b=I3Ij5QEe3r5mA60sGtqRyppkSrwLfz3i2E8+rvxRR5+WPA6GUO4CehAImiHrraJFvV
         A0HVQ4eaw8RjLUF+v3CHMXUd7F1J/nC+/1EYh7/myyoMm1wSkKdyN9QUNnmhzNGf2EXi
         r6jrZpaTE8tYmK89Rdh15VLh18bGKZwXHJpWZdJ2Ix7gkPJrWxV+sUYyCRs+ZfCo6FSs
         B4qbik/a0k48wsmUqgyE6wBjJYp+GacfCXa6GTJyKCRDi7Hwz3q0LPRfPg4mBUBZ1vLO
         LwhgNvRChC97cvexZKso2Kjb6IFBbZB03vPO4dEcXCATgWXKHljXXucWKZigzwURVNVh
         UBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=IUE/+MWwacfn51Izxt1vXbrhqVbso0tR1cYYPVZ3iMA=;
        b=dIt9X/1EoDUTOpfH08cpD18CCfCUHuzKzfFEq42DgdEXEDZbnHcvMJdqWHFYIj8emi
         PYua0hoL7MJl0nRZ4i5RLuhiXFW32mXyayeAHjnAGu/+KFK1pJgyKOSD0BK8Cgs+/Qsl
         AMxtsm4xoIfs5MHgv3vA02XZ3Kl7PphfD45QICpDk8JQMPzZ3RTbmpW6zsRMew86FNX1
         NSoFodywhSKLscOwTi4o1U51VsY8wfHx4E60Wy08GKqZWDZ7svw4lNrwclwchlKmjptE
         2FlfjOG+JzRNqwTGEWaKKYndh+jfYte6ZHjXtTfeKOhE9RCCmSFPq4bOkjG48xnAqXGS
         61ww==
X-Gm-Message-State: ACrzQf0gfFg1gk2gp2cp6imbcCMOJBP67SxDX3p/aGv67IPOsBV9VWRj
        YCjsXJIJHem8w0rQxedqy7QaLHX9m2rGpw==
X-Google-Smtp-Source: AMsMyM7fjGjnK2ccg3RmkldGnW8jdo95AjKCJvG6bWcH9F5P6Vic+jXEG7u2dQjfMV7osqb+0nfuiA==
X-Received: by 2002:a2e:958f:0:b0:26c:fd2:80b4 with SMTP id w15-20020a2e958f000000b0026c0fd280b4mr3901884ljh.147.1664007546068;
        Sat, 24 Sep 2022 01:19:06 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 17-20020ac24851000000b0049496855494sm1823078lfy.104.2022.09.24.01.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Sep 2022 01:19:05 -0700 (PDT)
Message-ID: <19bbb34d-0b6f-862b-3fb0-3b10821fa172@linaro.org>
Date:   Sat, 24 Sep 2022 10:19:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 0/2] SDM670 USB 2.0 support
Content-Language: en-US
To:     Vinod Koul <vkoul@kernel.org>,
        Richard Acayan <mailingradian@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20220922024656.178529-1-mailingradian@gmail.com>
 <Yy6tHE8VZ2v347Q9@matsya>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Yy6tHE8VZ2v347Q9@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/09/2022 09:09, Vinod Koul wrote:
> On 21-09-22, 22:46, Richard Acayan wrote:
>> Changes since v1:
>>  - drop driver patch (some maintainers might be excluded from v3
>>    recipients because of this)
>>  - add entries in usb clocks and interrupts
>>
>> This adds compatible strings for USB 2.0 on the Qualcomm Snapdragon 670. I
>> have no way to test USB 3.0 because my SDM670 device doesn't have USB 3.
> 
> No driver use for this?

Driver already supports it.

Best regards,
Krzysztof

