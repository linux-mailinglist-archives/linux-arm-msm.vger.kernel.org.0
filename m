Return-Path: <linux-arm-msm+bounces-13393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D74C872D63
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 04:14:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34D4E28B416
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 03:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA86DDA8;
	Wed,  6 Mar 2024 03:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MxXdAUKp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED33A613A
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 03:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709694894; cv=none; b=SYYkrNYWpfzYzAl/bJ6epBNdEVsfEs3B3gwtZQXh5nHdO7iiCOv1U1AjsVkdW5ADUGEvmi2fZdT4BhzxVACpVV6EALDEU/SPB/VmLUeBWxkUJ0hfGWwjUXXbJMXkXCYRRAX8I89yprrOFwGT+jUUXVes99jibdM9UWu6inSynBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709694894; c=relaxed/simple;
	bh=Mi8Pps2ER29aS/cGDIlCdrUKl672t/QELQjvrPfPrOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XLCuv8dQFXt/TH8Gxl5vKJv8yVMQykTJJs46qNjo7tafUjhrETsBLAGM8BMD0mhPwoj5m6giztSUkLQ4h4vhczcXaQyGZPZJtxqjIxxqSK9CkzuZgydtPcr2SCYa8ge1utOOmXAg+EWkmsyqW3QkhC81U/Sovqm3KpP7uPQnNFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MxXdAUKp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A66BCC433C7;
	Wed,  6 Mar 2024 03:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709694893;
	bh=Mi8Pps2ER29aS/cGDIlCdrUKl672t/QELQjvrPfPrOA=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=MxXdAUKpoxK1O7z4o+qNy8OYXMQDj4ikarlEwiH3LzDMFe34gdtrMyUMpHrWYAKnT
	 EGsgHjiAIs+GMFUnLNONRRvB4s/e86VIY0GEetxKnAkH2Bh3b6cPcJmvnJSTgQC2Bt
	 bpJgXUaqxC6yL096KeoxfJKS7rFJRzjJ9l+KghdYyLZBj+J87ynGknk7gXXvmumFYS
	 0Jcfv5YQiuheUUhRuZlcBHKCgAOmBodjARTQnx5k280b8p0hiWabM8lP5fFP7CnEc0
	 YZZhl2tJZ2ElMUCYMRjf+/xKzScyhBU1JFKxfn9j+txjwtKamenrvPMSCHzdTtZQqx
	 XR0vl+ZQV2C3Q==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Jianhua Lu <lujianhua000@gmail.com>
Subject: [GIT PULL] A few Qualcomm Arm64 DeviceTree fixes for v6.9
Date: Tue,  5 Mar 2024 21:14:50 -0600
Message-ID: <20240306031451.4545-1-andersson@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit f176168bcb95bd1fdd32f5a794e68b7a36ac8740:

  arm64: dts: qcom: sm6115: fix USB PHY configuration (2024-02-20 11:54:53 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.9-2

for you to fetch changes up to 2219626708d7300402a46c31e2347d40db7c4971:

  arm64: dts: qcom: sm8250-xiaomi-elish: set rotation (2024-03-03 20:06:13 -0800)

----------------------------------------------------------------
A few Qualcomm Arm64 DeviceTree fixes for v6.9

This corrects the orientation of the panel of Xiaomi Pad 5 Pro, and
corrects a typo in the size of the SPMI channel register size in both
SM8550 and SM8650.

----------------------------------------------------------------
Abel Vesa (2):
      arm64: dts: qcom: sm8550: Fix SPMI channels size
      arm64: dts: qcom: sm8650: Fix SPMI channels size

Jianhua Lu (1):
      arm64: dts: qcom: sm8250-xiaomi-elish: set rotation

 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi | 3 ++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi                     | 2 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi                     | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

