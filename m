Return-Path: <linux-arm-msm+bounces-110840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tmIAIJc/H2qRjAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 22:39:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A8E631D0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 22:39:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="F0FR/QHe";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110840-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110840-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 116BD30DB6BF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 20:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C746C38239C;
	Tue,  2 Jun 2026 20:34:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEC4382388;
	Tue,  2 Jun 2026 20:34:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780432499; cv=none; b=tt/sBlKYHovf2Fo0G8nl0Ssm2tiyy6eNMdAYCDDSQK/9y85e62Z2LfHGalSA/fhWFDo130F9gLlH+IoziyHg/ePX0BdrWxRlGenZYWKRgLwb1hNNyingdC9cO6xpBUcHQnINdqqudgPSAyiih6HH+WIqPeNT1nHqsn1qMnUhOb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780432499; c=relaxed/simple;
	bh=FGM8HsWAGCmF6WvKlNdMGdobCEuqhcarK8sbhAZX178=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rk/mkjeY0ayXOnhhnwqnIUFSS3dDrBoD5ADVBCtLiV7FYNga1jRutFwAXrdj28azot6/i9mj2FptDRF5OSdTkEt85j2yZvlx30gJO+it5yJ8GzmiRT77bCdMCPNAafGVH0comvcENTHNEZcuwHBboQVOJQZ/3wtfqYPWhhubFoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F0FR/QHe; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906BD1F0089B;
	Tue,  2 Jun 2026 20:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780432498;
	bh=y2IHE5pMykaTeYcvGS0rFrLAbhk0p3IMHxukKe6uT1o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=F0FR/QHeLseNKlGVuavBp0GaFCTZ+GQriOINrSs19ScKcyP8yEjBAqDjv/Hf3/NYH
	 w1vAeX+iX0ghefMjolRI9ER7xuPjQ+AcsvBH0bVniajKUEPRsvRci8kknk90ry3Li0
	 e0rMLTHnFDuzo2uGol9pm35bgCKfipTh/ZnUlViYByu7lO1bkx8Ddk2aK1wQfwizkb
	 7zBYCIwPk9MDF+SjgbSy6IlX9gVLtiQL+jEKVxqpMQj5nS08UGHFjUGE/A53j5AhIT
	 fhGycZTk2C2dmUEJ3VyAwRJRnTKwE3EG9Q93SWeNBbILySgHbk213Xbe3CkoliSzft
	 RXkZxx8c3oQVA==
From: Will Deacon <will@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] dt-bindings: arm-smmu: Add compatible for Qualcomm Nord SoC
Date: Tue,  2 Jun 2026 21:34:39 +0100
Message-ID: <178041465050.4028495.1386428522122562328.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260519013950.873105-1-shengchao.guo@oss.qualcomm.com>
References: <20260519013950.873105-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110840-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:shengchao.guo@oss.qualcomm.com,m:catalin.marinas@arm.com,m:kernel-team@android.com,m:will@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:deepti.jaggi@oss.qualcomm.com,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[will@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm64.dev:url,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 27A8E631D0A

On Tue, 19 May 2026 09:39:50 +0800, Shawn Guo wrote:
> Document Applications Processor Subsystem (APSS) SMMU on Qualcomm
> Nord SoC.
> 
> 

Applied to iommu (arm/smmu/bindings), thanks!

[1/1] dt-bindings: arm-smmu: Add compatible for Qualcomm Nord SoC
      https://git.kernel.org/iommu/c/2a5b7d11ee28

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

