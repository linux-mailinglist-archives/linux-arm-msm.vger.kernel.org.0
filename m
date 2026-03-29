Return-Path: <linux-arm-msm+bounces-100599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDv4LqP/yGn1tAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 12:32:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5788351947
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 12:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B08BD30072A1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 10:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 341B830E827;
	Sun, 29 Mar 2026 10:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="btvqxH6n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB85330DECC
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774780317; cv=none; b=Ac161Tkf2fvU9CSCHWBOGcYRHt9R3rOc1/2ndeuCaLCzzCPmg/fLYJF3OMlNSwP/fgSqfvGolbwXCLyZkBf5KVWD97ducT27qn3hojFjvkU5tshS171ISYA7zi6fA1eTOd5I1kNc8UEjTM8okhar5b01pa6C6qSqlgQI4+q+yw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774780317; c=relaxed/simple;
	bh=dhNXEHIExnX2f1N4l5eDf+K1LJ9NNaGnAN9f1+YcNoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oFjX6XPZyMMNwQ8UJVmkRDLStDcjyTGIj2Ij6NH/KVot6iRC8QR6NKbbmvcPyQYnRwvb6PCqBGwAfwJ15HMLqPp7YCTHwj01+JGz14jo4xi9kQdgJLsXJEQL1PyuFzB5LDbfcE0jacwbd0P49/gfxvRJfr/7d4OJl3xuuhwXXBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=btvqxH6n; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486fb439299so31918425e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 03:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774780314; x=1775385114; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FbEfcfX+u+PNt8MJVjHcHvkNIFPHR+VDZcKCREDq0jw=;
        b=btvqxH6ncqZRl3he6Rn1vC9Kf9eRHEuLCHaLtNWMYsgySngkVZKNpe+otVFbugqr7o
         JdBaG3qvpag+49ISmDFapmnnIyLHpPstUg8zeU6TYhTeAM6hfupV8b6YiMqjqTcSd1HF
         lSxZXnvv86LUX2fLGFLF8fJvwIWCUCUJvKvRGMzRp/VGUrIHNoGSdwgRTPoD3DQ5zq+H
         WVTEzt2tdwrZbmSZnmMcmZD9rJ2/bi/iElP2DMIb9HJyxBz4zgIIc5GLv1wMU4OeKWse
         xj3NGzdXNZKgYZXQCduVjE9JqHFWvXkUbZl0RiobNHOddXnZ+j6B9VnciPVLgegUkjZg
         khgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774780314; x=1775385114;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FbEfcfX+u+PNt8MJVjHcHvkNIFPHR+VDZcKCREDq0jw=;
        b=GHnhILCcMXIIAYqSrGq/rUg7mOa4c/XEJKeiSK36iVObXwv6lThh4O0rqFyD/o07iK
         2oAuQYfYMY9HoPQ3qocu6bHpdFAoTFYSu7DD2N1Y5G4dSAb9SjC0GClkbHpj+heTRxEW
         H1bIb12REnIt8Pa/QtqkKQbFBB03LwtHwpma4Qe2cLYgr7yfMWYvw+kubzEs6+Q4iMQ+
         PSB81DO//7gcEvXS+kKUtFWFo1RNFwmS0t7FXl8bBIPhvcPoS6WQhr37O5jhlkOAtREd
         GlzM/2ijXyP1FZQ6J5I+qQaqgD0F/1tW/4kHrFXboUFT3umqzpA6jn3rsbLICXnvb0XD
         s/QQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8xXEoHv89QJZrPj4J8C90xTi+z3d+Kf2bZ9nX4KKhd88zSYwOs6lsK30uHu+20Y3b1GP5K5jwhn23ayeE@vger.kernel.org
X-Gm-Message-State: AOJu0YyeUVw9who8ARalDUzXH29RT6q38W7x/ZHsmPQdLoEgukXZ+lwe
	VP6ix54vFn4dNUHBak6lh2hi6PFx1j4Q8T+kmHablCluVRDYcKNl304odE00D4EQjeY=
X-Gm-Gg: ATEYQzwcmkQNMNc3os/1X8loNdM7Ugg/VqFBkPh6Fx+MgUcY9y1tmiPPVw2G2ZwyZ2S
	ZSAqP/ISuTAxQ3IEkKkd2sKMNa1hmPXmLUVSPAmTiBAjmYbAbDJDRMJJAvNqG8PRYwaBxiPl3vg
	VsLenHLTu9xjzaiIViP0aH9/N+3M5qvn7WspGQfNvb2h7RW/3OZqHepHKTFYcC/bmYYSziegsHZ
	M9xS24ndHC8jnlYdyzi4BGxzogH5R7hua7AbSh6FwuugovYV0Sa0huPsyZ1Esc4N6B+L0sC81xz
	zB8CftC2b2EcGbxZN51pXUh+WS6toGTmcVhcaurrBGEtXszBoH20DhinmfVTKRWJl19ZhmygoI+
	WaSWFy68kwiLFxEtsuFFSFLzpLY88o2qs/ekO308hOX164z8+BXJC4qOw8KEyGsSVS7v0E1zpd6
	OVdFzbxDlPRo/to5a56fp7IeO8QOAi5Rk=
X-Received: by 2002:a05:600c:1d1e:b0:485:3f1c:d897 with SMTP id 5b1f17b1804b1-48727f0b0femr145120625e9.9.1774780314061;
        Sun, 29 Mar 2026 03:31:54 -0700 (PDT)
Received: from [192.168.0.35] ([64.43.41.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b4d0sm201579705e9.3.2026.03.29.03.31.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 03:31:53 -0700 (PDT)
Message-ID: <6309703a-fd61-4224-b9c3-6e1b88ca168d@linaro.org>
Date: Sun, 29 Mar 2026 11:31:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: qcom: camss: Add per-format BPL alignment
 helper
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 mchehab@kernel.org
References: <20260313195152.275196-1-loic.poulain@oss.qualcomm.com>
 <20260313195152.275196-2-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260313195152.275196-2-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-100599-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B5788351947
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/03/2026 19:51, Loic Poulain wrote:
> +unsigned int camss_format_get_bpl_alignment(const struct camss_format_info *f);

You have a naming disparity between header and implementation wrt to 
your doxygen.

I will fix it for you when applying

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

