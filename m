Return-Path: <linux-arm-msm+bounces-61057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA649AD6696
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 06:05:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA468176150
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 04:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D930B232369;
	Thu, 12 Jun 2025 04:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V32cHvn4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA42231A4D;
	Thu, 12 Jun 2025 04:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749700872; cv=none; b=JPaLhz4NzvLvwIEa9Y8b3YN5t1t5y8gnG2+6nOIlXp49K8niBK2cbPmgybd3gYtc1kATiKjiMMZn2B2Dz3OBMKM5Ikth2AafByIXMpCq/9yNQzCp1+f9bktNdNfLYjlxAdx5F4pT06CjgqYFpv2y9O2A5x5cnw/+RZ4xWzNVCPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749700872; c=relaxed/simple;
	bh=Ak9Cw+XEVeVNu/bPQVPZBiGN4T3ReR9/GVKensgGhbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fi1w8FWHlLVC1mZGbrUKDMIg+aLQM9ZU7Y+Uzc2EGQNJjd6wYZvwBG9edHRXj9N0zhIKQepA9jm6puA4CRRy1e/DUKI0IiW0Dt9HSdjqZukbS9v+NFS4tc286vF7I+l0ue/mDA8CRW/owiOZeuXtu4o1DY8Z2DSoggTOk/nv6wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V32cHvn4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E701FC4CEF2;
	Thu, 12 Jun 2025 04:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749700872;
	bh=Ak9Cw+XEVeVNu/bPQVPZBiGN4T3ReR9/GVKensgGhbg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V32cHvn4GzRNpVO+Gbssd2OW7qhN4AXNiVLhdWCBVMPf1n+k71DIbyJVwPQfO6SyC
	 SlGRTqPc4fdVrDXn8jlp8sRYWj3qB2dH8daIsz1xoFGRPDyVIPY2Rg6xhNaUPTAEbV
	 /vlNauytNmibyPPBC6XTc1g61dX1DlvWSi4BlyGy+R4pPM9l79qjmTC6aam/ix/xRX
	 ZuLi246Hy0fHaacS2klp0fu5NZ1e8+bhF90wdgQgUvmp/trEi0brrmfJEqFUPX7Xs5
	 NYm+6aH4CL6EWN0VREKTL3VzzJM8m2iQP+323pPBIw691K+KRquQIT6BLCGcpmtPoE
	 CU0tlNghOl5cA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Max Shevchenko <wctrl@proton.me>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH] ARM: dts: qcom: msm8960: use macros for interrupts
Date: Wed, 11 Jun 2025 23:00:51 -0500
Message-ID: <174970084201.547582.5153342376914964484.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250606-msm8960-irq-macros-v1-1-03e573ba26d6@proton.me>
References: <20250606-msm8960-irq-macros-v1-1-03e573ba26d6@proton.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 06 Jun 2025 14:03:51 +0300, Max Shevchenko wrote:
> Replace the raw values with macros. No changes to the output
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom: msm8960: use macros for interrupts
      commit: da7811bb0edbea0208800cfa16516a47b8d45747

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

