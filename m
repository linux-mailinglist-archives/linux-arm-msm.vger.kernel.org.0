Return-Path: <linux-arm-msm+bounces-57769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70115AB5E22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 22:48:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0711E3B5CC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 20:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B15632C0337;
	Tue, 13 May 2025 20:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HO94gk4Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867B2202C3A;
	Tue, 13 May 2025 20:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747169238; cv=none; b=BcwRH59JeG0g8YgRo69qowJ1nzxKbKFLV52bmH8OdoCKiKeKZRoE99rRHblIQ312Tje/hodEFPBqNF0BN3l3Rawm44p4BeQRkBy7wd8GcHNQRZP+NIdDW5nlHAsbilJZeOwx38KjmUTv2jWzsuX4t0uHcdINO4KtqL9y+drnlYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747169238; c=relaxed/simple;
	bh=WFkcdAog9uS7qjjo1kyQIavllnleuwDXLyC9TCbQIvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rkFd9eKWrYXC2D1ZEAkOQ9Nfio7WeyM4uYzgD0tljwOndW6vPxOT0sMOIbomTbsKpWeYsZ41/vxAdDrMzAFuuvBubnqzZV5UNXM5Ci/Cz7tD9kOwEQ+cql/oy9NjHS6QotxVN5JdICcm55YVuKNcES4UgpSP+g+KcFZC0Sc9A7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HO94gk4Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22F5DC4CEE4;
	Tue, 13 May 2025 20:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747169238;
	bh=WFkcdAog9uS7qjjo1kyQIavllnleuwDXLyC9TCbQIvs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HO94gk4YAynf6VzTG09oh5klOkIxJKaHjiCmH8W+TCtsyEarUiMxuiDcyu/sLIiHp
	 MzcQyNNdJL/iUP6G47SNlYvfandUYbOO0DY4YrfMjk7L9059SadaDtAGIe6Lio/bSH
	 SnGd15Z1oEx7wJ2Bs1eht7xw6m+UQ01feu82hGLSL8r0qTIbljLPEQpzyXOYALRg18
	 TZjd7hbQdZWbxL/6twCA8XczD4G8X+e5te2+7dBGP/f7wW/8CK5Q2HzXeQGz/hj7Nd
	 E+YJ5LEak+3Skpq0Vb5pmSVDAMumOxewm+9zCXH/2Mbqw1Czh3jN56iAGjSzr+0GBi
	 qr1mUIQV6z5Ag==
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
Subject: Re: [PATCH v4] arm64: dts: qcom: sa8775p: Add default pin configurations for QUP SEs
Date: Tue, 13 May 2025 21:46:45 +0100
Message-ID: <174716895371.39748.11271840586275593239.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509090443.4107378-1-quic_vdadhani@quicinc.com>
References: <20250509090443.4107378-1-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 09 May 2025 14:34:43 +0530, Viken Dadhaniya wrote:
> Default pinctrl configurations for all QUP (Qualcomm Universal Peripheral)
> Serial Engines (SEs) are missing in the SoC device tree. These
> configurations are required by client teams when enabling any SEs as I2C,
> SPI, or Serial protocols.
> 
> Add default pin configurations for Serial Engines (SEs) for all supported
> protocols, including I2C, SPI, and UART, to the sa8775p device tree.  This
> change facilitates slave device driver clients to enable usecase with
> minimal modifications.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sa8775p: Add default pin configurations for QUP SEs
      commit: b03342697435996c0dd1bf598b4e71ae5c4f94d8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

