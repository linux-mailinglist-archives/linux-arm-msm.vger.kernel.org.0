Return-Path: <linux-arm-msm+bounces-106955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJavKBPsAWpHmQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:47:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEE051085D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B3F1B3069891
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 14:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84FF43FE640;
	Mon, 11 May 2026 14:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qilkVxwu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881EE3FBEC6
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 14:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510500; cv=none; b=SyqIjJyb6FjWIHJBSDjJwcXx6mpheMoQ9SPym5WZPU5Axbwn8NgHHjVQ42FX33TM7ACs26ZM8n2eYDu2uiC/HiPOLeTaaEG5ITtbmkdVoRIYNlQYfIUz5IA5kxVKHlG/JEtL0GcaBqR/f5qt3B29WUl5iVQIMY5Tb2MW33Dc9yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510500; c=relaxed/simple;
	bh=dQlkhmInwWMtqAXd+XD3UFz2fySOGcP9jcET9eysGj4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fw3azz7kUvY1kwAy0IC7QXy+UwBpluRgOBO6a0OVX1rLq1LNrIWx0uQgihBJvJ7eMY1MssoJv6tixM7Y4Sbv9/jW2RD+HG6MvROoIOPAysrbKZnWfbvOHOV+MCqrCo/oWNhFR5kGo5IxMCv7KMvrCaZGd9BHL0UZTWQEbAl0jhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qilkVxwu; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8353ca0f1f1so2211051b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 07:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778510497; x=1779115297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FeH28ESJr49Wltj/t68Acc30Dfvn/6pP0uCjbk16rUo=;
        b=qilkVxwuJaryMsHXJIfHaQm/opm8BjxIFJ4UuccoErWDvFuDrjkTVfbm8op20xruOB
         QB/OYdKbCi8oVgQhStXWMbD406ikYYu5CsWEJAiOdmMTyjIA/s7aQ9Nem9J5T/wwDkVQ
         D1I9Hk9G/FH0NU0FixFXzC1Qw34xa4ijsNGxQCBPeoJMTJirCYyw74I4VOzhWlSse+5b
         722/euglQ/HhJ8vgnEJr6SSbQ7ZKoH8t5hL6Z9wIUXc7iVaXeVt+NDa8vVWgUOCJRals
         FdQ3Tq40zcUTsT3RX6Nxa7CnlEoJ4Ans/2zrakxtTYfy2bNow+kcU74bEYcerAjIaihN
         jw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510497; x=1779115297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FeH28ESJr49Wltj/t68Acc30Dfvn/6pP0uCjbk16rUo=;
        b=aW8rjwJ6FAkiMi72cTDZZ7sSpXB5rGjLHLoEot+tgZvd7Mo6uEy9K2ojBo62401oHl
         j79CspM6kMQ23pXYEgmF6AIMkaLPtnJ5+j09/tsXSyCyktaoG1FZRYeAfTzGQQJR1hNu
         B66TeXn9qQIPP/5R/32N+8QAT+CY42fBpNCfu2pzKQRNkjz/r5/heFRfdKyU3xrafVua
         YolY+tp35CRaz3q+z0ZxYX87J9qIKy2R47Yyacj/BhGtJnUf0NC0EP0QVXvfGJv7i1uD
         XfOxjgGYdiWEaznc7vRvvm2gjsUatMClAsh+1mrBMaUuutKymBKjW0HS6e6A9253VQvJ
         S4cQ==
X-Gm-Message-State: AOJu0Yy5rVXWc1e2urBxtvn5hkFPGfhfslpn3Cekmeo985J9P+wOknek
	bjvuN2HdCY0bsCbW8Nz+Asmn6WlVhXY0Ma85ESrN8i1mszJesGJo4Uwz7RZdSCGi
