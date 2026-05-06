Return-Path: <linux-arm-msm+bounces-106054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +M3CK2HL+mlTSwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 07:02:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E3E4D6368
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 07:02:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 274DF3040442
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 05:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0377A12B94;
	Wed,  6 May 2026 05:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GsFyOblt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gSc2K4fz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBA02C1595
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 05:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778043683; cv=none; b=bLj29gfxRcLKCBjgkwiuQOb2E4AzfM/Hucp6fukq003xWM+I1Wv8nENR/tfZiVBuZqBoDCs0nqhMLSqZP1uOKjdMqeBAduKE2uWXRJ4PlZew3EuLqcvLfP6sMtPAzi9DslaZbKezLmroFd4g0ppkzvBT5mrlh56xyHiNQsMjC4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778043683; c=relaxed/simple;
	bh=WHvjyHgD1TItrJGH0FkNazHavYPr4xyCEpQSkCRX/Xc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NM1GAkdFsbj7qlUO4gZtKtmR2uH4+Jo5OINk6+Zvjn7tPg+rwi7qmGRwbU3asMurNdqmV6l4/+jutD8VpqxbqZ9rDMNzWYFZG2IWmEHShIq3f28elWDXLbevEuEIqdUJlqgFvYKMOV0lX3SqNR3uBRKjMOUieDfFK+iFxfZPpwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GsFyOblt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gSc2K4fz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645Ne8844028315
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 05:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PiXhBeYotSE
	4gHZOix5lHX+AUX2pHHBVag0+f6bRxcY=; b=GsFyObltNzTdzSvqk7fK4LUOjE6
	G/OF8YhcbjY1YShm8FKH/dir5FZET4cED4DhIa25xGyFUi3rnRQTX2CHKuAVhLZ0
	fuKZEvD3qCRXPUsa1pGeOgFWTKkAN7JnIccHmshXIt7mdsi0k/VrxBmW/33va9nl
	VB2xw7bXuBe4AiNTBadCAK+Ewgkq1xiIHB/gYCsIOP/X5cPlAWVsxwwIY5OLKtmu
	r/xYSEmM+kjWBxW6nJ8oCVARuBib1LqkYjuywlmGd4Zc1eCp5mx6OXxizVCZALb8
	Qx3R6qOPKzDN9bd56f+kYaW0rkIY+fAQCZZ8xHs8oNE9RP30lGEkVPlxaqw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dydm6v5q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 05:01:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f6a5b4f88so7945170b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 22:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778043681; x=1778648481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PiXhBeYotSE4gHZOix5lHX+AUX2pHHBVag0+f6bRxcY=;
        b=gSc2K4fz9ehKaYs3HVq9M0oeoeSxrgV2vxKrldNoH3/SWG0Hg6pP8NOggQmGu9bXkH
         1aExhVZv4MBch9/r/a3BdmqB2ZW+4+EWxCcVYQYwG8R+wIPDAFF5DURTcYSTVPmC9K2d
         9r7ENCxgw9uKwC1A74uo0xhNFH1fFfF8nrYFHR1eEsi4GdpCwhoWlxf1g1RRvWJ3DUTP
         VkZUrZRx+grUIKZX9hlam/Y9fFodzmmvGfDwhexE6FNYh9LiVSxnswH+c9lozq68NT/n
         tKRLu/oN5/4p90r4KDQ/e6CWSP61zw81H/46CIeMZY1fyGwc8POTdQJm7lKK8dzPHxW5
         ajUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778043681; x=1778648481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PiXhBeYotSE4gHZOix5lHX+AUX2pHHBVag0+f6bRxcY=;
        b=Vq0+VzvBLdk65HxM7dETcgWdoM/ru5fCaGTS74XzYFjeFEppoQSWn92ymG0UuGncp7
         b34RyhDn5YYo9DNN0CYd35Z8OyCy8Fc/fQdN6F32GwKs9iPdVCBdxyK03a45gfm27cVu
         2RVLvqo1TafFlMR0x0hAJDfWboVEQdGOJsfRaQVMk96PyKlbgbNqZaV86HbKAzxbfPV3
         TilxM/bMpcelWJ1oUm4A/vkL5bgrFUD8m4MwwB7WsnQqTe7R2fg7nwaDpZMgs1M8Pa3R
         rmY+TwcS/kE0aNMkW//CdEAvMVxlJTke0OIsRPl0aTkeIZ7PKQ/HUMC9LoaM7mGYofFT
         +Cbw==
