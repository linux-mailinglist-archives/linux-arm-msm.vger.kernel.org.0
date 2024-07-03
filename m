Return-Path: <linux-arm-msm+bounces-24968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BFF924FD2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 05:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 871161C229D5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 03:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166C11369A3;
	Wed,  3 Jul 2024 03:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uW2P6mGi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD41713698F;
	Wed,  3 Jul 2024 03:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719977872; cv=none; b=PzAVICLiXR/9AwWcoYol2vOgl/pUDPIlSpFRtgOxHPf02sCRZ8POzZEjOHAx83LthlNttAdx40KO+xEDCE0Jz45ORZ6XRtkIcW7qYpoAiZZMb9QjXIc0clIMCHp0A+KTXdASWc0j+f0zvDBCPv+lhvm0EJn3LXwOeUKh0khRjAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719977872; c=relaxed/simple;
	bh=832WPZNjC2cU1NTJdZRlTwMLNqACMwDQnZTUfdgZRQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n4UcQlgIOgw25kupUtlMETn201Bce4DjnQdAdxXEYdEi59ZD4Hv6ZGxHv5lUBE/BIktyJYcF42g8sABr2LitpJ+96U5WGFiQelrjIurtOVw56HnfstC+9sXfnuuruyyVwEC/AXT+ToYCemeOI9WxScyZdHKCu177+5tm9wRGK1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uW2P6mGi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD04C116B1;
	Wed,  3 Jul 2024 03:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719977871;
	bh=832WPZNjC2cU1NTJdZRlTwMLNqACMwDQnZTUfdgZRQI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uW2P6mGinY+vgnxllheTht2kHIOnVn6AF8LR817cLCQSSl26lQNsBQZC3P0483kEu
	 aYkb+XU2AAsOSzpLt4lIPndZI8f7dq65Uxy3f0k0ZakxH0tcyv+mjhU84ZY0cWMyRj
	 RUuErauTxXB+ljtzCTI0hDQJZIoGhEwtFwCfRK7YSqp35TaQI/BZbJEcGX9ispTSvd
	 1cQV+jsmB9HFeYWDlxjHmi0GzJhhjKSnEx7JFUFOCQdZtxXKteSmzx+9aVdeaN8a2O
	 j4h5qpJwPivQd6F46ZQMg3mLdkojEghuODdJmB1/sT/IDTL3TxywQ6SxZVwD3hAeOJ
	 X5tGXypFY9FVw==
From: Bjorn Andersson <andersson@kernel.org>
To: freedreno <freedreno@lists.freedesktop.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Will Deacon <will@kernel.org>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Joerg Roedel <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Sean Paul <sean@poorly.run>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/5] Support for Adreno X1-85 GPU
Date: Tue,  2 Jul 2024 22:37:33 -0500
Message-ID: <171997785354.348959.17891390714770433970.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240629015111.264564-1-quic_akhilpo@quicinc.com>
References: <20240629015111.264564-1-quic_akhilpo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 29 Jun 2024 07:19:33 +0530, Akhil P Oommen wrote:
> This series adds support for the Adreno X1-85 GPU found in Qualcomm's
> compute series chipset, Snapdragon X1 Elite (x1e80100). In this new
> naming scheme for Adreno GPU, 'X' stands for compute series, '1' denotes
> 1st generation and '8' & '5' denotes the tier and the SKU which it
> belongs.
> 
> X1-85 has major focus on doubling core clock frequency and bandwidth
> throughput. It has a dedicated collapsible Graphics MX rail (gmxc) to
> power the memories and double the number of data channels to improve
> bandwidth to DDR.
> 
> [...]

Applied, thanks!

[5/5] arm64: dts: qcom: x1e80100: Add gpu support
      commit: 721e38301b79a6ee8375cb0ebd586699a7f353e3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

