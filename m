Return-Path: <linux-arm-msm+bounces-34618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7278C9A0E52
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 17:33:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DC661F23E4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 15:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163DD2139D1;
	Wed, 16 Oct 2024 15:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="imsQVxGq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFACA2139C9;
	Wed, 16 Oct 2024 15:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729092744; cv=none; b=PbCw6L08omSrE2L3nBmtYyMbpjfSiC0OtgHRDJTCrGP9ZI4Q3w11GPkr7Zic3Ha5Y29QwCJhm1BYEgmhVbcVJ2iXtzTjmKRD7g6Gl5E9GOBkRtaZmhGrXPoQIefOQTfUr1gHNR0u4oJjTs96lozwsdAiLtiL5h+UMVQ3ZlILnP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729092744; c=relaxed/simple;
	bh=BNw7018Rl+sW0dNflVH3xyRLDE04WB7o4gO4ul0Wtxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lGF4+g0fTibJCrtW5J/2rcoBWA/qpGXadN/QR2f3z2kAuCBbNX4Yq0wtuEUzDjrWX7Zgc6Rya0BuM4gVXzs1PrEOJs+r7dKZhqyOphQNl9RhCLqlJjT3wDkhXc9RKR174RCQy2vttEpuOWGp39QIE5jZ7AhPHWpXCScZWLfF/30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=imsQVxGq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9EF5C4CED3;
	Wed, 16 Oct 2024 15:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729092743;
	bh=BNw7018Rl+sW0dNflVH3xyRLDE04WB7o4gO4ul0Wtxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=imsQVxGqa9fFrRWxNCR9zgjDLTnjTaOmEGivbowaHfjLxuOmXBe0p89xJniAjfTcm
	 eAFfUDIPIxlSCe2zTUV5GkWDg2oA/aPN7bCW6rOiKCDgI+tqnJX3B6hXhvXMJ0Y8EO
	 GrXJ8aW9eSErrNGfFzuqQIiQY+GJPI5EcbtfEyGFCpLJMcFRUYQ9HhYi9lHBaTjm7f
	 jmuq3G6x7Mo4x/UNgkIQqE0JV+W2ISHTIPUPE/RgTyuh9sMqt2ypohoJ7aMErxOLZe
	 NzHTfQ7Vzn5cSMMYPqAUZL6ugmb7MUv75RFVOTjgmmOP0KO8yzRNmk5dybeJpTdHeg
	 8jpqLr0mOEiPg==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: quic_msavaliy@quicinc.com,
	quic_anupkulk@quicinc.com
Subject: Re: [PATCH v3] arm64: dts: qcom: sa8775p: Populate additional UART DT nodes
Date: Wed, 16 Oct 2024 10:32:18 -0500
Message-ID: <172909273718.703216.13740540662164279886.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241007091407.13798-1-quic_vdadhani@quicinc.com>
References: <20241007091407.13798-1-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 07 Oct 2024 14:44:07 +0530, Viken Dadhaniya wrote:
> Currently, UART configuration is populated for only a few SEs
> (Serial Engines) in the sa8775p DTSI file. Since every SE can
> support the UART protocol, usecase or client should have the flexibility
> to enable required SE for UART depending on the specific board version.
> 
> Hence, populate UART configurations for the remaining SEs in the
> sa8775p SoC.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sa8775p: Populate additional UART DT nodes
      commit: 34a407316b7d37e5697c906b15bfdcafa3f6383c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

