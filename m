Return-Path: <linux-arm-msm+bounces-58252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4068DABA871
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 07:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D87B07B0693
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 05:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0007019D087;
	Sat, 17 May 2025 05:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DL6QLoFQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB574C97;
	Sat, 17 May 2025 05:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747461440; cv=none; b=hGVMtbcskIDLoiBWx5RD0JwTYWG0t+yP8By2Xtte/3Xp/CBZh44cdf5JDamk5kTZRZDn4nmT0egMKupkUUxQ4QjOhz28cIBhY0D+2u6cnSgJMWO8ut6haB6ha1IcyfmYoU9RFxWU2kt1Wty4OnGbYj4obAnp7N36FaU5tEF4nHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747461440; c=relaxed/simple;
	bh=0dxFOYigYkWsCXOb8FWDLm7oUp1TyQVnV0QtPsmuE7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qkUyY2DBkplNuidBtVq3k0ThRE+KddEg9A3dsZ0X1K5Jx8CbxWRDmikg8mFArl/jpy9vRdCMmi0AWyrluiEQitcEDCWPRfbiDFGA+wW9ErOaz3ugA6cSw0BWPRJUfgVmZ981fQSUnBAT4lpIqWzgnfrfrkDzJhLhajTuCmEYkZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DL6QLoFQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10563C4CEE3;
	Sat, 17 May 2025 05:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747461440;
	bh=0dxFOYigYkWsCXOb8FWDLm7oUp1TyQVnV0QtPsmuE7o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DL6QLoFQUxPEZMw7EOUKoC/3e9Bl1z0v6y/tdCn+HdsXWcCLerdFSpl+Rzmxi0zZR
	 ZE69OLR+pPlDv+8dnR5ud/EZDQOMCnWR73polvOxmO8IRjB4Jht+Osy6xivJb1Iwmg
	 0PMqr38U1IUZEkUTS7D9E9DVO4eb0HjM1iihT8lSNmvhig0iMMnHKhIw0NLeQ4TEIj
	 qTUWw2FtqvWHhXy0RF5EMlyvHf2jXjY3YHyRW9jQWuTZA8mKOV3d9OvD2TsxPiAV1M
	 //ozQpX7T2IHD93HyJsTTQ03o+FnZricyEu4a5x78lVGWqd3W1Od44VIr4eM/cdlp4
	 XMR/HAm+16+/w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dgilmore@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e78100-t14s: enable SDX62 modem
Date: Sat, 17 May 2025 06:57:12 +0100
Message-ID: <174746143134.152010.4166315048765927187.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250327081427.19693-1-johan+linaro@kernel.org>
References: <20250327081427.19693-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 27 Mar 2025 09:14:27 +0100, Johan Hovold wrote:
> Enable PCIe5 and the SDX62 modem present on some T14s.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e78100-t14s: enable SDX62 modem
      commit: 03026046589d9baca0d24348faa76c72899de48f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

