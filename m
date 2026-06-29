Return-Path: <linux-arm-msm+bounces-115073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lX8EFa9tQmrP6wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:05:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 476FA6DABD8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:05:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=N8HusOvo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115073-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115073-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6BA023021853
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED48405C4D;
	Mon, 29 Jun 2026 13:00:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829B8405845
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:00:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782738059; cv=none; b=KwI8Hjyvvi4/Szi+4zlqK89nEWuB52ZuQqOp4TBwntVC5GOHwRF3wxYiZynXl58iOVghot7mQNxEmY/DYF9eH3R2G7dorTgmvOcqwwbafknq1LHCDJwe1lBOA6UihTn6qaK1lPfHgo22K7haQvhMOW/ypelt7fZcv8MwwEWJzAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782738059; c=relaxed/simple;
	bh=ptC+qOiC6+d1qdGlhlfC4UXNJ/q88wxddxLLdklLOWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IDqgPwGaykBc3CUUFqBu7hoN0SLbznYmKKp/QQm6dhs1cJmdYOF+wpd0uMOxo+5QLV7mPAejOgdqVOJDFInhSlvjbI0sfHDEyMru7aNA3UfvAv1vvvH+RHoDphzeI6reryO9/8paVUPrymh6cBPQ6T4Xa7RYLVahGxBe4MHtvXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N8HusOvo; arc=none smtp.client-ip=209.85.167.48
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aeb72b0af1so161847e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782738056; x=1783342856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m3Fai9RBjd+npFV53TQmqA1uln8pKm/M0yqFuuvwOko=;
        b=N8HusOvoin7uG2/EDkYzV7wQ+Q8alB4l6/xWidNN9lmCSqMyeVPtT2KMppQ3liD/xw
         cmMKfosyZdTbIilJsJ4jmfe7BlOWMIZ/LnhzzUljhb6x7QiCxuUDJVSulqOo+m0Chj8U
         ONcmysFd3E77TDyqEFOgvywFRMMmHl1/l2aaeRr0iZ0Mm614nJk8+SDcBr8+u7jc2Tkk
         O+53pKL856zhCZvDo5RqVKV5yZYgS0fs0a5OPb1XH7XUae2j4IeujsFCBfdpnCGVbZNK
         WoTJzeaL68jasp4fwny9j9YndVvS8iPKQmBbkUlaHPG2zlucVDrmye6OwWOeQ7wRczNH
         6RDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782738056; x=1783342856;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m3Fai9RBjd+npFV53TQmqA1uln8pKm/M0yqFuuvwOko=;
        b=XwSMHejD18NcVSV5VsBCeVOLcCRi6U4QXs/0wxz45WDHwze34evhlYDY4CcBK74Hxx
         TXppqc3xHXx/l4IA+OH9nkWvSDMW5A9z1+Bnekw3lQq4ajLNkm45pyeyCC28r9+Or5a6
         qLLxCcCQowBuZQVN7UmkzV3xoKFnadDzrb28V9orE1iPQBoF8K/tZX2C+HAbflKRWgxB
         IZv/l0yo3B8/VIThe6T4NddkXZzOh1FX/e1zfyxaKfEJQrZyw2roZS8gEUBFExQ3zRM3
         3WLgXEAEGa17aWSuucDxf67aVWD+k6DGqcYGIjzRNpZGc32UXcNwqd5oFBW2h4cGy75h
         gVxg==
X-Forwarded-Encrypted: i=1; AHgh+Rq222U0u9l+KoiJwn4gMRdXZ1n+O2PSocNQrqmz4jdrUCwbSn5Tgs/iEzWs2XaxV+vE0AOMo/4PVxw3CAAa@vger.kernel.org
X-Gm-Message-State: AOJu0YzIIw43+B1uVEsICXUQqnkXO86VrDD5kiF+VjRBpphEs47He+fG
	XdM9nXbduNu6UqVcMqTqAK4/ebxgBgbw/eE6zRfqUnpoJ+5H5WePT6Bhg9YN1+CwjyE=
X-Gm-Gg: AfdE7cnnR+E7oKzex+r/C8ibNLLlJK46PiEIsX3bGfGbJaGlDp2O9ygJJ0wFQspGB7A
	mOxsT+ARnU9w7XQhoDxZucuV+TUogEbg0js9XO3qdLLhK+BKwgUUFaMSEOaRizFDQNRCO+sJ6FR
	y1Ry9so/62s1ZUIqXHw2cJOBitjMAS5gviWgdOWTE9dlk5bxvIoTBJmxtyiD5R5MMYLE5B8+B+O
	rg0FwoiOlUFUQM5Qo3aXuYKg3JokWhiowtar1j2Y4kYUa9fxRuGjgfqSQ7RUBO8vnr8EIaNNwC5
	imzmlCw+JwQ+VpWcoFjdj3l725MOqbFR7ePGwGTkJ+KiBmJHh/9s4EyZzBqeXb8NHWgfQmPREGI
	4ie+sAnb4g+p5prkbT+1DLpAwULnFchG6Ln9XC4gquU9kJhxlnA4EomWdoS8zfxL7211NlyIeJq
	HxLNRE/ZEfhOIVTywC0lDKVhTCgpl2Tx2P8TSDtf6teXp36I/CZm8pSSZj50TXgc/zseA=
