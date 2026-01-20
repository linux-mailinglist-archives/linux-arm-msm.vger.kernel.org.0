Return-Path: <linux-arm-msm+bounces-89884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yN2vJ8z3b2m+UQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 22:46:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3594C7D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 22:46:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C642F9E64F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 19:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91FC376BE0;
	Tue, 20 Jan 2026 19:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eV7uS9Z3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D2E3A35A1
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 19:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938797; cv=none; b=IUSYko6SAl5JJlZ1s2Kf6W+40npFHlAYV+e+uabxlAM5dkskP5SWZZuvKMZlV2TbiP6Db69ICtMbH7l+5D33YpYf2F4edGHK4hdZE1J5SMs8WM0s7Mu/4U16RUMFojn96sWAZHOAhTqV/P8oIMTFGEgbgOIEG+R4KYKS7f/W5SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938797; c=relaxed/simple;
	bh=hzlIGlYQi366/pUFdNolodFmxI59+xO3Up7iWwZOf0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W0mgeE4VLWTGhbOTiBm7v/VLNUXPkoQmudCoEvgV1naRQOaMbWkPCjFdZR7alfjEaiBfGpn8agzLO5rV053CcVZ9dF+og6zSbCcDBsPgRCztwwtDL+RCHBNkbZyONRnQ/ikilyyHSRgb+T43r6YWP2CwwqCGTPtFAQ/CIrZ0+Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eV7uS9Z3; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-11f1fb91996so12999110c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 11:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768938793; x=1769543593; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FKSGoUPQXpk7imDzMvWC4kCJaezJl3fPb9J0kmFWLxE=;
        b=eV7uS9Z3/ESxSPdR4BMwFVQglCKVJeDCfGbDBnkC2NVKd+CuTESYZ/S1AJrxvoWzDy
         bg4MINHvtS7Y9uVRrH04jS9eLhHzYgUg+rbgpLU2/XHIdCLc7b6xjSwvM9K8peM2rRfa
         KPoXFn1VB/Jw2u6P5xrfNGOuZPiltCPOW+Kum82Fde+KnNdEF+Gg6Seijmdevi3btilt
         A60cDJXknpMnrIrg7PswXWQ9a5epiiURd6m8OsK2DK9Uo6pIT5QHUCP6b8TaXLHtm5c5
         kglQrqIDNi/tEzJc0Qo8Mvn0NyTcLFktFVDS+FYwSN9FzYtcfUHOank9IxG2XOHuuAkD
         Mm1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768938793; x=1769543593;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FKSGoUPQXpk7imDzMvWC4kCJaezJl3fPb9J0kmFWLxE=;
        b=Jsuf97mHq9CNN4P+VmwWWoduhvl5g+br2Sqtk4bTmms1aUsflas9CXqTrX1tI6Jyy8
         ilIuDjc024vmGWxfpdearY6FaOw17zQA15G85bJ0ENQRvlTkKb7W4nwpNeNJJRR9NdSx
         mEJv8C8QEyOBvnW/JOJpMFWcWoJUKhp2gLMX6/yidlHwQ9ZOfCnzH0HMIsIboN8AdL+8
         /7FXaxgGtlPXjuoH8w6s+mjKiqfkYcrlHhSv1Ck2RB90SIe2uqRbKr4nV2GlqCZqTbLg
         Yz6j+j11H1hGXG8MG+Fk/ZB00OGxo97/2vgEOBYNroMowKCCwQ5wtEmnUiZsQGDuaJvk
         wV3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVDADJfPv4hy7rf6u8ChjKAg02rQO3qi54aMgxop/i6fq1ywZI6HjiZDLDjSpjigdRm/6IjBvK9RCz9msCd@vger.kernel.org
X-Gm-Message-State: AOJu0Yxux3SpJ3kBF51Z2T3ETIw+WECUUZ8K3eSS7RdI5Gyk7E4tt8e4
	u5wbA4RtQcwunVBVH5gT9FKaYB1m84+kBm2Vr33D5Quz9sQJparZDHut
X-Gm-Gg: AZuq6aIU0xwFnwAgKqHx094giwhjj5sgVDqFN+s3nlj4gco+GXRTaaJS5YMOG3y1Bpy
	dqzaYO9ERV65SDk5INcsbToseE46k+1lpdhJXPBYLhpN2Qos5dTOh2Z9CiQqjh4Q4mzFLGR65sV
	yLOAkgvfIvc4f8XdYwVOKpDQu1b3aLrmBz4dd03xaBAPuo8R00uW5aceWQGux7ErBJddIm73xES
	Poaw9R4q6b46plTOhN/FsK1ZBIbOaB4hetzoaP8g/LUhdZZLmeqb91/zRcqte3BN5Oj8pZap5An
	tQ5+H+6lYD4lg9ea0CgxM9eHDXGw68G9adHGg3B3X8dW5ytcZIpRvEXFoMrvRaVSTuLPGVr56vi
	qVyw7qQ0NZRovPWs+wpgR+RFnzHFkSDIu6rPSFWhrxZbLOXY2ZyThdytNP+XJ75TPr0C4oEI+FL
	j8g+2kJ33hjB9v2E155BTa57VBwRh58gi1nYaeWfihvd/iZy9qPouP
X-Received: by 2002:a05:7300:23c7:b0:2ae:56dc:eb18 with SMTP id 5a478bee46e88-2b6b5002350mr13024649eec.21.1768938793431;
        Tue, 20 Jan 2026 11:53:13 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:d631:e554:f0bd:4106])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b364579csm18213930eec.23.2026.01.20.11.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 11:53:12 -0800 (PST)
Date: Tue, 20 Jan 2026 11:53:09 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: yedaya.ka@gmail.com
Cc: Kamil =?utf-8?B?R2/FgmRh?= <kamil.golda@protonmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: input: touchscreen: edt-ft5x06: Add
 FocalTech FT3518
Message-ID: <g7lgjwenwdclj6etwae3jjunfxsgglbemv7jhmcy7hmcyzxxkj@bqolb5yjxbq3>
References: <20260118-touchscreen-patches-v3-0-1c6a729c5eb4@gmail.com>
 <20260118-touchscreen-patches-v3-1-1c6a729c5eb4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260118-touchscreen-patches-v3-1-1c6a729c5eb4@gmail.com>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89884-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:email,qualcomm.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 1E3594C7D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Jan 18, 2026 at 10:29:40PM +0200, Yedaya Katsman via B4 Relay wrote:
> From: Yedaya Katsman <yedaya.ka@gmail.com>
> 
> Document FocalTech FT3518 support by adding the compatible.
> 
> Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>

Applied, thank you.

-- 
Dmitry

