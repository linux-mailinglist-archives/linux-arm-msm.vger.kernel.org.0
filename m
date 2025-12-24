Return-Path: <linux-arm-msm+bounces-86583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BCECDC85C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 15:30:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 593C93026B3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 14:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C266349AF2;
	Wed, 24 Dec 2025 14:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dBX+zNDA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OlIRFM1T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA922EA171
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 14:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766586622; cv=none; b=d29XiKuG+YRx56fbgpl9csSnnPMWU7EfDx1NDmWqpXyoDd4ZYutYio/kletBxII8OPyc1WAqRjViFb2KrNZqNAqrIuXBwRGcMO1ukyLtCJewa3Y206Ar4xZhtwDfayyOkgLGQ1LSZ97o5FGptFL9gZsJxyl17qaesY0PyAhyTHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766586622; c=relaxed/simple;
	bh=0D9zhweoSa211IiHIoliGoiegDsF4Vt8fspdCps8d2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YnibS/cvOc61R2nR6V3NvudMfwbIKxXwgWswojTjYf/B08nxSQqkCWJT9Xs8vx838dYmIVTKy6CGQEBeagrNLe1oCZitblD52TH4NOoZSSn/a4g4anjlU5DclLC+JGpYM7IkFRqMEF2cSAyFrWmyyCLufLaiYVzwDWQeeF0cH4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dBX+zNDA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OlIRFM1T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO6HEwB678470
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 14:30:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uN953iS6eEmzv0omwG3U2PvRvqgZptxlJAA
	pEKpbMJ0=; b=dBX+zNDAcbxfl150SJjWhSVXHGgisWl4Cdu5MukMPsTOQWD/qud
	Vt48XdJZjw9L1HD+BpZPV2cxpz5rGlZWuADq4NFdxnpUb6y7lWY7VKsigAdg3c3q
	tWnR8WctPBk43l6BjsqdX6Mac4w3gkX36nAh95HwlV6D5kTI3WQoPSrmleXFPwK6
	NzQk/9r4zP/MT5X/wI+KwJUxTZUUZVnTppPeWOMYVpZZ8WBWn383ILJVrOTFHDkg
	87wFnpTwsKoWdYu23glHd+WFfNIh5x9/1fBcGS9/nWz9SJhGGIcGt6rEaI/gNQ2X
	KvFdAand+LSHIZO2+XrxQP7WNWITc58wlIg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7yvq2ty0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 14:30:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f4a92bf359so130453641cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766586613; x=1767191413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uN953iS6eEmzv0omwG3U2PvRvqgZptxlJAApEKpbMJ0=;
        b=OlIRFM1T1NGWKtFvJgnjgBjhGAxEGRhF2mQQ82z0ilcE72NGJ4jfvzqyfgBd1FVbtL
         VClhP6KG3O71H3UXAeTiXU2vK110wzLTawVgqWjGsw0YLsLpAdI/vxoiF5aoNknvzC00
         /EuwHvL3yON9CrD/QhkyOZb//m5tDH+N44Im0EumR6K3SfVTsK2TGKh6R40IWdIpuXzY
         LV7E1rPQrk9xqcCfwdzBN+zS1rCOLCL1bGqYtBKFLj9yhCsH7UNh4RuMGiW49y//Qv8g
         zFLEW0Npn5AqM3i52WwFo6RPh4rGcgUai8LABRZydRJNXVXtBSramC+zrhT08iIM9S45
         WgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766586613; x=1767191413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uN953iS6eEmzv0omwG3U2PvRvqgZptxlJAApEKpbMJ0=;
        b=N+ctEiVIEd4ca9ybMKgkx6W4+LQoo0mmFCvj2lnPAuTTe+kK5wsp6CMJ3W6yGhdxZl
         pV7aSOoB63OLFtiI2ip2/fuQqLCEL/HjKvxzPyk+0N8M/FwSB1BEVW7vl7+Qbx1VdQqm
         /3UiSCW1ADqG4/xm/Yqn83YccgdeX0MD9gTLBG5loLCpaKgaubaMhdUuCD4vzBBp/hnJ
         lPfwNae1Du2vt8Z8mrIWm+doYO9z95YqGpT8+XQRI9tugUq100tu8fRtKSepc2KW+CGr
         m1aRofhjOi68i7wVSDj/YCV1uXmrZDPHx+LU0JVXOrO7dqxV9KUJKh8ela8z1fRZLwYi
         fa0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVd5fl2zqidkye+eRWZbSXFA+UlWWNY4dU6s9u7k9pJPD3HNw5GUF+1wUb2Z7OfdSi7Wjqxmkc/4a3k75Jt@vger.kernel.org
