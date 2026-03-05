Return-Path: <linux-arm-msm+bounces-95563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEBPBQ5RqWmd4gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 10:46:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3AC20EDC7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 10:46:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BFAD311E255
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 09:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88E6379999;
	Thu,  5 Mar 2026 09:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRTNlTwF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AF4377EC5
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 09:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772703589; cv=none; b=disMmOGVspwqNQ6Ngj8rQsn68A8gn1N99isf5DAYwYHeMWGY3bO5VQB+zCUnnSYGpl54o9oy7wrX9xAcHuIjucfK8lQgl5J1qjimqYfFneq6uaGg76rg/kitmT1Pnka9kTO3MJDnkshAxizAm2YdHMhxltMp0Wa7g0uzsrUplno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772703589; c=relaxed/simple;
	bh=uwfVUq/wdApvUK0zOWHTomco6NhetV2l36Os5KZSpQw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VSHcxCnUTFcD1RcoEY1z7ZQarligXx20PfBrSilPQqb1WGQJjJlgG/RzevkkaYGGIkTuwNX4N0oj26DfPF5PPqwUrc5s8ueqmYJ9aD1Nxw7WjFzkdTIypZOwhi7plrFaUNhWFrKsBmolN3t0rt6Wg0r9zTpuoFQKYAZY2WX9DX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nRTNlTwF; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-65f92a597a1so11172878a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 01:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772703587; x=1773308387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EOKLLyFS1m1449/2Qx3gad9xJn5duh5McKfguDMZF5g=;
        b=nRTNlTwFOTdSsMis7A9sb3cCUj24hqOMl5QttvEpXplca/djHa6f5q4bkMLgjKu5Lb
         xaIEJ+ZMtdAVi0+YNHkOCy2NJvsIPwv0+YKI7IXAjwe6ndXfdxzoyO8gNDSHtRR0HQKK
         fU6EmubF5gwXJAbzN7bwwZow116Znk/IMQOaWwrK8XlKkiOlqioWEhEoRtNdmHTINSiB
         PfB8u6WDjMaeHMc64z64JtR46PsTgXHV2Vl1cp3qJ5jBJ77RdN4RYRIbxXhgDrkQYtFu
         VcWeJJpqG0JyOnyOH1acYhXaBflFyKXuFFp3s0PgKpZzfOnF6YbSuzA+o3qJZC3OzMTQ
         JDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772703587; x=1773308387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOKLLyFS1m1449/2Qx3gad9xJn5duh5McKfguDMZF5g=;
        b=MvH1IdLIK4rAGEx3kYwedNHk2FFzQQqBizgN+UVCxfAl2oviY5TeAeubHMCunQoHxk
         16ubPGjEeGpwDdGHW5SyOhLIi2O2EC/AOvRhbFipvhk/rJOlAN+pAOqCfo3jupt5yJ/R
         qaOw4zhRc6+lZX9MMV5bDnWWssdjo+WVtCc7TPPNztQHN0qEZlI1e334QIlwVWwaYfGv
         bhIAa/SCHMsvqyXzsrRLsues8v68TUsgJEBqkyUWjrl6GriaPNGBGAy9dXHNIULCjaNL
         BS48NeK2smqrIE2hcIN+eNpxZmPtW4hj3Jh7O98kLvJrKWYQroavyHIrWkl3/obsr0nQ
         9EPA==
X-Gm-Message-State: AOJu0YyjTwUVFH49xbLKqvoPV8it+X4bxDwzEgLbK9B2e29moZXBbUky
	PqgHn+PA7aPBRBL9o6j5td1NQnKljun5p29sOlpKulEkGc3PB6QlGPMR/d0SlQIq
X-Gm-Gg: ATEYQzwvrr/+jnsdL0dwrBiX3DTL6nDIWA/Ew18tg/9MGde+1JInYL6vomDKm9T8xar
	lbBFd/DFunFTD4eIBM5KF3xuO6DNohQrZRRVYAenBKFcjis3+6WLnrVTXWZyhR46ObPB6DOyM0y
	6obbyl8c8m85YWEgyDl3SCrFapFblsRY3j3K11LItYyVlMkeUC/Sq1jLPvskOXz4ga4p4l58wGi
	GchnnGlBUsrRQL7GWKub+yMDTQ8r87oIeIpUMI/+5awz1xT0o7ifZthYAit0WqjytB+h1Cuy6WH
	V1YanXmFYXNt3NbqVnJVMk+PK+HN19dxb5Oy+W3eVspgp7GehzVIXUtRsGXopiHXAGPzxcjgSk8
	HP9DcVuoH04lOxDnuiCJh84U3ifK3CUcIzXM0f+4kwJcYa8PuTxdBAFuzZV8Bc9WzWDufkMmRhA
	m/tkUpc3ScbeBfqFXqDugLDPfWe/U=
X-Received: by 2002:a05:6402:5045:b0:661:6ca5:aba2 with SMTP id 4fb4d7f45d1cf-6616ca5af17mr405615a12.28.1772703586230;
        Thu, 05 Mar 2026 01:39:46 -0800 (PST)
Received: from workstation.home ([178.227.95.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-660bf4d8249sm2616634a12.17.2026.03.05.01.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:39:44 -0800 (PST)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v4 0/2] Add Xiaomi 12 Lite 5G (taoyao) device tree
Date: Thu,  5 Mar 2026 10:39:39 +0100
Message-ID: <20260305093941.305122-1-zstaseg@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8C3AC20EDC7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-95563-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zstaseg@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

This series adds device tree support for the Xiaomi 12 Lite 5G (taoyao),
based on the Qualcomm SM7325 SoC.

The display panel model is unknown, so bootloader-initialized
simple-framebuffer is therefore used to expose the display.

Changes in v4:
- Patch no. 1 - no changes
- Removed Konrad's R-b tag, please take a look again (patch no. 2)
- Fixed vreg_s2b_0p7 regulator name to spmb2 (patch no. 2)
- Switched bluetooth to wcn6750-pmu (patch no. 2)
- Dropped qcom,local-bd-address-broken as it has no effect (patch no. 2)
- Added wifi calibration variant "Xiaomi_taoyao" (also sent board-2.bin
  files to ath11k) (patch no. 2)
- Link to v3:
  https://lore.kernel.org/all/20260224114424.1966947-1-zstaseg@gmail.com/

Changes in v3:
- Patch no. 1 - no changes
- Drop unit address for framebuffer node (patch no. 2)
- Add Konrad's R-b tag (patch no. 2)
- Link to v2:
  https://lore.kernel.org/all/20260216120715.3432191-1-zstaseg@gmail.com/

Changes in v2:
- Add Rob's A-b tag (patch no. 1)
- Add explicit framebuffer_reserved label (patch no. 2)
- Use memory-region for simple-framebuffer (patch no. 2)
- Fix reserved-memory naming: make node names consistent with labels
  and intended subsystem (CVP/camera/video) (patch no. 2)
- Convert mem-type value from <0x02> to <2> (patch no. 2)
- Fix s2b regulator comment style (patch no. 2)
- Remove unused gpio-reserved-ranges entry (<32 2>) (patch no. 2)
- Link to v1:
  https://lore.kernel.org/all/20260204115645.1343750-1-zstaseg@gmail.com/

Stanislav Zaikin (2):
  dt-bindings: arm: qcom: Add SM7325 Xiaomi 12 Lite 5G (taoyao)
  arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao) DTS

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    | 907 ++++++++++++++++++
 3 files changed, 909 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts

-- 
2.51.0


