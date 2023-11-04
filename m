Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEBCB7E0FF7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Nov 2023 15:54:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbjKDOyx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Nov 2023 10:54:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbjKDOyw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Nov 2023 10:54:52 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3C471B2
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Nov 2023 07:54:48 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40842752c6eso23492825e9.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Nov 2023 07:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699109687; x=1699714487; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ePAiCXD4myYSlneZrI6yx99/p4yktpbu/ARn0j2oWo0=;
        b=taO1HGPq/hyK5CgiKdkxmC7+Bx8qEd24gjmi9RrOFass8MYilD3HAglAMIMnN/YPdF
         wSpGWU2fms9wGaiMdTBWrYZFT6UHyiB5XCUbIqohtFfFJog5qvBE3dcpDoLIimNvaxkl
         JRMchycR8LadkpMM9dfOC9TMbCWrYunAiptJlyfU8lp1a10PBBmyVxgTz08nPxeoRhPR
         9cx2MDwoTFeMCBp7/EhSPh/cXx4zp2OQjOwtSRMvV1LvfXp/P65acd23EPY4iwbCKWBP
         oHVV5zICOdIBL3p8JdMv63cVP8TbGy7JTqCy3Q0CWrLSISjenMuAudMnvkACi2EbPRw4
         ykUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699109687; x=1699714487;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ePAiCXD4myYSlneZrI6yx99/p4yktpbu/ARn0j2oWo0=;
        b=VFYNQ9nn/+WeO8PLPs3PSgaod3NG24F9Dmlzdy6TjeZtI9lKQD52XDjQZbrf/XwpT1
         ucA73HqwfQRSeT+yMsJsMieuLxoMu2wqecXFlmtbIYqTiCVpnbH/cGI4h2WTFBgwq9iR
         /TUTWM77dO/iOE18fjNi1we4pDa9b6HXV5aCTbBPEZpZYaLXEXMYnVpPkRDei53RN842
         RBCt4zShQjaASAP+t9w4HBizm1gcOAr0IHJ4XgybGg0yWKzQSmoldNg6tkfcCfRWAugr
         ErHAeHJl6bEc9B4IvuY65ZROb9kUpWIxCYKjRc6+mcQJNTjyKl8GK/nrzdYv62RkDk/d
         hGlA==
X-Gm-Message-State: AOJu0YwXnE/UFBbLeayhC5IBDX84X/Z1Xo8uY8HPmB2X2SLzGhOK3wO2
        1mWDEd1H3YE780IXhw61RkHwQ4oUDDN4aWmz57xZ9Q==
X-Google-Smtp-Source: AGHT+IH9kZiQP6YJt+A0eL733T3J5BZc0iofbKyRaibsf0cxrGcxWKW3FD5VKxorOTt9CLl/621dyg==
X-Received: by 2002:a05:600c:5110:b0:405:34e4:14cf with SMTP id o16-20020a05600c511000b0040534e414cfmr20597468wms.4.1699109687164;
        Sat, 04 Nov 2023 07:54:47 -0700 (PDT)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id p6-20020a05600c358600b004053a6b8c41sm5929799wmq.12.2023.11.04.07.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Nov 2023 07:54:45 -0700 (PDT)
Message-ID: <a3c7b627-ca22-43ce-89f8-48a26c5df34f@linaro.org>
Date:   Sat, 4 Nov 2023 14:54:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: External display on the x13s?
To:     Bjorn Andersson <quic_bjorande@quicinc.com>
Cc:     Brian Masney <bmasney@redhat.com>, linux-arm-msm@vger.kernel.org
References: <ZUUrMm1Q/PI5xv6a@brian-x1>
 <181bdfdc-01ef-4e60-ad62-623884cb3d6a@linaro.org>
 <20231103185309.GW3553829@hu-bjorande-lv.qualcomm.com>
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20231103185309.GW3553829@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/11/2023 18:53, Bjorn Andersson wrote:
> On Fri, Nov 03, 2023 at 05:37:36PM +0000, Bryan O'Donoghue wrote:
>> On 03/11/2023 17:17, Brian Masney wrote:
>>> I have Fedora 39 running on my x13s (with some minor tweaks to the grub
>>> BLS boot entry) and it has working GPU, sound, battery status, etc. I
>>> see the external display port in the DTS, however it's not working for
>>> me. I have pd-mapper and qrtr installed. Does anyone have any
>>> suggestions for enabling that? dmesg doesn't give any useful
>>> information.
>>>
>>> Brian
>>>
>>
>> Run gnome and run the display @ < 2k
>>
> 
> Brian's question makes it seem like he doesn't have any display, your
> <=2k only relates to the display artifacts that you have, right?
> 
> Regards,
> Bjorn
> 

Well its funny you asked.

I had an idea Gnome was working but lxqt was not, testing this a bit I 
get the second display up if the display port is connected to the port 
furthest away from the screen, not the port closest to the screen.

 > 2k artifacts persist but

- Gnome
- Gnome Classic
- KDE Plasma
- lxqt

Give me second screen up on Debian sid ~ reliably but only through the 
port furthest away from the ESC key.

Plugging the cable in and out at the gdm prompt seems to crash gdm.

The best result for me seems to be log in and then connect the cable 
furthest away from the screen.

I don't think the WM makes a real difference.

---
bod
