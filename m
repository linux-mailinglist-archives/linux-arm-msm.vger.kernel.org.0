Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6254E5B3D03
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 18:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231772AbiIIQao (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 12:30:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231757AbiIIQam (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 12:30:42 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B72B5A820
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 09:30:40 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id z23so2510090ljk.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 09:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=GhijzOpjBSZ7nCgUhoccck5ZIQUlIFoaWDsMZJ6nH7k=;
        b=I4j7Pcd20LpWaZq4vo2jbbXxGnuCGPC0vRNNXv1pXnQQ36vo7i4bBmWp3N7c5Q0UaR
         pJAQr2bZFOrGVsPkVjaaWMcaApx1uJ/8uNzOErXc0bZQ3H1MIoZR1MwQK+OLtAyomOXb
         6+cFZbBG77MIxiPYQEVIWAuWmOJQJTG1dkg2nfnkkh8DranTyzJhy6ZryT9gbUyD2c+q
         /U0VayMgCPIEwYHEYKVRVWJRHiYMQPa44xPTj8typjdYNZ09p0O6QikgvEGnxmcyEHT+
         XYgzmsuF1duIulbUaWkT+IuAdxaRDgmm+c9f4pBglM3YqKnBu4NTORRCVrZvwmAVGdl+
         rzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=GhijzOpjBSZ7nCgUhoccck5ZIQUlIFoaWDsMZJ6nH7k=;
        b=k6R50btZhGxD95JQa5jlcpiyexG6vLeKIX4FspOAgevsWxQYibW5VqUB9VZ0DRdF03
         bllbJ3J6Abvz7hH/X29elpISbUW9O9wA8Neyx//sCVRGiSlugBPqsNOjxrrrn1bQgDas
         k/BdkrW7pfvCj6p/8BUmHuZAOwC7E/XrDkjcQM8pcUtBnllEVViuwn7o8uD0skQOtvYM
         12j3HSAQcffqE4sVbIa73zjQeemydoHzmC7AZR8tVjqmYsCx3I7S2HKFqNw5WaDWsxAk
         9QPK03y36EO6KueZxv3oJyIH7qSLmki9gVTRrYNg02KgRjCj8jxXkg7nLrQwffdwOIBA
         E7/g==
X-Gm-Message-State: ACgBeo1j0IFo9/ty/GPa0YiyYnBIB5cK89nb1hzeWxGTakqc0hxS7Dxv
        Am6bKgItmHysn4cukLvD5wihjg==
X-Google-Smtp-Source: AA6agR7w7saLxlIJEBvuYi+z1NoLl7P1vzJYXRWF1pav4TOZ4YU2x0cHschDHYJ9ylCz+VQq0/EW3w==
X-Received: by 2002:a05:651c:4ca:b0:268:10c2:87bc with SMTP id e10-20020a05651c04ca00b0026810c287bcmr4529265lji.241.1662741038516;
        Fri, 09 Sep 2022 09:30:38 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h27-20020a2eb0fb000000b00261b9ccb18esm147240ljl.10.2022.09.09.09.30.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 09:30:37 -0700 (PDT)
Message-ID: <9e5ec2a2-7b69-648d-4069-8d169abd7f4f@linaro.org>
Date:   Fri, 9 Sep 2022 18:30:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 0/7] dt-bindings: remoteproc/misc/qcom: stricten SMD/GLINK
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        David Heidelberg <david@ixit.cz>,
        Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20220909125403.803158-1-krzysztof.kozlowski@linaro.org>
 <20220909162351.GA1455181-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220909162351.GA1455181-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/09/2022 18:23, Rob Herring wrote:
> On Fri, Sep 09, 2022 at 02:53:56PM +0200, Krzysztof Kozlowski wrote:
>> Hi,
>>
>> This depends on qcom,fastrpc.yaml conversion in Rob's tree, therefore
>> everything should go the same way, I think.
>>
>> Best regards,
>> Krzysztof
>>
>> Krzysztof Kozlowski (7):
>>   dt-bindings: misc: qcom,fastrpc: correct qcom,nsessions name
>>   dt-bindings: misc: qcom,fastrpc: add compute iommus
>>   dt-bindings: misc: qcom,fastrpc: restrict channel names
>>   dt-bindings: misc: qcom,fastrpc: correct example for GLINK edge
>>   dt-bindings: remoteproc: qcom,glink-edge: require channels in children
>>   dt-bindings: soc: qcom: smd: restrict child name to smd-edge
>>   dt-bindings: remoteproc: qcom,smd-edge: define children
> 
> Series applied.


OK, thanks!

Best regards,
Krzysztof
