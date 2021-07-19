Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 184DB3CF02D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jul 2021 01:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355565AbhGSW73 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jul 2021 18:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1441834AbhGSWN7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jul 2021 18:13:59 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90D83C0613E4
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jul 2021 15:44:00 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id i4so9219357qvq.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jul 2021 15:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BexLyXxqNgeH8/vtZRd1j76orcTrxVviC3YXV+o0bIU=;
        b=rUKY6dgXGsT9UEM8m0qXqyXgqg3Jvssnctaum8JQUHTTxXI8ZFNftfT3Ac5KN/GUYR
         CLIgTPXqEXTzC7W2v3r4/X/plmYq/pp0UlUqfQPBrUBIDyId9ahQZUXUdLoAuUb2Hgdz
         Jkrqra6S/86H+6zdTn9JfnCpFmvBRoeJbcnAbCRzGOh5nUzdJsadBNOJjT/C9GX+Rr3e
         Vlw4LKevADefwIj/pGEzSJqQoE9FhfNqMdWWV8qJBUMali+mS4eZl1ApAUM0aDYxY/32
         n4JGVQ5nMtmxNnbmPvOOST0d5J49owen5t47D3Ed60PR4JkC9E+bxwRHUMxGgUZAVI2U
         jkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BexLyXxqNgeH8/vtZRd1j76orcTrxVviC3YXV+o0bIU=;
        b=ACTZt9lN1qRJs/oZGA3JD40kDA0B3aqwM/GiR4KiJTgOZMcIwctYN19F4Nujb8D9O3
         /vJ0CoDx10p9reTpx8G4iOlNbYJdysDbFQa/xoc76zvBtZn7CmPhMAsBK/SuzQ/ik78E
         IwTrGXUCfY+FS7BqOdg4yHiVbMRomy5pCScnnBm7wgGXut1Q/ic5XK/hujQ82Ln7QZxr
         p+iMdiW5LxXqAdrr7DDPnfYMTjRzB3Gpl36QN4J8zU+u3gFgtlWKCQ8qpH3jKspwWtTC
         QJ6ZgefRLBmGKMy5ykKBbDtnznykNsk5aj6sT8HeDGvGg+XHqvvtEZ9zx5i/QObU7Nhq
         743A==
X-Gm-Message-State: AOAM532ZRSwkcG5wOUjkpiO3xToXBD3QruEJLllPhmVaJsiW4Nqgh59l
        sfmufVcVLojWO//ImL4kzhW4BtCUp1sVTA==
X-Google-Smtp-Source: ABdhPJysNyiNCLBggwYBSqT5tdYTt6rxSTZj+yTVDevRWw2of9y2Rhyra1Xn/hSZQ8F3riYqEyeR1g==
X-Received: by 2002:a0c:f48d:: with SMTP id i13mr26725618qvm.24.1626734639691;
        Mon, 19 Jul 2021 15:43:59 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id r16sm8710241qke.73.2021.07.19.15.43.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jul 2021 15:43:59 -0700 (PDT)
Subject: Re: [PATCH] arm64: boot: dts: qcom: sm8150: Add CPU opp tables
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210714182610.92972-1-thara.gopinath@linaro.org>
 <YPWlXRDsU59LZsVb@yoga>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <3803b17f-47b3-ed99-eb90-d7998ea5c996@linaro.org>
Date:   Mon, 19 Jul 2021 18:43:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPWlXRDsU59LZsVb@yoga>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/19/21 12:16 PM, Bjorn Andersson wrote:
> On Wed 14 Jul 13:26 CDT 2021, Thara Gopinath wrote:
> 
>> Add OPP tables to scale DDR and L3 with CPUs for SM8150 SoCs.
>> This gives a significant performance boost for cpu-ddr loads.
>> Below is the results for mbw benchmark with and without the opp tables.
>>
>> /mbw 1500
>> 		Without l3/ddr scaling		With l3 ddr/scaling
>> MEMCPY(MiB/s)		3574				10448
>> DUMB(MiB/s)		3500				11721
>> MCBLOCK(MiB/s)		8976				23595
>>
> 
> Nice!
> 
> 
> Took the liberty of dropping "boot: " from $subject before applying the
> patch.

Thanks!



-- 
Warm Regards
Thara (She/Her/Hers)
