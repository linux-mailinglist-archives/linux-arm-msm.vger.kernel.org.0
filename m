Return-Path: <linux-arm-msm+bounces-92383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAWqAriVimmuMAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:19:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 655E31163DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:19:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2197A300A765
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 02:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9912D1907;
	Tue, 10 Feb 2026 02:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+81o0v9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741B0264A65
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 02:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770689973; cv=none; b=mD+PaEY+P75jAiIgfhZ268rmodqLPCYX1W1CVmvnLA1Hx7VVK4xh5pI+FNrFZDzDYR2ul3Q8D4KyhT+XrCrfuVUZvRXNuGhVrTm/JYcmi9MtodEQA2TB804A+QTwbmyGOaEbecT8SZcKgbIhlL3YXnYtsie3Y5y6aKy5BSOzX/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770689973; c=relaxed/simple;
	bh=T8TVumN5p9S56hgkEPK41dUkfPRroL+hgxyLPii5BwA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HxaeE5r9AEiAqCV8mVDr+u8/vlteL8NTtNe5fjyX7Rg3OHBSdmjfqdYI1ssgVTn4z+DZijM9s+3mDMywczMzv+jtlmjhNKReWDoIMLhdyPPG1+G/2Kr4+8zwp8x8y5kLodqY1LJw6eiNQuzZnYAB+ztk62libdWZNYRet1zCorU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+81o0v9; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50143fe869fso52685761cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 18:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770689971; x=1771294771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S/hXVVFZ9xkdTyzbj181YKI3deT99BWwoqpKjOX9aJk=;
        b=h+81o0v96q2qVUbSElwrvB0Nja3SM/IucTADu2m2N8fnuaPTelTXxpLscJ1UYAif27
         6udQi4jV6q5CAgv9Atkxqz6xq8klXprD24lZ8vhuBf8HFMdpVCgvohM2V+Kv1dz/kuK8
         +uuIa73Awa1OcyFzsImmJDCc+tmRNnZPHDzNqMP7BAjWLb4+MsMIJkqwex0bkPvkAvmd
         yjd5datrx/iob0sKXjOSwUnNQcyof6RE2Lz4hHSqMx0+Y3zgvxcTBzBv6uuZgLK0pbZj
         yJ3LrMMRJzOw0fca09cLIY04OqN/Uy2gGxM1HkeM0QN06xwr7LRUQTk+Y6eJjyGvUAEX
         ZVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770689971; x=1771294771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/hXVVFZ9xkdTyzbj181YKI3deT99BWwoqpKjOX9aJk=;
        b=RjZA+J/MWN5ZzZgvyO3vVg7q9LQ1HKAn3Kw82K59SZjR+OLgM58FpIcdFVhNai+VIq
         0xA4JcJxFpmwlexskNbSaoI4zPfkOHmg48GO1krGDoEBrnUFy8d+Rk3FcRrZNzPelvXd
         Wbsk4lxjzSgf5uidGVol3nqDenCcsSkkehKV2ZarTpcyWf729hcY6w1HI6hgbeHdDBGu
         4XK2KaWZWmyVJsB6YZ6+8kMGBeey71Myx0Lbz4mAsncwNOx6G7mgzieVacGMYUeYIcbj
         sa0pMZhKC+3tIKJDTyk3ZUBOxBK8QQDpEoNUmqXshUbG981jx7/LhzwQmHfHWvq3L05W
         vS2A==
X-Forwarded-Encrypted: i=1; AJvYcCVwf5FM6JbEanBvdN09/G9VmFn19Nu3A7RvXX5tt9XVH5gJHMnK8qSKOR1+ISXfOSMmUjMTFW07RJeP7e+f@vger.kernel.org
X-Gm-Message-State: AOJu0YyxO6eE882jAuFnAoVCnhUGWEGoB9LaINagwEeYB7o5TKwYVF/T
	hPSdaZq1fpeEp0Pt9NjdHpn8t/Hs/qGwU493YRmyfcHhZ1gGOtoC8zJo
X-Gm-Gg: AZuq6aI1Du9VvwybUgVPklP7had5a9wpQaWZzPqUQEG179TBH8IwH8F286Fkv01/Iif
	ya91qsdFUTFVvPN7cxz8oLrbQAMDOtTtYbxPOXeKS3zPmmJ7p4r3glD7l7lKWbGZag4EHKlWOAs
	qQSz/hWvVMDOc4rkjm5Eqr7vn2eyvTYf6fX6n0dS1A0GrYSLryokWDH3i2//Xyc+gZBggJi0aUY
	xQODj8NhUuyNL8frgrjsaKpgz1q1WAmySnXXf9cUHarpaBZHdPMhF7JoSGnd5pbibI43l0iOE/N
	JRKoDAnQ01btureI4BspJkSGdBM184lrpX6p7y35JqpVFWCZyePYS63VHx+Z4ZKscr2Trg79Rv0
	A7xVuwINiqvFW1eUKGKhD6pwq+sG0SoTeMD/IjDroQdJXfMR8xnrxmtlOawUzXndkWAVEf4lwzj
	tNo4mueT8SuiNIT9xSKj0FkYBVag==
X-Received: by 2002:a05:622a:48a:b0:506:1c5e:d1c2 with SMTP id d75a77b69052e-506398adeaamr188453821cf.27.1770689971445;
        Mon, 09 Feb 2026 18:19:31 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5063929099asm89000011cf.22.2026.02.09.18.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:19:30 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 0/3] SDM670 cache controller support
Date: Mon,  9 Feb 2026 21:19:54 -0500
Message-ID: <20260210021957.13357-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92383-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 655E31163DE
X-Rspamd-Action: no action

This adds support for the Low-Level Cache Controller (LLCC) on SDM670.

Richard Acayan (3):
  dt-bindings: cache: qcom,llcc: Add SDM670 compatible
  soc: qcom: llcc: Add configuration data for SDM670
  arm64: dts: qcom: sdm670: add llcc

 .../devicetree/bindings/cache/qcom,llcc.yaml  |   2 +
 arch/arm64/boot/dts/qcom/sdm670.dtsi          |  11 ++
 drivers/soc/qcom/llcc-qcom.c                  | 105 ++++++++++++++++++
 3 files changed, 118 insertions(+)

-- 
2.53.0


