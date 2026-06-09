Return-Path: <linux-arm-msm+bounces-112120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y9W7GbnrJ2qC5AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:32:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF39B65EF43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:32:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jFT8E2cO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VBmY3UFw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112120-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112120-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF22B30475F3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 10:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA2343EFFC1;
	Tue,  9 Jun 2026 10:23:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9E03F1650
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 10:23:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000590; cv=none; b=YWVAUIOJU4UIQEfxr5aB+sbrneOEv9hgvxJDBw79rgU3LjeJaCWIutoH+FsfcgtbTQuGa4Fpsp+8qpvNxeO5GDdT6x7cgY5CIKB9N5rs6Q3d0vxBnKlfjEG/jbuYqQ4boT8e/ii8uQdAbi0e7YaxwkAMAtHc/jeZJZsiRkTKRsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000590; c=relaxed/simple;
	bh=uXwyXvuaQR7b3/fi7jqzH0GQBWBRgTTMqz4fddg0ZkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JR4YVWCOSrrhVDM8M+fLQ+lFWbO2YVyHqFZNC4lRsxFapks3h7JjCG9MExGObqX6oMjzqX6nxXDfQTsqJUSVYS2ztTFunfVezy3Zo6NnSncrllM9mbZPxV/hfAtXrqQnof/QHat3D0CA30vBZetsgcneS5I/l0iPIZ+8KdWtUaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jFT8E2cO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VBmY3UFw; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599vDqt1800481
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 10:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=h55UH12lvi5
	qvyEigfzQK2YfBNXbPcu1QXY1N2+KKxs=; b=jFT8E2cO0n5l+K+kyNE9tMAtkO+
	VJGvA9nZnxZoyZfOdJGFtLAfBqiYwmhAHrtJNfXOiCl3hHbg/zO5B2xt5MJFuGtG
	tAmp8W5ojoszhWGOcBIqDmh1U5SgK1rbEdFddP3NkxsbGv6TbtpuMgFH6fZdbax3
	sKF12ckZ9P2OKXr5VLGvtkP8Xqkozy2BAV1tFcZlJlN3FN2eoymskJxnwSCXgLEu
	sRuo7BdrOEXFTGdxlzQq9z435xh8TU1YbFviag5kf9CBkWLmRiW06058Blj/RbqY
	CftS5gyqFsm8vdtZX7H5kxZlT6Ilwp7xEoDJC39eyv6xkPdAPH/Ub2KfXVA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenr8n3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 10:23:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf0b7425bbso106088275ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 03:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000587; x=1781605387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h55UH12lvi5qvyEigfzQK2YfBNXbPcu1QXY1N2+KKxs=;
        b=VBmY3UFwDp+BA+v0GkTZyTY1gvA/BPSn+q67frtduTDSMc295HsZIHXF1C20bMJ0s5
         z7xuD/JJpkWYFCDVXj74RY8yesR3Rea+6diXr3WN3UauCPXv8lWkl5uQc7sqsOTZU8xU
         WPgOZ3tdf1dlI6C8M8JZBxtWt+wRTSycUDz8OpAHv3PphYPrgbx+IPXYaViVvCHbXEts
         /JpdmEfGNrvXAt31qp0DUrPfoNsgRpXWufKKckCGhFO80QZEj2yml2eUPwaR7hVtFQmM
         GuXLZFah+xsDJfP+/DgG7KHh1dOrERZjNhYwr8bqGeC/ZrVEtGibR/EKRx623NXw8YaA
         fzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000587; x=1781605387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h55UH12lvi5qvyEigfzQK2YfBNXbPcu1QXY1N2+KKxs=;
        b=Ks+yfe4GbDQ7JMXVMHzgF6QPiUD5/KjVVXBJSLPqq6RAdAIqIa4p0A1R4d6eHHSYwP
         3sncLErIoNb7WXWC1/i1e9S+Q7c6XklmB0TVu9PY7CM6VN8hymzZqqEjlOZwgXWU/ncU
         RnOiUrc8D+7FG8Wml02ffYGhB5ZVuLEv4MkaKgeF53zTwNlPl7tGs1RXcs3r181/ci2x
         KcAhMiVZhl5EUi+1LHyhJHQrRkpgPSl1yLQ9AhJTyyz2BJ64Q5DTBWbbK4w+Zf3JzJvk
         E1xomuouXI7NJJLx6kSpe88TA1Y9ljE40jLVP327qqver+djF4JUNt6Oe3Xq4PBv+3Ct
         bV4A==
X-Gm-Message-State: AOJu0YwJIvQEKyia5kqhDMUkBnaL4ETmCMYOxsPF+jRRFU97abtzVxRL
	okE9sywNa8+hPgJL1Yo7KEsZBVhNp7CapH5CoYI+n1p2SC7bbg81eTMjOFBNPLg0RFbfrrH5C9v
	urhqdyR6BIsZfGOlNEBr6g8L8ItWBcyOgIPmTs4bOcFuyP/vzNdnNz3ziB0dgOxhIX3Fl
