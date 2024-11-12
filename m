Return-Path: <linux-arm-msm+bounces-37701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7839C63F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 23:04:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41D55281EA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 22:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D79221C188;
	Tue, 12 Nov 2024 22:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rLaHEMOa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F1D21C183;
	Tue, 12 Nov 2024 22:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731449015; cv=none; b=hMbp+2bntZ0GxYtkGoTKNlobSnSp1x1TKs99+5iwuCUDDWgDxwk2Az8Hh4dI1LlNiSp5Z//A2j+92IMNqAZpHgjlVrvKheg9QLWMHtHGnxrm80ys9cDma5e2d7Hl/3cTT2h28EqLWK2+oNQL71rmzrJ2AULHfhKpnVPLfws9ISs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731449015; c=relaxed/simple;
	bh=KeJGsxNdwMDblU+WLQlC0Bhbh2V9aAhYOvAhwgxySbI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o6yPnyYAlA7HIhSF/KZTCJWDLNYvBr1/rtBBpgTpXkQ3IBHGyVNd+nhN/H1LPeZFkbBufGOb5qZs9UrY2mtG119DPDw+1uzovNAcQ8dxHBAs9qKqNRg59gl86HjFPiT6K3aIFT9SUwxnkSuyU0zlFF9k9Mdwi+kj56fSgwe7fkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rLaHEMOa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06974C4CECD;
	Tue, 12 Nov 2024 22:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731449015;
	bh=KeJGsxNdwMDblU+WLQlC0Bhbh2V9aAhYOvAhwgxySbI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rLaHEMOa+bLds5ARNZvbtZ+aASRK5VG+VxxvHp5Su/q8bLn1/VwS/Wfvw8BInYQHy
	 JHE9zH/yXvXsTkVdh5cyHDLt0nPIIu3KsSQtg3rbGmcG73AMo5y/8GWE7rS3mEPBRL
	 nIELYwSMGCDfa2d88xmum2FXIyZ/CCVtu/X98zJLue6P6ZMUDJG39HTc3yEKNFoL7b
	 2KsLJ7NSGvw47dNK2ZU6guzA28UAgsL/UcPqz6PH99CfomgeOQLpTtbP+ibEyK1QRi
	 N6+iDMBK7JQH5ZFBA+tTA6zwxUdfE8azPkeD/NQC5jaf69uIQXAVNOrj8Aj9Lymywn
	 DKP3O4hl6Mvdg==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Qiang Yu <quic_qianyu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com,
	quic_mrana@quicinc.com,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: (subset) [PATCH v9 1/1] arm64: dts: qcom: x1e80100: Add support for PCIe3 on x1e80100
Date: Tue, 12 Nov 2024 16:03:28 -0600
Message-ID: <173144900026.331728.17768587034144952108.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105073615.3076979-1-quic_qianyu@quicinc.com>
References: <20241105073615.3076979-1-quic_qianyu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 04 Nov 2024 23:36:14 -0800, Qiang Yu wrote:
> Describe PCIe3 controller and PHY. Also add required system resources like
> regulators, clocks, interrupts and registers configuration for PCIe3.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100: Add support for PCIe3 on x1e80100
      commit: f8af195beeb0096cdcd1610ac70b544fa1831f2e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

