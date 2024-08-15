Return-Path: <linux-arm-msm+bounces-28713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1D0953D03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 23:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44E8F1C2114B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 21:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726401553AB;
	Thu, 15 Aug 2024 21:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vQEGlZvn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF091547C4;
	Thu, 15 Aug 2024 21:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723758995; cv=none; b=hqhLvx5I6CNv4+EnITpJKeerKomSWM2r8662LE8Evr+15irVDo67b5fuHK7fltaPQP7HH69qf+fcD1i8k1f0fuQgzjetcca/9QPb9SJmcpO52N7kcVv+hxCa66RAq3pywY76XV/bSSAfi1+6Hk1kM9a78Th02WkUjlibsG9NI2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723758995; c=relaxed/simple;
	bh=Mf8SuVPcQMJxDRlhTh8nDftjjh3X6X2ZNGppNHT09T0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tdZnGzwE365HrPG/N3jNqq49foresd0XHLZlcjN+CDpKhWvteUH3Znxf82j4YvoizYphLGiv6i61ncI2hG9WxgFsjVSD6adTJwJzOPqYLfHmZ5IXpKuYmMo7mjirarkk24P+cxUIb1rJoptPSXE7Rl38DMyfO0zlLSOp0NYCZJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vQEGlZvn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1805C4AF15;
	Thu, 15 Aug 2024 21:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723758994;
	bh=Mf8SuVPcQMJxDRlhTh8nDftjjh3X6X2ZNGppNHT09T0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vQEGlZvnnwW8erXPizbf0xFfhzni9Q37kcH9HAcMT4oE32EYPCtABnC1LstVOWiF1
	 7bzIE3YtME1HyL5D8Vp3s6b3wJv/ge/K0ii4wmfguhABvtCcuv/o2m6Q24SOv/4Ts4
	 F63II0U0HI+IFn0m+LDMgLgUTSBA+soegrpPErVGcm2Dp+mqUh4IsjJiRReVOfzLVi
	 yJ4uj1CZoedtlp+XOlUmfw21fQVYbX2oMx9CmX5aRS9+hJdQ0OAnV127mpZCMfy+uU
	 rILFyG9mSogoGwneu3eqIGSc3wXKM91EZENDoEnRkw77ItoVlK68Rn70ZtFl0izzHi
	 q2aq19rswyGYQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marc Gonzalez <mgonzalez@freebox.fr>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnaud Vrac <avrac@freebox.fr>,
	Pierre-Hugues Husson <phhusson@freebox.fr>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH 0/3] Add LPASS SMMU to msm8998 DTSI
Date: Thu, 15 Aug 2024 16:56:28 -0500
Message-ID: <172375898304.1019907.18015161106871629352.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240814-lpass-v1-0-a5bb8f9dfa8b@freebox.fr>
References: <20240814-lpass-v1-0-a5bb8f9dfa8b@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 14 Aug 2024 18:20:21 +0200, Marc Gonzalez wrote:
> A few definitions and glue code to support the DT node
> describing the LPASS SMMU in qcom msm8998 SoC.
> 
> Thanks to Angelo.
> 

Applied, thanks!

[1/3] dt-bindings: clock: gcc-msm8998: Add Q6 and LPASS clocks definitions
      commit: 015dff12dfdeb8d94115ec829bc2e4b711075935
[2/3] clk: qcom: gcc-msm8998: Add Q6 BIMC and LPASS core, ADSP SMMU clocks
      commit: 7554d532e03b4f3a9e294077d38fb2403f2b5f7d
[3/3] arm64: dts: qcom: msm8998: Add disabled support for LPASS iommu for Q6
      commit: 1a9544b832256817a387f952eb0badcb6416df7f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

