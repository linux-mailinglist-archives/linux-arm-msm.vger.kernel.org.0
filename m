Return-Path: <linux-arm-msm+bounces-89885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCLZMj7wb2m+UQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 22:14:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D694C115
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 22:14:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 06210626DA9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 19:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22FB83E95B5;
	Tue, 20 Jan 2026 19:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7fKGuGw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7D93D2FF8
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 19:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938813; cv=none; b=nX62Rx/H1Umt6DR1exAvqVbR2yp/Dkojp+vHyMqH88YRqhLssXAaYQaHJ59zqd/8/oyAlJ+V8zWF1W1J+cCpZsR6YXA2BDqEQzYakdiD7beqGF6B8GCXdefDpdDm3GOYsA8LahZ8Woko+2nfrnL9/yHVuern+X9JVIHoJsPytvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938813; c=relaxed/simple;
	bh=i9uno2DHQ1nNjIlY38+4xqcrHbjg441zizXTxmoxHAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ve6G6puEmFcs54+2gIAoDqF4wLbxWVhYDWiK1m5KylkHULxF9ga1Qg9504o31rgAvNkBy2RIYEvHCaKlVncsoNWZk8aWiVbtPKMXMfCcgGnXUMV696PSABB3DZw2C3OM3kwQx0WAGFo20iu5RHiqmhs4GVCB4B0THAPl6fGto6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7fKGuGw; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1233b953bebso1897351c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 11:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768938810; x=1769543610; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lQpNOx1ZcnEPWbMG3wgTd66OEZ6aelEDALzfPM7/R5o=;
        b=S7fKGuGwcrOI21eHJh0NbK6F6SFLKD3iF405GqGXar8jtPEPe+FgdIgFclIC845XKo
         tHEraInjWEllipqIiZKOAOO485lrzF0GKJJsToaluO7mQ4zPyMqTClVt9bXFVclJ6UaS
         SboI3HWCN8T9ru8ZtCxBW37rI70I5vYT1FKzDflghJi6GreENejLFczJlhmxEYVGbxwJ
         QWSh0tnVF7ORTJlfX+dMtA6vGv2NAyNEP0dPMsO/LKcY+4Tm816AuZvpGi4LX/vnk3h/
         WMTWImG4CnC4eNzIqIWAGqwHf9JJS7JUlozW9v+aywqz3WzNwk99yKe+X3kZO7nedMry
         SdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768938810; x=1769543610;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lQpNOx1ZcnEPWbMG3wgTd66OEZ6aelEDALzfPM7/R5o=;
        b=BbMhHhpYkToNm/WyfcmCNbQgHJQEXptzEzOpUIgK2cb3GiSu5zx1ZMr7ozGoLgeYqJ
         xUDE3hTG+UIYWuRjEjsJHIy0zkYCahUVZoAZtaLLT4+KjkNg9V7VJX9oxYKWzdQrS7pQ
         De6/N5s0w31U4SLINpl/3uPrTLlXKBs/g6DOHQ61lzMJZi6/oqW88VWmWHfQYdBQfEC4
         4M6h5KGQnpAtNVRdgxvdHP8erFGX+ghd8H1HVUY6Lq900ZCmYJi6FXTIB7WdSc7aTzqu
         /iT9B/HPB2RaHr7muRAoP4t3z5oqZdVuZQglm0LqYxWRUG6tKcRI0qbfu6KNID4LMnSY
         MRkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJoRG5RRpHr0E2ECXTq2WcZzX/XFVwh2DBN1t8E8UF2UOdcEvKEKWiQKzThWmF5DRF0FLqdqDl94QTeDJS@vger.kernel.org
X-Gm-Message-State: AOJu0YzajHXW7WNI5x+R+7HGNR5LHMon5cAY5WXKj8iC+poyKj6PgAas
	XxHvRVtNvl/XecMa0yjSmDoZTS+F6czZu8RO2xwOHBsyh+xtjISZTJhl
X-Gm-Gg: AY/fxX6qASQ3icogutius2/gBYRmOPnKZpLw0HhJg8hywvy53eIBLx9nlZ2ErNctIWL
	LLAQZWNRXyxxdy0X663IviwvPWja34MbBh4kjNjK0MTzYWCO6BMHMwxq45UdTkt8b5d0eonir0I
	ToFPthQLwkWlaI22dCKK0HntAjScQ8Ue8IH9hWSRJYH92NL8KoBW0m9EbMr3op7HT1sv0PaaT8X
	hqeMYUYr6vhPJZp3qBYfrIvOUOxFspXC9hGwk1O4tNky8wdGVCSeERTqtVMhI/v8XqzD21z3Qxl
	7UrnZU+5f/UO8PV9nrD4Q+DmPTrB0AIXfCFF4v+TMwgBmEDB/pUpLrfpc1117M9O8VQCCJ+AJtf
	sDEEY4XylkcOtyI5DyHcOk2DfLtUzEeCipJiaTTMGUiqwGeOGDEI4DY+mdlJh8vinxuH0WxVu94
	Ynq2/xS8rB3TItsDG+h7jo9oN3RLJvegu0WfEl9Sdk9YMESgPWp2pN
X-Received: by 2002:a05:7022:6609:b0:119:e56b:c74b with SMTP id a92af1059eb24-1246aa84bc4mr2106271c88.16.1768938809924;
        Tue, 20 Jan 2026 11:53:29 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:d631:e554:f0bd:4106])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac57fd0sm21142867c88.3.2026.01.20.11.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 11:53:29 -0800 (PST)
Date: Tue, 20 Jan 2026 11:53:26 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: yedaya.ka@gmail.com
Cc: Kamil =?utf-8?B?R2/FgmRh?= <kamil.golda@protonmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] drivers: input: touchscreen: edt-ft5x06: Add
 FocalTech FT3518
Message-ID: <uqsj3akfscfucgtalyk7tkm4lfbptw7e4cplhtgl22wjmq77b7@cxyopk7seaq3>
References: <20260118-touchscreen-patches-v3-0-1c6a729c5eb4@gmail.com>
 <20260118-touchscreen-patches-v3-2-1c6a729c5eb4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260118-touchscreen-patches-v3-2-1c6a729c5eb4@gmail.com>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89885-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[protonmail.com,kernel.org,vger.kernel.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-arm-msm@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,protonmail.com:email]
X-Rspamd-Queue-Id: 41D694C115
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Jan 18, 2026 at 10:29:41PM +0200, Yedaya Katsman via B4 Relay wrote:
> From: Yedaya Katsman <yedaya.ka@gmail.com>
> 
> The driver also works with FT3518, which supports up to 10 touch points.
>  Add compatible data for it.
> 
> Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>

Applied, thank you.

-- 
Dmitry

