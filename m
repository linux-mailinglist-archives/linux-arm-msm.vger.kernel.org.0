Return-Path: <linux-arm-msm+bounces-43443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B41B49FCEC2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 23:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E05318835C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 22:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D4A1DC98C;
	Thu, 26 Dec 2024 22:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P76UBlt6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1561C2443;
	Thu, 26 Dec 2024 22:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735252763; cv=none; b=e+z2od7zS+pE4bHU4Y/G6HTHTL2qegZJNgwq4bpYgg96blBMmRC67O01wba2svlKdLalXLR3rENv3ANxz234Mnh0jLKg1CgnXdNLpcEBVOFTjga9avt0tF8KstP7QCVcQzXbXqNJb6KfIRzzcdWhP80Tcftvi9wYL1frh7GyDDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735252763; c=relaxed/simple;
	bh=tV+CdgR7E6rGMJlDVv0V3QP7ZUnPgARHrkQOYbkfKsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LvlxDXsrYehNgQ2n2cokaIO2WbTT4K0HE4dVKdk+iBrcH76/Dva3EdURwbDsj3jiw7dTOecI9oXaTbu8AYKoXGqm108k1OLkieY59c2Ze6Kqo9MEXCxuDCux33L8HKxoXo5zIuj8xo4zwr7wH8ADYrQeOkJc7wDpRQvSexrLm4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P76UBlt6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89543C4CED3;
	Thu, 26 Dec 2024 22:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735252762;
	bh=tV+CdgR7E6rGMJlDVv0V3QP7ZUnPgARHrkQOYbkfKsY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P76UBlt634sh7YJngIsL+cVDVzRaCXyvEDDpBj777ntesIrDLpFKjuJyCx4Af8zPC
	 LqV+MHIz5piyz0OLkEWeGem9JBsVuj2opEsfirPytCp3YA350xsU2tmTPiJV/OyWhT
	 LeWn0eIKyvSULL53I2y368xzpiGf7PKgWacqRH5PEIF/mYNjGets+1YCKEvD2MHjyV
	 4uuZLkxAvJeq5RbkF7zhwnu2J8wuyRSLE53lLWfcSARQ0NZYpXBm1PO3MBbVjCefSn
	 dxFPPRFZC6MIQVDLrkbotIN1FD1sMpZkj/nrwHftgMcdXdiVTKz996wRnxEyFDND5u
	 8AW9s8ESZ0XNA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jingyi Wang <quic_jingyw@quicinc.com>
Cc: quic_tengfan@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: (subset) [PATCH v4 0/4] Add initial support for QCS8300 SoC and QCS8300 RIDE board
Date: Thu, 26 Dec 2024 16:38:47 -0600
Message-ID: <173525273239.1449028.17978193547825691565.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241203-qcs8300_initial_dtsi-v4-0-d7c953484024@quicinc.com>
References: <20241203-qcs8300_initial_dtsi-v4-0-d7c953484024@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 03 Dec 2024 17:27:11 +0800, Jingyi Wang wrote:
> Introduce the Device Tree for the QCS8300 platform.
> 
> Features added and enabled:
> - CPUs with PSCI idle states
> - Interrupt-controller with PDC wakeup support
> - Timers, TCSR Clock Controllers
> - Reserved Shared memory
> - GCC and RPMHCC
> - TLMM
> - Interconnect
> - QuP with uart
> - SMMU
> - QFPROM
> - Rpmhpd power controller
> - UFS
> - Inter-Processor Communication Controller
> - SRAM
> - Remoteprocs including ADSP,CDSP and GPDSP
> - BWMONs
> 
> [...]

Applied, thanks!

[2/4] arm64: defconfig: enable clock controller, interconnect and pinctrl for QCS8300
      commit: 57039a27658a1e7ca1c60fe7e381092c609e4bc7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

