Return-Path: <linux-arm-msm+bounces-102541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBmcBMQK2Gm5WggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 22:23:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CD13CF763
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 22:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0A9C303FA8C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 20:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E7D33B955;
	Thu,  9 Apr 2026 20:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="blM/TIs3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6462E314A90
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 20:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765912; cv=none; b=TyhO63veYtLu7Cv6xwsGxiBEEinlHttGk/xTRhgNOIYnyOH/CdgaAFTJlVLjhJunLzat7uHEK8qkpCZLIKenhUJZC8PU5BixPXZw6UGk8d5Ha3rtSorlkxMVHHjbfDDTVdZM3qJKmqlOSt/wRRL/fQjzkJ2Nju3T67SOxJcDCsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765912; c=relaxed/simple;
	bh=OEEKgGc4h07d0SC0BP/9593PktvbJPvWbzlDAXtwYRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xzz7v/nEQ21LlS7varxUkWys8TOECkQXReQKEnFhcWCrd1aKkeQPfc7zvQ1R1GOE7pdIEhKdS3IP7k9QVTBp1GzCqd4vr+48x4FjGM5gkt9tn3O5PCxMu3ZTCqbpUniY5LYgrDJ2LBcpTceCLGxkFhxBguKs79VXW7ZPHOCpHYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=blM/TIs3; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a9296b3926so7727785ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 13:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775765911; x=1776370711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YlPXVSRBag/I0TSEfHEfaPNTy5vKLac57tugfy+V0xg=;
        b=blM/TIs3OulrAbcW7Oqh/4n2q9M3ILlDwa+i+mEEFySNhcK88lsrVtICKE6tGRBCoR
         vIq3N4g6SBjRdfjPhqY4+xoGyrIPjmPn46ho7d6Y0wi541HpUzzsk7bZxHhpB130KSfr
         CxbcwXiuOZ+l8BPefCxyunTRgiuuGCuomRZCQVSqmtDzdZrZqHp8XjbOKRZ54Iagw8xE
         17MmXJyRdOfrWckIUHVgUTc0wJ5OJT5tAqrV6YJi2cUknh0Y1cZm81N+ix2MhpsMl3cu
         JFEjhjki+6qs4Kma5W1Gz8y5I6swwCTNv/kYvfOJqASMqFE0L6OilJ2J4YEYmrFdk/7a
         q/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775765911; x=1776370711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YlPXVSRBag/I0TSEfHEfaPNTy5vKLac57tugfy+V0xg=;
        b=qEQ3yE6rd5JFKaD68lDQdgoz5tS69Zifk5mwKNXt/i0jVbK99YuPlDjsRuzEKsJblc
         MrqDmcBiZRdE2j3flryMJKoNBBeK+wJ9Wc30tdit+9gYj+uWOtFrBqy6gva6an0L3utl
         8MXxXZW2IdhkbAFhsOJJZiE5+eaCreMHDH4v8XPJFhRKOghDHnS/2qVyty7+zhY0/A1R
         1JSKj4ENcShtu+VjlGOPvR/YySl1eQyOts7RxQKmiTwbhBtqLD2oaZDsBGkLxkygoAku
         G4WUrgmBJmv0ifIGQDVT+ZhtCv92rfBA0iZU96NnchJbzmpkGz2BSbtxUslzSY6V5YOH
         bgUA==
X-Forwarded-Encrypted: i=1; AJvYcCVfbAfHCplhY6f5wBr3iSR9k0c3UI81dgX7mfy1H5gCLKDtBud8ybDwTIvh7tyKmw60VW2Kblt8Oj7tqML1@vger.kernel.org
X-Gm-Message-State: AOJu0YzEFISi33DliM6fBSBEpu/+4jOTwPiya/DLqIOln6/KzTtXI94/
	bGVVtRb52V5NS5odXVZywhDOdyubN+V/M0RVDq3d6djH9+4EbpR5zhI1L2mfXsiU
X-Gm-Gg: AeBDietkp2Itw38+iAubkdJM07kEL8WDbqIFqwHCCEdtkw3C0MV+evUZ4bnyTXaHnb7
	OgzWmgr9qWqXi4LlXZLqHKZ8+lvBwgIaBXjmIy/XpCx8JxFC3BhbOliZ46c0e9OdRqeCtyWE6I9
	QTb8geyAgpGnLVdhjb8S4e3BANa2KKBLOrK3X9h+3kK5+fC5JEpHTwfKalyWicO298iapfsMBIy
	1Y3qu1/I0f7d6GRjSR+w8kSgk4t+vtWZuEAwnTffZGt60wcKbEopdpSMjGylUXx7+uMNeNNH+j1
	fFGG5fPEUn1HvU12yytU0f3/ZKJRzLA9fCCuy2mxvHHsz7x4PoeOMfe0wEtSjsejSqwzSAyumyg
	54sYsRRhm9gme1g4qcWwbwElHzbcPMvusdF1nhuGWiv0X5Ibi0ksE1ZDOyw3sjrJFJndWPf1+h+
	feHaq13dnnC4K9gstLH/PrTRELOMhYECsBFIrd3Yh9xdbJZwsqKIDvt7XJPVM=
X-Received: by 2002:a17:903:1ae6:b0:2b2:5256:9ce7 with SMTP id d9443c01a7336-2b2d5a6121dmr2982525ad.36.1775765910614;
        Thu, 09 Apr 2026 13:18:30 -0700 (PDT)
Received: from tomriddle ([131.203.184.83])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f48cfdsm3895425ad.82.2026.04.09.13.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 13:18:30 -0700 (PDT)
From: Oliver White <oliverjwhite07@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: bod@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oliver White <oliverjwhite07@gmail.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: x1e80100-microsoft-romulus: enable OV02C10 MIPI CSI-2 camera
Date: Fri, 10 Apr 2026 08:17:15 +1200
Message-ID: <20260409201717.108169-1-oliverjwhite07@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260409083609.75341-1-oliverjwhite07@gmail.com>
References: <20260409083609.75341-1-oliverjwhite07@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-102541-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oliverjwhite07@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 73CD13CF763
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series wires up the front-facing OV02C10 MIPI CSI-2 camera on
Microsoft Romulus.

Patch 1 adds the PM8010 regulator outputs used by the camera module.
Patch 2 enables CAMSS, CCI1 and CSIPHY4, adds the OV02C10 sensor node,
and defines the pinctrl state used by the camera clock and reset lines.

This depends on the CAMSS DT style conversion discussed in review, as it
uses the same endpoint layout style.

Changes in v2:
- rename "webcam" to "MIPI CSI-2 camera"
- split regulator additions from camera enablement
- add a cover letter describing the series dependency

Oliver White (2):
  arm64: dts: qcom: x1e80100-microsoft-romulus: add PM8010 camera
    regulators
  arm64: dts: qcom: x1e80100-microsoft-romulus: enable OV02C10 MIPI
    CSI-2 camera

 .../dts/qcom/x1e80100-microsoft-romulus.dtsi  | 127 ++++++++++++++++++
 1 file changed, 127 insertions(+)


base-commit: 6fbfeca7008b379fb2cdc4f1409c139185e5a029
-- 
2.51.0

