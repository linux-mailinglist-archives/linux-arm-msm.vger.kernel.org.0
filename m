Return-Path: <linux-arm-msm+bounces-115005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f3TBBQ5YQmqI5AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:33:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE926D97A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:33:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=hcfVZ8MU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115005-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115005-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1D6F5303A98E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5447A3D79FB;
	Mon, 29 Jun 2026 11:30:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A315C38F930
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:30:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732652; cv=none; b=VjtFMlixH2Uw037+KUvcW1GYBWdxipJLMOWfnkmBK24SBVkiLbVvsqdHosgYxDcMGgC+Ocy8Owx+VPJidw7s8M8RNsQiFMKmaaHUdNiNIBhrXwUpUPx4x6RNC1BKfSiRb4X/Kr+aeKI3DVCvjN1kiGK3BkCNTCJwP6OvLxeSy34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732652; c=relaxed/simple;
	bh=QSUEAP+Nd4pVoltuzLogp/stpR4Z7CG0NdMEnz186bQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kLSiXwn9x/h88sTVN5vVo8qX4eiza9um4T8df8s+Gzx4fDdtd5Rb0g11Z+2GDOkNnrcq68syC6BtyD65cAukVmNLJr9h5yXtchSaKWq4M2+kqmZNwDIvfLPYBvdGxK79T1g67QHGy1CWaDGDd7pKJ9UNyN48UK4fI+PxzllZvtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hcfVZ8MU; arc=none smtp.client-ip=209.85.167.41
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aeba1a36dfso576454e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782732649; x=1783337449; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EOxj6jhWQaC4bW6qpCLMl5ChGw244cUlmVoMPEl8HCI=;
        b=hcfVZ8MUninAnlFVPrjo0AcaKWagp+SjW0Jw/gOs6nfTWgOMw2M2KldkQeaeYqXoP9
         d1oaUZn3pHfDIdm0NxTQbo+n03Lv3FNLeVXcoTyV6NIwW3uA0d3bMi2TQjiFeKSeukRg
         RwTftMntGEBTdJLiTgdgDHKcoFt4fCmoZsDkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732649; x=1783337449;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOxj6jhWQaC4bW6qpCLMl5ChGw244cUlmVoMPEl8HCI=;
        b=HyCUcjs2d6sxDgVzeZ0R94f161SMvPFyncQWqYTd47lwcINz4hJHbw/aBcQQXT4hz9
         M0ad/C3Q7dGSxcmmdYcB759bnLrxuhzKvWLEDtUlBNXE7yr5I5adTPJchBDJz84U9jYd
         FdweoNdhrdd7lBAayRgSwX/f7UsjtH4fOUYdvy+0H0KPPDKPSH4oHEiVy/q2wjK86Qop
         jmV5jMyNwaUpx+9PUiGdYdtPwzlSCbbjfNLMibi5J3rzgtSASMZSpKWqyvM2BJRr2BIN
         dQ+3ajpSOlbm0jiD81TtOKP4LsjGLuj+d6Te+l0By+VEMbrEuIFJZ/ZPjH1FfGiCd8Nk
         /rnw==
X-Forwarded-Encrypted: i=1; AHgh+Rp1+zYTCzjklg7h4iKrVm2oKJvlRX30snLKHSGtHJpZ84fV5ZAFgOuJ8CLaZM4Ulwqg3yTni1iSTTJscYV9@vger.kernel.org
X-Gm-Message-State: AOJu0YwfS61ZPDyMzTbCCLdzlOSzUdLdnt/OQr5V5BFWAvdrTq8GT13P
	/J1i9FuIyLNb6v7C1xR6I5zIojDWJhJ/03uOLGWh6DuiUFlaGez2jILRtZkMLpjXrQ==
X-Gm-Gg: AfdE7cla6JvBCYBC5cO1dppR2HWPIGl/lfgqGSYST+TNGY+RUBtBTGZKYhv3dTm1FYL
	2haWsTupC/AOUOtQpq1pf+Gbeo+i5aHyZi1xLDC1V6GONlprdu7//RwtR1w/SF3C3QTiMbClS3y
	sLcLEbmgSzkgrgTrCZJe9ToaIwGg4TUybxR/mCZCrx80f5EZdPRlxG61nv+bK8WoPuXpDo3J+48
	pdwamLu6qEQUe6glVY1yRR7j0vrTcgL2PntGgfn7X5Y5ZnMMVlMwpli/3ocGQzSYQj5S96qXk8V
	dAie8gNek9vnWvq4dOP0PX0MliN3gu7JnLWEHVUTizh11HCpC7Y3hi1XFuKR0YE42cp1e+l3OJ8
	BbDS6vSYs8nWbyGYdoZSDjxDc4CVSyFRL45io4PyMe8oQOJ5NUSxndTYx5HzbmqSMNbSujzEtOF
	unWbskUTK88sycJGruFrHa+5T/e+9QI+tbYZP+Tdac35fjB/IoCVD4af1Yq9yvwfqkDnsH5bLhG
	CIEyl0=
