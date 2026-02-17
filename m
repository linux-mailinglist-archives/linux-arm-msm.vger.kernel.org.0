Return-Path: <linux-arm-msm+bounces-93035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DUpNCW2k2l17wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 01:28:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4E514849E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 01:28:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E806E3020A68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 00:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25EEF25776;
	Tue, 17 Feb 2026 00:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSgkgc3h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C572D246335
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 00:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771288082; cv=none; b=EAAdISA7nACCHseEk7KIaxaUcCHYyUI8OJmOZ4BQgw2LRNuseFuOCYKVM/fZm9Cxls3lMAFdIXpIvKCJKNsJ5AQLrs+oY/lcHdpbJOoaYMjY04zNPQXlAhlzgHG1QP4q33wYTp6rUmkZKESLLMGf+csjPQhlU2CnV+KSmIdLFG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771288082; c=relaxed/simple;
	bh=Yxjldx0Jy64uXswjyLdMRw4GImxB5nb7jAdle3qN1SY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hqux4ZaCYvbwN2kmsUYC1I6txCiE/XmplatInYyBSlev+Rjot6T4DwPfpiw1PfydtXmtTsu9+WwEEZ0E4k3snR1lEx8Pz77CD9KE0Ij/wt2pqHOp17J6cLloiy5sn2tVltpoMy9jddYZ+wMIu7P+yelDpvgiRgPjS9wIhIbwoWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSgkgc3h; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-506989e8516so32765181cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 16:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771288079; x=1771892879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ASIhVmOfm72bVzGA477nCjdiqa2Jqep/Bp6HdWkvEc=;
        b=hSgkgc3hlrJl651+9lw5Qfp4j4/xTeSTWHc8vR98BAHPKWuBJ77yTomai37FyZhfGM
         wrB7ZnjgHGopnl7QwzvHaaGUmEc3SKHiXU2zApV5KSt0vdzI31REgmvaSlR6xJwnJy7g
         9D3eb3/pbD47R6CltW727OZ5a3pXEdu2yF/xlb1MlpTz1c8zga0wC9hGJMt9OK7k9150
         REMDJI818y52z8eiFSnXswgwwL7FC8Z9UgIQNtrJI4M9lQBckD6lladQZKbqUUjhGCOz
         VWm3WBPFtjDaoV1/E+ZSxMFJO67A+pXw+hLBOweQOlbtBi/xTZ6t6KvT0NKmXds/SGfb
         HHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771288079; x=1771892879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3ASIhVmOfm72bVzGA477nCjdiqa2Jqep/Bp6HdWkvEc=;
        b=aZ2SdLNBkEAIadZNwn+DY4lh14Hocw/Q28VFbusZXaCf55gje8uUD4445I8KOr55O4
         Eo4eWRfVHcTyROXa8Qr+5sBqZf5HY0yJnojEFDD986s1Rs+nUaI1CBf1dusB6GjJlkXa
         ZUWdxyOmXAuYQgKKlBJLMBmeJXlnWjVbnVpMg7gE9NEzkKYUTcFI9oQhjROrP5+v+KQT
         bo7ie0oitIipY8mJZuTHtdNRXbUCxTjsAFWL7xB9WaIubSXwBcfq91GMomm0edIRSAcI
         KbPFkNQrn4cLObEIa4kVPPJN+T0FIP1LOPn5Z/7pEkPC40hzZx0rE8tobxYOBwGckcFw
         x2Sg==
X-Forwarded-Encrypted: i=1; AJvYcCXkhdt5D5bEMqY4nvcbjXdqRRSAion7kC2R1omg74NSY9ogAC/BhO6tRRJD2UGMgcERJQr/QvobwE3hLo3z@vger.kernel.org
X-Gm-Message-State: AOJu0YxuKblY6LTFNrq6TMBbNGi47ig1eD154dpy/qAgbvGJWlszjU0h
	Z20ObWFpjzZ4L12oiEnyNE358APA0D7M+01v5up+x4gO+dbjJdnkmL3J
X-Gm-Gg: AZuq6aIPjYjYVuROM1GRphYxnM3yQphURRG7nPEjkO+6/BwmvcO1BWMaqisSLOc5apw
	SwjF3H2RnfoQe3EJkCq9XBIX86XByGcgY/d8I/lgoXnZXq+lzVpi3PmmiIOAXmXsHoxLMZ5UqoB
	ebHXnKGx+HmtNQcQ2weCU8fuAX+9lney4KZt8ohZg4GBn/KeVvupZnkfVz+nrZIwJouDuuaUZ+A
	3rG6nxFjiEjOjB4z943IHsQTzAUBvH5BK57kYfeDxcVHmVegAmCM84OyA/8GUonUwTmdmJ1+0oP
	zwcMCSKzQfKdwIxVMXVjTewF8E0LV2sLCz1zH6ICMAxiRpMAcjGeh5/VLUaTKaDsEQTRe/4MkQv
	weQqQqAnKuT4NUEew54XRe4TjitNe7qySr2ALIWcCol84AdKkcVQXuH4ECffUwHdUE+CRe7IEWO
	9Ub5EuV0dautvjH02CXWfD1eCA2ie4SQ==
X-Received: by 2002:a05:622a:1b92:b0:501:40af:96bf with SMTP id d75a77b69052e-506a837b78amr149961911cf.68.1771288078776;
        Mon, 16 Feb 2026 16:27:58 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506a93ba30fsm92083441cf.26.2026.02.16.16.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 16:27:58 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
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
Subject: [PATCH v9 4/7] media: i2c: imx355: Restrict data lanes to 4
Date: Mon, 16 Feb 2026 19:27:35 -0500
Message-ID: <20260217002738.133534-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217002738.133534-1-mailingradian@gmail.com>
References: <20260217002738.133534-1-mailingradian@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93035-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,ixit.cz,vger.kernel.org,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 5E4E514849E
X-Rspamd-Action: no action

The IMX355 sensor driver currently supports having 4 data lanes. There
can't be more or less, so check if the firmware specifies 4 lanes.

Existing ACPI hardware descriptions may not have the data lanes defined
so this check also accepts a placeholder of 0 lanes.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Link: https://lore.kernel.org/r/aW3uFcT1zmiF4GUP@kekkonen.localdomain
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/media/i2c/imx355.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 9ca87488c933..0d6aabea7d59 100644
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
@@ -1705,6 +1708,10 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
 	if (!cfg)
 		goto out_err;
 
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 0
+	 && bus_cfg.bus.mipi_csi2.num_data_lanes != IMX355_DATA_LANES)
+		goto out_err;
+
 	ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
 				       bus_cfg.nr_of_link_frequencies,
 				       link_freq_menu_items,
-- 
2.53.0


