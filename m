Return-Path: <linux-arm-msm+bounces-90864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLPGN0YMeWnyugEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 20:04:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 882DF9994C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 20:04:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 53EF3301ACCA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 19:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BFC12620DE;
	Tue, 27 Jan 2026 19:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lfKoWLku"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D4827CB0A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 19:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769540540; cv=none; b=GoJOi/dstjUsKAPY6ZIHO0/cbPr+unGAKjTgy8J6lohEuuaTjvfyfnSyZ+8KZdvVDdeGGUT4EJ+2rtkVZm5h+hsQUxCa1kyaIgL2CoUTWQD9MH/LJBCpNjT/eQFF6VI8IBZomwfzg6MAYOZfuCEBC8G/SlBYO3LtS5ZXTGRRnDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769540540; c=relaxed/simple;
	bh=wsTUs7Ugu6sRsPCnLRugfGiJd2KbA6A3fdK52CcU1sY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D/fyUE+UsDQGT68/K1LvRyD9xvE78/1AdaQ2S/AHM/WseEzotwWAaWGVQzKgQdVI3QYgURLvwb27oShmCiDFJFU8BqWIJT8qztrTs+n6ipSwdk734d7X2AO6Jvv9iWM1jDBpdcH8iriz2vt2wKJ81TIuQOBvMSz/kcOgUH1C5b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lfKoWLku; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a0fe77d141so35048615ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769540539; x=1770145339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rKr/gj4p6dZheadeORZRicBPaAbBWotO+jXxUdB5K+g=;
        b=lfKoWLku/vUEoT73z38w/GsCgVaCGGe4qqmQO47E6w1U/U4udMd0thR3I+nvdF3fKw
         WvK3qHY22QGjFQCS6dHdgAvj/W8q4YUwncefnYAKg9P2tBMrKRFgNvEJLIzIFzB4A3MX
         lTJaMAXESyeN3SWbfAol3Q6CKEar8k0f6Vn1yqnUtjYyH7c92W0qno4DtuDIg/tmbJmi
         ZL4DIaKUEdJjw5oKGYZExdiIrlV5YvjrHnXzQ3KmmcnncApEgS78vj5nj6MP1Vyw1jfs
         WNQ4ELL6GKleIT3k1VasDTifr8X9rGlEr4uF+dahmghYO1tNkEHXURqODAyixsSOvFDP
         +gyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769540539; x=1770145339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKr/gj4p6dZheadeORZRicBPaAbBWotO+jXxUdB5K+g=;
        b=OKHlsXQXZw9B1G1Tx5Wyw8blotTDjnNaxFSPL19NYOLiRetl/piLRhi3y5ynnymyTs
         +VIbRkCnjNyPR3dsEP6n2ODFcMNeDfpLsvzC/+ft1vDdBkXdPVW/xeAehgP+7QqeTqic
         SfRY4iQdHBXT5uE6sba3AspbZ3VWScZaVvPSyreGKUW3uo/LY8itc4Xj59ZWCfJHOGH3
         6BL9QB97Pyp9ekWosGEDhdbOOqYyTFSef9u3WC58DZLns9c6C0jjBDVIsQ5MTIput904
         Wn9zvByoMGdzRJ2Ilb0DLRM4xs9wd2gLe2g+APKSbEBUagoPNKNIJ3TejNdvVYr7TKTc
         D7vw==
X-Forwarded-Encrypted: i=1; AJvYcCW/qkPhauBCVIVqhxnz7wnuwz9htIb6CvGN4LWt3mt7dsepBb1xdOVQBFHuJbVslaWB7TpILWxJs0DGI4Gs@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8SxC2Px2F8vTLWDF3ELrd/XO+Ma3f+MXFOkAGZvipRj9Ojlva
	SqSHuKDTp+hXcBr05A7roCZD/ZX3YaSqA5O34CgmR7sDjDtAlWiZdxtM
X-Gm-Gg: AZuq6aJX19pv9YjJ74GzmZjZtJf1QzmB0Tu919eBS1FFdVBCdkbh3m+rLXt0HAdrUQe
	Yl56abiT4jL9SrNZoUNrtKLW3+QLIJe/GSvNfLgaGNNwq9Trj4zyG8HhpSShpFFDzvGEehlJZB4
	PB9Or/ge0dHBOwIFY7mriRagtV3aF5PXJnugxYy60oPnY6oKAyTA+nV1lyaEYAq83nNOsu1CX6R
	H6N9+WfkHcWg9yQWEgn7y++1ZZigXHdyKtH5b4NB/9sEWFHxVXyW5+q7zAywBqj93W7S1g1mipl
	pCt1KePrX8u6YjYt2wfRQnmMsrKGYXfsvSpFYDKSOQeCwBy0VN9wbmSMifqI4De63WENWEYLNdb
	2j+9jjOEOIb+/NQjUJlIi9RF79po0J2nYl1W/5hLMWzm5F6XsycZ/uSvbQWZ6VWRl2EORBmaE8+
	JLRa2XLqa9UKtJbfLtZDoYnVLZqM3kQfqktGHC
X-Received: by 2002:a17:903:2b0c:b0:2a0:9970:13fd with SMTP id d9443c01a7336-2a870dd9313mr22301895ad.43.1769540538606;
        Tue, 27 Jan 2026 11:02:18 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:6ecf:d9ab:b640:78c0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3d4csm938105ad.56.2026.01.27.11.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:02:18 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com
Cc: andersson@kernel.org,
	konrad.dybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 0/2] regulator: qcom-rpmh: Add off-on-delay support
Date: Wed, 28 Jan 2026 00:32:09 +0530
Message-ID: <20260127190211.14312-1-bjsaikiran@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90864-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 882DF9994C
X-Rspamd-Action: no action

This series adds support for the standard `regulator-off-on-delay-us`
property to the Qualcomm RPMh regulator driver and updates the
corresponding Device Tree bindings.

Motivation:
On the Lenovo Yoga Slim 7x (Snapdragon X Elite), the camera regulators
(LDO1, LDO3, LDO7) have large bulk capacitors and rely on passive discharge.
When these regulators are disabled, the voltage decays very slowly. If
re-enabled too quickly, the sensor experiences a brownout and fails to
initialize.

Verification:
I verified that the core `drivers/regulator/of_regulator.c` does not
currently parse `regulator-off-on-delay-us` in `of_get_regulation_constraints()`.
Therefore, the driver must parse this property explicitly and populate
`rdesc->off_on_delay` so the regulator core can enforce the constraint.

Changes in v3:
- Added Patch 1/2: Update DT bindings to allow `regulator-off-on-delay-us`
  for `qcom,rpmh-regulator` (Requested by Mark Brown).
- Updated Patch 2/2: Refined commit message to explicitly mention the
  passive discharge and bulk capacitor mechanism on the Yoga Slim 7x
  (Requested by Mark Brown).

Changes in v2:
- Moved the motivation/context from the cover letter into the commit
  message of the driver patch.

Saikiran (2):
  dt-bindings: regulator: qcom,rpmh: Allow regulator-off-on-delay-us
  regulator: qcom-rpmh: Add support for regulator-off-on-delay-us

