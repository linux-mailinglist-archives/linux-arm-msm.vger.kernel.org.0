Return-Path: <linux-arm-msm+bounces-43444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7999FCEC7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 23:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD65F3A034E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 22:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E67111DD0EC;
	Thu, 26 Dec 2024 22:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i6AEISD+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96CE1DCB3F;
	Thu, 26 Dec 2024 22:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735252763; cv=none; b=YavkLVjyKau/WHlihXU1o82iGS/jO3MpePsKcZ8E+F7AfSf+VQVL0ueP92Fs7WFcl7bGK7jICrTLEMGvpC6Ih+tBMZ1ITdtedN8fqHusYrAiQ1rmzMsVqtccezBnXA4odP80m85skePDyeeS3f34JfS0nomz/j51i6amaoV9XVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735252763; c=relaxed/simple;
	bh=k58/FTcj6bQl55vlQZRkH2T60T8N4MotkQ2++KHievs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NIy/YjxbZElwYKfiA6bPk61maRmyX74xLv9UdJfT4hFNEepyMmbMrztGtzcCbesBL9tNApHWjDHgeey9RpOSCxUMDqulzEOnjHeoB/H0fSpbMawwa+BKeb7RHNLmYGSTgbGDlVh85TVJLOoJi2OMYdMMNTHbsqjpJXyfAL7TWF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i6AEISD+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5578C4CEDF;
	Thu, 26 Dec 2024 22:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735252763;
	bh=k58/FTcj6bQl55vlQZRkH2T60T8N4MotkQ2++KHievs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i6AEISD+Hu2XUhE1KTgvK/UzrS88QXbGlQRSnauSn670r2K9HQir38wNSpbrTcbl1
	 FerIYnaTR0ZBkL9ofnBn+JuvzQ8gq4y+o4YHguXavz31VvPCNzSASBoKVgXNjEOkZq
	 1YwNzTgr2SVb21k3OC80kQfNptQGyQoaBQIRsRZK3K9G3vudtm9Yiq1U75PY0Yf1oJ
	 2zec/s6XceTCLgPU8i9blgkQb3kCaRSlwENNZm56RSOBbHBTZvwoDKjFsZ+gG0nh2D
	 e2dTl9CYwNbXzrQWjM+QHeB2XRzfhbRVPjIajijhoGjnGMtZM7yCQfsFUjkMcIEHs/
	 Vkox9/pKj2F8w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Song Xue <quic_songxue@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@quicinc.com,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/2] arm64: dts: qcom: Add DT support for secondary USB on QCS615
Date: Thu, 26 Dec 2024 16:38:48 -0600
Message-ID: <173525273262.1449028.3428983152056785105.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218-add_usb_host_mode_for_qcs615-v3-0-d9d29fe39a4b@quicinc.com>
References: <20241218-add_usb_host_mode_for_qcs615-v3-0-d9d29fe39a4b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 18 Dec 2024 20:12:55 +0800, Song Xue wrote:
> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> 
> These series aim at enabling secondary USB on QCS615. The secondary
> controller is High Speed capable and has a QUSB2 Phy.
> 
> Base DT Support has been added and is enabled on Ride Platform. The
> secondary controller is enabled in host mode.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: qcs615: Add support for secondary USB node on QCS615
      commit: 2be96096148f1a8c51e4ac99753b41f4d532b99c
[2/2] arm64: dts: qcom: qcs615-ride: Enable secondary USB controller on QCS615 Ride
      commit: b8993bd786c1681ce0aa65b7a04159bf712c1e21

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

