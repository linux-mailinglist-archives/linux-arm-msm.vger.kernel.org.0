Return-Path: <linux-arm-msm+bounces-46002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D208A1A773
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 16:59:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 470F93AC5D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 15:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACDF8215177;
	Thu, 23 Jan 2025 15:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i76EMWfA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81788215173;
	Thu, 23 Jan 2025 15:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737647872; cv=none; b=nv9F0VdVh0JfZpXA340v5KHER35TfiWy87xkRUBd2OzqKlknxMTns9AnChBhZRQr5sFMTGzlai52kd/tTQ5FRsfw4FLInMCTOipFCb+dTwnParOfmOtUl+qt40Sf2h9BfZtTnUA8Yy5nOvGdlnbq3FLNqJkzsEwrpJWhvmztFhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737647872; c=relaxed/simple;
	bh=61cYg0gPOtFdXpYPe7GZ1Sxy+cFONjyChgL0hovjAng=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=rr0SepMdjp1cObm+tIKXlMWhvCHyjFoo0FTHATuMxnt4H8irSK/ljdpn1Tcv+CDWiO8MYmCP4Gp/5WK764aP+EwshuxeUmdl1vfMggO1Ki6cjT58WqkO9KP1n3H8z1EC3bBMF3U3HslM7+zN2nB3oPQ//zb+UZ5qI3SJZKdGwS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i76EMWfA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E946C4CED3;
	Thu, 23 Jan 2025 15:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737647872;
	bh=61cYg0gPOtFdXpYPe7GZ1Sxy+cFONjyChgL0hovjAng=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=i76EMWfAbkrzSv6P7RX+jk481B4I/DWCcJf5y6Ytp/I5V4DhdVZ5yWvc+ltPaWJjB
	 9wZ77EWRWixx4Ngdr7ZzzJoCfVdGZBTC+5Mg1gfNNbxaXMfCsFNApZaQXg7jy0uNqG
	 j3SfuEIGhTVsxTZ0DhBYV+F0wHRhDA7wlQM+yvflj6YkzFR86xCCL7BDcVj5UT3DlH
	 JCKZHfjfdIambLpzrcI1CdqodrE86ow18j/5Eqiin2aqsHUT1cVt5hQ1v7pqzyChRJ
	 zJFW/yyRk4AF21VtLBNBUFfE5TXxtecEU75CAfaFroZFZOwIoWAwl3VQk98EquUx6X
	 5G8YvSCTd6LZg==
Date: Thu, 23 Jan 2025 09:57:50 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20250122-jg-blackrock-rtc-v1-1-3b05cd85bdfa@oldschoolsolutions.biz>
References: <20250122-jg-blackrock-rtc-v1-1-3b05cd85bdfa@oldschoolsolutions.biz>
Message-Id: <173764775481.3793685.3473617486436144132.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-blackrock: switch to uefi
 rtc offset


On Wed, 22 Jan 2025 07:41:56 +0100, Jens Glathe wrote:
> On many Qualcomm platforms the PMIC RTC control and time registers are
> read-only so that the RTC time can not be updated. Instead an offset
> needs be stored in some machine-specific non-volatile memory, which a
> driver can take into account.
> 
> Switch to using the Qualcomm specific UEFI variable that is used by the
> UEFI firmware (and Windows) to store the RTC offset.
> 
> This specifically means that the RTC time will be synchronised between
> the UEFI firmware setup (or UEFI shell), Windows and Linux.
> 
> Note however that Windows stores the RTC time in local time by default,
> while Linux typically uses UTC (i.e. as on X86).
> 
> Based on a patch by Johan Hovold. [1]
> 
> Link: https://lore.kernel.org/all/20250120144152.11949-7-johan+linaro@kernel.org/ # [1]
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
> This is a patch to switch the Windows Dev Kit 2023 over to
> using the UEFI offset.
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250122-jg-blackrock-rtc-v1-1-3b05cd85bdfa@oldschoolsolutions.biz:

arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: pmic@0: rtc@6100: 'qcom,uefi-rtc-info' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: rtc@6100: 'qcom,uefi-rtc-info' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/rtc/qcom-pm8xxx-rtc.yaml#