X-Gm-Gg: Acq92OFDWouK3WiKYvKi3+6DRUYYVbAyiX/veESrTiRnHNJVU371kogpcdR+H4QdiM2
	f+BI2toknv8Jk+tweuKQVrDmj364wyw0Wk7ne5iq95h5uPO1e2WtKb6JXoLP0RgKs6BxZLb+sCc
	+TlL+AVQ00bk0VBEORf/snBHcWUkWzkNR1apLWsrgQn+nyWvMrIwWkp1zfLtx3iuEDJoyd/pYWy
	B5JjTwoDDIEMV7MCIYaLPueBC6R1aBhqLmxfZGLHvdPaCN4qeCrlALvh2qwMP7GHdGdzZjwRuep
	faumIIjiIIsVAqJpo7wgQLUw/BM94rww0+yhAWp/dHcYVfZ1oevb3YbO7WPdehg8KREIDuGVrLU
	NcYD6qSi4rNfDqSBrnj0/meT2UeGBkHFX+b3HJLwYzqv8cmsaPwcxOnal8VBoSKQKkgBiV+vylE
	Umpk5tzud6mXsSgIzOEgjdPNS4880+6Tlwr8YZr9602lnr24cJalIKChZjqYB7tAt9P7Bz/q+x+
	DzTgxtPj7EJiVioLvRbOs0X
X-Received: by 2002:a05:6a00:2f05:b0:83e:d99d:7cc8 with SMTP id d2e1a72fcca58-83ed99d832emr1249510b3a.30.1778510496704;
        Mon, 11 May 2026 07:41:36 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.lan ([58.164.4.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm26012405b3a.3.2026.05.11.07.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:41:36 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/8] Add support for Microsoft Surface Pro 12in 1st Edition (Snapdragon)
Date: Tue, 12 May 2026 00:40:49 +1000
Message-ID: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5BEE051085D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-106955-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harrisonvanderbyl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add support for the Microsoft Surface Pro 12in 1st Edition (Snapdragon),
based on the Qualcomm X1P42100 SoC.

Currently supported:
  - UFS (with inline crypto)
  - Touchscreen, pen, cover keyboard and touchpad (via SAM)
  - USB 3.2 x2 with DP Alt Mode
  - Audio, WiFi, Bluetooth
  - CDSP, ADSP, GPU
  - Display (BOE NE120DRM-N28 panel)

Not yet supported:
  - Accelerometer
  - Front, back, and IR cameras
  - IRIS video decoder

Note on the compatible string: unlike other Microsoft Surface devices
upstream (denali, arcata, romulus13, blackrock), this device does not
appear to carry an internal codename in firmware. The DSDT, SMBIOS, and
EFI variables only refer to it as "Surface Pro 12in 1st Ed with
Snapdragon" (SKU 2110). I have used `microsoft,surface-pro-12in` as the
compatible. Suggestions welcome.

Although the device is marketed as just a smaller version of the denali,
it has enough differences that it warrented a different compatible and
device tree.

Tested on Surface Pro 12in 1st Ed with Snapdragon (SKU 2110).

Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>

Harrison Vanderbyl (8):
  dt-bindings: arm: qcom: Add Microsoft Surface Pro 12in
  dt-bindings: crypto: Add x1e80100 inline crypto
  platform/surface: SAM: Add support for Surface Pro 12in
  firmware: qcom: scm: Allow QSEECOM on Surface Pro 12in
  hid: Pen battery quirk for Surface Pro 12in
  drm/panel-edp: Add panel for Surface Pro 12in
  arm64: dts: qcom: hamoa: Add inline crypto for UFS
  arm64: dts: qcom: Add Microsoft Surface Pro 12in

 .../devicetree/bindings/arm/qcom.yaml         |    4 +
 .../crypto/qcom,inline-crypto-engine.yaml     |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi           |   10 +
 .../dts/qcom/x1p42100-microsoft-sp12in.dts    | 1160 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 drivers/gpu/drm/panel/panel-edp.c             |    1 +
 drivers/hid/hid-ids.h                         |    1 +
 drivers/hid/hid-input.c                       |    2 +
 .../surface/surface_aggregator_registry.c     |   15 +
 10 files changed, 1197 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts


base-commit: 5d6919055dec134de3c40167a490f33c74c12581
-- 
2.53.0


