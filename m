Return-Path: <linux-arm-msm+bounces-41511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB8A9ECE68
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 15:17:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AB8C283535
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 14:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2466A2AD13;
	Wed, 11 Dec 2024 14:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nUpoyfDf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90E1246327;
	Wed, 11 Dec 2024 14:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733926640; cv=none; b=KmIlgOZFw8SQTbzjBzjwXBQBE4p2rLIzseXVs2Z6xWuF+r2DzeaXikPGQMMlWH/nh2rcIw+hm3VaEpbs6B3NrEpOxuxjm4+1DubA9BRHBaLJ1RQE/y9Ndg5GGeP1cVzk/yxEEptQAKoJSLzez75Tzz2TnIlvkf4ULhzXYS4bwqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733926640; c=relaxed/simple;
	bh=N7KSf9akni5H7TEYLYecZI6O9qIDNtn/SvQPjjm5be4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QmNQzMP6Ak4Ptw21RxiDrlYuxOX1ZIZ6xCV+P8KazrhtMpW85+P9EdCwFFXji3He+Hhi/mEuXeIo8YcuR8ZrLG8TibngH//SawAKJijctAHvXTtTgw4M99IIxulOerV7DiW+nm40bFp/BY6BYEN+38ER7N/eD1HlsIHOrZIIg/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nUpoyfDf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89ED9C4CED2;
	Wed, 11 Dec 2024 14:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733926639;
	bh=N7KSf9akni5H7TEYLYecZI6O9qIDNtn/SvQPjjm5be4=;
	h=Date:From:To:Cc:Subject:From;
	b=nUpoyfDfWgC4aGLntVK3aj5RP6hEUcz4f7bZzbFKbF9PYPQGY6E7fyy/RwQCgdVOM
	 /qUSOH7mlwdGMpcmQGaidcx5DnOFvE2CNA6bPeVp5RqZHqKH3mAKJYN4QWYkx+DIwe
	 ZBRj++4T97rl9o59OpOMw1XXt0z+r/XCeWISLHdey91o5YEcNsG+Lxkjjm8hDQTwgw
	 LkofJETIPsx1REdLzUyKcL+TpqHxi/HVBG9tud984+e2iuHu6LYD/cpKArgrsz11f8
	 C9F6uGuActwcas3Qh2jWL+TGsymR+olSa0oLImAMQoAmFvHApZyBQ/rjp2mEeXVt9U
	 fymGzEkjDzGYA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tLNWk-000000008Ru-2W4P;
	Wed, 11 Dec 2024 15:17:23 +0100
Date: Wed, 11 Dec 2024 15:17:22 +0100
From: Johan Hovold <johan@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: mhi resume failure on reboot with 6.13-rc2
Message-ID: <Z1me8iaK7cwgjL92@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mani,

I just hit the following modem related error on reboot of the x1e80100
CRD for the second time with 6.13-rc2:

	[  138.348724] shutdown[1]: Rebooting.
        [  138.545683] arm-smmu 3da0000.iommu: disabling translation
        [  138.582505] mhi mhi0: Resuming from non M3 state (SYS ERROR)
        [  138.588516] mhi-pci-generic 0005:01:00.0: failed to resume device: -22
        [  138.595375] mhi-pci-generic 0005:01:00.0: device recovery started
        [  138.603841] wwan wwan0: port wwan0qcdm0 disconnected
        [  138.609508] wwan wwan0: port wwan0mbim0 disconnected
        [  138.615137] wwan wwan0: port wwan0qmi0 disconnected
        [  138.702604] mhi mhi0: Requested to power ON
        [  139.027494] mhi mhi0: Power on setup success
        [  139.027640] mhi mhi0: Wait for device to enter SBL or Mission mode

and then the machine hangs.

Do you know if there are any changes since 6.12 that could cause this?

Johan