X-Gm-Message-State: AOJu0YxtPUEciW5ZCuHCZgRDg5pgQnpJqyFfVn8T91i3lGwu0H4hm7kN
	JgqBF4DDsMtgB/72EzByxtP7ThGAOxWekkBfWo5GLXYFsPH1nCL9qNUL3nBfv85+1e/3k+oYiv5
	ZPST6bBFDBnArBM508mfoC4Sny9Z2ySuhoBkHzufI/h3IfEJn4t7ItID/Rt0mDX5cujrf
X-Gm-Gg: AY/fxX6wTcfKDjmLyHx/pU8P6EjhP84fdoeB2FbCfAFBDWLwLJdJUCyc77DyN7cCa+A
	8zudSDIBeJ6oDzSR+qBXGzoex/j3bJS2pwCulveufzcAE5wBGRBXL+f5OL2k/VJ2pVFKoEv7PSw
	MZRjJ+J7bzNvA4RTmCEo5QWEEvuL/Cmpa4kl+5u46OKaQTdk1GmrchrGEwhzkPr3g8IkOJP+bPW
	LBcTdlW6JAk0EmzxLLR4dp0v9fpD2+qH2c4RsGAn7VUSrnLpnXK9yQtGBWXWmGJoQs1j8TN7uE3
	kqtA7LZMK+K/7ZhbwEGBC0q2SoGuOz1uusn37M8rJWwhtJ291s9XwbNyOxVlxzAj3FUr4XlG7w6
	GSOnWqdZDF0wveKivgkUMHPncaWneBav+mVx031E7E/9knnOoRw==
X-Received: by 2002:a05:622a:446:b0:4e8:9ca2:b9ea with SMTP id d75a77b69052e-4f4abdb2ee3mr276576931cf.56.1766586612940;
        Wed, 24 Dec 2025 06:30:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEw9OC5D45n0ob5GBxamYvnr4jL4bzFeiezFrGRyPuTz6012F4z+LAd6Gn3ppgHBEYT1fr/wg==
X-Received: by 2002:a05:622a:446:b0:4e8:9ca2:b9ea with SMTP id d75a77b69052e-4f4abdb2ee3mr276576051cf.56.1766586612276;
        Wed, 24 Dec 2025 06:30:12 -0800 (PST)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916b5777sm18033649a12.33.2025.12.24.06.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 06:30:11 -0800 (PST)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2] accel/qaic: Handle DBC deactivation if the owner went away
Date: Wed, 24 Dec 2025 15:30:09 +0100
Message-ID: <20251224143009.2769836-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wABVif32i9SxU43SuP4VdeciZteCqqTU
X-Authority-Analysis: v=2.4 cv=abZsXBot c=1 sm=1 tr=0 ts=694bf8f6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-VEhWQ6g2OJpjJ3o7oYA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: wABVif32i9SxU43SuP4VdeciZteCqqTU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEyNyBTYWx0ZWRfXzd8xcYaeZtLp
 lDSqSW5AqBUKcmuImS8tzwF28yC39KCPTFeMOSrwoGSWIWpYAQiIr741uZlPhaNdewo0lJuBKdQ
 1lYyiQQtAyg2ao+z1xlNiEI678nn0QmAttYfKBOg+8BytKE9vOuwyES8k/9w89DkcXL4GqRJazV
 +1lMbzqKfTBDZms1CNJ/uBajLvbClt+xHkdsuyhxWkpLupC2yixSE+iVgyQU/bVmuSf7px2oUnN
 /e6yRAXroZfjM8JZDXWdBg08V6bS/3y3RTO0R6rzFicQkP1HVrSd8IizaTypv4ixnEBHVmjxxAf
 JOrVEkreJp80LbkrI2trGyANRWRDNYgxCDBFVupiZyOPNfHAhdSa39y3K27Tpu7j35PA8NBePxM
 Rb71oGR5BwhbklvMY2fZsGUbQ0/V4LeIsJ5CaSFO0p30VektGTVAO5L37PJ+74k1qK5Kb38kkC/
 DvM3N1Nw+KPqZuvT5yA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240127

