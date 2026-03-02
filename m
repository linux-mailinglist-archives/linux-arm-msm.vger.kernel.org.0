Return-Path: <linux-arm-msm+bounces-94931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANobLXKMpWmoDgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:11:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0301D9861
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8E411300C346
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 13:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 730D638F624;
	Mon,  2 Mar 2026 13:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="fnV88YAX";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="AjrVXQlz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553F23451A6;
	Mon,  2 Mar 2026 13:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772457067; cv=none; b=rw4SYS3Ih/lh117aTAxJ6n+KNokKX3eK9nzDart+B5cK8Fl07CFuKmlYkxhXyTdsH03xCnpNq0+gjuiArhYAZBtTZAyPnfcZUnKeFYAJbDEqqWgzltWDJEw96q0r0w0+g8cUCigQnsm5WMQClldLPmK14SVX2nO7/iTBgIEzGsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772457067; c=relaxed/simple;
	bh=vKjQSGfzTKg9BhZVaMteqTJhQrPzmYNKvSSkh8g10VI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d4n5nqWifACmCSIXSncOffwCwd2fk8WBBVE5HS1Q/OyKBgaVvBJ7ggrMUferzQil4odL0dephqEdBuo7qofOwtzSy0IYXuUh7jREZGYFisjy7BzsGOpplPDut6oibVdJSrHn1MIGC/fDxHxax9s/qsHVDNTZ80K5I4+GaCpo1Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=fnV88YAX; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=AjrVXQlz; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1772457042; bh=mLE0V2TfbujMR/U9yuP+EDP
	Y/rBYmBwcLZ2X0LT4sAE=; b=fnV88YAXMjGVQ+YsMslT90CZNoBGVK8UnHJG+Q7TK8fFnLbaFA
	p1W0jJTz2I4uE9v+kav/p0YupdLtNNVrLfNsfp0gtFlrIN3DboshvFZQ1sphwxf7qjykvUI5pWV
	tXkn8DfRD//s0VdpqWD2/DVoIRzkGVL8iMk1ekjLcGuLga5ArneAVI+n7wFZwgK7Pzg4/BVW8P3
	hF1EOZDpQwj7VFEFJBh7cM+IbNVG6F+tYOeF6B2bQIrpZDqufsmSkf/Y6gFXCmdRCoyIlDRbkTe
	JXh98Ap9BBoiZGTdOh7T7UsWlzX7XNCGFMNFFq+feHe6VnLDKvO9peqP7JVRUPPFROQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1772457042; bh=mLE0V2TfbujMR/U9yuP+EDP
	Y/rBYmBwcLZ2X0LT4sAE=; b=AjrVXQlzVOiY8uccjavQxtxkyg0Lv8COvybZbyf1HjoHWytUGN
	xASkE9R6225H+823VyvokdcrqKxTTq+Gv5Ag==;
From: Aelin Reidel <aelin@mainlining.org>
Subject: [PATCH v2 0/2] Add SM7450 and SM7450P to socinfo
Date: Mon, 02 Mar 2026 14:10:13 +0100
Message-Id: <20260302-fillmore-socids-v2-0-e6c5ad167ec4@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNzQoCIRRGX2W46wx/MKJV7xGzML06FxwNHaQYf
 Pds9i3Pge98O1QshBVu0w4FG1XKaYA8TWAXkwIycoNBcnnhigvmKcY1F2Q1W3KVGW39U2qDUmo
 Yq1dBT++j+JgHL1S3XD7HQRM/+7/VBONMG66UdVfHUd1XQylSohTOuQSYe+9feaCGB7MAAAA=
X-Change-ID: 20260301-fillmore-socids-a5cfb25ae225
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux@mainlining.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Aelin Reidel <aelin@mainlining.org>
X-Mailer: b4 0.14.2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94931-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aelin@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mainlining.org:mid,mainlining.org:dkim,mainlining.org:email]
X-Rspamd-Queue-Id: BB0301D9861
X-Rspamd-Action: no action

Add the SoC IDs of SM7450 and SM7450P, two SoCs in the fillmore family,
to socinfo.

Signed-off-by: Aelin Reidel <aelin@mainlining.org>
---
Changes in v2:
- Fix sorting in soc_id list (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20260301-fillmore-socids-v1-0-5a033cd8d0e3@mainlining.org

---
Aelin Reidel (2):
      dt-bindings: arm: qcom,ids: Add SoC IDs for SM7450 and SM7450P
      soc: qcom: socinfo: Add SoC IDs for SM7450 and SM7450P

 drivers/soc/qcom/socinfo.c         | 2 ++
 include/dt-bindings/arm/qcom,ids.h | 2 ++
 2 files changed, 4 insertions(+)
---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260301-fillmore-socids-a5cfb25ae225

Best regards,
-- 
Aelin Reidel <aelin@mainlining.org>


