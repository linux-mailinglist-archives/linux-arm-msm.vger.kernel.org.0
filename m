Return-Path: <linux-arm-msm+bounces-99038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OscDLMTv2kstQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 22:54:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 308C92E75B4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 22:54:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3A2F230074FE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 21:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF492E5B21;
	Sat, 21 Mar 2026 21:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jRjvjkQ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE90A13B7A3
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 21:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774130092; cv=none; b=toWrJtP8YFASDpW3xkV8slFYrP7wXL60PAWFvOoUVT1k9r/FM7ubNQ4uLHsh5/Z1rSqU9ValXfSfCGVOwYEZPo4ZwDoSgmROZOY84shE4Q1ISmVaQN7sJe5jB8HyaPa1wHURDnyBrtyvWq66HN61po2EgoyTqmGzNvWsVAEpW0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774130092; c=relaxed/simple;
	bh=zytReODt+wWI+R2U3KRLzpb6j/vWNtuVQLp+zorDKiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E4q526QJ6WRAbehPnAxWnDlXxo0xZioV0tvMTZjtCD32DjQ08vVl3+vP6YPgYjzXp4+0JW1mhvF+McC13VjHkVilSxC1/gt7dczZ4LIxL6ol9u9JLZ5acdJIsQ1gkgpKSHoGNoVS0Sa/ioIy6j08nR7G47nR0br9GQlr7CfPydg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jRjvjkQ5; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486fe655187so22981635e9.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 14:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774130089; x=1774734889; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hJY0CaBiHi95RQbZ6IsRt49BnUeTTxWSTjwF1oFthmk=;
        b=jRjvjkQ5uwS4HNL7u1894cvBlKkCGqwXyHd+Ni5U8eeFZOQfnJCheq2mdSgkPYmuMU
         5OvxDcmxh8U0RNaFfKupLUPGElK9Y0jW7dNfNUDAM25rRdhaVOH00K6prCR16iVCXzbK
         Yr7e0VHwl4a4pQhmYt8obsJz4kZAb9G2Cy6YFIZv4s8WCKqDGP0I9VokcAgbYURFwmcA
         eY6GBnISIOMwbe/E2z6PUaRG0HHBzptS6P7Y8vHDr3W9l/CdUFMncE1noHPfI+wmx2OS
         IhZjJnUqGbNfdY8l+LOVxj7MSnaq/qaqG+ycrzWWCvtAFngCm6GBnJUTf44ZZyPCewJC
         pPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774130089; x=1774734889;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hJY0CaBiHi95RQbZ6IsRt49BnUeTTxWSTjwF1oFthmk=;
        b=YckCqRWC6A5Mz9MaS9wN3trlH5Ss3AeVBd1CYO/eFdpOiSExQMe0irNzmCQdVPKj0A
         kHAwRUVylzSJ0au6Aiht6LXDu8Kski+LESxEA3BZEET+A2eSTqvRVBEWfaMIhV6F+4wq
         LFj3cWc+klfNlGYyCSeDN/tMo+F9h1EhJagi2ocX5CEOLchTzH2YV0VVSaimjx1Fu0dy
         aa0tyksjNfFgXjYbxl8ajnaZ4aceTSgCijTHf1+cauzTQUA6bAEnEbfJXIxIMdfHLl7R
         e1512ITFarvaMT++OMqHy3vpwEWUGJje8z8KuBspxWe75vs5ma7bgGRXOas/R2r61E68
         a2Mw==
X-Forwarded-Encrypted: i=1; AJvYcCXXXSCfyF+PoImnFa/VH5lqOm5tCvqTQnqG3FmW6q9rEbU7JveMkFh+eN14zM+sbIuzX5tga/61DfhOckMa@vger.kernel.org
X-Gm-Message-State: AOJu0YyZuUt3uaS23vr02i8MXsFX8C8c8ZXBXCHYuWGnStWV/bQypxrb
	pQS9+PbpPI/eqXBM7sr6a5ku4RqrK0QPc4iClJyhw64gjTSIn9jIPTv8dLIhL/avCiw=
X-Gm-Gg: ATEYQzyyIxPl++FyrEy51ZJImkqzNedc+Zx7Ui/lu8pVxPYbTsyWr1q9UI6V1a44IXe
	0gZVRCF5PSa7K72yqJlaJzLtZ7LYCdYI44Hig3KG7ALm91VH7FM5g2F9uFucl7HazxeEkM4Chcd
	HL7A4q6tchZxa8jbNZb4QjWHi/39VDKgQuyI7WoQld2WVRfAZgAfN+XUQNKI0WsNOTe29Z7B7bK
	U91B/asFyUKHkV3/m3Vi8LHxp0P0h546M4nopj+yqNvvomud4DNSee9wvErVb9Y4QFQzX3jL3gZ
	TCc3+w/3AZdGMjEGtTzsprHtRMmIhuDzVvFtHassIXK4f7TjtFRM+6JvLNGupi1TjfRxelvO4O7
	8Fe3+eaQn8R2V5WF2bOPnVAh+0xGmSwEfv0Jt5SJ70PDiT8kfA49nXUlpmieXr311SG95TyzbZR
	URYrXs8NcUx/Cbw2LloQDpesdtRPhHkRdEMrdmxIlutRQt
X-Received: by 2002:a05:600c:3b1e:b0:483:8062:b43 with SMTP id 5b1f17b1804b1-486fee05925mr100751135e9.19.1774130089272;
        Sat, 21 Mar 2026 14:54:49 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.29.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff19d393sm47555525e9.16.2026.03.21.14.54.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 14:54:48 -0700 (PDT)
Message-ID: <fc1ff1de-2ca4-43aa-9def-4d5f78d6d7a0@linaro.org>
Date: Sat, 21 Mar 2026 21:54:47 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add l7b_2p8 voltage regulator for RGB camera
To: Tobias Heider <tobias.heider@canonical.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
References: <20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org>
 <20260316-x1e-camss-csi2-phy-dtsi-v2-9-859f3fa55790@linaro.org>
 <CAARv3RSQbAQwDFsfBrcrkXem_jtVy0Xttqi1UZfuNT86twxmJw@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <CAARv3RSQbAQwDFsfBrcrkXem_jtVy0Xttqi1UZfuNT86twxmJw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99038-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 308C92E75B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21/03/2026 11:10, Tobias Heider wrote:
> I included this in my Ubuntu test kernel builds and got reports about
> reboot loops
> on the Lenovo Yoga Slim 7x.
> 
> Your change seems to be based on
> https://github.com/alexVinarskis/linux/commit/ 
> a94d1f4e1d025398060d7e0dc2270b8e375f6f60
> which I had previously tested too and didn't see any issues with.
> The only difference is that your version uses different
> regulator-min-microvolt and
> regulator-max-microvolt values (3072000 vs 2800000).
> 
> Setting them to 2800000 like in Aleksandrs patch seems to fix the boot issue.
> 
>> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +               };
>> +

Thank you for investigating this on real hardware.

I choose to stick to the regulator values apparent on the adjacent - but 
apparently 2.8 is the right value.

Debug appreciated.

---
bod