X-Forwarded-Encrypted: i=1; AFNElJ8XjWkYNRAiW0MeafGX+B9D+EW9vEL4sdagf89oJgcA/9mmur11gKPBJhtLJStsR4aJJGT5e4jHu5Qg3/fo@vger.kernel.org
X-Gm-Message-State: AOJu0YzAAb6ikMiWi9tTr4xxDexipboaH7MD8ZWB9lqI0CaG1yJ+y7ne
	AdvCi0taaLla82wl54fAONAUne1Lhi0Q7u87s5hVlqF/ZDwKlTfy14NMwIpRDof/KgBJykOVwrU
	CG49No0yE6kxRCab5iBhkHM1BgKBNxheB5PGcnBFZNGZhFBDoeZ7Gde4paVqf4nl6OMGU
X-Gm-Gg: AeBDietVG+mYKet4MGDM2otszr0m5RnRNxG+AsvzNW3N+oHNsg1nI8DEhJmJNIJYqqV
	FESTtWC7WGsXztmiMX+t/21K1AdqMPzI4DmpzJpV+1VBABXOSV74dZjpjlJd/D0LX9eZd7A1CBQ
	8eFXS6e7kXhOnoklzCjy+zwp7uDR/dz3lmk7qgQoqAPnc0AVe2cZuGjzOU7SJC66jNCfzsFJ1XX
	W5dQrQajk5ExIEZkojJTvNA2BSWrEnU5zxJs/ZZJTJ6QD/D/TCPAceNJLOTCFkCqIppj+Clzq5l
	ENQla58RlJmZ/e4xHFr9a0YKY+u17jaWZcI94QgwtNDED2yhAFAoldYoRlNjvdkVWxyhP5+sS8m
	9O8h7AWfedtFdoJbDam7MSOCNK52aAcICZPm3LC/hn+9gg87OOLKN3m2Ynh8=
X-Received: by 2002:a05:6a00:a02:b0:82f:5051:f024 with SMTP id d2e1a72fcca58-83a5df484a2mr1768444b3a.27.1778043680496;
        Tue, 05 May 2026 22:01:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:a02:b0:82f:5051:f024 with SMTP id d2e1a72fcca58-83a5df484a2mr1768404b3a.27.1778043679849;
        Tue, 05 May 2026 22:01:19 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbcfc0sm4891620b3a.42.2026.05.05.22.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 22:01:19 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 2/5] remoteproc: use rsc_table_for_each_entry() in rproc_handle_resources()
Date: Wed,  6 May 2026 10:31:04 +0530
Message-ID: <20260506050107.1985033-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506050107.1985033-1-mukesh.ojha@oss.qualcomm.com>
References: <20260506050107.1985033-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA0NiBTYWx0ZWRfX8oTwVmAaxChR
 Uh5TD4uOa1A2DUnGniXU9u1gyCRoeFhj+v/w5oJiq0yDxIkbcDOEK7/2sQ/+LJr+p/DhYMZtDdI
 YRR3yLsFx9AAlFAcg/WLtUrmu8DGDqhttIm0pgVgcq+ppsnjS+tCFqgMqQd7is7QqiTOHEZn4zE
 OCuGFvRdENZIx6/BEUcWQYUh435mjq4WskacxNx+rpeM7uO7fb3eD4OkY7bqA8irr0Wiqm/blKG
 ly799T5755v/HlWBbhZnYtgs7YCl5wvYIQydRlBhQhCKADQwsnwM/37SjeEq5us+zQlPcXtJFvf
 YOYtuo5Jsf1ErpC0wnlJWHM0FQZY01tgtvF2FB9QLfv8lpZqFlJZ94ISkPncI9WhatsmvA9VJPq
 U/OWjRAMGe8/54bh+y/a6RUweDsTMKUwCE2SZFC6XS+kq1YV4YVDxpIUoTMu0UGeJenVdr4Jt3p
 O+uwGJGA4AMMijLa+Tw==
