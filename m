Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B007B6B5B7B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Mar 2023 13:11:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbjCKMLu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Mar 2023 07:11:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbjCKMLt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Mar 2023 07:11:49 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C98D29E3A
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Mar 2023 04:11:47 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso7899469wmb.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Mar 2023 04:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678536705;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H1gaepa5fGeNvveisQKv1GiVKLCBH4AmzUe3ptLxhZo=;
        b=XqXz7ieNFeYsIS88dbgqRzU57fXHf/4P7dK85pvlyqNCPfn43JHV1TUds6Hodoc8p5
         NpvJu5HH20PmsC8mEyssLOK70EpN9J9INgSC7aJdVK++xRDsFy/lDL4ofZgJLXAemKHq
         RCWX3jR4CGQ1WncTVPmCyek/GvADr+aeisnk50qiYPKws1f/vpwVCKFnfZ6gRMh/SW1M
         dru1j7UBi7+J3+0w6aDBKEwDEPxpoY7/E6ihJDhjHVBl2h5yhnVh34mY8u8eAB7BO+sR
         Ccd+imSFnJsaB/t/6VpMEuAKdvVHN6OdyPPio6fC7QoU6yDRtHpX8O2SxOxQk49miu4e
         V1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678536705;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H1gaepa5fGeNvveisQKv1GiVKLCBH4AmzUe3ptLxhZo=;
        b=oH8/Q4ye/LI4Z8ViKJbLlSvv8fgldD6s/xZetuo4l2kJTK7CkS8tlclP8J6DUiFVtB
         Kk3Lpq9mw5Zj9jucJBXPFBUIGW3Ql5rYIQ6SBT/NYREXW7jr9j3qtapXwR1y8wu7sdv0
         y1XFlcMhNDsfawDA0KGH+wPf9MzBuoqllW9vK8mA+6tGrZxie+Ma3I5KjAvbtExSm1d7
         yD8+P+0shTlxIABJ46IpXRw9/XvEGgLj2Zxd/YtBccrpPIuFIAeYZXHimZX48Ovb480K
         F+/53/rKgJW+dwwsnwwxT0ew/o9fKLbxXDQPR8vaAc8rjow9FSdp73RqmJyyhUblVidb
         mPwg==
X-Gm-Message-State: AO0yUKX6fp3jhbQh6mfOGpxi5bNhtt2eH/yXEtnEFv/k9gJumejabcXW
        /qTyMbTXNX60sy4DRUC7Sz5ZJrH3NKoG4w3fD9I=
X-Google-Smtp-Source: AK7set91GeY7l2WOWt+dYFhZAfm2LxBkCMGgWXUSzFvQ+jtoB5MjH/CKMF98VIHl2576ZGMl4D2Oyw==
X-Received: by 2002:a05:600c:468e:b0:3e7:772d:22de with SMTP id p14-20020a05600c468e00b003e7772d22demr5941404wmo.30.1678536705691;
        Sat, 11 Mar 2023 04:11:45 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id w23-20020a1cf617000000b003daf672a616sm2640040wmc.22.2023.03.11.04.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 04:11:45 -0800 (PST)
Message-ID: <544e6f22-f2f4-2c7c-1978-a96c9763e2ab@linaro.org>
Date:   Sat, 11 Mar 2023 12:11:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 6/9] interconnect: qcom: rpm: Handle interface clocks
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230228-topic-qos-v7-0-815606092fff@linaro.org>
 <20230228-topic-qos-v7-6-815606092fff@linaro.org>
 <50f03895-816f-be8d-d956-d237fb13f5a0@linaro.org>
 <6d10906e-08cd-0380-5f5d-3ac0eec60276@linaro.org>
 <67590cd3-5543-59ed-6158-b272103ebd05@linaro.org>
 <858a8925-f11b-652d-3f02-f5ceea7d11fa@linaro.org>
 <74c0c724-b6a9-3755-7f56-9f421cece1a3@linaro.org>
 <500c7924-c43c-4233-1688-f8b6fbbad66f@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <500c7924-c43c-4233-1688-f8b6fbbad66f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/03/2023 00:54, Konrad Dybcio wrote:
>> - Update the commit log and potentially the structure comments
> I'm probably just very biased because I authored these commits, but I can't
> see which part is not clear.. Could I (and this is not passive-aggressive or
> anything) ask for a pointer there?
> 

I mean to say "non scaling clocks" isn't an indicator IMO of the fact 
that these are QoS node specific clocks.

Right now the interconnect model is predicated on bus and bus_a but, 
you've found that on some SoCs we have node-specific clocks too.

:g/non\ scaling/s//non-scaling\ node-specific/g

would do or "QoS node-specific" the fact the clocks don't scale is 
incidental the dependency though is that IMO at least these are 
additional node-specific clocks we need to enable.

---
bod
