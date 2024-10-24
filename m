Return-Path: <linux-arm-msm+bounces-35716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F08E9AEC36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 18:33:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8E5D2832BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 16:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9490F1F9ECE;
	Thu, 24 Oct 2024 16:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZmbjSHUt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDE01F9EBA;
	Thu, 24 Oct 2024 16:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729787594; cv=none; b=Ls7rr2DKc7lrziX1bw9fhns+p/+64vFzSsw7dIfzTja9sl5mxopcbT/nlaKCKsSXNnmre0VONIpZVstdUmMmgIXI6B+G3HP03W26fRB2Ky7UTK84vHnJllDnNMTm51+AlwxoD5VxGxfY+6VuNKVbFAqVtba2iohpOTWp6+xvPZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729787594; c=relaxed/simple;
	bh=FIcRQO+kCQEFL2afrjHVG8Ze7q/76ICd1kQXy3KM+7s=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=ueVMGvrEVYY1YFuL6bg8XgrAE+rpVHdlqEvJaehXOMEPLsaaOgjgEVSmILBxOJ1KMQ0ADXoPWNRs3ZJr2J/R43E69hMZTUM4niQ377GOJBu9sQQan6Xop9FlwGDeQXlYxlv4a5yJ8h6juzd3zm0GltGBDW8eEtzUA1+xC2EiiEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZmbjSHUt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9512C4CEC7;
	Thu, 24 Oct 2024 16:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729787594;
	bh=FIcRQO+kCQEFL2afrjHVG8Ze7q/76ICd1kQXy3KM+7s=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=ZmbjSHUtSccGDj+iAwMVgT0KXsl5Wa7Ks13TZJ9+P06aqFTpRjhBgLeyetJuZMTme
	 IvrmMj2MVJcO8L5YwPHY7yZbh9XlACPDguZJjfthyv/cb4ZRGl7EQoDvoyK7K9OfqH
	 93XJFwMkNbVBtBDXaRHZtdVix369NxPmIwqbeaNA24UUqgdoQBG/jK7APFIhpDuvJA
	 zlwry/mv5GBbJ531zmHb4PU9CEsVGcymfLX9OszQYuICtTLCJ1skdoDXO6cRngVqGK
	 sGx9aplksQL1JsTjnJgLX/kPfWLbnzTI5UXpKMYI+5kgTB3kjBlqHobIIHHtp9NsvD
	 Q62hAWSLKYsIA==
Date: Thu, 24 Oct 2024 11:33:13 -0500
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
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, quic_mohamull@quicinc.com, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 quic_hbandi@quicinc.com, Konrad Dybcio <konradybcio@kernel.org>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20241022104600.3228-1-quic_janathot@quicinc.com>
References: <20241022104600.3228-1-quic_janathot@quicinc.com>
Message-Id: <172978739638.623476.7250803637358189207.robh@kernel.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: qcs6490-rb3gen2: enable Bluetooth


On Tue, 22 Oct 2024 16:16:00 +0530, Janaki Ramaiah Thota wrote:
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


New warnings running 'make CHECK_DTBS=y qcom/qcs6490-rb3gen2.dtb' for 20241022104600.3228-1-quic_janathot@quicinc.com:

arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: bluetooth: 'vddio-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#






