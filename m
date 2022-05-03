Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 884AE518F1D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 May 2022 22:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236162AbiECUn3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 May 2022 16:43:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbiECUn2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 May 2022 16:43:28 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62662338B6
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 May 2022 13:39:53 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id w3so6886226qkb.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 13:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CF1rRZMBdGFikP/j43V46JlTy9v9S59RO3PJDooXZCk=;
        b=s4MMs4b32ZZlqeuY7DthE+KfUczBMMggh5ly/jPZxCKBUh11m+/esR549euW/Q7UY8
         NVlyl1RSnMXxUjsoElM0SIYxLJexmAeA7Mam8Ofsk/zZJVMK2ulqDKbTAw8USZ1OP00S
         KSGN3LqcSwpTSBJWQG3sNs5jlms2w6iWNECQ73xaHxG5yMlNdbOOHQ/RPyTKUEQ2Dn+1
         GXsgLUpy5eHISipD2maX85qvG2d184/ss3Vejuub114MCzJi/N9OPmJqJQ1IokBSuskl
         kH7k4tU6Aem/mtTobdtDvKpNCEdBwAhPtd2S0hFO7Gdfb2jETPvquu8Qk1ZKJ0B36pk2
         aNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CF1rRZMBdGFikP/j43V46JlTy9v9S59RO3PJDooXZCk=;
        b=l0iAtgOgUAV0QGO17+XO0hZ7PosKXrV4wwDEA2C86zirEQKd8SxdI2sP+lZ1jOii4y
         XjLRYffS2O67fpX6g0J/AM3s5mcJhYlUtCqOOY3IdTd5AteC9zPB5WHnAytky3Mp1tof
         9iJq6C41kVGp8PRiPxLEOHJxrOFYwWC3FnqAkHoTrPP7LEGBD7XhNId6RXR12oKT1EWm
         YIL+XX8Zc0r8BIeHSBoet/cgBgG9RNoS1MU7Kxcizf7+xdwX8hSCdCMprhmxAb94x185
         K92gr+/4GiNtt9MTeYkP7fet2eWVBucsy0gYVGoDG/B0ptKvlPADLpq2yU1jIq814yRq
         p1Ag==
X-Gm-Message-State: AOAM532nQeLyuU1LILpakXLGM2lsKCi6HlK2Y701J0xOB526N7BPRABF
        eDSyh76U7U0w6XURvkQWxT9szA==
X-Google-Smtp-Source: ABdhPJxqJm0wwuWGMwBvmBmgvducSLG4QQzA7m59lPsrpRYVx2+ZymLmVLU1Tjr0wZ0b/FZ5UPc6cQ==
X-Received: by 2002:a05:620a:d87:b0:67b:3105:4f7f with SMTP id q7-20020a05620a0d8700b0067b31054f7fmr13658867qkl.230.1651610392536;
        Tue, 03 May 2022 13:39:52 -0700 (PDT)
Received: from [192.168.0.189] (modemcable134.222-177-173.mc.videotron.ca. [173.177.222.134])
        by smtp.gmail.com with ESMTPSA id y8-20020ae9f408000000b0069fc13ce20fsm6271493qkl.64.2022.05.03.13.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 13:39:51 -0700 (PDT)
Subject: Re: [PATCH v2 4/8] clk: qcom: add support for SM8350 GPUCC
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Robert Foss <robert.foss@linaro.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, tdas@codeaurora.org,
        anischal@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220503130448.520470-1-robert.foss@linaro.org>
 <20220503130448.520470-4-robert.foss@linaro.org>
 <YnFkn3CMS+VdJ9u7@builder.lan>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <e7935b8e-1e4c-a424-7d77-307e346f507f@marek.ca>
Date:   Tue, 3 May 2022 16:39:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <YnFkn3CMS+VdJ9u7@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/3/22 1:21 PM, Bjorn Andersson wrote:
> On Tue 03 May 08:04 CDT 2022, Robert Foss wrote:
> 
>> From: Jonathan Marek <jonathan@marek.ca>
>>
>> The GPUCC manages the clocks for the Adreno GPU found on the
>> sm8350 SoCs.
>>
> 
> If the patch is authored by Jonathan, we need Jonathan's S-o-b as well.
> 

Signed-off-by: Jonathan Marek <jonathan@marek.ca>

(but I didn't change much from downstream, I never submitted this patch 
so didn't clean up things like using ARRAY_SIZE, etc.)
