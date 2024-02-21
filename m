Return-Path: <linux-arm-msm+bounces-12059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B2C85DCB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 14:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A27D1C2370C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 13:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B86D7C083;
	Wed, 21 Feb 2024 13:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W0VR8Sr4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFD97BB18;
	Wed, 21 Feb 2024 13:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708523787; cv=none; b=ablVDBPXEiBdseQ2CqVPA+TH8A6rnuxXgbIkPGj1J8iSCx5kQA97MpAdGN/5YZTnCXfuyJS+L3uUkyJ8B2y2XePIYqEaFVlPUbZd801+DiKwzvMzDErareMu0eRU8wKNAz/WcpGA0f29P8CosN4gDOxmo7sM0awWopErVehZ0NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708523787; c=relaxed/simple;
	bh=FurAbRLSrj+WrRKW3LABQYLQlweDJrWbSesqU4LpggA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=evIy2StuUzqZWeTzTsfq92wJyb4WIvNMXhN64yN/7Sg3D/ewKveu1qvVBI/oqPLb5kZIGl1DI9xSUeUymK2Y/MQxzukSUdKfb29ahruqkHFBNNuxeku885MOY8/H7+aQR8cvqrS5nu4QZcU7cnrkm/GUqwYNz38Ski4DixeD5zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W0VR8Sr4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9821BC433F1;
	Wed, 21 Feb 2024 13:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708523787;
	bh=FurAbRLSrj+WrRKW3LABQYLQlweDJrWbSesqU4LpggA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=W0VR8Sr4N6zwNgpzxd03p24GPTGwTwfHy3Jny0P2EMSokCr6tGuM5m/izGBB8XoMD
	 GIfvCZETcBVMHronNhjZzWN8FnppDXmFCD7x1dBPop+IVTbgk1Vg/dzOjYDCrlkPhc
	 xs7JgXQUwOHJaHdt1iZfN3/P0CxuyulBPJYvGT9lquzOfQlM3qBZGYRoKW7Nm6w01w
	 QgM6w0pToNTF1umQjZTHjAm7I9zORwwuP+IHXBBYnkM2omQmwDH7tkOMhqKntu00ap
	 vV0I4vYlJ9owynikwU9O0QzhqnKH3mpCpm1Q7fXkakll7RnoOtwxSf5tmk0L5/lbz8
	 24j0bvpbIF08A==
From: Mark Brown <broonie@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240221-pm4125-typec-v3-0-fdd0ee0465b8@linaro.org>
References: <20240221-pm4125-typec-v3-0-fdd0ee0465b8@linaro.org>
Subject: Re: (subset) [PATCH v3 0/3] arm64: dts: qcom: qrb2210-rb1: enable
 Type-C support
Message-Id: <170852378435.35408.11860058120076755324.b4-ty@kernel.org>
Date: Wed, 21 Feb 2024 13:56:24 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c

On Wed, 21 Feb 2024 01:58:49 +0200, Dmitry Baryshkov wrote:
> Reuse Type-C support implemented for the PMI632 PMIC (found on Qualcomm
> Robotics RB2 platform) and implement Type-C handling for the Qualcomm
> Robotics RB1 platform.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/3] regulator: dt-bindings: qcom,usb-vbus-regulator: add support for PM4125
      commit: b9262cc1b988cdaf9bb5c2a4411d4ad4e7128e8d

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


