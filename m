Return-Path: <linux-arm-msm+bounces-113443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O58iC0BhMWo8iQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 16:44:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDC8690A0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 16:44:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b="EyD/o/AY";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113443-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113443-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 380CE31DE48D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34583624C1;
	Tue, 16 Jun 2026 14:38:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CDD36E470
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:38:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781620718; cv=none; b=Igcq0D5ktL4P+w8XEwEkIPezzOSt4c76i+qnG+RYZc7ygmeJan8q6Zsk1aJEg9k8RxyvmLNS6G67wzfAmfR7Fbxn1GrGCv6mn3dqalqBgEMllRkEQMGEziHa1EcJyhaHo+xEju3yiaRKuTtV4P0MCLEjISHLJeA5DYJGI5+KIhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781620718; c=relaxed/simple;
	bh=AVhMeIY1PvyV4RiuwAZteI7ZZRMcD0tR7T2uTtHY47U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TSRbPYmZxTQi6dOgnu9v/oBigs1pFTHPpLRNoc2BCEWhTxqmt8Iw1oqPCD9/Jf0RiBnHli+03y5uaa7F7l/WDxeQ1QL+z4PgB98l89xpGG1z3Cv0Fy/XLuCMh1NQWqA6JwVACvoUbxG26PGt7zmJp98UVs+xicft/kAabmflh3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=EyD/o/AY; arc=none smtp.client-ip=209.85.221.50
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso3161369f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 07:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781620715; x=1782225515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W+tSGAKOOiWrJ8xcAUXOZaGk1NSgarKla4YzWcPQKdw=;
        b=EyD/o/AYNbV9yuBBSgtIwVEweMv4Y7cRk9j17Is1QOp3NSUFRujoXTvDjVOtFjQtci
         yKBJu+eYX8Dm2ujFw+2+Wu1W4BQJGvadqeinOwM2fr875skTonq4eu0XTtImNVvpQmRl
         I+c5SfqE6GS3U4xRMvd21KdbdDQalho7yquQn2PgD58lj6O+UvhEpDC7k0ozqBnhL3SL
         NDL3r/me2oE0YHN9hAQY0pH6m4LsLB9zOEeSP5BpV8oVp1RQxL7tMb2bWSaAj5D0cK2J
         p9pzy8Sq/FJKZ7wal7+rstXvZ45rL7QZ4zmHQ7xHS2etxsqrXxJrUz8jFKfA8+pX0H9L
         OdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781620715; x=1782225515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+tSGAKOOiWrJ8xcAUXOZaGk1NSgarKla4YzWcPQKdw=;
        b=ee9/jIZUDuKUnmMvOgxk1om81a75A4jp5gc7MQNHFQs5CahvefZwykYj4mOCaQOefG
         ZP9Bcz/4Cxg/EmOFg6IClAF9jKiJ1d9f42/6xISnLMuAzDTe92fQOma82fb3wjMSlicY
         Cnyixd7Vgk7XXdoU/Ou0SJ1Jcwg1VhCPtZqiMoIK1RsBs65/3xu0JVOfQM+02UjFaRzs
         m9PuldTXUCtXTqkLiTQ3ubEiNgrbRM85YkFussGh6cekKkrfC5FdkthL3uXIeDTiSx1N
         3+WrQhH3MZqVIl6Q4tZDfFq0HqSpL2PcP9tgmJKgfYWoL9/QyT1b0S/9tkDtbqUOti5H
         PAew==
X-Forwarded-Encrypted: i=1; AFNElJ94ce+FIdDj2VUPOcvjT0iE/10msEwRzsVFvUOJwnx2tqr9i2MJCMXqX2Os8qjFF1k5N8m90OZLCt77FphU@vger.kernel.org
X-Gm-Message-State: AOJu0YxFJ1+a4W9kTfhe8PVK6vYp/9CceCEnopw1XA2SkTwSvuL6aApH
	rkGZFNzaywRVuqxAZRUL3QBuESXiBprLDyl26aqT4TR8W/qAB7jDeNknh7DP6yiqKwiaF2ojCoi
	ginN8
