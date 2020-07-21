Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C44B228418
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 17:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729998AbgGUPpG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 11:45:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728156AbgGUPpG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 11:45:06 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB39C0619DB
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 08:45:05 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id x9so24570459ljc.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 08:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/ndzqOyPQqpEB3yJC19z8dj8c5+fFPGDOTd0jEhmBpw=;
        b=oyjcz7J8tCcoUK2pmKvdElrTGri27wMTEkEyO06pn+bQ3XkVXFfl9cjKhwwgvQWH3q
         AZyp/fhkvAtCriocyMxenMlElRvOdo9GqKaX/aM8EhLTHvofo2OhtP26QmAoG3Fs6ayx
         X6tImKXaOYoOMqzcJqR8MnvPIzPRCtqqgRuLcTXgfR8O2SYwZNabXYteut+lerbchz9c
         TQzW01Hr5PCE8HtLQL2JGQjVl8b4LMiJ8QYxNxulcoVKPtHFDwCDpkOcZZpC8HnuNk8/
         RIdjp1GGa+7V0/ZcfStUiTeVKX+i+crZYRDREc2Rl9AuCaiTOJnk3nAs4JqNq/Tfqv1D
         kgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/ndzqOyPQqpEB3yJC19z8dj8c5+fFPGDOTd0jEhmBpw=;
        b=hlPi5EQzgrWAgMNU+fouQ0gRm8YJoA+mzj/yOV4HPgDdLcxvkyNa6o42GbhDYepujm
         k6gXR7Z9ZdWF2AC4Rd2WM5n1LoGLYrjc1eMnlXaiS+4KtOZ/TSKRnZR1VPkyK2Y5Pd2a
         Su/lf320F79ZDBJvke59GyESNihYwPP/3IghhbtXCyDkCN343SZtBt4hMdoB2f0HRoGU
         ui7SEG9kBfn8E5GnO19n9vZ7EP8pTdDyAMfO/fuMFhiYp3rVARANPECNG8JKtHAHtUP3
         r/bRj0FfDu72XRL3U5yil7qzkXHVzfAB8/N5hF56iYxNSD2ZIbCPBGt5H0snK3AYGxvc
         FoaQ==
X-Gm-Message-State: AOAM532aO08lHxX3BkPADJJiPAVaYIj4240CQ1YTz+bmcHoVoktS4h2L
        qp/W2ICz72lV/+Z03Uv+UEV9IQ==
X-Google-Smtp-Source: ABdhPJw8o7n4jwqLpbx2pwQXXpRN4itJmlmVLovLVQGL0ZLT2w+D8MktaWe4OZye5Y7XUxt3EQNgLA==
X-Received: by 2002:a05:651c:2046:: with SMTP id t6mr12073045ljo.217.1595346303883;
        Tue, 21 Jul 2020 08:45:03 -0700 (PDT)
Received: from [192.168.1.211] ([94.25.229.9])
        by smtp.gmail.com with ESMTPSA id 204sm3272346lfm.86.2020.07.21.08.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2020 08:45:03 -0700 (PDT)
Subject: Re: [PATCH v3 00/14] Enable GPU for SM8150 and SM8250
To:     Stephen Boyd <sboyd@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, Vinod Koul <vkoul@kernel.org>
References: <20200709135251.643-1-jonathan@marek.ca>
 <159531808502.3847286.3510600528777978505@swboyd.mtv.corp.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <f5c470ef-54d9-8d1c-8088-8f22d0cc98e1@linaro.org>
Date:   Tue, 21 Jul 2020 18:45:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <159531808502.3847286.3510600528777978505@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/07/2020 10:54, Stephen Boyd wrote:
> Quoting Jonathan Marek (2020-07-09 06:52:31)
>> This series adds the missing clock drivers and dts nodes to enable
>> the GPU on both SM8150 and SM8250.
>>
>> Note an extra drm/msm patch [1] is required for SM8250.
>>
>> As noted by Dmitry, GMU init fails with newer firmware, needs this patch [2].
>>
>> [1] https://patchwork.freedesktop.org/series/78968/
>> [2] https://git.linaro.org/landing-teams/working/qualcomm/kernel.git/commit/?h=tracking-qcomlt-sm8250&id=01331f2ccbe7e6c4719dbe038a5fb496db32646d
> 
> Vinod, can you test this patch series? And Taniya, can you review it?

On SM8250:

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
