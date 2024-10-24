Return-Path: <linux-arm-msm+bounces-35735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E040C9AF048
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 20:57:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BD5D1F232D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 18:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D241216450;
	Thu, 24 Oct 2024 18:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sn3GhESW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02FC215F7D;
	Thu, 24 Oct 2024 18:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729796219; cv=none; b=bqr/itABwaI9VvbTzhWUDULy0okzqmFkkMaZRElcdC3B7TJZe/GW0Iu3eLGfbfWyTTpixCtTGxxTmcOrTdoMRQ0FLnJIfN5p8MhTj6Lwi80dWG68CMwvtkL5VE5swLfWABLavr1Eta8n9rduUIRMsv00nkcy1RntWIaIcmNoXCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729796219; c=relaxed/simple;
	bh=uH4oLbSJp5tK7l6Ubd/0LL3oX1y7PMVtESPqwn0P0f8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gy0qLt5WvfK64vccK5iCWZLG9rBnt505MAqLQk8cbipPJp9HG19dCXV20vAQr5Jv5a+DDMfoEkMlSzy0N7lUk7DVu8cZw8erfj8stnesz4vYPvyKpqQwzKDG5mqZ+c6rc9QGUftxMl0EYC8iDcUsSLVe0Vm2aCdPc8cdMnnnbvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sn3GhESW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4276C4CEE4;
	Thu, 24 Oct 2024 18:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729796218;
	bh=uH4oLbSJp5tK7l6Ubd/0LL3oX1y7PMVtESPqwn0P0f8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sn3GhESWHVyFNqiDGL77nobP6TAhL5xjpcwcjmTstlAJjmk38vkX8AZqGuGf1LRV+
	 gztMm3C2B1smWoIab8gQvq+xU/tIRogpdS3Xf4jmuJHnm8DD/9p4JD6Hd++jiKsCK8
	 BV1/otWxaOJNzV7o2b5B5rLYHxSrKCHBLJuzLYj3QMHjGalAE/L7AfHi8e3K/SLxgW
	 J6mqN7IhuBE4bw0j1o8qqysNgUXXsDUpMoGBpwY7fOeuAMneHZENjBSUOnRpdH1dHw
	 3jSN+Tc/if/WJTOh7/uGId6bFqs3WqR9w5iY5rrpMOEZJC+3JzaN7TnWfOnzO/2ny4
	 g3XHxQ6hqZNgw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: x1e80100: fix PCIe interconnects
Date: Thu, 24 Oct 2024 13:56:54 -0500
Message-ID: <172979621229.309364.4258661392750678343.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241024131101.13587-1-johan+linaro@kernel.org>
References: <20241024131101.13587-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 24 Oct 2024 15:10:58 +0200, Johan Hovold wrote:
> The fourth and fifth PCIe controllers on x1e80100 are connected to the
> PCIe North ANoC.
> 
> Fix the corresponding interconnect properties so that the OS manages the
> right paths.
> 
> These should go into 6.12-rc.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: x1e80100: fix PCIe4 interconnect
      commit: f3bba5eb46ddb8f460fc808a65050a9bf2f7ef23
[2/2] arm64: dts: qcom: x1e80100: fix PCIe5 interconnect
      commit: 54376fe116ef69c9e58794589c044abb2555169e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