When a DBC is released, the device sends a QAIC_TRANS_DEACTIVATE_FROM_DEV
transaction to the host over the QAIC_CONTROL MHI channel. QAIC handles
this by calling decode_deactivate() to release the resources allocated for
that DBC. Since that handling is done in the qaic_manage_ioctl() context,
if the user goes away before receiving and handling the deactivation, the
host will be out-of-sync with the DBCs available for use, and the DBC
resources will not be freed unless the device is removed. If another user
loads and requests to activate a network, then the device assigns the same
DBC to that network, QAIC will "indefinitely" wait for dbc->in_use = false,
leading the user process to hang.

As a solution to this, handle QAIC_TRANS_DEACTIVATE_FROM_DEV transactions
that are received after the user has gone away.

Fixes: 129776ac2e38 ("accel/qaic: Add control path")
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
Changes in V2:
- Add missing closing bracket in resp_worker()
- Link to V1: https://lore.kernel.org/all/20251223153151.2232297-1-youssef.abdulrahman@oss.qualcomm.com
---
 drivers/accel/qaic/qaic_control.c | 47 +++++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 428d8f65bff3..53afb647ecc4 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -913,7 +913,7 @@ static int decode_deactivate(struct qaic_device *qdev, void *trans, u32 *msg_len
 		 */
 		return -ENODEV;
 
-	if (status) {
+	if (usr && status) {
 		/*
 		 * Releasing resources failed on the device side, which puts
 		 * us in a bind since they may still be in use, so enable the
@@ -1108,6 +1108,9 @@ static void *msg_xfer(struct qaic_device *qdev, struct wrapper_list *wrappers, u
 	mutex_lock(&qdev->cntl_mutex);
 	if (!list_empty(&elem.list))
 		list_del(&elem.list);
+	/* resp_worker() processed the response but the wait was interrupted */
+	else if (list_empty(&elem.list) && ret == -ERESTARTSYS)
+		ret = 0;
 	if (!ret && !elem.buf)
 		ret = -ETIMEDOUT;
 	else if (ret > 0 && !elem.buf)
@@ -1418,9 +1421,49 @@ static void resp_worker(struct work_struct *work)
 	}
 	mutex_unlock(&qdev->cntl_mutex);
 
-	if (!found)
+	if (!found) {
+		/*
+		 * The user might have gone away at this point without waiting
+		 * for QAIC_TRANS_DEACTIVATE_FROM_DEV transaction coming from
+		 * the device. If this is not handled correctly, the host will
+		 * not know that the DBC[n] has been freed on the device.
+		 * Due to this failure in synchronization between the device and
+		 * the host, if another user requests to activate a network, and
+		 * the device assigns DBC[n] again, save_dbc_buf() will hang,
+		 * waiting for dbc[n]->in_use to be set to false, which will not
+		 * happen unless the qaic_dev_reset_clean_local_state() gets
+		 * called by resetting the device (or re-inserting the module).
+		 *
+		 * As a solution, we look for QAIC_TRANS_DEACTIVATE_FROM_DEV
+		 * transactions in the message before disposing of it, then
+		 * handle releasing the DBC resources.
+		 *
+		 * Since the user has gone away, if the device could not
+		 * deactivate the network (status != 0), there is no way to
+		 * enable and reassign the DBC to the user. We can put trust in
+		 * the device that it will release all the active DBCs in
+		 * response to the QAIC_TRANS_TERMINATE_TO_DEV transaction,
+		 * otherwise, the user can issue an soc_reset to the device.
+		 */
+		u32 msg_count = le32_to_cpu(msg->hdr.count);
+		u32 msg_len = le32_to_cpu(msg->hdr.len);
+		u32 len = 0;
+		int j;
+
+		for (j = 0; j < msg_count && len < msg_len; ++j) {
+			struct wire_trans_hdr *trans_hdr;
+
+			trans_hdr = (struct wire_trans_hdr *)(msg->data + len);
+			if (le32_to_cpu(trans_hdr->type) == QAIC_TRANS_DEACTIVATE_FROM_DEV) {
+				if (decode_deactivate(qdev, trans_hdr, &len, NULL))
+					len += le32_to_cpu(trans_hdr->len);
+			} else {
+				len += le32_to_cpu(trans_hdr->len);
+			}
+		}
 		/* request must have timed out, drop packet */
 		kfree(msg);
+	}
 
 	kfree(resp);
 }
-- 
2.43.0


