Return-Path: <linux-arm-msm+bounces-95254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gO7nIUK8p2nfjQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 05:59:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2975B1FACEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 05:59:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56E76302BA47
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 04:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8EE37F8C9;
	Wed,  4 Mar 2026 04:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MyEI9ya7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EB3280035
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 04:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772600360; cv=none; b=P83+GmoKRyUVAI8NOreTpAxSl4LIs67T2voCbgw1lxhXxeApWRCKRgVZaAhX0agikVgSeOr+87trjv5r6U5OL/ipX79HlD903TC9xTuLwrKYgYUxgw/xLUR3OAvySEhE+nOdr1gVA3XsfX+eVqDG1hNidrC9NImGIVCuDbe9T/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772600360; c=relaxed/simple;
	bh=NhgmQKsMwB8zEIpgqpqtkcZaPSWUSfgat9WpBVwGKAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+71IIF+cl1Fjp5IaeMkMZSIFMFgfQr2e1iCvdfmhFcIi0lXGDo0X5nrE/m5A92WvgoLHhMWCu0/AGizmrYdFMrl7a59seEK3yv3CjD30eOGFJf2r70PosIwSF8JEsLjnaP0GrAns2wZUVOvKDRg7VOMd2cDk48MHzUrNQ6JPF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MyEI9ya7; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2be19f05d7dso4637892eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 20:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772600359; x=1773205159; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EDBrUhFaFc7wQVcSeZc1Bi9PtbigcT50WYnul0mkrvw=;
        b=MyEI9ya7zKkbFBeQuXi8fryJgwOLRbyihfcv3WqPq1MmHZoayNdBz6ibNQiG+v2gtT
         84Lq7jDN9wDabHZJRdmZYKDe8xS7ZDgIUOhV8FZftArPoEgEufvOZGwcM7Vtq77jZoPq
         oRe1lkMDGHFu1y3PISoJOL00nacJgB45S5h7r6dVgdmL4AHyz3jjIULYszizXs640glN
         +ofqxaNTcS7Bz0qa9Gt8t+hMYMxDAxPqZ06z5orgfWIBsFVMfGBctEkyJcSYb1NenGmH
         v0nIg4IWPHGLkhHSYr6LcHVGqOrQQsdFVVD6843djzM49wjqsqtdKPnt/3nWl2jQVFNh
         A2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772600359; x=1773205159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDBrUhFaFc7wQVcSeZc1Bi9PtbigcT50WYnul0mkrvw=;
        b=vgqzgC+joj/T/Rv9wZpLPlD4O4XMg1wxVrZ8w2ewWvcN3A52Ik3+zRbDXzWD9glCxs
         tZaPlFwVBlZE86I4ER2WhX7+69GPOWl8U7MkxPqHkGFoe4KV995eqDWL9d4YVHX9uTow
         IXrke5xjWbA8J4uLKDG2oqOQUUfErsaKS9u7cMSzAhVBmSnAmSETXga+A14oPfyNGyu6
         ihQqg0c7b+HiGnxE52gjxTrBHjCuxH1Oe2MdUxuaXsRtB0XpPM0GEvtKB4zxOXLDW/HK
         9u2ey1pjrY1jxCHySNVTdiS8NARYIZg/9bJniwG6mC5QTTEX//MypJ1dKfdlPQJX15a5
         ZU9w==
X-Forwarded-Encrypted: i=1; AJvYcCXDYG6rJ1BQcjxhoKZrb7sQeGln4V5LsNnzgoQTRLL+iPtEqjazg7/d7ti74TYF8rFyEV9gsCWdgMFvzNPI@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl42ugg6ffcuRVibabI/hnWwa3U8AcuswIPNw/+bk0oDAPDdRQ
	5zTwmXxCQv20IVkhrwOnFqZC0RVsQ91l9MqJXFnpRa4y17cES3p7eRjj
X-Gm-Gg: ATEYQzxo8MvIlZMiOqriS45cMrPgFvyVUc+HENfv5tcRaBPCWn1QUzQ2mgJnJs3ytOZ
	RG0yV9bLjTTd4Q7E0mw9QdKNMDOeK5nMDJ+e/q+hII3cCMU1nvpYQbL891yEY+z36aOE/HiCTbG
	Gb1IM75CQTQlkfRIA3ZcRC4OCvxWbiRCYaeOPntBTlSKc/pr5BzBO9AiWjj0eB7PugCbSqvSzyA
	vFXz/P5iaO4kgW+3MyG1zsFtoSVdyE3u5JpOhNZYe6202S846L9tgfzveuhD03438L8+O62spY1
	squxOF6iVHqmE1AodykcmTaIG9P3IvKP8NiHTDWwrs3wzVjlVwF1UdgkFKwfm1rOhcI5CZtpUkj
	VsG9xV3d/2mK5TpVQFKMtcpcrhwHcOc5YK97jtWyPoPB0WVoMCjo0X3SmFxU8I4Nqe7EfQDXnqZ
	/i0oJ9A4dsFuDLYGnj4VOASywK8nTDZ53Sr0DiSw1ru55okNx7xd0TNhD/mGIwBnej
X-Received: by 2002:a05:7300:a887:b0:2bd:b961:7e8b with SMTP id 5a478bee46e88-2be310975famr422928eec.24.1772600358821;
        Tue, 03 Mar 2026 20:59:18 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:a048:d9ec:d217:7d59])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be1ce921dasm3981312eec.10.2026.03.03.20.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 20:59:18 -0800 (PST)
Date: Tue, 3 Mar 2026 20:59:15 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Petr Hodina <petr.hodina@protonmail.com>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH 03/10] Input: stmfts - abstract reading information from
 the firmware
Message-ID: <aae7zuSkAgNaciUK@google.com>
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
 <20260301-stmfts5-v1-3-22c458b9ac68@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301-stmfts5-v1-3-22c458b9ac68@ixit.cz>
X-Rspamd-Queue-Id: 2975B1FACEE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95254-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org,protonmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sun, Mar 01, 2026 at 06:51:17PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Improves readability and makes splitting power on function in following
> commit easier.
> ---

Missing signed-off-by...

Thanks.

-- 
Dmitry

