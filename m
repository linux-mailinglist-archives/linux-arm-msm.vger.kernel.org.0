Return-Path: <linux-arm-msm+bounces-49378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B8CA44C2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 21:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2CC81887992
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 20:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3EFF213E77;
	Tue, 25 Feb 2025 20:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a+UcbtG+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA55320FA9B;
	Tue, 25 Feb 2025 20:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740514360; cv=none; b=BU3Iae/vwD2fh7AuSiIKlxXZ+U4gmne+GB9iP5nfHHzq1MG2Xvcp0NCiECfJriFeHmw3IM0nVoIlADtLOmGv5gLacYXrkFC4pj3M+dXimTpLcsY4ckN8y8n8ZJm5XqoEZjQXGhguNjp2Z4miiWo/wLbXHBc5cdvqV+TQC46DvZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740514360; c=relaxed/simple;
	bh=99LcRHzUVhrgbZQn5RRuqQo9LaDxdVmOTskG7IMROYA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=JWEE9ylDUhy3JLp2EFJ1uye/vAnG3qRKFwWHSRDIZlwp9OegiRakoib4JLqphHDBOqLx8daRPhhiBm7ciW4fMwdw2z2mEjykU5JRhxG9XZTwLS1uv5wCmznovNKX1YTrwfk4RA0mAESoREPS5GRrUfCqFa29CajgxAvz5zTbnNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a+UcbtG+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18661C4CEDD;
	Tue, 25 Feb 2025 20:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740514360;
	bh=99LcRHzUVhrgbZQn5RRuqQo9LaDxdVmOTskG7IMROYA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=a+UcbtG+Gwfj11Di6hdk4tsfTe23PqGFBi0vLamUZP0Teo/IQ/o1h9Io4E9T9/0u6
	 i5G3nkKxrMsGIdqLYdlDQs1Znc0IikhWToUvLNiW+r9GYzGVNgwlg8dSsbxqgmrUyJ
	 TIYNBjpO8r2Qxaa26p0bOm1U2FzeK2d9zDbBy1ZzjWxgtJzMKUytlLM0FZ0s5w1cUQ
	 be0FlYvEdQCH0sWmFgeNxGVpPonyEXlCWKBO7N+3NUqVhkWsvjzg96u6xgpr8dKxb2
	 AB0eHUTkAadAPozWrMPD2Vap+RCNLAOL3KGEbcahDEGe1d1jaCgR1Xr012YQ84g2rv
	 CfM5gTDZqKwjg==
Date: Tue, 25 Feb 2025 14:12:38 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: wctrl <wctrl@proton.me>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
To: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <20250225-expressatt-tsens-v1-1-024bee5f2047@gmail.com>
References: <20250225-expressatt-tsens-v1-1-024bee5f2047@gmail.com>
Message-Id: <174051415447.2972069.2313553732301465230.robh@kernel.org>
Subject: Re: [PATCH] ARM: dts: qcom: msm8960: add tsens


On Tue, 25 Feb 2025 01:19:44 -0800, Rudraksha Gupta wrote:
> Copy tsens node from ap8064 and adjust some values
> 
> Co-developed-by: wctrl <wctrl@proton.me>
> Signed-off-by: wctrl <wctrl@proton.me>
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 62 +++++++++++++++++++++++++++++++-
>  1 file changed, 61 insertions(+), 1 deletion(-)
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/qcom/' for 20250225-expressatt-tsens-v1-1-024bee5f2047@gmail.com:

arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dtb: efuse@700000: compatible:0: 'qcom,qfprom' is not one of ['qcom,apq8064-qfprom', 'qcom,apq8084-qfprom', 'qcom,ipq5332-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,msm8226-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom', 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qcom,qcs404-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfprom', 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qcom,sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375-qfprom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom', 'qcom,sm8550-qfprom', 'qcom,sm8650-qfprom']
	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dtb: efuse@700000: compatible: ['qcom,qfprom'] is too short
	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dtb: efuse@700000: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dtb: efuse@700000: compatible:0: 'qcom,qfprom' is not one of ['qcom,apq8064-qfprom', 'qcom,apq8084-qfprom', 'qcom,ipq5332-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,msm8226-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom', 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qcom,qcs404-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfprom', 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qcom,sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375-qfprom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom', 'qcom,sm8550-qfprom', 'qcom,sm8650-qfprom']
	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dtb: efuse@700000: compatible: ['qcom,qfprom'] is too short
	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dtb: efuse@700000: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#






