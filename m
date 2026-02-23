Return-Path: <linux-arm-msm+bounces-93573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GXaBYLPm2lH7gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 04:54:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BE7171B61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 04:54:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37D553016248
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 03:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B1B934402D;
	Mon, 23 Feb 2026 03:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GPWvVOgO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E34A262BD
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 03:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771818879; cv=none; b=Kso65N4fS6E6kkDfUeF2SlKWKQ2EYkU1y8HaTI/rCesSGcqmf124P0v09oqO67QvxXZJ2mPnWGWUgqY06T6tRpvHC4spjEOhqqtz4j49iXG78bT15jGQtHO2jF9XAiCO5u8qfMm+/IHm3fti2lUCNQH+XdKQGCvDlMrWfzu7QG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771818879; c=relaxed/simple;
	bh=DL/O85xB+imBUpPglQSS6Wj5oesIn23PeIjvILrTVaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=puTQdZJRvX22vgY9ahP+sn2eTNGBlXke8i1IKw6/SS/QIWOv7RwRvNZox4SiJuhT2w020Tj3V50OlJ9O2d914B4Z3PFPOBJqVuCDBZKFnqaDyyWWP81s3l+jaAinv61t+aeSYmuWhFPcTqnN/wv+lX5n4Q8EEbctCJisJU8BuLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GPWvVOgO; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12776bebe9fso55248c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 19:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771818877; x=1772423677; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9qPPGc8+eZXSIn5RBSIe71t3+20AlyQ271j9hhpmbm8=;
        b=GPWvVOgO2npbLaAwuD7ldosPCMJJoEKVACmnMTLGPjqYIdPFo5uU+pOBNM331M4eVm
         8rrtn+hjfdg5AxGswyB+M3q6MPAaPwKQoLam0oJnBjFwuJivUOoaGv3Z5swBOQCQguEF
         GdH8BcFtdWRWtzn5P7Yya/vpfRRzNMliTJiesVVDpx5nMP6oLg9HQlcAW1MZNV/9LrJl
         BWGaGLCJMATXEmnS7J4H/EY9ddmnM5NwbNfOVgtGw0HF/+z/VdfmoUe2Knn3U0WyZs0D
         QtVMbil9wgCPNORBaDt/45axydKg6xejB113RbC2N0ts7w2b5EmL0p3oVDulp/JivTh6
         VDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771818877; x=1772423677;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9qPPGc8+eZXSIn5RBSIe71t3+20AlyQ271j9hhpmbm8=;
        b=rhegm9QsuVGrTJ7IX/nZ7Qcr3Hu/pq8GqB/52ZHDWncwLjqewDjD8QRk2Dn71fvH4J
         Q0Gb/rhNa6yo8rLnPf2/Ctb2ih5FG49LJqTqgZAOKHpuKupj/s5mRoqNLfT0LfL8C1od
         KJgSjnWUgUGuqtsz2D3Dx4TGxGKNyg2kFJo+xcq7UsIqiOMVWRCgh+iqehiOByhLttNv
         MbFKTxBJbgVzqNhiW+/OGsypDMcDiek1mZ/m4PP62K+Qof71bNgRhwgzCGx7E1bBwBcx
         mytbD5lbBN6BnvBlvJrnQx5tisUbvrqi3cavDBibctDeVBXRQ/P1m9weVMdzScgg1/HQ
         dYGA==
X-Forwarded-Encrypted: i=1; AJvYcCWugK1GzNHO2EFZBTHd+b+8XIkefMx5qCyQx3sDjNK0nbcEags5hv2Lvp72IdRqtlPeCWE4f2ak4V355DJ0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr2t1h3C1CIDYWnxeSvCghLMP4RXtqE88Y3NN6P/XCdzNpJlC9
	nJTxdY90KgE2zerky2ULWHdoIa+YK3rF1srYGragw0ZZXkOvHiPoekqi