X-Gm-Gg: Acq92OHqMhOQz9UQ6L+CYN4ZGUQo4NJcZ9q0juF39cf5inMetUxCUXHRI9dAMissWfk
	guFZSypkFn4WnqJX/oVyqBJrTmMhtzjdPYjtHBr+6H3m15AuivP8WgHQaCBQ6unA3hCOMIZdpPj
	VYDOjkgBNbsjswUHmGpI+zgHvNKwxIMaBqroZAXtVv2pT9Uic07nN1W42nuX/bSiME/ieUL4b/9
	5mt2cYVzACksheXD8RPJN6aKoMqFVutgMhXnRC5jx8Do8TH9gpqjYDgNAKLRSG1zVkM3IzaFNHK
	PNiF0qX50Tv2c2RaTSJIU1RwX5NRjDA4RK3LPxY7/mb7QdONLMGLGNtaQZZjUlbmfdsGjs1z8n4
	pCQglEH8cJO3FyGZflJ5As6tSLU12AXWBI+H+RJop1pQBIoi7cLO392sh7Dc=
X-Received: by 2002:a17:903:8ce:b0:2c0:b4f5:41ea with SMTP id d9443c01a7336-2c1e7e93bf0mr204077535ad.17.1781000587144;
        Tue, 09 Jun 2026 03:23:07 -0700 (PDT)
X-Received: by 2002:a17:903:8ce:b0:2c0:b4f5:41ea with SMTP id d9443c01a7336-2c1e7e93bf0mr204077095ad.17.1781000586575;
        Tue, 09 Jun 2026 03:23:06 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e86dsm213121685ad.8.2026.06.09.03.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:23:05 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 1/3] remoteproc: check return value of subdev stop and unprepare callbacks
Date: Tue,  9 Jun 2026 15:52:51 +0530
Message-ID: <20260609102254.2671238-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
References: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: l19EqkjI6lBXu1grmdfWnIgEYhEHHfCz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NyBTYWx0ZWRfX4mxjykho0cFS
 lHjV3C9QnsKZUGLQQW7pxIyOBGz6VTS2f70V5cljbdyzJNGGMCR/ZVQBh3c18Z3esJ1YEORDD7q
 Yj8f8hkJHRYvyTXWrvgJk6DA+CdMtpLCv1VOK9gfpUNIRGRbFm8Og2Ky7YEyq3ECsDUlU1q75A5
 Nk6ICqERToVKeCSLUSzPHTf0gxNruVZnmCDcPk8RWysOqYsOFfymcoMP96nSVBs+35xhfYlFApD
 55pfd5UuRGWXoFuanStL/9odfrxO69uOFOaTEwRMPOY7j5ve0Hq9QHIr5e6C4BFFIsi4Mt9Aofq
 3DNcA2jQfo6aBhy1QPWxf89GH+wDLiKJyEC/CmhUP+dQcIhx+UFvdfH1kRD5HzsjvqGnWNHIX8e
 5s2HmdIaUGIMITSUCxFpONpkNuqXDr2GJg1PJxyhu82zUGQwUFOCPbRXvaa70Ne8GflngU04UeG
 urcfC5QEzHmF/KhuUVw==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a27e98c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=KgjLDdhTq4KzWEx1KCkA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: l19EqkjI6lBXu1grmdfWnIgEYhEHHfCz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:mukesh.ojha@oss.qualcomm.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112120-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,collabora.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF39B65EF43

The stop() and unprepare() callbacks in struct rproc_subdev were void,
making it impossible for implementations to report failures.  Unlike
prepare() and start() which already return int and have their errors
checked, errors during teardown were silently discarded.

Change the callback signatures to return int.  Update
rproc_stop_subdevices() and rproc_unprepare_subdevices() to check each
return value and emit a warning on failure while continuing to visit all
remaining subdevices (best-effort teardown).

rproc_vdev_do_stop() propagates the error from device_for_each_child()
which it was already computing but had no way to surface. All other
implementations (glink, smd, ssr, pdm, sysmon) gain a return 0 as they
have no failure paths.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_common.c       | 26 +++++++++++++++++++-------
 drivers/remoteproc/qcom_sysmon.c       | 10 +++++++---
 drivers/remoteproc/remoteproc_core.c   | 16 ++++++++++++----
 drivers/remoteproc/remoteproc_virtio.c |  4 +++-
 drivers/rpmsg/mtk_rpmsg.c              |  8 ++++++--
 include/linux/remoteproc.h             |  4 ++--
 6 files changed, 49 insertions(+), 19 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index fd2b6824ad26..05a599318763 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -216,19 +216,23 @@ static int glink_subdev_start(struct rproc_subdev *subdev)
 	return PTR_ERR_OR_ZERO(glink->edge);
 }
 
