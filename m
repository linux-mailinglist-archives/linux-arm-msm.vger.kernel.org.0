Return-Path: <linux-arm-msm+bounces-112931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CqfpJOL/K2o4JQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 14:47:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED56B67977A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 14:47:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=jSKuNNrN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112931-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112931-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E11D3342D18E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 12:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E380F3DE457;
	Fri, 12 Jun 2026 12:43:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8523E557D
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 12:43:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781268185; cv=none; b=cJ0lRQgwFZg3TQ/soE0yoibhs3UBleew1A/Y/vIzXM1ro/O5mTsnGd1aJ0DD2tmW6VX0msAyfU8AaM+1thjJZnbCKrePGjUgDPw6gD92IKyHt/V6HohaSfHrVXaAh9TvnR3Ehj2gevGV1QK9Ge+v9qBpq07bb8y6smpLx94Xv8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781268185; c=relaxed/simple;
	bh=Iiq1PXcGNwUHd7cbL073bR+pauELfqNbr8btOS6HBIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lt1pdo9eCVL6HKWIYvvqYR6xcKzXonXb0U7P7t+a0X/MSiVyC3+0j+Vc+GJNx19VW6Lewy8CACa+DuJu6ol3bkUe2VE0A0H6tNbejhFsooTaJhYvIHwyNMRC++W3ICViLK/ZotDcF70yGsd3/Sm+ff7DmOlDfFh/wWHYHmWiI8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jSKuNNrN; arc=none smtp.client-ip=209.85.167.51
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5ad2e029a65so60403e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 05:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781268180; x=1781872980; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1MRB2sfzn7yah8ACPsk/oICHejeL/fVpNie2rMekDVA=;
        b=jSKuNNrNJtPCFWhT1W2dDDkGnD7E/him2kxkB2Yt/pxr2PgeVoDpQl9W7MECZeuRGy
         lcGsl4h0zt9tvGI8LHK8vL8NPC8Bsm37Id+jlPoj+aYUEgzh+Mqq14m+1hE1ExdCoKD6
         8xr1BnQaDIzUimU6OzeN9skHl3vTeA+q9RcvOb5TiTnQsTWtKS1RAREGp6tMT7AAjUqq
         EXRS05ZEYyouBLXTgy5CsFy+Dcpckt6zfCeWMmYTe36rrqdfyarMkt7AGh/wsDtwXBzm
         VyeNM5bHLamQuZOkNi6dRAKobxEtwrnsdEAejkrKcBGdfRPylPd6Y5Vg7G57U+ouvM+z
         JB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781268180; x=1781872980;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1MRB2sfzn7yah8ACPsk/oICHejeL/fVpNie2rMekDVA=;
        b=ju2jpmLN5aZ+1RVm35zKtj2GIeInSQLCYuVcikRxaNnvydXuOy6sZq7QXw09rDsk8J
         w6os45Afmqqn/emWvB8JuZhnkrSRswhT/QWUo2xubS2Rokt1ZBVCN5jGN2kR2w9WyorR
         +aEyz0EtiPqLEJsYZBknbQ8ogrgXeygGQVa4BS5nB9jW+jQ5Xa+69wQo/g0jTFz8EXfM
         g6Z39KckN28JO3MDSlyVnXlaSnmUg08PvG4p39FB1DVYOH/Tm7fzhs4ZDYjaK3xRg5vc
         5Prbg9rHripE5wlVn8j9sv7ZJK5RigF4sup1Q1lpKs4IGzKG+mg6+7zVjRzjT5fVKVM+
         Nr6g==
X-Gm-Message-State: AOJu0YzI+oX/EXYuAQAxAQRZJeKiBN/M2jGYQTkIIvr9vQYB2EKz2AiN
	7OUuVq7w9AYVbBi8l4Y0jEsZxr8DrLVi+++OHwfol/RCClhLBvECJcWq33rsNbfy7dA=
X-Gm-Gg: Acq92OFXEOVqsWpkWvNDl86mtYLpdoWwrR+ewskCVYiJ+NBzrlZipCMKQLrtqWC5FI8
	Jnpl4lN+imCwZPLFXjp8NO3/w0+PkZNEufwNbTt60DbB0WkVtLJqdazFQKsEyXoPnWAMIrl03Bc
	2YYdPbsCyjlfTc5BEEnrGmRDOg5xnDfV5z94nCGCMc+Ilg4tUNdUAx6QjbEqyXjT8JWpgFLQ3yq
	WvXZEcbSdeXtpMp6F2iQvxBFuUDzB6wkGAQlffZjJVkyg3odNyCU/DpTLdA/CmXXOcVezxByXRJ
	oFtDHAGmOIiLgzz4uOPdnh+ewD6JJeaGRsvHKctZZbH8WDhD75sVoiUwhLk068YjjF0MitQldEA
	q9bgkF9SANIIUCBzeO3F/G9+5xF3mKJ1y2Ey5pJkxYDAxWMKJbQvRPpz3TWU00cdXC5C83ekAbP
	eDpCWLahhD33uCOzTCj2ZfZ0Sw/z60+btI/NYrEM6h/y7V7QxiPrdCGIELJftA4+RyAZd9C5SBy
	Fpclw==
X-Received: by 2002:a05:6512:3e2a:b0:5ad:2e00:c596 with SMTP id 2adb3069b0e04-5ad2e00c659mr414206e87.0.1781268179989;
        Fri, 12 Jun 2026 05:42:59 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a733fsm519093e87.47.2026.06.12.05.42.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 05:42:59 -0700 (PDT)
Message-ID: <67bf6da8-bc31-4519-804f-63cf0dca3911@linaro.org>
Date: Fri, 12 Jun 2026 15:42:58 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: glymur: Add camera clock
 controller support
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
 <20260517-glymur_camcc-v4-3-9d00acffdbf7@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260517-glymur_camcc-v4-3-9d00acffdbf7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112931-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:jagadeesh.kona@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED56B67977A

On 5/17/26 20:33, Jagadeesh Kona wrote:
> Add support for camera clock controller for camera clients to
> be able to request for camera clocks on Glymur SoC's.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

