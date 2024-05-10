Return-Path: <linux-arm-msm+bounces-19709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC8F8C261B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 15:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96999284774
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 13:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD3212CDBA;
	Fri, 10 May 2024 13:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5C1O290"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDDD12CD99;
	Fri, 10 May 2024 13:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715349190; cv=none; b=keGdLXgsPKEvbhwAusZ4RXInydE/l21fb8DgRPv9sQ/ZBL9fWDE8YXlAwsDQcYvDnNwYjNU7u1ASKGOP+YZ+mmMRGmA/A0mBC5BKlVbf4tJ8dw4qN4ZoqPQmcnLjAbCgIMjSr28ACxkTJ4qaMoQSJ+mqXgGNXPyxjxxxUUwnaKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715349190; c=relaxed/simple;
	bh=98I2lvAbhwMpFBygf6Bolb8VFy2UDJUsMGNQmAfaKLY=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=pcsZL0lPdVJtBufkvpcy06QdKnT5Jzvs6KYoPV6dLSEeoBrNEildkx7UleFE/CvRPxhCpghe1AMVli/qKuQzc20+Dlk8K2/fyqSbcb+fCdtd6ar0S4i1djumSlB+zRbygGkRoAxteGq4nz+XiIUzhkuL9yG/Dxwm1hReACHn6fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5C1O290; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D78C32786;
	Fri, 10 May 2024 13:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715349190;
	bh=98I2lvAbhwMpFBygf6Bolb8VFy2UDJUsMGNQmAfaKLY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=J5C1O290PAZGnQFciGZvk+rneQkT466GtnjPvAI3pzVW3qp5loHy5p9s+gvOvbeSX
	 3TjKGFRDKoUHtpv0WAMu5PCf/rVmuMFXJtoOi1LJAxINKTDiF0Dsftjlj3FsAWKNxu
	 IYBX9PXwTKBeESTOlaSYgCVZmoBGTNQs8xnsM/6xAY+Vtul3Ydcpm6jtaY/J+TFIKP
	 Bc95ee61kYLbd4Gwb7AYEi96z8rzDv8x814aYoT8L30s4G0YtAC7PLgmOAJQWWsMmY
	 gQxxFah7BSYhuqN4LrFU0uXDtuJHIIQW3PdFImKZ5bknlKMWigVAoLUBZfBgGAJh+y
	 XOdC2Af2QEF2Q==
Date: Fri, 10 May 2024 08:53:08 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, 
 devicetree@vger.kernel.org, Mohammad Rafi Shaik <quic_mohs@quicinc.com>, 
 linux-kernel@vger.kernel.org, cros-qcom-dts-watchers@chromium.org, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <20240510-sc7280-apr-v1-0-e9eabda05f85@fairphone.com>
References: <20240510-sc7280-apr-v1-0-e9eabda05f85@fairphone.com>
Message-Id: <171534910860.4114812.2084039403374857519.robh@kernel.org>
Subject: Re: [PATCH 0/2] Add basic APR sound support for SC7280 SoC


On Fri, 10 May 2024 14:27:07 +0200, Luca Weiss wrote:
> Validated on Fairphone 5 (QCM6490) smartphone by using DisplayPort over
> USB-C audio, connected to a TV, with a basic UCM to enable
> 'DISPLAY_PORT_RX Audio Mixer MultiMedia1':
> https://gitlab.com/postmarketOS/pmaports/-/tree/master/device/testing/device-fairphone-fp5/ucm
> 
> Unfortunately all the device-specific things can't be enabled yet
> upstream as detailed in the second patch, but the SoC parts should be
> good to go.
> 
> As an extra note, I'm not sure how this will behave on SC7280 devices
> that seem to use GPR (q6apm + q6prm) / "audioreach" as added in this
> series from mid 2023 which was never applied:
> https://lore.kernel.org/linux-arm-msm/20230616103534.4031331-1-quic_mohs@quicinc.com/
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Luca Weiss (2):
>       arm64: dts: qcom: sc7280: Add APR nodes for sound
>       [DNM] arm64: dts: qcom: qcm6490-fairphone-fp5: Add DisplayPort sound support
> 
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 36 +++++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi               | 73 ++++++++++++++++++++++
>  2 files changed, 109 insertions(+)
> ---
> base-commit: 940d65ef852b4a58c9115eb82b07844c999b8356
> change-id: 20240510-sc7280-apr-c6d10ac2c331
> 
> Best regards,
> --
> Luca Weiss <luca.weiss@fairphone.com>
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


New warnings running 'make CHECK_DTBS=y qcom/qcm6490-fairphone-fp5.dtb' for 20240510-sc7280-apr-v1-0-e9eabda05f85@fairphone.com:

arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: /sound: failed to match any schema with compatible: ['fairphone,fp5-sndcard']






