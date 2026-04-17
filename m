Return-Path: <linux-arm-msm+bounces-103496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sO+JJsTz4Wmv0AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 10:48:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FF1418E64
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 10:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A92330457E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 08:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F11C3AEF58;
	Fri, 17 Apr 2026 08:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vo45Rkdd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B3739BFE2
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 08:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776415678; cv=none; b=gQsxUNBntfhPIZTsPNNGA1zC7tuk3U/lPAC24OPdwjfa4gFqBr2UNANWnJOh7c+co2CFPvjjyMwPP3sVr1EKWLjWN8JCrNZknyRV/EmBtnjdDT44y5XB37KDa1GQh7qlWkrUKamhTOMxTzjGDE3j6NlawauNpq22q2YLDZ0sXEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776415678; c=relaxed/simple;
	bh=l1EaDFY9lVbPRb6NM68LmhtFzEdCUmxstw3Kjtxw8Nk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qRHTAq/CqUuwiIJCYatJw09bXWPYZcCnt+qNyj218UsIgdDk/6/bk6qAerUdlBWllxoyY3xKZ2ZHO6C/96M6jOIR+nD6aFu0x/q1lYUhEtOm/zQUfYKhJ18CaS1JBu5oo8aIK+RNlnuvoWJFA7NxRgYGPrwhWYZ20JZ9scGE4FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vo45Rkdd; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-67179ed133dso437087a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 01:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776415676; x=1777020476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CEET8vV8bxTC95bwA4y5KBbwm94kt3IaZw5P98527UI=;
        b=Vo45Rkdde2F5/WgwCbyanHBmuka2jHjMmHFtJ8W7rRWhROMemTcfeLn5Qt14JSKpg9
         MbHYD487omApR0wL/vVBpeSeYH5CtYXWhcWTc7HiCD7kdDhuAa8a2nsbNehuFti16wkT
         lbbg8DaQQ7SsT5Q4SwoYCmQ1OVm/cLFNuUdYmhpkeXCMVQfUpBmrBGwAmISivhMcFCDz
         mDQUaY1AZBvT7iWg46gzti3jlzr/Bs/2QsPYIAykeZpdftKI4lxl/GwK1uWyuFMyWKd8
         MZKcs1eMOEUllssFvrlIULGSxWDJFX3XgSQTOTIhSme/pqJpAI3p5JOVpaky5wK6aeJD
         H82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776415676; x=1777020476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEET8vV8bxTC95bwA4y5KBbwm94kt3IaZw5P98527UI=;
        b=Fx5Tcvg6AcYhSs49KcpKPnWNptOAuEDY9vZV85UytuX3yIpWRT/SSwTL3A0xiY7/tc
         aNgFGTp56Qsbw6KmZWH4sL2Llg7955h9FQHHQWMoVBzNuIgecquWtSsNYFLnCvnLN7YC
         BCn45xF6qK0HrC9HifrKsITQ4e+Ky5CeJlAl0AbFxqYyBzJDlMpYOX/NCzmTuhhoYm6T
         nBNhj/yhcCqJ6nmS0OMd4ZMVvoqOkaRtqH/E+H5vSligWk3F1ZbqAZmkE/J5ARJQ83A7
         mIqnIxcg5sODbhyMUY4tHh5prFpA01BSa78YgZosZJOb+Y7YbRB14sBKlFUhTVxlO+pj
         /V3w==
X-Gm-Message-State: AOJu0Yw6mNr2QGrpC1JA0PGKN6qDG6XHcUsljP5YzYvgur4j/34nEUhv
	DOUE6aV4k+Dmj7Rrm/kV/xiEqJNamIj4ragP9q4I+NP5o8IBEqw2Dn+W
X-Gm-Gg: AeBDieu/QiqSXPzoRMQoMfRIQ9epoKxpr8BwQj9NwxQ2xcZTeSzNsuoyEWUU7ld/ppv
	i8u1n5fNSRw5CdNp7MOMCVWgb+SLTS248WoHlI5SqqdZRUO9/w0rQYVaj5iVY6gjcMxVxIWu3YJ
	rE6f4U3Hay6kzTFjJr677HHUry0mKA2DNLpp6bsVg5l3S3qrVTOYxe6ujjK5qkKCUrjrttejfrb
	vpARbPSL2NuQSXnCKHeVSOnt0U3uOzGJ83TYupzahxuSVGq56XuaFatO39UuP/3tgv2qOPoK3Ni
	j6+1vrZF/daCBAG56JSV8TC8YL5JjoSeIznTKcBeNf5jemYIFygCmnYsofQ5Lkvt69jJiGps9Xj
	pWrbXKKZHZGaQn0ctJXkosa3pDgbo7+ZfC8KA5WQWVL+nBwDdTUAvQwWQQv8DlLMeCJWgYEwVpW
	soOp3dgYNk+LRzwT7arVVObX6U2yjxlNE4hrw1ToA=
X-Received: by 2002:a17:907:6e94:b0:b9a:cb5e:5354 with SMTP id a640c23a62f3a-ba4190787a9mr107349266b.16.1776415675273;
        Fri, 17 Apr 2026 01:47:55 -0700 (PDT)
Received: from workstation.home ([178.230.164.112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45503c435sm32789166b.43.2026.04.17.01.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 01:47:54 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	val@packett.cool,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v5 0/2] Add Xiaomi 12 Lite 5G (taoyao) device tree
Date: Fri, 17 Apr 2026 10:47:47 +0200
Message-ID: <20260417084749.253242-1-zstaseg@gmail.com>
X-Mailer: git-send-email 2.51.0
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,packett.cool,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103496-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zstaseg@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 36FF1418E64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds device tree support for the Xiaomi 12 Lite 5G (taoyao),
based on the Qualcomm SM7325 SoC.

The display panel model is unknown, so bootloader-initialized
simple-framebuffer is therefore used to expose the display.

Changes in v5:
- Patch no. 1 - no changes
- Change vccq-supply to vccq2-supply in ufs node as it's ufs2.2 (patch no. 2)
- Val's patch for goodix-berlin didn't have effect on my touchscreen,
  therefore keep the touchscreen szie (no changes in this regard in
  patch no. 2)
- Link to v4:
  https://lore.kernel.org/all/20260305093941.305122-1-zstaseg@gmail.com/

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


