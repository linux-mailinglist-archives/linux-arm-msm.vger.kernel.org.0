Return-Path: <linux-arm-msm+bounces-117145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VrN9ATSZTGp7mwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:14:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C34717D6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:14:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HwtSdYsb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=V1bCO0Zb;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117145-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117145-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 62C1C304DCD7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 06:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC06389E07;
	Tue,  7 Jul 2026 06:12:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224BC3876A1
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 06:12:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783404744; cv=none; b=IDpuMAqv8h9zasFUMb69I1bglUTH/NyQz0gWEwhVfxyVHkSSTlLRzSSPCYl/fUmW8G06uJjZNN9fEFhvQJXcbIT1RArmEg1ybomcfMGTf1m4/icjWhoDavqhQDP+72N9Ap/NDYXV8lckH53jbgBboN+bysqtcerwd/uqiKSR3CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783404744; c=relaxed/simple;
	bh=an3gXuk4A2+uvHpWTkRIawSelkiuFs5doNcyQWtYbNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pPO0VR9hsyxFOzTXyx6QxUORacNdGAMcOIuzZdq4kUyZ2BncxzmCy7mMT5paF8WQjaTTH7j4RU7gw59DlY/gLVZ5EnQS8yuIJ+LfH20Lso8tFQugE0AyTI0EqoYevf41PfrygtgFnZqm9ruQOYPKrW9ncCi8lVs7zD+0nbUre5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HwtSdYsb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V1bCO0Zb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6674946I2498812
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 06:12:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6HxuZEjRivqOYFFj1YwrCy4ofCv1OCHGdZU482Lj11E=; b=HwtSdYsb8l6buXNN
	TQWTbPo1Dr6zfRutjohy56KpU3iTwgjaqYh4lK4o+K0IKMsRNZk/WdDej5L3OjBN
	9QCGQVChzjNUtKhYy+OIexV1Ex32nfzH5icQ9uwOTUu9DhbrynNNZn0HPnDtGPsf
	X5aDVaCj4TVJl0RKkoOSPUgLMPRqX+ueci0TJjv2dPGiyr+/mhoESOq/IDSKtRHv
	f6inzau9txQHDi3ejppkciMLG9Of0H9SIaIegQb+bWIUIih6O/lVV35CNVaQRYei
	fQjgtaUqvj4Wat96vbZTBmM4QrkOz569LqMCSKXZH1NCO7TjNH7P86PsqDCQQDAs
	fZfNWg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hscwer-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 06:12:22 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8482fd61e83so497452b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 23:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783404741; x=1784009541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6HxuZEjRivqOYFFj1YwrCy4ofCv1OCHGdZU482Lj11E=;
        b=V1bCO0Zb9yf4J0avS1o4BcnfL9qOhYQAWSK8Wb05SdpdgfUqkS2vW8b9yzGJq8zAgP
         uNRivsdrUQb95YeuvY9qGaEfZtdNqB7jfXEIOzZpkg4DklY1O/P0DA/r+rf3z8lMjOcO
         OM12x9wFv5i/ShavLv/VM5NaWTPy9lEN2Tmes6qBoY42NGPdM6f2kpSVOKSsCNqb7rez
         W+ej97ryu4UqVtI71VW3DXbvxia6G2pbq5T4jMVLcoYYrSZvW1xGmrGd4SIOZXL7tyF8
         JTbE+dgpvXpgm+yTVwaquTz+B5Xg2vpi3zP4FKXTWRTdinie1ukUP5J3T7bBH6h3W9y6
         ujGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783404741; x=1784009541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6HxuZEjRivqOYFFj1YwrCy4ofCv1OCHGdZU482Lj11E=;
        b=YXw90aZdQ5k82E/dipD3j5D4USQpnlUm6qJygYGcedWT0JEJQmQHzZgdy9QEcMA/3B
         KfaE1zoNJ364tgKJjQDj610+ubw/vjVSII2rroCqxuu9jvmNui7nW3Sp6dKQOrFVZtPO
         7Vg2DBiFcMAhUWdXNCzUU1WMdXv88DU3ZuJIK14hepRugU1gjqVWlfGMUIEJvR4hwK8c
         hHqsTA6nTULTxWZ3Zz0CrnCbEt8N/6C1zlYjqjlK9ZJ+hI23N9p1cRyBvwPfQb9cTiMm
         mk/yRXPxS+swCF1XhmiUw1o/2BBPeo/taQ5hfT910Rg5Z9u7K+d7gtjDeBiWjU+OnhDM
         HrmQ==
