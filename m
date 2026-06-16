Return-Path: <linux-arm-msm+bounces-113479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qMBoAgK8MWpspgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 23:11:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6A76955DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 23:11:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=eXcTgnzt;
	dkim=pass header.d=redhat.com header.s=google header.b=FCUs2vg0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113479-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113479-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8871B31EAE34
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 21:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216103A7587;
	Tue, 16 Jun 2026 21:10:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E463A7D74
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 21:10:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781644236; cv=none; b=mWkNYuaTYtAoXgz4KDYOaoSK2GlefYYxj3KSFJgPqwMyTaFcnP34WuDx2bx/N5cOtCUFpdOS6ObBnzexRcuQjEkX5Y9UcyV6QYxtKUKKDI3NtH3ZxYpECHreadD76946qPS43PhkZSuw31424+WNochmhkGwipcbOs19PhlVtu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781644236; c=relaxed/simple;
	bh=eMoTK+bIbn5q4aLSjFVKXEZSKREFNs1FielfOnTbbHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jk/G2bMZ0KanRPfLmSMV7B0M8Wh0UdT200uKEv2J5yIQe2WlpKa7aakoRez2ejDueBXkbeWtlGbMxP9BJjWH+aKkr1ai0YQyU5z7yu6heIVZ+Rbo7ePhb5jpgggS3l4FBKugv/M8uOts2SooNkfML7q8FpekRqMbZPN72JiuVII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eXcTgnzt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FCUs2vg0; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781644232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vneDLhYFcib2vVIUkHKPcJhJE+JxQ4d0dzvHuaT83ZA=;
	b=eXcTgnzth7jLtE1qVWjvNTkSBcd5Q/hEr0VnE7ZWOAXkR2B6j8jyZZ/hEi1eaQVGRKxvNC
	cAp/0pkGxdPuc8hPjbSOt02UFIp+Xqc6C8quNasdRJc2hEC1NPqz935a198cseGkWaRxDs
	iq8D5VtdTjdhneEcwDq3G5CqmbiuYx0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-_YXwb4QKMQqmTqbMgjbWBA-1; Tue, 16 Jun 2026 17:10:29 -0400
X-MC-Unique: _YXwb4QKMQqmTqbMgjbWBA-1
X-Mimecast-MFC-AGG-ID: _YXwb4QKMQqmTqbMgjbWBA_1781644229
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8cceaca5671so102684516d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781644229; x=1782249029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vneDLhYFcib2vVIUkHKPcJhJE+JxQ4d0dzvHuaT83ZA=;
        b=FCUs2vg0bGoRed0M55LOgmDRSGmZu0PHeqy9ERHhpc/3eYg5RakifCWYeHTbiC37BX
         rys7qFpdEVkn45y5gDnKmIBxzjvgoPtHghshZyYVTATF8vo1pk7eRHUAzt3wDFcfLpMp
         g1xst5LrtGCfkliZv9oNPRtFkC53Qkqc3TG7FHfVOMuR+mEHM3rJ/ZQ0P2HOqxMQxbu4
         6SVuSM9LRnpiOhfpz1fuoONuVZ5UpwzU37k8ayez7oUk1PN3kKzJNuRy16rdbDp6vfMf
         GLw9a3e2OUkYtAyD+J73oVpibKeWoo7IJjB1sk5spUBhmoOce47ZfUnhWz9Qbe/andhE
         w+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781644229; x=1782249029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vneDLhYFcib2vVIUkHKPcJhJE+JxQ4d0dzvHuaT83ZA=;
        b=BuxphocMgY9F+8bdeVsoXeavSeQsosdiKjfN+Tyw0Toc4xvAb3SQku/37Q0LEpNF2i
         LSJZOV2AqqF6ABWNvHKLmfQG7xJO4crre2mAjSZM3OS13gdIH9sAVjMG2Ll7kFBmFy/N
         6oRGdMRMFL6/2RJHy8a9XB5gZF1gaYbwIOQ1J7eORaf1Uj9l5Df/0dlv1MJ6eoktDaMq
         2MOBZ+NINIzJmfr7IJRbTKBw4+Bn8sAIPoBurc2dtI2dplyFhrzGG0gfsTQ655eSJM8Q
         +AECbowULmT0eSz2Nlbt743qcH8vzT/mBYG/3nIEoD92uz5aRxaHibmsXTnLdRZM17cn
         T/TA==
