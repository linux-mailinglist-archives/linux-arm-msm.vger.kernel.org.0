Return-Path: <linux-arm-msm+bounces-89464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6288AD3888A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 22:40:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 385AA30A5648
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 21:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B645130CDB6;
	Fri, 16 Jan 2026 21:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HhGG1Tmg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9133A30C603;
	Fri, 16 Jan 2026 21:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768599558; cv=none; b=Pf1riFyqqm4ET0PcxOFDx1CZR9v0iJWH3Amky9mNLJIdmGzyfeghKgZrdX6caXKYPWHyCi9BuZFkHM0Nwg/jDoD8y/wqTRdzcDsjlGZv3V366YTnH8ieOdtiLGF8+IggvjxztI6NHaCr5z/PMtU/yZNlEVVNAMtuvR/4s5YE2oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768599558; c=relaxed/simple;
	bh=MV93CuULcAQqOgxT00b+4q6eXAoEm+4NJrLeOYWjNxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cR5v3qt4+OIPx2yQBDznVjOZ9kvdqgkNyB0M6sN6luUtwaZ+zUqqVIyrV1TXDv/J+Y2BtfF3JgUow1pnV4wsUyq9SDdwAe8lUMz4IDs92tA8SQjzp7oDBTPjq5ch+Ur4y/owaPBYngZaXvBPQZ1oMNPVkTxad1V32773gD/oxGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HhGG1Tmg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0B5C19424;
	Fri, 16 Jan 2026 21:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768599558;
	bh=MV93CuULcAQqOgxT00b+4q6eXAoEm+4NJrLeOYWjNxI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HhGG1Tmg9cBnEM3zvY9stwYh4ihZECtFGABriKCXLv2r2RBNXixXoESrbuRMqi0uC
	 zOvGUOjkUoK6AQpks32bpAiDxfGF39U2+I8zmRA9cMNBizV2msGH4n8506+G197EmX
	 UgPGSgwyEuuN2UEy/D4KFNYbJ+LPBKbrq+hKII6CIms7LoCdq87NZ6WhKpPNQ0no8u
	 DE0Au5189MyzVJvbLFzGgscvVcARsZa+786N1CpCX5pcC+m6k2AcQ2kk9shFZe7ayY
	 5PXOb8VYzs52Tcym1Eo/A/m0Px7M43XehJBtyIv2LonYBSb4sFU5Vg/nn6Fh7YE0Am
	 UIdlDBN7HUnbA==
From: Bjorn Andersson <andersson@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
	Tao Zhang <tao.zhang@oss.qualcomm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/3] coresight: add static TPDM support
Date: Fri, 16 Jan 2026 15:39:09 -0600
Message-ID: <176859948752.425550.17875918305781401789.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251028-add_static_tpdm_support-v4-0-84e21b98e727@oss.qualcomm.com>
References: <20251028-add_static_tpdm_support-v4-0-84e21b98e727@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 28 Oct 2025 18:11:39 +0800, Jie Gan wrote:
> The static TPDM function as a dummy source, however, it is essential
> to enable the port connected to the TPDA and configure the element size.
> Without this, the TPDA cannot correctly receive trace data from the
> static TPDM. Since the static TPDM does not require MMIO mapping to
> access its registers, a clock controller is not mandatory for its
> operation.
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: lemans: enable static TPDM
      commit: a91b64f55d0697cfa554a1c112479d66db6b0ed4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

