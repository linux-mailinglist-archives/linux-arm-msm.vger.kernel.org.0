Return-Path: <linux-arm-msm+bounces-51555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6342FA63C32
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 03:56:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6978D3A860F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 02:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2CA017A2E6;
	Mon, 17 Mar 2025 02:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NtCtkm4O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B891779B8;
	Mon, 17 Mar 2025 02:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742180168; cv=none; b=URMU/fEeIyIFFVyKX8w72jRZVwEz3wSHzfXkoPVsErH4eZoSU41T/BkOCiIuoIrKvmBOAXOxVHBI6RRSZDpP9cUZhljjAEdnQ55vLxYZVXz14OgBFWQ8bQgMrJUXu3WNC/NdsAHChZG1WcmdTcBeEbQ7onvqE8MN5rdjPZEGlLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742180168; c=relaxed/simple;
	bh=e+LbIGsq+/uKacbu9BpmdkMS6dqJUPB/4Js4D2ZYzQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q9KO4ENx5w9G2uGtP/m0+exunblblch0V2mJkNyEnjwAXe86qUVoFjK0FmFvIzUwd/zLxx5dWwk4uP9VbfB7Ouy9HF25c3D4E0VlAMyK1uTsQ1CCdWQXIAMMtseWNgkDU6mad+/06sjWJe/u0KlqxNi9luZpG82ZQXFWfUjSHEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NtCtkm4O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E54A0C4CEF3;
	Mon, 17 Mar 2025 02:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742180167;
	bh=e+LbIGsq+/uKacbu9BpmdkMS6dqJUPB/4Js4D2ZYzQo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NtCtkm4OzFfV6X248jI8ZoYviL0k6hziqZPhgduloTLqHF6vEQ6gzBDwH8XgiqEBA
	 EW+aE8aWFuEUisk5H1LUPDKhYRGb32QwlZvNfQQPidSJLaTzAu9pJnCOSvL5Mupezz
	 DvMvtSSxYnoKb44Est62e2Tf2iiM5gxAILMtrgZGM199xIVITJw+6jVXrAwF2HUnAx
	 arGEDalykBRi0f7Z+kgzaOnf9h6Vklu9gG2wBvfAtHFI79UhpW5yFnRGwF16M7sj+2
	 NJRB9vivOX5GQsSxXqT4CrkIiTTPponiual/hD2TL/N5RmRzrG00xYCQgqJFNEe5XN
	 LQzSwr7l5QDJQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Ivan Belokobylskiy <belokobylskij@gmail.com>
Subject: Re: [PATCH v5] ARM: dts: nexus4: Initial dts
Date: Sun, 16 Mar 2025 21:55:47 -0500
Message-ID: <174218015903.1913428.10631944478682732878.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250316-lg-nexus4-mako-v5-1-79feae815a85@ixit.cz>
References: <20250316-lg-nexus4-mako-v5-1-79feae815a85@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 16 Mar 2025 23:16:55 +0100, David Heidelberg wrote:
> Add initial support for LG Nexus 4 (mako).
> 
> Features currently working: regulators, eMMC, and volume keys.
> 
> 

Applied, thanks!

[1/1] ARM: dts: nexus4: Initial dts
      commit: f5b7564fedcfd32df68d56781b9d7698343f8fbf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

