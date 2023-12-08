Return-Path: <linux-arm-msm+bounces-3981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5079180A616
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:51:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BB4A28132A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 14:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D9021113;
	Fri,  8 Dec 2023 14:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HE+WXVYy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAB720311;
	Fri,  8 Dec 2023 14:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70B7EC433CD;
	Fri,  8 Dec 2023 14:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702047086;
	bh=0MgGExYJV/D19j3gNgtyW8OZmsoHr/Wvt78LtIJx10w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HE+WXVYyfTSFVfJdvnB5E8qxGWwfmjLo8pOCmbujo07GrJF72BuVlyeUdk3aW1NnJ
	 48DQt+uBiVMxO+zLT1TLdDV/xaoy4GRBCH6xwcQg36ZuX40LA2JMU8IMeUvws9cclL
	 ncp7SdHG1ScbrxCCxq0Tr2CCfen+1mFBW7XACRK++T3JZtn9knk9M7aXoKy82eP51D
	 CyTkhAi+FDzm1Ls5DVpQwc6x5c0lmUI3Q6T99+Qbn9zGHa5miyAYlPr5PkiovaKrV4
	 9rFy3hAhBHQo0mD4WOhPIc6aq7y/6I9xGS9FXK9+hzD9n6TQSOikKN4pIBQsR3eEZZ
	 z4069bpnsCGEQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konrad.dybcio@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	Sibi Sankar <quic_sibis@quicinc.com>
Cc: agross@kernel.org,
	conor+dt@kernel.org,
	quic_tdas@quicinc.com,
	quic_rjendra@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	neil.armstrong@linaro.org,
	abel.vesa@linaro.org,
	quic_tsoni@quicinc.com
Subject: Re: (subset) [PATCH V3 0/4] clk: qcom: Introduce clocks drivers for X1E80100
Date: Fri,  8 Dec 2023 06:55:34 -0800
Message-ID: <170204733637.342318.16035155134593344694.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231205061002.30759-1-quic_sibis@quicinc.com>
References: <20231205061002.30759-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 05 Dec 2023 11:39:58 +0530, Sibi Sankar wrote:
> This series adds initial clock support for the Qualcomm X1E80100 platform,
> aka Snapdragon X Elite.
> 
> Our v1 post of the patchsets adding support for Snapdragon X Elite SoC had
> the part number sc8380xp which is now updated to the new part number x1e80100
> based on the new branding scheme and refers to the exact same SoC.
> 
> [...]

Applied, thanks!

[2/4] clk: qcom: Add Global Clock controller (GCC) driver for X1E80100
      commit: 161b7c401f4bd3e9ebd351f482139d8736be990c
[4/4] clk: qcom: rpmh: Add support for X1E80100 rpmh clocks
      commit: 874bc7be1e08bca7d47cfa2dba57164f73a30219

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

