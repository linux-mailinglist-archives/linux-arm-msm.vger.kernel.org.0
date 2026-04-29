Return-Path: <linux-arm-msm+bounces-105248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APz5DlUm8mm/oQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:40:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED2649719A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 942A0305FD5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 15:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 308FD337BAC;
	Wed, 29 Apr 2026 15:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="HSl7Wbfh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF1B1E98E3
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 15:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777476918; cv=none; b=fzKsDbJJakWbh1xr2cx72+tGO1ZCaxfB0xGLN5wKzay6OP+5uGGFgI8sOOpxa4wCHMU+6I5JSs6/JwZwwq/0dXh0h2l01WfRMw4kllrDT9izsPkQ3Pn1+5zy3ZeqvjAnGlb8MK7tCLP8/1Eh9g86DeFcMI0ho+cjSS+nWHuxIo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777476918; c=relaxed/simple;
	bh=9le1ce9/QQsg3R4Ix6d8r0Smmm5dxlj7Sj5MC0zbZ1A=;
	h=From:To:Cc:Subject:Message-ID; b=KxBQBURpYsmQvCinADdWpd5rhu25z0dQM0hRjd5cWuOeIslbOGeV3GYz5SY4yacirxeHNNbRZfpivTP9NF2nHImvdGvITR070jyQDd3uwsqmkifoYn4hlPE7xfezNJJRhh6cl/gVfCaToan0k5tm61tGjJpLGh1Vt6yZc9R3NAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=HSl7Wbfh; arc=none smtp.client-ip=212.77.101.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 45476 invoked from network); 29 Apr 2026 17:35:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1777476907; bh=Mm7UIET/CUAt65FbRFnd7WF49dyY5xMSzk3tBcZ2qbM=;
          h=From:To:Cc:Subject;
          b=HSl7WbfhIR9TcONaoZcJzcCHOEU9LQ5ntg1yCD+e1lZRC0q2If3cKE2+wrQfdmq3e
           8gL2eE2AreufILrt1DpPmTwJn25EmsJdPtb/ATm5J2UYHfYLZqNq/RCnU2/xaOXEQb
           Sn0NFwToLruyac+6Zx9HBL8ldnyuuMB/2ntYFpGOhgOSjG8SZXC4hS/RaXSXyZBsx5
           LTgSlOJMOFb1QVlMtocLyguP39e19pZeaIRQJ977+F4up5LYvWdp0/z3Afu4E7YXxW
           oOaI9b+LW9njxmbzc2EkMTZcAfihVQfxQ97XDxyKNNp1aNKdAzodqCpkqMIbLx5QRq
           82PNCqB899ntg==
Received: from host18560247242.static.ssm.silesia.pl (HELO report-kbd-backlight.txt) (adamszyma@wp.pl@[185.60.247.242])
          (envelope-sender <adamszyma@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <val@packett.cool>; 29 Apr 2026 17:35:07 +0200
From: Adam Szyma <adamszyma@wp.pl>
To: val@packett.cool
Cc: linux-arm-msm@vger.kernel.org
Subject: Dell Inspiron 14 Plus 5441 - keyboard backlight and panel (x1e80100 Thena)
X-WP-MailID: b95de355a68f63ce209270fe36fffd33
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000101 [sfLl]                               
Message-ID: <b95de355a68f63ce209270fe36fffd33@wp.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Date: Wed, 29 Apr 2026 15:35:18 +0000 (UTC)
X-Rspamd-Queue-Id: 9ED2649719A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[wp.pl,none];
	R_DKIM_ALLOW(-0.20)[wp.pl:s=20241105];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105248-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[wp.pl:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adamszyma@wp.pl,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[wp.pl];
	FROM_HAS_DN(0.00)[]

Hi Val,

I have successfully installed Ubuntu 26.04 with kernel 7.0.0-32-qcom-x1e
on a Dell Inspiron 14 Plus 5441 (x1e80100, codename Thena).

The device uses the same x1-dell-thena.dtsi as the Inspiron 7441/Latitude 7455,
but has two differences that need addressing:

1. KEYBOARD BACKLIGHT:
   The dell-xps-ec driver (dell,xps13-9345-ec) is present in the kernel but
   the DTS node for EC is missing from x1-dell-thena.dtsi.
   Keyboard: hid-over-i2c, vendor 0x6243, i2c-4 (b80000.i2c), address 0x05.
   Could you add the EC node to x1-dell-thena.dtsi to enable keyboard
   backlight on this device?

2. DISPLAY PANEL:
   The Inspiron 5441 uses a CSOT MPP36 T9 panel (CSW 0x143d, 1920x1200@60Hz)
   instead of the panel in the 7441. Brightness control is non-functional.
   I have already submitted a patch to dri-devel@lists.freedesktop.org:
   Subject: [PATCH] drm/panel/panel-edp: Add CSOT MPP36 T9 eDP panel
   Date: 2026-04-29, Message-ID: <20260429145251.8445-1-adamszyma@wp.pl>

Hardware info:
   Model: Dell Inspiron 14 Plus 5441
   SoC: Qualcomm X1E80100 (Snapdragon X Elite)
   Panel EDID: CSW 0x143d, MPP36 CSOT T9, 1920x1200@60Hz, 301x188mm
   Keyboard: HID over I2C, vendor 0x6243, product 0x0000

Tested-by: Adam Szyma <adamszyma@wp.pl>

Best regards,
Adam Szyma