X-Forwarded-Encrypted: i=1; AFNElJ/hnJcUk7C5+te5FY84yvE+D3pSerwRSwXxVEMnyIBTejtbt+ju/Tv+Jx55FF4r1fyBLiDcnP69o7U/9b+n@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd/Rc6g+kF19Fkvo3nBVZM4Mp1emi8DVKenapgXfnt4bjD1qjU
	FxEZ/jfEvTEQAnBA4N6eDyjfGTxdOffq/s29xI/mzJ1mad5aWXew+uGvfeXMp0KMSjthd1F6b4g
	Ve6V4EtM+BO+r8FUiXLAnOmVEaB+fouWfDNHDsckoBLBqRJvB7MAQCqprhUReGwvR9w4=
X-Gm-Gg: AfdE7cmdCuVMbbeeVfQqay1KLRltVxlD0chmfMLrvtqvPBnhzcyd7n93omGQcAYmYp9
	r2h8FuBdbhRveNlwz5DRGEG3/kamHPTTR9WMPAeL8NRiXYMloa9sk2lnAjAlJo6z+Gq42zCAFmk
	W+i2BiVlKBTKQK7mwiWf/HHdAnI1sEIvQ/XT2J5bWfK5DlLHF9rcoivZ+ld/8MIGRqpmU4ZhowI
	iM9idS2PKkle1FZBuxXO5YfFggLdloIZeXswrj4OGZ0GsE/9gbPx81JcQvaHfvX/i1GxWF+7ADZ
	BJb1bhCQf8jVuoPLgGbOVj40CQOFJxf9X/9T30i1vo8qzh6v+6wxQx8EEa0MUc5QyZPeiOQq7rm
	eswpZ4wxli3s4BYbRFZYLOyekMiURotl6RXa6sbkLzOv8FaR9Nvl+7Q9gctvDxg==
X-Received: by 2002:a05:6214:dc1:b0:8b3:fb6a:d370 with SMTP id 6a1803df08f44-8db6014086bmr21368396d6.37.1781644228900;
        Tue, 16 Jun 2026 14:10:28 -0700 (PDT)
X-Received: by 2002:a05:6214:dc1:b0:8b3:fb6a:d370 with SMTP id 6a1803df08f44-8db6014086bmr21367946d6.37.1781644228451;
        Tue, 16 Jun 2026 14:10:28 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d9f122b21bsm43742846d6.4.2026.06.16.14.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 14:10:27 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 16 Jun 2026 17:09:45 -0400
Subject: [PATCH v2 3/5] clk: qcom: convert from icc_sync_state() to
 qcom_cc_sync_state()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-clk-sync-state-v2-3-15f82c64d95c@redhat.com>
References: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
In-Reply-To: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
To: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Brian Masney <bmasney@redhat.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4666; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=eMoTK+bIbn5q4aLSjFVKXEZSKREFNs1FielfOnTbbHY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIMd+8uM1e9c3HN8l11ii8Y3HJdT5uEzXApkrrZ5yYRt
 /bNgtzujlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACYip8nwP6xGWeiE1WrvfKHu
 8lXvnpx9dfb+TJ8DHzQ6DnXfr9R/HMbIcDSpd3tOu1bxjaMs6VnXtyX/MstLzv6cXvFSsrbVvP4
 vLwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113479-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:bmasney@redhat.com,m:jens.glathe@oldschoolsolutions.biz,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oldschoolsolutions.biz:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D6A76955DC

Convert all of the qcom clk drivers that use qcom_cc_*() from
icc_sync_state() to qcom_cc_sync_state().

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/qcom/apss-ipq5424.c  | 3 +--
 drivers/clk/qcom/gcc-ipq5332.c   | 3 +--
 drivers/clk/qcom/gcc-ipq5424.c   | 3 +--
 drivers/clk/qcom/gcc-ipq9574.c   | 3 +--
 drivers/clk/qcom/nsscc-ipq5424.c | 3 +--
 drivers/clk/qcom/nsscc-ipq9574.c | 3 +--
 6 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/qcom/apss-ipq5424.c b/drivers/clk/qcom/apss-ipq5424.c
index 1662c83058bc..70991c3a9a58 100644
--- a/drivers/clk/qcom/apss-ipq5424.c
+++ b/drivers/clk/qcom/apss-ipq5424.c
@@ -7,7 +7,6 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
-#include <linux/interconnect-provider.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -248,7 +247,7 @@ static struct platform_driver apss_ipq5424_driver = {
 	.driver = {
 		.name   = "apss-ipq5424-clk",
 		.of_match_table = apss_ipq5424_match_table,
-		.sync_state = icc_sync_state,
+		.sync_state = qcom_cc_sync_state,
 	},
 };
 
