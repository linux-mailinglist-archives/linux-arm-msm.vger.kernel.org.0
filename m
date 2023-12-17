Return-Path: <linux-arm-msm+bounces-5104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5D98160D5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Dec 2023 18:24:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0AB7282154
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Dec 2023 17:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA98A49F7E;
	Sun, 17 Dec 2023 17:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SEQXF1jg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD3349F7B;
	Sun, 17 Dec 2023 17:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95086C433CB;
	Sun, 17 Dec 2023 17:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702833707;
	bh=7/FEVAzBV3kGhj5iPvQwCTxyyuAVMHLcCH0hiKS56o8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SEQXF1jgK8Kkc6xKTvTjAKDNhFeNzw7CHYs0FWS5UOeTIO6jTbw/6KDvAZTeeNFuX
	 taXn1dFAMVin0SIsCOVQ9pNgCtt+9htfLlRiXq4PWsMBxsfdH4JqW5LuwpBOWzwaAK
	 HzB5k9Xqu0hPATFsA3nWMHZkM6R/Qa/kQw7Pvcq09R29Or5RKdW1O0mf10bw9BqAPa
	 rM+srynJScc5fAaOmfgVhipcgOmx3GYBgRgXh1jMVe93LIkDopW/TiMKuU596KhYtL
	 j9C6HF/c+7IrGbF50Ns5nlNTDvpNVgsUWuqWgTD5vy9Y29+epAUCCMIIznYxhdUPbY
	 jXXkKUO2gfw2A==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/9] arm64: dts: qcom: switch UFS QMP PHY to new style of bindings
Date: Sun, 17 Dec 2023 11:21:02 -0600
Message-ID: <170283349413.66089.15925766562815386605.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231205032552.1583336-1-dmitry.baryshkov@linaro.org>
References: <20231205032552.1583336-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 05 Dec 2023 06:25:43 +0300, Dmitry Baryshkov wrote:
> This is an unmerged excerpt of the previous series that converted UFS
> QMP PHY to newer style of bindings (single registers region instead of
> listing each resource separately and having child node for the PHYs).
> 
> Changes since v2:
>  - Rebased on linux-next
>  - Dropped merged patches
> 
> [...]

Applied, thanks!

[1/9] arm64: dts: qcom: msm8996: switch UFS QMP PHY to new style of bindings
      commit: f63ba6aa80f520678f35640b347e75c46bd49612
[2/9] arm64: dts: qcom: msm8998: switch UFS QMP PHY to new style of bindings
      commit: 963ff488afe100c8ee9fb80933e342719c6fa63d
[3/9] arm64: dts: qcom: sdm845: switch UFS QMP PHY to new style of bindings
      commit: 760baba5e79bae651c59df89d441fad2bd0be4a5
[4/9] arm64: dts: qcom: sm6115: switch UFS QMP PHY to new style of bindings
      commit: f6874706e311a8743b678613b083e9bf0e1fd112
[5/9] arm64: dts: qcom: sm6350: switch UFS QMP PHY to new style of bindings
      commit: 8e89beb32e1f81807c17af8eb07bd681b9ae229b
[6/9] arm64: dts: qcom: sm8150: switch UFS QMP PHY to new style of bindings
      commit: 935c76f7f85912962d72eceabdfa2c38c4c07f02
[7/9] arm64: dts: qcom: sm8250: switch UFS QMP PHY to new style of bindings
      commit: ba865bdcc688932980b8e5ec2154eaa33cd4a981
[8/9] arm64: dts: qcom: sm8350: switch UFS QMP PHY to new style of bindings
      commit: 002a13ed10136e4f59013adbf097b31d608caf67
[9/9] arm64: dts: qcom: sm8450: switch UFS QMP PHY to new style of bindings
      commit: 75390b69d5df49d828d0af278c7f27ed74e33064

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

