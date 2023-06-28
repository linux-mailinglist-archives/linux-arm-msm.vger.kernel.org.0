Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7C0C740ED9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jun 2023 12:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231911AbjF1KdB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jun 2023 06:33:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231219AbjF1Ka7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jun 2023 06:30:59 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B2C3187
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jun 2023 03:30:58 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fb41682472so5596304e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jun 2023 03:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687948257; x=1690540257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2yjde7uvJpnvIetvwdf/rJO/7zz/z+M7hDVzejCn/No=;
        b=Fi3Ig08DiBh6MOADTvKTYctzujkxkfP2DMPTsAxODxwl4/+tExcSpIyaRSEXczo9px
         oNjcjvbWtaNCCF6tE8lo4lgQJ3s3pYE610GXedAq31ot3mGJBNO5bcf/1a4vV1D8LyZj
         6A9ilZZkWOOgIuP9h7rlwmeedvft5bb943PkLrtUNE2GhE+w6fSEy/6Pt1or9UeISmGN
         6amLkjGiwu0tyEkMDdpYlA1gQ3pvkENbicgsODo4xyPxYUXzSbJqUXlAbHy7SsoMnlIR
         pw8BHq02AGLNwbAD3i31CdrkbouLIRe1/ODnio3s/b72cs/45WuU/r+LlLOPRuYJ7BDI
         Q2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687948257; x=1690540257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2yjde7uvJpnvIetvwdf/rJO/7zz/z+M7hDVzejCn/No=;
        b=eOrb7Fb/aHV3i82/ILQPT1MhHYW00mXS8bd4AA8nundG6XUP3GpL6bbAZAXpR0Mg6P
         2MnAj1mEYqo37jHby7+9tswjLFDssWupDR2ZZN8n3pDO2S38COYXpadsqSXghzqSwfcW
         XG5MlMBuHWefWj0Fk7FV7PD182obnZsoG5WWDNBwEZERS2apYB/bqQI3NpD+HZ6NRefJ
         A1CVhIBNZDA6JZFIA2Kly5HSBU/VQAxA3GFcb/yOQg7a61z5ydkqNjQaMDFfY4aOkZLY
         vp4tc7j1UTKLWtrpZxJIg1Ls96TeT6T35UQW5JugIjVBowvUn4p2R9YaOxVXscyTvZJM
         59tg==
X-Gm-Message-State: AC+VfDzqVNT/BPuGo1DJpiUmhC5GEw6CZ7/cqqCU3e+IjaXzdnCVE935
        0JGrBQ7jeB024RTd3Em26pndRQ==
X-Google-Smtp-Source: ACHHUZ43X/G7AlYSS9jOolHCT8V/mJjIPibsyGh04TzTNZ4wenhA9BX7ssz2y/gbVFGcYnaTDQPg6A==
X-Received: by 2002:a05:6512:3f0c:b0:4f9:58ed:7bba with SMTP id y12-20020a0565123f0c00b004f958ed7bbamr15195161lfa.16.1687948256868;
        Wed, 28 Jun 2023 03:30:56 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 10-20020a05600c230a00b003f7eeec829asm13455675wmo.10.2023.06.28.03.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jun 2023 03:30:56 -0700 (PDT)
Message-ID: <e2e60068-02b4-2410-70c6-edc866e8430d@linaro.org>
Date:   Wed, 28 Jun 2023 11:30:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PULL] Add Audio topology firmware for Qualcomm SC8280XP X13s
 platform
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-firmware@kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Brian Masney <bmasney@redhat.com>
References: <9d59b054-76b9-9c8b-0be9-c614742c519b@linaro.org>
 <CAA8EJpoXvL3rADU18AyEH_gPNXZH=odoUCVEnxgQ7vaxEYqvpw@mail.gmail.com>
Content-Language: en-US
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <CAA8EJpoXvL3rADU18AyEH_gPNXZH=odoUCVEnxgQ7vaxEYqvpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Dimitry,

On 21/06/2023 15:17, Dmitry Baryshkov wrote:
> On Wed, 21 Jun 2023 at 13:55, Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
>>
>> The following changes since commit 045b2136a61968e7984caeae857a326150bfe851:
>>
>>     amdgpu: update DMCUB to v0.0.172.0 for various AMDGPU ASICs
>> (2023-06-20 11:50:21 -0400)
>>
>> are available in the Git repository at:
>>
>>
>> git://git.kernel.org/pub/scm/linux/kernel/git/srini/linux-firmware.git
>> sc8280xp-audio-fw
>>
>> for you to fetch changes up to 85d1739e5aafcfada7a1e847c258217bd7408a5c:
>>
>>     qcom: Add Audio firmware for SC8280XP X13s (2023-06-21 11:11:34 +0100)
>>
>> ----------------------------------------------------------------
>> Srinivas Kandagatla (1):
>>         qcom: Add Audio firmware for SC8280XP X13s
>>
>>    LICENCE.linaro                              |  30
>> ++++++++++++++++++++++++++++++
>>    WHENCE                                      |   8 ++++++++
>>    qcom/sc8280xp/SC8280XP-LENOVO-X13S-tplg.bin | Bin 0 -> 24296 bytes
> 
> Could you please move it to the directory with the rest of X13s firmware?

Makes sense, I have updated drivers to get the firmware from correct 
path. I will send a new PR with suggested changes.

--srin

> 
