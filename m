Return-Path: <linux-arm-msm+bounces-106810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFVwL4laAGquGwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 12:14:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 81597503984
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 12:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E29313012C80
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 10:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1FA2372665;
	Sun, 10 May 2026 10:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U1PiXPwg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DFB36AB50
	for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 10:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778408049; cv=none; b=NXEiu4vpRKiwY+lhtTnFDrFS/92wDt862X5QrHn7xAJI76FqpkTIK32IgqV+/+hY4W5W2I4jaitrH8tmoE4GFv1y3qST7aVpG4zQ5Dc913ZXZJDXkbwLMYoIfpocxR9YibuU6KpuRpIecVzttcgLAVJrtZUlvl0ghTXe8b/GDOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778408049; c=relaxed/simple;
	bh=P6QKg2y/QOJpy/oFBXcEeXhsALMznnNszgPwLQj5mto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QTpIQ0toATFZz+zj1AwEdvAKyQITSIO4C1qPFtVA9cUmVMWHjtBYg/hAgaD163GDPeQMx9yAL9V4Mq/eRhm7ZJVNa3iQc29tHnWuxExKRKX7AMiaCzHIk1ihzkirQ4ATjg6ELpDbuoVXlRqbb+fXM+G06Oh3CMklRRpmrrQ1tMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1PiXPwg; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d7e23defbso1866258f8f.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 03:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778408046; x=1779012846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pX3w1V69PmEOX0juzgumTVFHN3YkvYvOdGGZ2KCGQQQ=;
        b=U1PiXPwgAC6BByv/zWHNfIWf3Wa37DVU+wpX8psRuvfImlGuaT8GPpa5JVh6XTa1Ly
         RVsocPW3vSH/Dgg7G11NsfSiiv00s35KUJIhzbedgRuITLIqXqEb8pJmkzPOlkfNKgG7
         Cg/seFsFDibvX3A29LAc6Y74hNKOZVf8cb91XTly9jKZzXDsAhPfnf7fX5o9AHBOvEWB
         OraZfSbyh3SER/zM2qIRCQLKywgPRO1xwRLqup/lxX4NPyRWK0SlGs5Ox3mxASXKmm5A
         lnmbgqq97y+ECElkk9qypiuhj6k2XI09QHBmDxXMskyCe+GlknntTRjoKGQxLVCl176Y
         pAHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778408046; x=1779012846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pX3w1V69PmEOX0juzgumTVFHN3YkvYvOdGGZ2KCGQQQ=;
        b=PwZZVv1gXGvhKCFjXdrqrJPd5odL+NNQeLA5n63mmiRXzlItB0kp+YFQSQNGehn8BW
         M5XE1PGZ7N8E0ySADn4ApQ4t39tr+lj8RpY260hBf4Q/cC5KMY1CfMwqTI8fvIi8BKQt
         7QxjutTUUCyMJiY+dTCos0OUEQPRY3P+qLGs8eTgzeaBzwurnlfw1VKHpxQ19sfpBA0R
         vT1hInv7SPb5fAh6JdL017MdYW7GTPfveQoCWACTXUEc8jWnUx92Kvq0VYbxs93KMxO/
         lgDQBFojxC481UQzWpBhRqpuuolzdN1DQY6oJ9npUKHw3tEx/5WlTFDWDpfYTerxYzG8
         nQFg==
X-Forwarded-Encrypted: i=1; AFNElJ9z0t4XEBcUyrI2z87aJVTc4Gp8g+vXzou/ZV4eT2emZe7Fa8I6zQPm5VPxdYZ7gwbAidonO292uQ1BjrJ5@vger.kernel.org
X-Gm-Message-State: AOJu0YwtGMNYyKDdqnhtMx42jz0DRiZij+ZENy8zv44SwWNxE5+nZjbN
	KIixpRXooSiNs3FM3qly1L73fPArLM4SGjuPf5vP00vG4f0OQz8VI7fw