X-Received: by 2002:a05:6512:3b11:b0:5ae:ba7d:8fad with SMTP id 2adb3069b0e04-5aeba7d9145mr373785e87.4.1782738055280;
        Mon, 29 Jun 2026 06:00:55 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aebd32dbf3sm45796e87.46.2026.06.29.06.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 06:00:54 -0700 (PDT)
Message-ID: <03596c5b-9448-49e3-a035-25c0475df9be@linaro.org>
Date: Mon, 29 Jun 2026 16:00:46 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: enable ALWAYS_ON for titan_top_gdsc
To: Brian Masney <bmasney@redhat.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260626-camcc-sc8280xp-titan-top-v1-1-2ca246886493@redhat.com>
 <bcf9fd99-454f-4ac2-8357-b0775be42d41@oss.qualcomm.com>
 <41a76941-2e21-49ce-b0cd-0ae6a8b2eb1f@linaro.org>
 <akJQ7ZFODBjHrqFt@redhat.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <akJQ7ZFODBjHrqFt@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115073-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bryan.odonoghue@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linaro.org:dkim,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 476FA6DABD8

Hi Brian,

On 6/29/26 14:03, Brian Masney wrote:
> Hi Vladimir,
> 
> On Fri, Jun 26, 2026 at 07:54:39PM +0300, Vladimir Zapolskiy wrote:
>> On 6/26/26 19:32, Konrad Dybcio wrote:
>>> On 6/26/26 6:26 PM, Brian Masney wrote:
>>>> With the introduction of sync_state support in the clk and pmdomain
>>>> subsystems, the following warning happens when the unused clocks are
>>>> shutdown in camcc-sc8280xp:
>>>
>>> Stuck at _on_ sounds wrong.. does clk_ignore_unused / removing
>>> the sync state from the clock part only resolve this? There may
>>> be a clock dependency for the TITAN_TOP_GDSC that we're failing to
>>> describe
>>>
>>
>> Let me remind that there is a series, which solves this problem in a proper
>> and elegant way, it would be nice to get the review tags though:
>>
>> [1] https://lore.kernel.org/linux-clk/20260331140142.892579-1-vladimir.zapolskiy@linaro.org
> 
> As I mentioned in my other message, this series didn't address my issue.
> sc8280xp wasn't included in your series, so I had to make the following
> change in my tree:

absolutely, sc8280xp CAMCC should be also fixed in that respect.

> 
> diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
> index 18f5a3eb313e1..4724ea54c5f67 100644
> --- a/drivers/clk/qcom/camcc-sc8280xp.c
> +++ b/drivers/clk/qcom/camcc-sc8280xp.c
> @@ -2995,6 +2995,7 @@ static const struct qcom_cc_desc camcc_sc8280xp_desc = {
>          .num_resets = ARRAY_SIZE(camcc_sc8280xp_resets),
>          .gdscs = camcc_sc8280xp_gdscs,
>          .num_gdscs = ARRAY_SIZE(camcc_sc8280xp_gdscs),
> +       .cc_gdsc = &titan_top_gdsc,
>   };
>   
>   static const struct of_device_id camcc_sc8280xp_match_table[] = {
> 

commenting the series I was also directed by Konrad's review comment on it.
In addition one problem, which I immediate observe, is that camcc_sc8280xp_desc
misses the necessary .use_rpm flag, can you please do me a favour and test
my series plus the add-on change below?

diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
index 18f5a3eb313e..a15e9754bfb2 100644
--- a/drivers/clk/qcom/camcc-sc8280xp.c
+++ b/drivers/clk/qcom/camcc-sc8280xp.c
@@ -2995,6 +2995,8 @@ static const struct qcom_cc_desc camcc_sc8280xp_desc = {
  	.num_resets = ARRAY_SIZE(camcc_sc8280xp_resets),
  	.gdscs = camcc_sc8280xp_gdscs,
  	.num_gdscs = ARRAY_SIZE(camcc_sc8280xp_gdscs),
+	.use_rpm = true,
+	.cc_gdsc = &titan_top_gdsc,
  };
  
  static const struct of_device_id camcc_sc8280xp_match_table[] = {


Anyway despite my posted series and the above change for sc8280xp resolve
one well-established problem in the CAMCC drivers, I believe there might be
more unresolved issues on top, which should be addressed separately.

-- 
Best wishes,
Vladimir

