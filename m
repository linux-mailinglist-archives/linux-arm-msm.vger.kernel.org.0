Return-Path: <linux-arm-msm+bounces-81039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E6AC473D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 15:36:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02ABE3B2413
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 14:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8BCD3161AC;
	Mon, 10 Nov 2025 14:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="euMn4C7Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC5F31619C;
	Mon, 10 Nov 2025 14:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762785281; cv=none; b=Dj6WJQmsnBtrNm3CCTxAyzWfOMtfCjJ/wWYqNUC7IyIKGAX1iBMuGHxEskMMsQ7vJm+Rh7wKYi71argE8cO7AWamJCJlx9sMfGVruqO3RrYeD0jtE+lyqN3v4LGH7725pfBaFAh4y70Tp++jFfLjoHiESfl2riFIKdEs7xECXGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762785281; c=relaxed/simple;
	bh=p5mOTbv6oa2TepVbieNtqJBJqKXg2bBu1I5v+nPHcnM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=YNwvHO6acfq7v6pDfWuXy2ob7xuj6K3Nhi+OKnhKn0kSz7d5FKg8YalQ+XQ4Oc5Js3SpVkaV/RMlMwcSl2ZMldOvkT8AkWT1qfU95E1kj4Axl2X+bhRSWGpiW9V0NxaL9Kkuvm+mJurZYw6qFICToIpiZifWyVJqYNyJt0ft4hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=euMn4C7Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E23C19425;
	Mon, 10 Nov 2025 14:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762785281;
	bh=p5mOTbv6oa2TepVbieNtqJBJqKXg2bBu1I5v+nPHcnM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=euMn4C7Q43tiwHmRBmQquN7ZxYM2OPEpgeGPiLC3VODrf/x+vYfPhwHK+/UHZ3bjZ
	 21jeYF1BaIlmG8n7DH+JnnxsHuMrQj+Ng+EVSDGEAjiT1QcpSThMl5+ogdhUnXTUI0
	 N9YI+95knzD8QcsgmCczPEcMLgBOAX7E1intZ2vB5FL54CNfh5f4ep/UDo7sWiQ63M
	 58d+5Flsj61QNSw6I3/8i13SNYhAhnNRgFgXsP73VCWImNWTxNw546SCW8WuVctJtg
	 5N8EA84hsoKhOu2L6mN86DAAg/KLudpnyrsyObvvtdFpAT4fYCqTrPtP+RfdFJ26BO
	 5wRPbZpxCA09g==
Date: Mon, 10 Nov 2025 08:34:39 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 quic_rampraka@quicinc.com, kernel@oss.qualcomm.com, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
 quic_nguyenb@quicinc.com, Bjorn Andersson <andersson@kernel.org>, 
 quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com, 
 quic_pragalla@quicinc.com, quic_bhaskarv@quicinc.com
To: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
In-Reply-To: <20251110085013.802976-1-sarthak.garg@oss.qualcomm.com>
References: <20251110085013.802976-1-sarthak.garg@oss.qualcomm.com>
Message-Id: <176278493549.154734.6896546468288117637.robh@kernel.org>
Subject: Re: [PATCH V4 0/3] Add SD Card support for sm8750 SoC and boards


