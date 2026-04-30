Return-Path: <linux-arm-msm+bounces-105368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IH4ZOXpX82k/zwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 15:22:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4214A3602
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 15:22:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F576301BA7B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 13:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F0E4266B3;
	Thu, 30 Apr 2026 13:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="YGWZfIoC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCF54218B7
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 13:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777555307; cv=none; b=YL6J8AYOyNtXwqDzh1nwmZ6OyVbCXNJgBbRyPTTEYoqYxZaicnZtC+Gv6rgNd8pQC8Tm91zvKdT5QuMCDpVV35uq42W8usF9UCf7IoHLRXZIvamnxB56umrCRArUQfn80s87XV3RjJqltWJ0ZQECCid2EH+wOdCI5TzxtaNjvdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777555307; c=relaxed/simple;
	bh=2eZMKrdUq1kE1wYNVAUmX1R9Mh35MCWgdtBeWNPzAyk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BxBuRhbk+TswbDnhZLBLKkBd6rQuV3klO/DbvJuxaF42jb5qaOrzHdS8mGqeLY5P5ViOLo/u11rAUoomWlT1VK0pudn1TyWMAIHcjWAMr2gKPalNUNW97VeLCfcOUE2tYlu+UDDGyBEguMEsCqc3clAFdx7CPdIJINDkI30GgSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=YGWZfIoC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so15468995e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 06:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1777555304; x=1778160104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p1duYelZIs2qYPVB/MOAgMGm1UaFo5h5pWBMCVl5tsA=;
        b=YGWZfIoCRBbG6Ll6+BosBvVGxHjmgZbWbRRUbU9MLD/MGTCdwQfx74F6mUSvs1SH28
         zqUtxy0+oQveWzmFj3PmIo/A4BqpTHLnC6QkGrdb1fteYn/Arkh6fzTBsVM/ENe45EGq
         512FsPx+DPg68KS4Zl2FzxC/MbaUT+EpPBxsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777555304; x=1778160104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1duYelZIs2qYPVB/MOAgMGm1UaFo5h5pWBMCVl5tsA=;
        b=DD67fy4eXkQIEJzHdqjf7Z9L1m3hnqs7WyH6SvdD6RrRJovH17KKnOMVXFMLZC4hEu
         pT6mcJhpsnEsplIs9ev1X0Kg0b4ploEhanHjbD0UDClHCsqZxemt/U4ZHpXxdMe7v9rN
         R6Aq29ugb4hxFSYc4NuLvsuAazXc4DDJozTGZ8X+XYvz9UDC49Urbq+7SJxdj4HJH8dK
         M3HyC5PoSfm4I5P2C+Lv3Wg8Iiy2DNArCfvQmAE6HX0Iv+2oOQ5lPhXO3vGdh455N2w4
         oejNKKKhqAwS3Bm8+Pp3bsw0x7fNG1w1HwCw5PbF2w5E7+ply1x+xb8gFHYiQpaPDLzU
         Jh2A==
X-Forwarded-Encrypted: i=1; AFNElJ96lHDPZnUUf1gOF0FocUzCB7v0UAFMfpyBaW32aTpKx3u33yWTUS9riL2bEjcw8+EkI5ZAr9Fj3W/dBwcU@vger.kernel.org
X-Gm-Message-State: AOJu0YwiiMbMK7uKdYyF4vUzfJ1HBie7WUuaprfe2OisD6e3H/o5Ps9A
	rtvPw6P0UXk16VEBCo3X7/3YQL7GNlSxvh63xh+fL2vonWJPNsw027r4PGOxUf88GOs=
X-Gm-Gg: AeBDiet6t4RVKCh3uETnVps4ppdgz5C8XErIP9qc7poy/1Plu/vhK7LeNJToQXTyBez
	d+WwSzaedpVxfu1oRFqdeFA45eGoxhKQUX1x8RUjXK/ARp/d2p0tXGT4Fl2M7aho4BHchar8krj
	8hUKUu7n4w7V65wHvgWDLuT9sIhzFOwpAOVrryRz5m774JxXJtGCNlavTkxoP5OakNr5pOp0l/f
	BunTKQ47YidUjTSjPxQTkd/NDNBUP8gdCfNQPsqnRzKEZyt2lphA6L7hiHdSp2/EXS/kMctQMkC
	LwARv89ILkyNkX9eCHTXeb5y2SUeQziZRrOelNuBdyAvjEG9G/gsbk9Nl1xaWeDxAh/p2ihVBJZ
	vH+poi+ntonhmSAa7GeplSlopOQBHmqV7IVwOk/CyeRH1J4V1TPRIcJcb8WICmifaJma+rmvJAW
	No3Aj15s7vs34i16kj2i3w9tmrC1MgUkrn2GEZjgSzn6uEL4TGP5cQvR3qXD00MSqL9cM=
