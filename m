Return-Path: <linux-arm-msm+bounces-114788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QCt2F81bQWp8oAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 19:37:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A70006D4900
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 19:37:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=etehtsea.me header.s=sig1 header.b=YXtjRiYA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114788-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114788-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5F483021B27
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 17:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A245A2D73B9;
	Sun, 28 Jun 2026 17:36:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound.qs.icloud.com (qs-2006e-snip4-1.eps.apple.com [57.103.85.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5B52BDC0B
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 17:36:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782668200; cv=none; b=Aj8Ius0Aksq/wAcyRObo/Kcci7o7GC68+NDvySdTOZ3/EwEv8DmNljYLFsIZZkInLltfoaiAqrUjaaYTq1gRvje9Nzi1xCICaahFEZn0KUHc/8Fs4lMUnBQ3cd7Y40LquUjzmS+KEzgZ4qqElXjI9kbguO+vJJx9IozQLzLKDek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782668200; c=relaxed/simple;
	bh=l9QTiFilDIn7JPYkYIDGEiNlq34X6Ld96R9qDh1I9No=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nR4BytUF5DcvYYBUeXUdRJb+o+f4N9+UHtzxvvXAOH5DpTPSbEMdNJYRLGApIysQKTL7yZo02Hq89R2A1iMbKYzpCiu8u2trkENNBCyJNuLljFbAgBK2hE+sB0XoIJ1zPGz+4/ysZR3UfAp6+KjM4RYxyVPldHpAWkmEGdblRKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=YXtjRiYA; arc=none smtp.client-ip=57.103.85.172
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-100-percent-7 (Postfix) with ESMTPS id 956D6180061B;
	Sun, 28 Jun 2026 17:36:35 +0000 (UTC)
X-ICL-RepId: 019f0f4d-f6ed-7f81-a1b8-ea885d31d25c
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQtJBEMGXAVeDU8dXA9fEhVdRV4MXgdyFU0dWxlEDlNeVB0TC1NWVwRcEEceUgocHVxYQQ4KWgJQUR1fAgoERwRbF0YDU0VDAxcRUAFYHlZeWhdeTUcfQE1iSQFaGVscQBdKbk1TDw8VTR1bGUQOU15UHRMAXg8PTAtIAVsHXQBICE8BWwNbHEIKSQVaGlkfHVgRXy1SH1cYTQtWDBkGV04ZDEodUlZRBUoMXABoD10dWBFd
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1782668196; x=1785260196; bh=8qhWEmWa9c5bN8gZc9nJPSieeNw3dWEH3UMfOnNnQEU=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=YXtjRiYAGwAWOi12ycknTSvNDq7y271d7AQQmPcnfxUWe6IyIcJdhVoCMPGGNR3byIWa7+hfV+47KhqUuIAzIyfTAHj40BAadbpQBwwcQMD7TSCVlblUws1eVex5JjfpfoRcWSLNCGSAhzjLNSyp8nlPGyVHDJT7gvGZzlbNnygjgrmktxy8nqPLa0Eh8wVj2XsILATa+Pur4rUgT9KhXe0Wvf8hioB8RBXOBn+HhP9Q79GVBHNSmZujkLPI7p/KyfjcVnPsisXI4OY+RiPxuzbt/Rnrd1Rw+hAwPdk4GoYHkWR+V7THhxUW2OhZ0p/Hv9XZ+SrWNEcSDxEZC2+IhQ==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-100-percent-7 (Postfix) with ESMTPSA id 947781800289;
	Sun, 28 Jun 2026 17:36:34 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	valentin.manea@mrs.ro,
	Konstantin Shabanov <mail@etehtsea.me>
Subject: [PATCH v5 1/4] dt-bindings: vendor-prefixes: Add HONOR
Date: Mon, 29 Jun 2026 00:26:37 +0700
Message-ID: <20260628172640.23167-2-mail@etehtsea.me>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628172640.23167-1-mail@etehtsea.me>
References: <20260628172640.23167-1-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE1NyBTYWx0ZWRfXx7q0egoymnSj
 rrtF3IPEf09yd8tHqbMJGxlB+lAJPYB/KHxT6oS5V0gYEbc4CR5Ek8ihCxCt8XLLtF39CXzbRhm
 jsGy2sWsTZZCwJYMIyQ1MukKPonrWuRdN3enDWJQRkgcOzlWj0QrBf6BtSTXZGIrj5Qb62lk+Ee
 IIAjDsFM1AzaoKPnPi0jqOnr7DEXx8or+tIKhgvCaQH+RY3KW/wxLESn/969qu1RIs7a+mzLbLg
 yl8FxZZXxHtB8vHdiX+6f8MbbRzZa3grGjGGYGJhafXpwhDdZBSRP5lPz7lbo8UJa3DMzD0L8rE
 8OTRix6CLaNG+CAJatV
X-Proofpoint-ORIG-GUID: VkpOtQC9yWG6KBNkG-h62YPiTxfGm47j
X-Proofpoint-GUID: VkpOtQC9yWG6KBNkG-h62YPiTxfGm47j
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[etehtsea.me:s=sig1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114788-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[mail@etehtsea.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:valentin.manea@mrs.ro,m:mail@etehtsea.me,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[etehtsea.me];
	DKIM_TRACE(0.00)[etehtsea.me:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mail@etehtsea.me,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[honor.com:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A70006D4900

Add vendor prefix for Honor Device Co., Ltd.
Link: https://www.honor.com/

Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7..9ca2508f531f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -735,6 +735,8 @@ patternProperties:
     description: Honestar Technologies Co., Ltd.
   "^honeywell,.*":
     description: Honeywell
+  "^honor,.*":
+    description: Honor Device Co., Ltd.
   "^hoperf,.*":
     description: Shenzhen Hope Microelectronics Co., Ltd.
   "^hoperun,.*":
-- 
2.54.0


