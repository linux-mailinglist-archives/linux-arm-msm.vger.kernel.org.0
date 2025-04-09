Return-Path: <linux-arm-msm+bounces-53645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF90BA82768
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 16:15:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27C89461360
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 14:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FAD6266567;
	Wed,  9 Apr 2025 14:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hHgzEa2P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D0B266562;
	Wed,  9 Apr 2025 14:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744208094; cv=none; b=JxSxC0LHmQy+7Xfh6ZYqvzh8OVjSpPCJvce7rvkYSiDqr8n5MJbxXmEfOuTUSS5gByfO6g+M1b2u6a4rHxAV+ijx1fh3Omg2tcSDVKWlL/QMLR0Tcifp+Wy4lXTfQyCRASngloveEL25MO5OEN8jYY6iWGS8vwNjhTxrfZwfjZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744208094; c=relaxed/simple;
	bh=Sz7Ar48KE4txY+Gbl2J3yWZDzFynseII097OkDBTw60=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=lLrTxexeZG9XVwmAEGLTopUUkQRXkvncUZqUqz3LsAk8OiQthsWAQLfo+y3d9dJJl6/hGrJz19djP2hX4zRF4JiFiP3LGJdMkX3fEhxaN3SScefebP7LRgKQ7MbOA44pTzARoNyCGfVBvomL+9BVCfgoGyBp2sFpeYjeGU26bSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hHgzEa2P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05941C4CEF3;
	Wed,  9 Apr 2025 14:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744208094;
	bh=Sz7Ar48KE4txY+Gbl2J3yWZDzFynseII097OkDBTw60=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=hHgzEa2Py3OsRnURP0dR+bHfuyrRsc685WJloe0naiT11O7ZWNzOQnoQ6GpE22sej
	 YrlY7aEMIDFOqc9QkuTVecfR1cJqQ+RMRu9Sm0rVWhrXyirtLFXPfEB9kN8HD2dxIj
	 kDDeKa7BOURRbExG846Neu2ANImjpF8kx7snyiCotgfdhTLKLuduCIwdhHV2dkaO+V
	 g/Q4uuODXHhMbZ4NqSkc0nYJVvZV/mjSJsdw6eAobBojYyZzbhhJpRenrn4L1slyAf
	 CEyKcUah9nN8puooD9stve/j4tCpOd+icFrINfqHogvp/4EaiDQa++GPw2ePjmN6Qp
	 zT1nl4lwXMRdA==
Date: Wed, 09 Apr 2025 09:14:52 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: andersson@kernel.org, devicetree@vger.kernel.org, 
 konradybcio@kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, conor+dt@kernel.org
To: Juerg Haefliger <juerg.haefliger@canonical.com>
In-Reply-To: <20250408145252.581060-1-juerg.haefliger@canonical.com>
References: <20250404090108.3333211-1-juerg.haefliger@canonical.com>
 <20250408145252.581060-1-juerg.haefliger@canonical.com>
Message-Id: <174420798688.310428.4343070033252638387.robh@kernel.org>
Subject: Re: [PATCH v2 0/3] HP EliteBook Ultra G1q support


On Tue, 08 Apr 2025 16:52:48 +0200, Juerg Haefliger wrote:
> Add support for the HP EliteBook Ultra G1q 14" AI laptop.
> 
> Based on HWINFO64 and APCI tables, it seems to be the same HW as the
> HP OmniBook X 14.
> 
> v1->v2:
>   - Don't rename the X14 dts to dtsi and directly include the dts
>   - Add a label to the sound node and use that to override the model
>   - Reorder the dt doc patch before the dt usage
> 
> Juerg Haefliger (3):
>   arm64: dts: qcom: x1e80100-hp-omnibook-x14: add sound label and pull
>     out the model
>   dt-bindings: arm: qcom: Document HP EliteBook Ultra G1q
>   arm64: dts: qcom: x1e80100-hp-elitebook-ultra-g1q: DT for HP EliteBook
>     Ultra G1q
> 
>  .../devicetree/bindings/arm/qcom.yaml         |  1 +
>  arch/arm64/boot/dts/qcom/Makefile             |  1 +
>  .../qcom/x1e80100-hp-elitebook-ultra-g1q.dts  | 36 +++++++++++++++++++
>  .../dts/qcom/x1e80100-hp-omnibook-x14.dts     |  7 ++--
>  drivers/firmware/qcom/qcom_scm.c              |  1 +
>  5 files changed, 44 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
> 
> --
> 2.43.0
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
 Base: attempting to guess base-commit...
 Base: tags/v6.15-rc1-3-gb09878285d23 (best guess, 1/4 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250408145252.581060-1-juerg.haefliger@canonical.com:

arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: pinctrl@f100000 (qcom,x1e80100-tlmm): Unevaluated properties are not allowed ('bt-en-sleep' was unexpected)
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#






