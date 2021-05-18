Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7719C387987
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 15:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349356AbhERNIv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 09:08:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349314AbhERNIq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 09:08:46 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC1CDC061756
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 May 2021 06:07:27 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id q10so9132663qkc.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 May 2021 06:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kK7zU0MuVwUNky+tAuT/EbQK9GNOBzJsw7o2A7V1ieE=;
        b=ItCEjJEtY3vK4wnQz5FO9YQa38LyQZnhI1Qb2TVwWBUHRd8lvhiGiQmXqIDvovfvwq
         7M9ACH5kpT6f2tuxQLflujx1P9bfkNI19YWH6Cl5xeAjQwahGWQg8yxoTQflXKJERBrz
         RT+KcpoGrudqOpMeDFHjK/PIHJ0ir572jG0/TYqFKpMRi4e4OwkLAI4vGZiwZRLHJ4+Q
         Hl2NKulwr2CXN0XSllyylby3KnyuDhsqVQ8BomeNa6u299T1C2o68xqomQT40BBuMnH3
         vgMnFPwLF+3FSoBafMdZs+Gug88NX4y7XS4VmgQBBZSyZni3aAKjsl2w4su0/wuHOU0l
         G5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kK7zU0MuVwUNky+tAuT/EbQK9GNOBzJsw7o2A7V1ieE=;
        b=r9dTQ6hlrYAuZZYzqLnpK0kbsSSa+25b6YQkSltivqCBvHtjBTV0RAp11FS9nrJ61k
         RD2aCkoiB61HBXr3w4bPNAt/KU9PzH2GJwXz8+UDVC5tcHC2ibk1ocOIb5R9SXY4hw5R
         ER8l0wibUshTv2JBoDnZePaW8jpS8ZHYiw5vePREHBCp+sRjDkiMXWFaYjV10wXESHG2
         nW/3STu4GpIrrZmvj8NgFFrybEPlW7ZKzBbzrj9Ydjb0j31wVJc221Mkdq2aEWFe1lsr
         TqHeR5FW0SHa6OtOFrO82rnqORBRJ6iRNDqSvrolEFB7ITLx7qUmApdyvoE+99W6huRG
         Zrvw==
X-Gm-Message-State: AOAM531vgnH8DtTNJFZgMzf4wcHhnqrlUjN9kz87QPvRCQx6b3f7O2Ye
        CPK1ehAvGOCLqn+ZksHkhZTErA==
X-Google-Smtp-Source: ABdhPJwApcF5a0aa+3VfsA3Xqbbaadymn7VcM3CgV9JFtjgMps/fSevqkf8x8V828WSWXTmhtbW6DQ==
X-Received: by 2002:a05:620a:e8a:: with SMTP id w10mr5334852qkm.248.1621343246919;
        Tue, 18 May 2021 06:07:26 -0700 (PDT)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id m67sm12648132qkd.108.2021.05.18.06.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 May 2021 06:07:26 -0700 (PDT)
Subject: Re: [PATCH 1/3] clk: qcom: clk-alpha-pll: add support for zonda pll
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, robert.foss@linaro.org,
        andrey.konovalov@linaro.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210513175258.5842-1-jonathan@marek.ca>
 <20210513175258.5842-2-jonathan@marek.ca> <YKOltGEDEY1WXQN6@vkoul-mobl.Dlink>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <abc662f3-8c36-862d-4d50-3628d3a02ee2@marek.ca>
Date:   Tue, 18 May 2021 09:06:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <YKOltGEDEY1WXQN6@vkoul-mobl.Dlink>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/18/21 7:32 AM, Vinod Koul wrote:
> On 13-05-21, 13:52, Jonathan Marek wrote:

...

>> +/* ZONDA PLL specific */
>> +#define ZONDA_PLL_OUT_MASK	0xf
>> +#define ZONDA_STAY_IN_CFA	BIT(16)
>> +#define ZONDA_PLL_FREQ_LOCK_DET	BIT(29)
> 
> This seems similar to ALPHA_PLL_ACK_LATCH..?
> 

The bit is the same, and it is also used with wait_for_pll(), but the 
meaning seems different (the usage pattern is different).

>> +const struct clk_ops clk_alpha_pll_postdiv_zonda_ops = {
>> +	.recalc_rate = clk_alpha_pll_postdiv_fabia_recalc_rate,
>> +	.round_rate = clk_alpha_pll_postdiv_fabia_round_rate,
>> +	.set_rate = clk_alpha_pll_postdiv_fabia_set_rate,
>> +};
>> +EXPORT_SYMBOL(clk_alpha_pll_postdiv_zonda_ops);
> 
> Why add one more ops when we can reuse clk_alpha_pll_postdiv_fabia_ops
> for this?
> 

No reason (copied from downstream), will fix.

>> +
>> +	/* Set operation mode to OFF */
>> +	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
>> +
>> +	/* PLL should be in OFF mode before continuing */
>> +	wmb();
> 
> Why a barrier?
> 

Again no reason (copied from downstream, but it doesn't make sense to 
have this barrier).

>> +static unsigned long
>> +clk_zonda_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
>> +{
>> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
>> +	u32 l, frac;
>> +
>> +	regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l);
>> +	regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL(pll), &frac);
>> +
>> +	return alpha_pll_calc_rate(parent_rate, l, frac, ALPHA_BITWIDTH);
>> +}
> 
> sounds like you could use clk_trion_pll_recalc_rate() instead
> 

I had this thought as well, but alpha_width in 
clk_trion_pll_recalc()_rate is 16, here ALPHA_BITWIDTH is 32, so I just 
copied this from downstream.

I think changing pll_alpha_width() to return the right value for zonda 
will work and allow sharing the function, if you think that's a good idea?
