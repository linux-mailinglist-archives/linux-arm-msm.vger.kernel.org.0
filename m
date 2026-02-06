Return-Path: <linux-arm-msm+bounces-92038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKboOKfrhWlvIQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 14:24:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 120F9FE146
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 14:24:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 56CEB3020452
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 13:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B62E3E95B7;
	Fri,  6 Feb 2026 13:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nj1hQ+DH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD07739525A
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 13:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770384192; cv=none; b=rbS+lCYQ72x6VO6/naqbzCYzhDDp1VdJ348hqVWPS4E6KPwmNGGZ8VdJeAJDyeFBHAe+S3rldN64lcLagzE+wv7nZU6eyfnmZtxvnTmzKrsIpEfvsy1uXj374dNgHx8ZsHu3vzkEWIGtBHmas3hfRcZyiV7lBcWIW88Obz18j44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770384192; c=relaxed/simple;
	bh=bMN/JRFVQgOWnas7SCu6F46rmxINVt7CufITb68/bTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CBSM2/p4CEny6iLFlyXN46u7eIyxbOnCz/+dRVhWPXyxGv7+LbOIP6PawpyTbzPvYJ3Es2MYPxLKk1Fkjoa/g5WJTK/dI/a1bjBiD9PDTxOEvoh6KbF+xvSUDSHtfq6WiGhFny1xu5xXIyG44exgbQXwQ7o8N5lCxm4x97V9ZKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nj1hQ+DH; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b884a84e655so312939566b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 05:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770384190; x=1770988990; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bMN/JRFVQgOWnas7SCu6F46rmxINVt7CufITb68/bTw=;
        b=Nj1hQ+DH/+m1Leoytf69/OTn6EeKWBOT6ExcnYRyztCBRDGykWgyJudXZoEa3m7HAX
         1RwYf9rmKIeFLsWXvlCaZpxmZIRWS2Dtlrnlt+rE9pSNuLsnZnfFADVYdHplGQrRv/0+
         X/X3ZwkP4FB37qSO48kFXfXv9F7DD8Im33mJKVMUe7CEffyFjaZDxX86KuXbtPtrLlKE
         447XzntFNJDqTLs9Ty/9PaLpDnFvD+NeVCkUNPi/7071zv3BkSXtXhL+0gYEQfzdN25P
         ked+wGqOds3PopoIhXESP+vf2JEKxUcvbK2ouZ8QkdsWwPr1MX2tFNECo0aBJ9PNyXT8
         csFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770384190; x=1770988990;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bMN/JRFVQgOWnas7SCu6F46rmxINVt7CufITb68/bTw=;
        b=ROFJAdirNKJDeCfK8ktZTCm7NNSLm1qC/uY/RCbcvDc21foKSF81iBx6R9jPwi01re
         YGEjh996UcvSKfjOEEdqkUO3K0WDVQoBVJtOWzlYqroEOY4WW9FPzwHazU6+7aKHNyag
         BOzH7mb4WWgAf2WH7m0O1X3A5dEnslqPK1tNE5W+tB3j7bSXVHpjbBrf+tkTfKe1Nt4z
         eRzqy0+AVtIqdR69Tuf3cWXJb09Man99e7yXz705c5iP4Ia9RXD7GazCvWBdPFd6xN5Q
         w6OqIxNk5Si/NgjR3+h3H1AiLUw4q3UlFmLktL/Eiq9/YUcVdwhpLLiifyuCLXhLF65o
         y4TA==
X-Gm-Message-State: AOJu0YzJE15oN+DcifTd6Z6leN3i9oddALXEPT6XxIzSmuK79GpUO2km
	Nd0yeeMPIMRrDkfbaWn7Ay2f4jdXFF2J7VzMctvm5ko193mXMT5y6v41
X-Gm-Gg: AZuq6aLowwiAepcGTVVzy7YjZqO9fzVpLYKFeBAED2FJlBRZ0+rZByHk4KosuR6tlV6
	klrsqvZ3SgZZFrjggAvak5QQoE+L8V/ocDf5VvYosHm2nJTa+on+Bri4RTeNMf6POTaeN9Cn3sE
	NWxMtnbrWB+KXO5FIJXWjfemnh5JDFNkTAdoen3Ms73SprdAgXF8a7tkPACi0jdHf19xjcT8aPx
	bPE7MVYzG4uD+wyb2Ohw8G9aYklwbFLCDHvzsB2Mc5UUEzR8TSBENsGDxMsmBVm/JgWp0cuHHq0
	Un9PYrhK0puY4MuXuNjgHXLpa48q4RVQqCsXDXG46skNcXNlq2lywGXk6vSMuq3voDlMSvm9Yck
	mbnTLWV2dEo0d14rQY+dXkvg9A8QtkwJP4Ldxc0kQmvQ26iy1azXSFC2RpwJ/5CLiKQVx72XHRM
	67ZFT3f89WwnIj
X-Received: by 2002:a17:907:3d50:b0:b8e:2a8a:430d with SMTP id a640c23a62f3a-b8edf22fc44mr143653266b.26.1770384190073;
        Fri, 06 Feb 2026 05:23:10 -0800 (PST)
Received: from [192.168.1.31] ([91.141.197.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda74a52bsm83116966b.14.2026.02.06.05.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 05:23:09 -0800 (PST)
Message-ID: <05af4700-47c9-4bc6-9889-c694f63ce3fa@gmail.com>
Date: Fri, 6 Feb 2026 14:23:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao) DTS
To: David Heidelberg <david@ixit.cz>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org
References: <20260204115645.1343750-1-zstaseg@gmail.com>
 <20260204115645.1343750-3-zstaseg@gmail.com>
 <365e02e9-eb36-4870-afd4-d337a628794b@ixit.cz>
Content-Language: en-US
From: Stanislav Zaikin <zstaseg@gmail.com>
In-Reply-To: <365e02e9-eb36-4870-afd4-d337a628794b@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-92038-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zstaseg@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[e1000000:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 120F9FE146
X-Rspamd-Action: no action

On 2/4/26 2:10 PM, David Heidelberg wrote:
> On 04/02/2026 12:56, Stanislav Zaikin wrote:
>> Xiaomi 12 Lite 5G is a handset released in 2022
>>
>> [...]
>>
>> +
>> +        framebuffer0: framebuffer@e1000000 {
>> +            compatible = "simple-framebuffer";
>> +            reg = <0x0 0xe1000000 0x0 (1080 * 2400 * 4)>;
>
> Hello Stanislav.
>
> Use memory-region instead of reg property pointing to framebuffer.
>
> Happy to see the phone progressing towards mainline support!
>
> David

Hello David,

Thank you for the review. I will fix it in v2.

Best regards,
Stanislav

