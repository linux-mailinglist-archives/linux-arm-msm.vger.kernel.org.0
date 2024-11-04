Return-Path: <linux-arm-msm+bounces-36866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DA19BABB9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 05:14:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF9F01F214A5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 04:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E45D18C351;
	Mon,  4 Nov 2024 04:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kQ9C1ARX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320C418C33C;
	Mon,  4 Nov 2024 04:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730693634; cv=none; b=UTvQ9RjJgq8T9K7exJYUhKswEVgBTMZfDydEHqNCWTyIGtS6e6pTtQ5Vq9faC0DTaxkCGWK/A66hpiDNFd32aO4wNln7pR6DQQ3kJ/bhjthGEkL/ISNuTKaYaF+GKIpWv4sd3v2zsxJ6nhPw36vEySFeH2zoAaEFVQuk2zamZIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730693634; c=relaxed/simple;
	bh=hR8qcoNemZdW0Y+Uob5zc5biWMB9U4alJ6LDVcwou0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U8JTXw4dFv/JImcPGOqg17qbZIhum+ckiHKWaWf8tEYflsufZtu3D+xdxL53vMRPRJqBU+8U+TLKPuyN/XNzJkxWZnpovb1LQtyflCqUwpdbJIbXvrTzuom1dYxLQs9AAD+ZX5sS95wkf82q+XKGUjwxAt2OpUCQKcUBaUoJ5ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kQ9C1ARX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E730DC4CECE;
	Mon,  4 Nov 2024 04:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730693633;
	bh=hR8qcoNemZdW0Y+Uob5zc5biWMB9U4alJ6LDVcwou0I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kQ9C1ARXTxYrOIRoenH8S4aaAuexYlL9NmxeLzYzMLVqGPXYfY69itYdPk7jADVZR
	 ezMYpC9F3djwYc3eanBHa9how7+JdgeseBH9ox1dOb408b5mZV9Ct83xXia8w85bBP
	 FdTnoFO5cxVo8Qmz5/AFyPePiJFAdhxgYnL6JgCrbed9wB1bi1aNVJ0wZGBSZXjSUK
	 gBLu3b6zD5KODgQ643/1c/+ZjSt1qCblOY+k/h9mBIuS3/d0mydiksSvdnb8Iz7KZC
	 Y4RS2i6vkD1+m0SrHGVrUx8pk9oL5SQeF7/trJqYIbwdZwrTZSOMKDNCMUkxtBIQLs
	 +A/6wI37sf4DA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalle Valo <kvalo@kernel.org>
Subject: Re: [PATCH v2 0/5] arm64: dts: qcom: improve Lenovo Miix 630 support
Date: Sun,  3 Nov 2024 22:13:40 -0600
Message-ID: <173069362368.23540.2393619921098776177.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20240723-miix630-support-v2-0-7d98f6047a17@linaro.org>
References: <20240723-miix630-support-v2-0-7d98f6047a17@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 23 Jul 2024 14:28:27 +0300, Dmitry Baryshkov wrote:
> Enable some low-hanging fruits growing on the Lenovo Miix 630 laptop,
> but not being enabled for some reason.
> 
> 

Applied, thanks!

[1/5] arm64: dts: qcom: msm8998-lenovo-miix-630: enable touchscreen
      commit: 50b2a9c39661e57d9bbdaedd10890279d3cc17d1
[2/5] arm64: dts: qcom: msm8998-lenovo-miix-630: enable aDSP and SLPI
      commit: 08cc19ba96b54ee741d67698bbeccd5ad1732043
[3/5] arm64: dts: qcom: msm8998-lenovo-miix-630: enable VolumeUp button
      commit: 31a31cd74de6a2408d907630a7294cadc7e32049
[4/5] arm64: dts: qcom: msm8998-clamshell: enable resin/VolDown
      commit: ac6adde8d540c5db12f903c9cb439921df4f4966
[5/5] arm64: dts: qcom: msm8998-lenovo-miix-630: add WiFi calibration variant
      commit: 1a24c290a593f65954df3c7d9ea1d5410f2f1544

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

