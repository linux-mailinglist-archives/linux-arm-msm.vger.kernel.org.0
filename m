Return-Path: <linux-arm-msm+bounces-54548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7452EA90AF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 20:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B352F3B7715
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 18:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FBDB21ABDB;
	Wed, 16 Apr 2025 18:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KPP/xt3U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BBE21ABCC;
	Wed, 16 Apr 2025 18:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744827051; cv=none; b=tcTxWTHd3FvSXvans4FfJrKQvmsiHtA/5geBgnksanvmdRKuI/WFafzYu7H679BgQoxuezI+4L7P5Cx9I4i9BSxR1ZwAtRhjGMVqhdOLXN37wYIeLtdsUKFdyb2f+I+UyBxtLvOXvw4IQEryfhra6Azbu4FnX/nybaGR6AIND5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744827051; c=relaxed/simple;
	bh=T7+pyAzFefNEIC26tzHPEK5uZz24O8PfTZAHey3DiwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IXP86BxUyHdHyg4YzyL8nE11a2wkeca1iyIcVrOfGVnXxJIgkDWNL5wY/u5IvTmIC2Tmn2XPbUPyJbAuI6SHGhohdWg0hghC+HG+qP3gbKPWykeB1O+bMsUcRNtkqqOf/wT9AjwrUAagoL23VsQ+JS6iTUoI64mUvoYKl5a/lVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPP/xt3U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 149B7C4CEE9;
	Wed, 16 Apr 2025 18:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744827050;
	bh=T7+pyAzFefNEIC26tzHPEK5uZz24O8PfTZAHey3DiwQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KPP/xt3UgNJfIF8fnZW5HODG386B5R8mbOKnI4yCYiYPzLAmiPwyk5pG/aWyNqJVM
	 pNtxvfKMfu9UQnOKFjc6hw19m5mj0Q/6vD1bH4i4Yyq/Tg8WdkDu2W1PLmnVbeslK3
	 mgSvfR8Wvh6oVE07fXevWSUOd7SWXpPUlOMrrGwUgMY7THe9GHkrnLXcrETg3c9wAT
	 PrQOW2LfuumDIpwgZWA81BccUcy0ORMODuxrDRH3L0rCg7sITGGy3CQGSZugfxvxVi
	 BseiRPdm3F1eZlM2dlEaP9EGPnofmOjBFor6ZPnZvZexhUqMjV/gRlIf5J8Xbahg+Z
	 jyk+7b1/zlCDA==
From: Bjorn Andersson <andersson@kernel.org>
To: cros-qcom-dts-watchers@chromium.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 00/20] arm64: dts: qcom: minor display-related fixups
Date: Wed, 16 Apr 2025 13:10:41 -0500
Message-ID: <174482704418.446874.3479876614080391885.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 15 Apr 2025 13:25:58 +0300, Dmitry Baryshkov wrote:
> Based on the patch review by Konrad:
> - Change VBIF size to 0x3000 as defined by memory map
> - Use new DSI clock defines on SC7280
> - Use TAG_ALWAYS for MDP->EBI memory interface on SA8775P
> 
> 

Applied, thanks!

[01/20] arm64: dts: qcom: sc7280: Use the header with DSI phy clock IDs
        commit: 33e020b942cb4bcf2f3870b573470973e6464bd5
[02/20] arm64: dts: qcom: sa8775p: mark MDP interconnects as ALWAYS on
        commit: 8725fb400542a6c88c1cc918d96064eedc8c94c4
[03/20] arm64: dts: qcom: msm8998: use correct size for VBIF regions
        commit: 31e18ebef09a596ea87277c24411e1a86eb56470
[04/20] arm64: dts: qcom: qcm2290: use correct size for VBIF regions
        commit: bacf203baa1ef896ac2bb4f9bf43b19f15a6ae26
[05/20] arm64: dts: qcom: sa8775p: use correct size for VBIF regions
        commit: 180f990ed061cefdac620d02f34b03387210a2b7
[06/20] arm64: dts: qcom: sc7180: use correct size for VBIF regions
        commit: 74e18dc4aef0e8e2989815856e48c737820ebca8
[07/20] arm64: dts: qcom: sc7280: use correct size for VBIF regions
        commit: 545b26b926ae20640a7d464e1b830ce4ce021fd5
[08/20] arm64: dts: qcom: sc8180x: use correct size for VBIF regions
        commit: a24e1cb954a6915983280e757c36d04fd5e6ce34
[09/20] arm64: dts: qcom: sc8280xp: use correct size for VBIF regions
        commit: 7b5160ce90a3c6c8e6202f727c3e6cd2c0911cbd
[10/20] arm64: dts: qcom: sdm670: use correct size for VBIF regions
        commit: acc206fed3698554a16cf70e5a2fc0e4f1e1a5fc
[11/20] arm64: dts: qcom: sdm845: use correct size for VBIF regions
        commit: e50450aae01ea23e17e10f59cdbdc7aa59108250
[12/20] arm64: dts: qcom: sm6115: use correct size for VBIF regions
        commit: c7f4216765891939e6d2dfa8809883bae978582f
[13/20] arm64: dts: qcom: sm6125: use correct size for VBIF regions
        commit: e24c7cb72b9b1286deee43fecf87d0248fa430cc
[14/20] arm64: dts: qcom: sm6350: use correct size for VBIF regions
        commit: 7cfcd1a3c519d0aff10af2db06aa6d2291393bd8
[15/20] arm64: dts: qcom: sm8150: use correct size for VBIF regions
        commit: 130e9aacc40176b5fa2954e7861d9b5f28f373ae
[16/20] arm64: dts: qcom: sm8250: use correct size for VBIF regions
        commit: 4e851ff6a3a12ce616e3cc902af0ae2efb2e8137
[17/20] arm64: dts: qcom: sm8350: use correct size for VBIF regions
        commit: d55fe5da78836835f9a88c29dd2fb3086b4a3720
[18/20] arm64: dts: qcom: sm8450: use correct size for VBIF regions
        commit: 62acfd77a5783948ba3593fb169720ab7495c380
[19/20] arm64: dts: qcom: sm8550: use correct size for VBIF regions
        commit: 9e9d8349e76252d5b7e060cc0ca4823a3f062052
[20/20] arm64: dts: qcom: sm8650: use correct size for VBIF regions
        commit: d8203fff4e6849cc5799fcf51105f7622e13c46d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

