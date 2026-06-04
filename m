Return-Path: <linux-arm-msm+bounces-111164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bTf+OkdBIWorCAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 11:11:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7982963E61E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 11:11:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PfetxW1V;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111164-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111164-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8651A308D500
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 09:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F093F20E5;
	Thu,  4 Jun 2026 09:01:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089403A8F7
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 09:01:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780563710; cv=none; b=Ale0SRnpXFzqxIr954CsBGV9OsIWcW9DdAktS4ouyfmWSKhkK2Jbw51CUMw+FGt4R4jtVtS7y+9Hk6Q+LC3OaZcv5byI8q2EKJoPHltlIcUKCg6hxpbIeO3kU6PIA2WgDpqb1Hz6ode61u9vSQNomd/IIwqZR44apNWr0b1JqtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780563710; c=relaxed/simple;
	bh=A+ONAJcpATPpdKzRx9vVYq0qKONGPEkY1AwbFWAF32g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NThsr6BXgvMXlrTD7Qm8n06H8E+UqNHxqaLEWuWqaa2I5dYELajosm4Ps1SzRLlMBC4iFb/ewX578STEY9kOVHySatdS17Xi/UMITn5jGeeK+oIm+wuEjMW6SOlUg2Pni2jANjmMIXn45W4FIr1Httejwd02NMIOa85NTtlIlKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PfetxW1V; arc=none smtp.client-ip=74.125.82.195
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-304fb780deaso458716eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 02:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780563708; x=1781168508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eJ/sx7/ltcdaqGki6/rt6gC1u0dQybWtjhniKzJFM0g=;
        b=PfetxW1VAoL0/VzBFs3wfWleOAVbCRp/1yBwrft/JaU2uWcYR5QUFapUKqozj76J+R
         9Yq5fT2bFnX7Dhd6JB5elpn7frbSnX3mq9QRg4XfyIv+13N7W8IEYS3AxwDUSI87KALt
         aNYnAqlqrd1Li8QCcnPqbxMfLAlD9cS15yauuslmHOv2LjuTcCf/RwxmPddx/QSWtoEI
         VDQOWGCU+W8K7IWnPIMzLTDiveU5EhQPrbNn6GE4lvCr1iItqAQQvrHysVL+isORB4fy
         PXFtxK4b5DjtN1pK2+eNkW5ipTxNeTbMmQbQ20xqYd1dB8QfqBBjHQxriDOdCgBnLTgF
         hEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780563708; x=1781168508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJ/sx7/ltcdaqGki6/rt6gC1u0dQybWtjhniKzJFM0g=;
        b=DmSSjCjcoIyBY7D+WNg4iu/aUJ+8Zs5Ef+0t1F7sPSWgT+OgNTVVPpZi/gx94++Yzy
         8mVFAELRhCQwL1MocLdXyzC/8IIzoKzHNwgXleCTzZHQ5PwoGCb4a1qcqdbzpB1WMHIv
         70rg5xVu4QCTG9koY9qqDFm2kP8TS/5sh3YQe2mrQ8LxmQJI8g7JZa7BpRVW7YHeR+z7
         bw9Jr7C3k1vPomquSWUG+evsO+l4F4Xj/ei1Shvolrmq/hU/7hriLIDLpZidU41Sjc70
         SHvrY43a3dZrnGZV83XzZ3V1s2+XVgzTmqiKX7I7zkt2oU+XIGgbhd9DrrvDo3Gjk6nK
         a7gw==
X-Forwarded-Encrypted: i=1; AFNElJ9ddbpLR61E7LkIhnMCIh5l3cLnKtewS4nWLPUZjm2onholCcFpq0Ew9RcE76gXQzKJAUvyJXAWfhxuKfCg@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq1Kjl/tfqtyPSYE13VsuZ8SSqu8czMzPwe2ZoNyO2HLxUd/0n
	RMtzQBq5N52vyDwmPKV2EaIoEHzg7DSjIJ1T1SUOKmbCLoN8t+FUokO4TKoG8k5i
X-Gm-Gg: Acq92OGRTAMiOuTjWygpIEptxCLZbHLgW09p9e/GXZmcBORkhyWtgEhzBKYu+Y2qLmO
	sVUIqsCB6Al89g5/2189GfxnS08CdKsr+UGJOgyhFE8rTT0Cm1n7RSOHGAo6KC5nb68y4jyA7qb
	Sg140L5tFYq9ipRkzcnKuV3RSBlw+GTS16D730iOntFPTdz10CMUfIxkcIYr6PZ8y83BGikFfpt
	N5MdjgS7H67pbjOzBZM+V6PG7KLeSwxafbA7KRbIOvAV84/dbVGfEdNjvpPkdtLDqTd+EV6wxBQ
	dstOhKYpB83v5+NHg17maxYSIbPF6JPZljWSQIr1MvFOVNvSUx/pYT4cVOvYmG69rzAf7oTVBxm
	wCwEQgBEamYM/BGdoHJdHZgPA04wNYPudZJHZ+ujOHgVDVN2uXxKmbQ7Z86wna6KsF1HFgajfoS
	xzPp+65HTlt189kTtdrtmF+Et1UbGerYWPkNog6QraygBRapdygxfMSPs9EDgyMieYTQ==
X-Received: by 2002:a05:7301:6006:b0:304:e7c9:b528 with SMTP id 5a478bee46e88-3074fbfe7dfmr3677659eec.30.1780563708109;
        Thu, 04 Jun 2026 02:01:48 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df8076csm4892717eec.29.2026.06.04.02.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 02:01:47 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com,
	abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	stefan.schmidt@linaro.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v3 0/2] media: qcom: iris: fix runtime PM reference handling
Date: Thu,  4 Jun 2026 09:00:57 +0000
Message-Id: <20260604090059.46355-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111164-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:stefan.schmidt@linaro.org,m:dennylin0707@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7982963E61E

This series fixes runtime PM handling in the iris driver.

Patch 1 fixes runtime PM reference leaks and balances runtime PM
usage counts in the power domain enable/disable paths.

Patch 2 complements the first patch by rolling back the OPP vote
when pm_runtime_resume_and_get() fails in
iris_enable_power_domains().

Changes since v2:
- Convert the runtime PM fixes into a 2-patch series.
- Add a follow-up fix to roll back the OPP vote on
  pm_runtime_resume_and_get() failure.

Hungyu Lin (2):
  media: qcom: iris: fix runtime PM reference leaks
  media: qcom: iris: rollback OPP vote on PM resume failure

 drivers/media/platform/qcom/iris/iris_resources.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.34.1


