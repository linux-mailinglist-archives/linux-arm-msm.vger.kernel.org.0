Return-Path: <linux-arm-msm+bounces-110682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGaWGRATHmrugwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 01:17:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA94626439
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 01:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 043383035A90
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 23:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C1C38737E;
	Mon,  1 Jun 2026 23:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+ljZqSw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC443349CFE
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 23:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780355734; cv=none; b=ucarLW4K91tWc6GCV0etyqzuTWGmSmz1u/cbphYx2JpTkTXuKeiVA4hLtj9boZ1wBIqgeBpZjzmBcmHTkyfNE9VaqAlDIuuiqztY87gqKCGrP5aEYDT+G45hAK0kdYValgt97Z04LmuLql4rtpU4Qds/8tnhVqQaFwShFZwAimE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780355734; c=relaxed/simple;
	bh=5C0NvkvoNVW1GzuiitG2zF83G0Py8AToQX3X0I6RQCk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h1C0gExNBJhPVSkybLwLT1voEoPFtcAMF7/k7C80p9M1ixxBb9BjRKVonDgZ5JLPX+AKT6fCxLyD+tNxEmi0WYltIYs7UxTM/ItZfsLzB6qEus1nKHJdP2TjB4E2P0sOJZWlmnzIVaTtmdDoH7oKsBG/ihOhLCDyZNweqU4tD2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+ljZqSw; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bf125989f2so30310895ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 16:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780355732; x=1780960532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Qss5GDiUGvvZMzZ4WxtI6WP7Gai0GoYtE3oLWnkhZc=;
        b=Y+ljZqSw9sDHUZce/xTH9q9LSh3fNE4l3hvu0SZbMWkj6Q46tZTsYGIu39OBw82Gmk
         XJt24n2rhpyEDWIGsIbQ3XPe/lOD24AheQlZTQSMXs2pFAnh9oS6NclNY1KxMubXuokf
         FLCNLSlCEGLVSQr7S59ClOUtQt6L5tktWaFwkAlC4SG25c8hL3NzGCxu6mDGPskpuAVP
         GS85Z1RwBFENN3iGMVN+iQTsd2I6rFhsoBBlUD1d80S9Sj0TiGxvOPa7rka+KmnK7sTz
         alWD7mtZPMqJsxEtbmy01odXnjRlQIU+98ZHCcFnDsWWiU2aSHEbeqRB7MafZCbK69zY
         zM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780355732; x=1780960532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Qss5GDiUGvvZMzZ4WxtI6WP7Gai0GoYtE3oLWnkhZc=;
        b=ePGa2SGKeld/YwW+Fbv/E2Zqm1bzW1sXPgNrIXNuMpIDfbiL90415QrBUw7z5G9hP+
         1L7ybzmCzh+oIKxBDo6PHnxzwYn+KaHIgZQf9+uEzMqIvkrYr46ZcLpPZW9l8v6IEMlE
         nN95OS9A/c0Hz2W2kItNdAKli6J6EDTJHOk1XraNM6H51/okFFzrvrnpQGYD7hpwTYEE
         SkiDy/Quhg5sr0c8Jg1nLmthgHXGFh1xi6ysC2C2/Rr7ALL0yV/87kN4EOFQfbE6D9PM
         xQjYMtPLB5uvQv2VRTrlaUdb5NOj/ufR4dY16oXVIsu0VtgAnspspUhY43FhHkfpgmRt
         6x6w==
X-Forwarded-Encrypted: i=1; AFNElJ+uUvEY/lm3UVCXWDGEquC1ALHkqEAtZhf3jkck6xz6Bq6cQa+9zQPoIIwhpSf41a1Z7xceatz/6ywgQbKc@vger.kernel.org
X-Gm-Message-State: AOJu0YwD/br7G/62k8hxpCVuO+OsZC6Lx2bNC7ImXznFPnUhpeIgW3mN
	QIYBF0/ZL4XpgZd87kVylePcDobddSRCbXwnj31j+C4U3GitVeXXy1dK
X-Gm-Gg: Acq92OHO5yj9IB50Ejp+jQGvvlznB09fSLg+UIIoy/wiZef6XUJHR1scAXuBS0Q3G1B
	qk5ngqw9wbmgWZGBc93bjmuUYlr38riqHfNM2SfCMS3Q5SjN5Dy5V+U7JVpdumBHsZmlMaFo2O3
	ExOgnC55j8XG2zYRmezahQUA8eQ4tK+6KodTZf0BzCmg5vmyhfZGE4HW4aLJTbleB0bY9NGuz4c
	CozO9SHppJEE8M4q/Ot5twBbJBrkIelnkg76GOpjTagE17WUED81VxqM2Hz72YbqmCnSGKrTGdK
	31QZFFJof+VS+ahDF6n33F2f/zPAjnr+1CA53AkcRsjJx2slIFhMvew/XLfwQPaLlluth+TKbB/
	eXEmrSSKVKRAzOhrIIYF7tJqoVgk6C5cbqRT6BZ/cMZQgQDko0+Rn+qNafaeQgTm1fLkTHsAFa6
	RP5wdOrbvAC5yKKQOdaDEpo/jDDaFHYw2qtypW4GRwKYYy7XorA28dsYV65f+0i/hYpOvoY8mDZ
	tenJYNfmlT/z8iH1YIY
X-Received: by 2002:a17:902:e88c:b0:2bd:9803:9308 with SMTP id d9443c01a7336-2bf36878d37mr136499995ad.36.1780355732165;
        Mon, 01 Jun 2026 16:15:32 -0700 (PDT)
Received: from tomriddle.canterbury.ac.nz ([202.36.179.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd24fsm143815355ad.20.2026.06.01.16.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 16:15:31 -0700 (PDT)
From: Oliver White <oliverjwhite07@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Felipe Balbi <balbi@kernel.org>,
	Oliver White <oliverjwhite07@gmail.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] usb: dwc3: add snps,reinit-phy-on-resume quirk for USB2 PHY power loss during S3
Date: Tue,  2 Jun 2026 11:12:33 +1200
Message-ID: <20260601231236.20402-1-oliverjwhite07@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-110682-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oliverjwhite07@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DDA94626439
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Surface Laptop 7 (x1e80100-romulus) gates the USB2 PHY power domain
during S3 even when device_may_wakeup is set, causing PHY register
state to be lost. The DWC3 fast-resume path calls
phy_pm_runtime_get_sync() to restore the PHY, but this is a no-op for
PHY drivers that do not implement runtime PM (e.g. the Qualcomm eUSB2
driver), resulting in corrupted USB2 signalling on resume.

This series adds a new DT quirk flag that forces a full phy_exit() +
phy_init() cycle on each USB2 PHY during system resume, and enables it
for the Romulus board.

Patch 1 documents the new dt-binding property.
Patch 2 implements the quirk in the DWC3 core driver.
Patch 3 enables the quirk on x1e80100-microsoft-romulus.

Oliver White (3):
  dt-bindings: usb: dwc3: document snps,reinit-phy-on-resume
  usb: dwc3: add reinit-phy-on-resume quirk
  arm64: dts: qcom: x1e80100-microsoft-romulus: add phy-reinit-on-resume

 .../bindings/usb/snps,dwc3-common.yaml        | 10 ++++++++
 .../dts/qcom/x1e80100-microsoft-romulus.dtsi  |  4 +++
 drivers/usb/dwc3/core.c                       | 25 +++++++++++++++++++
 drivers/usb/dwc3/core.h                       |  1 +
 4 files changed, 40 insertions(+)

-- 
2.53.0


