Return-Path: <linux-arm-msm+bounces-111007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m08iEiQ7IGrKywAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:33:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C28638A08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:33:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=Cdg+C2tH;
	dkim=pass header.d=redhat.com header.s=google header.b=eBZKCze5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111007-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111007-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 081903238819
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 14:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEB3D48AE0D;
	Wed,  3 Jun 2026 14:22:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB0D481AAB
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 14:22:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496548; cv=none; b=LpAst8XZi2gbXJBVuTDhcEPZi5mcRD7k+ASW285EqNbx6ARC+hsHlSk2G2LGYuLVn+IG1VG5N906pxdBNJZPjT1X0Uw1/w/U8DrbvA+VwkxNSNss6ApgEi2kILOjonGmGvgwvG3WmH2yEB1BybI5ZeL7MCtRTBMBqx84+WJi1Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496548; c=relaxed/simple;
	bh=bjN8RAuY/lp1bR9xKcsMa2zNTPYa8eGr1YlYX+mBtHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hf7MEziCrDR8P26XLi+nl7QhijVwCUUKyrpBZdwZKqRDLL95Q7cr3QIfzTmH2by1d5IHQJPc2RYaQ1Z74gxJ/PkU0L0alwrY737beCKstw7ezIAv+HhaFsraT3qFEQj5ARkbiXElyHWTXj3C3vb2H7fgdoQaxKWIb+CspJsKXvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cdg+C2tH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eBZKCze5; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780496546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IgQ3umXcpR3Cc34wKA2umMzxxU1QdCZVKqXka7AU700=;
	b=Cdg+C2tHuiKxW+SadPD11jhRTE6tbFeVfLDJ7uRRkg8CxCOWQtMoM7fE9KXMvjrHdmU9W7
	FhbBEYrlVfhqwhA9CwwQeLNnAedNWxk8LpNC6JxuI8SRaoGan5GwQgTOg1HM0LyK+TVkCo
	6TBsOYWxdI+HBVe1BCEk5ddZClc82wM=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-y3_UJi6PPgCmrDC3vMkKJw-1; Wed, 03 Jun 2026 10:22:25 -0400
X-MC-Unique: y3_UJi6PPgCmrDC3vMkKJw-1
X-Mimecast-MFC-AGG-ID: y3_UJi6PPgCmrDC3vMkKJw_1780496544
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157f1be04aso146558785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 07:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780496544; x=1781101344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IgQ3umXcpR3Cc34wKA2umMzxxU1QdCZVKqXka7AU700=;
        b=eBZKCze5cIRDPk8/hEQsPvaE2REcTT3VSNpkvFvbQBJ7nLZ3dI1eFpnPXhtyMUB5iB
         HwkafXOT6+FJ4nXCCEy8VJeDD2s/abNDt98pwA/P3qm7kmt8xLOBujczdgYLiZlykSC3
         oeo0PK1n4osiEmk2l1cJ6vra9NS9LqchWBKJfPurqPNcKJH5wrg5cRT2wExgUUSeUqRh
         USIOVx6l4BZNf398ibIv1pkV1wg9VseTPRNZg1/wUJ+tjpx+MTPnZWgpDpVy32qB64Mt
         GA7vhjGJiTHWhpfU+3Evna4rfL6msNx4R4MTIkklXNdO8jlfe6y7Q56SVDu1yLSpq+rh
         xBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496544; x=1781101344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IgQ3umXcpR3Cc34wKA2umMzxxU1QdCZVKqXka7AU700=;
        b=VzBdrluuZWUeEnsmV63mj+ia88cRPiurW7hyJwPWuupgrK6fx3focpdcMAyW0CDwof
         eVsMW6oXOiadjdF1rVQTtS4xkrsEon9lVzYRaFf24AjZqb4ZvqtFQg/4T+gFDtDSX07H
         7yyGg9r/pQs+aalaMLT5EWOhjREXQz27pSkvpf1pqCrrffZyWPASXS3/rdeTHbpCMjIZ
         U4kiNP8gjCpRUEd3Jo2uC/khRU/23cxsOyj2CIqEzxDRpD0XFvFVq9nLz1iWZu8SjpxA
         2a8zfQ9r4Q0ncjTVeySpexwGsNPVP283/uZeswPz7z5RI8p4ZVRiE/GvTQphhFa92I2q
         b6sg==
X-Forwarded-Encrypted: i=1; AFNElJ92b8k1R1YFJnEfW+zZ/SupjEbYEwYx0TaR8QXTFvQKjtGEAWqYQHmfe935NbUqBCQ5sQSAHm/8SU19aDFC@vger.kernel.org
X-Gm-Message-State: AOJu0YyerxQETh2ZQpw0OKXpb2zYHwlflwguYa0ljaeECfMjpgeZDtTE
	aCznDyd9RKKmmS8yQNTCVKKVZOSjtdcsv8f6uq1zpiduXK4YXj9+FP5sr/+Torh+btLp98pouEp
	73gjPw7matV6iZy8OrjJygGUee7uDPcMXMFq3DNegpJr+0zqt8vjNyIfBk+gSSLfP5qU=
