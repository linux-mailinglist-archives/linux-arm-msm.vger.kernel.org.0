Return-Path: <linux-arm-msm+bounces-107202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eO3SAzePA2qM7QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:36:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA3E52956A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2069230A9036
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 344413D75C7;
	Tue, 12 May 2026 20:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lv+DOqc8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114F13D75B5;
	Tue, 12 May 2026 20:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617437; cv=none; b=RAZ2DX9O5zT4UxkMbk/FuZ4JShmIrJaE7gkT/RGCRYe9n6xPoEpsmgaPxN6O7t0uhL+HNPfsLaCKrojha4qZWFEAiUjglvGZR6jjyRUfKL2CqU4R6GpOWZm+J5CTzk5wjGIokcklkDEljGMwodXgqVBJVivzlY0u2QC1aq2zHeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617437; c=relaxed/simple;
	bh=3uFrvKWGb9tw9WR21ARFPmiktM1IniX2dgHSTZvERx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c5kBWMDkAEkdjIf/P08UoLqoMH1E5MxSQ62hqUhgpveKSu7eJWv+PV1mwZNUsLbB2y3T0yHkd7XRTBiAOVkKjgvEdDHWseE6hWoHwTMXXkwGv2dlmBIAOeitApv9dRSYtxClmA6tdkMk/oo9fku74WALxqCLvm39kKUTLmSp8TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lv+DOqc8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1475FC2BCC7;
	Tue, 12 May 2026 20:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617436;
	bh=3uFrvKWGb9tw9WR21ARFPmiktM1IniX2dgHSTZvERx0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lv+DOqc8tRjnC/OlSsfffZ2geEvMCDLZjIWM6Hnn85nT5810dOnZX/6wIVNPawxlG
	 HZ632jARqUsf81oMR0wQKMOax0pGdAfliDCPc2jK63gqAEq57DzP/tjKdUX+m/60dZ
	 /zOIZ0T+Fqdey3VqLBdYdrxSkykw7K03DwZ9pWB4YDmN5IkQacBC2H/3XVWp4vcrVf
	 NZhOlXg85/5CSud+mtsw7WiCkJFW3HwCUAa5S/yC5yd8Av9G4GfphJCI6lNroRw5TZ
	 8266XfxEFkAvkBOv0g/zyifX/mC6U3/TLqd84qRWuC/9Niq69qwkDw8jAE3lPtEOEA
	 TBmFl7Nx4fu2Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mrinmay Sarkar <quic_msarkar@quicinc.com>,
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: lemans: Move PCIe devices into soc node
Date: Tue, 12 May 2026 15:23:09 -0500
Message-ID: <177861739364.1242344.8150094618219210625.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331090147.18522-1-shengchao.guo@oss.qualcomm.com>
References: <20260331090147.18522-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5EA3E52956A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107202-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Tue, 31 Mar 2026 17:01:47 +0800, Shawn Guo wrote:
> These PCIe devices with MMIO address should be inside soc node rather
> than outside.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: lemans: Move PCIe devices into soc node
      commit: 8222873cd4698627c08bffb2e40ba6f5a008fe32

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

