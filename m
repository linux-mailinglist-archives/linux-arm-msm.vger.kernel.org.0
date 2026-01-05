Return-Path: <linux-arm-msm+bounces-87472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E9ECF43C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:51:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F18430D4D26
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E457331A79;
	Mon,  5 Jan 2026 14:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y/N5ynyS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50ADB3314D2;
	Mon,  5 Jan 2026 14:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622088; cv=none; b=GWe0mjdILVCOFcBXIvjWECDikz/PAEKLKCKXdL5NrsXeb80aFf5HnS8eWWH54H4RhSKaUmHUbgqNdg3gl4ZGpMQ0KYU16+ftdvNFriXckOp9Tknpk8Xj9AGdovY559VyxF5tgQ964slxoczcHmte34kbYpOjQmGwGnoDyNoaUzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622088; c=relaxed/simple;
	bh=3xxJp/7OG4sa+sXyZRDBn6KCilsJC44qUUJVLCQWBrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UBlSc4ldvp/YgkPEWnGqsk9V9fH4ah9BtAKkhudUlRRG+88ho/wmqcocWmFwqieKOJfjmqvzmloJ4RE5EGmTRaCN5dRXOhG/nfJkI+vpus/7CcinrZz6fjoACFiebWYAeMfgTbMgp3H/1djh3UH54wuxj1Bco4asTAh5NYLuko0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y/N5ynyS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD10C116D0;
	Mon,  5 Jan 2026 14:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622086;
	bh=3xxJp/7OG4sa+sXyZRDBn6KCilsJC44qUUJVLCQWBrw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y/N5ynySYXd0zN7ellUDan8+4naf0tzJNMOCiF7tepWGp33hwbxPY+jAUhWUoDbYK
	 FMzzfZIS7SIWpO2gN5v/x5WV3cq82By5d0VXSkX1dC0wCEDiiZzJFXZzbxk+CO8fVD
	 tzrfcFjhAJ1W5MVdmkn2Pq3PgOX7Eksf7xRtsxfhYYdqQt8711BVoQVB4HPjt4Swmv
	 7H93G3jM6ZnEOodKXP6iliOFPmeipTsoEIiIUH1NJP85Xod3wxNV0Ay0GRsOonJRj8
	 H3DLbgeFvzihVFtPNWTBsuEzaBkjxHKuiHXc6yM1a0ae2w3vRJrACCdadeTLogljpu
	 w89YesD8eewiA==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: lemans: Enable cpufreq cooling devices
Date: Mon,  5 Jan 2026 08:07:18 -0600
Message-ID: <176762206384.2923194.6538644737972410455.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215045451.3150894-1-gaurav.kohli@oss.qualcomm.com>
References: <20251215045451.3150894-1-gaurav.kohli@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 15 Dec 2025 10:24:51 +0530, Gaurav Kohli wrote:
> Add cooling-cells property to the CPU nodes to support cpufreq
> cooling devices.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: lemans: Enable cpufreq cooling devices
      commit: e95ddac66a77077a021c9f2e6b3cf6dc236b655c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

