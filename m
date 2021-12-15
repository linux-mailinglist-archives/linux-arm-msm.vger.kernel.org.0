Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CEFB474EED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 01:12:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234660AbhLOAMj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 19:12:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbhLOAMi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 19:12:38 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69F55C06173E
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 16:12:38 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id k23so30812708lje.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 16:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zAjAMQVShjcCOaBYyRGNXKWRjBrsW1noh9beLLTMUjc=;
        b=cAGK2Y7u94l/HgJW5AdpmzrUdVP1cp5+tjGnMGvpBNSMuA75MW5jJF53/tRbNip6UX
         3Eymtg+5WcTuF6KBM05gm87AezSTEY9QNdjuRUEiXC/bxuirGKFNXvIp/aFfDoFbT8xR
         vR85cNI//yCA1xHMxNYiP1TKxExx/AdsTORGv6ttnq2IRhj+YdcCDYwQCTCunJRS33fM
         GJuFrjrktAGa2f4VOOMcI+jconsCcku1/6a4lUxXLjdr57x2hmX4w9PkPUqP32bGoQy8
         blzgWazw+mYTRV101YvEc8Jc4pEVfYrglxt2f171d5ZT/ujGFNq3ZtiITkojt2zFtJV9
         +TeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zAjAMQVShjcCOaBYyRGNXKWRjBrsW1noh9beLLTMUjc=;
        b=fuGjRVoKXQ7gyQ4Zpf7kTKDG0Gd/Q93h0Ft8HrAYPcFAMhD/lwkBbwzEhv7ZTAQ9IT
         33u+tI5pOP/JD95G4crZOFmTA6lQ0BtEP1jYQTUoshAPVPzek+wpdTqL53JgFwinylcW
         NEVuKBcAlZoxs5zehaEGUWx+xYdEBux28/XOZVdQY7MqpTJnCBcAOrl5plFEqlQUinLn
         rn33fNryQFO4hj8h4S4C6t63ynK46n/5xBn/Whyk9E+EjKuuMRWyYHFElMRxIV5Yu6nj
         624WVjbpfpja6OyKzOj1l8gU6AkCtmnvENsoQvHPePjLRMSJvE8fTnalWjC71UvKJYzH
         lW+A==
X-Gm-Message-State: AOAM532MRaGyik3XpXVaFKVo9Bh08KEqWAdm5KH7OOdqkJQpOJXaOvbJ
        Mmmjw7UpZ0Unoyl+u8KiqlZdsg==
X-Google-Smtp-Source: ABdhPJxGjxdHWEJWsOj5EGq6SS5HKquCVaUC/ZfjhceiK9vwnOdy7xxROfSJOSLOlCg8n7ZLwjLnvw==
X-Received: by 2002:a2e:e1a:: with SMTP id 26mr7758125ljo.199.1639527156576;
        Tue, 14 Dec 2021 16:12:36 -0800 (PST)
Received: from ?IPV6:2001:470:dd84:abc0::8a5? ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id x25sm40690lfe.69.2021.12.14.16.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Dec 2021 16:12:35 -0800 (PST)
Message-ID: <0750dd24-1e84-6fb7-eb4e-9ab07d05ec62@linaro.org>
Date:   Wed, 15 Dec 2021 03:12:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 06/11] clk: qcom: camcc-sc7180: use parent_hws instead of
 parent_data
Content-Language: en-GB
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org>
 <20211208175430.1333594-7-dmitry.baryshkov@linaro.org>
 <20211209081131.8D886C004DD@smtp.kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20211209081131.8D886C004DD@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/12/2021 11:11, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2021-12-08 09:54:25)
>> If all parents are specified as clk_hw, we can use parent_hws instead of
>> parent_data.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> 
> Is the code size smaller? Would be nice to add that detail.

The bloat-o-meter reports zero size difference.

> Reviewed-by: Stephen Boyd <sboyd@kernel.org>


-- 
With best wishes
Dmitry
