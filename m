Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 372183049D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 21:17:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732343AbhAZFWh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 00:22:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728489AbhAYNEw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 08:04:52 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BEE7C06174A;
        Mon, 25 Jan 2021 05:03:45 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id r12so17829236ejb.9;
        Mon, 25 Jan 2021 05:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5BtAz/bpqn5E3fKEbGDIqpaPzkxzUwSHMlIJU+EClb0=;
        b=XzpCnQQWDyE42zz/8z0OjMguAGw1ihehqyESZVWYsnWQI6ax9813rW9GOFmn254QAS
         MXgJmPIhpSbHwIsa8Hkqx8KklsrWj20TQU5pHTB59GA+gnCIcYbr9qUtlTKzUD9u1aLI
         kv3w6sE0KkqsVfKirCnEGqmoL3Wiigwv38wv/T7fuZs83brjLpcjmlqQKj0OVTdoJelS
         /CAEjphsAdKz2SE7iDMtnNNee0qHA9Syoq1J/Uea7ow+XJ7IFBA492zI2iSV8vksUBZ0
         xcG/2/TDuZvFwzToPu9r0hhP50AaoOW8C7NXyqGnVIDTop+3HFn75wxigohLuYfY+cI1
         FVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5BtAz/bpqn5E3fKEbGDIqpaPzkxzUwSHMlIJU+EClb0=;
        b=lVhJfm5nwg0piYkkD7iY1Xcp7kgxleW8KqNZA54uP8o5V5bqo4y5CzVcKM0T3bvKjR
         YXbCMlZy+SuidzNwIw3fLeTUy8PbGu3W/NmCPajbA4/eNo08V9G3mN1584fomrjDj4fP
         UHsVegenBdXursZo8UH4AeUheduQVCJQJoDkX82eYB1Wmf/cI8BS8db/vANSY/bDGaQP
         9rgbDA1LM7cGs0/PWsW5vPZ8+XntInW7PxqtidY4GNx96lW8owDl8JGx6aPFmf+1jeCB
         5FreqYBOgM+LktuPWR/NvEK4Dx3xViFxSIbDmLmeylJrF+YvYKIycexMSptNw5teRked
         eT1g==
X-Gm-Message-State: AOAM531ZF/YD7tuzQXMYhgWUfm3fDq9xzBstpmtnYw+Scu0LNS4ZgZgL
        2d98YG0mABBaGDSkZLvJY5QLqX3BIQ+esg==
X-Google-Smtp-Source: ABdhPJwPrRzjjiIXXpH8oj4ahx1fjvueIZ6h1f1UhC2xPD8O5Q7iFPsAWpILsXO5lDPpcY4RcoK7wQ==
X-Received: by 2002:a17:907:2458:: with SMTP id yw24mr278853ejb.333.1611579824230;
        Mon, 25 Jan 2021 05:03:44 -0800 (PST)
Received: from [192.168.74.106] (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id w4sm10443005eds.40.2021.01.25.05.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jan 2021 05:03:43 -0800 (PST)
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8974: add gpu support
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Samuel Pascua <pascua.samuel.14@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Brian Masney <masneyb@onstation.org>,
        phone-devel@vger.kernel.org
References: <20210124135610.1779295-1-iskren.chernev@gmail.com>
 <20210124210527.GB27676@amd>
From:   Iskren Chernev <iskren.chernev@gmail.com>
Message-ID: <14a9bef3-bff6-1f25-7a15-485277b0b1ad@gmail.com>
Date:   Mon, 25 Jan 2021 15:03:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210124210527.GB27676@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/24/21 11:05 PM, Pavel Machek wrote:
> On Sun 2021-01-24 15:56:07, Iskren Chernev wrote:
>> From: Brian Masney <masneyb@onstation.org>
>>
>> Add support for the a3xx GPU
> 
> This is phone, right? Can I ask phone-devel@vger.kernel.org to be
> cc-ed?

CC-ing phone-devel@vger.kernel.org.

I'm not sure why you didn't do it :-/

>
> Thank you,
> 							Pavel
> 							
>

Regards,
Iskren
