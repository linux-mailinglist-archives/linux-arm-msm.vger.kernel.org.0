Return-Path: <linux-arm-msm+bounces-80182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FDEC2EE5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 02:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAFE818916BB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 01:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03741246781;
	Tue,  4 Nov 2025 01:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iw5gBglO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6786245019;
	Tue,  4 Nov 2025 01:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762221291; cv=none; b=dXKpIAPthXGnTJ+2NJZ5AlgYuhDFhXwLsTMixd3pWnkW84lrm3zCjXE6bkcLU+tnDAMPQt5FZlipP6DTCCOy8IsUhy+lj96e92N4meqmyX48k+vv8x0lKmeT+vHgup9qAIElZ5PfPht9d7nEfTotVcSYuzJlZ/yk0JbMypdcJYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762221291; c=relaxed/simple;
	bh=gKUL+8Ptu4jH1CeENsJt01k4NTTpT6BEfmtzAkitn/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WMAsxTjO8TRixdaxQbfCCiihRPqFoz7OKI37B1a9AegiV1CK2IBpZw2GM30t/s+oFhA2BnQGbxqcInZ1IorERb+HOKI4EX7ZXpZJH94QCavcl+NR+7DO/CDgY6KOI9c/XH4SeLkS+hW4dI/euILbULRwUcrmhI8yeZg8Qmxecbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iw5gBglO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C26C4CEFD;
	Tue,  4 Nov 2025 01:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762221291;
	bh=gKUL+8Ptu4jH1CeENsJt01k4NTTpT6BEfmtzAkitn/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Iw5gBglOBPxTFpiqMwUPSIono3rugFs+B7D+gMvBjMh7BoSe46Cc4/mTlLSBy9KxP
	 Aj+QGrJ1mNXSWNwsbgomDfJPBf/dhN9cKq9NSPM5LH+okuGoV3Tpg3cc5lyZ2GlC+l
	 4y5kJGH8fNG5CvLC0EF0sgAUk2R+ZKSC7tERZ+d0/b3bzi376K9WvURm8vgmDGnSRC
	 25gmNyfEn5Etjwc1EnnAhF/RJ4iyOLwta+9/r1ykmAtiQtVpDDGOCdGjgeROXALHLq
	 AUXlZfLQYFRVonhuXBJWmC0DF8mX1U3pu/l+VoIedFbnaV8mAN26QA1TYKZQ1IENhc
	 gSu8pLnSM2fPg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	jingyi.wang@oss.qualcomm.com,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com,
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: (subset) [PATCH v2 0/6] Add support for Clock controllers for Kaanapali
Date: Mon,  3 Nov 2025 19:58:17 -0600
Message-ID: <176222149552.1132260.12639291385565534252.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
References: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 30 Oct 2025 16:39:03 +0530, Taniya Das wrote:
> Add support for Global clock controller(GCC), TCSR and the RPMH clock
> controller for the Qualcomm Kaanapali SoC.
> 
> Kaanapali(Snapdragon SoC from Qualcomm):
> https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5
> 
> Changes in v2:
>   - Update the commit message for all dt-bindings to incorporate
>     "SoC/platform" inplace of drivers [Krzysztof]
>   - Add RB tag from [Krzysztof] for dt-bindings
>   - Split the TCSRCC to a new driver instead of reusing the SM8750
>     driver with offset updates [Dmitry]
>   - Update the new RPMH clocks to use 'clkN' convention [Dmitry]
>   - Add RB tag from [Dmitry] for GCC
>   - This series does not have any strict PLL code dependencies [Bjorn], thus
>     drop them and will be added in the Multimedia clock controller
>     series. Drop the following patches.
> 	- Update the PLL support for cal_l
> 	- Add support for controlling Pongo EKO_T PLL
> 	- Add support for controlling Rivian PLL
>   - Link to v1: https://lore.kernel.org/lkml/20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for Kaanapali
      commit: 15c320b286a128131193ad270d7aac23bba4c219
[2/6] dt-bindings: clock: qcom: Document the Kaanapali TCSR Clock Controller
      commit: 395e0e794f9a485d9a5d6af062f096b97beecc11
[3/6] dt-bindings: clock: qcom: Add Kaanapali Global clock controller
      commit: 342d2a607450f256105781d29aa6300921c6152e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

