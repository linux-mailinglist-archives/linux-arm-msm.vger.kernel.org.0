Return-Path: <linux-arm-msm+bounces-103237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDBsO/ND32nzRAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:53:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F3078401915
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9FDAD3029B17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 07:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4AC3909AE;
	Wed, 15 Apr 2026 07:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OD72VWRk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F0B3932E9
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 07:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776239586; cv=none; b=MypwT7a/JER0O/Rh4kQYCzbK/KYQTYXSuzIZQnIN3S//LkUy8v3IvwYT4qS61iscIRlmU2E+gKfGmd06lz3D0fihcCTfEOggOxxEFx5ZYmQYikVEaSVFEHHPhWFtHUjBLqly9VG5JGrRMFTXoXipEPlPkGSnQ6s867CMfQXoKFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776239586; c=relaxed/simple;
	bh=Yw0xvrjfP36/t+KznQRBwYmPmQJN/XbQWjsIlxYZ24I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AhYN6u7C9OOrgdtctvJHjdH2sezq0MyPcwiu53KDBuGzqy4qCvoK2yXUK+J9a9cWW/uqZQ10n2K6bt/MJ/xqNX+j+GK7VKweSonGqVhVByKiA7liVAYT4orC7k7uI1WJLURujM8ngfqOHPTSFrKm0WYdn+AGBDCPRJmfaCu1bwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OD72VWRk; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d572f7437so4047856f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 00:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776239584; x=1776844384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3J2ARVheakhszJOb8gf8ZQoX9WgE4eZSMjt1YLdpUqY=;
        b=OD72VWRk1IpmodDBxmX/+AFOkvlLBWGKSwAmZuk6ud1vSu1bjni2GcOnlwwaaubFSH
         42bFAJIVMaIuFAzhJxGuS1PPYIP7INfrodBwpNb+TieNqWMT+Z23rChXksfMttJpFbEt
         N0Hz7v/Yhh5SkESUYFxdBDHc9PnCfxy6jIv2kj1KGu5pjwAE0+lJwXy1DVh5hOFrp6X3
         S7JmBlRFILBzeNIsKe02Iq/AwH/kf1s8HG/TL6vnOl1FyIdxhj2WvgQWDg0UyAFG9tSL
         c/B8OiThcukp8CqjB3CKGufmDB9HT8gLbwhe/HBIenakz0vVfi3euVc9y0/Hi53hFsQO
         Jqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776239584; x=1776844384;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3J2ARVheakhszJOb8gf8ZQoX9WgE4eZSMjt1YLdpUqY=;
        b=XvwWX4sOaR0eizjzLFuWqbCi+gpQlfxgR4D7QLOeKelnmcHYEeREFtASsUfpyhUDcE
         MPCqs4GuhRPFBjw5sgHY5Jlvhi5jhQmQws8Hig3raFz0i566tDSd9Mu8MqesKr9ATDSi
         k4mlZjy/JHdJxFuVWURfohuIRCMc7vBZ2/0EDS0lqQ1xOeDTFzJ0rXVGVVfY8ZTVgct0
         Y2/j3+HE5M6a6csiPb7USmAvBfsKyscyU3gvAEgEYnHNH1bK9NFirbZoinOs6VKCSl1H
         p0hqm9QLrh/p5ngTpG7HoE1F8yRkPWix98BVRMeskv77dPYaAc+sHfBQ+3ckuG4BzkvQ
         1q0A==
X-Forwarded-Encrypted: i=1; AFNElJ/7Luo5y91c1KcsgpUgkykr8cWzwTpnup3D831LjvgafKxbXgaIS1XqM/l5Zw8b+QTzCmGUDX3vltegNOxv@vger.kernel.org
X-Gm-Message-State: AOJu0YxskHpjtU4B8svLWfRlYLLETqLSmVOziuCjHJzBP5SyEdaokNqB
	Fy5xofHOlC3PukJIxW7M45cbgWM0ioFpGFNP8iqe4W5iyfGNIsJ7cmpVJWdEaxLR81g=
X-Gm-Gg: AeBDietjevLTLG4h8Z8x9SUNqxBs63Lr6MBeWtZ9aour/89s8knJWm819msPJVFle9K
	3fMlA9d/HxD/7d5mrd+1wxab0TIQOpYxJSKgnSgd57f+eIwDXTNF51PXHXoJbIxjnkAZAxthOiX
	YR6p8CyBLt3h0QcrAXpPmidlawSq8OsEMfOdbuSuq3Lp/CYv917OLDTzEtp1joJCnFgJwkKB2Ib
	HHUDYLSF6cs3XjKYR3P64pNsdKMY9s/PLtRuXySdDeD8hQov7gn5RFwmSreSYhC33ddr/Bl70sQ
	g9Dd+CHo9LvF6Fopb0eR3QllnxBcK40kvO205LOhLTMFwtYLiDqgIa7siymIQlqxRoxrGpD+Ra0
	VdQq56kHnQ4bXVCbwvTg0qb8UBhvkK157Bd95vQan9yDx6hYRm1rHBGUITW/iJgElP8DSN6Ijyw
	zosdNSR9BRFvjiE8fYpmQp8++VwJB+z3eurlt+LgIw12Fa6M7EIx9YWAQ=
X-Received: by 2002:a05:6000:26cf:b0:43d:7633:2665 with SMTP id ffacd0b85a97d-43d7633283amr17691558f8f.44.1776239583858;
        Wed, 15 Apr 2026 00:53:03 -0700 (PDT)
Received: from [192.168.0.167] ([93.107.73.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead33d6d3sm3139103f8f.8.2026.04.15.00.53.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 00:53:03 -0700 (PDT)
Message-ID: <bd91c686-f713-4a48-b440-bdb292083d92@linaro.org>
Date: Wed, 15 Apr 2026 08:52:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] media: qcom: camss: Add PIX support for
 CSID/VFE-340
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
 dmitry.baryshkov@oss.qualcomm.com
References: <20260414185202.2714019-1-loic.poulain@oss.qualcomm.com>
 <CAFEp6-1+TeEDodfMM+ZmvGOwxr2sQa5pJ9vuk+h2WWPtkMvVXA@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEp6-1+TeEDodfMM+ZmvGOwxr2sQa5pJ9vuk+h2WWPtkMvVXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103237-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:dkim,linaro.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F3078401915
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 14/04/2026 20:31, Loic Poulain wrote:
> Hi Bryan,
> 
> On Tue, Apr 14, 2026 at 8:52 PM Loic Poulain
> <loic.poulain@oss.qualcomm.com> wrote:
>>
>> Add PIX-path support to the CAMSS pipeline on CSID-340 and VFE-340,
>> allowing frames to be routed to the VFE PIX interface and exposed
>> through PIX output devices such as msm_vfe0_pix.
>>
>> On CM2290/TFE, the PIX interface includes a minimal inline processing
>> engine, which we will be able to leverage later to export statistics
>> needed for proper 3A frame processing. This also fixes the PIX path
>> not being usable on this platform, as PIX routing was previously
>> unsupported, causing frame capture hangs.
> 
> I forgot to mention this series now depends on your CSID/port series:
> https://lore.kernel.org/all/20260407-camss-rdi-fix-v3-0-08f72d1f3442@kernel.org/
Thanks for clarifying, I was trying to work out if the indexing was 
still included.

---
bod

