Return-Path: <linux-arm-msm+bounces-21912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADB78FE5E1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 13:56:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0E771F271DE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 11:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26525194AF1;
	Thu,  6 Jun 2024 11:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WCzgZrWv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6810613C69A
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 11:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717674992; cv=none; b=bwPuEDWic0owGT+Cs1HG7jSQXEPOLMX96v4cRfaNSwYMCoZd6KKxnV2ZEDWlWMcrMfFSSj/aXNmniKg+QROnxkjckElNfbVOaLV7wxq44Hq7pox52xGxd23KdXMSA31ALy8D1PzZnEiCHw/+slSTT6tsdOb9lvM7T+KgdHSGhjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717674992; c=relaxed/simple;
	bh=0mrz4Ql+/szyW/Tn0jSJew7WyN8DrpJkwgiX14efqeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R45ByQxLz7ikGtJ5XF8r+DEoZj5lw4JIH/zfVj1ACi6TtJZK2GSuG5PUiidzz+1M1JymOx4pSvmG72slEPXO7elB00w+fEV2KSoSVlYwoZprE1PF+LBcb/nE/tuenhszTpoE0datAY93GE+KhQFJ85lrMzQ91ut0vM2CXD3OAJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WCzgZrWv; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a6267778b3aso81699866b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 04:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717674989; x=1718279789; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qigu9PmFJTxWiF2SHmyTiEeuSsK0KUDZ4LsRQKX0REc=;
        b=WCzgZrWvQXmCBE/q2ufc/dn/y6eLZRGNrnn18LCAJSjOUjaonjUN53gLqqR8LRdBgu
         XrS94bM1elWGw461Vpc5IRmk4kHxMgEfcIjpeLJZ2M2bppCeVCo0MbiVPh2Ig/ImqnpR
         sG1EEAriXMWSgSO18ZL/sJw0maLPDr8gKi0uCcr10+sZJCLGsxQVl8/QpFD40JggeTur
         kUu+rLNJtzXecHvjLPKIlfxVbx4cJWIaPSX2tYuAwp+4z9Wpb5B7QMw+Akoj7h7/beAl
         M4ff2OkE7+v52q4o6WY3jPjGHqqxmDYn+b9QTEH7h5ISGf2UixRbLm00ePcspqX1bmY9
         cBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717674989; x=1718279789;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qigu9PmFJTxWiF2SHmyTiEeuSsK0KUDZ4LsRQKX0REc=;
        b=s7krtsd/vInJKuE9a1aEpejw0X9E+JMZRXp0dDhA0dCJSJqlwGacaL1OaqvJXIYGQQ
         eMDMA4lw8CErlUROaQ+MV1bOP+xNCYGunGVosJEfBfN2JI0MRwXtcJ7Q8QbxvPPZMp5Q
         Cl1wPfC3W1MZd0wAANQl1n8fJg5pDOR2IAglNUGpsrFIY+jbTRsHeSlAZSOzMsy6PBEt
         xjosf1AQk3VD2FZGcKVs7XtrGcDbFzebQJHp3u/HZij8AL8+WIvLHyLzS+y2Glz9yw+d
         gi4D3Ck0PL0r+WF0Z6MS6pExtH3BclXW51SkE3dFLkjxPidXymFHFxipqNSKyoDhnjV3
         ywCg==
X-Forwarded-Encrypted: i=1; AJvYcCXu2CrSZLUOqw4//yCWZS2B3/MCkR6B9w2nPp+md012jC5jOtqDE/zPGDszeaX7gXsUYsiPVyYkOBc5KbtWqL5eKchetqwBp6w0GQy+5A==
X-Gm-Message-State: AOJu0YwjZ1WwPHurcxa/C089F9hk9WfGHLKOi//XA4OkkWBAx2n5leD5
	O6n7Ed5YPq3Bl3139EFWZO42VE3u2e1Vrs58yEg3yr5EFOea3zLmeVFxWOkSKU8=
