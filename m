Return-Path: <linux-arm-msm+bounces-20769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A048D1CE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 15:27:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B38001C23028
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 13:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B685616F26B;
	Tue, 28 May 2024 13:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gyA91qXy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8941D16F260;
	Tue, 28 May 2024 13:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716902838; cv=none; b=sTFQ6pP0ltaziYzWVPIMW/CWeAv03Th2gGYgIm2zP4PqvcstmJf8PuTuTvs34i7P4QL07h33QLDe+ex+KuR4e6pglQftcNd7QQMIc7PP/s4i9m/ElZgvNQcWSWvZmLBiK6TKX3BfEEhboK4eRj2E6urAVhO5cd9/MEfHhhXIW5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716902838; c=relaxed/simple;
	bh=YYl1lOWO6cs9DwFClWb5j0oMwLGGEFuIrHYWUw8CDcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MCcNqpKfZ2W9TkSQJkCZvG38oFo0HGr4nPk9EfvskuGqAUjnVNl0zHD1ZBQ1dh9Wa+vAQZq+oQXIXg11BYdbJ1MtgVH6BTi1gK3zwWS1DkouVR8x0EeZXv8KrHMpCHgC124ijOYD/LsjdJkL+81zY6owWOGgLlrCP8fnR2wm720=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gyA91qXy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D601CC4AF07;
	Tue, 28 May 2024 13:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716902838;
	bh=YYl1lOWO6cs9DwFClWb5j0oMwLGGEFuIrHYWUw8CDcA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gyA91qXy+6j22T+01DxrQePC3ycTUMME26kcPYVDROrvn1ZmbTFXPEy28jpB3AZRY
	 GiTcXuNJPGAv8UySufTIYi0M84shS10oJryd7dAqRgQxnHNwmoksmnAkhW+OerkJHn
	 TUdiPoNmAk4STxXsn/iY9qkS507Q/901wjocEztXHmXbNZCe/aK0jSzsD1tey/BKxo
	 X7CQbPayR5oC79kdscWKnhKrE28YaE7uJ84suqZ/GTUft0vJDaVPyao7d5INMrB2mS
	 jGgqBCmMfCKXUTq6Up4s6Cb2CK7M9pPiU+3CTUYG4cRTMyGYboYEikytzxFoA/uVwI
	 v1nnRb1MGax8A==
From: Bjorn Andersson <andersson@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Nitin Rawat <quic_nitirawa@quicinc.com>,
	Can Guo <quic_cang@quicinc.com>,
	Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Andy Gross <agross@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v4 0/4] scsi: ufs: qcom: fix UFSDHCD support on MSM8996 platform
Date: Tue, 28 May 2024 08:27:13 -0500
Message-ID: <171690283120.533694.5172412589591017621.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240408-msm8996-fix-ufs-v4-0-ee1a28bf8579@linaro.org>
References: <20240408-msm8996-fix-ufs-v4-0-ee1a28bf8579@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 08 Apr 2024 03:04:30 +0300, Dmitry Baryshkov wrote:
> First several patches target fixing the UFS support on the Qualcomm
> MSM8996 / APQ8096 platforms, broken by the commit b4e13e1ae95e ("scsi:
> ufs: qcom: Add multiple frequency support for MAX_CORE_CLK_1US_CYCLES").
> Last two patches clean up the UFS DT device on that platform to follow
> the bindings on other MSM8969 platforms. If such breaking change is
> unacceptable, they can be simply ignored, merging fixes only.
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: msm8996: specify UFS core_clk frequencies
      commit: 02f838b7f8cdfb7a96b7f08e7f6716f230bdecba
[2/4] arm64: dts: qcom: msm8996: set GCC_UFS_ICE_CORE_CLK freq directly
      commit: 7e35767cb7876a8109d155086bc38974467dbb67
[4/4] arm64: dts: qcom: msm8996: drop source clock entries from the UFS node
      commit: d3d8b80845eb51266407aa39310dab0a42b7c6ad

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

