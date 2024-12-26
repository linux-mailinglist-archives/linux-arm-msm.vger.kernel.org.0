Return-Path: <linux-arm-msm+bounces-43446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CC79FCECC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 23:43:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43B393A0360
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 22:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BED21DDC16;
	Thu, 26 Dec 2024 22:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AzbwUng3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725921DDC09;
	Thu, 26 Dec 2024 22:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735252766; cv=none; b=St+cwBhX6qRvdPUlgx7jHr0WaIVEl39cfmO0qL+gin8WHXpjDLD/SNuvu+hbpOTBWlJvIDXMrc0da9fxyvAQ1oTEq/t5CciylANLVyUOrRq5p4zEzgCJCBMEC5j9zwYWUjm+cS4vl4ahn3znbnVJYPymlaejlCcy+UdZGJUC/yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735252766; c=relaxed/simple;
	bh=bWTc/qHSaeN6BmcxiwHQi3b0d0Ip7+YjIhyIJJmHKKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nojbmze54JslU6Ys7URAG3oQ7uet8LBy/7prTDYQIKoN/QGiqpR3v3LA9tUxxknSDR6OLiRs79T/0w6k86CkOy1aQjzbkyfuZEi1GDuv2Mtl6zWToOM5Qs4ypZOuP7TdI9orn3xfcn7Y3biwWhAeR23XdHwBZvLw20IhBDFA7Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AzbwUng3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C95EC4CEDC;
	Thu, 26 Dec 2024 22:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735252766;
	bh=bWTc/qHSaeN6BmcxiwHQi3b0d0Ip7+YjIhyIJJmHKKM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AzbwUng3YB3+DL1IApXJ/O3YaZeU/oBpEj4Xb/tlBC5KMt8psOOfSb3QoGlepwC9q
	 zq4z27474GHBK6BPW4WxlO08a10qyZzDckZaKTVbFc+p86MNgDYPEeipt2je1UCofl
	 +IpOYGR8OggZRyOvjxvBe8/FhK55JgxaiqjLpaZQvHqGh9RoVOc7aV8xoII05gsD0G
	 GNvoBLi+RPdwnIIv2BpreG+otov647L4Nn/18edzY5Ju/93VzY7V+GiNEdhtZcPGyl
	 06tx35Cr9PYver4EXz6sTgGKl9nISvLtjU/uWdVIVh/aqhbhBZkh30Bcteg88GNTg6
	 B7Bwk9u2SbCPw==
From: Bjorn Andersson <andersson@kernel.org>
To: quic_fenglinw@quicinc.com,
	quic_tingweiz@quicinc.com,
	kernel@quicinc.com,
	quic_eberman@quicinc.com,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingguo Cheng <quic_tingguoc@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/3] Add SPMI bus, PMIC for qcs615 and fix reboot-modes etc.
Date: Thu, 26 Dec 2024 16:38:50 -0600
Message-ID: <173525273249.1449028.3405611658462628677.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241202-adds-spmi-pmic-peripherals-for-qcs615-v6-0-bdd306b4940d@quicinc.com>
References: <20241202-adds-spmi-pmic-peripherals-for-qcs615-v6-0-bdd306b4940d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 02 Dec 2024 17:37:21 +0800, Tingguo Cheng wrote:
> This patch series depends on the patch series:
> - https://lore.kernel.org/all/20241022-add_initial_support_for_qcs615-v4-0-0a551c6dd342@quicinc.com/
> 
> Board files changed for reboot-modes moving(all dtb files keep the same):
> 1.sm8150-mtp.dts
> 2.sm8150-sony-xperia-kumano.dtsi
> 3.qru1000-idp.dts
> 4.pm8150.dtsi (remove)
> 5.sm8150-microsoft-surface-duo.dts
> 6.sm8250-xiaomi-pipa.dts
> 7.sm8250-hdk.dts
> 8.sm8250-sony-xperia-edo.dtsi
> 9.qrb5165-rb5.dts
> 10.sm8250-mtp.dts
> 11.sm8250-xiaomi-elish-common.dtsi
> 12.sm8150-hdk.dts
> 13.qdu1000-idp.dts
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: qcs615: Adds SPMI support
      commit: 27554e2bef4d70841c4d20d96c673de51edb353c
[2/3] arm64: dts: qcom: move pon reboot-modes from pm8150.dtsi to board files
      commit: 87ca44ab7f1c02cf56f04f808c3d382acfec0ec0
[3/3] arm64: dts: qcom: qcs615-ride: Enable PMIC peripherals
      commit: 09cd0cb290d5a86fac28210e0387d507ddcb97b9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