X-Gm-Gg: Acq92OGkER0PgvLxKWoT3kvrDfePnxrkwaasCfR/9aCMMQOj6D8Zv4yMJPL1j/v1oSC
	Vf5uGWxQf4IjGxxj+rjVGWjmgzx0MfSqIACZFkcDLgybMbeyBJsct9/xQXtjg0IA2KLrknc8ISY
	paDiXsnSSHyfEuhVph8eM37iIXbudIdhLtXKOSR1/DHiNUiJ1Gv9Tpnk+lM7y0zVa7edgZpS6nA
	tqTIWncYxQaAeXM5U+GgpLCClNoqCdnBLlwwDg007SpLzUe8J8v/kWxuBocP7zJhldex3Zj3d3e
	G+Sg/f1wxOHCLB0RmBorDaCx7LPQlmrMbx0/r7nBHU2cARMhETd51i6KGEq+0cJJL47ezbsBDJj
	NVPso7jNxXCHac3El4RRkjxP7Ga1LwPxH20/kYHlXcTF/3kjvEVrjmg2eAS5RQWD33PPiDuQ7Jj
	EytUreyAr+7Pzsa/k06Rd+SPNCF5fw0lo/23QeQO8lV00NZTBxlzCvhuvGlk2TCF5+DqTd
X-Received: by 2002:a05:6000:188e:b0:451:26e1:3cd1 with SMTP id ffacd0b85a97d-4568cc42f7fmr8098198f8f.35.1778408045575;
        Sun, 10 May 2026 03:14:05 -0700 (PDT)
Received: from ?IPV6:2a00:f502:160:4e2:a099:cad9:2ecd:93de? ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491ca2fd6sm18233894f8f.30.2026.05.10.03.14.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 03:14:05 -0700 (PDT)
Message-ID: <1c2cdaf2-fe30-4443-b164-c37c26f3dd05@gmail.com>
Date: Sun, 10 May 2026 13:14:02 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Bryan O'Donoghue <bod@kernel.org>,
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
References: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
 <7df3bff7-b872-4b20-8e7c-698157a41f33@kernel.org>
 <tawGGT4rtpw22Ng-MgM--GhoEihBU7tY_TrFUHf8raMKApyqTcSkKHyfSuRIL_bqNp_5zWD4SBG_C4c8CB7_6Q==@protonmail.internalid>
 <18998766-62fe-4a5e-95d8-1bfae712d8fb@gmail.com>
 <614a087d-d219-49cb-85ee-772044558649@kernel.org>
 <Jxt4BbN1dL8VKh_Zjah1xecAjz3c9VfbhKSm4a0K2D1MNKfJKIFnCPLj2VvdW1q4LnMIQy8bCzV3YoVnLFYUlA==@protonmail.internalid>
 <0cee27b6-f566-4958-8634-2c43e099281e@gmail.com>
 <dd435489-0cf7-4274-99bf-a591a15e91e4@kernel.org>
 <-hM6afm_Cu_8Cha9U-hrlrg6CGDEb5D3PFpPPCfIh-QgkdFJp_r0Ah9k1dvAF4zkju2dPc3FZJxvOA4V4hupAA==@protonmail.internalid>
 <69f9a6b7-7431-442a-82a2-6305635a508a@gmail.com>
 <9bf43e04-f834-45b6-8942-bcae2e480371@kernel.org>
 <eiZczGoYszhu5QDfm96oeViUfzDjhlJ8JLLIm2YmOU6S2gfCQoBeo9K2T65EzVLvv9B4lSo0k1KCVWMGLnzL6Q==@protonmail.internalid>
 <1ee77cbb-9894-4b16-ae2b-8e9035fd6cd5@gmail.com>
 <6cbb9b37-9560-482a-9fa6-15d5370d258f@kernel.org>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <6cbb9b37-9560-482a-9fa6-15d5370d258f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 81597503984
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106810-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


>>> Last time I tried to enable only 1 of the cores, the following would
>>> happen:
>> - If core0 is enabled, HEVC decoding would work, but not the other
>> codecs.
>> - If core1 is enabled, the rest of codecs would work, but not HEVC.
> 
> Can you be a little clearer here do you mean - doesn't work on that core
> or doesn't work on all cores ?
> 

By that I mean that when I tried to play an HEVC video with mpv with
only core0 enabled, it would play fine, but trying to play videos in
another codec would result in power collapse fails. Likewise with core1,
but in other codecs.

I assume this is how cores are split - core0 does HEVC decoding and
core1 does the rest of codecs. This is confirmed by downstream code as
well (although the cores are flipped - core0 is the rest of codecs
("legacy") and core1 is HEVC):
https://github.com/msm8916-mainline/linux-downstream/blob/b20608408caff817ec874f325127b07609fbaeb8/arch/arm/boot/dts/qcom/msm8939-common.dtsi#L1589
https://github.com/msm8916-mainline/linux-downstream/blob/b20608408caff817ec874f325127b07609fbaeb8/Documentation/devicetree/bindings/media/video/msm-vidc.txt#L35

