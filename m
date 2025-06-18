Return-Path: <linux-arm-msm+bounces-61666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9FDADE223
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 06:11:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF1043B043F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 04:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF75B219E8F;
	Wed, 18 Jun 2025 04:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XaFOgCkh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDB8219A89;
	Wed, 18 Jun 2025 04:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750219783; cv=none; b=rRkk2nPIXhY0ztzLwDPm79TWEPg6FaAlzYxMRCYjMSHN/ggDizKsY4T2GdgMaV4mAtrf93lrn8UoqF0JuLoO8aL3HcsLiDzAmO2Rxc3vto0hEIjFYXaIUcTS1Un/63O0wFFEt6w6W4eQ4kA+W4nIbY1lgKJNBUCTRZif3OLvdGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750219783; c=relaxed/simple;
	bh=ODt+2+GkMCGt71Fp2dlPmHqOy1HSpcbumhkPqILkDHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uiv2TsxTfKQWiXrx7LXbiBRebDd+jlL1s/H26TlkRBnExrofcWP4PYpHH5zvLxuwLQMDDVcM7Ql5qQJcQNoxMlk7r/w/NbInEw13UMEpAhQcneQPs3z9Is2hrp12V6Z9ONWn47/8cgHqkSWjrnwS4WbaUtWDb9MAG3kZSzau6Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XaFOgCkh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F2BC4CEF4;
	Wed, 18 Jun 2025 04:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750219783;
	bh=ODt+2+GkMCGt71Fp2dlPmHqOy1HSpcbumhkPqILkDHs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XaFOgCkh7/fG0TVSeeYcZPVuOE+c37HoRCbkg+MkPq8WvZVxtx7YvZJ+MRkiFNllD
	 gsHHp6WFXjeD1XbH+fxLzr2etwN48+2Yn9nTD4RGPn3Ci79g5YhpfWFRAyuAXZVASn
	 4oxhIIjwVZzdGo38+cO8a3cQSGdLmo5sV3gychFswZdpqjSSSVyXMjDmuTFlTidse3
	 ufIG47P1N+qeMXz60U4S5ARmS1kl+X6wWiEsT1wJdZhiGjNQAQ0D1Rd8whxSnQoxrU
	 ScaFV0isklwhA1H/64aRC3jrhoOplmahY1t+XLuHUNcP/CJpNZDMvidIkpc9CcVCSa
	 tcvSsmH/lcKPw==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lijuan Gao <quic_lijuang@quicinc.com>
Cc: kernel@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Kyle Deng <quic_chunkaid@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/6] arm64: dts: qcom: qcs615: enable remoteprocs - ADSP and CDSP
Date: Tue, 17 Jun 2025 23:09:25 -0500
Message-ID: <175021976648.732077.7430926610007550509.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526-add_qcs615_remoteproc_support-v4-0-06a7d8bed0b5@quicinc.com>
References: <20250526-add_qcs615_remoteproc_support-v4-0-06a7d8bed0b5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 26 May 2025 13:21:46 +0800, Lijuan Gao wrote:
> Enable the remote processor PAS loader for QCS615 ADSP and CDSP
> processors. This allows different platforms/architectures to control
> (power on, load firmware, power off) those remote processors while
> abstracting the hardware differences. Additionally, and add a PIL region
> in IMEM so that post mortem debug tools can collect ramdumps.
> 
> 
> [...]

Applied, thanks!

[3/6] arm64: dts: qcom: qcs615: Add mproc node for SEMP2P
      commit: bf2a6a7765412dbf487eb478b00783868c32a348
[4/6] arm64: dts: qcom: qcs615: Add IMEM and PIL info region
      commit: a129ca1a9413d5ad605a7bbcdc50e01a3e772580
[5/6] arm64: dts: qcom: qcs615: add ADSP and CDSP nodes
      commit: 18b011d4569da5f39d5003ab23bda0e7e23af6bf
[6/6] arm64: dts: qcom: qcs615-ride: enable remoteprocs
      commit: 47d59463bd885f9c8cb6f2ded8be67fa89d98726

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

