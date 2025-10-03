Return-Path: <linux-arm-msm+bounces-75903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D270EBB6E05
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 15:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 45CE64EC08B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 13:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E97B92F2606;
	Fri,  3 Oct 2025 13:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V7QRnqUT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD92A2F0C68;
	Fri,  3 Oct 2025 13:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759496859; cv=none; b=DSxkcn4Io5kp0ofHmVXPMm1CqgZnecNt64lcGhOD/j/uIx5DiGawnvjI9VZfjj+wPUNg2RqD8qcoP05lY3rky6y+Ij8nKmw5yz/32imonIVJXVJnSfLBwDLJ0TDAwKYqWsj9qRclpH8URbEWmlDE154tgdunR4cyeyuQh6hx7FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759496859; c=relaxed/simple;
	bh=PAJkK9dfzICQW/0A5BRssXj9Is4GeHIj5w2sCsCxQMw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=OBRTv+VlhApOc8nFYjtWcf8tbeL8OJ1xCx9iiBVZZMny/3tOGpXYnuie9CJWPBfa4AlRjbT7SXIcV+elyvs9+yIzrTlQZnjxCRRqWcI79UatNakEXJKfVsgYWcQbwin7iF4Unjzk9hM8R/uCxnB1LlOVjEVRBovcpPLNWT0j8jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V7QRnqUT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 292C2C4CEF5;
	Fri,  3 Oct 2025 13:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759496859;
	bh=PAJkK9dfzICQW/0A5BRssXj9Is4GeHIj5w2sCsCxQMw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=V7QRnqUTG880+ZQff30yTv3EBGefTwpABXhR0FQ5xRfOh9y657VAcawufzLi+B3nY
	 WnhXLklHf1tF3DXLQ/skmsvbBLbzdZPz3W++iTzdoeMJfHub5ucB2vIIecoL671Feo
	 aYjAZwebArfvvgr8wG7Vw5Fj5UTPHIlTYEolC2E74bM/5RldW6m5CeEpt1UUK96tfz
	 aTkX6suc1hG+HtMvqirg2kQhGGLffnLl+f2Y4WiVnhSVCeZ+NxMNmreJvzYTmiBYOd
	 DOAD/C+D4tyq1pXJrd34rCe1f6Vuy8s+zqpnx7hofrr7I7xKKwqIt89BgElow1cKf1
	 A5EqvesQUS36w==
Date: Fri, 03 Oct 2025 08:07:38 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20251002172946.589061-1-krishna.kurapati@oss.qualcomm.com>
References: <20251002172946.589061-1-krishna.kurapati@oss.qualcomm.com>
Message-Id: <175949678614.770429.8746115664528965261.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: lemans-evk: Add OTG support for
 primary USB controller


On Thu, 02 Oct 2025 22:59:46 +0530, Krishna Kurapati wrote:
> Enable OTG support for primary USB controller on EVK Platform. Add
> HD3SS3220 Type-C port controller present between Type-C port and SoC
> that provides role switch notifications to controller.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> Link to driver and binding changes:
> https://lore.kernel.org/all/20251002172539.586538-1-krishna.kurapati@oss.qualcomm.com/
> 
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 122 +++++++++++++++++++++++-
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


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: remotes/next/fs-next-6496-g155abb6f8812 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20251002172946.589061-1-krishna.kurapati@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/lemans-evk.dtb: hd3ss3220@67 (ti,hd3ss3220): 'id-gpios', 'vbus-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/usb/ti,hd3ss3220.yaml#






