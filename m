Return-Path: <linux-arm-msm+bounces-90855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCg7JQL2eGnYuAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 18:29:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF0598747
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 18:29:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 062F23027B79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01EF2E8B6B;
	Tue, 27 Jan 2026 17:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HsmZvTKz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3772D060B
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 17:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769534884; cv=none; b=QfqGtPDZV3nL+74pJuhVmZCAZbs6AtstEfupqVNiJ3lu2aFCYec3d8S9eiTo4vffCGLV5occCFxFDPpNXnNGzhRjoYpbUSt7HxAmHBNmTALsdktYVsW84NNmhCQ4TEsCYxuZ49SCpRvn576QxRDd4L4QVOKiMJwOjVTzUI0YI5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769534884; c=relaxed/simple;
	bh=ZgbjsRQaZkMn/eY4Pk5OG989f5WZ+l4huWLDB761P7U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d0fPgFZXaMTEamiq2+WDzhMks3nrg+dw5KKnd7yPpkSbYh4d0crldQCS1DbnBnKJnMwUzXqy8fPuPCl/lXmwkEfaloWY2IBOjP06YrtlBKxTEULIjsGy5I1AgYg2lTSBAJctShAMhlXLHMtpG4Zo58icpkd0vU0mi48cAlrNSIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HsmZvTKz; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0d67f1877so38994575ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769534883; x=1770139683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+kHFJZL4+wf6/6BWGMuGuGBaZXyBWszDT6X3i/a0Szo=;
        b=HsmZvTKzvOBiiFHXWA0anx0tv8QEvsjL9f2EO6p35uf5BFp9NGWntAAUIpY8aCQ5/O
         b8MrUxHJVyEP2llCehk/V4L4FIPgNdQufTOt1gDYwH9Nt05IhI6s0dhg4E7soV6DXSwE
         jkhzCMGqfHvSdFQgbodZcBOD1Na94q5WgSjCYqqx25YtntN9e09b/xQRqYfrBBg3gPBa
         Tgf8oCoZAv9Xv9PbVR7boD5As+fcvSsTgUH9EPKaMyc/tReaeXlBHZTXWNb0kO93wD6m
         J30tYfEi8efGSpWmqMYI3bTLg7JCB5Ys306Q+0kG9J+KtdARZC27fGF2F+N7ZXj5Nak9
         U7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769534883; x=1770139683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kHFJZL4+wf6/6BWGMuGuGBaZXyBWszDT6X3i/a0Szo=;
        b=COh0Izzwy2z8dvRr6ZzT9NzVp/85dMojuBeskm4HyGx2rRFdKlOCzeKzNEKYMWPjip
         eF6hSWcumHnadS7xWecyMdZTNICfwPY8wk/5zqveHfTTV4GIzkGF/ZqdI0hpD/vFWC+W
         OOKX1VrRXApVOSwpOWF2iWZPhsOHAJzrp0bRkpfdSGUzI2qc91KtgfsfoO5DbPpk8Nzj
         +i6Q9ZxvmflGcXkH+u/crXfuk4q0KGghNkMy8CkREPhX/qN555lppyyZPu5NDn3ipaEW
         nbjbfODsDiTngzVYGWZkamm9F/gZ61su54ft+8HS3hIXRc6kiynPY7lrhTo5cZLi1mCK
         b0XA==
X-Forwarded-Encrypted: i=1; AJvYcCUfDAxhtVSGEsawcqzLa7O4Rqys5SOycdacAGMuLjkEboQEW47lkka7zmRg0N9nHOW3AebWRPo+CKway/s1@vger.kernel.org
X-Gm-Message-State: AOJu0YyafLAuQVIqxy4R/YNrMOOwt6bZr7LQzrkps0j9H70215N9dxAK
	gAgbwkWButLv4+PiFlqHPNMYkg7tz1XvFhCvcZWB6g35DhLCt0F0+wxb
X-Gm-Gg: AZuq6aLTr5arCB1WkOvK5hnj/QJF+LJ3dPFVbw94VYSpCSBrzbMJrxI6GhZc2fBuhAG
	qtJR0YPT/fbkzPfV8Tw09obS6ka1PNmGBMqwGLn9rVTWKHNgaIf9i2cQzilSvGsPOqlQ0MwqpyK
	SsV2VIBXdnpgmfEyzlShswncYLEsOOu3t9T+dyls20tAkP5B3v9L4UwwJ75WC6jkzFF3JV5/MgK
	cQJJYaddxRcaje6Ph60lUxgIBBPI6hNh9YoNIFrTbhlSttRLQZ2kx3iGpfBdonR+RPm5hf+iefv
	6aQ8sJymEMB+Afa4b80ZuFUQxjbNLX2DBQ86Y5ERcGJwiTHZ4i0kCX5xN135QvZjk5Hwo6uuBFb
	X6xkTVM0lyFxx8A/qlEVg+wNWM8j5r2BvUx21Jj54qKQYUSYF49+NFWDlgvAXs2zP3l7Mputg2u
	1uohe/kz3jIm1AoK/Bfvzm+3ylK5ZV+VZFYyY=
X-Received: by 2002:a17:902:c945:b0:2a7:9163:8e68 with SMTP id d9443c01a7336-2a870da119dmr24070975ad.6.1769534882730;
        Tue, 27 Jan 2026 09:28:02 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:d29a:ea37:2567:751])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fad770sm125058905ad.67.2026.01.27.09.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 09:28:02 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com
Cc: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: qcom-rpmh: Add support for regulator-off-on-delay-us
Date: Tue, 27 Jan 2026 22:57:56 +0530
Message-ID: <20260127172757.75221-1-bjsaikiran@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-90855-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EDF0598747
X-Rspamd-Action: no action

This patch adds support for the generic `regulator-off-on-delay-us` property
to the Qualcomm RPMh regulator driver.

The core regulator framework supports enforcing a physical off-time via
standard properties, but the `qcom-rpmh-regulator` driver currently ignores
them. This prevents boards with slow-discharging rails from enforcing safe
power-cycling constraints.

Motivation / Test Result:
On the Lenovo Yoga Slim 7x (Snapdragon X Elite), the camera regulators
rely on passive discharge and require a significant off-time to drop below
brownout thresholds.

I have tested this patch on the Yoga Slim 7x. When the delay property is
present in the device tree, the regulator core correctly blocks re-enable
calls until the delay passes. This successfully fixes the camera brownout
issues and allows reliable sensor initialization during rapid power cycling.

I am submitting this driver support first to ensure the mechanism is available.
Once the consumer nodes (camera) for this board are upstream, we will apply
the specific delay values in the DTS.

Saikiran (1):
  regulator: qcom-rpmh: Add support for regulator-off-on-delay-us

