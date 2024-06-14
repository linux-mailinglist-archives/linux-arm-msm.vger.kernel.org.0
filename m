Return-Path: <linux-arm-msm+bounces-22755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4D3909447
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jun 2024 00:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56529285CD2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 22:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ECA3188CAF;
	Fri, 14 Jun 2024 22:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fwq6yMGl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AFC18757A;
	Fri, 14 Jun 2024 22:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718405343; cv=none; b=lDdwcqro/Hr2V4zx2T5HOHlIQ/73ZZIs1tRYXAzab4FuuDXo7CT2PKcwffNZP5eFT95MW5oge3osmwkobqvUCOPYP2hceL25CMwIw1DzQ5QoUwgIxGqoG4jP4cY31NTzHdxT8XKVFkvd82YoW4SWTscHrot27FWhC7aaBDVLJxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718405343; c=relaxed/simple;
	bh=zgANdFNtTnoFRxx6jxcMgFDNQS0T8BrTzUkD5hQwBwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rSmzVs2Dle8pYGJ/CWn9RNNuCfpmxNuwcPY0pxWXxoFOumKv842RKYQA0OHtttZgVtRl4Glt4J9kMH4g1xDmFQU5SpYnLciNNVys3K8/Bx3d/YOoZtRttt9wEYplw+bMt3sTP+0BDfLH1+DWvpPTAxGAT4JtLH2yeOoljqNl0ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fwq6yMGl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08106C4AF48;
	Fri, 14 Jun 2024 22:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718405342;
	bh=zgANdFNtTnoFRxx6jxcMgFDNQS0T8BrTzUkD5hQwBwA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fwq6yMGlsjQOf2FWcpGCPm8Eb2pOnLgLe8TF1oN9khEe95qj+V+qM3we1uigmJUac
	 pMrik8SWFEZHweO7DrxkbE5RVt08wOIatHPg69gsjpEYdd6l0a1U6QKcOuNgxHH1jh
	 2s79Y3JFUzjRvz0I2FnuvkgMTllvn4GRTb7IxjIb2SUaBVsAI+JAZm8HMHGl3hCSxo
	 u+4nebTY+GNrBtJBCumvaTsJ3wtKRifu+hIoMhMbEgxcwiR4Z+tzvZWyZdIwYCdEVG
	 Ldwu/vC7yakBwAtG3mCx0tVi9bR6hwuTx+QpRTF0gQvcwNB/Nf8vutDZAOTHExGZ8b
	 LgBK/N+M7vHoQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Del Regno <angelogioacchino.delregno@somainline.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/16] dt-bindings: clock: qcom: reference qcom-gcc.yaml
Date: Fri, 14 Jun 2024 17:48:51 -0500
Message-ID: <171840533349.102487.11407020568499659061.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240605-dt-bindings-qcom-gcc-v2-0-f947b24f1283@linaro.org>
References: <20240605-dt-bindings-qcom-gcc-v2-0-f947b24f1283@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 05 Jun 2024 10:09:27 +0200, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Rewrite commit msgs - don't mention there is hardware similarity
>   between clock controllers, because that is not certain.
> - Link to v1: https://lore.kernel.org/r/20240531-dt-bindings-qcom-gcc-v1-0-b37d49fe1421@linaro.org
> 
> Description:
> ============
> Unify Qualcomm clock controllers by referencing qcom,gcc.yaml where
> applicable.  Several existing bindings for these display/GPU/CAM clock
> controllers already do it.
> 
> [...]

Applied, thanks!

[01/16] dt-bindings: clock: qcom,sm8450-videocc: reference qcom,gcc.yaml
        commit: acc41014661cf424c262e8d532e461376bacbd90
[02/16] dt-bindings: clock: qcom,videocc: reference qcom,gcc.yaml
        commit: 3b39fb00be1c5bd0c0c8855444a3b17d04bed667
[03/16] dt-bindings: clock: qcom,dispcc-sc8280xp: reference qcom,gcc.yaml
        commit: cc9d138fffbaebe7c3f37f9e03b2d1840efa2af6
[04/16] dt-bindings: clock: qcom,dispcc-sm6350: reference qcom,gcc.yaml
        commit: f168430195ff37d1b075d70db95c9bf430ab208b
[05/16] dt-bindings: clock: qcom,dispcc-sm8x50: reference qcom,gcc.yaml
        commit: 5576b6f8e91fa4b2ff6c48b2810cb8fbe9242142
[06/16] dt-bindings: clock: qcom,gpucc-sdm660: reference qcom,gcc.yaml
        commit: b20b9a762695835016c2ccc26cf1447dca354c10
[07/16] dt-bindings: clock: qcom,gpucc: reference qcom,gcc.yaml
        commit: f68872fe10193bb1b033aec0edaadcaab9de2935
[08/16] dt-bindings: clock: qcom,msm8998-gpucc: reference qcom,gcc.yaml
        commit: fa02399d69377a38ce49b7e77ece720c114265bf
[09/16] dt-bindings: clock: qcom,qcm2290-dispcc: reference qcom,gcc.yaml
        commit: a8197afc44a6542631ec999f4b332643c91c79b3
[10/16] dt-bindings: clock: qcom,sc7180-dispcc: reference qcom,gcc.yaml
        commit: e68a21bd186b2f15bb1106b6fd9ad697b3307ca9
[11/16] dt-bindings: clock: qcom,sc7280-dispcc: reference qcom,gcc.yaml
        commit: c9ae35ace8c420ebcc7bf868a4f0feca142cb5cb
[12/16] dt-bindings: clock: qcom,sdm845-dispcc: reference qcom,gcc.yaml
        commit: 4ef61bcf1aa9cdb3d4bb588ed591bbd4e96c3eaf
[13/16] dt-bindings: clock: qcom,sm6115-dispcc: reference qcom,gcc.yaml
        commit: 7b69a903fc73188c50577565093a5b3680448c57
[14/16] dt-bindings: clock: qcom,sm8450-dispcc: reference qcom,gcc.yaml
        commit: 8acff345c3e6b0c258177ba1db18d07ebd83183c
[15/16] dt-bindings: clock: qcom,sm8550-dispcc: reference qcom,gcc.yaml
        commit: 4da364c759dc66a23a4ea69cb85e038c847b9f0e
[16/16] dt-bindings: clock: qcom,sm8450-gpucc: reference qcom,gcc.yaml
        commit: 7e828d77d202f59d4f9b59c1930b82433cce1356

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

