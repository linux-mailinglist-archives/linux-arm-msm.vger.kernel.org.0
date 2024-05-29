Return-Path: <linux-arm-msm+bounces-20873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 234888D2A7A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 04:05:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B71BEB23BD8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 02:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE881667DC;
	Wed, 29 May 2024 02:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0Z1xAV9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B22C1667CA;
	Wed, 29 May 2024 02:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716948148; cv=none; b=bpUZrlnbS2dbfHUvNnF5jhHtvaQ7cXYeIXVR7uy6WwNE8DNPhblSFmgqTCtnQw3jc/VH8bo/IBqGJSJ12L89AW/W8OqHbOEq+VoZ8AMl7308klGYonFiPh5ML7nG3AzbjBhgslJ+7+DeM96LsOpwmbUjnIv6w9lPaGHcSb1n1bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716948148; c=relaxed/simple;
	bh=iYGLZOma106qnbZvlmMVlpIjBuciGFoal0QOxAV2eEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hNJpOuNYF5zGhpaJWcyZITzfEcx/jQ7cVSQpkQRkKgufuS6JIibUmKH2sMv8Y4EkBeOQEXkIeRmMTiEEZyxYS7I7bXnokWjoZLbUvoVwqJbbFer35xRvIaUW00/iLVtHQLqNukSYdx1FYEgPqAdNy9WZPpfoOx8gIpHlL7pUEUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0Z1xAV9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B15C32789;
	Wed, 29 May 2024 02:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716948148;
	bh=iYGLZOma106qnbZvlmMVlpIjBuciGFoal0QOxAV2eEU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M0Z1xAV9laRcra1wkkGOiY/ciCzZSo5I0lp1BYJgLbxz7t34qJphhHjf6vJy1x4fG
	 K81CqGOcLFZQQ2WOc3n4g8ylEM1Vj0m3by8LE8DrFRqK8zOoW201TNOmyMGPoNmI0g
	 aomOKxFYDYC8DmqweXb18KPAKw9L0nmJmtI9CDrs+VWBkMz+HS+9dxJFBMXP3QOdxT
	 PvLreKuks2dn6+fFuyvapzeqnevVBuxTmHWaDmeZIJPxGAiJzAvwLnlO603gx1FqJp
	 L6ar8rZOSRjY+EBGqEdJD0mnaN95TJpk7V+JO2VqGvpLrpCVWK7Tv4EUwB+tkWLlrh
	 WW8tv8sgen6gg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andrew Halaney <ahalaney@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Cc: kernel@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: (subset) [PATCH v4 0/2] Mark Ethernet devices on sa8775p as DMA-coherent
Date: Tue, 28 May 2024 21:02:01 -0500
Message-ID: <171694812085.574781.5963530669426205185.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240514-mark_ethernet_devices_dma_coherent-v4-0-04e1198858c5@quicinc.com>
References: <20240514-mark_ethernet_devices_dma_coherent-v4-0-04e1198858c5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 14 May 2024 17:06:50 -0700, Sagar Cheluvegowda wrote:
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konrad.dybcio@linaro.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> To: Andrew Halaney <ahalaney@redhat.com>
> To: Vinod Koul <vkoul@kernel.org>
> To: David S. Miller <davem@davemloft.net>
> To: Eric Dumazet <edumazet@google.com>
> To: Jakub Kicinski <kuba@kernel.org>
> To: Paolo Abeni <pabeni@redhat.com>
> To: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> Cc: kernel@quicinc.com
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: netdev@vger.kernel.org
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sa8775p: mark ethernet devices as DMA-coherent
      commit: 49cc31f8ab44e60d8109da7e18c0983a917d4d74

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

