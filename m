Return-Path: <linux-arm-msm+bounces-3833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8F68099DC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 03:54:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20C64281F86
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 02:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D136D19;
	Fri,  8 Dec 2023 02:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AovYcxr1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA6E6AAC;
	Fri,  8 Dec 2023 02:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1021C433AB;
	Fri,  8 Dec 2023 02:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702004028;
	bh=8ejV7rvgx5iy4VrzUUT9YBaxO5og4KrJug7co7fnkoA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AovYcxr1jgM/1TXdlnmHUv3g95XJ2qCJQ5wTON4XmJIZwFNrr580xPARQ50SFDdyr
	 IITl3QxPdE8d2hZM5D2uL9pknL1FvrmSjtmGcL+C+nMJyAKlf/GR+p7Sg2pf/uFQOO
	 fIWxm1p7t2djsoY/6md6ohg01FcWwPFCqjf5VJpnmnmahK48Cl55WXb8+Y47ZTMt7x
	 a9gEXHZzb8TwOi00ntfmytPyofngj5MnVJXMVLCOfOr4zVsen5py3xClGaEHnbjzIT
	 8dTZ6z0X+Lol8kyo4IH3L9DmmcO9ca/twwenHZQreISZGoxxCeVRjwt7vHZxz4bQk+
	 pVfY+MC+lccNA==
From: Bjorn Andersson <andersson@kernel.org>
To: agross@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	konrad.dybcio@linaro.org,
	Shazad Hussain <quic_shazhuss@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: sa8775p-ride: enable pmm8654au_0_pon_resin
Date: Thu,  7 Dec 2023 18:57:52 -0800
Message-ID: <170200426916.2871025.17053214284778900352.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107120503.28917-1-quic_shazhuss@quicinc.com>
References: <20231107120503.28917-1-quic_shazhuss@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 07 Nov 2023 17:35:02 +0530, Shazad Hussain wrote:
> The volume down key is controlled by PMIC via the PON hardware on
> sa8775p platform, so enable the same for sa8775p-ride.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sa8775p-ride: enable pmm8654au_0_pon_resin
      commit: 81c8ec77b86fde629d5beea1ebe42caeea57c5a4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

