Return-Path: <linux-arm-msm+bounces-61805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6BEAE07F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 15:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 569EC3AAC8D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 13:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E8F328B7D7;
	Thu, 19 Jun 2025 13:53:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2991528B7C1;
	Thu, 19 Jun 2025 13:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750341188; cv=none; b=Zk4xTDbii5Kbz/hUO4c9kemkjxIN0JANJeHKzvTua7QYzQ3xnRI7NtnUxj7uD3xofo6O5VAPWDPsfM4EuQ2oYW2Pmt0rnDZS0VrdofdoVUxiIU9G7MqIMnEEB7hn2tInfreSpLhQMA32OzRGEb24thRyUhMspDZydwP+m7rZjKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750341188; c=relaxed/simple;
	bh=e3IzxRN2+kK4nKfbjnHQ1KUE0dymxfbZ2bnFd+F9r7w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Liq3e/V+tdMKiI9K/lTytg3BRcztdLKjzGZM+6SBucpkxB9gjpWldxXDoKs8VhzHkrnCNlHCIWsyxmV7rh32kL2Cu/tx5OjCIm7w8lOjxzcQ5QidKjBkDwvFHfo/Jgz0FMWf/NcuLc5uOPB8EXykLrKB8Ikj+DlD6PqiWwOSNxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57F7C113E;
	Thu, 19 Jun 2025 06:52:45 -0700 (PDT)
Received: from usa.arm.com (GTV29432L0-2.cambridge.arm.com [10.1.31.86])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 37AB63F66E;
	Thu, 19 Jun 2025 06:53:03 -0700 (PDT)
From: Aishwarya <aishwarya.tcv@arm.com>
To: quic_nitirawa@quicinc.com
Cc: James.Bottomley@HansenPartnership.com,
	andersson@kernel.org,
	bvanassche@acm.org,
	dmitry.baryshkov@oss.qualcomm.com,
	kishon@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	manivannan.sadhasivam@linaro.org,
	martin.petersen@oracle.com,
	neil.armstrong@linaro.org,
	quic_cang@quicinc.com,
	quic_rdwivedi@quicinc.com,
	vkoul@kernel.org
Subject: Re: [PATCH V6 10/10] scsi: ufs: qcom : Refactor phy_power_on/off calls
Date: Thu, 19 Jun 2025 14:53:02 +0100
Message-Id: <20250619135302.9192-1-aishwarya.tcv@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250526153821.7918-11-quic_nitirawa@quicinc.com>
References: <20250526153821.7918-11-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Nitin,

When booting the kernel from next-20250619 on Arm64 Qualcomm boards
(RB5 and DB845C), we observe that the baseline bootr test fails due to
dmesg.emerg errors in our CI environment.

A full git bisect (log included below) points to this patch as the
culprit. The issue was introduced sometime from tag next-20250616 in
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git.

This issue is not present in v6.16-rc2

Here’s a sample of the failure observed on the RB5 board:
lert :   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
kern  :alert :   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
kern  :alert :   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
kern  :alert : user pgtable: 4k pages, 48-bit VAs, pgdp=0000000102c4c000
kern  :alert : [0000000000000000] pgd=0000000000000000
kern  :emerg : Internal error: Oops: 0000000096000004 [#1]  SMP
kern  :emerg : Code: a90157f3 aa0003f3 f90013f6 f9405c15 (f94002b6) 
<8>[   30.933289] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=emerg RESULT=fail UNITS=lines MEASUREMENT=2>
+ <8>[   30.943798] <LAVA_SIGNAL_ENDRUN 0_dmesg 1000325_2.4.4.1>
set +x

Git bisection log:
git bisect start
# status: waiting for both good and bad commits
# good: [9afe652958c3ee88f24df1e4a97f298afce89407] Merge tag 'x86_urgent_for_6.16-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect good 9afe652958c3ee88f24df1e4a97f298afce89407
# status: waiting for bad commit, 1 good commit known
# bad: [4325743c7e209ae7845293679a4de94b969f2bef] Add linux-next specific files for 20250617
git bisect bad 4325743c7e209ae7845293679a4de94b969f2bef
# good: [436c8cbbcb18deb96100cd9f33f1efedddc31d9c] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git
git bisect good 436c8cbbcb18deb96100cd9f33f1efedddc31d9c
# good: [183d224083773ca4a84a458fb608efecff19e19e] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git
git bisect good 183d224083773ca4a84a458fb608efecff19e19e
# good: [1347ff0c0e510f1a6adb78259a2a0ddfac41d258] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git
git bisect good 1347ff0c0e510f1a6adb78259a2a0ddfac41d258
# bad: [b09bd04eabb1994257f4c11d0ed25ff03517d3ec] Merge branch 'gpio/for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
git bisect bad b09bd04eabb1994257f4c11d0ed25ff03517d3ec
# good: [70bc9e18653c20fbcb47184d9498ad7bd7b7d6be] Merge branch 'togreg' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git
git bisect good 70bc9e18653c20fbcb47184d9498ad7bd7b7d6be
# bad: [3a847fb85c9d47e61ad5d9d54b762a3e99a08084] Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git
git bisect bad 3a847fb85c9d47e61ad5d9d54b762a3e99a08084
# skip: [50355ac70d4f104e2f82bfbd0658c129027ebb37] dt-bindings: phy: Convert marvell,comphy-cp110 to DT schema
git bisect skip 50355ac70d4f104e2f82bfbd0658c129027ebb37
# good: [acc6b0d73d902d3296d8c77878a9b508c2c6a5bf] phy: qcom-qmp-ufs: Rename qmp_ufs_power_off
git bisect good acc6b0d73d902d3296d8c77878a9b508c2c6a5bf
# bad: [35b629b28afd72a14ed573f1b180dc4ab1bf7e19] dt-bindings: phy: Convert ti,dm816x-usb-phy to DT schema
git bisect bad 35b629b28afd72a14ed573f1b180dc4ab1bf7e19
# bad: [66acaf8f6b0bcc273f8356b2a77baa90b177014c] dt-bindings: phy: Convert img,pistachio-usb-phy to DT schema
git bisect bad 66acaf8f6b0bcc273f8356b2a77baa90b177014c
# bad: [f151f3a6ebe184b5f8c9abe58fe2d63f9950139b] dt-bindings: phy: Convert brcm,ns2-drd-phy to DT schema
git bisect bad f151f3a6ebe184b5f8c9abe58fe2d63f9950139b
# bad: [77d2fa54a94574f767d5fb296b6b8e011eba0c8e] scsi: ufs: qcom : Refactor phy_power_on/off calls
git bisect bad 77d2fa54a94574f767d5fb296b6b8e011eba0c8e
# good: [7f600f0e193a6638135026c3718ac296ed3f5044] phy: qcom-qmp-ufs: Remove qmp_ufs_exit() and Inline qmp_ufs_com_exit()
git bisect good 7f600f0e193a6638135026c3718ac296ed3f5044
# good: [a079b2d715340482e425ff136b55810ab8279800] phy: qcom-qmp-ufs: refactor qmp_ufs_power_off
git bisect good a079b2d715340482e425ff136b55810ab8279800
# first bad commit: [77d2fa54a94574f767d5fb296b6b8e011eba0c8e] scsi: ufs: qcom : Refactor phy_power_on/off calls

Thanks,
Aishwarya

