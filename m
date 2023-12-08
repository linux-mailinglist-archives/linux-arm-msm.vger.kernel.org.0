Return-Path: <linux-arm-msm+bounces-3979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB40080A611
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:51:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08B6B1C20BF2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 14:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E5E200C7;
	Fri,  8 Dec 2023 14:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ovvus9c0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A749200C4
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 14:51:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C992DC433CC;
	Fri,  8 Dec 2023 14:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702047084;
	bh=WKUdBdk+yM5Rc2LPyObNzhOm/h1zc1q5RahCtrpAh/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ovvus9c0U3n2FNAtH0/zn3rOlU2WOL3H/YZPZGX3wd9VB53v+Jlq2Nhl2wY8vooiy
	 ggj2CnDrgRi0mI2PVqR2poCk0NwFKiyri4p6dbRvslxeH6oDnzbMiMLgzEdRjEunOb
	 FgNm4RE492HcHx7/63Lna4dTk6lFElF23dzvoUAg24sqtOpY23Bs1xZvS6TLeOZBBc
	 szKq+umCfrbcqe1J+kOY6jqgYOSV06y3rb0JWP1RD/ImL8utd4sr6KenDYbH89UYoC
	 RgAd/1z8sqq6yotPlGNpI7yws5JRcV6boCDCVaUvZ5Fv53eQznDMi1y4Q3UBua0LFu
	 MQyXSd1D1jTJw==
From: Bjorn Andersson <andersson@kernel.org>
To: catalin.marinas@arm.com,
	will@kernel.org,
	quic_bjorande@quicinc.com,
	geert+renesas@glider.be,
	konrad.dybcio@linaro.org,
	arnd@arndb.de,
	krzysztof.kozlowski@linaro.org,
	neil.armstrong@linaro.org,
	dmitry.baryshkov@linaro.org,
	nfraprado@collabora.com,
	m.szyprowski@samsung.com,
	u-kumar1@ti.com,
	peng.fan@nxp.com,
	Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	kernel@quicinc.com
Subject: Re: [PATCH v3] arm64: defconfig: Enable GCC, pinctrl and interconnect for SDX75
Date: Fri,  8 Dec 2023 06:55:32 -0800
Message-ID: <170204733621.342318.8169147134821175341.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231117055849.534671-1-quic_rohiagar@quicinc.com>
References: <20231117055849.534671-1-quic_rohiagar@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 17 Nov 2023 11:28:49 +0530, Rohit Agarwal wrote:
> Enable Global Clock controller, pinctrl and interconnect framework
> support for Qualcomm's SDX75 SoC which is required to boot to
> console on sdx75-idp platform.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: Enable GCC, pinctrl and interconnect for SDX75
      commit: 3515c3172f66ad4b3f485862f858f76a3e49c659

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

