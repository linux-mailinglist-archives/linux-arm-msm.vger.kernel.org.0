Return-Path: <linux-arm-msm+bounces-23800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C3D913E57
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 23:03:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAE271C20B36
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 21:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6871187325;
	Sun, 23 Jun 2024 21:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WtJPF5NA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77148186E4D;
	Sun, 23 Jun 2024 21:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719176547; cv=none; b=LpUR+UjZ2bdOu4Tjgc6hNJCOpoXgrczxzutIIOCIbMn8scQFLrWtEBciTcZTBRpD4G/sNFeDnMcuWYTP/72bRX7ptTUspnzPvRqMNgi02ioTh4XFQydH9/cwgvQS8aj6uuf46z2LMia49MNkslFisjAOcFia5SNp2mlEz6wTDrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719176547; c=relaxed/simple;
	bh=RM/ZBE/hmgXLDKFJ8Gq2KpFpwUgNnPudBMl5pYalW/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fWxXbYRTYjvg2Wd3HM6Gy4Vssne2IDodlGm/Mt8+a7j0aQPJpmzueuan2ZJvUEbIaNfQuy0+Bq7vrrlLmKdNnGMYJrQUkz9D/76RxPvlKDJBcVVHpE/NyqDRrdxEbQ/FHsgXUPJOwuSoCfGNXsvzRSDdspDdQ9nBDGX3vlf8KIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WtJPF5NA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F5CAC4AF07;
	Sun, 23 Jun 2024 21:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719176547;
	bh=RM/ZBE/hmgXLDKFJ8Gq2KpFpwUgNnPudBMl5pYalW/w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WtJPF5NAi5xWBxU3t2J68UWO+Dmq8c9oSSlQQBtTX5rPwFDDppeFalXj+F9JTAUni
	 QN/KAMbXEwqx1HpsHJzyyPiMk7QKUzlJpj+8HuHcNw0JLKzfoOFnjoC9vhGG3ZPq57
	 bOuOsql1nCyf+G+eDvIh1et5ru71jSFPdDGfLFLJDpkkWsbvf8DLvrVVNb56GHYkQd
	 gk9pLA/HZ3waPTqHRGH0/DNT3V3e8mFAHoSBSfQfTjOBxZH5KJ+vo2BWu9dB74eQb3
	 VHOSupBQ3qggLBHtvKZSrvrTZBfUArAGMf9nqTVuVClOxr9fmRTEQB6r0JINRdwIM2
	 lSRNTqxWCfRfw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add PM8008 regulator support for Fairphone 4 & 5
Date: Sun, 23 Jun 2024 16:02:18 -0500
Message-ID: <171917653476.4580.4177052068822206945.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240621-fp4-fp5-pm8008-v1-0-dbedcd6f00f1@fairphone.com>
References: <20240621-fp4-fp5-pm8008-v1-0-dbedcd6f00f1@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 21 Jun 2024 10:42:29 +0200, Luca Weiss wrote:
> With the PM8008 regulator driver scheduled for Linux v6.11[0] let's add
> the dts bits for Fairphone 4 and Fairphone 5 which both use this PMIC
> for powering the camera sensors - and the pull-up for the CCI (camera
> I2C bus).
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/log/?h=ib-mfd-regulator-pm8008-6.11
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sm7225-fairphone-fp4: Configure PM8008 regulators
      commit: d315b45ab8b312d6e74d85064ef916aafd1bbdef
[2/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Configure PM8008 regulators
      commit: 2cf5ec58e87bf4df1b360ab45c047d2b311930c8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

