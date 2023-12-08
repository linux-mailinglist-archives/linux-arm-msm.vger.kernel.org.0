Return-Path: <linux-arm-msm+bounces-3976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9D480A60A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:51:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 576D8281C67
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 14:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9452B20B16;
	Fri,  8 Dec 2023 14:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PVZI1xNW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6591E4A9;
	Fri,  8 Dec 2023 14:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF616C433D9;
	Fri,  8 Dec 2023 14:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702047080;
	bh=NNAagKoZnDznV82ON6vsdE1ZUdkYjqMOWyh9djE0VJE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PVZI1xNWaW1PtQ+dKvG7+q+tDfuH8NXrYXSdTMVauCs50ZwwS+W9HtRiGzGVKxGGs
	 8cRND8FADtT3FjSwzt+de0sn/PfpBsT6W/ODbWjArrxhKP00hnH56CkmvKyYABffEv
	 wtjmqPqWaGk33NTUc7Hf6WKQz8231NNmshA8E8fzdKOlWipCl5Vr8qCP3Qh0nExxkn
	 L8esHN3Bm4pu06qWYJscR/4i8MpsCInwcb/9H0kuqiv6ukUZVq5+jdZ1cicQ9pPKUl
	 LOGV5oFUsXmHm3VKYzBZoAk8Byc9QutpupPMhlmBLngXZnAtriaB4OfDYLCfl1ds3Z
	 0puQZeuDGfqrQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Taniya Das <quic_tdas@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH v3 00/11] clk: qcom: Introduce clocks drivers for SM8650
Date: Fri,  8 Dec 2023 06:55:29 -0800
Message-ID: <170204733616.342318.391323012011048648.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231106-topic-sm8650-upstream-clocks-v3-0-761a6fadb4c0@linaro.org>
References: <20231106-topic-sm8650-upstream-clocks-v3-0-761a6fadb4c0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 06 Nov 2023 09:25:53 +0100, Neil Armstrong wrote:
> This patchset introduces the following SM8650 Clock drivers:
> - GCC: Global Clock Controller
> - DISPCC: Display Clock Controller
> - TCSR Clock Controller
> - GPUCC: GPU Clock Controller driver
> - rpmh clocks
> 
> [...]

Applied, thanks!

[06/11] clk: qcom: add the SM8650 Global Clock Controller driver, part 1
        commit: c58225b7e3d702e62e0e0ac1ad2c59248c60c008
[07/11] clk: qcom: add the SM8650 Global Clock Controller driver, part 2
        commit: aa381a2bdf1dfc36468f84c8d0ceba63be25b3b3
[08/11] clk: qcom: add the SM8650 TCSR Clock Controller driver
        commit: e3388328e47c45cc91fe74b334694fa455c1c935
[09/11] clk: qcom: add the SM8650 Display Clock Controller driver
        commit: 9e939f00833844bec64f5b2db61eb77f4ebeb795
[10/11] clk: qcom: add the SM8650 GPU Clock Controller driver
        commit: 8676fd4f3874d06cdf0c897f4f306c7b11618f6a
[11/11] clk: qcom: rpmh: add clocks for SM8650
        commit: 1d50607335d728ed874da41b500173faf1bc2576

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

