Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 863DD4884DC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jan 2022 18:11:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234736AbiAHRLu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 Jan 2022 12:11:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234721AbiAHRLu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 Jan 2022 12:11:50 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 933E8C061401
        for <linux-arm-msm@vger.kernel.org>; Sat,  8 Jan 2022 09:11:49 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id q8so17594180wra.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Jan 2022 09:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=errgQGoSWoJKgRfpKuU6ns01z7SFCF9MqHJoZZAlM6I=;
        b=y3CVkWhnhNf68LS9k3TvOq4xcC1KpREOgJv2vegpR4ZmE2+KiJt681TzQe3+R+Hlzm
         flpdyoEyoTl+tHtgDxy31Yg1ZtBpjBJh0FMVi8lgncPql5VADJsYKil9L1O3cRgrgpyp
         js5KthwUsP/SKsZ1tRxbvoE02VuskDLKNQx3VXJANzNOEovPWHr6TESK+I84sHyRexm+
         4LPcLAKcO33y45BybE05UoyS+saM8inY4HTYRBA4Ix79+3v0h0RmqKbZx4BQo6O1AKFs
         JvrNKBTtNTq3UuHmOQnADAjesDOufnUkhYXcxHK1sOXjdw/9429iM7o8U3M6TKYy91WO
         un+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=errgQGoSWoJKgRfpKuU6ns01z7SFCF9MqHJoZZAlM6I=;
        b=fgJOeUDBAgd2/uDaqHrT6w/rsz4iEG4PIxTXGbap522DqjP/QFWrONbbYr6oQ4peen
         n92zGThxTwj6JoEJOZ8n8+/VZHv2O3WxCc8/XHLZsa3ipiQ7rFYSbCM4gCDy+xtK7apR
         1MVNh3KjNWAyGmTb4X/keIffy6x344zIF6wCDrBYMXW8XmCvNtOxl7ZAHf3sLMMzcyro
         W7fY5b2sv6Xk+UUhBPaJufafzGx6K7Kj8k+jSSjFP9xbisDnpWk8ajPJA5kAPooKqBW+
         WiOHcUt09bUpKZ/zTVQjzifXDbBJgIsMPCuTkbOXbI7gT/KysgMnwASbpG4c6aNofi/b
         njPw==
X-Gm-Message-State: AOAM533YwYIVb07I56CghFHkaMfE+f6TfIrIyJevAi1jc11C1pl6e8S2
        rZ1XSMTCCgOolSWyUdzIHlQfag==
X-Google-Smtp-Source: ABdhPJzv/dLwdlC2ogtExObZdYlsZjxeoqvTUc4uXJgfQFuU194C88iaoYw1aUzbPL8bi6fMuSN7Ig==
X-Received: by 2002:a05:6000:1d84:: with SMTP id bk4mr2351855wrb.708.1641661908141;
        Sat, 08 Jan 2022 09:11:48 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id u10sm2121956wrt.11.2022.01.08.09.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jan 2022 09:11:47 -0800 (PST)
Message-ID: <1b4ec5d1-65e3-2088-cce1-3ab88c0a0122@nexus-software.ie>
Date:   Sat, 8 Jan 2022 17:13:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 5/7] media: camss: Add regulator_bulk support
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org,
        jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, jgrahsl@snap.com,
        hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org
References: <20220106235540.1567839-1-bryan.odonoghue@linaro.org>
 <20220106235540.1567839-6-bryan.odonoghue@linaro.org>
 <YdiaC9eS05qna0Hm@ripper>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <YdiaC9eS05qna0Hm@ripper>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/01/2022 19:52, Bjorn Andersson wrote:
> When res->regulators is empty num_supplies will be 0 and you will get
> ZERO_SIZE_PTR back here, so this works just fine - but I had to read the
> code to learn what kzalloc(0) returns.

Literally as soon as I hit send I realised I hadn't tested the NULL 
case, then did test it and found this behavior.

> Perhaps it would be nice to be explicit and make the allocation
> conditional on num_supplies? And leave csid->supplies NULL when this
> happens?

I'll rewrite it, agreed its confusing to look at.

---
bod
