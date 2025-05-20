Return-Path: <linux-arm-msm+bounces-58569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD00ABCCF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 04:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B9471B6270A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 02:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291D2258CF9;
	Tue, 20 May 2025 02:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HtTjLG71"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE0E2571A1;
	Tue, 20 May 2025 02:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747707312; cv=none; b=W7UAFinCsDD+2S3jphNpZFDff7pgV2y+cLIN5HHi1Nlxg6fUissRu0RLLUjQXZSYSfevfmBiqaIyj0njJdymg4NH9O1b5o4BFX8a9CNukdVzBmtQR3WUK6YW4ZS9HWe6MC6fXbMVuAmfSGGJIMct9JrE6Dg+0mcfB5xpKPk2xI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747707312; c=relaxed/simple;
	bh=Sy2HiUHFiX3N/b+QVDATOiZmeZjV6T1mmQg9m27AJUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SfRadfqwikVSyvvSipmtpwEtaiPbeF/D1BbX8JTyPpVFutnrimhvgPyxb8M8iFO8a/0AN3ToJtz+rbRWMHNpkqloNSso/AmO0YYM8CX5Wvb64VCAEBIebkWGWMkdsuYXaklWytb8CeKWG+u3Jau7Im2VpeIkO7N8/6KdELLCHt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HtTjLG71; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2186FC4CEE4;
	Tue, 20 May 2025 02:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747707311;
	bh=Sy2HiUHFiX3N/b+QVDATOiZmeZjV6T1mmQg9m27AJUI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HtTjLG71u41NuLDjinojo2gPH1XTRksGStEx9xIONu87sh3/MjnCDR4etJBvXassz
	 I/ylYUga8LkUipntFAVJQzjj0qodVKmEK8J2jv/7otkj+//01PZv9Nqg6YTmnT3KOB
	 l2HREcYj2PtxhbyoCyVhv1LXWTrsLbB/0L5bJhBu3gYSadaV/T8ZeOD2SDoMnvqbJs
	 jeAWNFsvyo6oP3OIMcT1UZt5wbuRh+hacL/qOsLaqVqsoZVHeT3s0fpFpVYieDeNzG
	 iqsWBY5SZ18ExO8mI9oHCZQ9bbcilGwl/Fq6srgCxbnWSaMLn6SK2YvWomT21FSSLJ
	 bP+PaAKsXfb7w==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Marc Gonzalez <mgonzalez@freebox.fr>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Arnaud Vrac <avrac@freebox.fr>,
	Sayali Lokhande <quic_sayalil@quicinc.com>,
	Xin Liu <quic_liuxin@quicinc.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/12] More more dt-bindings fixes for arm64/qcom
Date: Mon, 19 May 2025 21:14:41 -0500
Message-ID: <174770727717.36693.15331712758314200437.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250327-topic-more_dt_bindings_fixes-v2-0-b763d958545f@oss.qualcomm.com>
References: <20250327-topic-more_dt_bindings_fixes-v2-0-b763d958545f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 27 Mar 2025 02:47:02 +0100, Konrad Dybcio wrote:
> Just some routine stuff, really
> 
> 

Applied, thanks!

[01/12] dt-bindings: soc: qcom,rpmh-rsc: Limit power-domains requirement
        (no commit info)
[02/12] arm64: dts: qcom: sc7180: Add specific APPS RSC compatible
        commit: a9fa18f839c4e2f33c8d0f327a9a970ec29a457b
[03/12] arm64: dts: qcom: sdm845: Add specific APPS RSC compatible
        commit: facf5df87129d273cc1f7dac0d1b4ec715bdcce3
[04/12] arm64: dts: qcom: msm8998: Remove mdss_hdmi_phy phandle argument
        commit: 7ebdb205d4b9dd839a93a9b8975ce8ccf86b882a
[05/12] arm64: dts: qcom: qcs615: Remove disallowed property from AOSS_QMP node
        commit: 7185c9cd0e2281b113dacbf3c160ffcce06c912d
[06/12] arm64: dts: qcom: msm8998-fxtec: Add QUSB2PHY VDD supply
        commit: bd0eaca2f1be0ea72b7e0b9433c6102c47b28eed
[07/12] arm64: dts: qcom: msm8998-mtp: Add QUSB2PHY VDD supply
        commit: 3e060720fa26cb5262f16ed60022c0f816be56fd
[08/12] arm64: dts: qcom: msm8998-yoshino: Add QUSB2PHY VDD supply
        commit: b108ca47ea14068ca38cf9129d3592dc4ee79e5d
[09/12] arm64: dts: qcom: sm6350-pdx213: Wire up USB regulators
        commit: a30e5b31751ca8a5d5f79f10b594926ac094965d
[10/12] arm64: dts: qcom: msm8996-oneplus: Add SLPI VDD_PX
        commit: 27880745470afe3ad97967c4751a1ecdb5d245ce
[11/12] arm64: dts: qcom: sa8775p: Clean up the PSCI PDs
        commit: f275447923600ba463133ae5c15c079bccf6b5a6
[12/12] arm64: dts: qcom: qcs615: Fix up UFS clocks
        commit: ea172f61f4fdb17aaaf8def980ee309a3b727eea

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

