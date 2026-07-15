Return-Path: <linux-arm-msm+bounces-119213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5OTaHjJjV2qPKwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:38:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD2A75D0F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:38:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=RJsQ6Hml;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119213-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119213-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFBC3301E3D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 10:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B263436BF3;
	Wed, 15 Jul 2026 10:34:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D867D3EDE63
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:34:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784111676; cv=none; b=KNzxn74wDbLYAQk+GT2nP2KXsN+JYveElHAkBGXrtjd17hNonhm3sIj2xJ/eG1GqvjWeTxQgMxOrStYMk+QHdEejrukpu+OUo0nQ2vBevTCMa5UecGELBHqm9e/6ppX0U7myDPbr5BRlVcID8DiBZiUcPcXqaxdAxuqDVQsEHDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784111676; c=relaxed/simple;
	bh=A0Q4nXBnRyDHakW/kK2QunLf2JcRxCVGBMNpnJ0N+Ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pfvXETswM8as/G6chHrWJwHvU7/Li1RhgdZtHiRqeWczWhGNNWN1lFJWwXoO5Zc3HqrFAXU/bRYbb+QXaOHn1OSYIhs22dRJvkzKcoiwWWtm2sbRohm0sVCCRek+ALRERtbRxraEjsMBUoq6RHQUJfkQbOLaJwkYb11MzI+tHA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RJsQ6Hml; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493bf73ec2aso36219285e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 03:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784111673; x=1784716473; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KijEZeJZVwscbyyyI2a/znLma4yo3YhlEk1e+25at/0=;
        b=RJsQ6HmlsUz1MgmSldwANQXH2zBsjqKklvYEcn25giXG5t7ZKH9g476HpOvlpJuhw0
         29P8+exLCJaU7Dv+2s/AxSShIk2+une1qTqei6HBXBZI5xj4W4vvJhjfAXD8Q2asB1Kx
         +U6qHDnpKzXboCTdzCttvA+0WLzpx8yVMbh+dGprIaCyxDwxNpQxF8QpMiK/Pwkb9/JR
         S+15vtZ/uKf4Y9p//uPobjtRUX27/KJ1FBVa7xaZwX5RyuyJljAJ7aCRdNPj7JY5kYlO
         Fg3VHLkD8S5w2LweE63/1gJ+JsLCLr2oh1N5GMtGHw83gtHJHBGb3DQm+pwMTfyRaNXa
         Z+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784111673; x=1784716473;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KijEZeJZVwscbyyyI2a/znLma4yo3YhlEk1e+25at/0=;
        b=WfXIWpttVofkGJL89nr5Hwnk8j/iYNeQZufNUHhkRJpk4GSrny8Lnhngi1FI0u4eB5
         KQVlLaeNWaaS4HTosC42IMfp4rhieuPnKfMqEvm2v6uynIhMfBuRwlxBRgJ0A5Ib7oDW
         zDI8J7ghezeaZq/+i6jypgNj9WCe0B2fOYpowWWEbRbrAPRXibBFFSJw2NtItDthPdud
         V89fVWoKpNYt90wZpDdpI+spoK9hBJUVthnl3pEUlP7zEGi0KAKyxcuwAedh3RUQxbkK
         5W/x8gS24xgy5mpVrEj9bIklReNJGWQe1Z5ADoDZxaEMaTuvv1tjCipudMFAcP197po7
         VmSg==
X-Forwarded-Encrypted: i=1; AHgh+RpBtq5fwAH8KsAfyquqaOwOWyI8ttYeUXdYp50ZyN2z+SCf8uacRxSnnY9D2Yb0wxeFVD4LsqIJ9gE3DUD9@vger.kernel.org
X-Gm-Message-State: AOJu0YwdS93a0Mm3r7xfQAqjpfqsq5/LRlBtd3Rh7etlSXr3xypd6IW/
	KvYuhLlF9rK4E5BtllfI8i6vZoQq49n9VMCz+hRlarOQ7qdivHdOOEFTuwuLkK+3jy4=
