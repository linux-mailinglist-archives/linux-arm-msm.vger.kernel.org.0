Return-Path: <linux-arm-msm+bounces-37089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6959BDA9C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 01:54:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2529E1F24046
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 00:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97FBB14375C;
	Wed,  6 Nov 2024 00:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KwomORwx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699CA13D297;
	Wed,  6 Nov 2024 00:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730854433; cv=none; b=WQgzDSGCWDY0wkkwvUnAavZ5saksAPlecszvR1oJsINgbCqRElv2yt+PXYIUKz3uAMzryk/+dAfg2ai2MyA0UZ2prdkvduuBuc8JjgPUMXGCcyKbilw+MAiMeVMXaBoJsnw5C++AHvIhEgJgpqi/ydx6xOoII6wjBNsRIxhHz64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730854433; c=relaxed/simple;
	bh=kidsRbo0VwV+FwezBK703pCp4QHEkoxa89vKbQfNk1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EE7V0tahDEtuUOvd0QZ6EYHX6CMDrtaCFKM1yqUQsPzAzmK4Sd6c5P0Lxgt5PHwnRBMKQeBjvxvceseHfk0NwJBEpYKQTsM9sR6jncR8x7N6JBat5QmlLUIgO/VAMMkXzafod3FL3dXEel1Qappk4Ra21GNtapZtprH92AT3k8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KwomORwx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23D63C4CED2;
	Wed,  6 Nov 2024 00:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730854432;
	bh=kidsRbo0VwV+FwezBK703pCp4QHEkoxa89vKbQfNk1A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KwomORwxe20ujy9GyNnKmb1HCBBXQd2o46Wbp2wsP+Wsnxl/pOanbrBo+FclIiGVu
	 siVM09B2J+PiOkXOtAVI0O4YHiAHQ/OgYX8uZdlPr4+7aBOLUaXdaAmJsZ51QH1Za3
	 poMRjunPWTBkx3Wq0ibUfxDsLhd6SaIvurPRaLM8chTPUYb8Vm1doYqM6VpzBUkuPz
	 oZ3r493Apo+6D3L3lczp3gVNFnY3QtBz9acx2gOgqn2RbuhIpBfvJ3Kk2h+Rtot1Jr
	 VlsSdwiE5LYZYcmrtz93+eya4u/+QjEmNXe/WK51Vz5POLNnRO8//KX1CvCfjuUt3v
	 /qdIm+qb770sw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Kalpak Kawadkar <quic_kkawadka@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 00/11] clk: qcom: add support for clock controllers on the SAR2130P platform
Date: Tue,  5 Nov 2024 16:53:42 -0800
Message-ID: <173085441668.26510.36612615286324988.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241027-sar2130p-clocks-v5-0-ecad2a1432ba@linaro.org>
References: <20241027-sar2130p-clocks-v5-0-ecad2a1432ba@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 27 Oct 2024 03:24:39 +0200, Dmitry Baryshkov wrote:
> Add support for the RPMh, TCSR, Global, Display and GPU clock
> controllers as present on the Qualcomm SAR2130P platform.
> 
> 

Applied, thanks!

[06/11] clk: qcom: rcg2: add clk_rcg2_shared_floor_ops
        commit: aec8c0e28ce4a1f89fd82fcc06a5cc73147e9817
[07/11] clk: qcom: rpmh: add support for SAR2130P
        commit: 2cc88de6261f01ebd4e2a3b4e29681fe87d0c089
[08/11] clk: qcom: add support for GCC on SAR2130P
        commit: 13e677de1a7b0f389a8a46d2d148c8b5b55afcdc
[09/11] clk: qcom: tcsrcc-sm8550: add SAR2130P support
        commit: d2e0a043530b9d6f37a8de8f05e0725667aba0a6
[10/11] clk: qcom: dispcc-sm8550: enable support for SAR2130P
        commit: 1335c7eb7012f23dc073b8ae4ffcfc1f6e69cfb3
[11/11] clk: qcom: add SAR2130P GPU Clock Controller support
        commit: 30eb0e76d7b4b7dd1e6e8ace010ac24391dd9263

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

