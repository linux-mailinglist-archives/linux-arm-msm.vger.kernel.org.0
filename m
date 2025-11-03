Return-Path: <linux-arm-msm+bounces-80141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DBEC2CDAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 16:45:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FC1918C0A2F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 15:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64E631A7FB;
	Mon,  3 Nov 2025 15:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W4p6p6ON";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fyoNUk8w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2323331A7E7
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 15:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762183798; cv=none; b=KfKW9krGtLT00epc8aEfEoIHWv5RFxFOq5F2cJ9wjW/dl3F4/mUeOCbhLHwq4JMp0hXpC/BHPv8+i28xCoHDinmA9aKoOwHoiwC7XsfIFq5Gp0wMbaIX0bLP4++cdfszefmVbbQtCENuU4UPfl4JNTAgIWpoQqWlItrtFC4/6is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762183798; c=relaxed/simple;
	bh=JdNpmgpvzDCtH5SZL/dNJAWTPkyCebG1SD4bGKhvhCY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UARscHtClWE6ddHzb69oO69mRbmd945MEUpbVAi7eJ7itmdUInjmOZoDtRdhCOYcmMmVpNU+FHAFuEJmdOH1M4joSL1yPRz0AZFt+SofdNnXjAkj/TkJBgeWjvAQecxlxX6UAQf5EsRWj9wXRdYUKSu4QoVDVEl+vfkyT/HtiiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W4p6p6ON; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fyoNUk8w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3EsRpU3444749
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 15:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Bq0Jp95HnB8
	vIN8Lh3F/MO0AU8FS5qmwu14/WK/BGCE=; b=W4p6p6ON25RUmaYjgbID9g6Lutk
	fHInt32B9VwWiGxQ0u6kX1yQV+AkXz9viOj3GV0YJV6epGTpUAo/p8/gm0Hmc9OK
	TiD+3RCCWMVwMSA4q962WyONpNfA1DdSTA17z6Sf5f3XP8PbTVU+M7eKsRTPHtk+
	amDr/5ySzMREd7A7SYA8uww6qZLbOdzmMLEhBstKrcb656O88jqKuyKsHvncHlxM
	YSWEQXLWYbj7leiUiJvZYHn75niqZSS0cqfntlvuCUjNirEX/SYlq+uGnh6hdaLa
	0WKL7Y8RixKZLoHEyoBDJ8dKg8vXjbF6TvzYeC64/g0ylGWWDcT+cjtDLkg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6xjqr3g0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 15:29:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-295592eb5dbso22783165ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 07:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762183795; x=1762788595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bq0Jp95HnB8vIN8Lh3F/MO0AU8FS5qmwu14/WK/BGCE=;
        b=fyoNUk8wyzyqUdrzFJ8lu2UpvlaM5ZxLNu9RMg8NK/qshKzb5Jy6jjVKIGmBm1x2ed
         A8A6xqUNi88DGgh9XnmaOgyDY6ew+CKIFWFsSGylZ8b/vxPVwh8Y9PBMsGWfs787b0C/
         F+6BZ5DlRDaDJwJ2ygUosFJGicq9D7AzbFepPZXroefPa8jheooxfEDblFznr7xZlDhu
         w2RzvzgCF+eoWPp+YfBZVTQkynajNUBHyiDLXr3eII26r3fm6yOvBNH9A4liWU4aV1j/
         Xk63v/R27Vvgu4KxfWEb/gKfYSIfoR/7wRjtW+YcnpZzV8tBFbP+7GU9WfnDD/U8HL8J
         oKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762183795; x=1762788595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bq0Jp95HnB8vIN8Lh3F/MO0AU8FS5qmwu14/WK/BGCE=;
        b=xOSSyFCQZCuO4VtU2hawy66WVDJENYM6EUAIZ777FesjiOBR3F7ryXbDRXPdsZA6JY
         ezPuNwV7d8wypoJFtGk+f81lyu0ctPO/ZNkPx/wN6yB2ABh0bcQO0k0pIyjzbvxYM41L
         BJG+AMA+yvZuxjXl/Lh6u/8+6fFxEG9q+8MwOEe9o19BrywlwJoFlTJ265YhHevQfTbz
         AOMQh6YdlrEOwO5IJL+WkBKgENZ4TvjnZoJ4ajLXhw3JiXBAr6V0aD6wrdTTowchjnGv
         +XrlY0AeDlvOVpyuUaQT3JIvf2jq++NdYZynie3m5W05SXpooc5MCn0aB3Go+RKBOfjV
         tbag==
