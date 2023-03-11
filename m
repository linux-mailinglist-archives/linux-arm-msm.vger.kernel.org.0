Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73CF96B5CEA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Mar 2023 15:38:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbjCKOil (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Mar 2023 09:38:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjCKOik (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Mar 2023 09:38:40 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B7E93754E
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Mar 2023 06:38:38 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id d41-20020a05600c4c2900b003e9e066550fso5179523wmp.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Mar 2023 06:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678545517;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O5MrZLG1fv/oDrj8G7OK4hTcqs75NSjsiUDq6tTXX/A=;
        b=tUJzepR1Ix0D0nJdvEWnL7/JVUQ9EThGCh03jr/kqxe1Ll9krTqBph8rLKDyX62Eis
         lPsOajtXFKhnoXm5fVdCMk5fZMXK4z9dlK1x9IutvGaL39aoLGDYLa+KJmvV9PsRt45Z
         zZfkUJejh0MXEuiBktz8VJdVgj1x3+YnfNyYSwCx11dyYGBLfrHP86BHP4yvCm0DSjUi
         e7jl8C5JbLRRLi9tS3Lxz5v9XkB+W+zWqESoUWAxwYywI8/xtKmzCkX4CDRgp6cLgpvw
         9I2mthEpjT31jmDuHYZE9C7zwUUDLgZtbUXcgpDBhZs3JaUKp8L6kSo86quDTTHPOQ96
         G3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678545517;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O5MrZLG1fv/oDrj8G7OK4hTcqs75NSjsiUDq6tTXX/A=;
        b=kpchhBks9NH3m2KD7XDeNA4PssAqQTYIH2BqSahkAK6cSrVLuyreGUgYZVd68FwMq9
         ZSpnvISZMh8IKSqxQeLaHZ1R+Aq+S2WevAwK+pPJ7MMnFEXfhoufmURuHI6nECkE/c+5
         lOxSN+AyLonhh2Oo3ZgCO660PQoScZvZF+L2k8/DL7Pf2YJrBE5f5yNxwEdwaWlFazwz
         pmISrsmlhXWjRJxj6detYUqOYoYCaDHEH6O4YFWTkknJN7vaWt1VBG9O5UJsa0XaaJJV
         R1IBh9ONhpUy2foOy7qe0Sovzm/KcjI0WkZePD8Ue0SrIbgg/17anqleP4WTn0oV/TzI
         tG7Q==
X-Gm-Message-State: AO0yUKVhxT1Eq4nmj+hn3WC6OWqU6/2Xs8DMXcngAJ949PDUeaztoJcW
        cggv2ApgyZwqPg7Sq4qGCWV8Ow==
X-Google-Smtp-Source: AK7set9D4WKtNwp5ftzZpljbf20TczUiOpHEKRh1CVjgoWBSvgoimsGH+LIlBWUDyb4cm8cXyTzddA==
X-Received: by 2002:a05:600c:1d29:b0:3eb:6878:5523 with SMTP id l41-20020a05600c1d2900b003eb68785523mr6113109wms.12.1678545516843;
        Sat, 11 Mar 2023 06:38:36 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 14-20020a05600c228e00b003ebff290a40sm3052198wmf.21.2023.03.11.06.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 06:38:36 -0800 (PST)
Message-ID: <51c41e49-5183-551e-c796-5b3d792b422f@linaro.org>
Date:   Sat, 11 Mar 2023 14:38:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 6/9] interconnect: qcom: rpm: Handle interface clocks
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230228-topic-qos-v7-0-815606092fff@linaro.org>
 <20230228-topic-qos-v7-6-815606092fff@linaro.org>
 <68a5d81a-5de8-798a-c150-d74c8ad38cb7@linaro.org>
 <f848061a-763e-fbf2-860c-758373e953df@linaro.org>
 <CAA8EJpqh+A_YKbhSQB5sWj4EP9eQtNHeohDira9o-jrx3pPRNg@mail.gmail.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAA8EJpqh+A_YKbhSQB5sWj4EP9eQtNHeohDira9o-jrx3pPRNg@mail.gmail.com>
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

On 11/03/2023 14:35, Dmitry Baryshkov wrote:
>> Its probably worthwhile experimenting to see if the*ufs*_clk can/should
>> be added to the UFS device list of clocks.
> While we were doing this for some of the clocks (PCIe and USB, if I'm
> not mistaken), I think that generally this is not fully correct. In my
> opinion it should be in the interconnect driver, who turns
> corresponding clocks on and off. These clocks correspond to the SoC
> topology, rather than the end-device.
> 

True enough, they are interconnect clocks.

The question is how to only turn them on when the device that depends on 
them wants them.

---
bod
