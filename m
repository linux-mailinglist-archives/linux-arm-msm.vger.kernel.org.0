Return-Path: <linux-arm-msm+bounces-70504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF715B32D27
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 04:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14DC520798A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 02:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 251CE23BCF7;
	Sun, 24 Aug 2025 02:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BoZv1foM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDE523B605;
	Sun, 24 Aug 2025 02:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756004174; cv=none; b=nfOd2kUIvYuE7UvOCLc3dRM8qKdCCar7O3H7tJBUZQYzQKQ3pwXulyWHhNmGDAeET1s4cw16kfxMTE2MpAMUZ1TI+zzxA+TZCRJMFc9EW1aEVGi/5n9dtEEibxIPxt9+B6GBkN+ah/gVZ4xBNUp6ARdUYlZkj03R9ytp2CkisJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756004174; c=relaxed/simple;
	bh=QCO2Wu8TSGpxJeVpqUlkP3S7BDw1YhnNMLU8THqlzl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CyOClxLAtqI+DmQ3dG3ISoli1HRPGlIDpouyOwuuNBpNFf+T/U//Pa/vtn5ohfYTRShsa5/hgR4Z2yOYMqNwun9b7WOndAHextB6Ib9QlWNzaKBeVQ3/j+ZPanHXgj4XhlZVjlOxfq3pc/xFvPntHT8Hm4GmGHAcwtFNDLmq/j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BoZv1foM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4312DC116D0;
	Sun, 24 Aug 2025 02:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756004173;
	bh=QCO2Wu8TSGpxJeVpqUlkP3S7BDw1YhnNMLU8THqlzl0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BoZv1foMDKIISRWb5oy7hEH76U4zhQJB3PmEj6+V6K8hMpq9KjRwIM7j9TFYGoRhS
	 oAJsz0ECVWZK0rKBkATYcTK7LNcBYVPSvDeCwA3HTqL6nDgYO0+6SJUwZPRkJkYYOF
	 grxQhPxzIyx+9sug9SlFWJGL0rlB3r4bQcPsi7RGnQ/BO7Flx+iWKI6TwRA/ZH7Yjc
	 KHRneDDcrqul03g6M9YYXS9TRb9v+CMFIDEWU8t68x7hHoOQCVAE5PBE8uuW4yUZCW
	 d9QoRdSqtibWrjcy4FPCETbDb2j2l/0vmVX2N3UPekows4e3xkCGFYaO9Whl9iue5S
	 lmOnwn5jif5PQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: sm8550: switch to 4 interrupt cells to add PPI partitions for PMUs
Date: Sat, 23 Aug 2025 21:55:47 -0500
Message-ID: <175600415288.952266.17495329138850489230.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250820-topic-sm8550-upstream-pmu-ppi-4-cells-v1-0-a8915672e996@linaro.org>
References: <20250820-topic-sm8550-upstream-pmu-ppi-4-cells-v1-0-a8915672e996@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 20 Aug 2025 11:49:21 +0200, Neil Armstrong wrote:
> Swich to 4 interrupt cells on the GIC node to allow us passing
> the proper PPI interrupt partitions for the ARM PMUs.
> 
> Based on thr SM8650 work at: [1]
> 
> [1] https://lore.kernel.org/all/20250227-topic-sm8650-pmu-ppi-partition-v3-0-0f6feeefe50f@linaro.org/
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sm8550: switch to interrupt-cells 4 to add PPI partitions
      commit: 40db99f1b6aaf47064aa3891c92eae01da215d6e
[2/2] arm64: dts: qcom: sm8550: add PPI interrupt partitions for the ARM PMUs
      commit: 4f97774ac2ee37d29adfd9732009729e1cbf7bdf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

