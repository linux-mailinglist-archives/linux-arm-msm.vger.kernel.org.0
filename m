Return-Path: <linux-arm-msm+bounces-81901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 492FBC5E55E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 17:50:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7DC0750393A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 16:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9113532E143;
	Fri, 14 Nov 2025 15:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iwPSRCeL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52720325732;
	Fri, 14 Nov 2025 15:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763135902; cv=none; b=cVRP/BO8SC9WhvixXw1EUYBMMDpqiP1yDt8oWwJSF81hwhFdCF5KTXbgG82u9MAjVbhVAipKX3yIhz5niPrVrAUgBYyUPBlCSOya5W5rSENC93iR7fqip00MtNRmMjHl7YWEzC4WM0nWB5yqiEZIOO0eHL2YFhxOkVTZteSUiVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763135902; c=relaxed/simple;
	bh=UrSTM5kmhxKUTGYm83kb1wdz9qhRcg8d9G1xvyGuRqA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=SxA05DeUCQ7LYrTpCnfoBE51Pxae8YaZ7L9i5BRiZB4VrftYuEASe14TqgwGyhte6NS+RNkJKbA8fjIoRL+JRTh+0y7/UeNghSfezr9AfSSSGdWbcAWFrLnHWIyIVADAwC+twzfVvW5eXIPRXPKvpR20Rpf7Fv46fd2vKtSFBqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iwPSRCeL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C562C4CEF8;
	Fri, 14 Nov 2025 15:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763135901;
	bh=UrSTM5kmhxKUTGYm83kb1wdz9qhRcg8d9G1xvyGuRqA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=iwPSRCeL7z8DATQdBskcL7zGCuTm+gcWRYxoKhfk3RRy4EK/dBTKNhcc71B/Jkp8D
	 z1AOlm1Zbqz3z1f0Kj4moytfVZmitSMMFAeQ3KP+ykKMWxXL2KAk0Fc/pvy4fY6iu+
	 O4W+rIAHli90Qr3B0812O5UArvAvHEbUytggw/8PKGEYX0saQJq2zbMcSL1dwqvPk0
	 N36MWMvi0bD7yET+x80GxnucCES+4PYHWecQykPiDF3x8jtTZXWTH1kLpf9Rbs2dkP
	 aXoeXFch5LMPIN12iwLCNgEgrump+TiKTt7VgDjHoAVDlBy3XFqmvIdEklU/LGSh/s
	 pj85xG9LrKWxQ==
Date: Fri, 14 Nov 2025 09:58:20 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 quic_jiaymao@quicinc.com, Konrad Dybcio <konradybcio@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 cheng.jiang@oss.qualcomm.com, devicetree@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, quic_shuaz@quicinc.com, 
 quic_chezhou@quicinc.com
To: Wei Deng <wei.deng@oss.qualcomm.com>
In-Reply-To: <20251113130519.2647081-1-wei.deng@oss.qualcomm.com>
References: <20251113130519.2647081-1-wei.deng@oss.qualcomm.com>
Message-Id: <176313578860.3262114.17056319042303889483.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: monaco-evk: Enable Bluetooth support


On Thu, 13 Nov 2025 18:35:19 +0530, Wei Deng wrote:
> There's a WCN6855 WiFi/Bluetooth module on an M.2 card. To make
> Bluetooth work, we need to define the necessary device tree nodes,
> including UART configuration and power supplies.
> 
> Since there is no standard M.2 binding in the device tree at present,
> the PMU is described using dedicated PMU nodes to represent the
> internal regulators required by the module.
> 
> The module provides a 3.3V supply, which originates from the
> main board’s 12V rail. To represent this power hierarchy in the device
> tree, add a fixed 12V regulator node as the DC-IN source and link it
> to the 3.3V regulator node.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 99 +++++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20251112 (exact match)
 Base: tags/next-20251112 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20251113130519.2647081-1-wei.deng@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/monaco-evk.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpcielp3-supply', 'vddpcielp9-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
arch/arm64/boot/dts/qcom/monaco-evk.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpcie1p3-supply' is a required property
	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
arch/arm64/boot/dts/qcom/monaco-evk.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpcie1p9-supply' is a required property
	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml






