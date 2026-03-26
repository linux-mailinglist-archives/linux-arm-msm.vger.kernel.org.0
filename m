Return-Path: <linux-arm-msm+bounces-100132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCamNLBkxWkn+AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 17:54:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC7F338C27
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 17:54:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2BB1D3012202
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 16:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 213F541C2FE;
	Thu, 26 Mar 2026 16:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Iaoa3MPD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED4E39B967
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 16:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774544031; cv=none; b=d0C+IPfVygF04+YjIKfAkRRUWMqGnFtk/w3Lg0sSBW2PYZDOsXabi+vacSATZEgqnCXX5z8yc/WLaybFGlLL7ttPW+N7wGH5eh7Chj5RpRD6IjmSZ5F1cA+gaGrdaNaa8U1vlwLJPdgEmK5pYDoyKkbeo0LuWaQmDxCdc1cX60U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774544031; c=relaxed/simple;
	bh=pht65ryf/SoqBX1Stz1wW8qdsgcvKRd5CptslYnA7iY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lwpJyL/FtRYvfJc/XUF60Ibw4ZoEclPXW1bLJgPPTa/+XS40J8Ak2ViFXvRxMLc6ZF7+GmhPF0+tSpSfRxIRJ01JdaNaYKb342bIDkPbCF9LpIIZQ+Lvhy4sLgn10G/M3kPLu0nOdpzBbBP9ypo5dYJvje8SWQrQvMbwe0Dr3H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Iaoa3MPD; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38a33933e99so738981fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 09:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774544028; x=1775148828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nAVgAAmxy5RyoDPif/eI17zt71kOAmun/HAkn9gip4A=;
        b=Iaoa3MPDyXSd8hzkOJHwYmn2iTi5e730lrXfpEUdK6KqXMZ27DU5GOsCQHtaE8Bk9/
         QX4/i1tFininsQC5Fy6FJscJGui1hbhUbFnQuz5hbuTJaLTeFgGSpSdIe2Y14h+jrSl1
         EVa+v1sgbhWx6jqSwrPfHekRLlZQmcQxkLJl8UCHJ4/6Q3IpWZLxrpuV76s7meRMoA+e
         MfzMt4GhQ8BoFbystngj+5DY/9y4xJeZLOuivUQVY9/La2SKQxV4OeezxADFhZXwTf4d
         hWVGACZ/549rU//maYD/w4Ye2H4GHJ9fAhKLN0h0UJzT0wfcRxmvp2WuZgInJ3QLcoqJ
         brMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774544028; x=1775148828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nAVgAAmxy5RyoDPif/eI17zt71kOAmun/HAkn9gip4A=;
        b=ZVqXN+28ZgFgMCbwAz0y9mdFkTFSZXOVN59zcQ7AiaKAY745//nxTzhYqiTgtEoFEp
         QYB4OsBo7/wl4WWJ08Sk7gy600zunxqNn3dlP5Lh/uZb/141rzf1wsc3GzKAF8kE7JYI
         EdXFi3yTY3pFUAi59ERJx72ymmQeNmoix/0ADhIKwRzLiFcCVq20CdUtEBEbF896yC7n
         Te0XuMLYXEorBGT2qf3jfWk3K8Lrv/+d1H46xuCF0RkEvE/0fZ/fClYLJ8XTBGgm988t
         4xE5BuxogrUWOJKWItpn+W84/kPM8aBznAy1UF/6ucWNvECypTu68ZFVdiuNVHJZEEtJ
         9JgA==
X-Forwarded-Encrypted: i=1; AJvYcCX+Wsn0Y+lxhMYArMmTdgO8DZiFBvgD41/YiYchKCc2qasQTzKaEKl6dKEY3xFMz0UlKNqBDuRZE5wsQ4lj@vger.kernel.org
X-Gm-Message-State: AOJu0YwT2ROwhsztobEZe46QvXSBFsMV/yCWUtLK6UCu/7esO514u2kA
	6UCFS0umi6ghcnOmTOcE0H/oS8qc7EmpVNe4qVZAaC21/dXxD1RUqXDgPzlZWxZJ/Ag=
X-Gm-Gg: ATEYQzz8IdWTlmQkzdEDqqpCdR82AQHISMOmthLtSsXfgCisnT5LKgzp4UVMrnqiKVT
	k2sA7NXPq+VZonFV6DjWWelbkNfxAgdEUdpCSF+CciIB+7O3hP8yT7qnvHA6/2GvqH2gq0kNyeI
	lkEOdMreFskC+mV3RN9KRX9ZCaQ8JPk/auvvRKjspfqlxrpU0X/uIL0qly7rRbgSsRdbmI55B4p
	T5/EKEB8j3kcPUzJ2iCSsHwe56/fAb3UfyfT+hOMG5N/unhmJBuHvFo6kH66FnOTDH0H6LgZ6tM
	3WPJGVxLKm+3mTSgGyfxRd3mZmc4ia5FDi/CJqS52y5tFWPKCUBprR7UVUftriVVH5HGU5o5txe
	PK7Ro26Jpi83wH9S0886+51UMM3/EMJOS+RTbmTJ9etUuKtXIewCsJBxAsg1q14o122aAkja1hc
	997k2eDkBen0z05sq/wSpldzoS7IZQ1VLZefRwVhpguWp1QzY8nfO5mcp/JMNJndQI3A==
X-Received: by 2002:a2e:ab10:0:b0:38a:4199:6b03 with SMTP id 38308e7fff4ca-38c432bd095mr13606801fa.8.1774544027588;
        Thu, 26 Mar 2026 09:53:47 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c52f84d94sm6630381fa.1.2026.03.26.09.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 09:53:47 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Andi Shyti <andi.shyti@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] i2c: qcom-cci: Remove unused CCI_RES_MAX macro definition
Date: Thu, 26 Mar 2026 18:53:45 +0200
Message-ID: <20260326165345.762807-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100132-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 6FC7F338C27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Trivial change, a never used macro CCI_RES_MAX can be removed from
the CCI driver.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index e631d79baf14..7f146d02e5a5 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -71,9 +71,6 @@
 #define NUM_MASTERS	2
 #define NUM_QUEUES	2
 
-/* Max number of resources + 1 for a NULL terminator */
-#define CCI_RES_MAX	6
-
 #define CCI_I2C_SET_PARAM	1
 #define CCI_I2C_REPORT		8
 #define CCI_I2C_WRITE		9
-- 
2.49.0


