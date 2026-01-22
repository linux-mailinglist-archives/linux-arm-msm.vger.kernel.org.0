Return-Path: <linux-arm-msm+bounces-90258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCmnG/18cmmklQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 20:39:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 094E86D208
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 20:39:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D377304CA74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 19:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7C11395732;
	Thu, 22 Jan 2026 19:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtrpSa1t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF75A3590C0
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 19:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769110486; cv=none; b=PwsBq+/spFqfv4I7z2UQgfASRjJvqIBn5AW+Te4MbWVwtOhJsdsg5GH4+C8SS64jnk5DUatFHQCigAtIfENv0bsHFQc9iMQ9UVWCBZbP2W5AF7J3Kogl3N5gnf7HogfKj7m+QQ8AZzAwuzWWeBkOExsn3gUBcINdbLE9+4Mgk60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769110486; c=relaxed/simple;
	bh=CrxFUxr1mrz5eB+5MqEJWwahrvuI86sk5sMY/Qw1ky0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E/oRUgxLmQrUPEtJN05TOUJnx+/C1a7KHFkhGr7ewYgHfqc2y2IW1m6zeytHYAHQndslKTtuMWx32v2v5TbgjX7CAIvGGvJSMjMSYWr+vAZEPsRYmVPmiF6e91YEhEeye0StK7b6UuXBJYl933FWf5nr9/9JxtNZeBHBJY15lIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YtrpSa1t; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42fbc305914so1212579f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 11:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769110475; x=1769715275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=To9ayxXdRoh6y4Rqdir3oO1ZDYFf362lQecdeoxQawk=;
        b=YtrpSa1tOHvAIhwXezVvbv+2yGsAWg32ptxd7qkTuXtcfJ6oLBBCKJj+sso+3sdQTz
         BYPnhfxBRea4BQn0KCe4GMgqJGzEWy2n32IRNG42535L8ivM0yapNuaJzO8luQVrWFyG
         2rF5t0LCqPxTyQwF+iRLWxpw0hGy1og39zsHzF7qkz86I7abdLOcnwqJRs24sC+th9BT
         Yu7gKzOUyTCYANBlHYqT8yfQuHtCKPhVNNLfSV4zz8MqWExv63mQP7kHaqpN+on0f+yJ
         cTNxSBxz6rwtomoiSlSosTGfUJDn4og2oV/tqPy4BohHX8YtY5j2LnH/tf0f008Obq00
         SeLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769110475; x=1769715275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=To9ayxXdRoh6y4Rqdir3oO1ZDYFf362lQecdeoxQawk=;
        b=IGGqK15xt/3leClJSADLPqHqQRG4NBspteLjHcG/wLRYF/bNNt9sNP7RrCY4hl0wOJ
         HJ8bOl7e/T07WN5HTkixqSTygP56eg/BjVUZhwEH4zcNoLkn0TjsL0RqokG3T1m4Zaz+
         7Z6ZOunb0nH9qTv+9c1D9WCDehdRJB2eDBnITgXe/kOLTdqtcepo8tp78uO+bMMGY4NF
         sHCEebuQGS8kzcUX3TI7I8nI9/lwtMpxSJQBqNEmFxTi1zENeHrhZbuyhYZOEWgHmxkb
         HMxe+yBYvun50lceXuLEPf4am4eAEL2aexllRTM3g77sJA5cwvGKkJ7N3fLXh67Ggv8S
         35rA==
X-Gm-Message-State: AOJu0Yx2K6fQBbSoVNGYrsHFbUovu/z2jdBQgrcob1+5vHk4PjYqlS7V
	h4ugnF6ZW5hT8YfVaYJgGgVkkloefejtTPgA3wcaIyyC13MJi5kcb5ETqPWoFw==
X-Gm-Gg: AZuq6aJ/ujoeuIQtSUtOLVLFDCAK2dYnsqL7CuSKZdgvx7fh4ac4l7ISfMr+NkQqg+U
	2Wr+Ps6YKiGXMfNo12OaSco1GnK2nCa4xFUmfOUAQpGFGcBOThUNSmR1eFiwjXiZ7wUUYYVdgMs
	q80HUJS6qPiz/p9Ev2V45HAeUsWJQPxwm1T0rF8hs3JMwxjTdMvBzOYp4S8B9lgEr1Vg3xbp3fm
	C2fWjKnGb79833FDgvdhExVq+3HIiVDPM1nByO8pjcuuQ6Fohv5Xxl4AWieV8YtB5h+nxRiAqAk
	tD433yn0im9gGQMeY8j7Qh3woV/MLlHrmQC9izPWi4XJFC5cBzGLeP4piwRCnX7zqDJq5mUDrRy
	muA+Odsv5U7a6oRl9DKZwFIkW1u0ZR1g57NBvGbvypDQ+WYxGQD+9c5KRFSV/Ces236qgMkHFqk
	SlutrLn1iNRn7oEeau+WljlsrAAIzGPL30sW4Lwuks
X-Received: by 2002:a5d:588b:0:b0:435:a464:f468 with SMTP id ffacd0b85a97d-435b1606246mr1084984f8f.47.1769110474677;
        Thu, 22 Jan 2026 11:34:34 -0800 (PST)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-435b1c02dd4sm853240f8f.5.2026.01.22.11.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 11:34:34 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 22 Jan 2026 20:34:23 +0100
Subject: [PATCH 2/2] interconnect: qcom: msm8974: drop duplicated
 RPM_BUS_{MASTER,SLAVE}_REQ defines
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-icc-qcom-dupe-defines-v1-2-eea876c2d98f@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-90258-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 094E86D208
X-Rspamd-Action: no action

Both the RPM_BUS_MASTER_REQ and the RPM_BUS_SLAVE_REQ constants are
also defined in the 'icc-rpm.h' header.

  $ git grep -nHE 'define[[:blank:]]+RPM_BUS_MASTER_REQ[[:blank:]]'
  drivers/interconnect/qcom/icc-rpm.h:16:#define RPM_BUS_MASTER_REQ       0x73616d62
  drivers/interconnect/qcom/msm8974.c:176:#define RPM_BUS_MASTER_REQ      0x73616d62

  $ git grep -nHE 'define[[:blank:]]+RPM_BUS_SLAVE_REQ[[:blank:]]'
  drivers/interconnect/qcom/icc-rpm.h:17:#define RPM_BUS_SLAVE_REQ        0x766c7362
  drivers/interconnect/qcom/msm8974.c:177:#define RPM_BUS_SLAVE_REQ       0x766c7362

Drop the local defines to avoid the duplications.

No functional changes intended. Compile tested only.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/interconnect/qcom/msm8974.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/interconnect/qcom/msm8974.c b/drivers/interconnect/qcom/msm8974.c
index 469fc48ebfe94d9ebb723132564583f4790d4850..3239edc37f02f20bd65fbbcb4aa48dc7953c7c09 100644
--- a/drivers/interconnect/qcom/msm8974.c
+++ b/drivers/interconnect/qcom/msm8974.c
@@ -173,9 +173,6 @@ enum {
 	MSM8974_SNOC_SLV_QDSS_STM,
 };
 
-#define RPM_BUS_MASTER_REQ	0x73616d62
-#define RPM_BUS_SLAVE_REQ	0x766c7362
-
 #define to_msm8974_icc_provider(_provider) \
 	container_of(_provider, struct msm8974_icc_provider, provider)
 

-- 
2.52.0


