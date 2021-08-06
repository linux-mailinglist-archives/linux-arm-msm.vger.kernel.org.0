Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9053F3E2EB7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 19:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237508AbhHFRDV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Aug 2021 13:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235555AbhHFRDU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Aug 2021 13:03:20 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AAFAC0613CF;
        Fri,  6 Aug 2021 10:03:03 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id h14so11893983wrx.10;
        Fri, 06 Aug 2021 10:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ry90ENKPsYIpGExDy1ZF1IVXMmwBeF90JsJopXkAmdI=;
        b=PGCsnDqIzxO8nkcTh9TUrZKbU2QHXJZsh87b3VLIEkbg6prQuU45RLKKuS7ZAOj6v2
         02rApMWyFHocSzlgRR0+FoR9yfoBueg8cgTR3uK7HaEMFQBZXh+EqvhT6xI8nQi7wKJv
         3gFyj82vjg4znvyDI45YfX/nCmHPkephua5pXU047n5TWj9hYq0Sx4o2lWU64VIDxoje
         whNnHN9lGN5cMfTveTCKmeyDUonqx0VFN4klLmHjo0FRPVHQIKgi6yTavpu/GZy1PJv5
         vG07dLzcjCwd3tKaQ7XTXSTZUTt0go2KK/18YopPUwaml5GRgHe56oTFXMIdpq91v208
         fR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ry90ENKPsYIpGExDy1ZF1IVXMmwBeF90JsJopXkAmdI=;
        b=Gvq2/y4pFgiXCJU3lbLlozuEKjFfSJG7WbwSXsnRzF/r+xEVdu6kJXAaG1nQAPhx3k
         IoMh3sDT1wo6Ns/SJYS7t+hHHe3AC9wqod/5CKjxr9Ch7I7GN+7gpZ8OdcH5CrtcDwAr
         7YCbqnVGFK+W1I10uZTR7UXwW5xLUey28hcYVcD5yjlkS5H/cw1zxGi/HeZCw3oJa+ga
         OcQorzhciqirtQ3MSN6qNv1duBvwQcbT3MmzU9P6f0L7YLOKKmCh2lQ8m6KXMXX1zdaH
         kxyVybHLhu/sIs2KGF48b6zmpOz6jNmXKngzo+hTzWj9hs98SY4JwelopfI2EDqGJEoq
         crAQ==
X-Gm-Message-State: AOAM533vDkYskf07tfZF14cJEHiW5zYsI0+zCNhaEje+0nCvwyf5kcos
        Bd2EhdTWZwYSDbUI/NUutwudVRcVj1Q=
X-Google-Smtp-Source: ABdhPJwmqZ3gJaD/WzTPk4XMvORgHGG53THT9WtxsPcNejgkGmoo6xNkSoPMQ1Qf5UhB1LLTL5Wd3w==
X-Received: by 2002:adf:f707:: with SMTP id r7mr11515538wrp.175.1628269382314;
        Fri, 06 Aug 2021 10:03:02 -0700 (PDT)
Received: from [192.168.74.110] (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id j2sm10435637wrd.14.2021.08.06.10.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 10:03:01 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] clk: qcom: smd: Add support for SM6115 rpm clocks
To:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20210731164827.2756798-1-iskren.chernev@gmail.com>
 <20210731164827.2756798-2-iskren.chernev@gmail.com>
 <162821413782.19113.1911724221661020342@swboyd.mtv.corp.google.com>
From:   Iskren Chernev <iskren.chernev@gmail.com>
Message-ID: <b4abb286-08f8-b7b3-a163-d2d67c72f7b3@gmail.com>
Date:   Fri, 6 Aug 2021 20:03:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <162821413782.19113.1911724221661020342@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8/6/21 4:42 AM, Stephen Boyd wrote:
> Quoting Iskren Chernev (2021-07-31 09:48:26)
>> Add rpm smd clocks, PMIC and bus clocks which are required on
>> SM4250/6115 for clients to vote on.
>>
>> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
>> ---
> 
> Applied to clk-next with lots of effort
> 

Thank you! Now I see - the clock defs align perfectly with 6125, you can thank
Konrad for suggesting to reuse the defs, therefore making any 2 patches
conflict due to clock reuse.

Regards,
Iskren
