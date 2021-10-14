Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E4B842D684
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 11:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbhJNJzu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 05:55:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbhJNJzt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 05:55:49 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8440C061570
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 02:53:44 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id y15so24482962lfk.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 02:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/KsJRdiob87Ja5PgF5X/ti+BR7dI5FBOZcD9kz6Ozto=;
        b=h9409aXB6YV05xq/pABEkmxSxFhTfpqrruXdlc5z7R9nLrph5NnzM/EBjSxJ9VBEd1
         6NMrB5sswM/Ks9ujE5TeT+LdGjhG5OW/Sthv0VyCQ+5TDGCWjs3BSdQpHqLJR32u/IVy
         3yA7DnbG9F5PlUNRf80NI+u/iJrs96xdUBoYX07isyy2y2gEVggGj6uEw2GiV0+H3vCm
         DLkuhQVpOZ2Epai5CX0uonVB6S/iAKC0NtfkPPQdQlX2OHtmG+crZfWual8sefpN/EVe
         CILMtmLbkDVMdRNOJKLfW1mb3VJ5MpatvmEAXlRj9OHXTVA9YNMAOi0HLak+NWmk/Vjg
         WwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/KsJRdiob87Ja5PgF5X/ti+BR7dI5FBOZcD9kz6Ozto=;
        b=6LgUh/gdJr4+Dyx0izbcePCIWoRiBEdVFxfIftcRKpXBzXGCThccCUmHRqo31u03bJ
         /D/I5AgX6p16toRsvhYo6b/gLIIS7/hDBsafC/ulEm9V8/7pqxylbjq2WyJK8iC0zKUv
         VfJ8IMK2WHTgwFpqWKikjxTYTGKJg/tcU9tEqkinGUA6f+4WMFZMaqbfqZQkWvhraM3I
         UWqosyFvYt+H6cOiElGj3sA9laHDC7E2KpFqzXRj6WtTCtb2BO3asac7ajfDMc4lC+bV
         r9wAFiFF21cj0lbP+hWurtwZgrWSg89idl5A3/ma9pKiyNreNJ0+Vbt/HqFWNFN1kXCb
         bzaQ==
X-Gm-Message-State: AOAM530YYaiCCjzPT6hbJVvh8TiJBplESarEoofLlHI+k7NKNUm9dzjo
        Y3W8wV/bCadVCxizXSNxD8yWow==
X-Google-Smtp-Source: ABdhPJyyYEu0EPxRrb37K9hW8OcK5o+4Jwzf2jK9MJng9VLqg4T97Er87U0t4/FYgeISUNHmm0nAUw==
X-Received: by 2002:a05:6512:b08:: with SMTP id w8mr4024902lfu.505.1634205223215;
        Thu, 14 Oct 2021 02:53:43 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s11sm181297lfd.262.2021.10.14.02.53.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 02:53:42 -0700 (PDT)
Subject: Re: [PATCH v7 7/8] clk: qcom: dispcc-sm8250: stop using mmcx
 regulator
To:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
References: <20210829154757.784699-1-dmitry.baryshkov@linaro.org>
 <20210829154757.784699-8-dmitry.baryshkov@linaro.org>
 <YV8WsQb9H7+CaLjP@ripper> <4614587c-b87a-4375-cb6a-6af6f5462c6b@linaro.org>
 <163415465484.936110.9292145029740247591@swboyd.mtv.corp.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <070b1b25-3718-5f3a-869b-a3954fdcc7c5@linaro.org>
Date:   Thu, 14 Oct 2021 12:53:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <163415465484.936110.9292145029740247591@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/10/2021 22:50, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2021-10-07 09:16:13)
>> On 07/10/2021 18:48, Bjorn Andersson wrote:
>>> On Sun 29 Aug 08:47 PDT 2021, Dmitry Baryshkov wrote:
>>>
>>>> Now as the common qcom clock controller code has been taught about power
>>>> domains, stop mentioning mmcx supply as a way to power up the clock
>>>> controller's gdsc.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>>
>>> Once we merge these, I expect that the boards will start crashing if
>>> the kernel is booted using an existing DTB?
>>>
>>> Is it okay to just merge the first 6 patches in the series now and
>>> postpone these two until we've had the dts change sitting for a while?
>>
>> Sure it is.
>>
> 
> What's the merge strategy? It goes through arm-soc?

I think this should go through the clk tree. There is little chance of 
conflicts.


-- 
With best wishes
Dmitry
