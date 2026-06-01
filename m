Return-Path: <linux-arm-msm+bounces-110531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHduBw5JHWo2YgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 10:55:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BD19261BDF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 10:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 06B083036713
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 08:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C91345CC0;
	Mon,  1 Jun 2026 08:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pR5oT5Ik"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93752346E56
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 08:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303709; cv=none; b=uUclWQZfEdVWLAEXdaYDm8JdSCXQ86jPyqLSUjtDfF10e+rstHQVLRY8thFXKlbvZ6GKOuR80hTXZ9yHeSpYB0YbO8u8QWLlVnRipIIPvYnDElAeGFjVkjBKubjqqJUGHptASQgk/fD1saJqw/kzLK0yypGEA+ADsCjEx+FWYgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303709; c=relaxed/simple;
	bh=fk629VZBGTRm9OfLwrzcQ1hhc5VKHeUR7OD/kkF1Kgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LwlyaxdHDl2brF2Vy5DkNgQ1OV271AnwqZEfQSNZ69ms31YTWySkIeoHNtJzxaT0qIIRQfRjHjUm2ounglswpjEKySx7uw0w+q4PSr4M0rNnVqQ+PbtAcJqakQbbH87CY47VJunGdkWCwkUavS6bVwjzsjTiLpv4UqGHi75sOlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pR5oT5Ik; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4600ddc4017so860467f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 01:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780303706; x=1780908506; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e6R97isaU/cFcZ2I9WM2rO8XYaMDHSz/qiNm9k/zmx4=;
        b=pR5oT5IkeJQ4SZNBGG4/EXkm2HmFeONoBn2YSWyyVn3gTy/vfKU7B8bGUv7Wbpq6ts
         PYSFMY0EkGQK8UwXUOk7OWeSSgfP8aBLhFsBpZxDOQMappRG60cGDZE0aysqda65T6UR
         WPhlwTrDG5Qq4j6TmGH8o8xEJliTdM8YYSFOA5qLsOQ5iRJm9MWyWCIP3yM2RbaQ4i5J
         Rdv7kwUjEZEcYl58vN5v0pfP4Wbo4b4lRHZ//NzWdTZkQ25+La7zKWTUpWeafHGAPFPY
         uvbDFZG7601ba+VVAGx/U/l6bQb+/mP5IjACDF/Q2lt2i0GeYYRRH40Ksv1TBGTzIIn2
         SBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303706; x=1780908506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e6R97isaU/cFcZ2I9WM2rO8XYaMDHSz/qiNm9k/zmx4=;
        b=Tq6U1UemRuyZOvHGjSl1tepi+1dwCOJo9NkeJv29jzVsgSLcYiw0mcwyGITMB/5m05
         A5t0e2JkdrsBfkdsSlGTRL9cArkBKGJ97FwUolfhNqojnGVb9bmbiXS3N+HQN3qh/Wpq
         m6vwqNO8YpOCLHYToNIiR8HwG+l21GiXr11bdDLxbgE055wShMJiHpvzC7BbGc9icpgu
         4t8AaWJLUClHRok1ZXYtfHFODNvPDeH6+cS9TjDW76vQ9aC6lQSPazIQFNooYF7d6xft
         M20F2XqaaHvjig9Q5KRyVupLz/+N0WZkV6hcBOFRGGXRXzHKxwo/nfahnl+dkceYy08l
         9B2w==
X-Forwarded-Encrypted: i=1; AFNElJ+2a4tadtfgCXWcvyoBAzPIsN1+4k+/xF3ZI6Ixmd8O6fRRJLK+j6ftqWEUN44i9b0+zbnKACtVePbnnySZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyQR5YU9xjVuPfnqbZFHcMc//9hdkYC8eXN0SrnEKk5G/ak1QSi
	/0kxMyUD/lyUaYxT0vM5n7eAb0+ZEpetviZ5H9puYJPEyWrHbY0ZRSVV
