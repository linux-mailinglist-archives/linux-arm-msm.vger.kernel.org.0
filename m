Return-Path: <linux-arm-msm+bounces-5155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD5F8169AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 10:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0D6128172A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 09:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1D59125A7;
	Mon, 18 Dec 2023 09:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="laIeTV1c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A728111C91
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 09:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702891073;
	bh=Nnj8pwz+fpNa9QDBex3iHeuPyjLLQIPz2CB3ijyOfLA=;
	h=From:To:Cc:Subject:Date:From;
	b=laIeTV1cw97pXPZh9qk6I1gPrTJRzk8ZLgbzeVZzl9V9vETbHbSd5Wk/dpr9IyJtU
	 dpkhdvjOZN5yPnyJOQTuKQXrsL6A4oHRawRtbk+DeQ19KQJwUkHhVZ40qT8t7qWQNH
	 xqXH+w0VOrFWMmQsblWsT6ltxdNHIV8sP83hSky6bvMEc1T3Okq3CFvskAoYyM8nvc
	 nSiNUxJ7odYzPncUx/tD1aQtvsCeXflkW1D8TCYPljZh/iitLa7PpDAP58r71d/s4+
	 7xOoVswcA1CFwzZffpmQPhwtPkzO74K+tWi4dsOj1VS2y7/lueosM1yFV9VmIZNePq
	 APWmP5fT7QC7Q==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7652537811D8;
	Mon, 18 Dec 2023 09:17:53 +0000 (UTC)
From: Laura Nao <laura.nao@collabora.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	kernel@collabora.com
Subject: sc7180 kernel hang with linux-next
Date: Mon, 18 Dec 2023 10:18:06 +0100
Message-Id: <20231218091806.7155-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

KernelCI has reported a regression on some sc7180 based platforms (lazor
and kingoftown Chromebooks) for linux-next: the kernel seems to hang
after initializing the SDHCI controller (~2 seconds in the boot),
nothing is reported on the console after unused clocks are disabled:

[    2.241767] mmc1: Command Queue Engine enabled
[    2.257574] dwc3 a600000.usb: Adding to iommu group 9
[    2.261398] mmc1: new HS400 Enhanced strobe MMC card at address 0001
[    2.270452] msm_dsi ae94000.dsi: supply refgen not found, using dummy
regulator
[    2.274496] mmcblk1: mmc1:0001 DA4064 58.2 GiB
[    2.294482]  mmcblk1: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12
[    2.301798] mmcblk1boot0: mmc1:0001 DA4064 4.00 MiB
[    2.307847] mmcblk1boot1: mmc1:0001 DA4064 4.00 MiB
[    2.313799] mmcblk1rpmb: mmc1:0001 DA4064 16.0 MiB, chardev (507:0)
[   14.899579] clk: Disabling unused clocks
 
This was observed on next-20231123 first and is still present on
next-20231218.

Full kernel log from a couple examples:
- next-20231205:
  https://storage.kernelci.org/next/master/next-20231205/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-nfs-sc7180-trogdor-kingoftown.html
- next-20231215:
  https://storage.kernelci.org/next/master/next-20231215/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/v4l2-decoder-conformance-h265-sc7180-trogdor-lazor-limozeen.html

Sometimes the kernel is able to get past that point, but crashes a bit
later - here's an example from a decoder conformance tests, the kernel
boots fine but crashes shortly afterwards:
- next-20231214:
  https://storage.kernelci.org/next/master/next-20231214/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/v4l2-decoder-conformance-h265-sc7180-trogdor-kingoftown.html

Any idea on what might be causing this issue?

Thanks,

Laura