X-Google-Smtp-Source: AGHT+IFBieSuf16i1ypLtg1vDRc6TWnPPoeLOLeUt2B/edYEeJwfryrucUNsxXI6VGfLB0D6SlRLzw==
X-Received: by 2002:a17:907:cb21:b0:a62:c2a5:cff5 with SMTP id a640c23a62f3a-a69a002e7d1mr313879066b.56.1717674988815;
        Thu, 06 Jun 2024 04:56:28 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c806eb018sm87811066b.127.2024.06.06.04.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 04:56:27 -0700 (PDT)
Message-ID: <93eb11e7-21d7-4d3b-b033-b66898ea7874@linaro.org>
Date: Thu, 6 Jun 2024 13:56:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-sm8450: set OPS_PARENT_ENABLE on
 gcc_sdcc2_apps_clk_src
To: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Vinod Koul <vkoul@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240427-topic-8450sdc2-v1-1-631cbb59e0e5@linaro.org>
 <2337ba58adb3fb127710bead9b8665a9.sboyd@kernel.org>
 <11bd7146-30cd-4b71-b2ca-d76875763731@linaro.org>
 <6ba2967c6c9d24e3f1c9b76496176010.sboyd@kernel.org>
 <3a3c4279-a254-48d0-91ad-70b7f1e3eb77@linaro.org>
 <7baef7a173dc4d1ecf8b0dafde565b1a.sboyd@kernel.org>
 <aeaa72f6-b227-4b54-9836-0b8f4dba6ffb@linaro.org>
 <9440dd954294db7c02a11a1807d75ad9.sboyd@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <9440dd954294db7c02a11a1807d75ad9.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7.05.2024 11:52 PM, Stephen Boyd wrote:
> Quoting Konrad Dybcio (2024-05-07 14:17:01)
>>
>>
>> On 5/7/24 22:28, Stephen Boyd wrote:
>>>>
>>>
>>> Can you share your patch that prints the message? What bit are you
>>> checking in the hardware to determine if the RCG is enabled? Do you also
>>> print the enable count in software?
>>
>> I already reset-ed the tree state, but I added something like
>>
>> if (rcg->cmd_rcgr == the one in the declaration)
>>         pr_err("gcc_sdcc2_apps_clk_src is %s\n", clk_is_enabled(hw) ? "ENABLED" : "DISABLED");
>>
>> to drivers/clk/qcom/clk-rcg2.c : __clk_rcg2_set_rate()
>>
>>
> 
> Ok. You're reading the software state because there isn't an is_enabled
> clk_op for RCGs. Can you also read the CMD register (0x0 offset from
> base) and check for CMD_ROOT_EN (bit 1) being set? That's what I mean
> when I'm talking about the RCG being enabled in hardware. Similarly,
> read CMD_ROOT_OFF (bit 31) to see if some child branch of the RCG is
> enabled at this time.

[    3.998362] gcc_sdcc2_apps_clk_src is SW-DISABLED, CMD_ROOT_EN=0 CMD_ROOT_OFF=1
[    3.999896] scsi host0: ufshcd
[    4.006712] ------------[ cut here ]------------
[    4.013751] gcc_sdcc2_apps_clk_src: rcg didn't update its configuration.

[...]

[    4.288626] gcc_sdcc2_apps_clk_src is SW-ENABLED, CMD_ROOT_EN=0 CMD_ROOT_OFF=0


Code:

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 9b3aaa7f20ac..a24b8931d7a1 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -471,6 +471,12 @@ static int __clk_rcg2_set_rate(struct clk_hw *hw, unsigned long rate,
        struct clk_rcg2 *rcg = to_clk_rcg2(hw);
        const struct freq_tbl *f;
 
+       if (rcg->cmd_rcgr == 0x24014)
+               pr_err("gcc_sdcc2_apps_clk_src is SW-%s, CMD_ROOT_EN=%u CMD_ROOT_OFF=%u\n",
+                      clk_hw_is_enabled(hw) ? "ENABLED" : "DISABLED",
+                      regmap_test_bits(rcg->clkr.regmap, 0x24014 + CMD_REG, CMD_ROOT_EN),
+                      regmap_test_bits(rcg->clkr.regmap, 0x24014 + CMD_REG, CMD_ROOT_OFF));
+
        switch (policy) {
        case FLOOR:
                f = qcom_find_freq_floor(rcg->freq_tbl, rate);

Konrad

