Return-Path: <linux-arm-msm+bounces-70498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E17FB32D1C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 04:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 670262077DF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 02:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D1922069F;
	Sun, 24 Aug 2025 02:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XHTPpf37"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19CF1E7660;
	Sun, 24 Aug 2025 02:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756004169; cv=none; b=XEaAp2anZdbKTBjf0TOtwu5iSI5ZoujtZ1b8i0BSLJVeB/uYJRCeRKtoWqIEcz8R0U8uy4eaZ+w51XC01xiOe1g7ev5PoMnaGQ3eiqV9JlmuxCyDuf8C1lEcBHoaCa7QJRm0im57sjp1d0iYZlofFunAL/fYFsLMVvNXaWD224s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756004169; c=relaxed/simple;
	bh=Kj4RecPbVULzIs4n2OMwmK0ukUhUMZfgftbwFGWQ5x0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FVcfhE0aSvAL6EUwDdW4wVwysGJ0Gni3CmyiGgNzrFgREWH1rFNVBuKPSdzt3xUpfr67WwnbScSjNLk8Gs1bsFcQ4kHwp29t1E7E5b6X9rdQFoCB9s9S5x9Ow7TTInMyBoFR2Ya6oBpikU8QYr/t3qVuYSuLc6AIRLlhUUIyJV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XHTPpf37; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0523AC113D0;
	Sun, 24 Aug 2025 02:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756004168;
	bh=Kj4RecPbVULzIs4n2OMwmK0ukUhUMZfgftbwFGWQ5x0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XHTPpf37qTFIgrCjOqRk2gJupRGq3G/jz1YSP4a4f9xjJ/LxyC8NwqYhikII3rTdA
	 0irgfsnRgejsqaR5fpc7Pq2lDlPgEHxXy2M1e0PE0K4Z04osTRX2RKTOdyp3ZN9A7W
	 nbJG80EV4phsZWYhI4N9pvCcoqhTTW+jjpnU+whjWkMBuztB0/xbI7J+XX/RXY/NGS
	 Y5nrMNTISCQU4nEK+rcn+bPOXB5uB11s237peqXbwwsqMSNSXkDDZZ+YZy43On3rVR
	 s124WEyKRyETDZoAK3vJqA3R8MgnqjnCHHM9RkPENYFM7McSOR7ecBmOCv9chg0dLs
	 Jeljpj/eJUGEQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: Correct the min/max voltages for vreg_l6n_3p3
Date: Sat, 23 Aug 2025 21:55:41 -0500
Message-ID: <175600415275.952266.18118608841830586731.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620-sm8550-correct-vreg_l6n_3p3-vol-v2-1-b397f3e91d7b@oss.qualcomm.com>
References: <20250620-sm8550-correct-vreg_l6n_3p3-vol-v2-1-b397f3e91d7b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 20 Jun 2025 20:59:57 +0530, Kamal Wadhwa wrote:
> Voltage regulator 'vreg_l6n_3p3' max-microvolt prop is currently
> configured at 3304000uV in different sm8550 board files. However this
> is not a valid voltage value for 'pmic5_pldo502ln' type voltage
> regulators.
> 
> Check below the max value(3200mV) in the regulator summary for min/max
> used as 2800mV/3304mV in DT:-
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8550: Correct the min/max voltages for vreg_l6n_3p3
      commit: 40f7b64fac9d7d37b8db750909321fa2b0b7eda3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

