Return-Path: <linux-arm-msm+bounces-78931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE36C0E4FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:14:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EDDB14FC0FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D721E307AF2;
	Mon, 27 Oct 2025 14:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nr6/h5rZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3C2307AC4;
	Mon, 27 Oct 2025 14:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761573990; cv=none; b=FzPQWDGrAd2txMpV7fJ343VwL00r+KAinNaFx9pk/LEoK8YbYkT67jmnkE+vwSQUnPTv3xaZAjrj3wpmq8kdZWFIFTN7lh6/9UhkYmAzTfw0t6PsJTCIQONZHUcXjx2tu5xDX2LAy9XlUdH307zXmP5mZLWZ3CXDTxR5oXazEMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761573990; c=relaxed/simple;
	bh=mydn0gj6QS5mxTfOU4C8MwsgU0NOzyhR/5mNbySSuqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q0fNywLfHdQkCE7ppsprbHUQyqHODTHoh7y2+0JpeB5dv3L7QOVwBbSsDh16TUdSai46FclfAAgzeXtefOw317wCRoH4iHiyTRpygWqoXiap3cja7xp7WLTdrBBA/f9IwHhnJRozYgUXuFSfbzVq+zD+dZXqLgY4875ais8y/WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nr6/h5rZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5426BC116D0;
	Mon, 27 Oct 2025 14:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761573990;
	bh=mydn0gj6QS5mxTfOU4C8MwsgU0NOzyhR/5mNbySSuqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nr6/h5rZcA5o0R30J1/CxxPSctvY9NKrhth5cpprr31rXRRw83ynwADH5v5RSM6J1
	 oILGFy3NMoC1l+baew30zqpp0XIhSJJYv2NDNkBEHm6suehPhDk4ylXRrt14L4PyMi
	 0LsTpBi3kfBTCyKLH6mm6yJrBLPgb119iu+1jvrpSdwvhMd9Weo+lUc9Q3BQOODFvy
	 rjGE2sdFpHiTB3BPglbSY0O9rBroOsgSFussHoQvjISyXhChJqJ6kVllI70/xLMIjJ
	 u3mb3xF6BJMUvRxzmOvk7kzaBVKuUpg/S9+9DYt+Mm/jwbdi1v1+m9Pm+vwiMd3nG7
	 MvzW9V39hwuRQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 0/2] soc: qcom: llcc: Add LLCC support for the Kaanapali platform
Date: Mon, 27 Oct 2025 09:09:04 -0500
Message-ID: <176157405467.8818.9613829432844744989.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924-knp-llcc-v1-0-ae6a016e5138@oss.qualcomm.com>
References: <20250924-knp-llcc-v1-0-ae6a016e5138@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 24 Sep 2025 16:24:53 -0700, Jingyi Wang wrote:
> The Kaanapali platform has LLCC(Last Level Cache Controller) as the system
> cache controller. Add binding and configuration to support this.
> 
> 

Applied, thanks!

[1/2] dt-bindings: cache: qcom,llcc: Document the Kaanapali LLCC
      commit: f5f1e5abb649d0a532ebc72f4196b4818585d20b
[2/2] soc: qcom: llcc-qcom: Add support for Kaanapali
      commit: c88b6ee3ba3c7bf6386ea0e6de8111acc3d832bc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

