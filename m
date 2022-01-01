Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AAD54827D8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Jan 2022 16:45:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbiAAPpM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Jan 2022 10:45:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbiAAPpL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Jan 2022 10:45:11 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52DACC061574
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Jan 2022 07:45:11 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id w20so52066247wra.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Jan 2022 07:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=d71pYO3V8SeNE7e3U9/ie3peFEsbFkwFACoD1F6GGBc=;
        b=1S0FpfrOL/WmadHV4UyxHLzkUmeIjsClNkmbJRXM7OUnm7MnhiC9Udf3JO8eJ0NesD
         B+EId3NazNCx5hLVjEpTKBiubTf1NbA7IyI9ThezrwaQRw8O2Xdy1HDxU3w+66Z7XEv+
         bs2zm5qQ47IkhL3p3YEswpqtM33X9PwjfaJ7DSWJ0QVpqQtXAtZdCYV9h60ScC3uPblW
         r/+DsZKFNLieU6U4yqiwyIViJVWwAgrV74nzuIKw+EmbEE5/Js80T7zltBCxO7YM8/Gr
         dpD6fzMSjoRXoFcctzlKmVLn05bCXQ4zGj0Uu5Em6dvFjCJoSxusXYwTGEyPrRtyuQY4
         4xww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=d71pYO3V8SeNE7e3U9/ie3peFEsbFkwFACoD1F6GGBc=;
        b=c3GxAJ5n2Uuho/RnW4nPcllETUO+yqYTDOgNk09xNPrtOKzh/iIWruQ0U3SOcL8l8A
         VazRHMlThZL2+YAYareOST7g0l/ycy04cs+4ygRqkS0pS16d8AEe1SEmUwbhq2pp3oEe
         /nicLh1f2dI0M2foUZwWcFOhGZ4Kdr2SKsEM9NbjYgzUOgZOOOtRC0symRpW8KxX9MWy
         3GEqPuxgGQk7GUwp35JAKM+XatD4WXFIpSQeUK8+bSq8r5NZ9XwQNzjTiem0Scx1YKV1
         ROQYDza/AmnCLlb16p0o38ML6zJGm7srq9g+EDwpv+9OGR58qPmD6DbhEtEpqW0mRs77
         uvuA==
X-Gm-Message-State: AOAM5306t8LUfzHMiJUoj4liKZY+qlFn77DFVDyf9v5ARgEUIcX9DnBP
        LOqwzas3rCxtDV/ExsS0/gtWGD2irQRV3Q==
X-Google-Smtp-Source: ABdhPJyRvenCCdi/4tLrAof07INPBnr4WLARj5YD6rNUdLkG4XtOVA4aTuMQvuMEuUz9g6Megfip0g==
X-Received: by 2002:a5d:4dce:: with SMTP id f14mr24952306wru.336.1641051909820;
        Sat, 01 Jan 2022 07:45:09 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b19sm34507470wmb.38.2022.01.01.07.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Jan 2022 07:45:09 -0800 (PST)
Message-ID: <731e9571-5414-1c00-b6e4-a5316d287506@nexus-software.ie>
Date:   Sat, 1 Jan 2022 15:47:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: External data abort on ipq6018 gpio # 20 ~ offset 0x14000 any
 ideas ?
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>,
        Sricharan R <sricharan@codeaurora.org>,
        arajkuma@codeaurora.org, speriaka@codeaurora.org,
        sivaprak@codeaurora.org, jason <jason@wallystech.com>,
        linus.walleij@linaro.org
References: <cbe181af-402d-c8eb-3104-4ee48f8d525a@nexus-software.ie>
 <Yc9zt9vOWXTPZ8PH@ripper>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <Yc9zt9vOWXTPZ8PH@ripper>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/12/2021 21:18, Bjorn Andersson wrote:
> Unfortunately I don't know how to determine the list of protected GPIOs,
> other than trial and error.
> 
> But once you have the list, you can use "gpio-reserved-ranges" (a series
> of offset, count pairs) in the TLMM DT node to mark off these gpios as
> reserved.

Ah nice, worked first time.

gpio-reserved-ranges = <20 4>;

Well I guess its good to know there's no more esoteric explanation than 
"trustzone made it explode" - it only seems to be the one GPIO too, 
quite what use there is for TZ in this GPIO

PINGROUP(20, pwm20, atest_char2, _, _, _, _, _, _, _)

is anybody's guess.

Good enough for my purposes.

Thanks !

---
bod

