Return-Path: <linux-arm-msm+bounces-5441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB958190D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 20:34:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F7DD1F25F14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 19:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9234E39864;
	Tue, 19 Dec 2023 19:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l72twO2L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660B13B781;
	Tue, 19 Dec 2023 19:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EFA9C433CB;
	Tue, 19 Dec 2023 19:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703014425;
	bh=v7V9pnmwGKIeBdSx5vJJ2RYb+0yymstwC2WHsDGnhLs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l72twO2LSq9GADFULtWK46aqs62cWxKRviyDnWDlDQP8nvkTzluBPwUzSv2zk9B+0
	 HWDdDUfYxyzZA3rqbgNhRwreeKOdU9xemWi19XP9ME2RkCO4sZ7HYo7rS/2vrkALE+
	 8XoIj6YQp/7S6txg//F0wIU8952zva3g08BgAXH8r2a49LT8MkabNaW/sftNGKAfVC
	 MEoI3k5WdQcyx/5dOOGGGIACtYzH8Elwrx2xV4Bt1xZdegAdsM7eEAT3Ud513QYfZn
	 1PuzAGV6LDqhuUTMG8in8OQOvm4lle9GPC8F66RcnXUEjaJuxE4OrrZGFpBsIAmh02
	 y98XbmByVqs3w==
From: Bjorn Andersson <andersson@kernel.org>
To: Georgi Djakov <djakov@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 00/12] 8550 fixups
Date: Tue, 19 Dec 2023 13:33:31 -0600
Message-ID: <170301441257.365364.3178569159241086487.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231218-topic-8550_fixes-v1-0-ce1272d77540@linaro.org>
References: <20231218-topic-8550_fixes-v1-0-ce1272d77540@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 18 Dec 2023 17:02:01 +0100, Konrad Dybcio wrote:
> I found a couple of sneaky bugs concerning 8550, ranging from icc and clk,
> to some usual omissions in the dts. This series attempts to amend them to
> mostly prevent UB due to misconfiguration.
> 
> Patches 1-2 for icc, rest for qcom
> 
> 
> [...]

Applied, thanks!

[11/12] arm64: dts: qcom: sm8550: Separate out X3 idle state
        commit: 28b735232d5e16a34f98dbac1e7b5401c1c16d89
[12/12] arm64: dts: qcom: sm8550: Update idle state time requirements
        commit: ad6556fb45d4ab91ad786a2025cbe2b0f2e6cf77

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

