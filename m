Return-Path: <linux-arm-msm+bounces-81436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F78DC52FBC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 16:23:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30931505568
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 14:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A7082F0698;
	Wed, 12 Nov 2025 14:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dH8qx+eg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F69D2C2340;
	Wed, 12 Nov 2025 14:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762957610; cv=none; b=jLXyd72IuKjl7j38ZuyZB+qoLKbLg/fVw/XwHHqOo/pD1atG6KD+bdSmCQC5vakL74MK1mh1lc057u9OBPKtjo1LUYpRn8V/xH742ziwfLMIndOq+of8YJJfQN+FQ9fl8tE5BZ+r/Bkvv5HiZeC0eguJi9aFwBaFE8Fql26dC/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762957610; c=relaxed/simple;
	bh=9VysWk+Q/2Wk/gqHBbWZCfUFWziKZ/B3UYPT/bITXRw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=lXTTg2NFbJz2hQbV6pvtSijgtxIbX2CZCvraa5IUyodCBTHjRv19h539BHpfqhADb3Rv96TJz7rDktEOJqkPFcrG6ZVm73VghsLQKKJxTqkqVlPcTO5kOlZpcg20Lz5wry7ipMubw89oYZiop+wGRZkmWDCvHPLj8RVZ4pXwDyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dH8qx+eg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ABD3C4CEF7;
	Wed, 12 Nov 2025 14:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762957609;
	bh=9VysWk+Q/2Wk/gqHBbWZCfUFWziKZ/B3UYPT/bITXRw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=dH8qx+egXHPxyfOel824HrCIBDbNrypdx7SuHvrxW2/B0Ocf7fZYFVmQL4Mrs7AZW
	 wmZECb+Bw6NVGgiu+eZqYvVnpCX0HGXX+aZHUDBjKnNn3EmukzFF8TG631usntrpFU
	 kD2CECtjjngcD9rmTca4bKoKLxcozGx6abjiBogLjGgb1/Fgs6O/E2ba3HyKkly3IK
	 Rtwe4JSbHypds8wldR5BaX66clBl5kC6YhxjC2L0W2dLSGUqI+sQlGrIgPLBdLvkAa
	 bvkgfWGCPiOgLrekymTEcL9JgRWbZvGpOhB8KTQNM9G6iX4ekzsQWPRKrKxUgEcUjB
	 JmP2r87WFVxRA==
Date: Wed, 12 Nov 2025 08:26:47 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251111-db820c-pro-v1-0-6eece16c5c23@oss.qualcomm.com>
References: <20251111-db820c-pro-v1-0-6eece16c5c23@oss.qualcomm.com>
Message-Id: <176295563376.1637834.15728252609575729805.robh@kernel.org>
Subject: Re: [PATCH 0/2] arm64: dts: qcom: add AP8096SG variant of DB820c


On Tue, 11 Nov 2025 18:02:50 +0200, Dmitry Baryshkov wrote:
> While debugging a crash in the DRM CI setup I noticed that the kernel
> warns about the unsupported hardware in CPU OPP tables. After a small
> research I found that board indeed uses APQ8096SG rather than APQ8096.
> Add DT file for these boards.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (2):
>       dt-bindings: arm: qcom: add Dragonboard 820c using APQ8096SG SoC
>       arm64: dts: qcom: add apq8096sg-db820c, AP8096SG variant of DB820c
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |    7 +
>  arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dts        | 1126 +-------------------
>  .../{apq8096-db820c.dts => apq8096-db820c.dtsi}    |    5 -
>  arch/arm64/boot/dts/qcom/apq8096sg-db820c.dts      |   15 +
>  5 files changed, 24 insertions(+), 1130 deletions(-)
> ---
> base-commit: ab40c92c74c6b0c611c89516794502b3a3173966
> change-id: 20251111-db820c-pro-8ecd2a28520e
> 
> Best regards,
> --
> With best wishes
> Dmitry
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
 Base: ab40c92c74c6b0c611c89516794502b3a3173966 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20251111-db820c-pro-v1-0-6eece16c5c23@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/apq8096sg-db820c.dtb: usb@6af8800 (qcom,msm8996-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
arch/arm64/boot/dts/qcom/apq8096sg-db820c.dtb: usb@76f8800 (qcom,msm8996-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
arch/arm64/boot/dts/qcom/apq8096sg-db820c.dtb: syscon@9a10000 (syscon): compatible: ['syscon'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml






