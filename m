Return-Path: <linux-arm-msm+bounces-90890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Fn4ZMx96eWlQxQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 03:53:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C319C6BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 03:53:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FBD8300B066
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 02:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5BB2C0F95;
	Wed, 28 Jan 2026 02:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SiIQOE+W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B21A28C009
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 02:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769568796; cv=none; b=nRCa5pln6kJgKHlX7H5rsItsJ3lpsMXWXmm0saSOe7Z5N/hp6Rcqqn2ngYcw4uhzsIuFcxCzdIenw2NjT/LulC7Hplobf5aPX1QbS3DWPERlFrjGkU6G9tC9k70oWd47GUi86E4Y62k8QlK/xJiEKk0urURon+TOWjKZOSAaL/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769568796; c=relaxed/simple;
	bh=9KL0qFGhdBvOIIw6GVscMMDXp1h7L+qs/1b2H49sp40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GenfbRfxD593LN7qMahgbjVyZ4dkOqgALQbipoxusyMMrP1+QIVTD+M3mitjUueK9JGB0H1DdA41lP4quy3yeH52tRv910HzsbMh1DOjH4LbBaHQEJj9k80oY5nAS2VIHMdekMwxGNDGRSCesk/iFn5zcoEZh7kgzC75JBKy4J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SiIQOE+W; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8947e17968eso68858426d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 18:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769568794; x=1770173594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yluvfUNr6pH7GOU/s+jQXcqg7WVVoVQL2cZIk1rM12A=;
        b=SiIQOE+WNstIDMT5YlVCQsJtZWphJZJr3NdEDMdV5NDb67FflCWbfmi3VIVT0kk6ut
         Eqvh/niJq2sI0m/kI7RTwI5BZC9UZIq6s50meT0FW+1yG0LTGneqVw71RkKu2BH2L4OB
         uAdj0yV5PMH47KKYtVJZid4JEn/6KRfjQt8tWwF/ufLdmqQqAgUXOgkzCoMEdFoEUTk8
         tqlCWumtPztW5G/VJ6/2OdX/qUhpIsUFVtFjDQ+KAhc+rfUPFLpKr6IvGmxCsK8TTZbW
         riyZr8g0rDrhdE11+KTpoiCHOwkbxmeBXDglcBQKaGzWiTVtBM+a/TyVL0rClf2Plb27
         oK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769568794; x=1770173594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yluvfUNr6pH7GOU/s+jQXcqg7WVVoVQL2cZIk1rM12A=;
        b=M2U71jI+YTbaLZxSQr/xVkke0GIf+bw+RfzhzlgEzFdAF5NHccjt1O13dJ/bUzD1cz
         fHgLrA7TEVfMAMX9FVdKVTGktE36RiqEEyjTrxU4yfsGLaBmLeV5ZJhtJa8VkEmZdbfI
         JID3zUDph4p40DXIiLadIL8dJ/5O7u3PsVzlgdQpPE+jt2vTjoDlWshkCji1Gm4zT7n7
         r//3kr3jxXhXG4LnE4YvOeCz9RpLO7DRu+vct1r4UH7+jzHdMsEq27raLUD4JVskHbmI
         XMxwlWDOvvVLVqyfdj9kjxiROey1G2k+HYy+0t849u3Oj6xbM9Poh/rMOEWWrha/yRKh
         vtgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJTTwqBnM3xlJDUM8PLYz8wJv3iR2h3mIJ/D7z17O2/UfO6OmW+PVew8caYKYjUAqY+TZe2AzBP4xech8/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz378xEy5kb1hserSOoy2ekLkrgNzoY5G/g05rLm9Y815GF2sJt
	3ITis2L5KtVaUTkBtVu9nDcAc36iaLM03d/QOz/JF879BkwQ5epvXmpo
X-Gm-Gg: AZuq6aLhhCPWov+eRRnoEiqcG69bSiBUWmDZIQC6jSD10xu99a0MgJacqFbrmeV2SWR
	yDQS5EFElGR6SSBdizLsqVKFewYpKRz1+I3hXBZsirXaTILuP3jnjcY6QkXCJ4snuQfMpBXetSJ
	FbnIrR4tji1wIO99DkMhRPtZfxW1ObTaEPiZk7ex26F2AwlU9MVDI5vv1tH7OifquerQ03K8bI3
	2PC8dbOAJion/WZch388QYoIbHdq18Im33fzcvdrUHS1dgh2Bubacam8ssYTmgfKomzm6tNxkth
	oMiPPC5S8B1FJCgSSPvyiK3bm5sWe4v3nFoMy3AUcnn9H9LqCYr3hcDTWIKeKxVBfFkogpWf6Bg
	nnk1mrzdHl8JXV00FFAMls3Xu/ePSu0nxUmEC80UHI7/CXwMY1FJXxdEGm2u5e1ufmQt34k4eo7
	SJvtfDixpBKg/dFA==
X-Received: by 2002:a05:6214:da5:b0:894:6e5d:eb8d with SMTP id 6a1803df08f44-894cc8c977dmr49820206d6.34.1769568794147;
        Tue, 27 Jan 2026 18:53:14 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d375ed92sm8696686d6.44.2026.01.27.18.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 18:53:13 -0800 (PST)
Date: Tue, 27 Jan 2026 21:53:38 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v7 2/5] media: i2c: imx355: Support devicetree and power
 management
Message-ID: <aXl6MpRB9ncCeu2M@rdacayan>
References: <20260117040657.27043-1-mailingradian@gmail.com>
 <20260117040657.27043-3-mailingradian@gmail.com>
 <578668b0-cba2-4550-b676-26ed0b447bf2@linaro.org>
 <aW-V8VTcOICLWqaU@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW-V8VTcOICLWqaU@kekkonen.localdomain>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90890-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 20C319C6BC
X-Rspamd-Action: no action

On Tue, Jan 20, 2026 at 04:49:21PM +0200, Sakari Ailus wrote:
> Hi Bryan, others,
> 
> On Tue, Jan 20, 2026 at 12:44:24PM +0000, Bryan O'Donoghue wrote:
> > I think reset should be asserted before regulators and power are switched
> > on. i.e. before you try to switch the chip on, you should establish that the
> > reset pin is in the state that the timing diagram calls for.
> 
> Indeed.

I think the discussion is more about whether there should be an assert
in the same function as the de-assert.

> The xshutdown pin, as it is typically called labelled as "reset" in this
> case, functions as both hardware reset and hardware standby mode control.
> It should be asserted (i.e. be set to low level) whenever the sensor is
> expected to be powered off. Typically deasserting it is the last step in
> the sensor's power-up sequence. This applies to nearly all CSI-2 and DVP
> (parallel) camera sensors. (There are some exceptions that use explicitly
> two GPIOs for similar functions but there are very few of them.)

This patch has the reset asserted by the time it gets to
imx355_power_on():

- when coming from runtime PM, the suspend callback asserted it
- when coming from probe, GPIOD_OUT_HIGH asserted it (considering that
  active-low also affects the initial output setting)

Should it be asserted again inside the function, or
should the initial `gpiod_set_value_cansleep()` be removed?

