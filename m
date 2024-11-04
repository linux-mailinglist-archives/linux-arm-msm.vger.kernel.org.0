Return-Path: <linux-arm-msm+bounces-36871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 971E69BABC9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 05:15:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54A152818C9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 04:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC59B1A7273;
	Mon,  4 Nov 2024 04:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rn/O87p2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8931A3AB9;
	Mon,  4 Nov 2024 04:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730693639; cv=none; b=Q1xo2uRTIUtIEji6kpZwNU2SrU3RVaYjG2n4L1wavLelcjauvoogVP7Ndm00a/WAggmeyM9UOvUoRpuAmwE+5I4Of28huaUXoP7ksrko+U5YXXKaweo5un3I6TIJ25IgSX5uwisHM2/YYqyCYAYihjynS6a91HPwO+xPLAFPPRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730693639; c=relaxed/simple;
	bh=9T5BKD42cfy4aGeFmGVZc0bCKlM+O2UhHcLKtXsTiq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UB/Gw1rA6LdpHpR4eTpc/Y+8lPN++L+JKO4rN9lzeqwvhZXqSZ7HrG3IcRdHfG7RAYU58E6O1A2o0UaPif67WFqT79EafEtiJx5hGIC3i9wkW5WYu6U/a3Rm5SwFBggaqY0+6Q+3hGYqB+XVatmyD2O2WmfQmiHcDTYa64OYWcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rn/O87p2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70F52C4CEE1;
	Mon,  4 Nov 2024 04:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730693639;
	bh=9T5BKD42cfy4aGeFmGVZc0bCKlM+O2UhHcLKtXsTiq4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rn/O87p2oRnwhRGLp0m+BRJZWbAHU/x8ZaTYxLgonRns1hUVDT/jH6VJudk8/5ucZ
	 7mYpzEvrl+avmP8ySoM/xA4aTr5H1XiQvtQx32CGeZK5Vm/vAUOcfxnbuColef0Abf
	 1af8AFJPCbcnqU2vnK1eAS160hHVzBRCHfX2U7Y84J6R8VXieypx31HHRaH1U0moK1
	 SHgbfLSOpFHC2Xs4Z3zPohmPhyYGAMnYWvPKGtF5o+GVcRLYb7HwFTff12U8WhWAmK
	 LSVPlYHxENioF5nLm7xb42cP/LRX7smAVfser5+6+HCVetlhhp4+i6n45vdWubmSqT
	 NALhSCcG8JtBw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tengfei Fan <quic_tengfan@quicinc.com>
Cc: kernel@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v2 0/4] arm64: dts: qcom: Add support for the QCS9100 SoC and board
Date: Sun,  3 Nov 2024 22:13:45 -0600
Message-ID: <173069362371.23540.3919794283427263969.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20240911-add_qcs9100_support-v2-0-e43a71ceb017@quicinc.com>
References: <20240911-add_qcs9100_support-v2-0-e43a71ceb017@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 11 Sep 2024 19:10:54 +0800, Tengfei Fan wrote:
> Add QCS9100 SoC ID and board device trees support.
> QCS9100 is a variant of SA8775p, and they are fully compatible with each
> other.
> 
> 

Applied, thanks!

[3/4] dt-bindings: arm: qcom: Document qcs9100-ride and qcs9100-ride Rev3
      commit: e80fd25537541b67da12be30a581671ee81b66ca
[4/4] arm64: dts: qcom: qcs9100: Add support for the QCS9100 Ride and Ride Rev3 boards
      commit: 7dcc1dfaa3d1cd3aafed2beb7086ed34fdb22303

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

