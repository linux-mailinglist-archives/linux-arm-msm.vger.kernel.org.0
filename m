Return-Path: <linux-arm-msm+bounces-33385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DB1992F18
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 16:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77EC81C23842
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681E21D7E52;
	Mon,  7 Oct 2024 14:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="idn3JQjH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE1E1D7E43;
	Mon,  7 Oct 2024 14:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728311175; cv=none; b=LOTTTN7mkO5VLWhmHz0JK6db0kPRJGR9EEmOfHwtRCa2w/VZvF+7/DKHcsVVCY6fjZB2XLNRxXlnZttVEEZuQ725Nmkr/gn0EbNRXQy7AxLKr33ZEEUu2IFbx5Kq2hm2EZhhIm+rex8uWraapbeEFACgT8/Ly5z3s5xfhetq+N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728311175; c=relaxed/simple;
	bh=Qpn6lq+n99M9ctlpXOpkNXXH3xUvsDhnI5sWZnniLL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IG4api5enkFCmNSEQG6vlfjkKVB1h/u6SMG3uUSo2suBVY0b27Mf7Fh1jIrNDcJ9nkTSYR8XeDuq/31YcwxojDBB/as7tphZcTIqtkoMa2FR2hiq0WM21J95TJoLod6sTiUUsWebiZ2f6Db1OGuoOrDdtaR72t4qmXW6ZgXQwIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=idn3JQjH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57D4C4CECF;
	Mon,  7 Oct 2024 14:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728311174;
	bh=Qpn6lq+n99M9ctlpXOpkNXXH3xUvsDhnI5sWZnniLL8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=idn3JQjHTYPZZFBmtK8GCWBPOiqf8SLu53zyzSgwEbUfFng7JOu+YvV4TkFM6Oxv+
	 Mf+JMJfRumVPuxgyNB7kUo7sqekyHv6RmSnFoz3bYcm4L2MtI7ToxYoHR8O78c2Eiu
	 w/dwzlNs1yHg8A6SK1jNtk5NOBpIN0ry+eKaympHHRsPwz5nRKWdEwsHIMZ8+u7EOv
	 UV8aOxzxBuVGoqThLeZCwbPpYsv3vaIsBQHZXz4ZVXimfyGMT/ZSHAfl/mxNycho3z
	 alZnME1nOEbF/Rdl2Iz4YtGNVdJUs8iGWQTICBP9hUEIwXHwbYlF6aaomnLhI9sPFF
	 IntDz02JGRaXQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Danila Tikhonov <danila@jiaxyga.com>
Cc: cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@mainlining.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7280.dtsi: Fix PMU nodes for Cortex A55 and A78
Date: Mon,  7 Oct 2024 09:25:49 -0500
Message-ID: <172831116169.468342.10842918461950102674.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240818192905.120477-1-danila@jiaxyga.com>
References: <20240818192905.120477-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 18 Aug 2024 22:29:05 +0300, Danila Tikhonov wrote:
> The SC7280, SM7325, and QCM6490 platforms feature an 8-core setup
> consisting of:
> - 1x Kryo 670 Prime (Cortex-A78) / Kryo 670 Gold Plus (Cortex-A78)
> - 3x Kryo 670 Gold (Cortex-A78)
> - 4x Kryo 670 Silver (Cortex-A55)
> (The CPU cores in the SC7280 are simply called Kryo, but are
> nevertheless based on the same Cortex A78 and A55).
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sc7280.dtsi: Fix PMU nodes for Cortex A55 and A78
      commit: 89f324ef54a2aea7d076af47ae801d0eada3a640

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

