Return-Path: <linux-arm-msm+bounces-20509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC178CF7BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 05:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 632CD1C20F3D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 03:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C43613A407;
	Mon, 27 May 2024 03:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="exq3Cc5v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E4A13A3FD;
	Mon, 27 May 2024 03:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716778868; cv=none; b=qpqXZV1E5F+tVqKeiWP6d2xrOXmzRzhwt3aIMEaL8x/w0Hqescbqn9oshjDCU8hK4KuXeSL0Oe4Zfel/TfARW1rjt56TyX1GLjvN/elcyyVTCAZj+vPKIzuBtMIMvPkSDYynPqpbgR0MNRBtgkVQXV0jX5dT/IW0+dnaMCZOZAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716778868; c=relaxed/simple;
	bh=3UUWW8pNGwncIJYmIh3YqM5SaE0Ly9Tv2K3dJt7dJfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KHpxrJ8IZYM0wIS+I5WcGZng/9F6bEHoHcYzEX2gn9W+q7wLEFa1116UfFpqMAMIYmPQK5ZLcLCz+cMTqtf+oqnw++FKe3r1ZeskpBrq+aAxiE/wpTO+MHoE9Grn95MHmsDcvRxQxA0OwMvSc9de3gbU+GDBi/9ZOKIpQQLAInI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=exq3Cc5v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02952C4AF0B;
	Mon, 27 May 2024 03:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716778868;
	bh=3UUWW8pNGwncIJYmIh3YqM5SaE0Ly9Tv2K3dJt7dJfo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=exq3Cc5v4hARVBHmuDbJ7/LXh0c3wy0mLNijLBK5mVSt2f4SKUvG+pIVRtu//uuKz
	 xZptY9tgkhObZXrH9XFSBTw6rXeJz2C5Q0NF6LKq7ss920+PL00J9VvPGiZOUFvlL9
	 DErVp8uqwOvN1PouGEZgp64I1zz36A/LHMyIAd3pHFWN7axzbHjp5selT6Y8QKurXO
	 9ccg0M44R6Ch4UqkmYaOzIOQfGi+aYj2clAU+oxKaxD7nlyKcp1/emQFqBpdCDvOZn
	 BpHGppVNW60vurqTJdG/4ss5Mq/c5pn+kcGE3gOVdHojR/oeDUlaH5P8c4VRo0yv2T
	 Z2CKvKzTtEQyw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	quic_wcheng@quicinc.com,
	quic_ppratap@quicinc.com,
	Jack Pham <quic_jackp@quicinc.com>,
	Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Subject: Re: [PATCH v3 0/3] Add devicetree support of USB for QDU/QRU1000
Date: Sun, 26 May 2024 22:00:35 -0500
Message-ID: <171677884216.490947.15542872851220074249.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240502090326.21489-1-quic_kbajaj@quicinc.com>
References: <20240502090326.21489-1-quic_kbajaj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 02 May 2024 14:33:23 +0530, Komal Bajaj wrote:
> This series adds devicetree nodes to support interconnects and usb for qdu/qru1000.
> This is based on previously sent driver series[1].
> 
> ------
> Changes in v3:
> * As per comments on upstream[2], to get role-switch working on QDU/QRU1000, it was recommended to
>   use the actual TI switch driver. Since driver doesn't have the functionality to provide role-switch
>   based on gpio, thus reverting back USB dr_mode to peripheral and removed the remote end-point nodes
>   and usb-conn-gpio based role switch functionality.
> * Link to v2: https://lore.kernel.org/linux-arm-msm/20240319091020.15137-1-quic_kbajaj@quicinc.com/
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: qdu1000: Add USB3 and PHY support
      commit: dd1bd5bf7420497aace9521d314f6c7e22f22118
[2/3] arm64: dts: qcom: qdu1000-idp: enable USB nodes
      commit: 00ea07cd1c884efe4b02a5a61794673054547488
[3/3] arm64: dts: qcom: qru1000-idp: enable USB nodes
      commit: 4d3fadbcd63372e9a1cd15701f882ece252437f4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

