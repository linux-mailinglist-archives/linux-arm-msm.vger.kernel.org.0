Return-Path: <linux-arm-msm+bounces-107976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uO5eLC6vB2qrCQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 01:41:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 212E5559635
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 01:41:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 269C0300B3D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 23:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38D93F86FC;
	Fri, 15 May 2026 23:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cteAsQrt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CA938D3EE
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 23:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778888491; cv=none; b=PSp13+tqUqXJNVzpIFgE5kamibyfdr+krhsOwrTg9rpyi4p0SBdcpLcNKd+Cj1jlfKoeGsxzc9kM8TIr2nKg8urztcWOliZhDx/7ujS3sQ5AJkLx9Fyc8Jpl4VvMfJhx8FdXiFsmZYHyKh2/KOFdnlCLVNHV5Lk+s6y9UmKUDU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778888491; c=relaxed/simple;
	bh=YDBE2ArsELeNB+Y4PMsO25/KObn90CcdR++ZSkVKlAo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qYHq6LlwXfdDo/X9N6HwU5sZXBREOErA6+c47/jZlufDenAEWpMgFpT8qcL1pxQAXDJYGaHtirra6JK0KXTMxroSTdI7aRH1B34QT9c0tu34W1kKcCObP8DISRxIlcaUXef0DBw8cchejVVTqW3wpzest2n8XcIfbz+XLjUQv3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cteAsQrt; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39397d637e6so578981fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 16:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778888488; x=1779493288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BHWPbTLVhyzrvf6dcInOldanu4NBC4mlHmqadjXQ//0=;
        b=cteAsQrtY8VU+8zDWkpf8fW31Nq9i9hxWMEczp8RwQ6M0j2bedW+KCdacJUmJm1ahw
         oDIW+bizvLYnlO2RTJZsdg/YHzZVUX4hY9Urmsb0VSK9KHNIGJUozVWXh/uCzOd2nr5L
         x9fDh8QN2aWxLkhfKLuBZ6b8IqEmHcdf8WGS6ZMwK+kpnT9hMpapaHJnVq0V2nHyzwOp
         sFKwYE2CTRj40mcsJu3aHNibxzo+/PH+CN23StiWdGMy4LVQPGGZiZ17UClSqxOwmug6
         hSq25E5M1k3XaSxCbIqfEskz+NthC2+DzIuvX0J38KHRm8sOoy8AzE7PIIGMWIOE2/pq
         dW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778888488; x=1779493288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHWPbTLVhyzrvf6dcInOldanu4NBC4mlHmqadjXQ//0=;
        b=qjOErO0HBTNBUve+af66/C/Cu4KU0TSRW3MZpxdVaf1QrhdyKruO4E05rIYZX3QSyG
         /hqecfNar0EXMAJjPZuyuGhpWnq6bqYLhwLSYIO6N1jgJMpOCVL8DfXYhZDw77Mi3fMi
         gLxP6tcwisRBOx08xzVg1G1xqpqH7vouAfEdkkmXHG13FUUxDGecLcrplT/hUxorTqsK
         Z3d/Zbpn+iYCGJ6dgWTlZm/DvbN4YfEuG8qrI23EZoxEwWzZxk38YJ8mADxOn+MzyijU
         t/FkIvmyGnuBQ57f2nx8BzPKS76/muHuelEHxFAqL8HOsNGfEyDBYEQnctDO6koREZM/
         /v9A==
X-Forwarded-Encrypted: i=1; AFNElJ/kK/MTFipNfjF6dKAG+svJrj6/+XtSlTiL+GdBE3acTA/hRUG1+TVZnN4bcItFOF2PZITAYROzPRKawT7u@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/6gdnDUT4Gc6hbmMiC7LvnjMmJNdT841Xm6hXZl9Om5yREMuI
	Z89oboxd2ZsnEWqLJf+HZa/+xqtmZjf0VkuwZS7YUbmd/RZ4ArhzhEc98iqtkvdd67E=
X-Gm-Gg: Acq92OEmPfqmALuj4vs2/isTw9TnxtYCNGWy8VR71wyMA83Gt8Yk7o6VCqL0FIjnp7K
	9AVk3SkI/ryXwa8ZCf9Lqc833siS/7cjReYHGFZSyHja7Ig0nwniACy0r+odwdMW2EWcBDYULDB
	1NWEsl8SR2sKOE7co7+fB0tJJATP6mObvP7NT2BBJy4OBzRsZAhoxqEDcrF+UHtAnSV+KVmRzct
	UX/HD5ubcXQXzIOhXlECrk5jmZHD+/QceJ3cSdkcMV538FEbqjUytbpOfBzJkO2oEEZERNYt0mw
	RHWpuzD8b3tmFWF9aFNCANhAIan07g8LHr2fgbj73xjqc9k7IZRyWDsZ33sexzLxBPeOfKlUsh4
	eLfFhzCh6O2N8D2Gg/OAYtu1e93An/FEQdVIgsvMyDgZUT+I4ocEv4ld0Omo7wd9OwoJqTdfu0t
	L9/uJ2hKbcLopQRYb6m0J8WeGkIbNyqVRD921z088lVVjvbMBLIQOBb0Veg6RpLtD16NbtWEdc0
	n/n
X-Received: by 2002:a05:6512:1254:b0:5a1:4712:376a with SMTP id 2adb3069b0e04-5aa0e7655a2mr786891e87.8.1778888488335;
        Fri, 15 May 2026 16:41:28 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c710sm1631384e87.7.2026.05.15.16.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 16:41:28 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/4] i2c: qcom-cci: Fix NULL pointer dereference in cci_remove()
Date: Sat, 16 May 2026 02:41:17 +0300
Message-ID: <20260515234121.1607425-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 212E5559635
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107976-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

On all modern platforms Qualcomm CCI controller provides two I2C masters,
and on particular boards only one I2C master may be initialized, and in
such cases the device unbinding or driver removal causes a NULL pointer
dereference, because cci_halt() is called for all I2C masters regardless
of its initialized state, the bug is present in the driver since its
inclusion to the Linux kernel.

Along with this fix a number of driver code simplifications are added into
the series.

Changes from v1 to v2:
* remove junk accidentally added to one of the commit messages.

Link to v1:
* https://lore.kernel.org/linux-i2c/20260515152003.1604187-1-vladimir.zapolskiy@linaro.org

Vladimir Zapolskiy (4):
  i2c: qcom-cci: Fix NULL pointer dereference in cci_remove()
  i2c: qcom-cci: Do not check return value of cci_init()
  i2c: qcom-cci: Move cci_init() under cci_reset() function
  i2c: qcom-cci: Remove overcautious disable_irq() calls

 drivers/i2c/busses/i2c-qcom-cci.c | 50 +++++++++++++------------------
 1 file changed, 21 insertions(+), 29 deletions(-)

-- 
2.49.0