diff --git a/drivers/clk/qcom/gcc-ipq5332.c b/drivers/clk/qcom/gcc-ipq5332.c
index 9246e97d785a..adec25aa9c27 100644
--- a/drivers/clk/qcom/gcc-ipq5332.c
+++ b/drivers/clk/qcom/gcc-ipq5332.c
@@ -4,7 +4,6 @@
  */
 
 #include <linux/clk-provider.h>
-#include <linux/interconnect-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -3307,7 +3306,7 @@ static struct platform_driver gcc_ipq5332_driver = {
 	.driver = {
 		.name = "gcc-ipq5332",
 		.of_match_table = gcc_ipq5332_match_table,
-		.sync_state = icc_sync_state,
+		.sync_state = qcom_cc_sync_state,
 	},
 };
 
diff --git a/drivers/clk/qcom/gcc-ipq5424.c b/drivers/clk/qcom/gcc-ipq5424.c
index 35af6ffeeb85..9bf3bb6f8904 100644
--- a/drivers/clk/qcom/gcc-ipq5424.c
+++ b/drivers/clk/qcom/gcc-ipq5424.c
@@ -5,7 +5,6 @@
  */
 
 #include <linux/clk-provider.h>
-#include <linux/interconnect-provider.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -3322,7 +3321,7 @@ static struct platform_driver gcc_ipq5424_driver = {
 	.driver = {
 		.name   = "qcom,gcc-ipq5424",
 		.of_match_table = gcc_ipq5424_match_table,
-		.sync_state = icc_sync_state,
+		.sync_state = qcom_cc_sync_state,
 	},
 };
 
diff --git a/drivers/clk/qcom/gcc-ipq9574.c b/drivers/clk/qcom/gcc-ipq9574.c
index 6dc86e686de4..9edcfd8afb77 100644
--- a/drivers/clk/qcom/gcc-ipq9574.c
+++ b/drivers/clk/qcom/gcc-ipq9574.c
@@ -5,7 +5,6 @@
 
 #include <linux/clk-provider.h>
 #include <linux/interconnect-clk.h>
-#include <linux/interconnect-provider.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -4134,7 +4133,7 @@ static struct platform_driver gcc_ipq9574_driver = {
 	.driver = {
 		.name   = "qcom,gcc-ipq9574",
 		.of_match_table = gcc_ipq9574_match_table,
-		.sync_state = icc_sync_state,
+		.sync_state = qcom_cc_sync_state,
 	},
 };
 
diff --git a/drivers/clk/qcom/nsscc-ipq5424.c b/drivers/clk/qcom/nsscc-ipq5424.c
index 5893c7146180..253d625ebf35 100644
--- a/drivers/clk/qcom/nsscc-ipq5424.c
+++ b/drivers/clk/qcom/nsscc-ipq5424.c
@@ -6,7 +6,6 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
-#include <linux/interconnect-provider.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -1331,7 +1330,7 @@ static struct platform_driver nss_cc_ipq5424_driver = {
 		.name = "qcom,ipq5424-nsscc",
 		.of_match_table = nss_cc_ipq5424_match_table,
 		.pm = &nss_cc_ipq5424_pm_ops,
-		.sync_state = icc_sync_state,
+		.sync_state = qcom_cc_sync_state,
 	},
 };
 module_platform_driver(nss_cc_ipq5424_driver);
diff --git a/drivers/clk/qcom/nsscc-ipq9574.c b/drivers/clk/qcom/nsscc-ipq9574.c
index c8b11b04a7c2..be8fbf5edda4 100644
--- a/drivers/clk/qcom/nsscc-ipq9574.c
+++ b/drivers/clk/qcom/nsscc-ipq9574.c
@@ -7,7 +7,6 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
-#include <linux/interconnect-provider.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -3100,7 +3099,7 @@ static struct platform_driver nss_cc_ipq9574_driver = {
 		.name = "qcom,nsscc-ipq9574",
 		.of_match_table = nss_cc_ipq9574_match_table,
 		.pm = &nss_cc_ipq9574_pm_ops,
-		.sync_state = icc_sync_state,
+		.sync_state = qcom_cc_sync_state,
 	},
 };
 

-- 
2.54.0