On Mon, 10 Nov 2025 14:20:10 +0530, Sarthak Garg wrote:
> Add SD Card support for sm8750 SoC, including MTP and QRD boards.
> 
> - Changed from v3
>     - As suggested by Krzysztof Kozlowski refactor the code to follow
>       DTS coding style and use hex everywhere in reg.
> 
> - Changed from v2
>     - As suggested by Abel Vesa move the GPIO configuration for SD card
>       detection (specifically the pin settings for gpio55) from the
>       SoC-level device tree (sm8750.dtsi) to the board-specific device
>       tree files.
> 
> - Changed from v1
>     - As suggested by Konrad Dybcio the patch into separate commits per
>       board and did formatting improvements (e.g. aligning < symbols,
>       placing each item on a new line).
>     - Addressed Konrad Dybcio comment to use SVS_L1 for opp-202000000.
> 
> Sarthak Garg (3):
>   arm64: dts: qcom: sm8750: Add SDC2 nodes for sm8750 soc
>   arm64: dts: qcom: sm8750-mtp: Add SDC2 node for sm8750 mtp board
>   arm64: dts: qcom: sm8750-qrd: Add SDC2 node for sm8750 qrd board
> 
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 23 +++++++++++
>  arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 23 +++++++++++
>  arch/arm64/boot/dts/qcom/sm8750.dtsi    | 54 +++++++++++++++++++++++++
>  3 files changed, 100 insertions(+)
> 
> --
> 2.34.1
> 
> 
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
 Base: tags/v6.18-rc1-53-gc2703c90161b (exact match)
 Base: tags/v6.18-rc1-53-gc2703c90161b (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20251110085013.802976-1-sarthak.garg@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: mmc@8804000 (qcom,sm8750-sdhci): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sm8750-sdhci', 'qcom,sdhci-msm-v5'] is too long
	'qcom,sm8750-sdhci' is not one of ['qcom,sdhci-msm-v4']
	'qcom,sm8750-sdhci' is not one of ['qcom,apq8084-sdhci', 'qcom,ipq4019-sdhci', 'qcom,ipq8074-sdhci', 'qcom,msm8226-sdhci', 'qcom,msm8953-sdhci', 'qcom,msm8974-sdhci', 'qcom,msm8976-sdhci', 'qcom,msm8916-sdhci', 'qcom,msm8992-sdhci', 'qcom,msm8994-sdhci', 'qcom,msm8996-sdhci', 'qcom,msm8998-sdhci']
	'qcom,sm8750-sdhci' is not one of ['qcom,ipq5018-sdhci', 'qcom,ipq5332-sdhci', 'qcom,ipq5424-sdhci', 'qcom,ipq6018-sdhci', 'qcom,ipq9574-sdhci', 'qcom,milos-sdhci', 'qcom,qcm2290-sdhci', 'qcom,qcs404-sdhci', 'qcom,qcs615-sdhci', 'qcom,qcs8300-sdhci', 'qcom,qdu1000-sdhci', 'qcom,sa8775p-sdhci', 'qcom,sar2130p-sdhci', 'qcom,sc7180-sdhci', 'qcom,sc7280-sdhci', 'qcom,sc8280xp-sdhci', 'qcom,sdm630-sdhci', 'qcom,sdm670-sdhci', 'qcom,sdm845-sdhci', 'qcom,sdx55-sdhci', 'qcom,sdx65-sdhci', 'qcom,sdx75-sdhci', 'qcom,sm6115-sdhci', 'qcom,sm6125-sdhci', 'qcom,sm6350-sdhci', 'qcom,sm6375-sdhci', 'qcom,sm7150-sdhci', 'qcom,sm8150-sdhci', 'qcom,sm8250-sdhci', 'qcom,sm8350-sdhci', 'qcom,sm8450-sdhci', 'qcom,sm8550-sdhci', 'qcom,sm8650-sdhci', 'qcom,x1e80100-sdhci']
	'qcom,sdhci-msm-v4' was expected
	from schema $id: http://devicetree.org/schemas/mmc/sdhci-msm.yaml
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/mmc@8804000: failed to match any schema with compatible: ['qcom,sm8750-sdhci', 'qcom,sdhci-msm-v5']
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: mmc@8804000 (qcom,sm8750-sdhci): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sm8750-sdhci', 'qcom,sdhci-msm-v5'] is too long
	'qcom,sm8750-sdhci' is not one of ['qcom,sdhci-msm-v4']
	'qcom,sm8750-sdhci' is not one of ['qcom,apq8084-sdhci', 'qcom,ipq4019-sdhci', 'qcom,ipq8074-sdhci', 'qcom,msm8226-sdhci', 'qcom,msm8953-sdhci', 'qcom,msm8974-sdhci', 'qcom,msm8976-sdhci', 'qcom,msm8916-sdhci', 'qcom,msm8992-sdhci', 'qcom,msm8994-sdhci', 'qcom,msm8996-sdhci', 'qcom,msm8998-sdhci']
	'qcom,sm8750-sdhci' is not one of ['qcom,ipq5018-sdhci', 'qcom,ipq5332-sdhci', 'qcom,ipq5424-sdhci', 'qcom,ipq6018-sdhci', 'qcom,ipq9574-sdhci', 'qcom,milos-sdhci', 'qcom,qcm2290-sdhci', 'qcom,qcs404-sdhci', 'qcom,qcs615-sdhci', 'qcom,qcs8300-sdhci', 'qcom,qdu1000-sdhci', 'qcom,sa8775p-sdhci', 'qcom,sar2130p-sdhci', 'qcom,sc7180-sdhci', 'qcom,sc7280-sdhci', 'qcom,sc8280xp-sdhci', 'qcom,sdm630-sdhci', 'qcom,sdm670-sdhci', 'qcom,sdm845-sdhci', 'qcom,sdx55-sdhci', 'qcom,sdx65-sdhci', 'qcom,sdx75-sdhci', 'qcom,sm6115-sdhci', 'qcom,sm6125-sdhci', 'qcom,sm6350-sdhci', 'qcom,sm6375-sdhci', 'qcom,sm7150-sdhci', 'qcom,sm8150-sdhci', 'qcom,sm8250-sdhci', 'qcom,sm8350-sdhci', 'qcom,sm8450-sdhci', 'qcom,sm8550-sdhci', 'qcom,sm8650-sdhci', 'qcom,x1e80100-sdhci']
	'qcom,sdhci-msm-v4' was expected
	from schema $id: http://devicetree.org/schemas/mmc/sdhci-msm.yaml
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/mmc@8804000: failed to match any schema with compatible: ['qcom,sm8750-sdhci', 'qcom,sdhci-msm-v5']






