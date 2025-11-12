Return-Path: <linux-arm-msm+bounces-81438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD090C52EE3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 16:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB29F505E4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 14:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48EF133A030;
	Wed, 12 Nov 2025 14:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IjNF7uqq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18580339B44;
	Wed, 12 Nov 2025 14:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762957614; cv=none; b=M3dYy2PGCp82L1eHzdRtdNUQHETqz2wY8vvK402b1cWPkRr7kxmOGyEznqDLa0gN3wEHsSuPUsRtwYoC3Thn+2eEBiOOx5nAjCoywa3iIRAzIrj60bfkhbTneO2MLevhxQbzb4wDy1IV/X3G0tyqY/Lsnzu2xxZYHx03RT3swCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762957614; c=relaxed/simple;
	bh=H2w2LdgGmezNcpuEixmnvVoao2GmwFUKtVrfj1/uvXs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=bP20CXAvlXsqDN1eOV973XrLxza6M2uBd9fG++MSpSjcNv8tBGgB5IHBzH/5iLPz3L52KjCYNbT1hGfspk0l2g/vEOXtUvUezyj8pbkXfLlWPTd/2YDK+HDXuXh9iJIWQMnFM/xuB/ryvUztMFza4FFzvpK7qk5f9rHDMcdf+MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IjNF7uqq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66280C4CEF7;
	Wed, 12 Nov 2025 14:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762957613;
	bh=H2w2LdgGmezNcpuEixmnvVoao2GmwFUKtVrfj1/uvXs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=IjNF7uqqNg5rrKU/aLdvqUsFeBdhedBmMfNzyX0WYxgSDCdHq8LUGYVnCl0ee2RaI
	 vqugYI+Wm/QG9fGt0byyDrtNCwuipOx3dEtJzP73FN/Ta9b0C07/V7zeSMkE6mXful
	 +oNX3IQtr7X2veplfVe31J0NX7zH1CB9POYPnqNOdMDZsKf3i2Jm3LD/1IRXunODL7
	 r83SUqmvUSSgWToyW8UpLcRzc3erMJFHoCINdohZ+h2Ahg0Je6ViYZ+p4exDCXtq6h
	 9Bn87hvTtMLuBsZa4P96xo5rJAnJhCViV09X1cJuMMdL9jskDN+PR9D7gStgarHzkq
	 GXIFRiEMfg4hw==
Date: Wed, 12 Nov 2025 08:26:52 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, quic_shuaz@quicinc.com, 
 quic_chezhou@quicinc.com, Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 cheng.jiang@oss.qualcomm.com, quic_jiaymao@quicinc.com, 
 devicetree@vger.kernel.org
To: Wei Deng <wei.deng@oss.qualcomm.com>
In-Reply-To: <20251112071147.1450258-1-wei.deng@oss.qualcomm.com>
References: <20251112071147.1450258-1-wei.deng@oss.qualcomm.com>
Message-Id: <176295563483.1637887.5249582727821921773.robh@kernel.org>
Subject: Re: [PATCH v2 0/1] arm64: dts: qcom: lemans-evk: Enable Bluetooth
 support


On Wed, 12 Nov 2025 12:41:46 +0530, Wei Deng wrote:
> Changes for v2
> - Update commit message
> - Remove qup_uart17 settings
> - Remove CC stable
> - V1 link
>   https://lore.kernel.org/all/20251110055709.319587-1-wei.deng@oss.qualcomm.com/
> 
> Wei Deng (1):
>   arm64: dts: qcom: lemans-evk: Enable Bluetooth support
> 
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 99 +++++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
> 
> --
> 2.25.1
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
 Base: tags/next-20251112 (exact match)
 Base: tags/next-20251112 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20251112071147.1450258-1-wei.deng@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/lemans-evk.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpcielp3-supply', 'vddpcielp9-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
arch/arm64/boot/dts/qcom/lemans-evk.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpcie1p3-supply' is a required property
	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
arch/arm64/boot/dts/qcom/lemans-evk.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpcie1p9-supply' is a required property
	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml






