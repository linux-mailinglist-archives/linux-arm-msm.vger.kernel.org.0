Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 084387B3A04
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Sep 2023 20:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233793AbjI2S1n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Sep 2023 14:27:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233552AbjI2S1m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Sep 2023 14:27:42 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD60B199
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 11:27:40 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40572aeb73cso115448655e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 11:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696012059; x=1696616859; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LOO9MB9UoF+kx+MfoIki3YD3nQhPAJHsiuL8TjZeK6A=;
        b=Za7DPoKtBQmrmaotnpRQ7hBdlEhOwnTeVWDupbbHqex3hybhWzK6medB5h+76aRz2C
         RM/UPv1FxfxNo4mbXjm7IVtp2Cigqn1jB5RyxV7oHbiDmcfipwZZ6PCLoNdyXp6sUS7O
         CTFK9SGcCity/4nKBgEAiVBuNtk5l3K3Obe6F9f/VHIP45YcRsICH2oV45bt7e6YR0Qt
         9pvQc6ymuwdlvYb/OHBXm68SXDnCTHkITx91iQkaQ1yI8ig/R89CE+e47UK+S/DI1KVm
         xsEDhafPplsgnlPOo0SgjiokapNnXJu2Fer3oZaFlufZN4yMm/ddFXcBkHYMOL47ZLcF
         0dlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696012059; x=1696616859;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LOO9MB9UoF+kx+MfoIki3YD3nQhPAJHsiuL8TjZeK6A=;
        b=DTpz97z1OzLu/zh0bI++2/lJxlzDGHqJ7eRBe3YJeDZf6ZOFBfpAlf6DI3f8Zt50Jp
         VfZ/+O9rK9sP8Faxyh3TWnHq28N4oTYWvIE1BehvMFmMqsYFoX1rMUkKuZhWQDLMJvaS
         yGokfVydxZuzAG4kyNS4qUFjsuL0dW7QLOJ5RrrRvF5FgiBciddCEj9p0PpZbWWAJz5B
         /rc6qnQD9rX2qDgsAkSqHJDrZqY3CMs1w08UyL8oMX5IuhIsoJmcMiTCwmmV9NcRKS1W
         wQns70qhRriVFTgndilePhPrMGIGHHrb8F/db2MdBEwGuLXj6Hys7TRcQXwsOJcqafuc
         2lyQ==
X-Gm-Message-State: AOJu0YzMLWJq3j21BlmWWEF0SahVm7e69WHusyxxVfyH42XnVno1ETcT
        uKalqHlUx4YKqHES9WtDSyM3Gg==
X-Google-Smtp-Source: AGHT+IGIJoT26bLL18e8p7x6DSmd83hCa5cV7XsJzwHzUXDaA2o5A3Im5Csko/R1CGa0vxUpAfvzZQ==
X-Received: by 2002:a05:600c:3d1a:b0:406:548e:bd51 with SMTP id bh26-20020a05600c3d1a00b00406548ebd51mr3704928wmb.26.1696012059260;
        Fri, 29 Sep 2023 11:27:39 -0700 (PDT)
Received: from [192.168.1.8] (host-2-99-112-229.as13285.net. [2.99.112.229])
        by smtp.gmail.com with ESMTPSA id e21-20020a05600c219500b004055858e7d8sm1958549wme.7.2023.09.29.11.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 11:27:38 -0700 (PDT)
Message-ID: <378f600a-4fbb-42a0-a6d8-ea2dac0b220d@linaro.org>
Date:   Fri, 29 Sep 2023 19:27:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] thermal: Introduce Qualcomm Thermal Mitigation Device
 support
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bhupesh Sharma <bhupesh.linux@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org
References: <20230905-caleb-qmi_cooling-v1-0-5aa39d4164a7@linaro.org>
 <30066188-3787-4277-914e-e06c95fe2e1c@linaro.org>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <30066188-3787-4277-914e-e06c95fe2e1c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 29/09/2023 18:17, Konrad Dybcio wrote:
> On 29.09.2023 18:16, Caleb Connolly wrote:
>> The Thermal Mitigation Device (TMD) Service is a QMI service that runs
>> on remote subsystems (the modem and DSPs) on Qualcomm SoCs.
>> It exposes various mitigations including passive thermal controls and
>> rail voltage restrictions.
>>
>> This series introduces support for exposing TMDs as cooling devices
>> in the kernel through the thermal framework, using the QMI interface.
>>
>> Each TMD client is described as a child of the remoteproc node in
>> devicetree. With subnodes for each control.
>>
>> This series is based on previous work by Bhupesh Sharma which can be
>> found at [1]. I'm sending this as a fresh series as it has been a
>> year since the original version and I have rewritten most of the driver.
>>
> Since you're adding support for funky hw, it would be appreciated
> if you also linked to a tree that has the dt bits hooked up, the
> schema example may not tell the whole story

For sure, you can find a patch with a reference DTS part here

https://git.codelinaro.org/caleb_connolly/kernel/-/commit/9067f80db58bbce81d5f0703aa2fd261e88bc812
> 
> Konrad

-- 
// Caleb (they/them)
