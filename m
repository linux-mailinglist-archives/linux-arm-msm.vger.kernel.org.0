Return-Path: <linux-arm-msm+bounces-96103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPiNFpgcrmmk/gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 02:04:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FFD233027
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 02:04:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 230873041BEF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 01:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F14F2556E;
	Mon,  9 Mar 2026 01:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="jvhojoBA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5F41DF985
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 01:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773018181; cv=none; b=EWpZKsjHd46/ZarACxYMVqfBNkbb4OxqQ8eVM5b7yeA/22Jo1XIefWZEXLCpIP3iBf8EUfuQq1chYxx9sVznM5EkJQNONTdVEUO1bem4p4GjrcvR4TTo2f1BCxUjih89/qKzrQC4EB8aNfYR/Bj3cUTdST61RboL6mV0vPr/nys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773018181; c=relaxed/simple;
	bh=rRc/e6K/yWxakpik9GUm14LiUHLzoaW9X3Y/2OZeQZM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X7E9d11qTvhKVveCT/e4r3em74/0CWD+2aieQ7D8IefOmmJPX4Mqg8wx16TYLL92lXlneftbAVxcc4MkQQPMs7gBvMN9gRGERYmGBn2JaPO2kfCtm2w8wxogJTlc6Z5L8w6KBtDNQbeYOy7Ds22iovkfiSkelNFFCzRp6ig20ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=jvhojoBA; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773018167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jW4mW1GfYwAGUTP73I4AqgwxwPvoK4UJopMM4jq59Q8=;
	b=jvhojoBASFCnkcme347c3UBfC/LO8ikwtiZEpISrAKLStuwCJeuozbZ9fTNFhD3aco4GqC
	wq1go//OsTEZIOPQcHnQfrRcdvAROZPRH+dzM3ojdRayne2hB6cptJvNM4/sQs4f6bu2yL
	VT2w/k60CouQG7gaFL1t/MaB2+PqswpCrEUhjrpANzaWp7YIcZNHORotlEJ+QNj3zwLHEO
	mlmI8pXn/5atPTocsfsjPEu7q0c10jbyyC6RVrxLIcyYID2oRLy+hGwrC5YZjZIgIVXoWN
	sYtwSJTK0HpVBJWDczs41DIxo7UfKd8lBjI8tBIqLXLYBcm4m3oPq3rrL7st6g==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] clk: qcom: sc8180x: PM-related fixes
Date: Sun,  8 Mar 2026 22:00:22 -0300
Message-ID: <20260309010214.224621-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: B5FFD233027
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[packett.cool,kernel.org,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96103-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[packett.cool:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,packett.cool:dkim,packett.cool:mid]
X-Rspamd-Action: no action

This series mostly ports the fixes that were made over the years to the
sc8280xp drivers to the sc8180x ones. (With apologies to everyone for
somewhat stealing the commit messages in places :D)

The most pressing issue this resolves is s2idle exit on the Surface Pro X
being slow and breaking NVMe:

    nvme 0002:01:00.0: Unable to change power state from D3cold to D0, device inaccessible
    xhci-hcd xhci-hcd.0.auto: xHC error in resume, USBSTS 0x401, Reinit
    usb usb1: root hub lost power or was reset
    usb usb2: root hub lost power or was reset
    nvme nvme0: controller is down; will reset: CSTS=0xffffffff, PCI_STATUS read failed (134)
    nvme nvme0: Does your device have a faulty power saving mode enabled?
    nvme nvme0: Try "nvme_core.default_ps_max_latency_us=0 pcie_aspm=off pcie_port_pm=off" and report a bug
    nvme 0002:01:00.0: Unable to change power state from D3cold to D0, device inaccessible

Hopefully it also contributes towards improving power usage eventually..

One thing I'm left wondering about is 8d114b94fc39 ("clk: qcom:
gcc-sc8280xp: use collapse-voting for PCIe GDSCs"), not sure if it
applies and if it does, where I'd find the values. (Downstream dtsi for
sdmshrike, which is the closest SoC that the msm kernel supports AFAIK,
was my only reference and it doesn't seem to have anything related.)

And 9410fb940114 ("clk: qcom: gcc-sc8280xp: use phy-mux clock for PCIe")
.. we don't have the _src clocks for PCIe defined at all here (o.0)

BTW there's also a dispcc patch I sent as an RFC but probably
should've been part of this series:

https://lore.kernel.org/all/20260307111801.631060-1-val@packett.cool/

Thanks,
~val

Val Packett (7):
  dt-bindings: clock: qcom,gcc-sc8180x: Add missing GDSCs
  clk: qcom: gcc-sc8180x: Add missing GDSCs
  clk: qcom: gcc-sc8180x: Use retention for USB power domains
  clk: qcom: gcc-sc8180x: Use retention for PCIe power domains
  clk: qcom: gcc-sc8180x: Add missing GDSC flags
  clk: qcom: gcc-sc8180x: Add runtime PM
  clk: qcom: camcc-sc8180x: Disable always-on clocks on probe failure

 drivers/clk/qcom/camcc-sc8180x.c             |  14 ++-
 drivers/clk/qcom/gcc-sc8180x.c               | 112 +++++++++++++++----
 include/dt-bindings/clock/qcom,gcc-sc8180x.h |   5 +
 3 files changed, 109 insertions(+), 22 deletions(-)

-- 
2.52.0