X-Gm-Gg: ATEYQzw+TCMJlsC5JFf4HAMachQd6QToR6gNJI3CVx4rnoz+odJK0n/Ttk9hi+F3ohX
	CfZ/2wVIcs6Xj2QNSm96MBml1OVgEm9uNK9XflXqMMuWpcZf5zOD83PfO+gzxoxbUlRLxROFtrY
	ruT6bbcmPahkQ3hx9lPpg+UHvbOf+VGdFqpX8yRcbADuJ5RiGGZ0Ff6sctK0iKyF95QY8s50ux/
	7i+bA1euI199is+xUfEpoSJglYrn8Yf/GpdH/NhG5FAu4cMMcqpjZDaRbBwMqRKq06wuaLHRfIn
	0PNvMHJkOKm2eHeIbYEAU2vHJYF+b4v7thmZb75A9LvK3/B801ANIH8ZBdcc+Z1nST9fizbxRGn
	a3InzTiDOqzMCHqfmwFlsF7kCC0TC7JKCsKdTa8nxqq4vIW8WI8jhjVPOos/g3qvp2VQQEGCxjW
	ZyrU0iQEGXe/HjGlOkh8E9xMpkTFjF/tAz+/kdJYqmqJTEgnJs9viMfrGHRFt06T4=
X-Received: by 2002:a05:7300:ac90:b0:2b8:5159:eca5 with SMTP id 5a478bee46e88-2bd7bc71d7amr3018015eec.14.1771818877478;
        Sun, 22 Feb 2026 19:54:37 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c6c:6cca:170e:c77b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dbe82d3sm4446364eec.21.2026.02.22.19.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 19:54:36 -0800 (PST)
Date: Sun, 22 Feb 2026 19:54:33 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, beomho.seo@samsung.com, jcsing.lee@samsung.com, 
	linux-input@vger.kernel.org, nick.reitemeyer@web.de
Subject: Re: [PATCH] ARM: dts: qcom: msm8960: expressatt: Add
 coreriver,tc360-touchkey
Message-ID: <aZvPUn2RxUHDahfO@google.com>
References: <20251205-expressatt-touchkey-v1-1-1444b927c9f3@gmail.com>
 <532531d2-8f26-4ffa-9355-7821a4d64200@oss.qualcomm.com>
 <1e74b956-a45a-4d3e-b7fa-e4d5dc0390db@gmail.com>
 <97d9d942-236c-4f8a-902e-0ad2ab684a76@oss.qualcomm.com>
 <1ebc2e1b-f1aa-4559-90a0-feb628d5bfe1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ebc2e1b-f1aa-4559-90a0-feb628d5bfe1@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93573-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,vger.kernel.org,samsung.com,web.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 73BE7171B61
X-Rspamd-Action: no action

Hi Rudraksha,

On Thu, Feb 19, 2026 at 08:33:43PM -0800, Rudraksha Gupta wrote:
> Hello all,
> 
> 
> Top posting for once (context below).
> 
> Not too sure what the next steps are to get the tm2 touchkey in. Should I
> resend the patch, contact someone else that can help provide guidance, or
> something else?
> 
> 
> Adding Dmitry Torokhov (official maintainer) and Nick Reitemeyer (person who
> introduced this variant).

Sorry, I am not sure what the question is... It seems that you made the
driver work without any additional changes?

> 
> 
> Thanks,
> 
> Rudraksha
> 
> 
> On 12/16/25 04:59, Konrad Dybcio wrote:
> > On 12/9/25 8:10 AM, Rudraksha Gupta wrote:
> > > > > Add the tc360 touchkey. It's unknown if this is the actual model of the
> > > > > touchkey, as downstream doesn't mention a variant, but this works.
> > > > > 
> > > > > Link:
> > > > > https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/input/keyboard/cypress_touchkey_236/Makefile#L5
> > > > This driver mentions a register called CYPRESS_MODULE_VER - maybe
> > > > it could help confirm the model?
> > > > 
> > > > Konrad
> > [...]
> > 
> > > When run on mainline, this is what was outputted:
> > > 
> > > samsung-expressatt:~$ cat /sys/bus/i2c/devices/0-0020/module_version
> > > 0x06
> > > samsung-expressatt:~$ cat /sys/bus/i2c/devices/0-0020/fw_version
> > > 0x09
> > > 
> > > 
> > > fw_version matches downstream ClockworkMod Recovery dmesg:
> > > 
> > > ~ # dmesg | grep "FW Ver"
> > > <3>[    2.201312] cypress_touchkey 16-0020: Touchkey FW Version: 0x09
> > > <3>[    2.206317] cypress_touchkey 16-0020: Touchkey FW Version: 0x09, system_rev: 8
> > > 
> > > 
> > > Unfortunately, I'm not to sure what the other variant versions are, so I will CC the driver's maintainers:
> > > 
> > > MODULE_AUTHOR("Beomho Seo <beomho.seo@samsung.com>");
> > > MODULE_AUTHOR("Jaechul Lee <jcsing.lee@samsung.com>");
> > Sounds like the best idea, I have no clue either
> > 
> > Konrad
> > 

-- 
Dmitry

