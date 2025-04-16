Return-Path: <linux-arm-msm+bounces-54515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F012A8B97A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 14:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAB88189F354
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 12:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A1BF132122;
	Wed, 16 Apr 2025 12:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vHcUDCQ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCD1184E;
	Wed, 16 Apr 2025 12:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744807421; cv=none; b=X+dzG3BXeYALUccHmBOAAEd0LwNA2XmLAVrVr9F74TdupPDWvLhnhR8a3/b7DOQBaQ9fYJelfSvOMhGaqNRwSs9Wd7oZ7yJa1xuAAaGKcbjIlkr8rQagRahr33MMsaAxHpLyQ0xeXOOIfLtoR2eyuDpp5NUPy7XTv6qm2RTqylo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744807421; c=relaxed/simple;
	bh=b74enOt/8kznwZO0MSlQeEP1+BRD+1EnL46fdp1IFlQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=knZIvzF/U1n3O9P+nhIsvyLrTb+rcAkB2zgqQukvc3SmDGi3xLp9gerpm/zkGC5ufrb/hhQ4Ewbz97vc+h44PQhmbXXmp6+LQ4sPx1JQZ19XhFwkjl3hwQfhekKclgRFGDtnDRFdggb75w0UWHgbm7kIQV7CtPVLPSsID0UnpFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vHcUDCQ2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C09C4CEE2;
	Wed, 16 Apr 2025 12:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744807419;
	bh=b74enOt/8kznwZO0MSlQeEP1+BRD+1EnL46fdp1IFlQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=vHcUDCQ2vx9qadNCM0RzfCbuUsPonoSdS1B2m0MZfphss0lEKvQ1CmFF9tWebWL0g
	 9WXXBh9JFUGl053WM5onCi+Tokff+X3XrMtfiSp0Ozieas4lBumMYQfrbHQEOw3KHr
	 Dvru4Dz7ndcW4NfffEkZNdu0D3mBH0SxMx0esTb5Mw407rBxYKYMq5q2HU3SgT0NH/
	 cFosCSVQ+sPRxrJ+Bvo8YPuZ6r18bcorh9GeCn/x/WGmPkHaDDRAssbOzoQo9dUO8Q
	 kkWNj44RYtl+CqdpJSR/44mufjdk0PdRGfM3EPIxuzPh3WCqFhjwhYZgVUXBFZR/NX
	 bA2m5Hj1oCRig==
Date: Wed, 16 Apr 2025 07:43:37 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, 
 linux-kernel@vger.kernel.org, andersson@kernel.org, conor+dt@kernel.org, 
 linux-arm-msm@vger.kernel.org, konradybcio@kernel.org
To: Juerg Haefliger <juerg.haefliger@canonical.com>
In-Reply-To: <20250416094236.312079-1-juerg.haefliger@canonical.com>
References: <20250408145252.581060-1-juerg.haefliger@canonical.com>
 <20250416094236.312079-1-juerg.haefliger@canonical.com>
Message-Id: <174480737033.2514134.17619906882414938312.robh@kernel.org>
Subject: Re: [PATCH v3 0/3] HP EliteBook Ultra G1q support


On Wed, 16 Apr 2025 11:42:33 +0200, Juerg Haefliger wrote:
> Add support for the HP EliteBook Ultra G1q 14" AI laptop.
> 
> Based on HWINFO64 and APCI tables, it seems to be the same HW as the
> HP OmniBook X 14.
> 
> v2->v3:
>   - Drop status properties from nodes in patch 3/3
>   - Add acked-by-krzk to patch 2/3
> v1->v2:
>   - Don't rename the X14 dts to dtsi and directly include the dts
>   - Add a label to the sound node and use that to override the model
>   - Reorder the dt doc patch before the dt usage
> 
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
>  .../qcom/x1e80100-hp-elitebook-ultra-g1q.dts  | 30 +++++++++++++++++++
>  .../dts/qcom/x1e80100-hp-omnibook-x14.dts     |  7 +++--
>  drivers/firmware/qcom/qcom_scm.c              |  1 +
>  5 files changed, 38 insertions(+), 2 deletions(-)
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
 Base: tags/next-20250416 (best guess, 1/4 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250416094236.312079-1-juerg.haefliger@canonical.com:

arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: pinctrl@f100000 (qcom,x1e80100-tlmm): Unevaluated properties are not allowed ('bt-en-sleep' was unexpected)
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#






