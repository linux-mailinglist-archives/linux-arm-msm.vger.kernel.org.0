Return-Path: <linux-arm-msm+bounces-108290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WG42DU52C2oZIAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 22:27:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0906D57361D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 22:27:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DAFD3097F4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 20:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87BB391828;
	Mon, 18 May 2026 20:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="msGf+D36"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE90E38B7C3
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 20:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779135802; cv=none; b=mRWhtoU/icxu1mPslvozWuPbdZHv8ffpdSFEDf05yX0OfttfPZGk0W9/I+TEmQf9Q7tvP6s6u8oagum1kXkqu/2WjcZUByvIe4UiH06L7ILnYSzX9WRjew4X/PdIVjC7z/edGstJgXFVM/vS+j9c7AyF8V0ldFeGQxJs/Be8YM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779135802; c=relaxed/simple;
	bh=QzaN/O/VlVMdJSFQy2H+lcyumcLYvF1o8hZeXgqCS2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dX1YGblY1tneRxLvwxD4Nx0m5rbBjR1xJvYwYOUsJmQcJc6qgXXvBg+W0rMUaQshW4mdwi0UPyQXFmCLWfyQyNmEUQe80jb3/9jFiSuPoW5iqexbIpMIvEkmg285fvUZppgVKmqwEtRPRm9XUOc2tgbUumWRvz+xjKL19tUe7z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=msGf+D36; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38e97e73234so25378451fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779135796; x=1779740596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiJgbjum4jxo4zX9VgnCn31yV0goVxaYIj4uyBltCfk=;
        b=msGf+D36QGPX4Ec2wrtXvmY3rm4T1+tihRJeG3wlE/yYqqyXSCjPQS77ARYKcXIbbV
         i7CkYoEiNiyJALRwpb7w8WJ6O9vZU7C+83PckOxLULYd0cx6jSbr+biU4gmz3I7nYAVp
         WV17g3mgMZgBOnK8/4ounC0TLMK4r8tZQlOoc2eph0eQOdSWma2gKIVtiO1QXmnKq48e
         qnL5Mq5U1HaQoRlx6GM7otEUv0vw5xJJSLDNtQ+lnwN8EBDPna5Y98fCoicCtRabN/rS
         vILakx9gd0uX7ZoydRo38+KRKQMWT3yz78nf18wDxtLUmiWl/LAg4RLGEzcam88D2E7q
         1iFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779135796; x=1779740596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jiJgbjum4jxo4zX9VgnCn31yV0goVxaYIj4uyBltCfk=;
        b=rg4rFxQZzyK15jtv0GvbdglmkAaRTFrfmG/C3e675U4Yx/cYHJBgSGvwWCJEWwCsKK
         WXtE517sPupJ/H10qWwJwmEFgni8/6amnYFtpbi95pp++EltywJqwQQMUSVdd33Gqc0D
         fFlCxzETJg+Hrg/so+k+1p2L44d2b46Qhx7hQ5dZqYzbb2MM2TTZDcjV47a3y1QYsLRE
         hqPUuP/VSGm05WSVL2mxrBJT4lsA4GmRY7TcK45ulPCMRsNWorwVrnQX6XDTfUoWstJi
         WcmlUzgg//eYfw+V2xUKe4Klj6ZyjeD+EcQzOh0uCVHTYdXUMAnCGy3cARmVTmKTNFKW
         B8ww==
X-Gm-Message-State: AOJu0Yxe+cPWNKnwEF9/eBdAsO0CdtoNQzHPyaQO/IfT+o1d8Oe/YSWZ
	XbnKiIIbpqlMxgGRll8mMAjKe9ZzHSBo+DeSj13pSHZf303wtumzPIYyzFSC3dJ//6VVrA==
X-Gm-Gg: Acq92OGiGb3s6oEtf4I1lGGnpUDdpf9tOcIt3iCuhXNh3dCm2Ij56bp8hRf6jcDDfnv
	r9IhOSxRHKEOLDd7ufuct4Ov012F5LMfF9KSq3NBY2ELSempQM0KpawSOy/pkDm7QKMzPE5iyok
	zGZQtLPR2KbM2EjfWTPhst5NSLHBRYEJlb4wIzAE7dJ0f06k5gdjav/TZUVzWEHV78HwK6C+ixV
	052dPyZWCD1y2nvYZ7sVUJwQUuRgPxNm1tnmF3mdHYLayh0+NprKVP0NfzHVvZQePWjr6CsqHaF
	V+WKHAuRTySdtRTC7CuKE/A5sfpFNB3I0ZlF0kPQp7lVdTBoOx3T6RN2eCpknMq6dZ1nhYhn/u2
	PKoxapNuw6/RrTk71iozf4yfXltK3TQFmOcnsXNNpMdF2GLH08ffESfBY6mSwVqMaBfbEcYjczb
	v8VpQBfqbOYaPylR68XthqZddOIy+RR/83JN0GULWO
X-Received: by 2002:a2e:8a95:0:b0:394:635:70b1 with SMTP id 38308e7fff4ca-395619b0b28mr45511291fa.3.1779135795950;
        Mon, 18 May 2026 13:23:15 -0700 (PDT)
Received: from localhost.localdomain ([90.157.113.57])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395887b42f8sm15225061fa.36.2026.05.18.13.23.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 13:23:14 -0700 (PDT)
From: taygoth <taygoth@gmail.com>
To: linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Casey Connolly <casey.connolly@linaro.org>
Subject: [PATCH 6/6] MAINTAINERS: add entry for Qualcomm PMI8998 USB Type-C driver
Date: Tue, 19 May 2026 01:22:51 +0500
Message-ID: <f77068e556b6a166ef05f2758d61234a4e1b954b.1779127507.git.taygoth@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1779127507.git.taygoth@gmail.com>
References: <cover.1779127507.git.taygoth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,quicinc.com,linuxfoundation.org,linux.intel.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-108290-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taygoth@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 0906D57361D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a MAINTAINERS entry covering the new qcom_pmi8998_typec driver
and its device-tree binding.

Signed-off-by: taygoth <taygoth@gmail.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c2c6d79275c6..d2861fdef012 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22120,6 +22120,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/usb/qcom,pmic-*.yaml
 F:	drivers/usb/typec/tcpm/qcom/
 
+QUALCOMM PMI8998 USB TYPE-C ROLE-SWITCH DRIVER
+M:	Maxim Furman <taygoth@gmail.com>
+L:	linux-arm-msm@vger.kernel.org
+L:	linux-usb@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/usb/qcom,pmi8998-typec.yaml
+F:	drivers/usb/typec/qcom_pmi8998_typec.c
+
 QUALCOMM VENUS VIDEO ACCELERATOR DRIVER
 M:	Vikash Garodia <vikash.garodia@oss.qualcomm.com>
 M:	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
-- 
2.47.3


