Return-Path: <linux-arm-msm+bounces-111742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wD5PF+h6JmqRXAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:18:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D71F3653EF2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:18:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Y2ssxnLf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111742-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111742-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 307053014C49
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 08:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 682DB3A961B;
	Mon,  8 Jun 2026 08:17:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071423A718D
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 08:17:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780906674; cv=none; b=an9Lk3pZcoYmYfhIAZp2Iavsq+2PC9coTTFklVGbktnoB3LUb8YGfduuk+5b8hhPOGMawlw9LHRpv9afazEKwvCsqf/dixLjqoIo4LF4JU1q+CxjoJDtVZgNDYf2aEPdKXsq+OVgxmMdAYtA5w+2q48bCQXuYNxP5QSK7DTXuvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780906674; c=relaxed/simple;
	bh=40ZxnyrUaAHdcI+eTW6aNV5PfIertlPm7WF8EsDZzB8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g4qgwg9VH+uJwz9oYLwcF55MY/7n7QHgz4Vxs5lA4qLHi7MSZWZ1AZoU3e/3GEdbMokQO9JYW6R2ET7EHOEEi9H8E3iVf4pWyemn6KzhvMA9GMRUZXXmMQy6q6yTLC24Zv8+yfa/IgFQNodutvU6XPOVTs9jFZ/KrGOyRfIgNAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2ssxnLf; arc=none smtp.client-ip=74.125.82.65
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-137335bc3caso4734463c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 01:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780906672; x=1781511472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12KJd8jmEDNc3peQBhWeVZHFv/dyQimGIps+u7jJr2M=;
        b=Y2ssxnLfDWJhLo6docOppjn2apJEyLp+mJOeh/XcEOBlSKnZ/Hy2LYtSik6zNlBfer
         R1Xxm86NG37KKKya1g5MZCqao0p49ZzMSxQUP7VsAM4JIHrPebd2XBkdcxKBA7n7LlVU
         d01YllFyKazgebpmSovIM2Nl6ZyNUPmvgimqyFYfoAnCKjCXVkdkbOQy2G+OE7d0mql8
         OrBOdVGPgxsa5TRFHQOvEzo4fG9AXCZajoLcKMb0fqhT04Zd41ivSMjgK3DLE7+/kR4d
         31luDdHY0sBOuJ+xHVEmzpuTWhwleLCVq+29kMfXbdFkIJR1257XTVOzzHCA4lo50xIM
         uogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780906672; x=1781511472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=12KJd8jmEDNc3peQBhWeVZHFv/dyQimGIps+u7jJr2M=;
        b=s65+upzF6I0A6AcPjtoJDRdbE7Hb6X4uxYbdk62Hj+qKr5Lyb0jDgm3J4nyGB1tNXt
         +A6oqJ9CGK9qrPH/kqivBlgR29++Opl3Zx3MuCHaefNM9loTzLXdfkfO9OhSpZ6sLPHd
         Fp1FTRuxBG9Kcfh1KsfCQDQC1YUUkyFHx63u7GJj/XvaYplf46HYZkxLoWk9bHosXtVD
         eBIFdI03cBCmGIvpluvRvfQWv0ErU7Yl00X6/jco/bHxKUJM6PUH+n9ZxV8kickMV2u4
         AVuOPrZqASTkI2MHStwTTNqESQt7lHNv/P3kWT8tkxvlaW+Ujcd8qG+WztzhXgv9k2m/
         DE0g==
X-Forwarded-Encrypted: i=1; AFNElJ8vW+fQcJZmEspz9//milKQg5/Aj0K99rKmzCxRIBq/RkL+krBfEFNnXt0kv2kHksFYG8XxNpoWhKWacfHL@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4zx3onNORbc816rOcyFROM/dbBzJhru9eIKr4ZyYe/WYJ65/i
	YWz17miC18UmzmtaULLlEFtPMZFiS80D06c/jPQmO21yEvNrpU2CuH4F
X-Gm-Gg: Acq92OEbuPUvxpX1YdU72ktlB48J2wka2x42deg3oZzL2+l9yq/CvZIODOMsM6oh9oE
	tw7j4uQZ4Vgsn7iK1ZFG78rX4ORcaW51xOVHHKXm0thM8QN+tJOI/BTqlb9NwDn/qkg6XezV1ok
	9iG/puhtAKbGq2DTLMUQ0BGIp2EU98B8GQtWghuqtzE2jnJ+KsJyxS8QG5JipdjDazZwLHu6pkf
	NuwcQjsREMde2Cx1sqmLTlTdEI3aSpgrJhy5NTV9aXZ6m4m4qeEcXfnH1lhX+IKjf0/LUeN93Av
	EQzTHYdrjQlKnuW6YG0aOXGbORCZ3YSb01iw0kEdpurnHzW6vZAohND3bhznNg0NLz/rSpVi9Su
	DQpwzRsqyzwF5QYZ7QtpLEiY7xcpXtu13wEQRv9dOM+wceUhQ0dy/q6CYSQsCy2r7YVqhaJmjjr
	2DiLsFDiF7joRoh0MshL7lig2r2YJJIyzo31viWDhTpHZfs5MKJeLU+YZAFzrTq45jfQ==
X-Received: by 2002:a05:7022:98e:b0:136:b370:64c5 with SMTP id a92af1059eb24-138066fdb24mr6558060c88.30.1780906672171;
        Mon, 08 Jun 2026 01:17:52 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-138063de4a5sm7678245c88.13.2026.06.08.01.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 01:17:51 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	busanna.reddy@oss.qualcomm.com,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v5 2/2] media: qcom: iris: rollback OPP vote on PM resume failure
Date: Mon,  8 Jun 2026 08:17:21 +0000
Message-Id: <20260608081721.82846-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608081721.82846-1-dennylin0707@gmail.com>
References: <20260608081721.82846-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,oss.qualcomm.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111742-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dennylin0707@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D71F3653EF2

Rollback the maximum OPP vote when
pm_runtime_resume_and_get() fails in
iris_enable_power_domains().

Use a standard rollback path to release the OPP vote when
power domain enablement does not complete successfully.

Fixes: bb8a95aa038e ("media: iris: implement power management")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/media/platform/qcom/iris/iris_resources.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 6d3339423eec..3e18c6998f92 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -78,7 +78,16 @@ int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
 	if (ret)
 		return ret;
 
-	return pm_runtime_resume_and_get(pd_dev);
+	ret = pm_runtime_resume_and_get(pd_dev);
+	if (ret)
+		goto err_opp;
+
+	return 0;
+
+err_opp:
+	iris_opp_set_rate(core->dev, 0);
+
+	return ret;
 }
 
 int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
-- 
2.34.1