X-Forwarded-Encrypted: i=1; AHgh+RrnmJisyOzezOprjIRkHJn+WiRdKpnmtTSsYZ49MOMVk6XSvhuAMumajItMmX5s+983sKPo0YzOhwXoeFRi@vger.kernel.org
X-Gm-Message-State: AOJu0YxgZhfcXXM47Q/EXViBjWCpLRheQ/fx2jCtXYBt8fRg2lFtBdPI
	hZd6KQ/cDJxC8uKxuaJu74ej9M9CDaK4tDN8n3Xt3zugZEZJMQqaWcDnjMBL6QY0U713bola+sd
	kWQkblStgZbSfWDBmvks/K025gXt1tN6ouquVGNxW3BLpXPNXJ1IJSzVgmERXSYZFgnPo
X-Gm-Gg: AfdE7cmKLqMLUt6m0WJQJgmjidG1bAVhONz8kmMlRWz7Z/8aExKKd3243oetXf0Cjk1
	jHc5X6gD5ymZ97Bgt1PuDDkDU6DedNV1DIKCbkFTUq8B8btzEtytt69IdFosrm/6foi64ZieDBj
	TR1oCgdNadEpA4yNv4g4M6FIOgovCZXtgnN2tSUbDNOPF9lP4MoyjQZ/LJT/54WHgB+6m8vPHTW
	1vH6O4NENb2CGR/e6amozXuOqGa+A5dLZKBBaxa4dRRz7YlSnnUEYVrtZwqd8+lqlWVgOEU5B9p
	93iJ1fMIa7j8rrVJ1AC2DoVzMrp6eLiJrv5NvOQAxhkzCLfwc69lJZWsQDa/fQcA54QWAZGqypN
	ZwL/kz05RzW2SJNhIKtZGcSy8R3t1zPwEEKIc
X-Received: by 2002:a05:6a00:1708:b0:847:973b:3cfa with SMTP id d2e1a72fcca58-84826c23c70mr3852099b3a.15.1783404740905;
        Mon, 06 Jul 2026 23:12:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:1708:b0:847:973b:3cfa with SMTP id d2e1a72fcca58-84826c23c70mr3852063b3a.15.1783404740316;
        Mon, 06 Jul 2026 23:12:20 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8480da8bab0sm3299321b3a.8.2026.07.06.23.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:12:19 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 11:41:31 +0530
Subject: [PATCH 5/6] tee: qcomtee: Add support for registering QTEE
 services on TEE bus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-qcom_uefisecapp_migrate_qcomtee-v1-5-f659cbd5d04c@oss.qualcomm.com>
References: <20260707-qcom_uefisecapp_migrate_qcomtee-v1-0-f659cbd5d04c@oss.qualcomm.com>
In-Reply-To: <20260707-qcom_uefisecapp_migrate_qcomtee-v1-0-f659cbd5d04c@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783404715; l=10315;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=an3gXuk4A2+uvHpWTkRIawSelkiuFs5doNcyQWtYbNw=;
 b=y9nRWh2PrURkVFBrnNQn16rxbjc+Da7v0/l3P+HhTKcLr3KeGb72rVvgRZXmGb0NLosyYla5c
 LmfEMTilE9HDe8ATOmCy+8tjPtqqUmV1el17jjP2VyBLmASp4wEJbVq
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: C0Sjmg7Lg2wJ_XeNIA-K_O7fduox6QWT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA1NiBTYWx0ZWRfXyY/nwiO2v0vl
 OY2I3nHwLrgHcErc5Ygp4IUprpwWlm9ghKT/Xa3CqoWkkOsrrLB+2h3B4cYk+t5hWgcj0Y4pANK
 DeEQ+U+lAzmVeYFdcLBnU2H//UZ5MSE+JFlPGd/kEaaIczBHzFwUUbB/eraf1kUaAz2guXYhLBR
 kLVrsgsZLG6bez4yi5fv8V/6kBvzUGzt/ihbmpJLbkQ5ZIYzKOpycg4Dqgely809gMDPg8lXA4i
 Ehza9MhJv4TYUOMn5PnlzTQTTsehp1yhimvrccFRNStonT4hLqHBxO1GJBPFB66kaMz2Z2pO5NE
 STvhx7r3gHWqbQ60ceFS/GHst8hULAgLDomhkdOsl9BQjsApQeZ0s+0N7VrRMI8euf+THw3fvCP
 vLAkShspjsgBnpL47enSXe3srU0Hvec6fMh2S49M0JdBZKDWwgPz/AKGsodbbfngWFqQClR3kP4
 /nZxzoE8aFGXCffmlCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA1NiBTYWx0ZWRfX8nKNstQ4JxHn
 ZTSk5/iNhgH6S4J2pdILYIJlKmOc8PD+X2oanFAmepp3vcR3m4OVhj7s1tq7jTOhMc07kvacc5U
 ohCDgkAWBTm7iRwWX0s8VL9q4PtYEag=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4c98c6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Nf0BAG_vLcPjEMih4eIA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: C0Sjmg7Lg2wJ_XeNIA-K_O7fduox6QWT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117145-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jens.wiklander@linaro.org,m:sumit.garg@kernel.org,m:amirreza.zarrabi@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:basantk@qti.qualcomm.com,m:apurupa@qti.qualcomm.com,m:aneelaka@qti.qualcomm.com,m:op-tee@lists.trustedfirmware.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:harshal.dev@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68C34717D6F

