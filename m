Return-Path: <linux-arm-msm+bounces-33888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B46C69989DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 16:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22EFF28AC1B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 14:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F9E1CF5E2;
	Thu, 10 Oct 2024 14:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qg1izdjK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB57DD2E5;
	Thu, 10 Oct 2024 14:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728570606; cv=none; b=X8rpCcxnjtlI6aBEZlaUwF0QpbWt/AhucgF4fnpVPni0b+LTtrFI1MMqccB2u7zbBIpjMoyF2HeWrSiuJQdl7oeqAgKmGFpyIMs/QAzW8PAdwl19uubicJyFIwY187lrt8q3lpX/sdHR8gNf7DTyZ183OoSzD3mI0wVnNiYAYAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728570606; c=relaxed/simple;
	bh=ZjnBfhtTGf98CC134qaisxbxyP7NLl7h2jd7A1hCd54=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=Z5+VGZ+pgPy1qkU6RsuVJJOqVUspGvb0sDRuq5ludI0130ryJcVhm6kSF4yxGLQvvmz1XeHcToiXgk5HGYfdbopq3tnv/MxgMrfq+e76sqaiedfYHhMXseR3UIiVSY1pnlBa/ev8hdQR/4t/oOvNuJVKspeDNiJqcSF91rYPCPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qg1izdjK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 302F1C4CECE;
	Thu, 10 Oct 2024 14:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728570606;
	bh=ZjnBfhtTGf98CC134qaisxbxyP7NLl7h2jd7A1hCd54=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=qg1izdjKZgk+aBKadkD8nNo3MespMsAwGPUrIzrgO2TjkgobxISZOpdpzcPDWbEXH
	 vDhYk2AjaMQ0yOI2vLF9lpomjpS0cSVIKl2aIvuRsYTR0Dp6iCQrlX/13aChfhtMD2
	 lpD+Fqd0KMIuUd6gvVX3srBcruq868X7WcgTu3aJfve/dJhVFX/0DjQnCM/rkrgekM
	 5Tp5IIpj8u59TM/WIXlnVEHx39kojIRfXaKRJEszWjAXpXrnL2qnNQNbsqQxy72IYl
	 vX/JnMoUbBW4p/P5UbQ6RFVaWAKzw7zHbIC8AOiLXOlK2oOWeJKi/3Huph4WV4b0bh
	 OvYh/VeYuOGXg==
Date: Thu, 10 Oct 2024 09:30:05 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, quic_hbandi@quicinc.com, 
 quic_mohamull@quicinc.com, devicetree@vger.kernel.org
In-Reply-To: <20241010105107.30118-1-quic_janathot@quicinc.com>
References: <20241010105107.30118-1-quic_janathot@quicinc.com>
Message-Id: <172857035921.1533190.548906602985416433.robh@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: enable Bluetooth


On Thu, 10 Oct 2024 16:21:07 +0530, Janaki Ramaiah Thota wrote:
> Add Bluetooth and UART7 support for qcs6490-rb3gen2.
> 
> Signed-off-by: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 122 ++++++++++++++++++-
>  1 file changed, 121 insertions(+), 1 deletion(-)
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


New warnings running 'make CHECK_DTBS=y qcom/qcs6490-rb3gen2.dtb' for 20241010105107.30118-1-quic_janathot@quicinc.com:

arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: bluetooth: 'vddio-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#






