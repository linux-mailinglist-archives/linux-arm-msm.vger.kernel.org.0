Return-Path: <linux-arm-msm+bounces-90259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DxOGvt8cmmklQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 20:39:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1936D1F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 20:39:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FA92304C375
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 19:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E21395726;
	Thu, 22 Jan 2026 19:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UnQvBSPw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695A2325716
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 19:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769110486; cv=none; b=nW2R9Sf+KQwV8zfNc+zxZgNCA47OBEjYA1ycriptNk0dwpVF3LrnE2ZWWoLAXP8mbGbu5fKl8tILAB6uPSaUog4bGThpcHzKesdc2CkuLcUCAX1n6PopZvS1zxmX8/InrU4WffD9vmX/GWxdZ7D5QGAyfxXttc/CkpcCydgl4BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769110486; c=relaxed/simple;
	bh=jTd4MTqmMNO3vH3GBJWQVldpXyq3xREZZ6+pJ2KLIaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sm75kxVymxyGCoFpbiJACuK3pvY4ZifLmiDbDv8H9bQQrfl2CDL4Vmhsbl8YSr95AHy/NZAc9RGNgk3V2a2oOWGSFrTm1pwTAADu/vxY7GH1Ggs8muE+di9acWbSlrHJleKnq3wrQeidTp8KfukdKchLZBhOw7e5hgGQSoQ6JM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UnQvBSPw; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47d63594f7eso12628275e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 11:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769110474; x=1769715274; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vBXXzdoTJkB6zREE7VZrROs0/EXufGyyyFOZL5fXDdA=;
        b=UnQvBSPwithfNhue9HQBGrT6Y4x0nK439BXNE7wVBhxoyBV8BbROSxQD4iui7aooaF
         AT05chRiYQhDeF1PStcyAShk90pJQskEMi8TT1Rv3TK/DRSFQiC8+Xg65C/4zeSf2XoB
         Xc0dR74HkXwDRS9FEw8SVz6+57Aq0FZZEH6kYUo2wImJ0ys1lUjEmJCMZDtzrUQdRCSG
         XLAvFhB3DIgqU6QhQCR5DT/+4W3DVvhX8Y5vaawQ/pOwvMhzMM0BrDg/43e7H2YXvk5H
         5Z1QvtYrXwxYTGn6M+Xz7YFr7Z9K50KazaScEjIFm/c8e+asXcVllQJCEN4ptNhDQZD1
         s24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769110474; x=1769715274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vBXXzdoTJkB6zREE7VZrROs0/EXufGyyyFOZL5fXDdA=;
        b=pOlvJLOfQm1DnHIIyqYPOV9Pn3f3oMFElT4vBt0pOCv4WpqsGewHCvguYxgC9wu3/9
         U5Qqq10Q9O8uS1I/eCJkZt0A2W6igt1ZCvtVVA/ASEFDvdmAIKFQjN+ll+n+Dxmn98Eq
         sJqou4jPBQuUIFa0/ZS5EeL1cZ1o54B/7341lW/HB0+EK06ZUQ8W7dUm/ryelSJQtkmK
         yoqQTJPukfTspTcO/a2Y2wJzUkITDxvsUYM37r75cKY4wxUhaaOgIohnG0UUABruAdNi
         ftrmVIhH4jWDjW+o7D/yS9nTDt5n95pAx0N7b+mACwCgiUOxC+/tM6Nt1KXF7q1q7PdB
         BR+w==
X-Gm-Message-State: AOJu0YxZ8TT3+bwviOMcSF0foC8irYWpq+FEpiKWIWLOZy2T1JeDH5Xj
	RwK/EOMO6P1nMl6kein4B/tPAzyMnFG7vHcAyCuP+uS5gWaxsfIA/Goo1I7EUQ==
X-Gm-Gg: AZuq6aKEMowh1UbirCdixklXvM8j4P6p8HsXH4U9Ig8H9gzwuxJ0AwFzah92XvegYFg
	kdY7zb9ajSnF356TJEvQB5sv1JxSZ0b8XcUg2G+YRfViuwZy0mirtJFlc0eciLIaRV8eMtXHcPF
	1Jd4A0CYvKWb8Yfj+wptnWfXc5/GuIAi8sbZZd9qzAEX48HdSDLlnuD3j6ZrbOj0DHyDZB1pVPi
	sw9WWtBFcTyEA73Q96qXSM0k0pTGOtDkOA2OUBWuEVTxo7e5Kf8CnpVwHyigx3bAbGwXzTMRnxw
	XMx+sDHhsUVkFNmKknW8pwqVz4ZSRrygeMjdDP5D9l2paVF7n/bwYUWdBtMIOzD2nPts/688zkR
	HQ4i5S2GMIyv0IpWPK0hcRULy1g0loveJP6kqa0kUSZMluvGg2P33kZGvviYL7MqcCqSbnXb8gw
	dHSeNOWD7ghDJEr9Z3CPY8H7RQhysiZd+WsBTkbfKsSio9wLqHF6I=
X-Received: by 2002:a05:600c:34c6:b0:480:2521:4d92 with SMTP id 5b1f17b1804b1-4804c9af7femr13146905e9.24.1769110473766;
        Thu, 22 Jan 2026 11:34:33 -0800 (PST)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-435b1c02dd4sm853240f8f.5.2026.01.22.11.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 11:34:33 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 22 Jan 2026 20:34:22 +0100
Subject: [PATCH 1/2] interconnect: qcom: smd-rpm: drop duplicated
 QCOM_RPM_SMD_KEY_RATE define
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-icc-qcom-dupe-defines-v1-1-eea876c2d98f@gmail.com>
References: <20260122-icc-qcom-dupe-defines-v1-0-eea876c2d98f@gmail.com>
In-Reply-To: <20260122-icc-qcom-dupe-defines-v1-0-eea876c2d98f@gmail.com>
To: Georgi Djakov <djakov@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-90259-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[j4g8y7@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AB1936D1F9
X-Rspamd-Action: no action

The 'linux/soc/qcom/smd-rpm.h' header defines QCOM_RPM_SMD_KEY_RATE
with the exact same value.

  $ git grep -nHE 'define[[:blank:]]+QCOM_RPM_SMD_KEY_RATE[[:blank:]]'
  drivers/interconnect/qcom/smd-rpm.c:17:#define QCOM_RPM_SMD_KEY_RATE    0x007a484b
  include/linux/soc/qcom/smd-rpm.h:52:#define QCOM_RPM_SMD_KEY_RATE                               0x007a484b

Drop the local define to avoid the duplication.

No functional changes intended. Compile tested only.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/interconnect/qcom/smd-rpm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/interconnect/qcom/smd-rpm.c b/drivers/interconnect/qcom/smd-rpm.c
index 8316c87a2c60f5f99edece3443cc60e9e75fa11f..dbc7ae50b02b7948217c856e3b1bee53c56f46e3 100644
--- a/drivers/interconnect/qcom/smd-rpm.c
+++ b/drivers/interconnect/qcom/smd-rpm.c
@@ -14,7 +14,6 @@
 #include "icc-rpm.h"
 
 #define RPM_KEY_BW		0x00007762
-#define QCOM_RPM_SMD_KEY_RATE	0x007a484b
 
 static struct qcom_smd_rpm *icc_smd_rpm;
 

-- 
2.52.0


