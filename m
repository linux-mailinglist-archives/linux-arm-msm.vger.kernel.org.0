Return-Path: <linux-arm-msm+bounces-89869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKoLApHMb2mgMQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 19:42:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7DC49ACD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 19:42:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E99EC7E0E7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 18:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E189844B66D;
	Tue, 20 Jan 2026 18:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZqeP6jGT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DA144B693
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 18:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768932066; cv=none; b=jHuAcoPB5IKWr9+QvwJ5ufLs1Y0oM/azYnMsrT6wo4sbiDaEhcmcMpAlsIMeXQWDlRLg0sODlEXMll6RZptGsZ56yK1MByr/MdDx+HzQusrw8ow4zaKOin9pHD7IeQuM8Dz5CY4FmcBpQ8u/pe4YYiTNKF/ihlhUHuYUR/DFi5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768932066; c=relaxed/simple;
	bh=4lkWsXnQ3JT5veJzgXmg01v1WLb3YMQxuPAWVxo6aJs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nDB/PaMZpZE+rnSNd+0/qMhpqHAo4Ub6qz+GZUY7d36EhNDbeMPYrvmWfLBI78MWKLNLul1orog1HaXzObrn9t6EkB58ex+o6UtxKZYbK+jVH8R5kuATneLl6xr0NJrU4JaCPoOWmzcgFG6aLCxx0SoLYc+VJwUOR6gGn+Kg6bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZqeP6jGT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47edffe5540so49201825e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768932062; x=1769536862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iDEGbBRkjqNSQhFFe5UtGv8suPhlxfVFRf5mgDfH2kA=;
        b=ZqeP6jGT5IfYEHJQjV6/6xpOpwMFrtbIIeilaYP5UnildqStbSVJhIVmQjZfU+nCL2
         rPFGv4Lt1l1NjTO+tgkFjIRMApD8SlJ2IJARKIlxoYUZt39Ha0eiLrBrbjmWWMSeeNE7
         0Qa5SRvzcBrTir9Fl+BiNuN8REW+GCL1urWEZ7eZOH6akpRYQpoiAj2f085rMFJyZkuP
         kz1nhCy8uAKG/0cHKcPJYy2UnAVHTNknKvkHyFsHg2Y2zctFldU+8s790JxsFrzqcHfp
         KPRNQr9P4UU7mAJpCdcOua9PjgD51z4gopA5pJVRo6/Mx0kLbL2nVzAeP9uD+sbxQru9
         xl8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768932062; x=1769536862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iDEGbBRkjqNSQhFFe5UtGv8suPhlxfVFRf5mgDfH2kA=;
        b=DwWCrQjtDc/NdNxUy8VqcK9EJHmRYTBLkIRSVAjxw9LCGkSykdPhexD3nLYUDtSc+b
         52nBEz4wUPiTlu7KrXGIrOhLTbMdpTVT/ZZpktnJlSnqiQ83C1PpsrtZFlD0geMOB9og
         1vcdWo6gFhUIVfYN1j9XxHa9jA0spLqFtef6ldUUXB5Copp6+7POxfrT5HhTc9wNdYXj
         6rooGuIfn0Qe2jt2cfplFlUst2rfioDVtsLf/cjYt6EitCubIiwCD6L8G/AtaJDeWrNw
         ig58uGAsGsLZInbyqAixm4Ssu4SIKCJA1fMOEF/cPA59/s41RiCJbifCA60fQllt9k/f
         99QQ==
X-Gm-Message-State: AOJu0YzNFHtJb15mBa/NvogcGtUq4GCdX1VnCLTX86V/8tQ1z1LQOVeG
	vg/ujkq0BhViN9Y9OMS8Aq9lDz2jALfkwAXoNMiQ9r37E294agIaeQXxgvmHocF0
