Return-Path: <linux-arm-msm+bounces-95637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FFqNBKBqWnU9gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 14:11:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC15B212741
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 14:11:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E4745300620A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 13:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6DB73A0B10;
	Thu,  5 Mar 2026 13:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wwh41uvn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9264A381AEA
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 13:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772716301; cv=none; b=FKk0fjczLnTQhxMnxoZSa+1w38mtkxCvMbRlffy5UL9nP6AHu4CiMs4nRGVNcG2fzJoYB/8ZCgFDQo9AAtKjiQ/u8OUZODtsLJdN75BeBbHl6UdmGPZrQ5RLIWaKmxzLwWsmQOQC4S8msiAOJBvYBGc4DxcvLk3/SUnMWN+XT3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772716301; c=relaxed/simple;
	bh=VPPvql0d0tqKs01yrymniWsmEm+rSLmkjVnK8EiE4AE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=in2LNEQyrcgWHa0dD+dxOZjzfCbq5EfIpjl1Rfy44PJePNLsn0knjkBzw+KxucoQJWbTX+Um+rwSsgQaIOXtUGHzrefKoDjoyw3ru1rqiZ8WprHdN5f4NxnBLN+YbC7UJ7vRNMNZqSACXFYAyzyRpi9UUuvYOn9kFWOqxsVPojU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wwh41uvn; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48375f10628so53851585e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 05:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772716299; x=1773321099; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VPPvql0d0tqKs01yrymniWsmEm+rSLmkjVnK8EiE4AE=;
        b=Wwh41uvn+irwDe5oX6jQKJH62OTy7VPFr7bXXBd5kiIhZZ3PpnK2zqptgJxdPEdsD+
         wMn7qQbreyh2CU8wCEFUCkL/VGDnc7g+C3enbjB8eRUZR0TVTZ7/01DJ/sY896xUyXZH
         6h+FaSqLy7TteqTD4R861j+bxW81hooGohbUDjYjNXOUNHAE/9FnhHqq1wa4wDf1U6oe
         ulLT5TRjef1LDWgNPlYyE64Bg3nQn/enmfb2EWPzK4qYzsE17NbKoEyiNYjG8MhcHxm2
         EY06oUY0QcjCAbuozqxWzSpCvk+ZG+xzjROLs0zJ5DJGEdUQ17F59YJr5ED2Uqq2k75i
         547g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772716299; x=1773321099;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VPPvql0d0tqKs01yrymniWsmEm+rSLmkjVnK8EiE4AE=;
        b=rdLdgIZJ1a9WafmyPiWglHrojsyhjJGI3kP49NhfI4UqqGyAt8xL/I0X+5xMdesePQ
         tkLu5JJ+IA/irpctfysH82S0kHg4mB1X8t4b7zqieSDp91AtMatbvo30au79x/oKrYu2
         HQ9Vbi9cx77dsjwKo38mTKrTvbkE+vXpQKFimbYCY8xL49rMOkKSkwPwHtZItJE1JYU3
         L+3spcXk3lb+200G2P7K/nkYrBSI04MXE9lQfTlKkg0zfoASjX6jmhW0G/E5DAP7Zb/4
         qGmC3iih7aLLcYY5m49mbzajk+La7LUJ73Zqqu78WaMj24xsZYrTd1+UY1LcgZ98lRcZ
         fxLA==
X-Forwarded-Encrypted: i=1; AJvYcCVFdOTzXq4LcQkRk3++p5io6QMfNa6J2fTkiqMG7SOrk4AKD4Sts+6AgMg1uS9CLeJP3R/mZeqqrUKSq6PP@vger.kernel.org
X-Gm-Message-State: AOJu0Ywonk5Ce1kUJlVau56njkBhzDR6i3X3LFfHulquXD5mVR6tfvQv
	Y1seMA5tewuiD2ojokwzS2AudKLAa/MVvqgsT9/e0XLF5O2qvte2fkcAXxGURJKhnfk=
X-Gm-Gg: ATEYQzzI/qmBIOxsOSbROw51fX8wDGOMlzVM35RdG1IEPbDyxAMpseS3ddhhDqtvfpq
	7yjd5C2Gtcn1Ajbgn+4xqxFPHAUqqCV4kYlpFu/g1jzdSl334YzR94FIzzKmIBnT5bByPyLY+2C
	1UASREgo+REAeMf08jmFAcxFsZPsR4/pI/I+HLDk9LwPBKlvdOSs2WBYUSIVKULC9tFOACYfbsf
	xwKFbECcz33eRUBCjA/G2FVBGXe88MW8N4VKFx7P38fz4daktni/62RkK+7llsYR2p+S+8BpLA/
	RaXLAkZuM+U6vUHC1CQYv8S+Rl5UKSlPGH+DWs1cE3k+tKfr8OArZT8zuAql2/jQ0sp22XPQo1R
	nEY1nqQ3HkYxw6Mr49V3yXh8Za8qoDKBORHo35va1gHzE1cVWwP3bFfcieKhSQKGlRWylOaow28
	wpHMgg5sApKc/hJqwmK9mIXTNNdmfUMO31BNbm3/avYYwXXcQUSKKnUPbhOfYT0OwPp/XT4ZTEO
	0U=
X-Received: by 2002:a05:600c:19c6:b0:480:5951:fc1e with SMTP id 5b1f17b1804b1-48519839402mr103596085e9.11.1772716298965;
        Thu, 05 Mar 2026 05:11:38 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fafe4c9sm53169005e9.15.2026.03.05.05.11.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 05:11:38 -0800 (PST)
Message-ID: <1a22f7e9-8a48-448c-a035-7c487e81a96e@linaro.org>
Date: Thu, 5 Mar 2026 13:11:35 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Rajendra Nayak <quic_rjendra@quicinc.com>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
 <20260304-purwa-videocc-camcc-v2-6-dbbd2d258bd6@oss.qualcomm.com>
 <3f69539c-7383-4321-8cc6-1f5a8cc23822@kernel.org>
 <dd256b85-b88f-4163-a1e0-52c976089eae@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <dd256b85-b88f-4163-a1e0-52c976089eae@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: EC15B212741
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-95637-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 05/03/2026 12:00, Krzysztof Kozlowski wrote:
> Actually I checked now - all the people reviewed commit without fixes
> tag and you just added.

Eh ...

Please don't do that with my SoB patch !

---
bod

