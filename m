Return-Path: <linux-arm-msm+bounces-106778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sO0GLitI/2kZ4QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 16:43:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8F95001DC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 16:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91604300C58D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 May 2026 14:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E43B39890C;
	Sat,  9 May 2026 14:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cc+NYHr8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8801E396587
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 May 2026 14:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778337831; cv=none; b=eDeGFTM1ikPeQLuO0KdOOMlSmWBazSC8a3R7h8EwCQG6YtJuRHbGuIfQU6eUpVR2DBITZOV1J8CVzR3yFO79lAOhOUHhgVqdHM2NHA9yrScS+Wn1ZYnc2HwXYnNWOg4JzibEc3ZMIhvQ110zoIuc7mD5JN20PfRLmlFz1e/B0UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778337831; c=relaxed/simple;
	bh=dO/mpADzMV7Bgz+dNLvnHa5uezPUyzJiV1A8vcfRjcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQqjBkybe3fB5EgSdPnoRq/QeMbJRJM5mwrScL6uJzU86UwPvZGoNSo9+AGIUMl4dOFOA96qjkEB598CeO73fQFLA8cEoTG69A55P0TMewEJOOmmqdBp4SoQNXZjImewOHWFCrFx9kuQXFBzDnp46sIkphgSw579mmgCuQHA22A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cc+NYHr8; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6746d0b2b4aso4405630a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 May 2026 07:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778337828; x=1778942628; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rTagnauLE+hhKKiT1zAZaD+hPibc/QQjA6EWs3KI5oU=;
        b=Cc+NYHr8FMBLyFMItErNkK+Jr7HYawtfq+4HjEjytz9cyTd6sMGoZeUA8uJcDgdXka
         8rR2ERGQ+ne3e9jFvzGg+Hz0Dnk/VIlbKewFnGRQdgd+vYfq7DWhbpo42T0kZoXOgto3
         iGOWyIq1G1TbndkFjIeJJk11jlp5CS+oxW0mCJcVVzEXOtV/B479qDvpTXsTLCR03DkP
         XXxPKcwpWzQEDqVV1SNR+GLSZEDl8lRyUGRo4paFZis32Z/mPJzTByEgt1RGkYU6+tVG
         eIzVZjBY8UQk1VnfV9DGkKMw35DKTfJ6HC+Mbqil/6a8+QIPmVmcWk06b5ZVhFACl2Az
         089A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778337828; x=1778942628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rTagnauLE+hhKKiT1zAZaD+hPibc/QQjA6EWs3KI5oU=;
        b=aTiCpNoD/7V1xHCgD6OYnhFhgIwaCCGZGA0//wpLaA7KGbG+vCOjuCqYG2Xym12628
         YjlkQIu65WsGydvy0ic+72I0HeRw1UgSAL2509TR1QgPTyKPNAANuGf/LisMr5WB9PLY
         uuc9GPabPz0m/wf4VOMA6gqKn1hlsvf3vef/9nK3Ra1xs0wyCaUlKLKv3kS0gnlwwb9U
         MGxZ1uZ3BXD02iKR1GPRqY6h5uz7XQQZL01APi8gOvy+R4w1w1YzkxgpWERo3+b7vDo9
         nb3LQgXnyq3Luv+xXOJgjAHoj72AS0oE+FPjxFb1VR6UfdGOctmxG6G0QIkj9Y+Nkk+O
         e0KQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zxIzZmBGq95Xq3YknbEVh7L+ZDY+XptpzQKxqyGIJKS/kM9tHAzqrvgJpOkyPuheiLxg6Y2wrvA2n/K31@vger.kernel.org
X-Gm-Message-State: AOJu0Yynkiz7S2SBitlvCruWkEEKjzn5t9+++dCv/6vs7ldgbdR32PhM
	LWG3PgLaxW4Chc4jp15xenL/IR9LR3hhbAbKmAeJVeT1tEIo73hwJsgn
X-Gm-Gg: Acq92OEcSnZggLUNoL/sbvIlrmcV4UOcdGMlzcidGlmUEb+cQk0nhzYplxgBAiw6R/t
	VYcIvouI3L8UeLYLNEKQiuVwsQLShAXVo8nSNfo/dCv/pPjtLaLGOxW+tkQVtxJy1nhnz6Kac4T
	/zSpAc8cYAhWrD1EldYleSflF/HVC9FkhGeVGB8fO9bRPnuMPtw4iULMCJ/WLyrXpmqw+8IC/qW
	UCgpgeb0KYwdL9ebSOX2vYS/ghKIpO548Nn35u2bzJeGHHNZgfAOv0DtM+8uO3awTdN6dWoRY9K
	ENWu33MForw//57eTlr1Exkit7p7Im68tX3b0slFesYaYtVg+F9sfuOQ9EjHCAfIShiOO2gFLH9
	0sPsftUgBV/EGT2SxyRwTdZ3nCc1UGoQbnmbZkcBW3+084xVZmDhNtTrpEAlwJ8D9JcmEsDfYti
	JaUv+m5XsYvgDrbZSiOm4/fHqerOZkviPNcIWh+2vMwKAXKNlPHYo9PgLtANytAYxq8WTc
X-Received: by 2002:a05:6402:5407:b0:673:9b15:39d3 with SMTP id 4fb4d7f45d1cf-67d642b04ddmr8185100a12.16.1778337827665;
        Sat, 09 May 2026 07:43:47 -0700 (PDT)
Received: from ?IPV6:2a00:f502:160:4e2:a099:cad9:2ecd:93de? ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b6a11asm1820101a12.8.2026.05.09.07.43.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2026 07:43:47 -0700 (PDT)
Message-ID: <1ee77cbb-9894-4b16-ae2b-8e9035fd6cd5@gmail.com>
Date: Sat, 9 May 2026 17:43:42 +0300
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
 <17c4626e-8926-4cad-842d-a1b171d1e962@kernel.org>
 <CYaHtccGOWlaUtl3QIKva44ybJiRHsPOZmHEkl2KKGmnDxJ8vTH-SVNMGbL7bjkYjI692nplORzOhpfjs3XJfg==@protonmail.internalid>
 <4f1ab5b8-3bfe-43a6-8b91-317456188544@gmail.com>
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
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <9bf43e04-f834-45b6-8942-bcae2e480371@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1F8F95001DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106778-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

> OTOH if Core1 can't be coaxed into working in either mode, we are better
> off either holding off on this series until the breakages is root caused
> or leaving out Core1 entirely for now.
> 
> i.e. there is no utility in declaring an encoder or decoder to userspace
> that is known to be broken.
> Last time I tried to enable only 1 of the cores, the following would happen:
- If core0 is enabled, HEVC decoding would work, but not the other codecs.
- If core1 is enabled, the rest of codecs would work, but not HEVC.
Given we don't really have a way to power up a core based on which codec
we are dealing with, I suggest we leave both cores in the binding and
enable them indiscriminately.

