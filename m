Return-Path: <linux-arm-msm+bounces-95480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLg/KnTPqGlIxgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 01:33:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9B5209768
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 01:33:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD8F2305EE81
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 00:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0429A1E520A;
	Thu,  5 Mar 2026 00:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0Mx2Vob"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF67D1EB9F2
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 00:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772670812; cv=none; b=B1i85UIM2v9xupR//iICTjkZ4e1ZUj+ZExlzKjKuRkeydYTF+LyqcYgWhuh0r1/NRPM0+HA3MKbTSje6al4EjLgi7Tu2YoBixeTEHfbzEhF/3e2dml+XkTYZ5DtcBFN0vt9GZ//qiVrJSq57jXVy5ih0KWlvly89oUbiiqDKuxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772670812; c=relaxed/simple;
	bh=hb/cStWwgMoJtjIPOyJ8b2rzoiwM6AlB0L8NcvGTri0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kBJHI4OXSS7gn8NfeTeIu4rNO65yfGNeYVLSi3/OSD2rx+lDYsHBKVT0xiBycj00J1ZMPUrsC26nqoCaD+V9JV9VryK4KlsUrShWUTh/FvJg4J5j2sIm7HJdNCeA4rafjeGhOFCOhi286LSKQkwUr3v0Cs9uIrpCHaYzQCujp5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0Mx2Vob; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7d4c12ff3d5so7564383a34.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 16:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772670811; x=1773275611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dO6/PAcNzwOa7Dt8duIwo+5/9N6iahdFoKK7CawFXAQ=;
        b=T0Mx2Vob6byT31Az9zVHK1jy1n5BB9B5JYzve0iJCeAizL28vPWVHvXXrxN/izQtiz
         VxTwzkAHm+zVUHYL87jnylmnJHLH10agkiJ2A99Lkul7SAQ9TA4OqECnnjGLp+adF5Ch
         TavIbaskvs3sEIc8ECj62BU0wtOf7kLs8aZohTS4D3G8nAzIWe/Hv5SboxgfIXgpSOkD
         AeyQgg1JoPl1HENKi0YsvXcEdrHtO4PSXXK6Ryo4Gvbv3+pfauB88Fi00gx0c8M7hD7I
         qup2FoZLs5ZIibod8fkFpp4Nf3ny74+ctQ90PAe0zIvuHAFQemQ0CdGjKE2mM8qoCwfj
         dn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772670811; x=1773275611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dO6/PAcNzwOa7Dt8duIwo+5/9N6iahdFoKK7CawFXAQ=;
        b=ns/dAvXe9S7Ra8lUQQWtYmCIslmHefF2A89hnS8YPILRr3UwMSPwYYx8PgSuhFeePt
         PETTOz1y66hrJE20JQ68whYIuXmIOowfHRAZacXGfYhxz8BS07QsaFeJ697L/+JAvMPQ
         OpiNZruYQp5ZqGkH31TodB447QeQDLZPxkATKr6/yuDG+apsOkcQne+qlz7tGq2aaH8o
         0WD1xoEfVeI4hht+jHGE2qQrEycCUVtj+7vq+ZqegWAdlwO5DE3uktlqon9E1ipnkti3
         96mzxElRNiwDMMvm5khciT4Xp6e/hz2R9iGl04zuRl/ynR6gCS5fXTSswvrFCpBfJcrU
         C3qg==
X-Forwarded-Encrypted: i=1; AJvYcCXg6wkwS/0Vv3dKvElp39VUpN7TsLBI3nZzZuHVDHCicCuQXShzQEw1pj3mLzSRJR+nNZsymE2FDzM90lPI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6JaI3Lf+eKWLS2zAaymiQCcJiunZd8NaMuOqzGBeqjUI41s+w
	MaCQc7t2BZMUXQa4EsFWVwTpk8zTplZXmEkAbUPnb+oVgiL9kTqocBXA
X-Gm-Gg: ATEYQzwLpX4JEGLOq9R1e/FasZMRlEIqumGzlxMIpfR/eorKvYYD776/G4tflTJP9+v
	hDPcRv8NY6VFeb27W7KKKMKA1X5SPbVQhnbP0wN+b8czBp7FWdPtOiKwh4gxsu4wUZQ6/5PYVk0
	J5KHSs0tSoxkOplL4yDm5w7o1zhVlQ7gHNnBeQkMdpZhcaDZ/5s4je0sZKcEP27zSXOev4LiEES
	5fNjGkajdkZ8DNXzyEFHs+agfdgk1rt35F1E2Q8L/+9VbPASr+73jFOmafGCXxRKpB0hft8gPM1
	0ezeMOBSqx4f6/JfAWT4+4Z19TAGZOD8xLasQhJ+qsLMfXEoSpIuW35yDlfmBTPC1/3q2qc8EeW
	QGL4/zPJnczKAUfJOf7YOqlVm+9rlZXWRN175yj8hzGJ1dOzoo6BiDoLew5eHVMKnvq8WQP5QpW
	UXxjzSwg03BfI6/IygN599RZDLDuv/w9kfJozFG5d6yuipD0RV6sz+eystR1RjdlAYyAsoswM/s
	elJd/GW4weZdfU5LnPR6AP4EyRQotmd1PR5YZGopA==
X-Received: by 2002:a05:6830:6185:b0:7c7:18e:913a with SMTP id 46e09a7af769-7d6d139f75dmr2154983a34.19.1772670810741;
        Wed, 04 Mar 2026 16:33:30 -0800 (PST)
Received: from framework.misc.iastate.edu ([2610:130:110:25d:2aa4:4aff:fed7:9b19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d58644dd17sm16633834a34.5.2026.03.04.16.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 16:33:29 -0800 (PST)
From: Kerigan Creighton <kerigancreighton@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	wcn36xx@lists.infradead.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kerigan Creighton <kerigancreighton@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 2/3] remoteproc: qcom_wcnss_iris: add support for WCN3610
Date: Wed,  4 Mar 2026 18:32:52 -0600
Message-ID: <20260305003253.1022386-3-kerigancreighton@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305003253.1022386-1-kerigancreighton@gmail.com>
References: <20260305003253.1022386-1-kerigancreighton@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3C9B5209768
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,lists.infradead.org,kernel.org,linaro.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-95480-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kerigancreighton@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Add a qcom,wcn3610 compatible string.
The WCN3610 shares the same register configuration as the
WCN3620, so its configuration is being reused.

Signed-off-by: Kerigan Creighton <kerigancreighton@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
 - Move remoteproc compatible string addition to the middle of 
   the patch set.
 - Add Reviewed-by Dmitry (thanks!)
---
 drivers/remoteproc/qcom_wcnss_iris.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_wcnss_iris.c b/drivers/remoteproc/qcom_wcnss_iris.c
index 2b89b4db6c..e58b59355f 100644
--- a/drivers/remoteproc/qcom_wcnss_iris.c
+++ b/drivers/remoteproc/qcom_wcnss_iris.c
@@ -95,6 +95,7 @@ void qcom_iris_disable(struct qcom_iris *iris)
 }
 
 static const struct of_device_id iris_of_match[] = {
+	{ .compatible = "qcom,wcn3610", .data = &wcn3620_data },
 	{ .compatible = "qcom,wcn3620", .data = &wcn3620_data },
 	{ .compatible = "qcom,wcn3660", .data = &wcn3660_data },
 	{ .compatible = "qcom,wcn3660b", .data = &wcn3680_data },
-- 
2.53.0