X-Forwarded-Encrypted: i=1; AJvYcCWe6EJiHIX+K9vpsBtDGRklOXpRNkXkpTYbHyAzrhdRxi4A7estheMne405OVcQOG7CctTFP6jw69WuYfcf@vger.kernel.org
X-Gm-Message-State: AOJu0YygSksszgEu13L7p9FjYgK1pkJuLBCoEr+i8gd3P/PIEWtHjFMO
	4DM0j33o/UV1gNQWP7Noq5DAWqgHL5C+PqdPhPnXKO9kTPLSybDrQni7KqoP76sRVBqGke3idDN
	lrw+4usGOkTyL2BYRnSAj32FSipM1YlzLTyUhwkMoab84c74i20HeDeBzTKzQsswfFEe1
X-Gm-Gg: ASbGnct/V8ah3Xx+cr3vGrvcmtHwozytQrSGi4Dese5ltDJw+6snrE0cbvRt3TPvbTq
	wAPkFFgwgYDH/PXkj8eOgnZ8kd1E0JyUYvBgPsb4B/pC3jQHIkY7OpQ6RN/ZzA5rhT4w3WCJdiR
	783e/JPSkkCvH6GEuy68S5F4+6A21k2Yw1fxA19Oeig0MkaomUYwv5eaW9Ogim/xruHPiA0L6Sa
	it30Dem64HWOxsgZ6G9Qc1A7LGj353GOWdVfnuw8MAkyF7qB2MCjUidtXkQ6OvTx3Oc6FHLtmkV
	35pQVuDke57mOnCzw0143fQF0fI1+fXHPSLlvhU+MBVcKd9YD9D0fjgcdV+R0nOaDysqblndITK
	dIgcVDearU6JYjPxaxFA5hWM6Q8lz
X-Received: by 2002:a17:902:d501:b0:295:6d30:e268 with SMTP id d9443c01a7336-2956d30e6edmr106985075ad.59.1762183794883;
        Mon, 03 Nov 2025 07:29:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkDOLc8z/fx45Y/zAydvBiHcowZMRZLZACMJmr/cQIxvEunHau6mXtknVxHf/vU0taSS7eMw==
X-Received: by 2002:a17:902:d501:b0:295:6d30:e268 with SMTP id d9443c01a7336-2956d30e6edmr106984445ad.59.1762183794199;
        Mon, 03 Nov 2025 07:29:54 -0800 (PST)
Received: from hu-deesin-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952699c9dbsm126087675ad.84.2025.11.03.07.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 07:29:53 -0800 (PST)
From: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
To: andersson@kernel.org, chris.lew@oss.qualcomm.com, konradybcio@kernel.org
Cc: jingyi.wang@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: [PATCH V2 2/2] soc: qcom: smp2p: Add support for smp2p v2
Date: Mon,  3 Nov 2025 20:59:29 +0530
Message-Id: <20251103152929.2434911-3-deepak.singh@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251103152929.2434911-1-deepak.singh@oss.qualcomm.com>
References: <20251103152929.2434911-1-deepak.singh@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 86pe1JPYqY_Xs88Ei0zHQBDhKZhwrZwl
X-Proofpoint-ORIG-GUID: 86pe1JPYqY_Xs88Ei0zHQBDhKZhwrZwl
X-Authority-Analysis: v=2.4 cv=criWUl4i c=1 sm=1 tr=0 ts=6908ca73 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Xvny5BtixxlE2jsoVxoA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEzOSBTYWx0ZWRfXzt66GmdXQdRW
 p4aff3Mgp3aweZIJtvjuMtDz/9fx3mauSIbCTfCY94+eZowqqhEG6KLfpPJJVJujkuWut+zxmVb
 F5ddcvai+UDbgvntgNxdYA73DgiKSPE3Kv9tKeJ7peeoBs9v5812s0vQNCvE8L1E3nLhuR64hFG
 su+MCbvh44JCdwlLrh/PaAknuS7nlPoEDsGUqeIFUVt8d6NAjdnwyya0/UR3kuEWeD6LDd/dDeQ
 wJHp3Nwz4b6z79qWF4oL1UWNpv1KxtRv1lDGxsXEXTzlmqNd9Kr8i6bd0tfixVTiRqdrp9xYgZ7
 DkjBgfwSGIXmd3nJfxqr7rbeIbsdAZcxmJE38WZpTF8weIYLqaqLRx+E+/7kJwY6EjmizM/DNsM
 nl4+gKLZxlUeqSQurXKAFwqZ7KugPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_02,2025-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 clxscore=1011 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030139

