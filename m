Return-Path: <linux-arm-msm+bounces-34194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 721CA99B67A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2024 19:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0103A28322A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2024 17:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8BCF14A4DC;
	Sat, 12 Oct 2024 17:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OXAJS9PC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC8F1B969;
	Sat, 12 Oct 2024 17:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728755439; cv=none; b=rTcDHRjjsc82H/WkTEsLiLS9agM236Vapa/pzIfQVnQIH/dWuJo02T4ZOetEyh1/GLm3rQEYxp1o2xezQjp9BARwCyFpfDZ3JD5vLGVIpx0U0I7bDCQYhhKj0gmMNQdjEk70W3bFMgV6aYPHw4GwXoqK4XTjPQ5APTIHI5sbTY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728755439; c=relaxed/simple;
	bh=fAEBmmofSsVxNXuLtxHoLa1uKg1SgeDJSbs4b2Sljj0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p3D6pYQqqcWWNSiZxBQqQVEhN8s+pQo2xDEZqf7hxtZAppL8ARzGWxgVGKs2nQ8/uTbST3hjSkBVos6rzI0CJ+MMeRdZWiUokLrF19lg64LLSCa6vSsosBRscidcRChPxdmOE2Nfoab2dr0I4aFogGhcAB0XM5EFzr/mLfmCSLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OXAJS9PC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5BD3C4CEC6;
	Sat, 12 Oct 2024 17:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728755439;
	bh=fAEBmmofSsVxNXuLtxHoLa1uKg1SgeDJSbs4b2Sljj0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OXAJS9PCXAD0th5WEI/pUclLqfgWo3zKr09yyqgvWwUvYc09MxDiB6uhki/lJYkAX
	 pBsYUQON8ktRY2zNMK5t+hVoZZmD25BIFYAHohPqHhtr7Bp4/PFjqI4QEjb7XHjli5
	 Dij3sj6/KUGtksMutUDrR9+YXgbppQZ+Qmd1YS0dGOzDxAwtbma3+db3hNYyHslCGA
	 4Wi7Q2LFztmx1h08GEegxu294ubXaHEdFxEMPPSrZrpQpyHtoWvX+0MK7bPIUI1Vkx
	 is7UTHyNLcPxuszTdmlWzi2YTak+gCAQNDSr13JKVHGJXtTFXCXUvBW6V4dcCdeSZ2
	 jVo24FJmFBsqA==
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mantas Pucka <mantas@8devices.com>, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-phy@lists.infradead.org, quic_ppratap@quicinc.com, 
 quic_jackp@quicinc.com
In-Reply-To: <20241009195348.2649368-1-quic_kriskura@quicinc.com>
References: <20241009195348.2649368-1-quic_kriskura@quicinc.com>
Subject: Re: [PATCH 0/4] Add USB Support for QCS8300
Message-Id: <172875543346.55946.1656101661343748887.b4-ty@kernel.org>
Date: Sat, 12 Oct 2024 23:20:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 10 Oct 2024 01:23:44 +0530, Krishna Kurapati wrote:
> This series aims at enabling USB on QCS8300 which has 2 USB controllers.
> The primary controller is SuperSpeed capable and secondary one is
> High Speed only capable. Both the High Speed Phys are Femto phys and the
> SuperSpeed Phy is a QMP Uni Phy.
> 
> Device tree patches will sent separately. DT Binding checks done on
> the binding patches. Flashed and verified working of NCM over primary
> usb controller.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: usb: qcom,dwc3: Add QCS8300 to USB DWC3 bindings
      commit: 3624fa00ae76be6a93d46071db12bf9218090cb4
[2/4] dt-bindings: phy: qcom,usb-snps-femto-v2: Add bindings for QCS8300
      commit: c5a3519eae7c491646a87c4861e91f1a1a9f461e
[3/4] dt-bindings: phy: qcom,sc8280xp-qmp-usb3-uni: Add QCS8300 compatible
      commit: c2b174209bbb3341444c899f0a06f21eb953b1f0
[4/4] phy: qcom: qmp: Add qmp configuration for QCS8300
      commit: 5ee213bdbc6c784c28fc9e2dbb5243906e1f8217

Best regards,
-- 
~Vinod



