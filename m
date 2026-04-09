Return-Path: <linux-arm-msm+bounces-102401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eI+qLx8e12mQKwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 05:33:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC7C3C6080
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 05:33:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B74E730157E1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 03:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBBC32D060C;
	Thu,  9 Apr 2026 03:33:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AAE1A23B1
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 03:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775705627; cv=none; b=sH/R7LHApWl5/NUqDZoXl2nJnpJmJU5yXSIN53SqhkaASknmahgKUPiCQ04czTQMfHqXuIz/LX0Aa8+kCwGGRG62wpaHg9Kw/fZDnOWjjiXbPURraAi18ucR79kVbD9JUq1tSOZdmGjeOizlin/Z8khGUiwcvNhZYrcLNwZVHrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775705627; c=relaxed/simple;
	bh=HYXxuDQ723ABDQyPj00uTiG12kI8ouqjTgcYE4SLtps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CttzDLKcw2XSWHGNgqgIr41Xnn5abZp9RbVJzdDWU6J1Zs8XFieGnSv7a2EFoWgtoHU/Kz5g2yvAkRY85aGIyPSM8zAseKCnQ/TNlnDgmExrooBaS2nQzmRdBuCNNqMTSSqUPTe3+8N/m3pr36MTbRPFAFkOGUvL8niUW1pYuXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpgz1t1775705551t2319c7ad
X-QQ-Originating-IP: iPdQQC9dXO4BSlTU8vQld8nhoyJkadYCcNxTYOwmP78=
Received: from [127.0.0.1] ( [116.234.85.158])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 09 Apr 2026 11:32:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11463198670806814864
Message-ID: <FF86F4EE9CC46323+193f23fc-e72a-4171-aa4b-e13bc3465c5e@radxa.com>
Date: Thu, 9 Apr 2026 11:32:28 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: clk-rcg2: calculate timeout based on clock
 frequency
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Dzmitry Sankouski <dsankouski@gmail.com>,
 Taniya Das <quic_tdas@quicinc.com>, Mike Turquette <mturquette@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
 Mike Tipton <quic_mdtipton@quicinc.com>
