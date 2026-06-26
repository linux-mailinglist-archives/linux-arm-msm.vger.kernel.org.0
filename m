Return-Path: <linux-arm-msm+bounces-114708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mDsGNeCvPmoEKQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 18:59:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 379306CF4D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 18:59:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=T6z3ulcM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114708-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114708-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 642B03026311
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 16:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6696E358372;
	Fri, 26 Jun 2026 16:54:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE40E3F076C
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 16:54:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782492884; cv=none; b=k80vkPXDl54x7v9ETXwcl7ueHhwgsD5cnjd5Ue6j3dFOurchXlLoMi1+o7RvkZ2mGGMgW+UVbDCU3iCBnpGfUUAq1V7c9daL0bGYgaa+7bgu2MNzxk+N8FgYcJG4zx8kzxy7LgfcXehMRZzXd/M6Tv+BD3LF9XZ0Al5mV4gEvOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782492884; c=relaxed/simple;
	bh=fKTJ1JAhY3w0fwcvqwtPlg3OQRNBZIK+CixEEFGGcXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=krp62cl8coMLJaQVN3RpWIql95Ks0TbavVZX8pdQ8nPXeWgRQF6eIs5kf6ZDJLAEYD7CWMa/BlnMWIeW5lNBwKTGrmgo3Zf4ReiQYy0irMAAVoYjIDTaDt0Jjk1oLC9vTTk++VM0yB30QYlzoAUcVo/KrBijdKOAxMSv1UvLrY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T6z3ulcM; arc=none smtp.client-ip=209.85.208.182
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-399768126easo565221fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 09:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782492881; x=1783097681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Miwfu54VewAT4zmyOF6r2Ug5ds6NVzgQEiIbDd7lUBI=;
        b=T6z3ulcMqFI04QuEnxY1BebugkSHRlEDU5RuLPMRtXEfg5u6GAXm8rJs0ghaxDJ3RQ
         L+RSV9El1+o770lbpKNBYqECsndq85xhPgyMJDjCnU8TLh/m4CMvCu9NG6ubfCD9QKkR
         cIJTGt9OX8XX4QVbQU7zmZDIyCAcfvigsfA5MipOzs5UI6PyZUsKh8L0Vh4TZcsPCEcY
         vDZIiD9oY0S5Odfju7pwwxF5CTpIQbdGyZgnBVVLAub20PsmmyMVS175DMlqJVKGIZjc
         cSqIq/g+RAfBCMnHpf+4EJtQ8RxKZMG7DxLqkwEPo7jEAx3f4FsXr/jsK4TZusHR6EBS
         GQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782492881; x=1783097681;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Miwfu54VewAT4zmyOF6r2Ug5ds6NVzgQEiIbDd7lUBI=;
        b=Hdnq5TSym0u31XUvKIHYQxf2WEVCJNbTtzg4GwhV1JwlG7Kh9Birr3zIpRDo0BohFf
         krqR9ORRKuWeWUpj79lHHMyf8xj7qTPYC93QiIFg3BNw2GL8nl/BOq6ypJbW+HXqgeM9
         H8Esix87sfsuD0uOqVRQ1Tyz7PgcsS2CCRYF74vnHC7e6mGpIG/yP9s5+CayFYoNsWTt
         LBuhTxdrNUsqjrl3d1yGiyg7qkI5rGsZRGKGWSmH7WWF0p3RVbNN2gQoVBKgkHmQO0Z/
         hybSxoa1P31ITTsfiYpTOkWSiYqQtEwoKlZjz+lDwxCcfmoDoswHru8hzSbx/pjLQ1ON
         f5Cw==
X-Gm-Message-State: AOJu0YzCXMTx7Ik5s0Oa6o+l2vVD0zfnJpKPA0RyM5MIvDexE4ROUuqF
	F0AldY8Rtrkw8H4OHVSGJZ+Hqw+X2w1gxk98EFpIRC6lVRajejRYbd7Sti8cNw+mXJo=
X-Gm-Gg: AfdE7cn31oylRHknM9Z7llQY9q3hXF5IT0qHhEUHccLnty9MVb45v7hQk+wt0Tjvvpk
	g1z/ScpEBtPAfmZzw6BNPaqTGOyclPYTB4/HUAgQ4bBvKmzV5t2JwOIMDPWmu2XJHM0WYm+iuAN
	NmsNAC33E9QdjEhbhifN1LHJqcn7vY0G6r2DPbI2CYJZHUyFMh6DVpEgBFMr62ILuV7cuUjtR9U
	ATTdKLI88bWIFHloaDde5Z9Ob53kZEmknQIGkXGJpjEUh9QeIZNgn+JVdyrs2f+v2UJvN1pPF6r
	/9p83szEJwN7PTgNLOi1g8K7asxtQ9BQEGeSIh5C8coOlP2KP2E+gbfX/r4I0d39baYDLB1zyH/
	KLOJuGQ4UdRFaWPRRTGagjJqg/1yYmZ+6qvxfx2zFttm+iS5ofzI+7fI64k6z7schwsAXIIezkj
	BxZbDf0NW64pe15JYBRKslVJpcVrO4dE4hF2ziMoSerVXBu2kzET67GSV46sxjV9Jkox0=
X-Received: by 2002:a2e:bd83:0:b0:393:bb14:9b1 with SMTP id 38308e7fff4ca-39acb54fcafmr8570941fa.2.1782492880838;
        Fri, 26 Jun 2026 09:54:40 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ad31a81adsm11932621fa.28.2026.06.26.09.54.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 09:54:40 -0700 (PDT)
Message-ID: <41a76941-2e21-49ce-b0cd-0ae6a8b2eb1f@linaro.org>
Date: Fri, 26 Jun 2026 19:54:39 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: enable ALWAYS_ON for titan_top_gdsc
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Brian Masney <bmasney@redhat.com>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260626-camcc-sc8280xp-titan-top-v1-1-2ca246886493@redhat.com>
 <bcf9fd99-454f-4ac2-8357-b0775be42d41@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <bcf9fd99-454f-4ac2-8357-b0775be42d41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114708-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:bmasney@redhat.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bryan.odonoghue@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:dkim,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 379306CF4D3

On 6/26/26 19:32, Konrad Dybcio wrote:
> On 6/26/26 6:26 PM, Brian Masney wrote:
>> With the introduction of sync_state support in the clk and pmdomain
>> subsystems, the following warning happens when the unused clocks are
>> shutdown in camcc-sc8280xp:
> 
> Stuck at _on_ sounds wrong.. does clk_ignore_unused / removing
> the sync state from the clock part only resolve this? There may
> be a clock dependency for the TITAN_TOP_GDSC that we're failing to
> describe
> 

Let me remind that there is a series, which solves this problem in a proper
and elegant way, it would be nice to get the review tags though:

[1] https://lore.kernel.org/linux-clk/20260331140142.892579-1-vladimir.zapolskiy@linaro.org/

-- 
Best wishes,
Vladimir

