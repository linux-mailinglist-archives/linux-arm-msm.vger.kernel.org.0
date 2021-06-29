Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0613B7A25
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 23:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232997AbhF2V6Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Jun 2021 17:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235094AbhF2V6W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Jun 2021 17:58:22 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 621B2C061760
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 14:55:53 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id a13so881038wrf.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 14:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=F+tHr9nTZPsP/L41LDDEeXiY0HeubYowRUu2DqE1fyw=;
        b=pcQR2h7Jed2UG/FMm0+KicDSHQp1wQnG4gT3Cw429cEttDeFVP4vxP8XNPTvt8TmCm
         3/HrFR2/8V7MezHIZ64l2jcko73d2P2qQlkglgn8J2vfGI4nV1Opy85ZJYwlMJZGWnNZ
         gk2r6zIfgYVMYC40u0WuuQ2ADhaknYdgVSC6irQaLgB+4re64i7dc1YTcKV3SW/1uNX9
         K25HYwN938KnKITeYRSqrQ+7B5FrsRF4s0Vhxh37oNY1J3xmpiTXL7s98VKVDN1O66tb
         AMq58x98lGE3wtZtWllBAcG+6k7wVqXkk5eGFi6jxDh8U1p8SlGsrvKrKGGkKcvMSj10
         aTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=F+tHr9nTZPsP/L41LDDEeXiY0HeubYowRUu2DqE1fyw=;
        b=R+/JDHXb5s8vy0c/mNL1BSUDT7lqpAKGj9zX7x+tcbOiyAA+LiqVS1bGaNqtAE4UPo
         YParogXKJtU1ZiY8fhuWsLzcBYJSVUHPjt38lmSStvuZZhTZ9FfyG6lC60mwgXiWjRVP
         1lPSM5rmJsNpDg9RENlFDRaTQF/s+unukdv48MS0wdSyn73vyj8ziHvXTWmVNyN2ewaD
         33EK9FDeYsC9JnwPw7JUrhKJlJ7G6XKPEN0qr8A4hM1+/LFrFotcvsy464J4TuXP9Bsu
         84fzWuaEJnAZYzme1Skwp/pKKchQ2jK8UivSLD9R662gH6OvwzOM0SDTglYjTfZxBSN7
         4mrA==
X-Gm-Message-State: AOAM5318Wx2GmHsaV2sOG/sCWwFuvEiinnn9AEeLgLzCZ5NUHn14YxwG
        Wn0ljUwhUCbaulkavb7BYOTkgA==
X-Google-Smtp-Source: ABdhPJyugJMxao8ifmhKqSukK7m4MpSBZ4JJN1rKdHb5/H2Q6QsGd3+0ZAuIxvmTOtfSwwrHDUjokw==
X-Received: by 2002:a5d:5586:: with SMTP id i6mr16021895wrv.195.1625003751963;
        Tue, 29 Jun 2021 14:55:51 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id j11sm17830318wms.6.2021.06.29.14.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jun 2021 14:55:51 -0700 (PDT)
Subject: Re: [PATCH 1/2] usb: dwc3: dwc3-qcom: Find USB connector and register
 role switch
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jack Pham <jackp@codeaurora.org>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, agross@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        wcheng@codeaurora.org
References: <20210629144449.2550737-1-bryan.odonoghue@linaro.org>
 <20210629144449.2550737-2-bryan.odonoghue@linaro.org> <YNtAt3dCGGyj5DU/@yoga>
 <c63c286a-f7c0-0874-59ad-e9ee43660a33@linaro.org>
 <20210629200228.GE25299@jackp-linux.qualcomm.com> <YNuC0Njwr4B1Q1xZ@yoga>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <0f112cf5-1f71-f189-5a3a-2ff4dbcaa8e8@linaro.org>
Date:   Tue, 29 Jun 2021 22:57:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YNuC0Njwr4B1Q1xZ@yoga>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/06/2021 21:30, Bjorn Andersson wrote:
> I liked this, and it worked when I tested it, but iirc it suffered from
> the problem that the core's probe may or may not have finished
> successfully at the time that of_platform_populate() returns.
> 
> But fixing this problem would save us quite a bit of headache.

OK.

I will take a look at resurrecting the old patches either fixing the 
probe order - or perhaps using something like Wesley's role-switch to 
have dwc3 core optionally trigger dwc3-qcom

Binding tcpm into &usb_1_dwc3 instead of &usb_1

---
bod
