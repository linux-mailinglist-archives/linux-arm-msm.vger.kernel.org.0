Return-Path: <linux-arm-msm+bounces-33722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9047996F67
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 17:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 850F51F21BEC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 15:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A631DFE22;
	Wed,  9 Oct 2024 15:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IeGuY5Ta"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C84161313;
	Wed,  9 Oct 2024 15:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728486477; cv=none; b=rwsg5v98+qE8GGnrqkffahveMmxZ3Veh9ZlqLAzqokJLat66gvgnFkt4V1EiCHv9Evz+v7As5vyuv+DWec41acH0pQJuL9zU2zFiV+cU5dPhg35bHs4FnLB/Hw/70qubuPaBfoBzd9HgcQAapDKIzmG2A5G/idVcCO2yQ2WJr50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728486477; c=relaxed/simple;
	bh=D6KgzxUmCGpG9TnH992+sI2ZGOtxo4xs7hCe69Yn3wQ=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=P9clWCi2CXSBxB5GNnJgEmG+ogQ19dHW7yfXDiVpQD34VdzxUXQLv0wm8SiRnWqTM/lkjgVUhfN1kUqUf91/ZQSnk7vUAyGIORZEnvprIDwQbRXKGiLAMuFEcXbPtp6uWlj8AmGsOdv/KOQ5FIjNisRUGDMOP520Aa6tKd8j30Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IeGuY5Ta; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9FA2C4CEC3;
	Wed,  9 Oct 2024 15:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728486477;
	bh=D6KgzxUmCGpG9TnH992+sI2ZGOtxo4xs7hCe69Yn3wQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=IeGuY5TaTnuP4WkG1tBVO0CeUhLeAUO6J2ELu7Lj1EblWShaDW0A4qkh/kt8P+zmY
	 sraktsD7Ux0eAJrJ+YXG0KimXYKisZBaSEqDu9Kqs6Mv4HaV72pJwvdY5O3eio/J/W
	 hhdUPFulr8UcVuU2ERuexYSngGPwLh4yj+tS5VOWGCncRVCPMjF6BrMFOYPZ3wyvJk
	 uOA3vWlqDOInxNzzel3Inb3ZXZ2Q4NcLtc0nRKY28bJd6dikb3oJhDJiVbJghM77CE
	 GX3Y6JGndm9H4cq6XfHDPHA0fd3/Mjb5W9/vN4gZLEIWD9qBAGLVBLZ2mWDna7jnEW
	 85YzwUIHQwIhg==
Date: Wed, 09 Oct 2024 10:07:54 -0500
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
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, quic_mohamull@quicinc.com, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 quic_hbandi@quicinc.com
In-Reply-To: <20241009111436.23473-1-quic_janathot@quicinc.com>
References: <20241009111436.23473-1-quic_janathot@quicinc.com>
Message-Id: <172848644094.513897.10904858829903323275.robh@kernel.org>
Subject: Re: [PATCH v1] arm64: dts: qcom: qcm6490-rb3gen2: enable Bluetooth


On Wed, 09 Oct 2024 16:44:36 +0530, Janaki Ramaiah Thota wrote:
> Add Bluetooth and UART7 support for qcs6490-rb3gen2.
> 
> Signed-off-by: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 120 +++++++++++++++++++
>  1 file changed, 120 insertions(+)
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


New warnings running 'make CHECK_DTBS=y qcom/qcs6490-rb3gen2.dtb' for 20241009111436.23473-1-quic_janathot@quicinc.com:

arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: bluetooth: 'vddio-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#