-static void glink_subdev_stop(struct rproc_subdev *subdev, bool crashed)
+static int glink_subdev_stop(struct rproc_subdev *subdev, bool crashed)
 {
 	struct qcom_rproc_glink *glink = to_glink_subdev(subdev);
 
 	qcom_glink_smem_unregister(glink->edge);
 	glink->edge = NULL;
+
+	return 0;
 }
 
-static void glink_subdev_unprepare(struct rproc_subdev *subdev)
+static int glink_subdev_unprepare(struct rproc_subdev *subdev)
 {
 	struct qcom_rproc_glink *glink = to_glink_subdev(subdev);
 
 	qcom_glink_ssr_notify(glink->ssr_name);
+
+	return 0;
 }
 
 /**
@@ -327,12 +331,14 @@ static int smd_subdev_start(struct rproc_subdev *subdev)
 	return PTR_ERR_OR_ZERO(smd->edge);
 }
 
-static void smd_subdev_stop(struct rproc_subdev *subdev, bool crashed)
+static int smd_subdev_stop(struct rproc_subdev *subdev, bool crashed)
 {
 	struct qcom_rproc_subdev *smd = to_smd_subdev(subdev);
 
 	qcom_smd_unregister_edge(smd->edge);
 	smd->edge = NULL;
+
+	return 0;
 }
 
 /**
@@ -465,7 +471,7 @@ static int ssr_notify_start(struct rproc_subdev *subdev)
 	return 0;
 }
 
-static void ssr_notify_stop(struct rproc_subdev *subdev, bool crashed)
+static int ssr_notify_stop(struct rproc_subdev *subdev, bool crashed)
 {
 	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
 	struct qcom_ssr_notify_data data = {
@@ -475,9 +481,11 @@ static void ssr_notify_stop(struct rproc_subdev *subdev, bool crashed)
 
 	srcu_notifier_call_chain(&ssr->info->notifier_list,
 				 QCOM_SSR_BEFORE_SHUTDOWN, &data);
+
+	return 0;
 }
 
-static void ssr_notify_unprepare(struct rproc_subdev *subdev)
+static int ssr_notify_unprepare(struct rproc_subdev *subdev)
 {
 	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
 	struct qcom_ssr_notify_data data = {
@@ -487,6 +495,8 @@ static void ssr_notify_unprepare(struct rproc_subdev *subdev)
 
 	srcu_notifier_call_chain(&ssr->info->notifier_list,
 				 QCOM_SSR_AFTER_SHUTDOWN, &data);
+
+	return 0;
 }
 
 /**
@@ -572,16 +582,18 @@ static int pdm_notify_prepare(struct rproc_subdev *subdev)
 }
 
 
-static void pdm_notify_unprepare(struct rproc_subdev *subdev)
+static int pdm_notify_unprepare(struct rproc_subdev *subdev)
 {
 	struct qcom_rproc_pdm *pdm = to_pdm_subdev(subdev);
 
 	if (!pdm->adev)
-		return;
+		return 0;
 
 	auxiliary_device_delete(pdm->adev);
 	auxiliary_device_uninit(pdm->adev);
 	pdm->adev = NULL;
+
+	return 0;
 }
 
 /**
diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index 913e3b750a86..44b905a7e129 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -531,7 +531,7 @@ static int sysmon_start(struct rproc_subdev *subdev)
 	return 0;
 }
 
-static void sysmon_stop(struct rproc_subdev *subdev, bool crashed)
+static int sysmon_stop(struct rproc_subdev *subdev, bool crashed)
 {
 	struct qcom_sysmon *sysmon = container_of(subdev, struct qcom_sysmon, subdev);
 	struct sysmon_event event = {
@@ -548,7 +548,7 @@ static void sysmon_stop(struct rproc_subdev *subdev, bool crashed)
 
 	/* Don't request graceful shutdown if we've crashed */
 	if (crashed)
-		return;
+		return 0;
 
 	if (sysmon->ssctl_instance) {
 		if (!wait_for_completion_timeout(&sysmon->ssctl_comp, HZ / 2))
@@ -559,9 +559,11 @@ static void sysmon_stop(struct rproc_subdev *subdev, bool crashed)
 		sysmon->shutdown_acked = ssctl_request_shutdown(sysmon);
 	else if (sysmon->ept)
 		sysmon->shutdown_acked = sysmon_request_shutdown(sysmon);
+
+	return 0;
 }
 
