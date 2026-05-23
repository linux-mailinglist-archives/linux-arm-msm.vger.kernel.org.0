Return-Path: <linux-arm-msm+bounces-109439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNjaLe4PEWrDgwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:24:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 208B65BCA35
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:24:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65CA6302DA27
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 02:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A26D33689B;
	Sat, 23 May 2026 02:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D/s6uuUY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D592D23A6;
	Sat, 23 May 2026 02:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502815; cv=none; b=ILIblMTUxc98VS+YoGXfNGXehS8i4x7boSF9fa/zZkGSugwgfZSkB6VEfgCNjqxe+g58oOVOLtyIoZa9vF1aEDZtl5qNoko9her9eIwN5dB19N9bZveuJrw9LxD2YPWVgJmSA04vsF/a73HkqN1fUPQKsyWEhPkUc1u+Ukt0/2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502815; c=relaxed/simple;
	bh=sG/ATOnhAON3l8OLw2tFt6MmHPyBveT8UhJExn5h2Yo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rsIghY1n8WWCXNA0jR1+2QesvD3Mz2ZA95184GKIyYD43CmKn4n5LYDGuyQoy04+oIBS5oC2PrLaImSDqG/5RQUjSsguDvvfo9/N90H9CIXU8xMTcbQRpzXZIPYzh15DRrVz01zmeVodfgWAhFBj9IMcoyzVnjG4YhG1ga5Wx5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D/s6uuUY; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D5E1F00A3A;
	Sat, 23 May 2026 02:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502813;
	bh=yixi5j0X7McH2Usmf3ai4zvLkCRgxpwEoDuLAV6mRAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=D/s6uuUYSHHl6lJO6izHWTGgZHr+pTCLwgtZchRroQywxKSB9AIYkTGjyc02NEBrI
	 Gs6/H+nVGWbgig1yH+hbN4Pt9EIUsyojQAmlB7IqWjXgquelnYA37bPHfGt2cGaRbB
	 yGbDWQ+3D8zpDwCctDCkni1W8lzbEobcvyUeQQshhTI+AGVKDoa0onNVqME4IaykI5
	 6CGv9/KziwW1oB6nzjHcHkx3Ln8cbaVn7fmlxoIzyUeI2TUY18lqPVpXEL04bi0XFx
	 jXRGcd6yGPgwMJlKYVX21y6cbaXGWrcTKySwt7Y/CqnwRN3uF9/uTcJkv+UFJQkpR+
	 gvlKmtH8kqnQg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Fix reserved memory addresses & sizes
Date: Fri, 22 May 2026 21:19:43 -0500
Message-ID: <177950280321.1097700.487425138395513555.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260412-eliza-reserved-memory-fix-v1-1-05cb3e33a9fe@pm.me>
References: <20260412-eliza-reserved-memory-fix-v1-1-05cb3e33a9fe@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-109439-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 208B65BCA35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sun, 12 Apr 2026 15:38:43 +0000, Alexander Koskovich wrote:
> Update cpusys_vm_mem from 256KiB to 4MiB, cpucp_mem from 2MiB to 1MiB
> and fix cpucp_scandump_mem node name to match actual reg address.
> 
> This matches the downstream memmap and kera-reserved-memory.dtsi.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: eliza: Fix reserved memory addresses & sizes
      commit: 2597338625b4e391d4d1aecbe2356f43cdacc057

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