X-Gm-Gg: AfdE7cmfrNLUncnzDaK8O5WjdDm//GWyUGt2Ge5j3l3qsrcZ84f4cv5T1mOvowqmoL+
	stUdl2AOLT51fVtoynmwn4hZBe6Sym69+YZq7EsJuGqejuA+NEp2fKwpjBUkfL3LCwTNYP7uprB
	BYJWXGKjFZsNJAkV5Jz9Ju1eVEbwbqXFwWyj8UAwF60+8FYZ0tOnqcC2lld1MMqMCtLUEjm5EpT
	fdvAPkrh3bjWGf+EfrTGfLXD4bzDHg6C9TcOdGnWOZoec1aQyTEDem5cTq5lyrg5TzJcAp6b8qF
	dKS3/yCVwcyGiNQdo2fXwIZ/IiBxrDI0y7T90ZPwvnjjqJGNQQS8upfhN5MJbNDW8tASsxt6cx1
	OsdzreahlPQ30ZZOttGMZL/pIlXkRRG5C0z27iV/U3DlvmgxMn7/AMQ7VAa+qsNQDBuq9iTwqwN
	uU4hliWY31l7vtFIf642o/sF6a
X-Received: by 2002:a05:600c:c174:b0:493:bd37:1cdf with SMTP id 5b1f17b1804b1-4953c14534fmr27104355e9.2.1784111673018;
        Wed, 15 Jul 2026 03:34:33 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:d62b:a557:d06c:e9ea])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495087366c0sm256049915e9.7.2026.07.15.03.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 03:34:32 -0700 (PDT)
Date: Wed, 15 Jul 2026 12:34:22 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Shawn Guo <shawn.guo@linaro.org>,
	Marc Zyngier <maz@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] irqchip/irq-qcom-mpm: Register MPM under CPU cluster
 power domain
Message-ID: <aldiLuYib1jCK784@linaro.org>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-2-3d858df2cbbf@oss.qualcomm.com>
 <7c8178ec-8bab-4427-8faa-5b28cb76a5ad@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c8178ec-8bab-4427-8faa-5b28cb76a5ad@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119213-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:shawn.guo@linaro.org,m:maz@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[linaro.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:dkim,linaro.org:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BFD2A75D0F0

On Wed, Jul 15, 2026 at 11:46:58AM +0200, Konrad Dybcio wrote:
> On 7/13/26 12:25 PM, Sneh Mankad wrote:
> > MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
> > the latest wake up capable interrupts when the CPU cluster is entering the
> > deepest idle state. This is done by sending IPC interrupt to RPM and is
> > implemented as .power_off() callback by registering MPM as parent power
> > domain to CPU cluster.
> 
> [...]
> 
> > If MPM has not registered with CPU cluster power domain, utilize the CPU PM
> > notifications to manage RPM communication when the last CPU goes to power
> > collapse.
> 
> I have mixed feelings about this case. The RPMH RSC driver keeps that as a
> fallback for platforms which don't have PSCI OSI mode specifically.
> 
> On the other hand, there are platforms (early arm64 - pre-msm8996 and almost
> all of the arm32 platforms) that don't define any CPU power domains, so
> perhaps it's necessary after all..
> 

I don't think this fallback is relevant for the non-PSCI QC platforms,
for the following reasons:

 - They don't define the MPM.
 - They don't support cluster idle upstream, so they don't need to
   define the MPM. They can't reach the idle state where it would become
   relevant.
 - The setup for cluster idle without PSCI is essentially equivalent to
   OSI, except that the SPM/SAW driver needs to program the idle state
   to enter. There is one SPM/SAW for every idle domain (e.g. on
   MSM8939: 2x4 CPU, 2x Cluster, 1x System). You can just model the
   SPM/SAW instances as power domains to get the same setup as PSCI OSI
   (I had a draft for this at some point). So if someone ever implements
   this, we should be able to use the same approach as for PSCI OSI.

I'm not aware of non-OSI PSCI platforms with MPM either, so I'm not sure
when this fallback would be used.

We probably do need some fallback for the old sm6375/agatii DTBs though.

Thanks,
Stephan