QTEE exposes certain secure services implemented either within the QTEE
kernel or via pre-loaded Trusted Applications (TAs). Such always-available
services can be readily accessed by TEE client drivers via QTEE's
object-IPC protocol if the service is registered as a device on the TEE
bus.

One such service is the EFI-variables service, implemented by the
uefisecapp TA which enables kernel clients to access EFI variables at
runtime.

Maintain a static list of such always-available secure services and add
support for the QCOMTEE driver to register these services as devices on
the TEE bus during probe.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 drivers/tee/qcomtee/call.c           | 160 ++++++++++++++++++++++++++++++++++-
 drivers/tee/qcomtee/core.c           |   9 +-
 drivers/tee/qcomtee/qcomtee.h        |  12 +++
 drivers/tee/qcomtee/qcomtee_msg.h    |   1 +
 drivers/tee/qcomtee/qcomtee_object.h |   3 +-
 5 files changed, 177 insertions(+), 8 deletions(-)

diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
index e12c1a6e72d8..4373fcac2f5f 100644
--- a/drivers/tee/qcomtee/call.c
+++ b/drivers/tee/qcomtee/call.c
@@ -677,7 +677,7 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
 {
 	struct qcomtee_object *client_env, *service;
 	struct qcomtee_arg u[3] = { 0 };
-	int result;
+	int result, error = 0;
 
 	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
 		qcomtee_object_invoke_ctx_alloc(ctx, true);
@@ -690,9 +690,13 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
 
 	/* Get ''FeatureVersions Service'' object. */
 	service = qcomtee_object_get_service(oic, client_env,
-					     QCOMTEE_FEATURE_VER_UID);
-	if (service == NULL_QCOMTEE_OBJECT)
+					     QCOMTEE_FEATURE_VER_UID,
+					     &error);
+	if (service == NULL_QCOMTEE_OBJECT) {
+		if (error)
+			pr_err("Failed to get service! error: %d\n", error);
 		goto out_failed;
+	}
 
 	/* IB: Feature to query. */
 	u[0].b.addr = &id;
@@ -712,6 +716,153 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
 	qcomtee_object_put(client_env);
 }
 
