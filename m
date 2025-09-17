Return-Path: <linux-arm-msm+bounces-73989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2C1B81A51
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 21:32:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4E70520BF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 19:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0EB12FF666;
	Wed, 17 Sep 2025 19:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HM6yxVA2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A611B2FC006;
	Wed, 17 Sep 2025 19:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758137546; cv=none; b=c7A+uhWa+UP31+ARmo/JROne8CbSOb4dkHA2wfb78Fj7RZ6VPXHApoE6Z5U0pFmBKHuoJsrpGD9GDLkOkR6jQ2KNlW9qJahsymrI0c3pvNBuVz2aqvzX2Z7cCdYlty2pL3lR6UCbPc7qvI4VaA8DNP5jyJTltRbFl/ZR7XdFOAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758137546; c=relaxed/simple;
	bh=O+NCfXNK7eFUSNWAZ6pnwhRHuvHQKpY0A8plG7DVe4U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X38o3U4UWWpGKZW+w64B+LVW53t8zfebKVt9/cL+YLs66ptRZCW/43oe/hWQSBnYM6/k5PFKL7SF3LCQOGvkfuw1L3XhVyWWZN5bF8hKlU4ZprEkJBad80+Ct7AP5fG7WABzSZUwEcwOvZPye19Tk4W4S5cE4MfnBSHu4trsHKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HM6yxVA2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DDC1C4CEF7;
	Wed, 17 Sep 2025 19:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758137546;
	bh=O+NCfXNK7eFUSNWAZ6pnwhRHuvHQKpY0A8plG7DVe4U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HM6yxVA2w+UJdmdZtcXNcyaU2nxe6ZorDLBNQ6KDt1WgE1VIVqBhUr87GnazbD2Ec
	 a0aDUmon3CVKVjGaqATYapD3KBMphrvj5/XoDTDaFI7vBL4qvZ/TzgmfDGZBTFtJxU
	 l6D/D8heMW5nFfFHvT5ioNxC3VfkMwA0sULK2usGtFzTvO2dx8X7xx31iDVvWDSGt8
	 i8k+PHEcFJm2UD93Lf8zAG3jVJUQgFK3kAFHsEdx7IlTuOqu/fmQNqzFov1piaa5ZF
	 TJ2LFwQKxkBmMbYpVOK9xFOMyyouFRCoBecglNTKCEqfB0JfUYpyHndaMoEeyINmK6
	 wYLC13gu6MKYA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [RESEND PATCH v3] arm64: dts: qcom: sm8750-mtp: Add WiFi and Bluetooth
Date: Wed, 17 Sep 2025 14:32:20 -0500
Message-ID: <175813753509.68230.13877434690290192148.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250902140018.247209-2-krzysztof.kozlowski@linaro.org>
References: <20250902140018.247209-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 02 Sep 2025 16:00:19 +0200, Krzysztof Kozlowski wrote:
> MTP8750 rev 2.0 (power grid v8) boards come as two different variants
> with different WiFi chips: WCN7850 and WCN786x.  WCN7850 is already
> supported by the kernel, but WCN786x is not.  Both of the board variants
> are considered newest revisions and the difference is only in MCN
> numbers and internal codenames.
> 
> Add WCN7850 WiFi and Bluetooth to the MTP8750, stating that this DTS
> represents the WCN7850 variant.  The S4D and S5F regulators should
> operate at 0.85 V, thus adjust lower constraint and regulator name.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8750-mtp: Add WiFi and Bluetooth
      commit: 141714e163bbb7620d538af48fce4024a4f239e1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

