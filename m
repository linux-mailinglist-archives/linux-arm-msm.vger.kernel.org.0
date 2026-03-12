Return-Path: <linux-arm-msm+bounces-97178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EK3XEPeismnwOQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:26:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8958270E34
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:26:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 589DD318B53D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 11:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D704C3B9DB9;
	Thu, 12 Mar 2026 11:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="MIE+U1Ev"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFB6242D7B
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 11:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773314652; cv=none; b=tyUh3Tm0HXZv1CmPV63O7QmnKuzShPMSJgDiUMPdn31DQxCj16c7LlkxAZkb857dkWJOSRpHV5/YRZoAPFAqwMjf3cQGBlCTAHJRgOQBRp3ZiThLrxZuipyaTisPpwEQPWI71VWSVUQcIxJ3NTNO5kt/Hu/faA19MPplDCZt6TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773314652; c=relaxed/simple;
	bh=1y2VS/ietuAhmno6T7EhIEmFdrSCb0dHUupEAtbIApg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eoVI1buh9pmg48kGLITwDaDvs6d1Gly86CisQCdteyKDN5Xb8hAEdEMtGfCEBIykwx6/aL18QXrgEeFYU8x+O87UjEFSjekYC9oRnQpBsuqIU1DEPeAhy0EoijHJykNhRLE11z2njUimAkE1JTzcJcUp0LHQ6fjb3+6vkeBArdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=MIE+U1Ev; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773314636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=m2sWcaN4dQ9R5JKMcE4ro7NTUdKauq+zmG0lviY8lRU=;
	b=MIE+U1EvJ3lnlUMIUBT44G4ZJ/dbEs8O4Y4ypvTYiNHANTEw5yH184tLwtCKyNnXask05P
	YgXzUtaIZXM0MNP20MhZJUpsE6BrSlsiklRRS2poi8KRn+NgxTZb2eLEAqZttPrDVm6Yd9
	MaJaA3aIwGw6R/vUnlaT4Wgsw9e2cOKpDxL3HKaYZ6Qcwd9NYeujenEdjheCD/BuH9dRWM
	D8l0bkOkFHiEKq1eU4vnC41NC1dyVhoI1TTPzu2vdH32sJ2oKRBPj7WeWgGjslaNWRPfjI
	IqsfNflly4+5XzxDL1Z0+Try5d0UFbL7Rk4kBaQfBqFHohczGtsipHdh8JRRrQ==
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
Subject: [PATCH v2 00/11] clk: qcom: sc8180x: PM-related fixes (and refactoring)
Date: Thu, 12 Mar 2026 08:12:05 -0300
Message-ID: <20260312112321.370983-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
	TAGGED_FROM(0.00)[bounces-97178-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[packett.cool:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,packett.cool:dkim,packett.cool:mid]
X-Rspamd-Queue-Id: D8958270E34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

v2:
- collect tags
- bring in dispcc patch mentioned in cover letter
- add a couple new discoveries (mostly camcc related)
- add refactoring to current style (qcom_cc_driver_data)

v1: https://lore.kernel.org/all/20260309010214.224621-1-val@packett.cool/

Also bonus new question: I found
https://git.codelinaro.org/clo/la/kernel/msm-4.14/-/commit/489da2db487312fdaf9441056745490031b59f55
and almost included a patch adding `.skip_retention_level = true` to MMCX
in rpmhpd for the SoC, but.. it should not be necessary, right?
Just having low_svs as the requested OPP in the consumers in the DT
shooould be enough to make sure it's always at least at low_svs?
(I *thought* it might've helped with the GDSC stuck-off issue for
both Titan and MDSS but it's more likely the other fixes..)

~val

Val Packett (11):
  dt-bindings: clock: qcom,gcc-sc8180x: Add missing GDSCs
  clk: qcom: gcc-sc8180x: Add missing GDSCs
  clk: qcom: gcc-sc8180x: Use retention for USB power domains
  clk: qcom: gcc-sc8180x: Use retention for PCIe power domains
  clk: qcom: gcc-sc8180x: Enable runtime PM support
  clk: qcom: gcc-sc8180x: Refactor to use qcom_cc_driver_data
  clk: qcom: dispcc-sm8250: Use shared ops on the mdss vsync clk
  clk: qcom: dispcc-sm8250: Enable parents for pixel clocks
  clk: qcom: camcc-sc8180x: Remove wait_val for Titan GDSC
  clk: qcom: camcc-sc8180x: Add missing HW_CTRL GDSC flag
  clk: qcom: camcc-sc8180x: Refactor to use qcom_cc_driver_data

 drivers/clk/qcom/camcc-sc8180x.c             |  76 ++++++-----
 drivers/clk/qcom/dispcc-sm8250.c             |   6 +-
 drivers/clk/qcom/gcc-sc8180x.c               | 126 +++++++++++++------
 include/dt-bindings/clock/qcom,gcc-sc8180x.h |   5 +
 4 files changed, 132 insertions(+), 81 deletions(-)

-- 
2.52.0


