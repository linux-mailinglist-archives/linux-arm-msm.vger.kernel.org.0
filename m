Return-Path: <linux-arm-msm+bounces-90398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5Zg9GyxydGno5gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 08:18:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F327CC73
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 08:18:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1F9C301106C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 07:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8592E5478D;
	Sat, 24 Jan 2026 07:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKCEdVLJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FBA286A7
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 07:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769239081; cv=none; b=PKrSZxZ6Gha9y+zgpsRH3fkFXOR8MTCoGcSRPiYDr7g2G5xqgLSxnccmKm72G29o+Pzgwv2oQwJWpg+NR5f43XEbBBnaNSDb33N7ygQcubY4/+bhAEF5N5OnJ7ZqN4A6qoKkU7gMLS446tQz7wzlus0YBmEzsyuMeDfjt7LS6GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769239081; c=relaxed/simple;
	bh=+9HOQtjlX4mA4IZR1Hvru8xr2i16kVmAfTqaQ3gz4tc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YDRqsxLKgujb/8raSmKHGi/eKXsD6p0/Xs7VjUEkIsMCn6oHXj/tJpCTfW+1KsNvqW7pqYBWzNt8uraGZm1jkuklNmZ9+D/hx0B9FacAFXs6C+6y/Hj4QLa4WHk7fmyxonZ6ejfOWEJKZ9H2OoH5P/zqkzcobTlCQCxUerGJ6b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKCEdVLJ; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso1129917a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 23:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769239079; x=1769843879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ilZ2w1TVQcw+5B4wpHI58RyZvpIMQnoD338aEr4zq4c=;
        b=IKCEdVLJvkl3aB5aZ0bnApCp5iq//RVy624tQ2x+khWp8GNqWX+Cb1mIV3D3QAYYQo
         6RdT7rPpk2wGtCnYdkPevr5wdMysRUupL5yPBy0BM9nHoZHPsIB56foBSBDgOHs1t//N
         IQ8T9PY0e0nofrhDVcU/UPGpFA5if4IaUfLQ61l1/eYfsaMHWo4rtudtbvRLlKr0LuYG
         /U7vxPHV7Krm6nNysayWCOQGB4q/hQGK6g3IMnk0Rd/bengdF3bMzQUe4hGzpYUQA1SL
         DfpClfNRrZ3ywoRk3fy8hcO+Md+F0OOJpG+UaILpL8EuASS1D0bPfWJdwAqI1e2qqsUZ
         MHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769239079; x=1769843879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilZ2w1TVQcw+5B4wpHI58RyZvpIMQnoD338aEr4zq4c=;
        b=wnac8q5tAqEEdsIi7VQBdOUJ6QpFs2osoMjGVOUwE3Jf7sPBEJBMwXyF5Bx8lTjq5C
         c0QGtdjPa6Ccb83Asi6HiRrFIqUKnXjs6Y2sgvWGsnKK5i5LjJ3cqdrVoKA9Q7iwm0n7
         YgecK+2fnwMwPD73wyxbuJ2EqKNhROaKzTQpwKiXd/fZxkD0QiK8ivn1JmzEvcLNRvQR
         HU9w1UQQo5A1o8TgniRGy5KskwQ9GhuZTu8t2dzxgjLKv4dKgrMGTYuTB9a7HkTtyrDN
         wloDuMtwpIqmGlGBVaBzIOiD44DzafOEVulQFiTWWRo8HHps/BexUJxaxqBZqW3dN6ci
         D2+g==
X-Gm-Message-State: AOJu0YyFzlTIlBI3Jo03zYmK2grssUNXB0UJKgV6rVJZ7DKDVAOYhsNp
	c7UrCFwqIhNmW1bUS4Ht/+sOFsw0Msz42rf3Fo0yyhqaMsFLfrswDzrM
X-Gm-Gg: AZuq6aLE7JXjKy/3A1oFTpiaexR/CKE5cb6owHyps4hwITTK23zuYl5Cx3oI9kxdXpo
	UqhIus1qbpEZIAdGKZKZjH53Xo5tLxdERiG9G3rpKDtZKg3WnGRRPga2gF3pY0XBmiy4VftEFjb
	Mc49omu5aIZ+l3qWXpAQMuwhnzLiH549fXYsOMHHretDUBjBavTQbV/sBjYNnqIXmDjH6kdT3ic
	vjHMXC5JgVVQj5if1c5pMKPoDGhNx6cVoewTyBgQy/9vQ/0P4oLyHwmOtQ2wFkG1w6/sQRU+W5n
	d8c4WGXRJA5S3+FYg1gZcr9sPvMTZ0iDCsNAG77k/YIYfSbhHkWdV/YVREG5PCeT+lcDsw20r8J
	YKd2FoV/a+NyEHFNaI2CyBx7RnhBpjnt2BvdIorSlV2iIwE5KM591WkRGOaNNb3jghymsoK7Z6/
	4dtlMOio6YhMMlOj0dI7QV+bG718Enc+kMrHc=