From: Chris Lew <chris.lew@oss.qualcomm.com>

Some remoteproc need smp2p v2 support, mirror the version written by the
remote if the remote supports v2. This is needed if the remote does not
have backwards compatibility with v1. And reset entry last value on SSR for
smp2p v2.

Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
---
 drivers/soc/qcom/smp2p.c | 41 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index 39628df36745..c35ca7535c14 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -36,6 +36,10 @@
  * The driver uses the Linux GPIO and interrupt framework to expose a virtual
  * GPIO for each outbound entry and a virtual interrupt controller for each
  * inbound entry.
+ *
+ * Driver supports two versions:
+ * V1 - For processor that start after local host
+ * V2 - For processor that start in early boot sequence
  */
 
 #define SMP2P_MAX_ENTRY 16
@@ -50,11 +54,12 @@
 
 #define ONE 1
 #define TWO 2
+#define MAX_VERSION TWO
 
 /**
  * struct smp2p_smem_item - in memory communication structure
  * @magic:		magic number
- * @version:		version - must be 1
+ * @version:		version
  * @features:		features flag - currently unused
  * @local_pid:		processor id of sending end
  * @remote_pid:		processor id of receiving end
@@ -183,14 +188,23 @@ static void qcom_smp2p_kick(struct qcom_smp2p *smp2p)
 static bool qcom_smp2p_check_ssr(struct qcom_smp2p *smp2p)
 {
 	struct smp2p_smem_item *in = smp2p->in;
+	struct smp2p_entry *entry;
 	bool restart;
 
 	if (!smp2p->ssr_ack_enabled)
 		return false;
 
 	restart = in->flags & BIT(SMP2P_FLAGS_RESTART_DONE_BIT);
+	restart = restart != smp2p->ssr_ack;
+	if (restart && in->version > ONE) {
+		list_for_each_entry(entry, &smp2p->inbound, node) {
+			if (!entry->value)
+				continue;
+			entry->last_value = 0;
+		}
+	}
 
-	return restart != smp2p->ssr_ack;
+	return restart;
 }
 
 static void qcom_smp2p_do_ssr_ack(struct qcom_smp2p *smp2p)
@@ -225,6 +239,20 @@ static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
 	}
 }
 
+static int qcom_smp2p_in_version(struct qcom_smp2p *smp2p)
+{
+	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
+	unsigned int pid = smp2p->remote_pid;
+	struct smp2p_smem_item *in;
+	size_t size;
+
+	in = qcom_smem_get(pid, smem_id, &size);
+	if (IS_ERR(in))
+		return 0;
+
+	return in->version;
+}
+
 static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
 {
 	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
@@ -522,6 +550,7 @@ static int qcom_smp2p_alloc_outbound_item(struct qcom_smp2p *smp2p)
 	struct smp2p_smem_item *out;
 	unsigned smem_id = smp2p->smem_items[SMP2P_OUTBOUND];
 	unsigned pid = smp2p->remote_pid;
+	u8 in_version;
 	int ret;
 
 	ret = qcom_smem_alloc(pid, smem_id, sizeof(*out));
@@ -543,12 +572,18 @@ static int qcom_smp2p_alloc_outbound_item(struct qcom_smp2p *smp2p)
 	out->valid_entries = 0;
 	out->features = SMP2P_ALL_FEATURES;
 
+	in_version = qcom_smp2p_in_version(smp2p);
+	if (in_version > MAX_VERSION) {
+		dev_err(smp2p->dev, "Unsupported smp2p version\n");
+		return -EINVAL;
+	}
+
 	/*
 	 * Make sure the rest of the header is written before we validate the
 	 * item by writing a valid version number.
 	 */
 	wmb();
-	out->version = 1;
+	out->version = (in_version) ? in_version : 1;
 
 	qcom_smp2p_kick(smp2p);
 
-- 
2.34.1


