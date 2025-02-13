Return-Path: <linux-arm-msm+bounces-47940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A76A34BEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 18:30:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 595A03B2B7B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 17:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07F6F241664;
	Thu, 13 Feb 2025 17:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K8PYXS82"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF68227E88;
	Thu, 13 Feb 2025 17:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739467354; cv=none; b=Loml1M2q60SRF7LVeAd/xlhgeGti3DfVPaytbAlqAJKtxO/4MXKPbi1RYKwnqccJsu3msyjbShfhW4y3mdCM7ihyCw4HjyUXhIaEEMXoCt3MmYljBrEL7919nGBsQIgfh+U0dTf6lMRzGq7sRJw9PjfgNH0U5kna5yJ3JQKUCZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739467354; c=relaxed/simple;
	bh=dg3uCXf9z6cOpjMiUbgRboLDf+i4WAFgFcuvCDu2ExY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=An7Yulnyw9QXdBn+o0xy31cY601DR+lauJjSRWv2lEWZ0DDm+6ixReSQPoOrJi/k2Ss/gyAT8D7er+ZdCEtVtSEFvybLn6lNaUUkew9Ape6mA8sLPyGtq2u7SB8A6VG+fP2F8Xar4Ibhn/CrbKlPDxFpxeDLsrOhG37HD1+KMHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K8PYXS82; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5465AC4CEE4;
	Thu, 13 Feb 2025 17:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739467352;
	bh=dg3uCXf9z6cOpjMiUbgRboLDf+i4WAFgFcuvCDu2ExY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=K8PYXS82/nuQg4r5W4GWrMcmx/yoBOAL26hmJ6v9Ytl6+7MskbsDVz6Th4oqWxAps
	 PuJ8GAfQo5Z5qg5W3d3eOa3HccLdXnLHKenCbepTfan0D2GO9zFFySvdH6KlfmVdVW
	 lDVIKlNDJYE8kp30EFwMSTFCFOPnN2fs+ayxuHYBVllQ3ulodl8vRuH9gOi/PtdSpV
	 0xFbpMFW3hUKGz/S7c+xUrnyyDg83+4oGgoKOnL8cL2eD7FFD0CWndlB/d4vD6kyOB
	 xB1c48AwqHQSXCzWu+g5Dk492tiiaKbxda/pMH29qofGBozU9TvZpXkYWyLXaFdHek
	 K3zQAkZh+HXOA==
Date: Thu, 13 Feb 2025 11:22:31 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Johan Hovold <johan@kernel.org>, 
 devicetree@vger.kernel.org
To: Abel Vesa <abel.vesa@linaro.org>
In-Reply-To: <20250213-x1e80100-crypto-v1-1-f93afdd4025a@linaro.org>
References: <20250213-x1e80100-crypto-v1-1-f93afdd4025a@linaro.org>
Message-Id: <173946704595.3328795.16013136953508519840.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Add crypto engine


On Thu, 13 Feb 2025 14:44:02 +0200, Abel Vesa wrote:
> On X Elite, there is a crypto engine IP block similar to ones found on
> SM8x50 platforms.
> 
> Describe the crypto engine and its BAM.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> https://lore.kernel.org/all/20250213-dt-bindings-qcom-qce-x1e80100-v1-1-d17ef73a1c12@linaro.org/
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250213-x1e80100-crypto-v1-1-f93afdd4025a@linaro.org:

arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,x1e80100-qce', 'qcom,sm8150-qce', 'qcom,qce'] is too long
	'qcom,crypto-v5.1' was expected
	'qcom,crypto-v5.4' was expected
	'qcom,x1e80100-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
	'qcom,x1e80100-qce' is not one of ['qcom,ipq6018-qce', 'qcom,ipq8074-qce', 'qcom,ipq9574-qce', 'qcom,msm8996-qce', 'qcom,qcm2290-qce', 'qcom,sdm845-qce', 'qcom,sm6115-qce']
	'qcom,x1e80100-qce' is not one of ['qcom,qcs8300-qce', 'qcom,sa8775p-qce', 'qcom,sc7280-qce', 'qcom,sm6350-qce', 'qcom,sm8250-qce', 'qcom,sm8350-qce', 'qcom,sm8450-qce', 'qcom,sm8550-qce', 'qcom,sm8650-qce', 'qcom,sm8750-qce']
	'qcom,qce' was expected
	'qcom,ipq4019-qce' was expected
	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: /soc@0/crypto@1dfa000: failed to match any schema with compatible: ['qcom,x1e80100-qce', 'qcom,sm8150-qce', 'qcom,qce']
arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,x1e80100-qce', 'qcom,sm8150-qce', 'qcom,qce'] is too long
	'qcom,crypto-v5.1' was expected
	'qcom,crypto-v5.4' was expected
	'qcom,x1e80100-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
	'qcom,x1e80100-qce' is not one of ['qcom,ipq6018-qce', 'qcom,ipq8074-qce', 'qcom,ipq9574-qce', 'qcom,msm8996-qce', 'qcom,qcm2290-qce', 'qcom,sdm845-qce', 'qcom,sm6115-qce']
	'qcom,x1e80100-qce' is not one of ['qcom,qcs8300-qce', 'qcom,sa8775p-qce', 'qcom,sc7280-qce', 'qcom,sm6350-qce', 'qcom,sm8250-qce', 'qcom,sm8350-qce', 'qcom,sm8450-qce', 'qcom,sm8550-qce', 'qcom,sm8650-qce', 'qcom,sm8750-qce']
	'qcom,qce' was expected
	'qcom,ipq4019-qce' was expected
	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml#
arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/crypto@1dfa000: failed to match any schema with compatible: ['qcom,x1e80100-qce', 'qcom,sm8150-qce', 'qcom,qce']
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,x1e80100-qce', 'qcom,sm8150-qce', 'qcom,qce'] is too long
	'qcom,crypto-v5.1' was expected
	'qcom,crypto-v5.4' was expected
	'qcom,x1e80100-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
	'qcom,x1e80100-qce' is not one of ['qcom,ipq6018-qce', 'qcom,ipq8074-qce', 'qcom,ipq9574-qce', 'qcom,msm8996-qce', 'qcom,qcm2290-qce', 'qcom,sdm845-qce', 'qcom,sm6115-qce']
	'qcom,x1e80100-qce' is not one of ['qcom,qcs8300-qce', 'qcom,sa8775p-qce', 'qcom,sc7280-qce', 'qcom,sm6350-qce', 'qcom,sm8250-qce', 'qcom,sm8350-qce', 'qcom,sm8450-qce', 'qcom,sm8550-qce', 'qcom,sm8650-qce', 'qcom,sm8750-qce']
	'qcom,qce' was expected
	'qcom,ipq4019-qce' was expected
	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml#
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: /soc@0/crypto@1dfa000: failed to match any schema with compatible: ['qcom,x1e80100-qce', 'qcom,sm8150-qce', 'qcom,qce']
arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,x1e80100-qce', 'qcom,sm8150-qce', 'qcom,qce'] is too long
	'qcom,crypto-v5.1' was expected
	'qcom,crypto-v5.4' was expected
	'qcom,x1e80100-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
	'qcom,x1e80100-qce' is not one of ['qcom,ipq6018-qce', 'qcom,ipq8074-qce', 'qcom,ipq9574-qce', 'qcom,msm8996-qce', 'qcom,qcm2290-qce', 'qcom,sdm845-qce', 'qcom,sm6115-qce']
	'qcom,x1e80100-qce' is not one of ['qcom,qcs8300-qce', 'qcom,sa8775p-qce', 'qcom,sc7280-qce', 'qcom,sm6350-qce', 'qcom,sm8250-qce', 'qcom,sm8350-qce', 'qcom,sm8450-qce', 'qcom,sm8550-qce', 'qcom,sm8650-qce', 'qcom,sm8750-qce']
	'qcom,qce' was expected
	'qcom,ipq4019-qce' was expected
	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: /soc@0/crypto@1dfa000: failed to match any schema with compatible: ['qcom,x1e80100-qce', 'qcom,sm8150-qce', 'qcom,qce']
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,x1e80100-qce', 'qcom,sm8150-qce', 'qcom,qce'] is too long
	'qcom,crypto-v5.1' was expected
	'qcom,crypto-v5.4' was expected
	'qcom,x1e80100-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
	'qcom,x1e80100-qce' is not one of ['qcom,ipq6018-qce', 'qcom,ipq8074-qce', 'qcom,ipq9574-qce', 'qcom,msm8996-qce', 'qcom,qcm2290-qce', 'qcom,sdm845-qce', 'qcom,sm6115-qce']
	'qcom,x1e80100-qce' is not one of ['qcom,qcs8300-qce', 'qcom,sa8775p-qce', 'qcom,sc7280-qce', 'qcom,sm6350-qce', 'qcom,sm8250-qce', 'qcom,sm8350-qce', 'qcom,sm8450-qce', 'qcom,sm8550-qce', 'qcom,sm8650-qce', 'qcom,sm8750-qce']
	'qcom,qce' was expected
	'qcom,ipq4019-qce' was expected
	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml#
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/crypto@1dfa000: failed to match any schema with compatible: ['qcom,x1e80100-qce', 'qcom,sm8150-qce', 'qcom,qce']
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,x1e80100-qce', 'qcom,sm8150-qce', 'qcom,qce'] is too long
	'qcom,crypto-v5.1' was expected
	'qcom,crypto-v5.4' was expected
	'qcom,x1e80100-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
	'qcom,x1e80100-qce' is not one of ['qcom,ipq6018-qce', 'qcom,ipq8074-qce', 'qcom,ipq9574-qce', 'qcom,msm8996-qce', 'qcom,qcm2290-qce', 'qcom,sdm845-qce', 'qcom,sm6115-qce']
	'qcom,x1e80100-qce' is not one of ['qcom,qcs8300-qce', 'qcom,sa8775p-qce', 'qcom,sc7280-qce', 'qcom,sm6350-qce', 'qcom,sm8250-qce', 'qcom,sm8350-qce', 'qcom,sm8450-qce', 'qcom,sm8550-qce', 'qcom,sm8650-qce', 'qcom,sm8750-qce']
	'qcom,qce' was expected
	'qcom,ipq4019-qce' was expected
	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/crypto@1dfa000: failed to match any schema with compatible: ['qcom,x1e80100-qce', 'qcom,sm8150-qce', 'qcom,qce']
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,x1e80100-qce', 'qcom,sm8150-qce', 'qcom,qce'] is too long
	'qcom,crypto-v5.1' was expected
	'qcom,crypto-v5.4' was expected
	'qcom,x1e80100-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
	'qcom,x1e80100-qce' is not one of ['qcom,ipq6018-qce', 'qcom,ipq8074-qce', 'qcom,ipq9574-qce', 'qcom,msm8996-qce', 'qcom,qcm2290-qce', 'qcom,sdm845-qce', 'qcom,sm6115-qce']
	'qcom,x1e80100-qce' is not one of ['qcom,qcs8300-qce', 'qcom,sa8775p-qce', 'qcom,sc7280-qce', 'qcom,sm6350-qce', 'qcom,sm8250-qce', 'qcom,sm8350-qce', 'qcom,sm8450-qce', 'qcom,sm8550-qce', 'qcom,sm8650-qce', 'qcom,sm8750-qce']
	'qcom,qce' was expected
	'qcom,ipq4019-qce' was expected
	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: /soc@0/crypto@1dfa000: failed to match any schema with compatible: ['qcom,x1e80100-qce', 'qcom,sm8150-qce', 'qcom,qce']
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,x1e80100-qce', 'qcom,sm8150-qce', 'qcom,qce'] is too long
	'qcom,crypto-v5.1' was expected
	'qcom,crypto-v5.4' was expected
	'qcom,x1e80100-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
	'qcom,x1e80100-qce' is not one of ['qcom,ipq6018-qce', 'qcom,ipq8074-qce', 'qcom,ipq9574-qce', 'qcom,msm8996-qce', 'qcom,qcm2290-qce', 'qcom,sdm845-qce', 'qcom,sm6115-qce']
	'qcom,x1e80100-qce' is not one of ['qcom,qcs8300-qce', 'qcom,sa8775p-qce', 'qcom,sc7280-qce', 'qcom,sm6350-qce', 'qcom,sm8250-qce', 'qcom,sm8350-qce', 'qcom,sm8450-qce', 'qcom,sm8550-qce', 'qcom,sm8650-qce', 'qcom,sm8750-qce']
	'qcom,qce' was expected
	'qcom,ipq4019-qce' was expected
	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: /soc@0/crypto@1dfa000: failed to match any schema with compatible: ['qcom,x1e80100-qce', 'qcom,sm8150-qce', 'qcom,qce']
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,x1e80100-qce', 'qcom,sm8150-qce', 'qcom,qce'] is too long
	'qcom,crypto-v5.1' was expected
	'qcom,crypto-v5.4' was expected
	'qcom,x1e80100-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
	'qcom,x1e80100-qce' is not one of ['qcom,ipq6018-qce', 'qcom,ipq8074-qce', 'qcom,ipq9574-qce', 'qcom,msm8996-qce', 'qcom,qcm2290-qce', 'qcom,sdm845-qce', 'qcom,sm6115-qce']
	'qcom,x1e80100-qce' is not one of ['qcom,qcs8300-qce', 'qcom,sa8775p-qce', 'qcom,sc7280-qce', 'qcom,sm6350-qce', 'qcom,sm8250-qce', 'qcom,sm8350-qce', 'qcom,sm8450-qce', 'qcom,sm8550-qce', 'qcom,sm8650-qce', 'qcom,sm8750-qce']
	'qcom,qce' was expected
	'qcom,ipq4019-qce' was expected
	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml#
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/crypto@1dfa000: failed to match any schema with compatible: ['qcom,x1e80100-qce', 'qcom,sm8150-qce', 'qcom,qce']
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,x1e80100-qce', 'qcom,sm8150-qce', 'qcom,qce'] is too long
	'qcom,crypto-v5.1' was expected
	'qcom,crypto-v5.4' was expected
	'qcom,x1e80100-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
	'qcom,x1e80100-qce' is not one of ['qcom,ipq6018-qce', 'qcom,ipq8074-qce', 'qcom,ipq9574-qce', 'qcom,msm8996-qce', 'qcom,qcm2290-qce', 'qcom,sdm845-qce', 'qcom,sm6115-qce']
	'qcom,x1e80100-qce' is not one of ['qcom,qcs8300-qce', 'qcom,sa8775p-qce', 'qcom,sc7280-qce', 'qcom,sm6350-qce', 'qcom,sm8250-qce', 'qcom,sm8350-qce', 'qcom,sm8450-qce', 'qcom,sm8550-qce', 'qcom,sm8650-qce', 'qcom,sm8750-qce']
	'qcom,qce' was expected
	'qcom,ipq4019-qce' was expected
	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: /soc@0/crypto@1dfa000: failed to match any schema with compatible: ['qcom,x1e80100-qce', 'qcom,sm8150-qce', 'qcom,qce']






