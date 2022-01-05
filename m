Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E010C484C10
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jan 2022 02:20:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236877AbiAEBUw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jan 2022 20:20:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236878AbiAEBUw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jan 2022 20:20:52 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78F26C061761
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jan 2022 17:20:51 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id v6so17901412wra.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jan 2022 17:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9xalqqeLJWhoznH730gHoRklFY67i4WMjmTACXd6duo=;
        b=vdNV8aTsXWyUl43ZMkTzRZMhBNIXtst976qxvRzMduwjkyPWKOKafdxvOvJE+Q/2Qj
         fBdwzLuj0wvCzzdRQXIDpQpL/IWckXHTI8nIn0DikUZGYgmZyTguExeWwtd4vNUtlg5u
         JZ9J+vhtB75vRKT55ieOdHww8NGg97saN5fWNokuZnjIE3QLpTkX1+ymhHxG1n0QRuMp
         9SHqlNWaAhxupngspuc1GEFrow1JfIqpLZ47GJiOGJqCjAYjXe4R5J39FHKS4ULTLjyC
         MUg5Aci/fhFsH1PRG0VF1hGyYaOndrgj3DkvVivvCEpgguEbg+aEMiOwdDmvKihVRA5P
         lBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9xalqqeLJWhoznH730gHoRklFY67i4WMjmTACXd6duo=;
        b=2wGCu5OGqWZljwQ3UfHjzodgfpuMnC7WKwqAjKsUwDE6MOlG2m9cn9Y8yisfIrrsOX
         DkYU0DVRMcu0vxxnipfYWRXGDo+QaawknqGhu7os//lZSFYXW6ZZcIeKRvrs8RoQAsiT
         yHLqAPQd2IabmLsFz7UhE2crSGwjETjNtS+Ca8/EMHLdobqxZf5iVncbTjyJXw2rkRrr
         3f+nPtRYr2EzcGWhA/bPMOKW3adtktZ28ZuJ7T1tfTOVx4Xodei0DK/Pkqa2PMzgL1Le
         gqomru6uGwHoUO74WCRRmv0qkJbVHl0OYQYTZicr0ijdVSk5MfsxVyWkQuTDBIp4mgbf
         dgWQ==
X-Gm-Message-State: AOAM533GY8lHv+PCRbRSybRkqupqfsXHizTiWM1Az7yaHrd4enZktBjF
        90I3bPFIjQeIS4o343LGLGRgZA==
X-Google-Smtp-Source: ABdhPJwsVvyYmKTCoGFPGB92Chsb4IQ1Hp3cBRvl3jH/KVnUYtM56Pu36vOHNHNXj3QK9sdrBO4Jzw==
X-Received: by 2002:adf:f904:: with SMTP id b4mr25751013wrr.457.1641345650171;
        Tue, 04 Jan 2022 17:20:50 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m3sm39467670wrv.95.2022.01.04.17.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jan 2022 17:20:49 -0800 (PST)
Message-ID: <c6eed164-32a2-13c8-9b42-fff6d160e058@nexus-software.ie>
Date:   Wed, 5 Jan 2022 01:22:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: External data abort on ipq6018 gpio # 20 ~ offset 0x14000 any
 ideas ?
Content-Language: en-US
To:     Kathiravan T <kathirav@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>,
        Sricharan R <sricharan@codeaurora.org>,
        arajkuma@codeaurora.org, speriaka@codeaurora.org,
        sivaprak@codeaurora.org, jason <jason@wallystech.com>,
        linus.walleij@linaro.org
References: <cbe181af-402d-c8eb-3104-4ee48f8d525a@nexus-software.ie>
 <Yc9zt9vOWXTPZ8PH@ripper>
 <731e9571-5414-1c00-b6e4-a5316d287506@nexus-software.ie>
 <2de144430c1acf7e0743adde7055926c@codeaurora.org>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <2de144430c1acf7e0743adde7055926c@codeaurora.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/01/2022 05:47, Kathiravan T wrote:
> You want to protect only one GPIO right? I understand that it should be 
> just <20 1>. Isn't the case?
> 
> You are using a CP01-C4 variant(#define CPU_IPQ6005 453, machid 
> 0x8030003). In this variant alone, GPIO20 is protected by TZ for some of 
> its operation since there is no PMIC. In other variants of IPQ6018, you 
> shouldn't be seeing this issue.

Ah awesome.

Thanks for the extra information - yes the PCB is a CP01-C4 derived part.

Appreciate the confirmation.

---
bod