X-Authority-Analysis: v=2.4 cv=K4AS2SWI c=1 sm=1 tr=0 ts=69facb21 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=xRbkGY9h9Oi8AtJRHVsA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: mny_pqiRno53pFHFyPgLQ-_AGKXsyLGa
X-Proofpoint-ORIG-GUID: mny_pqiRno53pFHFyPgLQ-_AGKXsyLGa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060046
X-Rspamd-Queue-Id: 56E3E4D6368
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106054-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

Replace the open-coded resource table iteration loop in
rproc_handle_resources() with the rsc_table_for_each_entry() helper.

The remoteproc-specific dispatch logic (vendor resource handling via
rproc_handle_rsc(), RSC_LAST bounds check, handler table lookup) is
moved into a local callback rproc_handle_rsc_entry(), keeping the
iteration mechanics in one canonical place.

The callback receives the payload offset within the table so that
handlers which write back into the resource table (e.g.
rproc_handle_carveout() recording a dynamically allocated address via
rsc_offset) continue to work correctly.

No functional change.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/remoteproc_core.c | 81 +++++++++++++---------------
 include/linux/rsc_table.h            | 53 ++++++++++++++++++
 2 files changed, 91 insertions(+), 43 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index b087ed21858a..f003be006b1b 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1011,60 +1011,55 @@ static rproc_handle_resource_t rproc_loading_handlers[RSC_LAST] = {
 	[RSC_VDEV] = rproc_handle_vdev,
 };
 
-/* handle firmware resource entries before booting the remote processor */
-static int rproc_handle_resources(struct rproc *rproc,
-				  rproc_handle_resource_t handlers[RSC_LAST])
+struct rproc_rsc_cb_data {
+	struct rproc *rproc;
+	rproc_handle_resource_t *handlers;
+};
+
+static int rproc_handle_rsc_entry(u32 type, void *rsc, int offset,
+				  int avail, void *data)
 {
+	struct rproc_rsc_cb_data *d = data;
+	struct rproc *rproc = d->rproc;
 	struct device *dev = &rproc->dev;
 	rproc_handle_resource_t handler;
-	int ret = 0, i;
-
-	if (!rproc->table_ptr)
-		return 0;
+	int ret;
 
-	for (i = 0; i < rproc->table_ptr->num; i++) {
-		int offset = rproc->table_ptr->offset[i];
-		struct fw_rsc_hdr *hdr = (void *)rproc->table_ptr + offset;
-		int avail = rproc->table_sz - offset - sizeof(*hdr);
-		void *rsc = (void *)hdr + sizeof(*hdr);
+	dev_dbg(dev, "rsc: type %d\n", type);
 
-		/* make sure table isn't truncated */
-		if (avail < 0) {
-			dev_err(dev, "rsc table is truncated\n");
-			return -EINVAL;
-		}
-
-		dev_dbg(dev, "rsc: type %d\n", hdr->type);
+	if (type >= RSC_VENDOR_START && type <= RSC_VENDOR_END) {
+		ret = rproc_handle_rsc(rproc, type, rsc, offset, avail);
+		if (ret == RSC_HANDLED)
+			return 0;
+		if (ret < 0)
+			return ret;
+		dev_warn(dev, "unsupported vendor resource %d\n", type);
+		return 0;
+	}
 
-		if (hdr->type >= RSC_VENDOR_START &&
-		    hdr->type <= RSC_VENDOR_END) {
-			ret = rproc_handle_rsc(rproc, hdr->type, rsc,
-					       offset + sizeof(*hdr), avail);
-			if (ret == RSC_HANDLED)
-				continue;
-			else if (ret < 0)
-				break;
+	if (type >= RSC_LAST) {
+		dev_warn(dev, "unsupported resource %d\n", type);
+		return 0;
+	}
 
-			dev_warn(dev, "unsupported vendor resource %d\n",
-				 hdr->type);
-			continue;
-		}
+	handler = d->handlers[type];
+	if (!handler)
+		return 0;
 
-		if (hdr->type >= RSC_LAST) {
-			dev_warn(dev, "unsupported resource %d\n", hdr->type);
-			continue;
-		}
+	return handler(rproc, rsc, offset, avail);
+}
 
-		handler = handlers[hdr->type];
-		if (!handler)
-			continue;
+/* handle firmware resource entries before booting the remote processor */
+static int rproc_handle_resources(struct rproc *rproc,
+				  rproc_handle_resource_t handlers[RSC_LAST])
+{
+	struct rproc_rsc_cb_data d = { .rproc = rproc, .handlers = handlers };
 
-		ret = handler(rproc, rsc, offset + sizeof(*hdr), avail);
-		if (ret)
-			break;
-	}
+	if (!rproc->table_ptr)
+		return 0;
 
-	return ret;
+	return rsc_table_for_each_entry(rproc->table_ptr, rproc->table_sz,
+					&rproc->dev, rproc_handle_rsc_entry, &d);
 }
 
 static int rproc_prepare_subdevices(struct rproc *rproc)
