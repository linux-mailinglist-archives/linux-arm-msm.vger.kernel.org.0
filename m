Return-Path: <linux-arm-msm+bounces-115740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oEpRO6Y4RWo08woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 17:56:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0EC6EF691
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 17:56:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=sRXLRewA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115740-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115740-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EB2E30048CE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 15:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48455428473;
	Wed,  1 Jul 2026 15:53:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D463358DA
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 15:53:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782921213; cv=none; b=iewup67CHbwGPlSnuHqEUjLwRvgTvbVnLvzy7OBBs0UdcMp/rXsBv7EXmCqBJX39icOgTbmZMXJNoV+9cLp0j0hNGfNE3HdbLvdVDrwqxRQKFAWt+396tfB3bNI9KnEhOBr8HXfkw83I37SZPRDmm5U0wtBNzNjElOTIn0K9uZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782921213; c=relaxed/simple;
	bh=W5gcoFcrKtfbOQRmfiTSBojpOsV5BPmx6vA/jpWZ35Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a50Msfcjv8P/ZcrgJ+pJRItZFTT8hyPX+fbye+CIxfnpkluNLWWnCyuGInJH6yOLlIysyLT8k8+Ww280nOsN9+gurXTmq3s4Gsa+HS7ol16Btixxh15R+3eu0NxjiHa14lF9OPm7wYBEf+OxvKFwtu4je5eiogn21+t4pwpuM88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sRXLRewA; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493bf73ec2aso4861535e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 08:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782921210; x=1783526010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=upLoHwuqws7rrBOx3O6MmxFWpeRxrfgF8hyyVKwGdoE=;
        b=sRXLRewAcpxywLpg1fpYvOCs8BbfGI8w7bxzyV1vma0L0NnTzAbZlGY+nFzUpmz5nq
         bTGf02X0WsqjcjPU/Loxj7Ckz+6X/eS/ki+FlIvwX2EnMxfKJlktdHHvQ6t8iYJrGbyF
         2juAxahR6Xhc/2cHdL3LacMcYI3jt55uX1K6tHT+A3iySWMdlB5QmLqlQj/gsYnR4XWw
         miycVchiLl24iOMcAR6IVW4b7CoHtw722ASrYs2qE6gp+6+/Ux1YAx8AU2oqx64OSsug
         dsnrjjV7OqhfrGkejEANc6Cnk5PpGZ/r1AE2An4aIPQUfx8i0vesJcCv/u05F0dHV1wf
         X47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782921210; x=1783526010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=upLoHwuqws7rrBOx3O6MmxFWpeRxrfgF8hyyVKwGdoE=;
        b=T6QxF51i1JvIQ4yOkOhUPSDlffbaZySfwQ9MYA1q5ulj7e9WGVOqyi8q0zZMQ4nVvG
         CEjY911MDGgCMh/SZuw4Gm5MHI9o7kBsmQx3jB9DaX7zXT/9wYE2kW7eXAJZO+Qw9QBU
         NAIZkAqu6/KsKJlraTfI26hYQLWlo1If6DwkW3RojQmMDnC+Y6/E5veyoZdC8Ddu6ith
         jf5Fi6isflI3Dl659EHyfBG2Md1+I/e4mDFd+U2XuV6kNTMr8e66kPfCijVA/cmhYx31
         rFnm+iJqcfrkvYVxxrOGMDeYi4DTK08OAFen6+ZFs31G4vHbnzExOOydmi2e6ICokBDX
         3nXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+T1EK6Avmwi5WoROitfaJrJdguXPoxCEc7lIiUtIGlcDfWCWG+t/svQ2fb6eW/iDXI0Laoaj7lCoK2/a8j@vger.kernel.org
X-Gm-Message-State: AOJu0YwIuDFTVzdpqojqH+SBdTtUZPQcX4poZ2ee5bGvx5ihOjo1X71H
	FrtwXxyft7wb8rC/N0sJbKKgxNApKcTmQF2vARVYN8YHK7oS0qlVJhuuBHPqCXr1rD0=
X-Gm-Gg: AfdE7cm+sbFEP2H4nE7eicxT9eP5J6lBaGMFmYZ5kw6Z3GNfdld8dZZA1JGT1KbKsFJ
	ydmaUK3eT+JWA0rDTGQbkVWw3tzsHqnIxnlMDMO6BxKNntHnFwxD5gwaLsGTvL47zEZh8LlNOnY
	2Pb/o+5I5VHE5qsKfgRaB42Xd3+Uum8EE/4boP+T+Fox9+SypQvIa2vhqSO26HRQk92iM3gGRXc
	GN0dqEYqjbYaY0MCedLcW4foh1J8KH9a1Rbt3AQp1G9LP7H0eIdBFK+vhAeKZxfAuyTcQWS0Wwm
	FHEIqcOkLzrfUUQZQnRraPXlfRylbhIi6c9Zz8d6o0Ix2jhKC+1waWnc5qn6Sbxlj4KMuz8uxxf
	2q0GaIuYwuTNnOHXFUKy9etEvBoho300N4oAO0wLXBV/RRO7tfZUU2m9KGfo3vFgTQT8ipRE/DO
	mZJlxMnOZfsb8BXl+3WNydQsw=
X-Received: by 2002:a05:600c:c171:b0:493:b6e2:1b0f with SMTP id 5b1f17b1804b1-493c2b99a63mr35052815e9.33.1782921210480;
        Wed, 01 Jul 2026 08:53:30 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.66.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d8f5asm127457835e9.8.2026.07.01.08.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 08:53:29 -0700 (PDT)
Message-ID: <cdcea32f-0160-4501-9dfd-9103807c4d93@linaro.org>
Date: Wed, 1 Jul 2026 16:53:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Bryan O'Donoghue
 <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
 <54904b61-222d-4600-ad4c-c03a9952d337@linaro.org>
 <be3e1abe-5148-4247-930b-2e23164eea73@linaro.org>
 <c6aetoiz3dcedlxwjmt5cqh2mngswtmanf6p4s2molemnviwdc@btotpaqwcsoy>
 <f6c91099-0002-4580-a5e8-5611b089024b@linaro.org>
 <v4vz7cistjb2iuzha4oykglar7duw4y2uuyhumzs33yvpwrxcu@i5tsg4uzpuwc>
 <8eb709ce-3469-4303-9c3d-8d1a221cb8de@linaro.org>
 <b6a8c860-8b47-4250-a428-5225d0e64a1c@oss.qualcomm.com>
 <htxqjgwjczsghunsbvo44lwkadzeg2kp6wfcksf3hkmcubvs2d@cw5r67uxskvu>
 <59331aa7-8430-4754-861c-4ba6a4810ccd@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <59331aa7-8430-4754-861c-4ba6a4810ccd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115740-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:nihal.gupta@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:vijay.tumati@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,linaro.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4A0EC6EF691

On 05/06/2026 10:31, Nihal Kumar Gupta wrote:
>> Having clock-names property doesn't mean that all values are valid.
>>
> CSI_COMMON_CTRL5 is a physical lane power-up bitmap:
> - Bits [0,2,4,6] → D-PHY data lanes(LN0, LN2, LN4, LN6)
> - Bits [1,3,5] → C-PHY trio lanes(LN1, LN3, LN5)
> - Bit [7] → D-PHY clock lane(LNCK) dedicated clock enable
> 
> In combo mode, only LN6 can be configurable as a clock lane.

This is a really excellent comment and I'm going to copy/paste the text 
entirely into the driver as a comment.

ty

---
bod