X-Gm-Gg: AY/fxX6NO7/WvDeCrbLZ1B2S1IApCojzhgntOmv2pHYXHiQzUZZYNItUbWXAgVnpojl
	Nh6Bg4us2mZW+7guwGTcL1kEJ+jJ3galzgp0L/QAP+veQYZXiL1qXCzQEtCGmfYEgVtfFI53sRh
	stQgy3a4eW/KUkoGL6bRqLz2XqejwLf0puz1gijk1c+40doERYfATR9GAQcqd25ebkEGasb6HFV
	M7NRI8KQ8APcnOioWdOJ3wU3eIuEjjU973SOj6iMFe5/00PHYBJSRkXSsFiWoNGYxDzuASt3oxi
	Vhyq9ldzQn4CXgGUW8TiVnuPI1xebkOCY3bjWtnvH9i3HVayH2ayzYlRanWN918VxvrcolxHfZi
	ouio2iTtRCmL183L+GEHDorFu6x6YamWXihsdMuK79kNKEpFh1BnV/lNUMJ3iSTMfQJiefzd1/9
	pXp31YHDA7n/L8aexQjSsm
X-Received: by 2002:a05:600c:4ed1:b0:477:7a53:f493 with SMTP id 5b1f17b1804b1-4803e7e85abmr34660435e9.23.1768932061761;
        Tue, 20 Jan 2026 10:01:01 -0800 (PST)
Received: from unknown.zextras.com ([78.208.157.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47f429071a2sm312013015e9.11.2026.01.20.10.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 10:01:01 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robh@kernel.org,
	david@ixit.cz,
	Gianluca Boiano <morf3089@gmail.com>
Subject: [PATCH 0/7] arm64: dts: qcom: add support for Xiaomi SDM636/SDM660 devices
Date: Tue, 20 Jan 2026 19:00:45 +0100
Message-ID: <20260120180052.1031231-1-morf3089@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89869-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,ixit.cz,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[morf3089@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: DF7DC49ACD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds device tree support for several Xiaomi smartphones based on
Qualcomm SDM636 and SDM660 SoCs:

- Xiaomi Redmi Note 6 Pro (tulip) - SDM636
- Xiaomi Redmi Note 5 Pro (whyred) - SDM636
- Xiaomi Mi A2 (jasmine) - SDM660
- Xiaomi Mi 8 Lite (platina) - SDM660

It also refactors the existing Xiaomi Redmi Note 7 (lavender) device tree to
use a new common include file, reducing code duplication across the family.

All devices support:
- Booting to a framebuffer console
- USB in peripheral mode
- Battery monitoring and charging
- WiFi and Bluetooth (wcn3990)

Some devices additionally support:
- Hall effect sensor (tulip, whyred, platina)
- Touchscreen (whyred, jasmine, platina)
- Status LED (tulip, whyred)
- SD card (tulip, whyred, lavender)

Tested on tulip.

Gianluca Boiano (7):
  dt-bindings: arm: qcom: add Xiaomi SDM636/SDM660 devices
  arm64: dts: qcom: sdm660: add common Xiaomi SDM636/SDM660 include file
  arm64: dts: qcom: sdm660-xiaomi-lavender: fix regulator and SD
    settings
  arm64: dts: qcom: add device tree for Xiaomi Redmi Note 6 Pro (tulip)
  arm64: dts: qcom: add device tree for Xiaomi Redmi Note 5 Pro (whyred)
  arm64: dts: qcom: add device tree for Xiaomi Mi A2 (jasmine)
  arm64: dts: qcom: add device tree for Xiaomi Mi 8 Lite (platina)

 .../devicetree/bindings/arm/qcom.yaml         |   4 +
 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../boot/dts/qcom/sdm636-xiaomi-tulip.dts     | 333 ++++++++++++++++
 .../boot/dts/qcom/sdm636-xiaomi-whyred.dts    | 374 ++++++++++++++++++
 .../boot/dts/qcom/sdm660-xiaomi-common.dtsi   | 214 ++++++++++
 .../boot/dts/qcom/sdm660-xiaomi-jasmine.dts   | 333 ++++++++++++++++
 .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  | 144 +------
 .../boot/dts/qcom/sdm660-xiaomi-platina.dts   | 364 +++++++++++++++++
 8 files changed, 1634 insertions(+), 136 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm636-xiaomi-tulip.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm636-xiaomi-whyred.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm660-xiaomi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm660-xiaomi-jasmine.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm660-xiaomi-platina.dts


base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
-- 
2.52.0


