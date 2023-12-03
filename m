Return-Path: <linux-arm-msm+bounces-3083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4B68020AC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 05:51:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D9291C208E1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 04:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D12010F5;
	Sun,  3 Dec 2023 04:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyN7zjnh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754FB10E9;
	Sun,  3 Dec 2023 04:51:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90891C433C7;
	Sun,  3 Dec 2023 04:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701579099;
	bh=e0j+WpVqufsmEGLn+u5GdTx5Hc117pLb2MNxwFg1f4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CyN7zjnhzEg0irpLWZvdgjEeGEhE1eqx+79iyELv0Fbc451xdcXEs9dHx+DomvL9F
	 o4Ly5sACQzsakLA4EtjjCtcDnkgt1OecULF85Bn+Ap356UJu+8nf/PzYjwNXo5zuaC
	 GN7zLO5jgINqYgYITvpUBi7cfL60ELtAfwqkk6HkanXBeHS7sWBHL2LVMB/2xiJ0dX
	 QpMku8/c/iG2YEDjhDTujM/XzRsT4c0LDUTY5iBBt9eXobg2JdNjITa213RKFkUl0X
	 8JnbiTliIjVUu4p9YbEaZFVzE+izrZgjFWPFrLiP8m+6tkIm8Dz7ntBxDpFgVmmLdi
	 DP34hfHO4spNQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Kalle Valo <kvalo@kernel.org>
Subject: Re: (subset) [PATCH 1/2] arm64: dts: qcom: qrb2210-rb1: add wifi variant property
Date: Sat,  2 Dec 2023 20:54:30 -0800
Message-ID: <170157925787.1717511.1692518318263970201.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230801232448.4175662-1-dmitry.baryshkov@linaro.org>
References: <20230801232448.4175662-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 02 Aug 2023 02:24:47 +0300, Dmitry Baryshkov wrote:
> The RB1 platform doesn't have board-specific board-id programmed, it uses
> generic 0xff. Thus add the property with the 'variant' of the
> calibration data.
> 
> Note: the driver will check for the calibration data for the following
> IDs, so existing board-2.bin files will continue to work.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: qrb2210-rb1: add wifi variant property
      commit: b6a56a5a25d6273729b2b5139d58e3d390318ed2
[2/2] arm64: dts: qcom: qrb4210-rb2: add wifi variant property
      (no commit info)

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

