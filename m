Return-Path: <linux-arm-msm+bounces-81038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C028BC473D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 15:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2851E4ED955
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 14:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34330314B76;
	Mon, 10 Nov 2025 14:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZBkHe/p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0101430C630;
	Mon, 10 Nov 2025 14:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762785280; cv=none; b=ng5/iq7o7sX+O3cmA4AEc0/OsRYL2538R3JOjVxOMy2stLY+Us1RhZrv4PeWMTZFsRA8FYjqR5QdRRiGcR+OdmLNc8Z69klY3NhUDCkZe67TnQ4peGQnYT2rdLh3JHXKw+sMUcNx+hV2i3Iek1CaLOy1O0fKUd8kL43RSCZoZjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762785280; c=relaxed/simple;
	bh=tbLSKTw5AUf6TNZDLnvM5iO0QJwGxY8JMEutVZVGHDU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=uZpDDyuUTW8tFrv2DapYT0zO74XyPNUWKpYTszMFHKcKVt57SLrrnaA4jbOkurZ4v9954B+afHsE05sPg6urfX76o1F06PTG5q7wiqMPELYy1inaHz6WJK1c/nPe3DSIG173L0sfmG64TXUdZRfBfAvMulKc92+EVcPQqJOovb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZBkHe/p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46ABEC116B1;
	Mon, 10 Nov 2025 14:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762785279;
	bh=tbLSKTw5AUf6TNZDLnvM5iO0QJwGxY8JMEutVZVGHDU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=aZBkHe/pxy0wOC+B2RVIw8KwW0hbyTXws6hnxhGsKBGdbUwkIvKSRe7dqMkQWPACP
	 DWc/GhOMK0xu1w8a5Y4ztWPH2SVsWwf103ok2KOk0xRg/028U7RHD/pbJ2jYI5PGjB
	 oxnnCs+YKWNat8TxOXCNxxJL47OzMo+xNoWCitzQyYlqLq6leE2UIcLtIm1uJzhMg1
	 lov4m0m1PLwEd/0f5UOtKVrHHcdrmT7LO2ZHV/5K1r5wcuKl5X7FiHlcrVyG0ydYii
	 eGvFeHlFRonezSSnJowJIul7cM+/3ubZak5mj2ES65BK5L/oQwIHkqBJF+dYgokdiE
	 3oe4NJopE3qjA==
Date: Mon, 10 Nov 2025 08:34:37 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, cheng.jiang@oss.qualcomm.com, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
 quic_jiaymao@quicinc.com, linux-arm-msm@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, quic_shuaz@quicinc.com, 
 quic_chezhou@quicinc.com, Konrad Dybcio <konradybcio@kernel.org>
To: Wei Deng <wei.deng@oss.qualcomm.com>
In-Reply-To: <20251110055709.319587-1-wei.deng@oss.qualcomm.com>
References: <20251110055709.319587-1-wei.deng@oss.qualcomm.com>
Message-Id: <176278493491.154705.438976021468566948.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: lemans-evk: Enable Bluetooth support


On Mon, 10 Nov 2025 11:27:09 +0530, Wei Deng wrote:
> There's a WCN6855 WiFi/Bluetooth module on an M.2 card. To make
> Bluetooth work, we need to define the necessary device tree nodes,
> including UART configuration and power supplies.
> 
> Since there is no standard M.2 binding in the device tree at present,
> the PMU is described using dedicated PMU nodes to represent the
> internal regulators required by the module.
> 
> The 3.3V supply for the module is assumed to come directly from the
> main board supply, which is 12V. To model this in the device tree, we
> add a fixed 12V regulator node as the DC-IN source and connect it to
> the 3.3V regulator node.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 115 ++++++++++++++++++++++++
>  1 file changed, 115 insertions(+)
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
 Base: tags/next-20251107 (exact match)
 Base: tags/next-20251107 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20251110055709.319587-1-wei.deng@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/lemans-evk.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpcielp3-supply', 'vddpcielp9-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
arch/arm64/boot/dts/qcom/lemans-evk.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpcie1p3-supply' is a required property
	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
arch/arm64/boot/dts/qcom/lemans-evk.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpcie1p9-supply' is a required property
	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml






