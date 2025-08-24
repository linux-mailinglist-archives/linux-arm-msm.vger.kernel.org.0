Return-Path: <linux-arm-msm+bounces-70495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68636B32D16
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 04:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D0AF1B666EB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 02:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E7B32147F5;
	Sun, 24 Aug 2025 02:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lMdmy+oX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E321CEACB;
	Sun, 24 Aug 2025 02:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756004166; cv=none; b=kkfWdPIoGZvCjihpuuHdLG3gB7x9in7W6DmE/FfOqIuXLApJShipxZNrKMXWiMTy/29+FJJ44eQPI6lZNWtKljsjtd2IRS0sgDLWr0udv/LiQqLquDp1ebTYMg2Wd9DJUoGFkgKYhlhY/EdQFaFUGk+qsND9gcEmKZJ8WGc75OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756004166; c=relaxed/simple;
	bh=Xo9dMBAwRvw5oPH2A209J/ZEJUT9khYptiOgPCJ4lm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Av8lwsorcrybbQD45T3ujtJaxtygGPY4obB6Uz2wdRZr6UagueNpFyKoq6HvwFpcrhy+0j0fVUYti5U9FVZ2r3cCX/M3R/4f6LC54VkWSQB97/g/3qPWFR17QgTmmb2Wi+Bq9GL27GbaGEOqzG4PPehkcGVmBktN+tgN3QR/QL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lMdmy+oX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59132C113D0;
	Sun, 24 Aug 2025 02:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756004166;
	bh=Xo9dMBAwRvw5oPH2A209J/ZEJUT9khYptiOgPCJ4lm0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lMdmy+oX/m5BZlMyjqJf5/A4dmyI5hV05h8c9ekQoTOOtuRaPqmSpp7EV77iGfO2v
	 cKm2inPOWa4/3/lrENK3cN18MctUOuaXyejMsUwNgG8O8UeFzsTTqMgoxPEEJKPtIH
	 SKHHxnyvf9lc/BwwOHxa01JegEq4w3/+MnTXfUjK7lxVCqFa9Dc9cMdZR+dXke107I
	 KJER39fFq+606FSjzm6ZTKM7liNLj45wVONEvdMdwjuGQF1FjvUmbtJ8Fw4UXlsuAN
	 4IZXVQbkDxAh72VMGLDJlljVbXkeevjtMsVPDuCVpE6isu9za6xIcDdKUiORMOvsRB
	 YSP0wLZ9hx38A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: use DT label for DSI outputs
Date: Sat, 23 Aug 2025 21:55:38 -0500
Message-ID: <175600415282.952266.14336881469326134086.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250815-msm-dsi-outs-v2-1-3662704e833f@oss.qualcomm.com>
References: <20250815-msm-dsi-outs-v2-1-3662704e833f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 15 Aug 2025 18:46:04 +0300, Dmitry Baryshkov wrote:
> Instead of keeping a copy of the DT tree going down to the DSI output
> endpoint use the label to reference it directly, making DTs less
> error-prone.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: use DT label for DSI outputs
      commit: d7d28bcc2038bd66a4f5912b8e1b162f5ba6faa8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

