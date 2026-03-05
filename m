Return-Path: <linux-arm-msm+bounces-95478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FS5E2XPqGlIxgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 01:33:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F40A6209735
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 01:33:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 91A823056E59
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 00:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EADD1EBA14;
	Thu,  5 Mar 2026 00:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PrBuclfc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28EB1494C3
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 00:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772670810; cv=none; b=RxZtODJj8rzRt06tNxdDq63ELFvs2aUm497T7Fo+prkCGJcoTrmr9fv9na2IYN2kcKjuIVL0Uz+vaNkSxnKJNJtgoprvbxC39/EOmJQTMpGRZJDKjhRSi2/tVxjtCdkO85fuFp5DPz+Id708dtYK1mDCFbGFKxPNV7F9uRI816U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772670810; c=relaxed/simple;
	bh=jYZWIpEDvUIg6uWxGLa3xhe50hws5xo7lklZCfYbEXM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JuCGTesgCBavq1ptAtirHOew5u/wM0NoL3oil/GsMKibFsP9rvY6kV4CKBggHc8YtbHS+T/E1EGnWAfGWiS4aW2AeXJM60v789PmGgUwf9X8yAeWsdbTrQJkx+U1qbc1jqT0YNu6pG224dqjSe7aib5B2h+e099xCnL/yv/HUG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PrBuclfc; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7d4c3896e32so4216435a34.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 16:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772670807; x=1773275607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=upUg3ZxOy0Ji9DU1YGXp3LZIoYzzoDo9wLPMsUxZBkY=;
        b=PrBuclfct8VlIo08/TfrfQnS+m4VsG+7Fo8rsfz+zNy5J5qKzLAyu0mVTY7c8VYwCc
         6iVsFPsRFtCElSERY+F51tHh2CUhtTplrtWfG3i9hPog6cf9JOPFF8Mzg8cu7UHsrDt3
         oC65y2ZmyO6Ip+HzI9SDdrbfpjztsoD5p7Nm1dtkEtVcqwSRgx1QShcYF6gigrk5WYXv
         +rGrSfQGafaMBGt9jJ56NNNxja36T0VBaV4ZxfQmq6XUr11vAarjfwxT4jv0TsWo2flE
         9lokSPrH/vT4oFCbs8xuLBIHPqxtlQmbBYVoheipk3SrF0Ja3F1j0ACC8tjJyzROrNF8
         c+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772670807; x=1773275607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upUg3ZxOy0Ji9DU1YGXp3LZIoYzzoDo9wLPMsUxZBkY=;
        b=T22LNpIehsO1aahBFExu+b1scq2TbWIxp32R6R7Y8P9Pi6dbxOKO5lXUhbOMssE1DL
         aZORomx15bt3AQfWsZvMLRBTt/e9QDoXJ+GHsYGEouVSU4hNx5Q+K4mbt8BCQvLSkf9j
         qE2KQdMkRviyiUOmU9+A6Bu2D+aJMgUUBpsqGVcidAnjRG4es3EXL5p+IQQs7PpEm4qX
         Yx6rN4P4Ycsm/CDET5TfCxqDIqAtyeFRDOCsm6fObwqU4aQUBwiZf9z8RY92JtyzUhKF
         ZP4S+VskW5P1tF+CwpCzxCl9PT0+t0Xo++XI25Ul0uqtm7bRYNL3gRAZtnMXVLPhcFcE
         pCaw==
X-Forwarded-Encrypted: i=1; AJvYcCWQzhUUqF4Jgbrmx9MENqAYoqmdxaCSAL6lA5fDv5dZohrDNrqsoedqPb2SC6SzBHFdjRArQjM5lvQRfRat@vger.kernel.org
X-Gm-Message-State: AOJu0YyTHqP1oFaFjaECE1V7QdrAEw1nz9wyiT4SRGfBE2kHxaumpWVR
	hHTK0iqmvhFIUJvS83WKLZ8Jv+ofHqOZCMGLO5OlwcXKt+kVqJv87u8h
