Return-Path: <linux-arm-msm+bounces-3090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 147328020C6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 05:52:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C525B280FB0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 04:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 728623C0F;
	Sun,  3 Dec 2023 04:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bOihLPmp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559073C0A;
	Sun,  3 Dec 2023 04:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E4F5C433CB;
	Sun,  3 Dec 2023 04:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701579108;
	bh=271tYevWkSetGdYCuU7C59CAuTV9QQWyrcu6WcOI7sY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bOihLPmpZUs0+BN+nBWH2ERX+mNlYTCuvJCuwGrnMOvqxsRMAgXi6VIqAMcIp+4rG
	 rigMaqkWXjNm6XaudfArzUkq2g1fRQEmqyK4CCmF9hQAVgseYZv85oEW2DcrhEzfbK
	 9Mxwkk8e2CsrRb6TbPaJVGlTAT4PsWYcumZu/ExmhdlsOZ/qIFZ01U5F/GEKeAv03t
	 kNH5EHcAETCWV+bnYAHEv4A4ZYAWurGu6fTk9n6LS/BhzHwX9DOz6cdDV9MkGx2fS3
	 Z0zaVVTnOJ1aglJv0iZMYPf+UM1r05mvv6BPfOVyNHDuX0J/hamc6dWI+rfyHea+40
	 dOLqeVjScKvrw==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rohit Agarwal <quic_rohiagar@quicinc.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [RESEND PATCH 1/3] ARM: dts: qcom: sdx65: correct PCIe EP phy-names
Date: Sat,  2 Dec 2023 20:54:37 -0800
Message-ID: <170157925790.1717511.17259915404588781563.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230924183103.49487-1-krzysztof.kozlowski@linaro.org>
References: <20230924183103.49487-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 24 Sep 2023 20:31:01 +0200, Krzysztof Kozlowski wrote:
> Qualcomm PCIe endpoint bindings expect phy-names to be "pciephy":
> 
>   arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dtb: pcie-ep@1c00000: phy-names:0: 'pciephy' was expected
> 
> 

Applied, thanks!

[1/3] ARM: dts: qcom: sdx65: correct PCIe EP phy-names
      commit: 94da379dba88c4cdd562bad21c9ba5656e5ed5df
[2/3] ARM: dts: qcom: sdx65: add missing GCC clocks
      commit: f64f653df2ef713359178c731bc8f89ff54014b1
[3/3] ARM: dts: qcom: sdx65: correct SPMI node name
      commit: a900ad783f507cb396e402827052e70c0c565ae9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

