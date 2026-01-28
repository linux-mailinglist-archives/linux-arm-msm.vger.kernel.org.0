Return-Path: <linux-arm-msm+bounces-91085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEhSFXmaemms8QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 00:23:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B081AA9F68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 00:23:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD8FD3005795
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 23:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D6B633123C;
	Wed, 28 Jan 2026 23:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K90z6qwu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EF924CEEA
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 23:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769642603; cv=none; b=NGUlKirWWQxx9YYYlwJfhTXjhXaWMfP/je+qEN/SUdC2aM3dnAC9m3/aG0fqB4dG9QGC1KFCgB1D/reZMUQ0NOVcd9D9bvg+QVrJmnimF+YSU7AopJ3ULJN1X8PvR4QBCHKgbRoYNXVazd1zNDOcWfs1HZmqXQFjeyfYLJfgExE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769642603; c=relaxed/simple;
	bh=6ca1Sl8ati4GIMbwjPj+oVMEy+QZ4KssuHKcXxijejo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUTYkbqzZVcqD1gJaUa1NDVv97dfqeMKD5MyUiat6YhBD6zC/YldI9qSBafj0Cse69D+gZ8nfovKGrLTpa8/3wW+qACgNsVZev9T0ZuQISjqYpiBTVfcl9YN1NpVy7s1YemNxOeG3tEhfA1wSVmeA0H+XpSQDe1fJy8rs3ZjCSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K90z6qwu; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-894638da330so3955336d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 15:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769642601; x=1770247401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/R+p0Q89VOTzs/CkCyEL3M6uPrfEJ5bMsqI/Cf8cMcA=;
        b=K90z6qwuK+1/Xnm39ywbGMTfqcD+S7ZsH0SnB+CLJpInQddrut702wGJ0kMCG5fDXW
         5nSGTj993iMthvMjzahsmtk1Z16YMQTUJDerRE/mKT7ClwzPPkGi1i0C+xOtkR9PFXCN
         wS/c5jb59jkMWvDYlwvByHDc5CoEPprWg3Q1TfFrHMk7Ey1vK7+ZtGMLNWP9IrdMIESx
         Ld7Hw4Q20cF6WM7I47395kLR0WfIVEkzszvlwhQPFAfAxh0o0r5/hmr0q9vGsIBeC591
         j8DlygFXIqTElL+qv+w2fkfLzCKijzdihWj/qTJr2jW+ILtid+NK2R915riiODEIWG1+
         Al8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769642601; x=1770247401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/R+p0Q89VOTzs/CkCyEL3M6uPrfEJ5bMsqI/Cf8cMcA=;
        b=HFTJ0rovg4nbpFkq1DA4zwzk5Zox76bkqGL0//996Meq/NCVMSBxH49GeTj8JPvlBz
         tSYr8/63+9XR3CqVz2pO2RHCjN2MRd2yK09/Z6LKzgV7BZewce4838cdTtVgn+YeD8bE
         DsIkJGSeh7aEBab3bJ9kVOauDuR7bLPg45Tr9xeuOkpR903c+WM1o7UhuFtMJEhx4NUK
         jk+OXdRQtWnA6jaTSfhxsFxwDQv4s0o6RI9/A+b4PbeGsK6NAc+7u0pjW2OuPAJfcCC8
         VQbPTmDdJy4kmZMU7iCUuDJUZUoz39n1UE6YsgVYrToNA7oAq3XY4mNiSL9kO0S03W5z
         zcRg==
X-Forwarded-Encrypted: i=1; AJvYcCWjBtJZ098FIkd0mkNqJcADP9QFcRxByKli08l0KbJDyUT8BFc4hxVYPalwUkZz937x4J98l1wInJq8Pa1O@vger.kernel.org
X-Gm-Message-State: AOJu0YyuUB0t3yOyhaWbBNur4y4OAR5SG4jcEftOrR9aeogEGcokmAct
	y0KT/rYWQJqEh49kf/h6AeQZvQ/xuHLjqYX3NOo4wnDD+H6H/Svg2SHf