X-Gm-Gg: ATEYQzx7Ma4Nb3KzW54/XTg0cK07PSgbP9y1i2AiZsJld0CnfjWSuW0RCWs7Xv4LYci
	8OGWk3HdPx3HMm4TCA3IYPlEVxnnJJhvQMY4N3BfvARpz1a8dOcW2XWrzwPDA4whs/cRMsLp/Ee
	FV7+PC3WTJbqvzEfdeIdnWtOyhRIArTtbVyh83as9fz6EgH3kgQHR2zMcHY98PVoAgQ5C6iFTR6
	PX8lEym2UU45nYLW6uZKa0KBd46jkWXgd9lGPxGTfFEWUOdBoSmlRvlGhtSpqAPzUZzSwIHvS5f
	LXWFikuoLAWkuBB3yRpyWK+FKhWz1Tq+L5RY4UnVgQ9R0E1hoTeZ51t/CFTj8j3U4ysH2KoXXQ9
	d/X8ayN3X9kPqKPZvGRlWDjQB+RyJY4vhhjidqdNV9fSE/c60VIzS73ORy9c21wEPwy+/hCM6+V
	mPXSc4IQwBYXfUpPNT7j+/yGMPMBnXPGCwTHET7B5guHnAQxyBYDJVipt9463CLSuIQpb079pid
	Vcb9mEN/ic770ZC1XMePar9ir26eTTDQ838fIt6mDDSt9eZz//K
X-Received: by 2002:a05:6830:3983:b0:7cf:c482:4982 with SMTP id 46e09a7af769-7d6d13b8e27mr2432945a34.25.1772670806981;
        Wed, 04 Mar 2026 16:33:26 -0800 (PST)
Received: from framework.misc.iastate.edu ([2610:130:110:25d:2aa4:4aff:fed7:9b19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d58644dd17sm16633834a34.5.2026.03.04.16.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 16:33:26 -0800 (PST)
From: Kerigan Creighton <kerigancreighton@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	wcn36xx@lists.infradead.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kerigan Creighton <kerigancreighton@gmail.com>
Subject: [PATCH v2 0/3] Add support for Qualcomm WCN3610
Date: Wed,  4 Mar 2026 18:32:50 -0600
Message-ID: <20260305003253.1022386-1-kerigancreighton@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F40A6209735
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,lists.infradead.org,kernel.org,linaro.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-95478-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kerigancreighton@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

The WCN3610 is a 2.4GHz-only WLAN/BT combo chip used in some
cheaper Android and Windows phones such as the Lumia 550, and
IoT devices like the Anki Vector robot. It shares a lot in
common with the WCN3620.

This series adds support for the WCN3610 across the necessary
subsystems:

   * Document the new compatible string (patch 1).
   * Add compatible string in qcom_wcnss_iris (patch 2).
   * Add rf_id and CFGs for the WCN3610 in wcn36xx, disable
     powersave for this specific chip, ensure it is 2.4GHz-only
     (patch 3).

Tested on an Anki Vector 1.0 and 2.0 robot. Support for other
WCN36xx chips has not been affected.

Changes in v2:
 - Move the Documentation patch to the beginning of the patch set.
 - Move remoteproc compatible string addition to the middle of 
   the patch set.
 - Add Reviewed-by Dmitry (thanks!) to remoteproc compatible patch.
 - Move wcn36xx driver changes to the end of the patch set.

Kerigan Creighton (3):
  dt-bindings: remoteproc: qcom,wcnss-pil: add WCN3610 compatible
  remoteproc: qcom_wcnss_iris: add support for WCN3610
  wifi: wcn36xx: add support for WCN3610

 .../bindings/remoteproc/qcom,wcnss-pil.yaml   |  1 +
 drivers/net/wireless/ath/wcn36xx/main.c       |  4 +-
 drivers/net/wireless/ath/wcn36xx/smd.c        | 70 ++++++++++++++++++-
 drivers/net/wireless/ath/wcn36xx/wcn36xx.h    |  1 +
 drivers/remoteproc/qcom_wcnss_iris.c          |  1 +
 5 files changed, 75 insertions(+), 2 deletions(-)

-- 
2.53.0


