Return-Path: <linux-arm-msm+bounces-90854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNwoEw31eGnYuAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 18:25:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D638E9866E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 18:25:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B68B83006822
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7072E2F4A10;
	Tue, 27 Jan 2026 17:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HENZMb70"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024872E62B5
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 17:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769534730; cv=none; b=AoAcGJjun0E2H65PcbN5DgDGWRJqwDJ7U1dVykz0IeWMNoAS9tQkrKDfEx4kMJ65rzE/7GLWCvxGPI/XtXysPNPDnKxlUU96QRZHXXQnXZRrkcgaD9kv7WTPSDdcgvDU20xDvzdm+Eja4j7eH/WbdGSeqGFacPFXKUoqN0GMS1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769534730; c=relaxed/simple;
	bh=ZgbjsRQaZkMn/eY4Pk5OG989f5WZ+l4huWLDB761P7U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ssv3Ahx17Y3PPxBvPHuXms+vHETYEykYUAQJ0JyrYfVbOSNJ7WD74gWQoaGsTPYbqMikop2ywHiVip3jxU7vGTTqU5Yp8aud87Q39/k2u/doz4anTy9LVDV1osxkN2i6qLWtT9DZLczIaErz0he9xmdRmI2qsov4/6lp4h41nfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HENZMb70; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a79ded11a2so37171765ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769534728; x=1770139528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+kHFJZL4+wf6/6BWGMuGuGBaZXyBWszDT6X3i/a0Szo=;
        b=HENZMb70KOTKFl61tJvFU5UVmSEM8K30PXhRwkuMwTcKzg3l0PUSRFMUmkzonh7ikM
         Ftk8ptDyDNbKjJmJr9e4wmTXO8mSWr7bstkMF6oG/n1qcBOtxmz7NSHfNcLBvnxPPw9G
         mMMdyo1JwJ/iQOH6nv6rYn1e3gQmKN73v/wF0OKVR662DzjC8Bh+aD5De2k57T2KUfE9
         83O2DyylDiiTLj4SLcSyNhcRAFBm1X0Zc+S1paGlXDq20xLzAhRvi51bD8gPoF1f90BK
         lXptvxcjUHvL7DsANPy+w0ucJEtlDdLvfFNpoTT5uo9ysLqZHKVaTqOqgXf0lqX+ypUJ
         06EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769534728; x=1770139528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kHFJZL4+wf6/6BWGMuGuGBaZXyBWszDT6X3i/a0Szo=;
        b=NnxsMYceQkOrY0l8GcHrEEcVlGV3yqsqftRsr1kfgHgeBGDpKRxWwV5qN51LdhKjU2
         Oo+u+NHwTd7G1vGIu49UFGvKBqkuTDPKGPP2KvJ92u8xVmFVRLA2ZWMLXEa+NPPlGMHG
         YFzXUZUqOhbLB4gM8BnB0Q6M60Plk28vyIsxz7P0GweiUNPd3jTltQoydA/L9yj3Y9cm
         SXwnemxOvAENJvpkYRR2adE/k2kbLy/WOWQLle+hUvhSL87LKU1PWE4VkExXviHHEKwd
         d6HjsOL99zvF/h9ux7vBVzWz/9V/bISC9wtLL2BxCvAIy8XPXXo3WY8pon2t/RWcUnan
         ypyw==
X-Forwarded-Encrypted: i=1; AJvYcCWxio5EWcw+8pkLZIfQuA2k7G8WTwgydhZ/RcJEz266G+bKXtYQjOOElboZBWon9XNVJ7Om9JyF3IDHDdbv@vger.kernel.org
X-Gm-Message-State: AOJu0YwaX2OEpTtUALV2gzunUD7+jqsGO/mGwB4b1yiF4T+i5JavzpQd
	QRQX5RZXPmFZvVnS8ExTlcyd1yMFDFML3hHhiDIF52x3yos6Tr4tzzv5
X-Gm-Gg: AZuq6aIbwpvRKm25GGRjt35PXQlk039eHzCxuQBsbC5jX8wTZtcBJKNLIDCQszcc2f2
	HPjHiAYwqqkgUFyxsVRFM+ypHgSU78AukX9eAIg7jHPxxGJdBJQ74jx0iqfSaDxDGOjOqBRTra6
	HHBtTXSa7M89MeD19own+ufVW5Ojkbj0CXN/0L+nRHGPzzby3O+UkRx449ebNCxlRuFD/bEYlKv
	Ovr63A4lMxLvLVOzgnSWSrq3Xg/HUn1T47W5YsPLMib1e5yeN/Z05fljMnaMWq0geJtl3t/eBNu
	MXUGs19nVgf4YsrelYRQsYq8pn88oqrkFHC9/ohnHFX1lmLaduqB7Jkgiz6HqmANIz0F/oS9Ffb
	I62cAeMuSZEQ+WV0UwA4IIMCiXfsWOOOX0lyCD0iWoY0ZqdajL/iaEGmU0PBlC/oaAsmR/aguTU
	n8Q9JkJrO81QcwkQ639rqi3LOwPw5YewCDcbvvC7vw8L5nbg==
X-Received: by 2002:a17:902:c94d:b0:2a7:5640:791c with SMTP id d9443c01a7336-2a870dd2d53mr26241005ad.44.1769534728280;
        Tue, 27 Jan 2026 09:25:28 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:d29a:ea37:2567:751])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fb0262sm123363555ad.70.2026.01.27.09.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 09:25:28 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: broonie@kernel.org
Cc: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	lgirdwood@gmail.com,
	linux-regulator@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: qcom-rpmh: Add support for regulator-off-on-delay-us
Date: Tue, 27 Jan 2026 22:55:21 +0530
Message-ID: <20260127172522.73135-1-bjsaikiran@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-90854-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D638E9866E
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

