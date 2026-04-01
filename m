Return-Path: <linux-arm-msm+bounces-101316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPt7CEv/zGnRYgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:19:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4C6379426
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 648CF30C630A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 11:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F29A1DF256;
	Wed,  1 Apr 2026 11:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MwxJJyLQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E642C3251
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 11:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775041520; cv=none; b=Ldx00I4+9QQZ53fCyJ264YYhYEj+LKugXuhxoVOGK7vNcOb/m4pJboOiAug4KkrzK/509cExr2mrm48CRwimXIHNvhZgESF1AsgRKsizxcxySI4S2CHN4a+wP0V5JXCNlIs66auRTnPK9FwyZHJazTAFo30BvWg9mvAVmd6CPpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775041520; c=relaxed/simple;
	bh=om1doAdG2PMAv9rQ6C/z/VNO3DmdhRZwcmQFk9Vnqy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hHs+0xbN6YNvG3+atCXH7IhjhRqBUKyTD20iYIxW/Loru+xOocBNbCz8oTtTQdQbCzJwgXYsLBubEfHKSPTQfMeIxy+bJ9qLAIJ38jvmz8a0IeHtN/ZEmNJ+B15/UmV6oygWgh3TIZKGryWVeJPEjkHmGjFRwbHoDvTP5CQ1X7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MwxJJyLQ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso61386105e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 04:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775041517; x=1775646317; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HBGBJDQ/gRb2ZWiVOaSaUlUwjskXrH5SbODqYF4ayW4=;
        b=MwxJJyLQ7TkzsOQEuDMS3aQ5MCPLtNV05Zx7ZFJQJg1+cVgFzygzln6QmIjgLNv4Uk
         8eVxWSAMDMl447kLXj8sPezmkQkx5BokGxstHbLMHww10lotwivBq8E3oNWX9w6sxbw3
         kf+Y4RwtfwJavFB8EQHmaDANJ5vOT3AFd4Wpv89/nKIpFIiE21A5bgiCGAaOplgJX3U4
         3Y35VYdJORWmUdKA8c4ghTAPnXhQhdrJ34oX6lZYgsmL6muUHgcMP54kAP1FGUhlXNz7
         9+AC1ajqXHKG3CMEDJRoUh/kJkLj8twvztJHq0xqHCWI9kKmQRP66TxrtRfiO/Zaw7K+
         K7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775041517; x=1775646317;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HBGBJDQ/gRb2ZWiVOaSaUlUwjskXrH5SbODqYF4ayW4=;
        b=HSuBWlXruZel2WQ1XgZwaS7gneF0XrSzn8VP5aXnRYzutjXxF6gaM7aowUtI0NlI1Y
         f3Y1dxAJiRwComCtAqU10mT+X+GUeab5eZk9S5kmBfvJO3/c38n81jYrJy/Z1g5wcxLD
         EKRVh4TubDDEnGkZ2jermoWdqJq03Xv5zaMXJ0bBMvU+S0UIP9dHr4jcabsTb0WMfHgg
         GtgIB4JIA986zsP8uCN0A/z31IcbPElTo3O7BW9Hy9u1SkV2ztlLeywa4w+6D47zovZF
         nARcleXU3EWvsBCns7VrGpneaxaRuOHCiHaE1pN32SmEX5cRXl6ypb+QcU9Ufgku7yo4
         BTyA==
X-Forwarded-Encrypted: i=1; AJvYcCXQ8GLuvS+0SIFgleZBrqGzVxya83nx41tGuVpnobcdzT+9eXx4xtY+Q74NehOJNpOjI2BkX5G4RZ5XUQpi@vger.kernel.org
X-Gm-Message-State: AOJu0YyFEXl8kIn82eq0YHYdlPFNH044bwpsYpyPWc56O1unfJQ2Cy0w
	7vPU8+pksSxmJ3DXQ+gucbFbSiUlz7m0WCNnF6QGgmPMVj1NiqxttJpiMXjixHcP0sA=
X-Gm-Gg: ATEYQzzyE6RIkUF/BWnyJo4OHnBkwEpZWyAKPFCNK5s3rm2uLuk63khnCkQubFoLAOs
	yQ2KoMkU43HL7eKen0djYAjawxdiVcShgDm3fNTugj6wgqG6XKIxfvJNfoY540qsR0y0qv3b5ez
	ZbKumEZjfzsoEojXzAUKXsFsRynF7nJEI30nrZMo7Irx1F3oPzEq5NOLY13O1BfOagtEElhmffZ
	AvxIYfbyu8j5XpiISdDgkNnD7WVEfFc1puOE9aT6pRqY394oCFNA7tX8WInHttPqMZN9JhbBb3l
	skFMdfXj0GdzDv23b0NbO6SYQavb0uYyeq2xDklylv2JjJoinIBIuQyBYjG/b4GDDnjcNOcMBlW
	+k8zQGU3U/07olou+Wi2i09tUhKhec9ywNV3RszpulGuwCSYu0ZCL06qOdDuhJ37BbhFvvTj9zD
	w8nFW6QnyPdY1q+uddN1fYnJw+Up9OF/KL8Mg=
X-Received: by 2002:a05:600c:4594:b0:486:ffa3:55f with SMTP id 5b1f17b1804b1-488835d0f0cmr51363045e9.27.1775041517450;
        Wed, 01 Apr 2026 04:05:17 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.235.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf90424fcsm30627349f8f.32.2026.04.01.04.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 04:05:16 -0700 (PDT)
Message-ID: <69b993ce-07b8-4071-ace3-9a33147670af@linaro.org>
Date: Wed, 1 Apr 2026 12:05:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dikshita Agarwal <dikshita@qti.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
 <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com>
 <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
 <0b41ee7c-83fe-d604-b750-8a5a0bd62bf8@oss.qualcomm.com>
 <CAPDyKFrO3DzfG0aW4z4w87j_iWM=3dpvp=2Wgr4MX1Bin5-6ZA@mail.gmail.com>
 <6yfn6ux3gbin2dtopdxxv4okinspueryuey5vfdq633gsewc6r@ttp56brnpgvr>
 <CAPDyKFpm7ujNw51dVpPaHCwssjgYe1JVBEyrQ_1CsPbDJuW0Ww@mail.gmail.com>
 <4fiyjcqt5smotudsfzyqrevxxnx3sf5grbgfluzkndbp2od6pq@vlyikcvl3xkb>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <4fiyjcqt5smotudsfzyqrevxxnx3sf5grbgfluzkndbp2od6pq@vlyikcvl3xkb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101316-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8D4C6379426
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01/04/2026 12:01, Dmitry Baryshkov wrote:
>> Right.
>>
>> Since it's my mistake, let me reconsider. If I rebase my branch and
>> share the necessary commit through an immutable branch that you can
>> pull in. Would that work for you?
> I think that question goes to Vikash, Dikshita, Bryan and linux-media
> maintainers.  Bryan, what is the plan for this patchset? Should Ulf
> rebase the branch? Or is this patchset delayed for some other reasons?

Yeah no it's grand, immutable tag works fine.

---
bod

