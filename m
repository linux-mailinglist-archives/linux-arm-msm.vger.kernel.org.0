Return-Path: <linux-arm-msm+bounces-99496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOGgIzjywWkgYAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:08:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F08300F53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:08:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26382310061E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 02:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1911735A3A6;
	Tue, 24 Mar 2026 02:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfaYsNmW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4421350A37
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317701; cv=none; b=qHpVVH8bmbqtu3TVYX5C+qcm60crvhKxFuvCcS0wrMze6iTXflG6VPBnfBhU0+s4ldDqXb4vo3R05vk1X7BT27MGJF99hUwFprkiWzp6fRLN61DzO9NiMWrIZMk4BzebBGv7frI0s1zfW2ii/oGzDEa35+LxC1xFDdY52KEiwSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317701; c=relaxed/simple;
	bh=C6pslvwk58QZS/2zykKJiaeBxMWH9ps/RxZto+oATu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ThcftQcgrx53aZDLf/KxfeflweQbj+pIAprwKRFt8d1Il7D/oYxkxDHj4kGQCoDOXTj3mnUWMjvlm9n/rcJl1XhnVGjU8xvK+4KmVXbHl2K2pzkXV49mQ2n6TMJzV8u8HvcqFd9sNJLr+GDqRjaogRaA425j45RdeAzWrdDiGJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfaYsNmW; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8cfd44fa075so94486685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 19:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774317699; x=1774922499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBs5FO1PS6bEgGJFgn7J/YLM/i8VXi+ZJKbnghNzohk=;
        b=SfaYsNmW0IwfbMzmI4JMhZWzwpvHC8uxEFvsEqOxz/1gOk8+SKiwqrss13qrEnFwfk
         1BKMWDha1de8cgfg8x2L56kwXE/rrzHB05sKXDX8rrb5dIZiQmEYvnpEmin6ktFCF4hS
         ipMsGVaJi67SfAtr+i0N0BXUW5+AB4DBJnKUZtBi7utgbsuYV9U6pvEJzsRleoSKBBVT
         7asajKyI040Y5PMm8XLu6lv9bRAtvJFRPCY+9HSIj1USXl7ZVw9Z9P/PW78Y0Tsh20DU
         fr12HZ2nx8BEtwxoiFIM9FT/SgbVPapLlz1GC00hDBq7XblbqxIjZ117dkWnscqJacuW
         GlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774317699; x=1774922499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xBs5FO1PS6bEgGJFgn7J/YLM/i8VXi+ZJKbnghNzohk=;
        b=WTQUy72vmwCXhFL56gIxhjqgLBxy0kIrtgDneTT5MYdsjU+gPJc2yfwpwbY2u1jZrK
         AZ9R30nS6+z76KjlzHMCAcsTVB36Fr2ZH16kFm3ys021Ry0y1AEIUWBictPHwOvi0zPm
         PzLjAjfyTXKRtgV/NZ0UCFmIgyx+PbTe3tdS3xAc2nn8XWe76dOsbXjtAYDhJ8Or0nd0
         N3MLGNvprkuKTSzWw1iEQLhwGIgJ+lwucXWqgUWEBJEAROOOI+bsPFN/A2P5Q1nAF29n
         Wc258eURajUyvmTWk1rEHXlp83ogVKAdNCHuYjUOA1Nr012hVVqK++6WDLR/7SEYJkpt
         OKww==
X-Forwarded-Encrypted: i=1; AJvYcCXtQ7HbcN9bn2r3rmFa0KmWnRIsLSq2zh0jbSzLQzM9iRaKgt2Arj2zdvtq1SswWFGNeFIL687ognN041LL@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfs3oORKKcQlnA7eo6063uNtO9xrUNtFt/I9f5vbcCjblg+9vE
	XlYboSEQ30bv5LIwjkfhDFSyxRg1MBbzwPfE51oUkINcj1JAojofT244
X-Gm-Gg: ATEYQzyvLzyjgSy/G+q4BfOfNpQPQRLQwFoDu3CsVWftsy8D9KEZkx3M2FNM2m09KG5
	IViLAx6Z/YuHhKc8ZgHGuUXIPupjYPBKVqoP8cINK4QomAMAeOpiR6fWcYfVNNYLI7FEqszH/NC
	tyA4z8ezsQjbfj0yqStW7Sda5bBEeGkJfc/4fOKuYLdCLf0WiuOE0s6ANCCjBipNyAWMKu3dByV
	ITcWziT/VBH3Vapz99rFOCv3MPFUUJ/ylohRw2S1vVEdAqTBPCbbrwo8EZI+CJ0nunpGF+ipJ6a
	GCCsYDn9SDj35b2pKtz8Vpqyk+fc8CuWFlKY/Kw3+NrspVTxl1InUWNwmkEzQI94Imktqz3cgWv
	ZuRSIYiC53YRgXht/AszeE5eRHsi8ckWKm/g+Kzud8Y02jwOs1uEfnK75d/2xMpjM3gLDSkuykX
	8OwDDRPjrgajawRMRjrp99CuC0PvpkV9FpNvj641iLFzvhedp/LFhKurNqH0AE/yWjZvTwiLCq3
	Idz8Dc92iAEtKo=
X-Received: by 2002:a05:620a:44d0:b0:8cf:de1c:edea with SMTP id af79cd13be357-8cfde1cfe37mr1423972085a.13.1774317698665;
        Mon, 23 Mar 2026 19:01:38 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cff3119121sm140450585a.16.2026.03.23.19.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 19:01:38 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v11 4/7] media: i2c: imx355: Restrict data lanes to 4
Date: Mon, 23 Mar 2026 22:01:29 -0400
Message-ID: <20260324020132.8683-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324020132.8683-1-mailingradian@gmail.com>
References: <20260324020132.8683-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99496-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[collabora.com,ixit.cz,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: E9F08300F53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The IMX355 sensor driver currently supports having 4 data lanes. There
can't be more or less, so check if the firmware specifies 4 lanes.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Link: https://lore.kernel.org/r/aW3uFcT1zmiF4GUP@kekkonen.localdomain
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/media/i2c/imx355.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 9ca87488c933..27a5c212a527 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -66,6 +66,9 @@
 #define IMX355_EXT_CLK			19200000
 #define IMX355_LINK_FREQ_INDEX		0
 
+/* number of data lanes */
+#define IMX355_DATA_LANES		4
+
 struct imx355_reg {
 	u16 address;
 	u8 val;
@@ -1705,6 +1708,9 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
 	if (!cfg)
 		goto out_err;
 
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != IMX355_DATA_LANES)
+		goto out_err;
+
 	ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
 				       bus_cfg.nr_of_link_frequencies,
 				       link_freq_menu_items,
-- 
2.53.0


