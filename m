Return-Path: <linux-arm-msm+bounces-33200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF053991BC8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 03:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDABD1C20E38
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 01:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 518BC13B791;
	Sun,  6 Oct 2024 01:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UGKu6XAW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A31A31;
	Sun,  6 Oct 2024 01:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728179741; cv=none; b=szASVu3MxpiJjukzLtzP5rQeL6VbSNVzd1+9TUEZhQst0Sl4XjZENQwBNFJGCcmL2/ScvxjMuAxxHrU6/K2DW1o1DpBwWGxw2f0KXqMGcDkcC1wz+NdSw8xib3BouyO7sbQ+A4f2ECEC2ZqEaK/H2VTKk7NrBjn5WSQ5YwxFxzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728179741; c=relaxed/simple;
	bh=RWOCv59/jmqYqMEm9L4v3SqGjoHGtg6ZPwB9geWYaR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kkPSeP+E0GseQZXkBgSCTkIRVtOdK2zn98ihNFPtmPvmOrb8NnJZnWC0gAgQk7i4RT1/zq9IQETa9YzKxY45M4YGzMzt+r8k4eUyJKMnM6lrPaRdj8wrNa7W3BvTJmkFTQ3ElJsKQFTL3Z8X4csKN7tu8mU4hV9NmGos/qgup+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UGKu6XAW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7561BC4CEC2;
	Sun,  6 Oct 2024 01:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728179740;
	bh=RWOCv59/jmqYqMEm9L4v3SqGjoHGtg6ZPwB9geWYaR0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UGKu6XAWHUyGDq9rdnKgYGfw4NFbGg+riDbD1agxOqhvW3grSwkIZLdDEGapsUY/j
	 MIWb/hxVp9Hy0KiKSMufyJ0Fs1MFSPfIWZE9xUq1yi2DshBKVIB/kNQtqG7K1xlCck
	 Ax1O/VyAYqmnyy0dOeehIGRf3+yZg/dr9hcAU1hpEOn2mwIMMx7pMeXXVswXaZZeGp
	 A79jqZ53UfFFrJGVIbpoywbol1+AvU5RcNcYWy5qLjERiro8mSRrzTgKFoaKj8aZiA
	 zkVqtA9pBYCu7yZMv1uMFr+A+97nW0NS4KZgISDHJHva7X7d1svpBk2jwVXNWwFkCu
	 wFALGV3t1vTKA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Komal Bajaj <quic_kbajaj@quicinc.com>,
	cros-qcom-dts-watchers@chromium.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org,
	Kalle Valo <kvalo@kernel.org>
Subject: Re: [PATCH 0/4] arm64: dts: qcom: qcs6490-rb3gen2: several small fixes
Date: Sat,  5 Oct 2024 20:55:32 -0500
Message-ID: <172817973328.398361.98827973777969222.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240907-rb3g2-fixes-v1-0-eb9da98e9f80@linaro.org>
References: <20240907-rb3g2-fixes-v1-0-eb9da98e9f80@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 07 Sep 2024 15:51:23 +0300, Dmitry Baryshkov wrote:
> - use modem.mbn instead of modem.mdt
> - make GPU disabled by default
> - specifiy ZAP blobs
> - enable WiFi devices
> 
> 

Applied, thanks!

[1/4] arm64: dts: qcom: qcs6390-rb3gen2: use modem.mbn for modem DSP
      commit: 6317aad0e1525f3e3609d9a0fea762a37799943a
[2/4] arm64: dts: qcom: sc7280: don't enable GPU on unsupported devices
      commit: 94d5ffab9d5ebc9caeab310f9d2eb36a65d7d3a9
[3/4] arm64: dts: qcom: qcm6490-idp: enable WiFi
      commit: afa11181fa506709857ebbdd17b4d76f2587e802
[4/4] arm64: dts: qcom: qcm6490-rb3gen2: enable WiFi
      commit: 0f6c6ae2e9d1cfafe62fed9ca0a07d241d3d8b79

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

