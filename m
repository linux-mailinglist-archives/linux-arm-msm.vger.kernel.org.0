Return-Path: <linux-arm-msm+bounces-71447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42004B3EEBF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 21:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CA8C4859CD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 19:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5DE34AB14;
	Mon,  1 Sep 2025 19:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dp+gKZX4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC8634AB07;
	Mon,  1 Sep 2025 19:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756755984; cv=none; b=MPzvc1OX9xvOjNI7ykYaoplyUt/0h4NlZiWWStTZGWZl3jAsbJz8plW6p4QrRPV7ZbJTqLprdArBBeegtcrqfALvK9DargNIVksH+PFoq3kUD7rzDaexNspcPf1YuZoA7/w/UCYKzZX3gcy4XERR0EjzGrQIzQvZuaqdWxQjoEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756755984; c=relaxed/simple;
	bh=3c/GB+QozKKz7qUOjnw6EVNTpYwv/SUHOlGBgRlQlmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dz5Oeg1u+aPb+i5y6XXECcGzpox/eEdCgq3g3xtlFr6iHDXpiazpNglgeY88OYYl8uCBA8dyw8h4M9mgCZ5mdZRxYcRcytjXT56C7yngi3Q16stzWVbZgdO6qMVBZJgiL/S6BNWjWTw1bkJ1/KtbrAzBetmlbVGY70YLP0NFiKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dp+gKZX4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D23CC4CEF5;
	Mon,  1 Sep 2025 19:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756755983;
	bh=3c/GB+QozKKz7qUOjnw6EVNTpYwv/SUHOlGBgRlQlmg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dp+gKZX4pgqmAkkyIc05H7pdG8kJNL2GFq4XtpXs9YLp8HY0T/zBVYJepOtLLdwnG
	 +9eSQp56XTMpSwrdWBGWHi4Z9aMyQf27RPtc1HrubkopIkqVdoPDBa6Zaj/2mZgIXu
	 3i/576xYvVrZVHqDLFYPQgBLDczbmC6vAATOdCmLUF7uahPwpLEar49ONoJONjItmO
	 QN2Myrx2aRBTNKGo2wkCCpMir/TpLPVILJOPd1j8ng40z5++JVX3By5+kqoGIiXmb6
	 pyVekwUQ0CiedupusgJzzhOmC+BqpkuF3DWc5MMEEA5MEQCWyoc9uGK60W05beXkrX
	 tx+CefnyxLZSA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/9] arm64: dts: qcom: Set up 4-lane DP for sm8[56]50 & x1e boards
Date: Mon,  1 Sep 2025 14:46:04 -0500
Message-ID: <175675595917.1796591.3711447410941152906.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250822-topic-x1e80100-4lanes-v3-0-5363acad9e32@linaro.org>
References: <20250822-topic-x1e80100-4lanes-v3-0-5363acad9e32@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 22 Aug 2025 17:56:48 +0200, Neil Armstrong wrote:
> Now the 4lanes support in the QMP Combo PHY has been merged in [1],
> add the required plumbing in DT.
> 
> [1] https://lore.kernel.org/all/20250807-topic-4ln_dp_respin-v4-0-43272d6eca92@oss.qualcomm.com/
> 
> 

Applied, thanks!

[1/9] arm64: dts: qcom: sm8550: allow mode-switch events to reach the QMP Combo PHY
      commit: 99d741245e7a6d8b533511f96fc110a7d89aee1b
[2/9] arm64: dts: qcom: sm8650: allow mode-switch events to reach the QMP Combo PHY
      commit: 6cc36611ac7925a6a6bc64c625b85f80d36fa1a6
[3/9] arm64: dts: qcom: x1e80100: allow mode-switch events to reach the QMP Combo PHYs
      commit: 7b8849178ecf183880dbdf19d853c92d0877a280
[4/9] arm64: dts: qcom: sm8550: move dp0 data-lanes to SoC dtsi
      commit: bdd235f2df6d5d6cf00cdf474970b1e6d177f2bd
[5/9] arm64: dts: qcom: sm8650: move dp0 data-lanes to SoC dtsi
      commit: 35f549fcf5f1d99997cd865170fd7cb1bb66c1d7
[6/9] arm64: dts: qcom: x1e80100: move dp0/1/2 data-lanes to SoC dtsi
      commit: 458de584248a5630878ed11ea23188f6007036b2
[7/9] arm64: dts: qcom: sm8550: Set up 4-lane DP
      commit: b942e087564b0c1b0bf1c31c1058a59dfd5df841
[8/9] arm64: dts: qcom: sm8650: Set up 4-lane DP
      commit: 630c05a1dd350822e9166857ab120c0a7269b57a
[9/9] arm64: dts: qcom: x1e80100: Set up 4-lane DP
      commit: 2e66c88bb2649133da470d2685646f6536d1e0d5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