+/**
+ * is_qcomtee_service_available() - Check if the QTEE service identified by the UID
+ * is available
+ * @ctx: TEE context.
+ * @uid: 32-bit UID of the service.
+ *
+ * Returns true if the service exists and is available.
+ * Returns false if a service is not exposed by QTEE.
+ */
+static bool is_qcomtee_service_available(struct tee_context *ctx, u32 uid)
+{
+	struct qcomtee_object *client_env;
+	struct qcomtee_object *service;
+	int error = 0;
+	bool ret = false;
+
+	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
+		qcomtee_object_invoke_ctx_alloc(ctx, true);
+	if (!oic)
+		return ret;
+
+	client_env = qcomtee_object_get_client_env(oic);
+	if (client_env == NULL_QCOMTEE_OBJECT)
+		return ret;
+
+	/* Get service object corresponding to the uid. */
+	service = qcomtee_object_get_service(oic, client_env, uid, &error);
+	if (service != NULL_QCOMTEE_OBJECT) {
+		qcomtee_object_put(service);
+		ret = true;
+	}
+
+	/* When we fail to get the service, QTEE provides the reason. */
+	if (error)
+		pr_err("Failed to get service! error: %d\n", error);
+
+	qcomtee_object_put(client_env);
+	return ret;
+}
+
+/*
+ * QTEE Service UUID name space identifier
+ *
+ * A random UUID that is allocated as a name space identifier for forming UUID's
+ * representing secure services exposed by QTEE.
+ */
+static const uuid_t qtee_service_uuid_ns = UUID_INIT(0xe1b48857, 0x6154, 0x49f9,
+						     0x93, 0x4e, 0xa2, 0xf2,
+						     0x0a, 0xba, 0x98, 0x42);
+
+static const struct qtee_service qtee_services[] = {
+	{ "qcom.tz.uefisecapp",
+	   QCOMTEE_UEFI_SEC_UID }
+};
+
+static void qtee_release_service(struct device *dev)
+{
+	struct tee_client_device *qtee_service = to_tee_client_device(dev);
+
+	kfree(qtee_service);
+}
+
+/**
+ * qtee_enumerate_service() - Enumerate a given QTEE service and register
+ * it on the TEE bus as a TEE client device
+ * @ctx: TEE context.
+ * @service_uuid: UUID of the service to be registered on the TEE bus.
+ * @uid: 32-bit UID used by QTEE to identify the service.
+ *
+ * Returns 0 on success and < 0 on failure.
+ */
+static int qtee_enumerate_service(struct tee_context *ctx, const char *service_name,
+				  const u32 uid)
+{
+	struct tee_client_device *qtee_service;
+	uuid_t service_uuid;
+	int rc;
+
+	if (!is_qcomtee_service_available(ctx, uid))
+		return -ENXIO;
+
+	tee_generate_uuid_v5(&service_uuid, &qtee_service_uuid_ns, service_name,
+			     strlen(service_name));
+
+	qtee_service = kzalloc_obj(*qtee_service);
+	if (!qtee_service)
+		return -ENOMEM;
+
+	qtee_service->dev.bus = &tee_bus_type;
+	qtee_service->dev.release = qtee_release_service;
+	if (dev_set_name(&qtee_service->dev, "qtee-svc-%pUb", &service_uuid)) {
+		kfree(qtee_service);
+		return -ENOMEM;
+	}
+	uuid_copy(&qtee_service->id.uuid, &service_uuid);
+
+	rc = device_register(&qtee_service->dev);
+	if (rc) {
+		pr_err("QTEE service registration failed, err: %d\n", rc);
+		put_device(&qtee_service->dev);
+		kfree(qtee_service);
+		return rc;
+	}
+
+	return 0;
+}
+
+/**
+ * qtee_enumerate_services() - Enumerate all the secure services exposed by QTEE
+ * from the static 'qtee_services' list and register them on the TEE bus as
+ * TEE client devices.
+ *
+ * Not all versions of QTEE support a given service. Hence, we try to
+ * enumerate as many services from the 'qtee_services' list as possible.
+ * Not being able to enumerate a service shouldn't cause the driver probe
+ * to fail since none of the services in the list are mandatory for
+ * establishing communication with QTEE.
+ * @ctx: TEE context.
+ */
+static void qtee_enumerate_services(struct tee_context *ctx)
+{
+	int rc;
+	u32 idx;
+
+	for (idx = 0; idx < ARRAY_SIZE(qtee_services); idx++) {
+		rc = qtee_enumerate_service(ctx, qtee_services[idx].name,
+					    qtee_services[idx].uid);
+		if (rc == -ENXIO)
+			pr_err("QTEE does not implement service %d.\n",
+			       qtee_services[idx].uid);
+	}
+}
+
+static int qtee_unregister_service(struct device *dev, void *data)
+{
+	if (!strncmp(dev_name(dev), "qtee-svc", strlen("qtee-svc")))
+		device_unregister(dev);
+
+	return 0;
+}
+
+static void qtee_unregister_services(void)
+{
+	bus_for_each_dev(&tee_bus_type, NULL, NULL,
+			 qtee_unregister_service);
+}
+
 static const struct tee_driver_ops qcomtee_ops = {
 	.get_version = qcomtee_get_version,
 	.open = qcomtee_open,
@@ -793,6 +944,8 @@ static int qcomtee_probe(struct platform_device *pdev)
 		QTEE_VERSION_GET_MINOR(qcomtee->qtee_version),
 		QTEE_VERSION_GET_PATCH(qcomtee->qtee_version));
 
+	qtee_enumerate_services(qcomtee->ctx);
+
 	return 0;
 
 err_dest_wq:
