Return-Path: <linux-arm-msm+bounces-104255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFnMKajo6Wn+nAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:38:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC03D44FD1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:38:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 95E9332D1FEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 09:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF17F3E51DF;
	Thu, 23 Apr 2026 09:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nnSAa6JA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078053E4C62
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776936219; cv=none; b=hNJEduAQV8EMqhdIsca5Xx4QTlWarInf7r19QTP/9Tdel7v0d8PMb2WIHDiqaY24eT0o2WOFclm6Z/bEpppsnAziRqWCLCL7KjZCyC4e1lkCyZu2janyXMa/AtT2zkXSFTbTmVX7TnyIBJa18syfBMq5CXJ2DVEZNu9r/ZHWqrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776936219; c=relaxed/simple;
	bh=53ennj+hj5rWSokWbGEQbLWHb/17dqpf2YXvQKqdVmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b6no1dtcQwsDZjorrlsSfgmvYnoC18142U7xg6dFhjrW9Dp2WVML+qUQTpFGZUA3EYggVmNvJ2F4zAYTykCquvWPgr5JWOmbHp87pxKL5Cia13a6uIk438vFVVi76fZrVYi2ozRTeUZwLOBYgIhIkzO8IVXoxYAMWo8NjQprfXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nnSAa6JA; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso59302865e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 02:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776936215; x=1777541015; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pL1SbrFnD2hMqCJhJcMRGY0Wdq8twCe13/ZvMTtbqsQ=;
        b=nnSAa6JAkMlO9I+eelz2YY2WvP1fN6LDHtLdH6OLt3luUoJe7UnBphiQt2IYRiotgS
         rjpGCh7kc90cyQdZ7XpF2QtVhsHEkG2hnZMBN7RgRqhUQaRuDxa36SUr4z5MSi4cAZlC
         Dv4ZNggdFkO+tXFiAMd7P8n2lSUH8rGDpByGD5Cwygy4XytJT+UPgUbegZL40iHH++5R
         DJA7fY6Q8dMxqF/cZo5IiR0rUDzXfBBuKbQ9rAo63Y20uhUbgtSibPBJx+t+qXALqdy/
         jO0v88MJRa7dZ1oMPmQr88llgf0BdCJDvZKk741t/0/gQZ11OKpET728URYKD7MarIX8
         Xg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776936215; x=1777541015;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pL1SbrFnD2hMqCJhJcMRGY0Wdq8twCe13/ZvMTtbqsQ=;
        b=oq/Ecit7PdrH1txDdafxjNBZIsLc98bL7uR2GSIZ2gE1mUHWEpKrERgnPWgOdCV5ul
         Oh1+qs23UduhgUoXWjplbBUTk9H7asoZaQk3h7YqsOY6WD3wjXOheGabpDoEjvLt2wzi
         2l9BQRUapZ/YgeYmByFTVQNWbHy5ePRQnixJN7uX+IB+4V/sx8x0O16VqkRfa+yiZfZd
         vyEr9XPzUCCNiOG+6yu5UgSXM/ubWy3u0/qjby6tbrJzfzvX4TBQ+spa9HgYkMR1PUoI
         v3q2/RNFvHG5djIDy/fd0x7hkCSHqU22itl7l2Rbx3l+VDw3O6cOct1NYzOVPIlwupma
         triA==
X-Forwarded-Encrypted: i=1; AFNElJ87gQjWOcEyMYlufGdLN/fp1WX2m73Fm2Vp9dY7pbsABX17L53rT4OhDVyuF4SAuiuZWU40mEzhSh4Zslc0@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw0CoYbccHZd10AIkXULCfTfuRH/OkfFiYqGcy09Pyshse41Do
	mQxxwDIyEUNgQ8dauHvtU9brPQStN9hhO3H2ZcdarGZNZrFyd7QzCtbbDqgrDLsnAl4=
X-Gm-Gg: AeBDievW6CuymLc0YIi+EdRmFuDs43XmnJrMRIxphnL9ZV0tC0GmHinUU99x11Tm7GF
	SYGi37TFu1u2r9/eyRBdg5VaZ51GrTIR3e1yqFmTRErESbDZFnbPCMGNQOkKuwaKzTCpHLg6EzT
	mytaQPWudrKWWqRoZtIawQHx+88hwnzOI2/Z4JhOvs4FuCvDm7TXuap2oDWbgFzCIY8HaHguxuP
	aUUfSZiy8OMMJI50z5m2oCCQxPkRpACsFM62JqeX/0Z+GbeD7VYtgHoSJ8PEqGQEk7oq9Gm5fhH
	Ot+oZUTJY4RGVC7DeF4kSYu5dvdNAnTbwY4QVi6sHYStcHM+buTxUkODzVHXD4RMgNp1JM8yug5
	eFjlnYyk9D+GBv0qy2KWbcRE9oiX2uWRJUHHqoxQ/0BJjknc8twE+f/tThM7Qcf7erUPVqObUCA
	pw/m0pFrvBWKPe8xgKfAFwGZZJygEUyXKGgGKXm2lc0qotYkdnPK3BTNM=
X-Received: by 2002:a05:600c:5246:b0:487:219e:42d with SMTP id 5b1f17b1804b1-488fb750a1dmr369865355e9.11.1776936215211;
        Thu, 23 Apr 2026 02:23:35 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.41.87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5d27d6casm20573705e9.27.2026.04.23.02.23.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 02:23:34 -0700 (PDT)
Message-ID: <01851aef-6198-4fc7-8707-eca66bfab63f@linaro.org>
Date: Thu, 23 Apr 2026 10:23:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] media: qcom: iris: Fix bitmask test in
 iris_allow_cmd()
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
 <lhU_SUvQxoQO3vywvJ-vpfeDCHbEr-433DdDVZOZoUSML8R5OW2p8QjArvT3YbMeIZeOqwV7tolz25aSOxnV-A==@protonmail.internalid>
 <20260422-iris-code-improvement-v1-3-8e150482212d@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260422-iris-code-improvement-v1-3-8e150482212d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104255-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AC03D44FD1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 22/04/2026 12:16, Dikshita Agarwal wrote:
> iris_allow_cmd() incorrectly tests a single sub‑state bit using a scalar
> comparison

I don't think scalar is the right term here. You're changing logical 
comparison to bit-wise comparison.

Otherwise

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

