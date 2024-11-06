Return-Path: <linux-arm-msm+bounces-37094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 037B79BDAAA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 01:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3570F1C22D3A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 00:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5758A17D378;
	Wed,  6 Nov 2024 00:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bbEm334w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEBC17C228;
	Wed,  6 Nov 2024 00:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730854436; cv=none; b=Om1gQPmAbU8++K871kfVWiwMdHUIfy8CALVjiGIUjhf7WhPeGCvEVwEX0oDdk9HM+b0VHSS5mrmq8/lyPOadgBIlNRX0kvPDS2057h0HsHsrt4okRhsbjH4vm4Irqg6UcXpbP1rMnMyG4LVXxzQkhlvxrbPDEEsFG7CFPjHPOHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730854436; c=relaxed/simple;
	bh=OpSj2s03U6rblOp9IVwEmPYWW07hAc665vyXgAcUhPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qNPt98NeQNKBz5BGrWEWZ8SN64KGvC1YwdoxySczf1mLfI0f1kXl75PV7gEpnkLL4y6H6z0OFb5p6M/H6j7RIpWfyvSJcrnqw1cfDJD++FwRqgqWt3N4YeSzdvzW10A9zQghytXSVEvBKVzIsknyq6zTMFJJxVRc/+JY9vGg7Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bbEm334w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC26C4CEDC;
	Wed,  6 Nov 2024 00:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730854435;
	bh=OpSj2s03U6rblOp9IVwEmPYWW07hAc665vyXgAcUhPg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bbEm334wXhk8dgV0etlmk9GHGD4g5x7tsn7hZ9xEvmNp1UC24t2IpieYkVakULMo1
	 aVy9n9Ux0kS4I4ngjknSf8o5mkThWP3Ibf5LJ4HSK/56SICDuMqjV1vIjur9gVsd5/
	 PPOYdg8v5a3ncLkayESbfxkQIpVD69oJXu32Qh9v4I3Shihmklo5I6paB0a8aLNhsG
	 bkh68E+CLse18kTlCLwQH/gQ2r92hn+VIdyOk40uoAyU6YLtgJShVssv0/CL5BMw0R
	 02S1UVGrFvKwcyekxXd0SB6dH6aITXGVIAO1kVOdlnn8qG/RYp4BOVVt96A7LAxxEk
	 sThFvkzNiS9rw==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	krzk+dt@kernel.org,
	robh+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	abel.vesa@linaro.org,
	srinivas.kandagatla@linaro.org,
	quic_jjohnson@quicinc.com,
	maz@kernel.org,
	jens.glathe@oldschoolsolutions.biz
Subject: Re: [PATCH V1 0/3] X1E001DE Devkit remaining features
Date: Tue,  5 Nov 2024 16:53:47 -0800
Message-ID: <173085441662.26510.18014843011492244518.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025123551.3528206-1-quic_sibis@quicinc.com>
References: <20241025123551.3528206-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 25 Oct 2024 18:05:48 +0530, Sibi Sankar wrote:
> This series adds 3.5mm jack, sd-card and external display support to the
> X1E001DE Devkit.
> 
> PS: The ext display patch 3 needs pin-conf and updates from comments on
>     the list. Just included it in the series so that people can get
>     display up. Type c to DP was tested on all ports with [1] as the
>     base branch.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: x1e001de-devkit: Add audio related nodes
      commit: 3844a8682e55813a6ad02d14f5862d7a73f9dc22
[2/3] arm64: dts: qcom: x1e001de-devkit: Enable SD card support
      (no commit info)
[3/3] arm64: dts: qcom: x1e001de-devkit: Enable external DP support
      commit: 019e1ee32fec24a69e3491d27eb0f1bedce12525

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

