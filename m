Return-Path: <linux-arm-msm+bounces-35518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A769ABCE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 06:20:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F21911C22906
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 04:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D84158848;
	Wed, 23 Oct 2024 04:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UqFU62TW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FB915855C;
	Wed, 23 Oct 2024 04:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729656991; cv=none; b=s55/KfUsjhvxTsdCV3dHaRFE9zmQeR7owKRSTsB/JVwJBRKiGSGUcv7GLudWOZPYv18yqqwY4uTkegKBztacJjPBbiyv4jyE79YcpSFMYxeTBYO+WmYo4Shsa8scELR6ACaHwLIANPtRzTwxcc2GsINa3+TD0oeuzIE8VumpnoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729656991; c=relaxed/simple;
	bh=L1ZYUbrvPJkvsP28nZNfm2uGcUNd1lxsQvGmP0lMWYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uB1ZeEYSciYunMF9mzeDw6rswq6Z1YbP1NuvZGDwoRTW17Xo6x1APMstT/OX7pnnvXUGnQ5If930THM9EwfhDMD26aWCLWi6D3KxXRcbudgDsLf2h/Tbqr8u9o96fnEhD+J1p+a5UcgkBVn2z/jf8GezF7vZF01az7yyh2SqqnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UqFU62TW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCF42C4CEE8;
	Wed, 23 Oct 2024 04:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729656989;
	bh=L1ZYUbrvPJkvsP28nZNfm2uGcUNd1lxsQvGmP0lMWYA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UqFU62TWeNWHmYQVQKZIRz1B2Fa5jkeeaZ5URRh9Nh+iFjR9BaSfpqGydzZG7L1Hb
	 WgOT0aLbhRQmqQzAjEtwvXy17YtrqWcwM0U0Geb7Nkr259gQOA3Xc43Y31/mT8/OAv
	 afy9y8NDYpjLaGbRaIqakaVGOlcYKoNGpGuW/gmyYZOBZ4pDPnD01p8Pse1F5s5wrl
	 Hp9jjKBeg4rqlUlFhs9l2/Q8Ncply1Tr61eFkr186txcDLAzz4mlqp579E3ELBjeLe
	 b5yihfC6tUFZRm5Xm/kM5zeT/R7QoOBhfZb3i3M5eepDMcGIrFKDbp+5R6Jxgsk7Rt
	 XfLdWcow18iyQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: quic_msavaliy@quicinc.com,
	quic_anupkulk@quicinc.com
Subject: Re: [PATCH v1] arm64: dts: qcom: sa8775p: Add GPI configuration
Date: Tue, 22 Oct 2024 23:16:05 -0500
Message-ID: <172965696391.224417.14904909946285903265.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241021102815.12079-1-quic_vdadhani@quicinc.com>
References: <20241021102815.12079-1-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 21 Oct 2024 15:58:15 +0530, Viken Dadhaniya wrote:
> I2C and SPI geni driver also supports the GSI node based
> on client requirements. Currently, in the DTSI, the GSI mode
> configuration is not added.
> 
> Therefore, add GPI DT nodes for QUPV_0/1/2/3 for I2C and SPI
> for the SA8775.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sa8775p: Add GPI configuration
      commit: 34d17ccb5db804ad38d63cbb997a7f98f1e94ee1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