-static void sysmon_unprepare(struct rproc_subdev *subdev)
+static int sysmon_unprepare(struct rproc_subdev *subdev)
 {
 	struct qcom_sysmon *sysmon = container_of(subdev, struct qcom_sysmon,
 						  subdev);
@@ -574,6 +576,8 @@ static void sysmon_unprepare(struct rproc_subdev *subdev)
 	sysmon->state = SSCTL_SSR_EVENT_AFTER_SHUTDOWN;
 	blocking_notifier_call_chain(&sysmon_notifiers, 0, (void *)&event);
 	mutex_unlock(&sysmon->state_lock);
+
+	return 0;
 }
 
 /**
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f003be006b1b..21127d972bff 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1113,20 +1113,28 @@ static int rproc_start_subdevices(struct rproc *rproc)
 static void rproc_stop_subdevices(struct rproc *rproc, bool crashed)
 {
 	struct rproc_subdev *subdev;
+	int ret;
 
 	list_for_each_entry_reverse(subdev, &rproc->subdevs, node) {
-		if (subdev->stop)
-			subdev->stop(subdev, crashed);
+		if (subdev->stop) {
+			ret = subdev->stop(subdev, crashed);
+			if (ret)
+				dev_warn(&rproc->dev, "subdev stop failed: %d\n", ret);
+		}
 	}
 }
 
 static void rproc_unprepare_subdevices(struct rproc *rproc)
 {
 	struct rproc_subdev *subdev;
+	int ret;
 
 	list_for_each_entry_reverse(subdev, &rproc->subdevs, node) {
-		if (subdev->unprepare)
-			subdev->unprepare(subdev);
+		if (subdev->unprepare) {
+			ret = subdev->unprepare(subdev);
+			if (ret)
+				dev_warn(&rproc->dev, "subdev unprepare failed: %d\n", ret);
+		}
 	}
 }
 
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index d5e9ff045a28..128d3088a959 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -480,7 +480,7 @@ static int rproc_vdev_do_start(struct rproc_subdev *subdev)
 	return rproc_add_virtio_dev(rvdev, rvdev->id);
 }
 
-static void rproc_vdev_do_stop(struct rproc_subdev *subdev, bool crashed)
+static int rproc_vdev_do_stop(struct rproc_subdev *subdev, bool crashed)
 {
 	struct rproc_vdev *rvdev = container_of(subdev, struct rproc_vdev, subdev);
 	struct device *dev = &rvdev->pdev->dev;
@@ -489,6 +489,8 @@ static void rproc_vdev_do_stop(struct rproc_subdev *subdev, bool crashed)
 	ret = device_for_each_child(dev, NULL, rproc_remove_virtio_dev);
 	if (ret)
 		dev_warn(dev, "can't remove vdev child device: %d\n", ret);
+
+	return ret;
 }
 
 static int rproc_virtio_probe(struct platform_device *pdev)
diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
index 1b670ed54cfa..d8ea77055f31 100644
--- a/drivers/rpmsg/mtk_rpmsg.c
+++ b/drivers/rpmsg/mtk_rpmsg.c
@@ -326,7 +326,7 @@ static int mtk_rpmsg_prepare(struct rproc_subdev *subdev)
 	return 0;
 }
 
-static void mtk_rpmsg_unprepare(struct rproc_subdev *subdev)
+static int mtk_rpmsg_unprepare(struct rproc_subdev *subdev)
 {
 	struct mtk_rpmsg_rproc_subdev *mtk_subdev = to_mtk_subdev(subdev);
 
@@ -334,9 +334,11 @@ static void mtk_rpmsg_unprepare(struct rproc_subdev *subdev)
 		mtk_rpmsg_destroy_ept(mtk_subdev->ns_ept);
 		mtk_subdev->ns_ept = NULL;
 	}
+
+	return 0;
 }
 
-static void mtk_rpmsg_stop(struct rproc_subdev *subdev, bool crashed)
+static int mtk_rpmsg_stop(struct rproc_subdev *subdev, bool crashed)
 {
 	struct mtk_rpmsg_channel_info *info, *next;
 	struct mtk_rpmsg_rproc_subdev *mtk_subdev = to_mtk_subdev(subdev);
@@ -372,6 +374,8 @@ static void mtk_rpmsg_stop(struct rproc_subdev *subdev, bool crashed)
 		kfree(info);
 	}
 	mutex_unlock(&mtk_subdev->channels_lock);
+
+	return 0;
 }
 
 struct rproc_subdev *
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 7c1546d48008..315c479d163a 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -335,8 +335,8 @@ struct rproc_subdev {
 
 	int (*prepare)(struct rproc_subdev *subdev);
 	int (*start)(struct rproc_subdev *subdev);
-	void (*stop)(struct rproc_subdev *subdev, bool crashed);
-	void (*unprepare)(struct rproc_subdev *subdev);
+	int (*stop)(struct rproc_subdev *subdev, bool crashed);
+	int (*unprepare)(struct rproc_subdev *subdev);
 };
 
 /* we currently support only two vrings per rvdev */
-- 
2.53.0


