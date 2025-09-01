Return-Path: <linux-arm-msm+bounces-71446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E80EBB3EEB9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 21:48:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C2B17A39B1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 19:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7A534A335;
	Mon,  1 Sep 2025 19:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QxSf4sLO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350062580CA;
	Mon,  1 Sep 2025 19:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756755983; cv=none; b=TaaH2jkaq2wj3Bor9FUH3WzUjgxWXR4rK2RILyr6qnksHLYW2CKgYsYG4WKu/8QsYkKVlGIxoHy5TIYsB/RBuRj3Ko/N+v8r3ePJxpW/sOw2YBLU5A8cjL44hd4gqok00DsF1fyEC7lz0gBjColgBbp4rRjuKB17yv1TkSDw5LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756755983; c=relaxed/simple;
	bh=HhvOQysCGO4qIj31A9iudcRkMaj6vVD/qLcp087j1YI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dm6hVBlzjOOAC8DYBb2zH7aFO+jTVkLiwjXFFGCigHQm9/mynM5qBysLFOxH3Sr9aFfiW2DQbuc+B4ZS8s0aW4flnxkw+BVTlp7NdLOvl4N6iDH4nlPGQnZSi4zFtoNR5Vs6+EXohZzT2BcWcaI73PxP1LZ/cPrWysQCKG8fDBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QxSf4sLO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB171C4CEF8;
	Mon,  1 Sep 2025 19:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756755982;
	bh=HhvOQysCGO4qIj31A9iudcRkMaj6vVD/qLcp087j1YI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QxSf4sLO5/kdbxcEeaW1l3k6qzuO9FYSVGvdKhhL04b7dzV6TnQH003LAp2eNR9MM
	 2NBo+r1+mUcK9ta4VflHinXW8Xnr37BePfwLvriqPOeBlS74D8S1PSubM+TYPDwhLJ
	 DY+blOOT3Ze5Yc8Nlm0pnpbzeu04e4DDjordOwSWoO83oZYmst8KKaTET6BT5sGd0A
	 oBply86rXAJhLVKTrAYoW5XD/ybbEVDyb5MHi0dVaNW9HUC3wlrm7Qqswx3fj96Ska
	 wHGRoNyAhOgf8ceVX6n7PdyRmLzfeAXtnvDoxZ/sNrIeVJ00cHLfnsIZjfzhtOFHC3
	 IW1peqbzTl2TQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Taniya Das <quic_tdas@quicinc.com>
Subject: Re: [PATCH v2 0/6] arm64: dts: qcom: Add multiple power domains in videocc/gpucc
Date: Mon,  1 Sep 2025 14:46:03 -0500
Message-ID: <175675595908.1796591.8603544075341274375.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250822-topic-sm8x50-upstream-pll-multi-pd-voting-dt-v2-0-28f35728a146@linaro.org>
References: <20250822-topic-sm8x50-upstream-pll-multi-pd-voting-dt-v2-0-28f35728a146@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 22 Aug 2025 11:26:32 +0200, Neil Armstrong wrote:
> This is a continuation of [1] ("clk: qcom: Add support to attach multiple power domains in cc probe"),
> where all the clock changes were merged and the DT changes are lying
> on the lists for allmost 4 months now.
> 
> I kindly asked for those patches to be re-send separately [2], but was
> ignored, and the lack of those causes a bunch of DT check errors, hopefully they can
> be picked for the next revision.
> 
> [...]

Applied, thanks!

[1/6] arm64: dts: qcom: sm8450: Additionally manage MXC power domain in videocc
      commit: 235399565582d092ff8fb5757eee63b1367ea6b9
[2/6] arm64: dts: qcom: sm8550: Additionally manage MXC power domain in videocc
      commit: d49e683574537d416aa0fb022d800430e7c045b6
[3/6] arm64: dts: qcom: sm8650: Additionally manage MXC power domain in videocc
      commit: 086079090571910ead0510e756cea14ff3759d4e
[4/6] arm64: dts: qcom: sm8450: Additionally manage MXC power domain in camcc
      commit: ad43a5317a8bda7fd9d6ad5f0b6248ba11900b44
[5/6] arm64: dts: qcom: sm8550: Additionally manage MXC power domain in camcc
      commit: 169ccd7cec9b702778ffb58a436f757db23154f2
[6/6] arm64: dts: qcom: sm8650: Additionally manage MXC power domain in camcc
      commit: 673fa9a42606a755068e7ab6ab92cf61db243149

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