diff --git a/include/linux/rsc_table.h b/include/linux/rsc_table.h
index c32c8b6cd2a7..c6d6d553d8f1 100644
--- a/include/linux/rsc_table.h
+++ b/include/linux/rsc_table.h
@@ -303,4 +303,57 @@ struct fw_rsc_vdev {
 	struct fw_rsc_vdev_vring vring[];
 } __packed;
 
+/**
+ * rsc_table_for_each_entry() - iterate over all entries in a resource table
+ * @table:    pointer to the resource table
+ * @table_sz: total size of the table buffer in bytes
+ * @dev:      device used for error logging
+ * @cb:       callback invoked for each entry:
+ *              @type   - value from enum fw_resource_type
+ *              @rsc    - pointer to the entry payload (past struct fw_rsc_hdr)
+ *              @offset - byte offset of the payload within the table; callers
+ *                        that write back into the table (e.g. to record a
+ *                        dynamically allocated address) use this to locate the
+ *                        entry for later update
+ *              @avail  - bytes available in the payload
+ *              @data   - caller-supplied private pointer
+ *            Return 0 to continue iteration, non-zero to stop.
+ * @data:     private pointer forwarded to @cb on every call
+ *
+ * Iterates over every resource entry in @table, performing the standard
+ * truncation check, and invokes @cb for each one. Iteration stops on the
+ * first non-zero return from @cb or on a malformed table.
+ *
+ * Returns 0 after a complete iteration, -EINVAL if the table is truncated,
+ * or the first non-zero value returned by @cb.
+ */
+static inline int rsc_table_for_each_entry(struct resource_table *table,
+					   size_t table_sz,
+					   struct device *dev,
+					   int (*cb)(u32 type, void *rsc,
+						     int offset, int avail,
+						     void *data),
+					   void *data) {
+	int i, ret;
+
+	for (i = 0; i < table->num; i++) {
+		int offset = table->offset[i];
+		struct fw_rsc_hdr *hdr = (void *)table + offset;
+		int avail = table_sz - offset - sizeof(*hdr);
+		int rsc_offset = offset + sizeof(*hdr);
+		void *rsc = (void *)hdr + sizeof(*hdr);
+
+		if (avail < 0) {
+			dev_err(dev, "rsc table is truncated\n");
+			return -EINVAL;
+		}
+
+		ret = cb(hdr->type, rsc, rsc_offset, avail, data);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 #endif /* RSC_TABLE_H */
-- 
2.53.0