X-Gm-Gg: Acq92OGA3ny68/8RXRLSXuaUHuW6AZsxUG4AmOlFQq+HdNJeUgoQ6bK11Fok72+gNfP
	zjHE/yDQLs0/rCNIN2QcjuvjJy3/kwBY+iZ51krmVDvDPqd2gw+nOtbovZ/U+MBqzP92kmfFWZe
	AzpndClQzYWOBrXVqqxZPtS4kiWT0BHzUikeUIXBcINMxX6b7ZcPtRA+93JOr1cwSjdUgGJBD6r
	ZX168s4F8bdwJZNd2GdtAUQTlvOzMXeUXGt1nWQCUa2wKx3mEq99AoT5GwSFnnkYzwUUnfPKzO+
	cC1+8aCC0WUyaSEnSXLPuCzSmupAmMtIzRyfzZxcvuKRoumafaaucZQdNfTzM1+2PsFOuCied1r
	Q0LU4PbLMaiCCS2LTQVJMNdQDCSpzagy67NangOHTiwpO2ar7Ej8wjkVRcigB5L4eY3Y8uFsfxU
	d4+17OWat5kxiiOSL8oxo2VuOPwDIyOivsjCUebvqA/Zic4nGanPrHr7+TVa19PqwR3/MUzSJMv
	wEMtJDurA==
X-Received: by 2002:a5d:49c2:0:b0:455:7d77:1d25 with SMTP id ffacd0b85a97d-45ef6b75cf8mr13497273f8f.27.1780303705968;
        Mon, 01 Jun 2026 01:48:25 -0700 (PDT)
Received: from ?IPV6:2a00:f502:260:28a1:17cc:dada:92e7:2b6a? ([2a00:f502:260:28a1:17cc:dada:92e7:2b6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a0374sm21522883f8f.2.2026.06.01.01.48.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 01:48:25 -0700 (PDT)
Message-ID: <22f344ff-acc4-47f8-935b-d1c3be7073ee@gmail.com>
Date: Mon, 1 Jun 2026 11:48:23 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Taniya Das <taniya.das@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
 <e7WD-tbtAA7Bx0uDnXgPHto9hACWxgblhI2eitNHX4VYEgxOOceuY0sOS6KQnGiyTaDYaKudZt4k50z_vJVpnw==@protonmail.internalid>
 <20260519-msm8939-venus-rfc-v8-2-542ec7557ebc@gmail.com>
 <608dc53d-17a8-4230-9ebb-48a94bf03675@kernel.org>
 <6ae3a89c-f205-45c5-87c0-5550f78502d6@oss.qualcomm.com>
 <01f9a303-846a-4048-8115-c94b9b78078a@gmail.com>
 <ecaa113a-02d7-48b6-a94e-9299a684b0be@oss.qualcomm.com>
 <4JzpVyRt008YHZIv34VGG-Z_etL_fh9cE8AL30d-uekLUAxGmZNV9os6xkESzPAyzDHFHA9XXyPgWxzBlEfnhQ==@protonmail.internalid>
 <d8177e27-7cd6-43f2-b88b-2dbce936421b@gmail.com>
 <82f7a200-ab07-4ff4-b84e-305351f78460@kernel.org>
 <4ab6aa28-6b0b-436f-95d3-23b54d73a992@oss.qualcomm.com>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <4ab6aa28-6b0b-436f-95d3-23b54d73a992@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110531-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BD19261BDF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 6/1/26 11:29 AM, Taniya Das wrote:
> 
> 
> On 5/26/2026 4:20 AM, Bryan O'Donoghue wrote:
>> On 25/05/2026 10:56, Erikas Bitovtas wrote:
>>> +    for (; i < res->vcodec_pmdomains_num; i++) {
>>> +        pd_dev = core->pmdomains->pd_devs[i];
>>> +        ret = pm_runtime_resume_and_get(pd_dev);
>>> +        if (ret)
>>> +            goto err;
>>> +
>>> +        ret = dev_pm_genpd_set_hwmode(pd_dev, true);
>>> +        if (ret && ret != -EOPNOTSUPP) {
>>> +            pm_runtime_put_sync(pd_dev);
>>> +            goto err;
>>> +        }
>>> +    }
>>
>> In Iris we do
>>
>> - enable_power_domains
>> - enable_clocks
>> - set hwmode
>>
> 
> This sequence will always ensure clock can be polled as the GDSC is
> still in SW mode.
> 
> 
>> Instead of
>>
>> - enable_power_domains
>> - set hwmode
>> - enable clocks
>>
> 
> This sequence will require the clock to have SKIP or DELAY as the GDSC
> is moved to HW mode and it is not guaranteed to match the SW expectation.
> 
> 
Thank you for the explanation. I fixed the sequence in v9 - clocks are
now enabled before switching to HW mode, not after.

