Return-Path: <linux-arm-msm+bounces-61915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F377AE2447
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 23:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15B511C21164
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 21:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9660238C19;
	Fri, 20 Jun 2025 21:44:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC4EB19E98C;
	Fri, 20 Jun 2025 21:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750455855; cv=none; b=doVFvOtmO0nP3R2LBcfjEQ7O/uYNyUt63SApteVbLXxdbJJ60B5hQxWy+OPhri5f0F8SH2Qv0qRU0/U6PQTcqlL+EPBlQftDDe3elpby2R8BEgJSfxSTQYANAUYwmXbzUSJ+rQxOwmQrDmzcXqJcViFdN43tzBWqXFnJ6sF2G+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750455855; c=relaxed/simple;
	bh=mQctioBJ1PwKUeFBdxOeT7Fnq831mTiUSQkFvW92slg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sv3Q08KHtmoma+lWQssUJubqVreB7h2cI7yPJo8caUyEucA47dDKe0uYNtKoOAEc1y3JsaZ/rS9PJlGit4c9VJyfkhZ0+C4Dckqxieq/HF/Ak8qesuTf8A1p+t0Mi94HmPLamWGry9HRmCW3ESxKWO8VrbhoiShWWsNIPHRAH+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB1C9169C;
	Fri, 20 Jun 2025 14:43:53 -0700 (PDT)
Received: from usa.arm.com (unknown [10.57.48.228])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C71483F673;
	Fri, 20 Jun 2025 14:44:09 -0700 (PDT)
From: Aishwarya <aishwarya.tcv@arm.com>
To: quic_nitirawa@quicinc.com
Cc: James.Bottomley@HansenPartnership.com,
	aishwarya.tcv@arm.com,
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
	vkoul@kernel.org,
	broonie@kernel.org
Subject: Re: [PATCH V6 10/10] scsi: ufs: qcom : Refactor phy_power_on/off calls
Date: Fri, 20 Jun 2025 22:44:08 +0100
Message-Id: <20250620214408.11028-1-aishwarya.tcv@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <9c846734-9267-442d-bba0-578d993650c1@quicinc.com>
References: <9c846734-9267-442d-bba0-578d993650c1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Nitin,

To clarify — the defconfig kernel does boot successfully on our Arm64
Qualcomm platforms (RB5 and DB845C). However, starting from
next-20250613, we are seeing the following three test failures in the
`bootrr` baseline test in our CI environment:

  - baseline.bootrr.scsi-disk-device0-probed
  - dmesg.alert
  - dmesg.emerg

Test suite:
  https://github.com/kernelci/bootrr/tree/main

These failures are due to kernel alerts seen in the boot logs. A relevant
snippet is shown below:

  kern  :alert : Unable to handle kernel NULL pointer dereference at
  virtual address 0000000000000000
  kern  :alert : Mem abort info:
  kern  :alert :   ESR = 0x0000000096000004
  kern  :alert :   EC = 0x25: DABT (current EL), IL = 32 bits
  kern  :alert :   SET = 0, FnV = 0
  kern  :alert :   EA = 0, S1PTW = 0
  kern  :alert :   FSC = 0x04: level 0 translation fault
  kern  :alert : Data abort info:
  kern  :alert :   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
  kern  :alert :   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  kern  :alert :   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
  kern  :alert : user pgtable: 4k pages, 48-bit VAs, pgdp=0000000109c41000
  kern  :alert : [0000000000000000] pgd=0000000000000000
  <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=alert RESULT=fail UNITS=lines
  MEASUREMENT=13>

  kern  :emerg : Internal error: Oops: 0000000096000004 [#1] SMP
  kern  :emerg : Code: a90157f3 aa0003f3 f90013f6 f9405c15 (f94002b6)
  <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=emerg RESULT=fail UNITS=lines
  MEASUREMENT=2>

Please let me know if you need full logs or further details to help
with debugging.

Thanks,
Aishwarya

