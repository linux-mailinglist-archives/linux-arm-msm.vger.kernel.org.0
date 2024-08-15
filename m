Return-Path: <linux-arm-msm+bounces-28693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58120953BE2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 22:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87BDE1C2234E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0FF4165EFE;
	Thu, 15 Aug 2024 20:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n3Leb1GS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7910A165EF9;
	Thu, 15 Aug 2024 20:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754486; cv=none; b=FrLeBZc+aTiZEI62LNcBZF2DmLLjirYmrbcuanifCHbus5s7K9Y9WxQHvJNOxXW1mS8bUklDQUxksHXr6Be7jNldCCveEqz9Q4qGvZS4SrjcnDLhzLzmuIjzaJOZ2nEiK7hsvYERJT9xs/VorZWRrMUuD+AG/R94N9/tj4TcyvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754486; c=relaxed/simple;
	bh=DAQDsr7WMOnC2+JYRtBFWNbxJISodWHpyV/SaX6F5DA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BcbmUCKQts5GXPJNfKhm2FW+lRI/JLXaNzTHSvrV/MT3ja1nVzEJAJxzB1RZEL6X4iekvakfAqdqLfYAwkaoCAswQjtnMdspoCaoza1pnYm8s09TOzTeWl5o/Uz979GH+gH/A3abF+fvEEqWqRp53ugz1aQZJKmgHQ2AN2W+pqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n3Leb1GS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E42C2C32786;
	Thu, 15 Aug 2024 20:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754486;
	bh=DAQDsr7WMOnC2+JYRtBFWNbxJISodWHpyV/SaX6F5DA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n3Leb1GSwKWO44rfHCf+0sjuepAtQ6zzgi5+4o1RTLxVgV2g6ucpOGyxjlph3vqOv
	 ey0FCp3DzxIM3dbQgiILjrngr1V8G4ba26M+agFe1k951TP+6YlHHF2f9SlinRim5v
	 Kz8bmvF2q/au2vxtx2FGpreLkqL11m+J+SZH+YZeGIJo00yDabrJBE2g2kwPcONWpG
	 ioNDAk8n9xXtpf9UNJoSToexJ4fcgqrqSA3XWRlkZq25lyqTtN3HQNMGO1x/EKuAwS
	 O8uHV5WW00QX74tyrynqDRDodDEgC/eMiOFqRG031Zw/x42Yxlzi7Qd02OwRMDNRiP
	 GZxznr+7U4muA==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Mukesh Ojha <quic_mojha@quicinc.com>
Cc: linux-kernel@vger.kernel.org,
	robimarko@gmail.com
Subject: Re: [PATCH v2] firmware: qcom: scm: Disable SDI and write no dump to dump mode
Date: Thu, 15 Aug 2024 15:40:39 -0500
Message-ID: <172375444804.1011236.8458670417053252638.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240708155332.4056479-1-quic_mojha@quicinc.com>
References: <20240708155332.4056479-1-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 08 Jul 2024 21:23:32 +0530, Mukesh Ojha wrote:
> SDI is enabled for most of the Qualcomm SoCs and as per commit
> ff4aa3bc9825 ("firmware: qcom_scm: disable SDI if required")
> it was recommended to disable SDI by mentioning it in device tree
> to avoid hang during watchdog or during reboot.
> 
> However, for some cases if download mode tcsr register already
> configured from boot firmware to collect dumps and if SDI is
> disabled via means of mentioning it in device tree we could
> still end up with dump collection. Disabling SDI alone is
> not completely enough to disable dump mode and we also need to
> zero out the bits download bits from tcsr register.
> 
> [...]

Applied, thanks!

[1/1] firmware: qcom: scm: Disable SDI and write no dump to dump mode
      commit: 79cb2cb8d89b7eca87e8dac031dadea4aeafeaa7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