References: <20260406-clk-qcom-gpclk-fixes-v1-0-7a14fe64552d@radxa.com>
 <20260406-clk-qcom-gpclk-fixes-v1-4-7a14fe64552d@radxa.com>
 <c2cdc581-2f8f-4495-bb87-812b27a1e381@oss.qualcomm.com>
 <adcGdXeqltQVwPLz@baldur>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <adcGdXeqltQVwPLz@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NC36Jv9FdMDB5lTI5ngZ5hV3XM/olBNRWJ6fXTN3QgGFRIfHA3wBCL8Z
	M1m0dASD/mV5v3mHLXQaByVmHQxTgLGJsZ9l4S3BsxmP1LWOr/su1VR9J2dZuTwoq54npfY
	hwht+gwLitv4gz4fD19gqXTTS7r3a4ZNCyiQR7l+JHTFYUkMexcXKxn57C4xHYr1RJ4TRDT
	ZqgjK19ap9UbjBbzHxPKXnTebnVuna2DrRcK/8qicZckji03Ozx3vDGTpbPRHW5KIYDg6Pq
	YEFixkRnklHR4CCe2hHsBlYbmP+1oXmsi9PrskDo87ilCkEWmHrx9sKaUnlCnNUYOjUudlA
	uTfqOfgEHQsGHP6K/xdTb8Rt56/v6zFnRogAU/HMDSyMbs9jfmm5dIVVfnns940jARMA/fh
	+LSYxONyRJJqWV7qw9Nmw76vZ9pp+7hraVZ1z+f+ijykD2LO5eoLFGgNVoW6KBWUOtNWW0I
	3ZM5EJqrw4ZT6wIBWDfGomEdRx6Evaf5sWtZK6XRPvRR22vqs82QL9qwptZ846T1DzrDDrk
	J+x/ehKNzjGiUQShOfA5qh3GvZjmSr8yI16YRrBQZcESBgMWoPsxJEXcMkwezsv3md9tLnL
	bYXuBfFI0yNeErQb0FyoJN8h8PCEmvgjtu21C7V9IwUiDs4lFnlTBE6HlIPRh7wacFsWYK6
	bzjDBEbFR5cbF9z8a7ZD5LL/zrHMn8uPzE369+HfrMaHlyG+PwXeyGy8r7p1bR+PIwsFSMQ
	3hj3vgpsO60JB++/fkC3sry2Z78/MPiwrM35O4kqkp3HPJ8D7SDmlwrfouFyTSCgqXA3Ztx
	MDNXChpfVsuBEQTez7AqLDsN8oJXWhDxnttWMIycnMCleW30eTLXqz7vHNv7GLJkf+z4dPa
	IvkkrbCrzX5tYpmChjh4IdnnBLo1Aj9vB4/joy3/sZiVjLK3ahRNLeJFU7dibN5r3eq/3LD
	GN3LLhtDrQEDBPbpX1H2RQ8Mj96JFEYW2m5QRENVHLR6Xoq7VG+JQQzW6GhLu4q6rxbYUr6
	kYzTEJfvIi+vorWh/teMzpetLebHyGs8lTuKO3SMc/5eYmMuWdQ9F5qepn/OAqyaFQVNJpd
	KbMZNpm6bCo
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102401-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_MUA_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.945];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,quicinc.com,linaro.org,vger.kernel.org,codeaurora.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codelinaro.org:url,radxa.com:email,radxa.com:mid,quicinc.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2DC7C3C6080
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/9/2026 9:55 AM, Bjorn Andersson wrote:
> On Tue, Apr 07, 2026 at 12:13:09PM +0200, Konrad Dybcio wrote:
>> On 4/6/26 5:54 PM, Xilin Wu wrote:
>>> RCGs with extremely low rates (tens of Hz to low kHz) take much longer
>>> to update than the fixed 500 us timeout allows. A 1 kHz clock needs at
>>> least 3 ms (3 cycles) for the configuration handshake.
>>>
>>> Instead of increasing the timeout to a huge fixed value for all clocks,
>>> dynamically compute the required timeout based on both the old and new
>>> clock rates, accounting for 3 cycles at each rate.
>>>
>>> Based on a downstream patch by Mike Tipton:
>>> https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/aa899c2d1fa31e247f04810f125ac9c60927c901
>>>
>>> Fixes: bcd61c0f535a ("clk: qcom: Add support for root clock generators (RCGs)")
>>> Signed-off-by: Mike Tipton <quic_mdtipton@quicinc.com>
>>
>> Having Mike's s-o-b here is odd, given you've decided to go forward
>> without his "From:"
>>
> 
> s/odd/wrong/ Please correct the author of the commit.
> 
> Note thought that it's good etiquette to document the changes you make
> to Mike's original patch, by adding a line "[Xilin: changed x, y, z]"
> between Mike's s-o-b and yours...until you end up having more changes
> than the original author, then you're the author of the patch.
> 

Thanks for pointing this out. I'll correct the author of the commit in v2.

> Regards,
> Bjorn
> 
>> [...]
>>> +static int get_update_timeout(const struct clk_rcg2 *rcg)
>>
>> Let's tack on a '_us'
>>
>>> +{
>>> +	int timeout = 0;
>>> +	unsigned long current_freq;
>>> +
>>> +	/*
>>> +	 * The time it takes an RCG to update is roughly 3 clock cycles of the
>>> +	 * old and new clock rates.
>>> +	 */
>>> +	current_freq = clk_hw_get_rate(&rcg->clkr.hw);
>>> +	if (current_freq)
>>> +		timeout += 3 * (USEC_PER_SEC / current_freq);
>>> +	if (rcg->configured_freq)
>>> +		timeout += 3 * (USEC_PER_SEC / rcg->configured_freq);
>>
>> I suppose both are nonzero if we end up in this path but a check for zerodiv
>> is always welcome
>>
>>> +
>>> +	return max(timeout, 500);
>>> +}
>>> +
>>>   static int update_config(struct clk_rcg2 *rcg)
>>>   {
>>> -	int count, ret;
>>> +	int timeout, count, ret;
>>>   	u32 cmd;
>>>   	struct clk_hw *hw = &rcg->clkr.hw;
>>>   	const char *name = clk_hw_get_name(hw);
>>> @@ -123,8 +141,10 @@ static int update_config(struct clk_rcg2 *rcg)
>>>   	if (ret)
>>>   		return ret;
>>>   
>>> +	timeout = get_update_timeout(rcg);
>>
>> You can just assign count = get_update_timeout() below since you're not
>> reusing this value
>>
>> Konrad
> 


-- 
Best regards,
Xilin Wu <sophon@radxa.com>