X-Gm-Gg: Acq92OFcSmcuMQVFUJ8LNQ16EjWiikgigRAUJPC083LESvrZp08KsXZKrJ6P9+KJZ0W
	9xoMDR3twVRx91BV1XW1m/TjQP/N/XcDySkaYOGHCc3MAFJGTbn71+bro1BvU+ADe+38BkJsuzm
	v5VqY2r555Yvhq52MRXWNfXN5E+0guM8SXwycij+n36yM1yIlAvUJgAL0Jw1XzjjDgR/QYnXZ10
	fQmZNYQMOcZLHZ6FMblhQMlQ/NsI+PX+cm0kHw5A/MForbVrN1pPkuVIFHQqVaPv2nQwd/WgYzO
	sHNNvPGoxrBY+3Ra4LpCHS6ZrrXn8LbiVCy0xQ8gttlfdylTvHFRVhzP0HkL6gwJMmvbtiY4VJh
	DhYtpIuA/DbJLXPaD7xF+SDksS9fK93G6LwgFGcNUO7hk4ZNh3e3iXzXa0GDwBLZe6Qnpn20REG
	IBf9JZiy5E70ddlTbs713C7qtX+aJs0hcX3wX3PdIqmHSoVy5y1aVIlVLWTzJNUVfqPZepcWgQx
	t/08+hGLgpZeUI=
X-Received: by 2002:a05:6000:220e:b0:45e:d8dc:922e with SMTP id ffacd0b85a97d-4619f3af726mr7190374f8f.20.1781620714895;
        Tue, 16 Jun 2026 07:38:34 -0700 (PDT)
Received: from localhost (p200300f65f47db04ed78e379f226b032.dip0.t-ipconnect.de. [2003:f6:5f47:db04:ed78:e379:f226:b032])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4606f26434dsm45670638f8f.1.2026.06.16.07.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 07:38:34 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>
Cc: Sumit Garg <sumit.garg@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] tee: qcomtee: Drop unused assignment of platform_device_id driver data
Date: Tue, 16 Jun 2026 16:38:29 +0200
Message-ID:  <c21803b3f2ea1522bb930dc1dcab79c2627f2234.1781620559.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1336; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=AVhMeIY1PvyV4RiuwAZteI7ZZRMcD0tR7T2uTtHY47U=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqMV/lBZBY7mc35M4ybdluFIBOzGWByaPdm75cj 8Qd3LKI2XiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCajFf5QAKCRCPgPtYfRL+ ThOpCACzTn7kcorJvTwKOMBfw0gvPGrtu/fluvqk6pTkMfLHZJ/vo0s8ks2JmSeDg2z9ZvTjjRz xe1wbs5bXDYOXWr28CZHVqIgjfL674mDA/IDQHGH5Oq56FnEDkjUhETy/2+BbuJyCcWd+M+UX0E +PQAq7JcSn5GU6ijXb80sy9vnWPQu+GB89njGQ7T2OnT5Ygik3IRComDtMq2tD1qVbP4YpcdO6R O/ppalmzpqZ4tHhtfd9ply1+sjjOHhyqOMbak9xNV8XARPmRomV5v4pwEXk+0pbQsjK0u1GNd3G X4CNTZ/HcWWUvhEj4acJCthK7D/6UBbr174M6wDafyCa3IpY
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:amirreza.zarrabi@oss.qualcomm.com,m:jens.wiklander@linaro.org,m:sumit.garg@kernel.org,m:linux-arm-msm@vger.kernel.org,m:op-tee@lists.trustedfirmware.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113443-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,baylibre.com:dkim,baylibre.com:email,baylibre.com:mid,baylibre.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7DDC8690A0F

The driver explicitly sets the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop this
unused assignment.

While touching this array unify spacing and usage of commas and use
a named initializer for .name for improved readability.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

while this is a cleanup that can stand on its own, it is also a
preparation for a change to struct platform_device_id that requires that
.driver_data isn't assigned by a list initializer.

Best regards
Uwe

 drivers/tee/qcomtee/call.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
index 0efc5646242a..4a597eeaf174 100644
--- a/drivers/tee/qcomtee/call.c
+++ b/drivers/tee/qcomtee/call.c
@@ -798,7 +798,12 @@ static void qcomtee_remove(struct platform_device *pdev)
 	kfree(qcomtee);
 }
 
-static const struct platform_device_id qcomtee_ids[] = { { "qcomtee", 0 }, {} };
+static const struct platform_device_id qcomtee_ids[] = {
+	{
+		.name = "qcomtee",
+	},
+	{ }
+};
 MODULE_DEVICE_TABLE(platform, qcomtee_ids);
 
 static struct platform_driver qcomtee_platform_driver = {

base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
-- 
2.47.3


