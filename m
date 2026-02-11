Return-Path: <linux-arm-msm+bounces-92554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFKOEsDji2kVcgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 03:04:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E0465120AB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 03:04:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 381093006830
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 02:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9600B2D63FC;
	Wed, 11 Feb 2026 02:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FV11t883"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B672F360A
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 02:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770775485; cv=none; b=fuCYDdLLvP9r2v/V9RsNssoN0yLNvvh5nogvgA8ARayW16FjccCngkWTcaq5lC5aluFoarLesk5W1t8lcFhguCelaedo+U9TAVczfzQsl4p8j3beqhRaJnfclCbfPD7ol0Cp93MTn31djaDPwN2uagVbYJF3xp7v+oGsCZ/YnvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770775485; c=relaxed/simple;
	bh=A1SS4TKzzKgvQKNJqUbY09euLXdjy02UR4+Fo+uBiuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUxJiK4rLJW/WWT6tBqINRQzXpjpvPOQxp3XSiUFf6jiq8w2kvfefr3XwVWxKYCWVAWAYcU6BbhIJ9/m7cLjeOWVuDt1aHabsFPlWLrmpIGGfHj0PrZ57tdr/l7/ZK/+xtBgKLg/j1WJVdjXcq1e75dgTEgel/9+MYLNq4z7D0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FV11t883; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-662fc35291eso808997eaf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 18:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770775483; x=1771380283; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gm/euDJIj38jkfPBdt87UcAMoKQj5lm4rAH2NrGeusg=;
        b=FV11t883Bcmqt6WMNEThV1pc6q4bmrjLoC6fYsjXoLa5l2n7dkxLsnGa4/3tGWsKhO
         LIXjUD5YRyfC4bXzy1b8ytkRDSxXwrdkK63WOcL9rFfYjCDYykxYy/F83BHvuIOFsHZL
         oxPhQe9CZK/pw61X2AbMSLmtE78tvNch6360Gf/alQ6fUV2Hjw6tofvVpSS/Jk1dEIu/
         GpW2D5lr+KpPW+8FYy98Z7FsTTe9IapM8f05aZc1NbVEk4QznOCFNdAhD/vD6PuoBSto
         lzQOX5m/+DeBBJ7H1C+5usgSlb27wxKcPc1Fe7vJ15WDOnyEE88oAqYO5jxuwvd44nM/
         /oJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770775483; x=1771380283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gm/euDJIj38jkfPBdt87UcAMoKQj5lm4rAH2NrGeusg=;
        b=pDVwDzIf/q8POYgW2kyhyXi2dYC9O1BKiVI/Es5sG7JBQHMRL+xi/go+7w8HoU6i0e
         SoA1Becae+sUFAGQU+aFgIowQ3/TtHpz6aF44WLgctvJaCoO6s00CSMVg5rQAIM95R07
         eTQRzEPTFP/z2WFjDhzdHJZ2vd/EpFyD8BOUyjvTYZlDvS1RoFxr3koLlqKUNCt0dn59
         WoWpeA/auoDCrCUIum6f3hbeoDAp3AEg6xRzEI5hppf/ZRL1hZ8cK8v67NYAMSKA+2Sp
         2cD5htaPX/5fugK7CyLtIIdSDPGoiKnqlTAPzvu0T42b5H0hg9S7oXIzKs7BwOV9tKOk
         NAcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhFkG59WJIFC6pxksAawS7TI+Tv/gJrzJ0g2ps51TsiKHWAJGY4s7UK9j94vUmdmdPbGC10rd/pZImLuS5@vger.kernel.org
X-Gm-Message-State: AOJu0YyxnJ4vaD6SRBzsZSiG1UJLE8sI6jndECQlTmDiiCR1wRoz9oGT
	cBnB1scmDTo4vIA+18YKZEgeQ1mbNb+XoEYwvAQ18UVoQWdz/BwI2dSIOHiGXA==
X-Gm-Gg: AZuq6aLX9UmHBRoKHKaaKmk7lf1LLn80ENC0qNXNCLeGOLOM+7h/zm75HV6a+5n5IRu
	YzUfQ1iaOR4B7MX5GnM7cD/tFsakIMHvR5tkEPnQbA7Lv6OkhW9HKHeTT1p+NER5PJgp+8bIQDH
	7Xb24fAnZuAKuB3uuPdal3ZvRdqU4jDFis8uZjUPWUxtZA2z09lgtnAfPo7Gj6m0URZJtQzYNV7
	q2sgDp2dTIGvYY72joD1JBvoXnwRKi6PzUgFtiwb9maEoRpdTEgQYXiBBT9SRZ8jDpqAQLJiV3C
	Kq1Gw4+xYYmuurjHm6tOU7g5IfMBxARY/gYOTUv/uI1F2OE0Lh5yIuuuv9fwxol/bnutFKY+Vv4
	agSm3WJGT+AIPMZ3nliwbd7FolQDIgGx+yaRRx7yz+Hywmutg6/2pRqqfH00HO+0Y/HMcGy7Ch1
	UThjwsWKnX4wPD4eL1wVXJsCYd8HfOdAcoPM8W
X-Received: by 2002:a05:620a:1789:b0:8b2:eefb:c898 with SMTP id af79cd13be357-8caf2389cc5mr2130416885a.69.1770769291885;
        Tue, 10 Feb 2026 16:21:31 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cc823a4sm1881586d6.8.2026.02.10.16.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 16:21:31 -0800 (PST)
Date: Tue, 10 Feb 2026 19:21:58 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v8 0/7] media: i2c: IMX355 for the Pixel 3a
Message-ID: <aYvLppaYsNDDD4DX@rdacayan>
References: <20260210020207.10246-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210020207.10246-1-mailingradian@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92554-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E0465120AB5
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 09:01:59PM -0500, Richard Acayan wrote:
> This adds support for the IMX355 in devicetree and adds support for the
> Pixel 3a front camera.
> 
> Changes since v7 (https://lore.kernel.org/r/20260117040657.27043-1-mailingradian@gmail.com):
> - restrict data-lanes to 4 (4/7)

Apparently the 4th patch has been blocked by Gmail.

