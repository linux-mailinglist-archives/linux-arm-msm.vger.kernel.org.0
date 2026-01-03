Return-Path: <linux-arm-msm+bounces-87319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BD0CF02A6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 17:03:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E26A302E846
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 16:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E1C24728E;
	Sat,  3 Jan 2026 16:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="duMaAzaM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C18214813;
	Sat,  3 Jan 2026 16:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767456188; cv=none; b=gYl5LbsFyweRSiIFBz2swFM0srBufwfovB1b1j7bcjePg5qIRRznAGZsol/WjbizROwX8EDSpyW20kdZw0wZv4KTjx2ZWeRoy7sAYHluNexvyfTASO8WNnKMZwiJ0IFYLfouT+oWPm9B820j8bVwsucYY4o/FBmWFGhFU/F1R98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767456188; c=relaxed/simple;
	bh=gIL8ulO9lH6cOY/Czscj2CMXBaBBo/PWtLSF0BvcsYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h/v7dN23JZmKXeFZL1KrQfWWR9K/0YTpMGxInVLOCPQ0SvbLoniH88RDt0IlF1bLJqAND/1QwUXUimjkk06kCADnjmxjbN8VnU6MN4q3qsPHcbN4yYP5Yd+XDN9GdpL8D2EPNCz91AvxYlq5yukaIhggRP2b+dZeV/J/LliQS1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=duMaAzaM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF477C113D0;
	Sat,  3 Jan 2026 16:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767456188;
	bh=gIL8ulO9lH6cOY/Czscj2CMXBaBBo/PWtLSF0BvcsYE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=duMaAzaMpTKm9aq2R5kxKm8M4JFL+R71zcn87iJ14o95SWrvDbU/3+mmLzz7jPOoX
	 0+RUDM2nQ6sQUy6kqBrkLFiSiShPkx/ukEhoHk+14dR+FHxf1Ljsf1aDSsOocbfZKv
	 dxaudxXHz+66tkl/EK5iCDJN/0i2jg/h+8i/ap5dlWyMUDQq/OppfS0A8QQnhZ+zn/
	 duYKA6bfHV6W9Vip06k3wpSjEWVDw/mO9+bCRn82BVJ1hePqHoxaQA5xeo1ZoYvj3U
	 PKJIqGXln2A6/v1YHyyQt6EfIYOytTVrmsemq1976QiWS72nJX8O3RU2TCiCjGeNx0
	 CSiCMNBEysnCA==
From: Bjorn Andersson <andersson@kernel.org>
To: amitk@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	konradybcio@kernel.org,
	Gaurav Kohli <quic_gkohli@quicinc.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	quic_manafm@quicinc.com
Subject: Re: (subset) [PATCH v1 0/2] Enable TSENS and thermal zone for QCS8300 SoC
Date: Sat,  3 Jan 2026 10:02:57 -0600
Message-ID: <176745617455.2631416.16667002436039449107.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20250822042316.1762153-1-quic_gkohli@quicinc.com>
References: <20250822042316.1762153-1-quic_gkohli@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 22 Aug 2025 09:53:14 +0530, Gaurav Kohli wrote:
> Adding compatible string in TSENS dt-bindings, device node
> for TSENS controller and Thermal zone support.
> 
> Gaurav Kohli (2):
>   dt-bindings: thermal: tsens: Add QCS8300 compatible
>   arm64: dts: qcom: qcs8300: Enable TSENS support for QCS8300 SoC
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: qcs8300: Enable TSENS support for QCS8300 SoC
      commit: eb1bcc1d3b4b6c7f7dddbe62ac229e4e3d8d5f8d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