X-Received: by 2002:a05:6a20:5681:b0:38d:ed3b:87e4 with SMTP id adf61e73a8af0-38e6f83580emr5296507637.79.1769239079336;
        Fri, 23 Jan 2026 23:17:59 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:1ce:3fd2:e11e:72d7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a42e8ecsm3645344a12.32.2026.01.23.23.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 23:17:58 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	rfoss@kernel.org,
	todor.too@gmail.com,
	bryan.odonoghue@linaro.org,
	bod@kernel.org,
	vladimir.zapolskiy@linaro.org,
	hansg@kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	Saikiran <bjsaikiran@gmail.com>
Subject: [PATCH 0/3] Fix OV02C10 camera stability on Snapdragon X Elite
Date: Sat, 24 Jan 2026 12:47:48 +0530
Message-ID: <20260124071751.5885-1-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-90398-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[launchpad.net:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C9F327CC73
X-Rspamd-Action: no action

This patch series fixes critical stability issues with the OV02C10 camera
sensor on Snapdragon X Elite platforms, specifically tested on the Lenovo
Yoga Slim 7x (x1e80100).

Problems addressed:
===================

1. Camera pipeline permanently locked after application closes
   - Affects qcom-camss driver
   - Caused by early return in video_stop_streaming() on subdev errors
   - Result: Camera unusable until reboot

2. Silent failure in sensor disable path
   - Affects ov02c10 driver
   - I2C write errors during stream stop are silently ignored
   - Hinders debugging of power management issues

3. Brownout/latch-up from rapid power cycling
   - Affects ov02c10 driver
   - Occurs during browser WebRTC permission flows (rapid open/close/open)
   - Sensor microcontroller locks up requiring full system reboot
   - Root cause: Incomplete regulator discharge between power cycles

Without these fixes, the camera becomes permanently unusable after rapid
open/close cycles and requires a full system reboot to recover.

Testing:
========

All patches tested together on Linux 6.19-rc5 with:
- 50+ camera open/close/open rapid cycles (< 100ms between operations)
- Browser WebRTC permission flows (Chrome, Firefox, Brave)
- qcam stress testing
- libcamera/pipewire integration testing

Hardware tested:
- Lenovo Yoga Slim 7x (Snapdragon X Elite x1e80100)
- OmniVision OV02C10 2MP RGB camera sensor

Ubuntu bug tracking:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2138756

Patch overview:
===============

Patch 1: Fix qcom-camss pipeline lock leak
  - Ensures pipeline is always released even when subdevices fail to stop
  - Prevents permanent camera lockup
  - Improves error messages to identify failing subdevice

Patch 2: Add error logging to ov02c10 disable_streams
  - Captures and logs I2C write failures during stream stop
  - Still returns 0 to prevent pipeline lock leaks
  - Aids in debugging power management issues

Patch 3: Enforce 2-second power cycle cool-down in ov02c10
  - Tracks last power-off timestamp
  - Enforces minimum 2-second gap between power cycles
  - Tested delays: 900ms (failed), 1500ms (failed), 2000ms (reliable)
  - Improves power sequencing (MCLK off before regulators)
  - Zero performance penalty for normal usage (camera opened after >2s)

Impact:
=======

These patches resolve a critical user-facing issue where the camera becomes
completely unusable and requires a full system reboot to recover. This
commonly occurs during:
- Browser WebRTC permission prompts
- Video conferencing application startup
- Rapid application switching
- Camera application crashes with immediate restart

The fixes are conservative, well-tested, and maintain backward compatibility
while significantly improving system stability.

Saikiran (3):
  media: qcom: camss: Fix pipeline lock leak in stop_streaming
  media: i2c: ov02c10: Check for errors in disable_streams
  media: i2c: ov02c10: Enforce cool-down period to prevent brownout

 drivers/media/i2c/ov02c10.c                     | 75 +++++++++++++++++----
 drivers/media/platform/qcom/camss/camss-video.c | 13 ++--
 2 files changed, 74 insertions(+), 14 deletions(-)

--
2.51.0