@@ -822,6 +975,7 @@ static void qcomtee_remove(struct platform_device *pdev)
 {
 	struct qcomtee *qcomtee = platform_get_drvdata(pdev);
 
+	qtee_unregister_services();
 	teedev_close_context(qcomtee->ctx);
 	/* Wait for RELEASE operations to be processed for QTEE objects. */
 	tee_device_unregister(qcomtee->teedev);
diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
index b1cb50e434f0..4e39e867c3e9 100644
--- a/drivers/tee/qcomtee/core.c
+++ b/drivers/tee/qcomtee/core.c
@@ -896,19 +896,20 @@ qcomtee_object_get_client_env(struct qcomtee_object_invoke_ctx *oic)
 
 struct qcomtee_object *
 qcomtee_object_get_service(struct qcomtee_object_invoke_ctx *oic,
-			   struct qcomtee_object *client_env, u32 uid)
+			   struct qcomtee_object *client_env, u32 uid,
+			   int *result)
 {
 	struct qcomtee_arg u[3] = { 0 };
-	int ret, result;
+	int ret;
 
 	u[0].b.addr = &uid;
 	u[0].b.size = sizeof(uid);
 	u[0].type = QCOMTEE_ARG_TYPE_IB;
 	u[1].type = QCOMTEE_ARG_TYPE_OO;
 	ret = qcomtee_object_do_invoke(oic, client_env, QCOMTEE_CLIENT_ENV_OPEN,
-				       u, &result);
+				       u, result);
 
-	if (ret || result)
+	if (ret || *result)
 		return NULL_QCOMTEE_OBJECT;
 
 	return u[1].o;
diff --git a/drivers/tee/qcomtee/qcomtee.h b/drivers/tee/qcomtee/qcomtee.h
index 5d292a2ff83d..44fbed6868ca 100644
--- a/drivers/tee/qcomtee/qcomtee.h
+++ b/drivers/tee/qcomtee/qcomtee.h
@@ -17,6 +17,8 @@
 #define QCOMTEE_OBJREF_FLAG_USER	BIT(1)
 #define QCOMTEE_OBJREF_FLAG_MEM		BIT(2)
 
+#define QTEE_UUID_NS_NAME_SIZE	        128
+
 /* The MSB of the object_id field indicates whether the client is invoking the
  * object from user context or kernel context.
  */
@@ -45,6 +47,16 @@ struct qcomtee {
 	u32 qtee_version;
 };
 
+/**
+ * struct qtee_service - A secure service exposed by QTEE identified by a 32-bit UID.
+ * @name: Name of the QTEE service.
+ * @uid: 32-bit UID used by QTEE to identify the service.
+ */
+struct qtee_service {
+	const char *name;
+	const u32 uid;
+};
+
 void qcomtee_fetch_async_reqs(struct qcomtee_object_invoke_ctx *oic);
 struct qcomtee_object *qcomtee_idx_erase(struct qcomtee_object_invoke_ctx *oic,
 					 u32 idx);
diff --git a/drivers/tee/qcomtee/qcomtee_msg.h b/drivers/tee/qcomtee/qcomtee_msg.h
index 878f70178a5b..ecaf8db67d45 100644
--- a/drivers/tee/qcomtee/qcomtee_msg.h
+++ b/drivers/tee/qcomtee/qcomtee_msg.h
@@ -105,6 +105,7 @@ union qcomtee_msg_arg {
 #define QTEE_VERSION_GET_MINOR(x) (((x) >> 12) & 0xffU)
 #define QTEE_VERSION_GET_PATCH(x) ((x) >> 0 & 0xfffU)
 
+#define QCOMTEE_UEFI_SEC_UID            413
 /* Response types as returned from qcomtee_object_invoke_ctx_invoke(). */
 
 /* The message contains a callback request. */
diff --git a/drivers/tee/qcomtee/qcomtee_object.h b/drivers/tee/qcomtee/qcomtee_object.h
index 7bd6e23b038c..f4cb9b8fcbd4 100644
--- a/drivers/tee/qcomtee/qcomtee_object.h
+++ b/drivers/tee/qcomtee/qcomtee_object.h
@@ -316,6 +316,7 @@ qcomtee_object_get_client_env(struct qcomtee_object_invoke_ctx *oic);
 
 struct qcomtee_object *
 qcomtee_object_get_service(struct qcomtee_object_invoke_ctx *oic,
-			   struct qcomtee_object *client_env, u32 uid);
+			   struct qcomtee_object *client_env, u32 uid,
+			   int *result);
 
 #endif /* QCOMTEE_OBJECT_H */

-- 
2.34.1


