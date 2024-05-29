Return-Path: <linux-arm-msm+bounces-20874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA528D2A7C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 04:05:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC83128650B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 02:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE9716727E;
	Wed, 29 May 2024 02:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R1LZq4qz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE49E167276;
	Wed, 29 May 2024 02:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716948149; cv=none; b=I59l5dNIyJSAr6DcedcZEjjo+SO7vMhsk4RFQwLLBWIpHSlotNWpu7bQ7lLOGyigTsOMgtEI1uJo5tdzlvzix5zIg4Tt9GiTggVahraL1zfg+4VCHMJJ+J3EAYbZfXA+f0u8QnMMLKgFNhrqCzOxgMtMApw6fgYP+K3b9kczp8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716948149; c=relaxed/simple;
	bh=8ucwInm0dsIex/h3GxvxGJBPV3fcyRj3bBGBPnBQpos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fWogETEdXRJ3fJVM4n1q/6RIbSx1Q3YQArV3P+4lQwdiSkmnbnguiOEv0PpnACsaD515tePJ1VCmiI4c4SsTBogER22ic6jtwC1OSOcwr66h1zIbWQOncPIJ3Xh5+KYMrW6SKPsz6730oPk81w0/fJ0L9XXNXNhjhB/XorMO3FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R1LZq4qz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C654C4AF07;
	Wed, 29 May 2024 02:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716948149;
	bh=8ucwInm0dsIex/h3GxvxGJBPV3fcyRj3bBGBPnBQpos=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R1LZq4qzB+Jzl/YR3dviHz8CdlpF/ybE5hf8u9BvQRxXrNoEXXjG90XhHS2YFrsSV
	 ax6iz2j44zYoKEZLUOa/GaAUdw2FynHabcw0UB8VQz8oR9INVr2m0SJ2iTuPb1nmIo
	 KEf7KQZkIIWFDGZkSlTeypjizKvp1u3TxhcbuNv+wwXsQe9JIppRoN19eRq3PLzqw+
	 GDdo85CCRd7vYmq+ZBSqpg64gHR6SPaZprdcj9xJxYTeaEorBApyZWM9NNSgbQ8Vj8
	 qDyzXavvBKZiCxmi8gR024O97Zr0yucdiVDcNKSpebcVeOLaMt5rvF0iO21eNibAn9
	 UtQy/tBso8FlQ==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-kernel@vger.kernel.org,
	Raymond Hackley <raymondhackley@protonmail.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Nikita Travkin <nikita@trvn.ru>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: msm8916-samsung-fortuna: Add accelerometer/magnetometer
Date: Tue, 28 May 2024 21:02:02 -0500
Message-ID: <171694812068.574781.18067842956117993276.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240406111348.14358-1-raymondhackley@protonmail.com>
References: <20240406111348.14358-1-raymondhackley@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 06 Apr 2024 11:14:12 +0000, Raymond Hackley wrote:
> Some Grand Prime use a Bosch BMC150 accelerometer/magnetometer combo.
> The chip provides two separate I2C devices for the accelerometer
> and magnetometer that are already supported by the bmc150-accel
> and bmc150-magn driver.
> Some Grand Prime use a ST LSM303C accelerometer/magnetometer combo.
> Core Prime LTE uses ST LIS2HH12 accelerometer.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: msm8916-samsung-fortuna: Add BMC150 accelerometer/magnetometer
      commit: a204bf3fb7bd436787f715dddca2cb7c1c86c12f
[2/3] arm64: dts: qcom: msm8916-samsung-fortuna: Add LSM303C accelerometer/magnetometer
      commit: 7f433e1e3c224b90d536109d7a37e116b98086fb
[3/3] arm64: dts: qcom: msm8916-samsung-rossa: Add LIS2HH12 accelerometer
      commit: e4558fcfbeb01c8bdb1163bc3c4f7c6227a22843

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