X-Received: by 2002:a05:6512:a35a:b0:5ad:55f6:1ec3 with SMTP id 2adb3069b0e04-5aea944f191mr1546849e87.5.1782732648947;
        Mon, 29 Jun 2026 04:30:48 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aea2cffc04sm3597745e87.17.2026.06.29.04.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:30:45 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/9] media: Fix all missing cocci warnings
Date: Mon, 29 Jun 2026 11:30:41 +0000
Message-Id: <20260629-cocci-7-2-v1-0-5884c80ee3b6@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGFXQmoC/x3MQQqAIBBA0avIrBvQiZS6SrQInWo2GgoRiHdPW
 j74/AqFs3CBRVXI/EiRFDvMoMBfezwZJXQDabLa0ow+eS/okNCFUZNxbCey0Ps78yHv/1q31j7
 Q8KBlWwAAAA==
X-Change-ID: 20260629-cocci-7-2-7d30217e6526
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, Bin Du <bin.du@amd.com>, 
 Nirujogi Pratap <pratap.nirujogi@amd.com>, 
 Sultan Alsawaf <sultan@kerneltoast.com>, 
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Abylay Ospan <aospan@amazon.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Bin Du <Bin.Du@amd.com>, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115005-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:skhan@linuxfoundation.org,m:kieran.bingham@ideasonboard.com,m:bin.du@amd.com,m:pratap.nirujogi@amd.com,m:sultan@kerneltoast.com,m:Svetoslav.Stoilov@amd.com,m:sakari.ailus@linux.intel.com,m:aospan@amazon.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:Bin.Du@amd.com,m:ribalda@chromium.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ribalda@chromium.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,chromium.org:dkim,chromium.org:email,chromium.org:mid,chromium.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AFE926D97A2

With the introduction of 7.2, cocci is triggering some new warnings in
our codebase. This series takes care of the new warnings and refloats an
old fix for dvb_frontend.

./platform/amd/isp4/isp4_subdev.c:394:6-25: WARNING: atomic_dec_and_test variation before object free at line 395.
./dvb-frontends/helene.c:1049:2-7: WARNING: invalid free of devm_ allocated data
./dvb-frontends/helene.c:1013:2-7: WARNING: invalid free of devm_ allocated data
./dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2776
./dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2786
./dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2809
./test-drivers/vimc/vimc-sensor.c:107:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
./platform/qcom/iris/iris_vpu_buffer.c:703:13-15: WARNING opportunity for max()
./platform/qcom/iris/iris_vpu_buffer.c:583:23-25: WARNING opportunity for max()
./usb/em28xx/em28xx-cards.c:4085:2-3: Unneeded semicolon
./usb/em28xx/em28xx-core.c:635:2-3: Unneeded semicolon

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (9):
      media: em28xx-video: Remove unneeded semicolons
      media: iris: Replace ternary conditionals with max()
      media: vimc: Fix prototype of vimc_sensor_update_frame_timing
      media: vimc: Ensure that pixel_rate fits in 32 bits
      media: platform: amd: use refcount_t instead of atomic_t
      media: dvb-frontends/helene: Rename priv variable
      media: drivers/media/dvb-core: Split dvb_frontend_open()
      media: drivers/media/dvb-core: Refactor dvb_frontend_open locking
      media: drivers/media/dvb-core: CodeStyle for dvb_frontend_open()

 drivers/media/dvb-core/dvb_frontend.c              | 159 ++++++++++++---------
 drivers/media/dvb-frontends/helene.c               |  56 ++++----
 drivers/media/platform/amd/isp4/isp4_interface.c   |   4 +-
 drivers/media/platform/amd/isp4/isp4_interface.h   |   2 +-
 drivers/media/platform/amd/isp4/isp4_subdev.c      |   2 +-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |   4 +-
 drivers/media/test-drivers/vimc/vimc-sensor.c      |  12 +-
 drivers/media/usb/em28xx/em28xx-cards.c            |   2 +-
 drivers/media/usb/em28xx/em28xx-core.c             |   2 +-
 9 files changed, 134 insertions(+), 109 deletions(-)
---
base-commit: 253355887a1ab0ac8f33b356c7c1140eee554d18
change-id: 20260629-cocci-7-2-7d30217e6526

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


