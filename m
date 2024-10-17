Return-Path: <linux-arm-msm+bounces-34760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EC09A26CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 17:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED47D1F27457
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 15:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7C91DE4DA;
	Thu, 17 Oct 2024 15:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AH4t8oE5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19601D47AC;
	Thu, 17 Oct 2024 15:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729179328; cv=none; b=oZ39Wn2D8BTLI8p/e0GuBsPQrTDYXs51QsMZXbSdZqMFwMopBJ6xOFnOJDDGdpzvF4SYFeK8bDKhAjECmrshXJRoM9xuG2I9UE7hCk/0vq/TB0Fu09p+K5qtTZQryX1rb5ecogPUOS8l6P4mSB+wZwoak/QtalHNfkBMIjY+DJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729179328; c=relaxed/simple;
	bh=29C4R99idAS+9fjDuZxCEpSiqsa1ZkROAapiNJBI0K8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=skH++nJywn+Snh2l8nZg8zCzJn6zbWWGk0kd07AObi15XCTjLy2/f2mKgjNbhSGqME2hCNlMiIfeTpIaWYuCvAy6Kf0O8jCqOGGKJqPgMzlgL6BqJ8aX0dyb5hJmcuFcA/N4rbt3DAiifdJkEnTxpcHksxMumKLpgySBqqYF7J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AH4t8oE5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF4EC4CEC3;
	Thu, 17 Oct 2024 15:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729179327;
	bh=29C4R99idAS+9fjDuZxCEpSiqsa1ZkROAapiNJBI0K8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AH4t8oE50oilu20L51yoRxl7nbn6SldUjiTaCcXf57QuMK2pTEXaLPOAtYsDCXXuX
	 XBWA/mdkeO3HxmpieRLRuWfZM6iJ5cJvnAnNjUr80JDwRbQRqrgNYllKnizEa/vmDe
	 CcNxaYctg+m0AYuqWSoCbaCOi0znCKWAnNMzPfTb+H2lzgS65mKmzp6jS9qROgLeGb
	 iGoi0w9jPl1h6Z+ZAM2BqMQ7gdyBphBg5Di2EQTxVqCuXlDjwE8ION/oNYvmwIBCU2
	 m8d2fH+EqUDuKYI+Hcc9Wcg05J1yeumBa+hwEaFYTnREEFyl5thNflcDtugH+AHL8S
	 VgAsOEi9FwokA==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Xin Liu <quic_liuxin@quicinc.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, quic_jiegan@quicinc.com, 
 quic_aiquny@quicinc.com, quic_tingweiz@quicinc.com, 
 quic_sayalil@quicinc.com
In-Reply-To: <20241017042300.872963-1-quic_liuxin@quicinc.com>
References: <20241017042300.872963-1-quic_liuxin@quicinc.com>
Subject: Re: (subset) [PATCH v1 0/4] Enable UFS on QCS615
Message-Id: <172917932189.288841.5463892176207403335.b4-ty@kernel.org>
Date: Thu, 17 Oct 2024 21:05:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 17 Oct 2024 12:22:56 +0800, Xin Liu wrote:
> Add UFS support to the QCS615 Ride platform. The UFS host controller and
> QMP UFS PHY hardware of QCS615 are derived from SM6115. Include the
> relevant binding documents accordingly. Additionally, configure UFS-related
> clock, power, and interconnect settings in the device tree.
> 
> 

Applied, thanks!

[1/4] dt-bindings: phy: Add QMP UFS PHY comptible for QCS615
      commit: 6a612c86c8a5805c85fde359aa9c8aac6d5cba7a

Best regards,
-- 
~Vinod



