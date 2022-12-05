Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 561EF64272C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 12:09:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbiLELJT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 06:09:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230012AbiLELJS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 06:09:18 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C898272D
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 03:09:17 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id r26so15208916edc.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 03:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwfUzflGu1+z0kHjmPww1C0Zp4cmqkMxpg9SKp1UOmI=;
        b=twUIUHoD4Mzqf8n/F71EPPBOQAktxihqjY+bfaV2h3TxSuyTOe3ODSJoyrWC7JyLqJ
         t6T+bGGWxPImCubtvCy4HphHDnBuZlM1DXji0d33YHmMUR7/tSzesKsiF5XoBeHyCgV3
         D1Svsm5+kcrFB2c1yFpMikT1obSNif+UUq5b3y/fnZfWVWTtYbdkhTHEg4rGOZ/NPMts
         Rym61FupYStWIzuc0vvNuOTG8JOZL2la3wTQY1IyMZfduCdWh7QLB7ApFHILfidFpyMP
         STlg3bqZ/b11kirdvtoLT4ymJkqj9gVFRsU1wsmdksWmLIDx8kFcum099AvyY5tXuhzE
         dOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FwfUzflGu1+z0kHjmPww1C0Zp4cmqkMxpg9SKp1UOmI=;
        b=Lm6NUzKCztCY3h9JVrdQX/9BJ89KSEQwR7ws8V932CPdVcsqSbNZJ31wXF3GmKEBjo
         byA/L/KG6TosOpS/qp/F5IUy4KnJ0Bw4IJzkHvmxU91LR/acU9OAVHLLFE7QOQJEtP5W
         CjS7ibAmpu4lc1IOjgiBP4io4osPvdu7+fnOv6MAZQ9vms6zZs2kzuMNyIZgOdUQ0eo3
         sWed4N1ED2Lvy/xEGobjcQ8WyxHMx6FQipaQJ+/zAXHy3XgPku9QPWUI2pTdSZFDMQD6
         eKscVNfOGyWYFxwCnN6DSjVTaWBB3OPulHpCbJGFUhfSBV65d9u8g2qIQElMEPexg2bs
         Bk4g==
X-Gm-Message-State: ANoB5pnzGE1hOzYkQbN+b6n3ZlT52YmcUyDHr2I5EUMoR//ZwWVL5fRk
        RHh5D30Q2Qh02vbNYBOA9qangg==
X-Google-Smtp-Source: AA0mqf69ODOqMulw7Mj8mxJDLpUgqbnk8OoxUwuSacbG0HGb7Y9L0Nkc5h0egNoD/7CH1ox3dBY4Rw==
X-Received: by 2002:aa7:ca4c:0:b0:46c:24fc:ba0f with SMTP id j12-20020aa7ca4c000000b0046c24fcba0fmr12258232edt.140.1670238555590;
        Mon, 05 Dec 2022 03:09:15 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id o7-20020a056402444700b0044dbecdcd29sm4632097edb.12.2022.12.05.03.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 03:09:10 -0800 (PST)
Message-ID: <2cf45767-7974-3b40-fa18-ec33db5d5ac2@linaro.org>
Date:   Mon, 5 Dec 2022 12:09:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 1/1] arm64: dts: qcom: msm8992-lg-bullhead: Disable
 cont_splash_mem
To:     Petr Vorel <petr.vorel@gmail.com>, Petr Vorel <pevik@seznam.cz>,
        Dominik Kobinski <dominikkobinski314@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Bart Ribbers <bribbers@disroot.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
References: <20221126010531.466046-1-pevik@seznam.cz>
 <CAB1t1CzmNK8i0qT43qVw7VGUPVi67Up6QU-kYDoEsrV7=N7u7w@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAB1t1CzmNK8i0qT43qVw7VGUPVi67Up6QU-kYDoEsrV7=N7u7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 04/12/2022 14:16, Petr Vorel wrote:
> Hi all,
> 
> 
> I got reply from Dominik that he noticed dfps_data_mem (reserved in
> msm8994.dtsi) overlaps with the framebuffer region.
They are usually next to each other..

> I'll retest it next week, maybe removing it instead of cont_splash_mem
> fixes the reboot.
Maybe your bootloader reads it? And needs it to be at a certain address,
maybe with a certain node name or a label?

> 
> He also noticed, that Linux doesn't reboot when loaded from uefi (his
> project [1]).
> Not sure if there is any difference.
Is it loaded with this DTB or does it rely on ACPI?

Konrad
> 
> Kind regards,
> Petr
> 
> [1] https://github.com/Dominduchami/Nexus5XPkg/
