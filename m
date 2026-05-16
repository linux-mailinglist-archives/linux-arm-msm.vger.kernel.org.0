Return-Path: <linux-arm-msm+bounces-108004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKuODg2MCGohuwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 17:23:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F11B55C53C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 17:23:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9260F300FB52
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 15:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411AF3A3E73;
	Sat, 16 May 2026 15:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MjitRO/g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2123E3C59
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 15:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778945033; cv=none; b=Sz+5zXiNtIazgAJs5L94o+SlANGo9zCEV0D2GftblYHNvGWYpTD9iGdmx3lzPZpwYJXjGCpOX70AP7sRV+Bi75RMT89P9fkXcqF/mH6EfHBGO3R6RXU5uJOzjgux2YE/KrhDVd60TZnBp+cs012SpJJ5yLuPfXIhKcla1j4zU9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778945033; c=relaxed/simple;
	bh=4yj2+aZhJwSDPYMZeTnCB0Y62AmfW8gQ5CSgLzCMCCk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Btj5AZkGiZIYK1CYySY+eP/VMQsvEuPwnRjMRsp+nP/wBRwuKsnjKPzwERDZvIJGeChWjWkRn31EfM1KlY41Y0B8ad7gJHI2d8e+FGeIhYIZO9N4rWFJRZUr/qb7DlscvBesYWkF6pzpYSDB/pO8do0boEDb3Vt318J0ZsUGIaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MjitRO/g; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-83f249dcadfso328879b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 08:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778945031; x=1779549831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BMSAU0/i2Bq1LOGi6eUSuoT4IlBYSFYcL23EMvbCK2o=;
        b=MjitRO/gTas6pCCibccij1hFroKU7rcqWxo+O/75yFf932P0GYohKrAjeq6YtdqZdK
         FxG//U06weHmkRWnAYesaejxClb5+rwPgO24a6DxJlbXYeobdOkiypBHKfd2w/wvrVyl
         2O91RSWpo22p9hlMXUn7CFIgolUnLXI4wDaB37OvEQsoZGj/jN+MtC0qcxEJsn45rX/J
         Rj5PowlOrS3wBuq/wk/I8d4PJh9GYhkJWUXyh8kTJLjkCppYIRLVBQGoDPKq6cLq4Yyc
         2OfuDEAv0S/w6BvSTf2t9HPYIJHrbrZiaSplxIXZGIDx23RhNGTQaQ8lCN6gy868AyyP
         MJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778945031; x=1779549831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMSAU0/i2Bq1LOGi6eUSuoT4IlBYSFYcL23EMvbCK2o=;
        b=fkfMyfo3UeWyNBVIFwDFXRrBtKuejEV1o9x0uLcPOngvFIXqQ/zC+VYJKjy5kfiqd6
         Ce1M9tySOaPRVok4Mg8cHdjhYeMPR5XkZrOuES8gbvSTA9Ow4ZJ/5besMJZscj+UEYek
         TDoLc9UOBUYVLdo8g3eU1qSDk1zc73EDWrezpmHIZOx3WMEA9ekWM9JGwniSYesaI/ti
         D/hr4tuEUwWYnfSqY7cGWIIlcyPTb2HRzYWnMqWDN8+PI2zH7XUyE0AfTc4KmyxV1wpZ
         WRCQZOFFwL8t+Xetjz8sFKRTCXSvpZuZjIWuk/RHHesHMffTYpdeDavJAULBxZF8sWsm
         jrFg==
X-Forwarded-Encrypted: i=1; AFNElJ/XoFOl/MKFqM2tPjUFBfbkeY079xOs+alPKslSNgmTpLSZGV8kd3VTsJlQno/W23Jx9ZtmHT8MKL4FwJPW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3z4Yc1UoBFwqy4yZAQc9BXfKaahjFjF74PopAYm7u6aFi20xj
	x7tJrMrRIrlY92hueZ00XB3ZPxKWLYJGdRFpPb0qdlBy8RWWaMhfo3cI2RVMbxKtsw==
X-Gm-Gg: Acq92OHZ51Sh8VtPDhz1g71tvVTrMKNtqbf/Z7vIj5TqxSxAwVkCc1yDt5NIx6FCYPO
	gfBth+Lhsyhvvp+2d+J7DdBg5nqREy4ytcd2uvmWEjgV5w99zyIohtgp+kBMAkg6exeMt3gM0nj
	nGWtT6b7k2qKXBhePmlRqfLZyFzZN83OZYd9nDFrXWUAcBYfKVM1ZUBsz812TY89ddWWXojqRJe
	JGxnyohnd2GIV+mexF37TzrXHPopQiSPTDIguK+f+EdgaJsStQC9gQJTNOvjKJEoUYuRVUVh4Tv
	DXJe2MhLKSqocK9hG/7WyDYxD2oeRbuqKr2As1y3FCTnwlb2mco6yJkqEp81TJvLEeZU67sS9Wc
	igBM1bKynWosouqSGwJkc05Mc+zrWYJHxC4aXe/bb9BbIv4wx4xvNnyybnPTSJsI3E6eVDnGN30
	kQtGQNZT5YVIXY9varBVwBJLpECmZDAs/t0t8fD6IIJA==
X-Received: by 2002:a05:6a20:12ce:b0:3a0:bc61:62e5 with SMTP id adf61e73a8af0-3b22ee0239dmr11096033637.44.1778945031334;
        Sat, 16 May 2026 08:23:51 -0700 (PDT)
Received: from localhost.localdomain ([1.232.225.242])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb06875bsm8438364a12.3.2026.05.16.08.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 08:23:50 -0700 (PDT)
From: Jinseok Kim <always.starving0@gmail.com>
To: amitk@kernel.org,
	thara.gopinath@gmail.com,
	rafael@kernel.org,
	daniel.lezcano@kernel.org
Cc: rui.zhang@intel.com,
	lukasz.luba@arm.com,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] drivers: qcom: fix typo in comment
Date: Sun, 17 May 2026 00:23:16 +0900
Message-ID: <20260516152324.1863-1-always.starving0@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8F11B55C53C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108004-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,arm.com,linuxfoundation.org,brighamcampbell.com,xs4all.nl,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[alwaysstarving0@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Fix a typo in the struct tsens_irq_data comment.
Replace "uppper" with "upper".

Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
---
 drivers/thermal/qcom/tsens.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index a2422ebee816..5e19c7588e03 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -27,7 +27,7 @@
  * @up_viol:        upper threshold violated
  * @up_thresh:      upper threshold temperature value
  * @up_irq_mask:    mask register for upper threshold irqs
- * @up_irq_clear:   clear register for uppper threshold irqs
+ * @up_irq_clear:   clear register for upper threshold irqs
  * @low_viol:       lower threshold violated
  * @low_thresh:     lower threshold temperature value
  * @low_irq_mask:   mask register for lower threshold irqs
--
2.43.0

