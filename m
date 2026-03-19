Return-Path: <linux-arm-msm+bounces-98707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGZ0A27Pu2mXogIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:26:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC5B2C973C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3601E3017FB2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82CB6352927;
	Thu, 19 Mar 2026 10:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dq7Ycd9C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7A4313E33
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773916011; cv=none; b=a6nkUEtoXZi1mY7tSgrTO2NyQ0u7kh7yVIcbY3p2xt56oQWi8vdOK7hrhY+U7IeAhT8gbYE2SU9dEwMRNtEXb05k1RybjJgwfIcjjiUywmXHjJMfSPrSB3Bu+1D2l9OkPOxyKBv148r7FXaNgj/mDmDbnU1jKtQtf4e4d1F9yho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773916011; c=relaxed/simple;
	bh=rUtMxaP9QRTwUVBeEaGFmIV3Cd9OzofRgzT2a4u/sK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dC7mLPMLSKR3y18GXe0qdsGy972Jg24lDJZTW9Ko+U1AIrzcpa9FN6LeiU6XeeqYR3hVaohpWryuC7n0oxQ1xXEiDs6hylalRV2QAWXWpnu1Jbz42U3lK+JqOHmp354KaPnP6x29utU0Ys6mD1iyGMMOjdT0/mfn5yGdck+yiBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dq7Ycd9C; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b97d5b790cbso86563766b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 03:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773916008; x=1774520808; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/RHux1c5L1Wyqd7M+sBZICQ1QO1m5oMRORUdGOoQ7BM=;
        b=Dq7Ycd9CXQowV5O9sjW0pNJcHL61HM4IjBbzx9CybJ00W81oF0GxQQRGaf2DArrzck
         ovsN0aRbPm2iQ/OP+k993Bry1EcgeUh49b15naroLh+R91NjVgnK2wBlDsBZDdKPrk6N
         6azC4SYTtpxBYTMhTt3NRs4OB2vWWKgq583Y6VAc1G9WcyIoG0fJoV0BlqafwOuFdt3g
         /wg4BxYIgSnOY6x/fVzzlsGt5DhY4UHqCk4b/0ybq5SNRB5qTZ7jrEFNtUypxq1ajf8L
         6xoXQP6kkD3AYTH3z5sm3GSOQkMWrxldMEyCM1018H99L+StJb+ECpLD0W8VWjKCH9xq
         zeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773916008; x=1774520808;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/RHux1c5L1Wyqd7M+sBZICQ1QO1m5oMRORUdGOoQ7BM=;
        b=DRDIHgvUVIb9hBg3Pd12mg1Lpb04xDq5QcedEYn5EMUDFsUuje5fmgCaeWuyXqPGfP
         +02RoQh17GaYipH5bBR7qcy/vJuFrt9po/vwZQoucf4xwjI30UF0PJtN9X8yuorQKbPb
         qUoa0ALYPI7oV4DO69CQYZ7r0Jh3zWeqGkHmMpNBA31jqbmAI38CyRJ05/FRTlnqmbeJ
         cs+PnornJ9vf2xLImmRVs05FbMOXrQ4T/eiRNXjN2fbyuxS4x3kxgIL1V6MpR1kcr8XO
         rAoVClklYs2rB1eW+Mr3X53arpGEBS78Gt7nMm/KWgbucuZe/Fo1cno09EJZ5wN1cMTI
         j9rw==
X-Forwarded-Encrypted: i=1; AJvYcCWWQV46FBQ9UQmxj0gEKRg4NdyqFaPn1NUMc44hR9wGSi1AXBgl8Hkxvf3qfyEH/RUMQ2qH4CR4/p+boYfg@vger.kernel.org
X-Gm-Message-State: AOJu0YzMJYcbW340OiqoHU/V/un5wSIlYTG7Bdv0rkW6gQX9fveegjG8
	OMze1CBiST5W9WUXO4dnPe0j2B0VyfTx9yuQJhlGB3xX3MVIhEyecztf
X-Gm-Gg: ATEYQzyjFCUjW6IUp/vhU8A9jl+GElEY69a3eRNWQnDlvZEQjCdEs9oNA2G6/3YCi/+
	+5SuGF7u0UniwQTAo4DlK09TGGpnr4m6N3VWNfNyjt7OCHvSOxm/k11W3yUuwJ7TahzhGFn7KT2
	O6Q8Z3MRCxTUmKNnS6D/ynt60iyz0LgI0EyI0/DgCcLL7MrhQPqbXjNNCf4BfgA6BFKlNriu71T
	SPOPZTtYAbsxb21mxIuA9prHADy5d1EZZFXLz7Zwa3H+UAYNzJDajR1WPQu9Kg/jrUiUJow7pyI
	asqBM8Ru/fhUu/nbPsN5JlFu9hofq/xseRoSeaJ/hsZfMt81OtSS0EDTraQv5wiFuWALoYHifEz
	I99mqE+orsD4pbK1f8l4tVE45v5L/5yust4B9XaQKVXAPpCwhttz4DmS3YUX1FM556ggfPu9eY3
	X36ncpcSTJnmhCoJ2Uuya4Q4kxlx2bqpx7Ake4nNKmM98t6WzLDb9VHw5CvivfO+5YGj8Y
X-Received: by 2002:a17:907:6eac:b0:b98:cb6:e896 with SMTP id a640c23a62f3a-b980cb6e921mr228034066b.38.1773916008159;
        Thu, 19 Mar 2026 03:26:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f172bcc9sm422008166b.57.2026.03.19.03.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 03:26:47 -0700 (PDT)
Message-ID: <b56abd7c-1fc0-4627-aae5-06ec8c47ff15@gmail.com>
Date: Thu, 19 Mar 2026 11:26:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
To: Alexander Koskovich <akoskovich@pm.me>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Jonathan Marek <jonathan@marek.ca>
References: <20260318-dsi-dsc-slice-per-pkt-v2-0-0a1b316f8250@pm.me>
 <20260318-dsi-dsc-slice-per-pkt-v2-2-0a1b316f8250@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <20260318-dsi-dsc-slice-per-pkt-v2-2-0a1b316f8250@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98707-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[pm.me,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,marek.ca:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7BC5B2C973C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 10:54 AM, Alexander Koskovich wrote:
> From: Jonathan Marek <jonathan@marek.ca>
> 
> Some panels support multiple slice to be sent in a single DSC packet and
> this feature is a must for specific panels, such as the JDI LPM026M648C.
> 
> Use the MIPI_DSI_MODE_DSC_ALL_SLICES_IN_PKT flag to derive slice_per_pkt
> from slice_count, note that most panels are expected to just work with
> just one slice per packet.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Matches various formulas in the docs

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

