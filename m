Return-Path: <linux-arm-msm+bounces-101170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAgrDeE9zGm+RgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 23:34:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 885C6371EE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 23:34:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C891730E5967
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239314534B2;
	Tue, 31 Mar 2026 21:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iOZ5jX/e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461B145BD7B
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 21:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774992160; cv=none; b=sN4ixxVCU1uOJkF7aWVFBQjBGC3ftlyughtoHi1kTrmKTg7oPUUiQzfeVbhPxh8Cg3hn72m11tdkGYMZctjEDt0w+fvAm6bNclyX+2b0V69xt6PBiNR8XF0ffp+gXjJpW+gWl1fgX9ChVOrt4Q14dmV5YrUii8FtLmLMSSblpRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774992160; c=relaxed/simple;
	bh=uwkdlpWgq7m+FJ52JwOjJT59fNwjkGLpbAiJPGbrgqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ib5GUl+PwitDf+SBZAPVx+Jwt1iyR7cPN7LpzU+wai8I85vHwsopcyvTxPJJ6kyOlXzdyrfWdEunCBSG78Wf8TL5AEyCZs2h1fGuUnM7Y0aW2YhKxb2OgyfiSsp/E8MoBY1AcQ04HcMaDiaHdeX6NMbXRa9HJa1W+raWdoMAUT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iOZ5jX/e; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a2b081e87eso534048e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 14:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774992155; x=1775596955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCku2Tmc/ePL7URZnl/UTImZqNe4IEEZFyzUDR6AaVo=;
        b=iOZ5jX/eGS7OqEJxFM1ZLRaWKd5DQIs+9WPUWes7zr4p77h72A3a6SXNz3IK4KDmQz
         0NKSgEDedjHc7PVKwIshWChJVCzrV5Z73iLwL2uF3o0rOfY86ZDTyfskLPDRYzyj4KrQ
         kton6KzsiDPXMr7XEnUQ7wlKJ9q3OcUNX8D7qqCj9iB1tB8tlYWMqQ/dag9vWkEpZho0
         Tv8yDWhDb0DqfNOA0SVV8jIF1befvdxRuRwWUEduYCpdFmGSUWH6WAFZeYWNcKeF2cKo
         m/Z1zTdSBjVZPruNZYcsX7p1NyYSu+uzhhnQiVW21/x9Mxg+GHrx+r578/POiAerM9e5
         q2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774992155; x=1775596955;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VCku2Tmc/ePL7URZnl/UTImZqNe4IEEZFyzUDR6AaVo=;
        b=ZuObWni0z4Nfdmx17YvOUNSKniQOgRJS8r9Ju8Xs2Png5eVeVlM0vx+ukgs7YlfQ8P
         rpWYzZexqnInVrTAk001YocfSQRhbF6iNtXQ8f9v1Z6qXn1rDUb8nz4OTyKbTl6GetzR
         3hC94+mFgUE6EP1qbtcZRPtTHiy+VDNSIhLkxhvR0s1+Cl8c+1hjPTQBRuFzqhXHrGKR
         rmWqoRlPFJktLGF0ivErEFgE6y/z+zDA6j2q5A3AXC9GSOZHQjK3wnyMLWM9y56X2Dny
         2Jgh4eCgj0M8L/fLko7Riw8j1EtMST5zLBQjDLUWAuWOtB498HvFaBzYgNn4gZq5HbDE
         tMtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeV2ZnxdgGfhTV53FDMtU8IeTrPo9wulu2XlhRNKhSDsFuoisYzeHr+Ptz/31Yvqd6sgghct4AOD6jbnZA@vger.kernel.org
X-Gm-Message-State: AOJu0YzzJzsOcK3wmhDHNJd0cXwbuYZGSp37AXjhZdG8NpvlqMRiTKzl
	58+SKBztqtS074CDa1pSR0hotAuylZeJShND9f3ALu+CQD/SSIAPyMGYzdjompTMZe0wSkOeDQy
	Wj3ke
X-Gm-Gg: ATEYQzzc4LAWxgDsWg+Nv/CCgZ3lCWQTkvLyaxr6fxfrYZ+nCoHbZnCmWiKAOKjFm93
	AO9ZonmuEWMVObirHWQ047auR53N4WMyIqGB11M3E9+GAcHF1kXwNPCo9T0p4gDJm37UP60Nk5+
	bLT8Vxip8at1rENvJhCxmLZr1l5UvPVD+ZkcFAhnhc9/8RoBuP2Bc6wLJ6A8RPVaDnor50pDpty
	rqT2Z8JWLSV3062zZ01WzKtbI70driBUKdaPB3VPijrziDXem7Uk1AnRXaXknlKLKE809+Mfw2n
	4CvdQCxcnuyJhTM4VO29lzmeW6+DJoJ8QxlvHeVo+91/6ZGl4wNCRTA+ggmcYoNaJiY8oo0ZouL
	vByKd1ybE6iuCbdGXWvkmAwYol3n6fPZawKDhB8OOGuCgtBQIEr3t9xHZ+G01FRN7M6nFh7ch7H
	HE93VSW8FORXGGYDe70XNCanTKq1aoPMENrQO02DTZ1WmEZ0FKs5i+pjFpFNnj5a3UtuUBa0GnD
	QOzIUVubk4Dl4WR
X-Received: by 2002:a05:6512:39c7:b0:5a1:38c4:424e with SMTP id 2adb3069b0e04-5a2c1f4cfd4mr185134e87.7.1774992155413;
        Tue, 31 Mar 2026 14:22:35 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1403cb6sm2725447e87.27.2026.03.31.14.22.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 14:22:35 -0700 (PDT)
Message-ID: <4898366c-108d-479e-93cb-f79b27ba811f@linaro.org>
Date: Wed, 1 Apr 2026 00:22:34 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/7] dt-bindings: media: qcom,sdm670-camss: Remove
 clock-lanes requirement
To: Richard Acayan <mailingradian@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Tianshu Qiu
 <tian.shu.qiu@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
 David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
References: <20260217002738.133534-1-mailingradian@gmail.com>
 <20260217002738.133534-2-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260217002738.133534-2-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101170-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 885C6371EE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2/17/26 02:27, Richard Acayan wrote:
> The clock-lanes property has no effect on the hardware configuration, as
> of commit 336136e197e2 ("media: dt-bindings: media: camss: Remove
> clock-lane property"). Since boards with new camss support can omit the
> property, remove it from the required lists.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

If you send another v10 of the series, please remove 'clock-lanes'
property from the example as well. Anyway, feel free to add my

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

