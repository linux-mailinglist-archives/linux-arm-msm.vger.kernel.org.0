Return-Path: <linux-arm-msm+bounces-110384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oERxBHvuGmqF9wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 16:04:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5658660D431
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 16:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4706E303A527
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 14:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD1F22E7F3E;
	Sat, 30 May 2026 14:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="B0yTVqTV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound9.mail.transip.nl (outbound9.mail.transip.nl [136.144.136.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325682652B0;
	Sat, 30 May 2026 14:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.136.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780149644; cv=none; b=jaP74VABacrVXbYSSEXBln0H+DxJwGAPsSM6KYgsS8/KL2hsxYobRHOASSxaZFjLMSqNnXm73cJVurPyCQ7hIQReKkCd7ICk+Wxgb8dSkY7FF/H0YTQlaM6L9C7qzHFhI8N+FPJteudewPLyQvNvJKrbLr4pOPvjWqmFF2ZbWbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780149644; c=relaxed/simple;
	bh=Eza9o2geLJFeRYRJm1snTSUZxBP2XWpXnsGTcHhKIRk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ZnMkY2XZDNWGaoD6lp7r+Z266+Dor5hytiAL5DpeuNqUxk2Lc9hP4+qyvmvUeDt+iJp3W3pRkP/hFVljbQc++tfXbBvf+QwnuIPAhjgdaz8fp4Uwq0XtCHaUF0xxTlNogHbvQfVvxyjSuJ1VIAcbHSvS021YlqWcHiIG/sUY7/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=B0yTVqTV; arc=none smtp.client-ip=136.144.136.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Received: from submission1.mail.transip.nl (unknown [10.100.4.70])
	by outbound9.mail.transip.nl (Postfix) with ESMTP id 4gSMLx3PVpzTPP3Z;
	Sat, 30 May 2026 16:00:41 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission1.mail.transip.nl (Postfix) with ESMTPA id 4gSMLw5fQqzJjhXw;
	Sat, 30 May 2026 16:00:40 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: Amit Kucheria <amitk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Lukasz Luba <lukasz.luba@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	van Hazendonk <github.com@herrie.org>,
	Zhang Rui <rui.zhang@intel.com>
Subject: [PATCH 0/2] thermal: qcom: add PM8901 PMIC temperature-alarm driver
Date: Sat, 30 May 2026 16:00:38 +0200
Message-ID: <cover.1780148149.git.github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission1.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780149641; h=from:subject:to:date:
 mime-version; bh=0dpFblV180MGg18pQoUl9eNiLTyoyrmJgQQ1GYHz4i4=;
 b=B0yTVqTV9aUw8tOSsjf+EuNXBHSsp/QP6fgfDPFD1oFVtiQhkrolUTNLjdRCCzONtJAUBS
 dDRbScBlsURDroKUkh5Sa2i0MakCtqLHsBPSIN41ChSEKdqBLrJj46k8clOtGdza7RI/hX
 AycvuFYVvQU0oquE4xZXTAeei/YDrQuD/T6pPsisCJq9obWEoW8/v1cdJc959UvDPMYOLQ
 KSDjau9SytV72OMw/Rbf0rS5PUOlo1uoX0EXFFsD+mVUteib3VcpxT5UJTaBcArzpa0al6
 9rrXoIYAk4xpuuRTy+yHoxVSzWdW56cMrEjlppiDF+KPMXQt2//PqTE04nWi9Q==
X-Report-Abuse-To: abuse@transip.nl
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-110384-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[herrie.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,vger.kernel.org,arm.com,gmail.com,herrie.org,intel.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[herrie.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[herrie.org:mid,herrie.org:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5658660D431
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

This series adds a Qualcomm SSBI-attached PMIC thermal driver for the
PM8901 over-temperature alarm block. PM8901 is the companion PMIC paired
with PM8058 on the MSM8x60 family (MSM8260/MSM8660/APQ8060); unlike the
TSENS-based thermal blocks on newer SoCs, PM8901 only exposes a stage-
based alarm (no raw ADC) with four selectable thresholds and three
escalating stages.

The driver registers a thermal-of sensor so a board device tree can
declare trip points and a critical-trip action (e.g. orderly_poweroff).

Used on the HP TouchPad (Tenderloin) as the secondary-PMIC-die thermal
sensor; the primary PMIC PM8058 already has a thermal driver in tree.

Thanks,
Herman

Herman van Hazendonk (2):
  dt-bindings: thermal: qcom: add pm8901-temp-alarm
  thermal: qcom: add PM8901 PMIC temperature-alarm driver

 .../thermal/qcom,pm8901-temp-alarm.yaml       |  79 ++++
 drivers/thermal/qcom/Kconfig                  |  12 +
 drivers/thermal/qcom/Makefile                 |   1 +
 drivers/thermal/qcom/qcom-pm8901-tm.c         | 341 ++++++++++++++++++
 4 files changed, 433 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/qcom,pm8901-temp-alarm.yaml
 create mode 100644 drivers/thermal/qcom/qcom-pm8901-tm.c

-- 
2.43.0


