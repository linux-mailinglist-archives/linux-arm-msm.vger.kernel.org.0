Return-Path: <linux-arm-msm+bounces-79070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF391C11DD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D39C464C1F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4622D34E759;
	Mon, 27 Oct 2025 22:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="brPh4Fr2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4A134DCF7;
	Mon, 27 Oct 2025 22:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604538; cv=none; b=sF201ksKDWSMMTiiNUO0CtJfDgE39HAEGY2k9TRna1JSagGaqrj9UqBEE6wOX5MGpVG102ZwYJTZ9DcpwZUH7TEi5XJJJLI7Bl8F8gkrq4qr3n8izRRfoxriIFDZUVAA/iydJgvjQACP5ooKyNkdB3EnBl0BudjqmRFqx3AQUM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604538; c=relaxed/simple;
	bh=kbxjWGg+U99iVYtLmT5ZIbNse3RWnk07RrgXxBDMIgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CLmpyi7MBFygzmgkCS12m3kum/2145r8tcyznyJp/wQeU33hkQSiLaAqnjzz2ZdlulyWEov0/CVOWkfYWdmztvh+L4HIcgttw902ySqAUWjzQ/hRgHHisx0uu/GT4/aw3jdtQbL+jdCcS76GqoeglYVJO6gX0T7lT221UxOEZ90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=brPh4Fr2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FAC8C4CEF1;
	Mon, 27 Oct 2025 22:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604538;
	bh=kbxjWGg+U99iVYtLmT5ZIbNse3RWnk07RrgXxBDMIgs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=brPh4Fr26CuQjOlUOBSyDJks9nxKVE6veQe/K7ghPjEHbqIMBA8vZaY4WDIyvHEZ3
	 tTWHs5u/ZsCCKD26bCbkz4AWFL7izVbS1RVDNGcd3J45g3FWltx4kVq21LlCHKY28u
	 0C5WyAn1eDsQSRgLO4YImiNc6GLLLE7cCqnqSTLOTH+nZBmKdOw6HwD0wwz6+EfJ5m
	 dLVHHEBkegQZx8T3Yur8QspkGNg9WtNeTqVsRpEwJ1FUlFuf0FKkKUTB62QBV8LBd0
	 FMyAi+iKVdUMHKWQlbHynzVk0u4Jf4aklwMi8z3rVDE9GAaLasTK/aXn5TpYfYARTK
	 6r5JKZ9NxHu3w==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: mukesh.savaliya@oss.qualcomm.com,
	anup.kulkarni@oss.qualcomm.com
Subject: Re: [PATCH v1] arm64: dts: qcom: monaco-evk: Add firmware-name to QUPv3 nodes
Date: Mon, 27 Oct 2025 17:37:30 -0500
Message-ID: <176160465192.73268.2355713634333394977.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925042605.1388951-1-viken.dadhaniya@oss.qualcomm.com>
References: <20250925042605.1388951-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 25 Sep 2025 09:56:05 +0530, Viken Dadhaniya wrote:
> Traditionally, firmware loading for Serial Engines (SE) in the QUP hardware
> of Qualcomm SoCs has been managed by TrustZone (TZ). While this approach
> ensures secure SE assignment and access control, it limits flexibility for
> developers who need to enable various protocols on different SEs.
> 
> Add the firmware-name property to QUPv3 nodes in the device tree to enable
> firmware loading from the Linux environment. Handle SE assignments and
> access control permissions directly within Linux, removing the dependency
> on TrustZone.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: monaco-evk: Add firmware-name to QUPv3 nodes
      commit: 30b5167b808c5a7eb8559bbd296fce14cb62e58d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