X-Gm-Gg: AZuq6aJBqVnWB153tI1kvJWIH/jTvfxbVX11ulX9LeLTS8hIXTfEfT0sxJTWlw3l9C/
	pkXUNyvJrjaeU9dN3cQLkG9u4S3yqYnAayWh3dYr5cfGY/2+PUCD5nxd3mXHTcy1o7CBTKTO3yq
	lZ9xpEsOJbjIb1+qEr2VcghRTK3MkOyk2tqQhM2TZDTGV0VM6cMpJHokf2KFY+uDBlfpFlG9zzq
	PVbqTIUCd/4k6CXY5xTb4twPVfJpMoY3iDDJSQUkTqIKSaGmQhC7afekykMOxYMX5KCfLJJcfnD
	NCxTNdbpsLEHjMDjQOEgBcKyef1AEQJd/Y+e7su4zA5ciLUKq/q0MgqIm9SRZ3iydVr5B1H2fSV
	lK0iWGFH54RhjtROQTSt6rUmC8W4y1leiwGCwkKKjaqUY0TBvRo/bXI6A0YPynzETqUDcifAwUe
	Rs2jRhvLfpftB3cw==
X-Received: by 2002:a05:620a:25d4:b0:8c6:d2ca:1d0e with SMTP id af79cd13be357-8c70b84a6fcmr916954085a.11.1769642600692;
        Wed, 28 Jan 2026 15:23:20 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d375b640sm26715056d6.39.2026.01.28.15.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 15:23:19 -0800 (PST)
Date: Wed, 28 Jan 2026 18:23:43 -0500
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
Message-ID: <aXqaf4OmvSCvt5gu@rdacayan>
References: <20260117040657.27043-1-mailingradian@gmail.com>
 <20260117040657.27043-3-mailingradian@gmail.com>
 <578668b0-cba2-4550-b676-26ed0b447bf2@linaro.org>
 <aW-V8VTcOICLWqaU@kekkonen.localdomain>
 <aXl6MpRB9ncCeu2M@rdacayan>
 <aXnB2FUgb5OlGjfn@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXnB2FUgb5OlGjfn@kekkonen.localdomain>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91085-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
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
X-Rspamd-Queue-Id: B081AA9F68
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 09:59:20AM +0200, Sakari Ailus wrote:
> On Tue, Jan 27, 2026 at 09:53:38PM -0500, Richard Acayan wrote:
> > On Tue, Jan 20, 2026 at 04:49:21PM +0200, Sakari Ailus wrote:
> > > Hi Bryan, others,
> > > 
> > > On Tue, Jan 20, 2026 at 12:44:24PM +0000, Bryan O'Donoghue wrote:
> > > > I think reset should be asserted before regulators and power are switched
> > > > on. i.e. before you try to switch the chip on, you should establish that the
> > > > reset pin is in the state that the timing diagram calls for.
> > > 
> > > Indeed.
> > 
> > I think the discussion is more about whether there should be an assert
> > in the same function as the de-assert.
> > 
> > > The xshutdown pin, as it is typically called labelled as "reset" in this
> > > case, functions as both hardware reset and hardware standby mode control.
> > > It should be asserted (i.e. be set to low level) whenever the sensor is
> > > expected to be powered off. Typically deasserting it is the last step in
> > > the sensor's power-up sequence. This applies to nearly all CSI-2 and DVP
> > > (parallel) camera sensors. (There are some exceptions that use explicitly
> > > two GPIOs for similar functions but there are very few of them.)
> > 
> > This patch has the reset asserted by the time it gets to
> > imx355_power_on():
> > 
> > - when coming from runtime PM, the suspend callback asserted it
> > - when coming from probe, GPIOD_OUT_HIGH asserted it (considering that
> >   active-low also affects the initial output setting)
> > 
> > Should it be asserted again inside the function, or
> > should the initial `gpiod_set_value_cansleep()` be removed?
> 
> Please remove it as requested.

Ok, I will remove it.

