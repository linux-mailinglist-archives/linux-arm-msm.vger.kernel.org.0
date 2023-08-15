Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BBD577CB5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Aug 2023 12:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236559AbjHOKzM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Aug 2023 06:55:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235380AbjHOKys (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Aug 2023 06:54:48 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AAA3198B
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Aug 2023 03:54:47 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fe9c20f449so18584565e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Aug 2023 03:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692096886; x=1692701686;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=izGaJdoL1altreQQeI/R6UtOKqdt35yr8igiBx2MuIQ=;
        b=gw+JHf3mqzgtFz68AgrHI3GSFkV9a2+HzlqPyect5WvD24BwK3l+/tnt6ay6pZGaoA
         kbAJnODUmeim0dArkO7wJV2JBEH4oXtWWNi6/4xSpP+I2JdWwUjJpFL84zwqDToreJOJ
         fM9wh2TqQ4HTCc1+0iRrGs7UxoGORJ/+jVlD7HCxQvP0spE59lKeqCQbaG9V1vF399nF
         /D5rAuI2350iX2lWNAczDeOVMYTWSJ4GHG/JgfVwWSPSA4HvOl9IIGxr81HPip0Ol3Pp
         pZLas40x4vq17Cy7VwFLwXrNaieRuKIRab6o2+HrhoqnaW2pU4L0vFH428hvBrkZfRyV
         VIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692096886; x=1692701686;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=izGaJdoL1altreQQeI/R6UtOKqdt35yr8igiBx2MuIQ=;
        b=AmqGuFbjSjBbK+5BJhK/D4vQKyMS6d1X0heyjk/8IjgbH6s+zBalfv2amkGaDh6qJT
         p2pqNNDKWPs6kso2ceOHfcuKHZJ7l6CZhNfNggFh7MxCNihGoc3doYqG7IvJuntvdUFL
         aJdpDEBVqO729x2cOzopjzSgLsF0b2YSddmjPDeSY/Om6RXeMtfQJ8NdgoasKDtTM3TL
         GrP6nkdZKb27p++2s0HC/iz83uNfQ94ME/T1kFk48cB/2wM3jM+LKcpvK3i5ZCu7ZnVW
         QZ4UtrUzUq+o3Nq1JY/VB+dw5ZSk2Ca+H2opEOsDAtDQnv20ID83RhWjjdfVpZcHV0/w
         YwnQ==
X-Gm-Message-State: AOJu0Ywya2yK5/ai9C6+CBHlV3s+K6c8Sdi+1XXiLJ+Fmj5MV/vsl4e/
        294HDGGOAGfkD89uPlroA2nqVRMQyzz4nOA/K5E=
X-Google-Smtp-Source: AGHT+IH4Hp8wN8iHfFg55Mg7GHkGRDLAv96w3foaYjXJ0TWXNY9UaFNWwN9afBzZnHUY00zw0I8gIQ==
X-Received: by 2002:a05:6000:1950:b0:30a:f030:8637 with SMTP id e16-20020a056000195000b0030af0308637mr8205101wry.22.1692096885889;
        Tue, 15 Aug 2023 03:54:45 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id h5-20020adffa85000000b003197efd1e7bsm4220267wrr.114.2023.08.15.03.54.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 03:54:45 -0700 (PDT)
Message-ID: <80b73fa9-cebe-e058-6ef8-f039064cdd34@linaro.org>
Date:   Tue, 15 Aug 2023 11:54:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: sa8540p-ride crash when all PCI buses are disabled
Content-Language: en-US
To:     Radu Rendec <rrendec@redhat.com>, linux-arm-msm@vger.kernel.org
References: <92de74746a624c2ece615a6286301db7647b5590.camel@redhat.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <92de74746a624c2ece615a6286301db7647b5590.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/08/2023 23:36, Radu Rendec wrote:
> Hello everyone,
> 
> I'm consistently getting a system crash followed by a ramdump on
> sa8540p-ride (sc8280xp) when icc_sync_state() goes all the way through
> (count == providers_count).
> 
> Context: all PCIe buses are disabled due to [1]. Previously, due to
> some local kernel misconfiguration, icc_sync_state() never really did
> anything (because count was always less than providers_count).
> 
> I was able to isolate the problem to the qns_pcie_gem_noc icc node.
> What happens is that both avg_bw and peak_bw for this node end up as 0
> after aggregate_requests() gets called. The request list associated
> with the node is empty.

If all PCIe buses are disabled, then of course the bandwidth requests 
should say zero, the clocks should be disabled and any associated 
regulators should be off.

> For testing purposes, I modified icc_sync_state() to skip calling
> aggregate_requests() and subsequently p->set(n, n) for that particular
> node only. With that change in place, the system no longer crashes.

So what's happening is that a bus master in the system - perhaps not the 
application processor is issuing a transaction to a register most likely 
that is not clocked/powered.

Have you considered that one of the downstream devices might be causing 
a PCIe bus transaction ?

If you physically remove - can you physically remove - devices from the 
PCIe bus does this error still occur ?

> Surprisingly, none of the icc nodes that link to qns_pcie_gem_noc (e.g.
> xm_pcie3_0, xm_pcie3_1, etc.) has any associated request and so they
> all have 0 bandwidth after aggregate_requests() gets called, but that
> doesn't seem to be a problem and the system is stable. This makes me
> think there is a missing link somewhere, and something doesn't claim
> any bandwidth on qns_pcie_gem_noc when it should. And it's probably
> none of the xm_pcie3_* nodes, since setting their bandwidth to 0 seems
> to be fine.

Yes so if you assume that the AP/kernel side has the right references, 
counts, votes then consider another bus master - a thing that can 
initiate a read or a write might be misbehaving.

Assuming there is no misbehaving arm core - say a cDSP or aDSP piece of 
code that wants to do something on the PCIe bus, might the culprit be 
whatever you have connected to the bus ?

Could something be driving the #WAKE signal and then transacting ?

But also keep in mind depending on what you are doing with this system 
if you have a bit of firmware in one of the DSP cores - does that 
firmware have scope to talk to any devices on the PCIe bus ?

I'd guess another firmware is unlikely but, a downstream device doing a 
#WAKE when you have the PCIe nodes disabled would presumably be bad..

Try looking for an upstream transaction from a device..

---
bod
