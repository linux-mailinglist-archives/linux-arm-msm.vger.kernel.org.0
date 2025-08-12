Return-Path: <linux-arm-msm+bounces-68620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A64B21B40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 05:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DDA42A4725
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 03:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25FE62E2DD4;
	Tue, 12 Aug 2025 03:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cx8uU18X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8F92E2852;
	Tue, 12 Aug 2025 03:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754967897; cv=none; b=S488TI6R4sEqKaa6di+9QpYDOEmckDGgr99ReCAtO5uF4N2cUWlmTd72v/gOMiBIptwsRIzcB4pfaTAmDDAKann6AP0DZD6WMBRBHwgCbwF1yDVrEnadPhku6wxtoWWCCDviLo0+1lvm1CMpySdQWbBaFfkKA+l1uHJS0ZeNzNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754967897; c=relaxed/simple;
	bh=zT2OirOhrrYsBTkExiZ0lMaJlZrsB7ULP9TbjbXyMGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eVFWk12FRzFXxu6WI3HhPWWDtFhsF4/uRUWufV9rFr2SvkEEMi64ihsq32fc5VDYfuDkIeXjq+qHa5fYHA2rFYmLNRCRnPcBbZaRQ+OIhd9Ols77F0vEPKu9/y3w64QqvY9Q+iSp5wFyoK8AgpalkAhHRpXlvWnYLplGWgTq4y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cx8uU18X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B755DC4CEF6;
	Tue, 12 Aug 2025 03:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754967896;
	bh=zT2OirOhrrYsBTkExiZ0lMaJlZrsB7ULP9TbjbXyMGY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cx8uU18XsGPRPZTfG9Lbn90V9FBaWIbnj5aCnNAwj1c0mDMz7VDUqH2sRl7qdl+Ul
	 4t1zjL2/dOQ0mEZxz26ii4U1SUriRVSepIH0Cffa++7ivOeGMsqd0PuaEYYy71N1Gq
	 oeJCHVnxS9edz1xVEQYFp06M+miQph8x6QN5BecJG9phRAtOhVRQtOWNjc6Hw+kB3B
	 HrgdPWdpI/0oGrxM9LexYcE3loK42stF4Wk1u1bf3J/lGkdz+lWUrb7JRUK6fexnPI
	 5LNQJ0fcSzBsadBkbxRKbGrjRg9XLBqrfRixJlmrLEXzg0pE7eVdaqbogC8cgXGSyL
	 h+SXkuHm0v0rw==
From: Bjorn Andersson <andersson@kernel.org>
To: cros-qcom-dts-watchers@chromium.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280-chrome-common: Remove duplicate node
Date: Mon, 11 Aug 2025 22:04:45 -0500
Message-ID: <175496788917.165980.17371690810065403740.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250728-topic-chrome_dt_fixup-v1-1-1fc38a95d5ea@oss.qualcomm.com>
References: <20250728-topic-chrome_dt_fixup-v1-1-1fc38a95d5ea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 28 Jul 2025 11:33:52 +0200, Konrad Dybcio wrote:
> sc7280.dtsi already includes the very same definition (bar 'memory@'
> vs 'video@', which doesn't matter). Remove the duplicate to fix a lot
> of dtbs W=1 warning instances (unique_unit_address_if_enabled).
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sc7280-chrome-common: Remove duplicate node
      commit: 642af3f3d59003657483d60bb6b7229a43ff56e7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