X-Gm-Gg: Acq92OFVbvnVaQ20cs/BtRPk409IL/m4mtz0nSnjSknx8hmilhbWCSCdlGFLJX26AHy
	jii5FYJrVGanShSHtyD0drGnzLn61YCahc9PhnHAZ0BS0SSXxi9TY+6+HMbU4NPR1enOaxXVMkr
	3ikbaTc5iKc6RxKLmg17H9g4tt2w/cnFV4nFOgKJraHJrjLPk98D/AQKmBk4JODGPtBbQInMhcr
	UkoZwxaeQSJGqlMkHRthRNlVPeHquLJoCW/0L5AQlY6oLZrs5vlQk32HmgyGHW20ryjh4fZzqdb
	Ht7DiymU1mrATS8AbUapsVmtTHIeOhimX+L297vunKrjR5pWKj9mKYPYG3tN7/oMoTY042LVDKz
	Oq2hIlbTtSJEbmTIk1Bjzv/Ouwa7euVAn7FuXbfgqQMFwv09uFns5iJvk8n9i/jntjg/Qbuo=
X-Received: by 2002:a05:620a:4804:b0:910:4e35:cf02 with SMTP id af79cd13be357-9158a7a997dmr614023385a.37.1780496544591;
        Wed, 03 Jun 2026 07:22:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4804:b0:910:4e35:cf02 with SMTP id af79cd13be357-9158a7a997dmr614018785a.37.1780496544099;
        Wed, 03 Jun 2026 07:22:24 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a238f8esm255611585a.15.2026.06.03.07.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:22:23 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 03 Jun 2026 10:21:48 -0400
Subject: [PATCH 3/4] clk: qcom: convert from icc_sync_state() to
 qcom_cc_sync_state()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-clk-sync-state-v1-3-457120eed200@redhat.com>
References: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
In-Reply-To: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
To: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5781; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=bjN8RAuY/lp1bR9xKcsMa2zNTPYa8eGr1YlYX+mBtHE=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIULKYf2hrw9Dzjwwa11fdDGLhUTqmL6r76Y8Y1p/zDS
 tf+xpTyjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACYydTfDP7vcKSyxOmazvs1/
 lnpMpiNjlk+0bIjszBUz1OUWblISesDIcHTqs2U1fYZCVRF3X181n9DTIiBYKq5/s/bcxYs58/Y
 uZwEA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111007-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:bmasney@redhat.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 63C28638A08

Convert all of the qcom clk drivers from icc_sync_state() to
qcom_cc_sync_state().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/qcom/apss-ipq5424.c  | 3 +--
 drivers/clk/qcom/clk-cbf-8996.c  | 5 ++---
 drivers/clk/qcom/gcc-ipq5332.c   | 3 +--
 drivers/clk/qcom/gcc-ipq5424.c   | 3 +--
 drivers/clk/qcom/gcc-ipq9574.c   | 3 +--
 drivers/clk/qcom/nsscc-ipq5424.c | 3 +--
 drivers/clk/qcom/nsscc-ipq9574.c | 3 +--
 7 files changed, 8 insertions(+), 15 deletions(-)

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
 
diff --git a/drivers/clk/qcom/clk-cbf-8996.c b/drivers/clk/qcom/clk-cbf-8996.c
index 0b40ed601f9a..0d920bd5a992 100644
--- a/drivers/clk/qcom/clk-cbf-8996.c
+++ b/drivers/clk/qcom/clk-cbf-8996.c
@@ -6,7 +6,6 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/interconnect-clk.h>
-#include <linux/interconnect-provider.h>
 #include <linux/of.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -249,7 +248,7 @@ static void qcom_msm8996_cbf_icc_remove(struct platform_device *pdev)
 
 	icc_clk_unregister(provider);
 }
-#define qcom_msm8996_cbf_icc_sync_state icc_sync_state
+#define qcom_msm8996_cbf_icc_sync_state qcom_cc_sync_state
 #else
 static int qcom_msm8996_cbf_icc_register(struct platform_device *pdev,  struct clk_hw *cbf_hw)
 {
@@ -258,7 +257,7 @@ static int qcom_msm8996_cbf_icc_register(struct platform_device *pdev,  struct c
 	return 0;
 }
 #define qcom_msm8996_cbf_icc_remove(pdev) { }
-#define qcom_msm8996_cbf_icc_sync_state NULL
+#define qcom_msm8996_cbf_icc_sync_state clk_sync_state
 #endif
 
 static int qcom_msm8996_cbf_probe(struct platform_device *pdev)
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