X-Received: by 2002:a05:600c:8b76:b0:48a:5363:8cac with SMTP id 5b1f17b1804b1-48a84484f9dmr52429955e9.22.1777555303724;
        Thu, 30 Apr 2026 06:21:43 -0700 (PDT)
Received: from riccardo-work (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82307f28sm106210325e9.13.2026.04.30.06.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 06:21:43 -0700 (PDT)
From: Riccardo Mereu <r.mereu.kernel@arduino.cc>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org
Cc: linux@roeck-us.net,
	Jonathan.Cameron@huawei.com,
	wenswang@yeah.net,
	naresh.solanki@9elements.com,
	michal.simek@amd.com,
	nuno.sa@analog.com,
	chou.cosmo@gmail.com,
	grantpeltier93@gmail.com,
	eajames@linux.ibm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	festevam@gmail.com,
	imx@lists.linux.dev,
	m.facchin@arduino.cc,
	dmitry.baryshkov@oss.qualcomm.com,
	loic.poulain@oss.qualcomm.com,
	Riccardo Mereu <r.mereu@arduino.cc>
Subject: [PATCH 0/3] arm64: qcom: imola: add support for Media Carrier 
Date: Thu, 30 Apr 2026 15:21:37 +0200
Message-ID: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7E4214A3602
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	SUBJECT_ENDS_SPACES(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arduino.cc,quarantine];
	R_DKIM_ALLOW(-0.20)[arduino.cc:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[roeck-us.net,huawei.com,yeah.net,9elements.com,amd.com,analog.com,gmail.com,linux.ibm.com,vger.kernel.org,lists.linux.dev,arduino.cc,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105368-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r.mereu.kernel@arduino.cc,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arduino.cc:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arduino.cc:email,arduino.cc:dkim,arduino.cc:mid,0.0.0.3:email]

From: Riccardo Mereu <r.mereu@arduino.cc>

This patch series adds support for the Arduino UNO Q (aka imola) Media 
Carrier expansion board.

It adds: 
 - two CSI connectors (support only for imx219 sensor)
 - one DSI connector (support for waveshare 5" and 8" touch A panels)
 - 3 jack connectors (headset, lineout and ear)

It modifies the previous qrb2210-arduino-imola.dts (named in this patch
series qrb2210-arduino-imola-base.dts) in order to move audio and video
output via USB-C to a DTBO.
This is needed since the DSI lines can now be used via the carrier
board.

Camera and panels are divided each in their dedicated DTBO so the users
can easily configure the overlayed DTB to match what's actually
connected to the carrier via user-space tool soon to be released. 

Depends on two patch series:
 - https://lore.kernel.org/dri-devel/20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com/ 
   (applied to drm-misc-next)
 - https://lore.kernel.org/dri-devel/20260331-ws-lcd-v2-0-a1add63b6eb6@oss.qualcomm.com/

Riccardo Mereu (3):
  arm64: qcom: agatti: Add dai@3
  arm64: qcom: imola: Move analogix video/audio output to dtso
  arm64: dts: qcom: imola: add support for media carrier board

 arch/arm64/boot/dts/qcom/Makefile             |  13 ++
 arch/arm64/boot/dts/qcom/agatti.dtsi          |   4 +
 ...ola.dts => qrb2210-arduino-imola-base.dts} | 122 +++++++++++++---
 ...rrier-media-camera-imx219-csi0-2lanes.dtso |  49 +++++++
 ...rrier-media-camera-imx219-csi0-4lanes.dtso |  49 +++++++
 ...rrier-media-camera-imx219-csi1-2lanes.dtso |  49 +++++++
 ...rrier-media-camera-imx219-csi1-4lanes.dtso |  49 +++++++
 ...10-arduino-imola-carrier-media-common.dtsi |  46 ++++++
 ...a-carrier-media-panel-5in_touch_a-dsi.dtso |  80 +++++++++++
 ...a-carrier-media-panel-8in_touch_a-dsi.dtso |  80 +++++++++++
 .../qrb2210-arduino-imola-carrier-media.dtso  | 131 ++++++++++++++++++
 ...rb2210-arduino-imola-video_sound-usbc.dtso |  61 ++++++++
 12 files changed, 713 insertions(+), 20 deletions(-)
 rename arch/arm64/boot/dts/qcom/{qrb2210-arduino-imola.dts => qrb2210-arduino-imola-base.dts} (85%)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi0-2lanes.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi0-4lanes.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi1-2lanes.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi1-4lanes.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-panel-5in_touch_a-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-panel-8in_touch_a-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-video_sound-usbc.dtso

-- 
2.53.0


