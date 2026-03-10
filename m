Return-Path: <linux-arm-msm+bounces-96412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGpnOsFjr2mHWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:20:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44731242F76
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F31E30A690F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 00:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67C71C84A6;
	Tue, 10 Mar 2026 00:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXnJ6NyY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2C21DE2D8
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773102009; cv=none; b=ilHpY0VNyL/8gzZ/5mhtSFBmhoiU9LXPn1M8cXMQVD1MZi427qRxC98rWMl7x8T5aOFUvc2zqLZn8D6wnVMGL08cgYqpU+32cuO4/DWyCNw4wUQwFNwiMcjLZVwzAnHCThaRPxawXf4pQTm/+Jd6SINFkGtWujOADJB2/C6X6BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773102009; c=relaxed/simple;
	bh=pQS3+oY8uNxbqu4m+QxhwxvnOL2GT6e9/8qi7PByaVk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AnDUl3viPREWHqoGNP9psylzsaoTyyzchS3YqHKDARNx5rDGVUMokWfFQIYyNmA2+rAHDIxzYJqoxmVnO6usc+uM10nE1E9zNwr4/USs8VHPD/XlEizSy8JPVoIzrwEBOk7SOh1OUZlj7kfIRhrxTbaELv+CvTTJbwksnLXmXh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nXnJ6NyY; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-899e85736e2so92400426d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 17:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773102006; x=1773706806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R7YDg569U8MvXHa3jpNDu2jY2nnLQu1AklXEVajo+6o=;
        b=nXnJ6NyYMAQfj0ew3WW7lOn9GjYTK4YmJWCZMWBQHwhkdqIKiuWv8Bg6GMyTBDj+Kl
         bCJsRmD/d1YWRpyetD+qm31bx0RQvf4siJGpJl9HxjyAH6yDVe0san3m+wmCSY4Ydydk
         ixBV58WswuYjfzi+PLsl1yIrgksYswzi8r27me+QrSPIpx0S4Qh/hSPng0WLSrmIicxq
         QtQ+PWIoOPgshv0bP85NJFxhjt4sAvt50mVNqJJ5H52sXPTCL38m/Fz4PMuRBAiZwy8m
         l4QXVPgafnmiL4zH8GOujmD4BD2pK2UYsDoJv9bqKuprSeiesKZpAyWfSR1M9LWGl2ra
         BARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773102006; x=1773706806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7YDg569U8MvXHa3jpNDu2jY2nnLQu1AklXEVajo+6o=;
        b=VSfamqi5VFSes1pXNiw4zq/y9edN6jzDx6Z46vpwKGydlkSr7HVrFAJyJv25EH82rV
         NYaFwK5TvmrPG0MFxYyMmnb0C5Og7Q8QOkpmYTIhvgBcwvWgBQ9tt3T7MgAMQyJFWNuJ
         zP0FwXhripI+gVOvLJv1a096tOunFYBBTGOCWSFqpFBpGGgJWnyMmVYnG3XaLKb1QnCF
         qI20S04G3lrOfDN2zZzrZ1Lwb2k8cawSgO83W2Z2Xa7bIghxvGkRKlc7a5tpol3y9TTP
         RJCWAIbkV7w0eksOExC6vKK5q+ZW0K0emeXNK96rH3wDtysUuiRrg3PrC+qUkE2jwyS4
         6WAg==
X-Forwarded-Encrypted: i=1; AJvYcCW9DU1hK8nu5Fn5kCs0/AQoHuHovPEls19eTMu2oPuDiuHI3veRiMlruclLZ6zGRfSkoe/N6G77NtVPzPPS@vger.kernel.org
X-Gm-Message-State: AOJu0YxawSlrhVar37tLTBJGcm6t6b4vQ+eXvbjpEj1if4LvWxhOe9Wq
	ZzUD9AjF/nxJpMhwEN5g+EU4Q3386/5cYtC0FWBeZs91hh45qcC7bnnq
X-Gm-Gg: ATEYQzwAZoM9jY3UiFZ0G75XcR2IGYbLrZCuqYrWNHOmD2Lqi5ChrctvAaeW9w2UGXO
	EAoI7zm5dccvxGKLGdF3MBj1BpVD0MRVquYKUeUYBxqxgnEQbRAbRDaaBKA72Zi9qBAf4txWFmW
	P98i45dI/hTjsBze8gIBbqJCZ4NM8BOuZknQ8gFX2C8FOD/N923jHexg0oPggxMLCpd1RLOkRRk
	qs4SgCx8VHaeh+O4m/wyH4bCG97iIIf6rJYCdkfMOhNjhNa+snLRPbFRsD9jG8a7lbtTIEl9wBm
	Wch1EpXGWPmKCvzYlwjy3YVyU1SXWDMPkvN2P9PhO+Z545cI7M2sVlJA2E+wWc9MNkeBB9ZWsj0
	eaYgrwpQ9ioo4a0cHPvtzj7owUeF2jcHe3XyuD2TQUFCkiyGntpuL5uHc6z/F08Il6VjOzzWZSY
	moyRA8N0O2pfMOpGQJF1lm66oSbg==
X-Received: by 2002:a05:6214:40c:b0:899:ef7a:2425 with SMTP id 6a1803df08f44-89a57c8e7f3mr22310986d6.22.1773102006171;
        Mon, 09 Mar 2026 17:20:06 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a57a3a9a2sm8380336d6.15.2026.03.09.17.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:20:05 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 0/3] SDM670 Basic SoC thermal zones
Date: Mon,  9 Mar 2026 20:20:34 -0400
Message-ID: <20260310002037.1863-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 44731242F76
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96412-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,arm.com,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

This adds support for the thermal sensor, for thermal-based CPU
throttling via LMh, and for thermal zones.

Changes since v2 (https://lore.kernel.org/r/20260304014530.27775-1-mailingradian@gmail.com):
- remove cooling from memory thermal zone (3/3)

Changes since v1 (https://lore.kernel.org/r/20260210021607.12576-1-mailingradian@gmail.com):
- add review tag from Krzysztof (1/3)
- replace CPU thermal zones with lmh (2/3, 3/3)

Richard Acayan (3):
  dt-bindings: thermal: tsens: add SDM670 compatible
  dt-bindings: thermal: lmh: Add SDM670 compatible
  arm64: dts: qcom: sdm670: add thermal zones and thermal devices

 .../devicetree/bindings/thermal/qcom-lmh.yaml |   3 +
 .../bindings/thermal/qcom-tsens.yaml          |   1 +
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 400 ++++++++++++++++++
 3 files changed, 404 insertions(+)

-- 
2.53.0


