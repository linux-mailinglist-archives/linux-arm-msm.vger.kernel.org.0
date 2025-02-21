Return-Path: <linux-arm-msm+bounces-48974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA727A3FE5A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 19:11:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC64E7A4E20
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 18:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EE4B2528F5;
	Fri, 21 Feb 2025 18:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZZGK22V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547A42512C3;
	Fri, 21 Feb 2025 18:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740161469; cv=none; b=Mex5V7+klBwI9Cw5Q5fBqDDVnWEzRNRtbvvqtnz5ggJWhO1YGa5SsXGcVwkBXSzu6CmgHKh4ca+QezV1G7D49iptHyJhMtaCN3fTB5/WeLJ1SfqbLJldxTg206WJNxtxK3npwCkmmG+S5+E7H/5jwUSgLONMROXOgYpdAPhhAZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740161469; c=relaxed/simple;
	bh=EVmHHukyTUJx0XgJEoNyDZAx0PSmeLa2YBOQ2VU+sxw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=E79N8oMXUje/8F4Pss0qU4RF4DxawEIVJNg9RcSGZcB4KpXp5FKRnMkSVDZWnZ111p9LcPY7kMnTIMaYvMk9h7Fnb89IPEZkghYrjFYdmxOjjW3A9ccu7+vNdiDvxgrlQfX55UXO00W8ti67TcBr663JUQXSBKp+9rzgOxhhOlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZZGK22V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49F53C4AF0B;
	Fri, 21 Feb 2025 18:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740161468;
	bh=EVmHHukyTUJx0XgJEoNyDZAx0PSmeLa2YBOQ2VU+sxw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=JZZGK22VL9Uxg1/rwXjmZ5LhcuiPcm8xTpiAbFMyj/80C97sQEiw9oBqKbBly8yb8
	 o/hpYwzDy64Nt5s5BNjHTEI4fxXVnghuQyNcwYXdC6E9tQnNZxwgJ3a/dyYa9/u8JW
	 nnlRyw2eeGYd0HEmMT6KKcLC2u+gt7k8D22l7qUIDc1vy4KH3jbwS3WTM66I3SSzjH
	 OE8D+jc8ExAQarkMNWZGOFv2NjKULR6pJjAj+XF6soVXbUoQ28vzy+mMatoSEBMthL
	 858uWe4LgAhxkVAlMf5vlMb+lMqbq+xEsp+/FEjzDlfu5oti6oGdYRJXZmkJbXktJn
	 8/feN88D9ghNA==
Date: Fri, 21 Feb 2025 12:11:06 -0600
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
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
In-Reply-To: <20250221-x1e80100-crypto-v2-1-413ecf68dcd7@linaro.org>
References: <20250221-x1e80100-crypto-v2-1-413ecf68dcd7@linaro.org>
Message-Id: <174015998491.3469936.3508460058215477115.robh@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100: Add crypto engine


On Fri, 21 Feb 2025 15:07:03 +0200, Abel Vesa wrote:
> On X Elite, there is a crypto engine IP block similar to ones found on
> SM8x50 platforms.
> 
> Describe the crypto engine and its BAM.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> The dt-binding schema update for the x1e80100 compatible is here
> (already picked up):
> 
> https://lore.kernel.org/all/20250213-dt-bindings-qcom-qce-x1e80100-v1-1-d17ef73a1c12@linaro.org/
> ---
> Changes in v2:
> - Added EE and channels numbers in BAM node, like Stephan suggested.
> - Added v1.7.4 compatible as well.
> - Link to v1: https://lore.kernel.org/r/20250213-x1e80100-crypto-v1-1-f93afdd4025a@linaro.org
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250221-x1e80100-crypto-v2-1-413ecf68dcd7@linaro.org:

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






