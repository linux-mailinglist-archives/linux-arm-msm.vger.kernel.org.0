Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61D684FFD42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 19:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237530AbiDMSA6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Apr 2022 14:00:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237581AbiDMSAz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Apr 2022 14:00:55 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BE806E4F8
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 10:58:20 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 17so3179941lji.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 10:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=dTR+7S76RuA6oTQbni5CCIGtj8BqCBtbBfvTNy8k/fs=;
        b=jWkGCfmiAWXOQuM5EdLNd5c6wyS+rG663Y6QLR+L50867SApKx26kPk+vBmgoVaAon
         yKwE3dXNVujfagbT24ao/lzz4GyplTnhIbwBB50dIdZNTESPyb5wEgMQXpj0xD+kV7xT
         FSkcGpAlYmj7Zf01S3POTLZO8jgqDa/FkZczxb2HTYV6oOHViDU269XvSQ0jnQHeGY2o
         0dNiUZ9U0S19IHJApmRJrlp+RoYSfwQAe/LpZgjPNopDUUx3xbfgrv/Vw2HEicTsQz1H
         5bUen6xGjqbwHWuf2JmiLDUeNAWXjwKbeMO66P7//c88trJ33kKASx52j2Y7uS0XzjFE
         JPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dTR+7S76RuA6oTQbni5CCIGtj8BqCBtbBfvTNy8k/fs=;
        b=7KseIHZzOVLSsMmVmdLaho5pVgu3UzFNHffFxQTVXd82ovSkatixZ5BdUaBZjKP/QV
         1/qa+GM+pCRFtECoiHw4WhGI1e/AZHpqu+6SUAnkVGs5iBcQkPTNRCLBJ5e3lYZRbI4c
         FXazXU7hd86iPi4ocN2X3fLQ6Esbw8SScEhf9f3H7/g+qI0zmzXh1b8H3o4AipXtkxhJ
         ujawPyIWR1c/KRjj/qyydvokymRI5D4TRcO2ZEaRa0eksQvjfMLRoZpUPjDcVpBZGYyA
         uKkMbgMo5aNr4xB4blW0JOBdy7tboPO7Vlga0B4Webpvwddj6w2WWlqFmOMsP8psgUgJ
         ETyg==
X-Gm-Message-State: AOAM533Bz+oiKhK9VpPdoBZksRIVpOg2xj5+fcPuVnPRLhlIfXBsa/El
        IAVK1gS41h6cyLWUeffx7tUElw==
X-Google-Smtp-Source: ABdhPJz4IQ/ceAohT8qpZgZgvEFG2TDcuQeYdbfAAaujgyAbnpLpWsXe6JsDVTI7X52l4pnHKDgncA==
X-Received: by 2002:a2e:8099:0:b0:249:822e:1256 with SMTP id i25-20020a2e8099000000b00249822e1256mr27323864ljg.267.1649872698463;
        Wed, 13 Apr 2022 10:58:18 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o7-20020a05651c050700b0024c7ebff04bsm484582ljp.79.2022.04.13.10.58.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 10:58:18 -0700 (PDT)
Message-ID: <d63a8b9e-3c33-31d7-69a6-65052f024e74@linaro.org>
Date:   Wed, 13 Apr 2022 20:58:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 0/5] PCI: qcom: rework pipe_clk/pipe_clk_src handling
Content-Language: en-GB
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Prasad Malisetty <quic_pmaliset@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20220412193839.2545814-1-dmitry.baryshkov@linaro.org>
 <YlaV2/AQJaQhytR8@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <YlaV2/AQJaQhytR8@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/04/2022 12:20, Johan Hovold wrote:
> [ Dropping tdas@codeaurora.org, which bounces. ]
> 
> On Tue, Apr 12, 2022 at 10:38:34PM +0300, Dmitry Baryshkov wrote:
>> PCIe pipe clk (and some other clocks) must be parked to the "safe"
>> source (bi_tcxo) when corresponding GDSC is turned off and on again.
>> Currently this is handcoded in the PCIe driver by reparenting the
>> gcc_pipe_N_clk_src clock.
>>
>> Instead of doing it manually, follow the approach used by
>> clk_rcg2_shared_ops and implement this parking in the enable() and
>> disable() clock operations for respective pipe clocks.
>>
>> PCIe part depends on [1].
> 
> Looks like you forgot to add the link to the prerequisite patch:
> 
> 	[1] https://lore.kernel.org/all/20220401133351.10113-1-johan+linaro@kernel.org/

yes, thank you for the correction

> 
>> Changes since v1:
>>   - Rebased on top of [1].
>>   - Removed erroneous Fixes tag from the patch 4.
>>
>> Changes since RFC:
>>   - Rework clk-regmap-mux fields. Specify safe parent as P_* value rather
>>     than specifying the register value directly
>>   - Expand commit message to the first patch to specially mention that
>>     it is required only on newer generations of Qualcomm chipsets.
> 
> Johan


-- 
With best wishes
Dmitry
