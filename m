Return-Path: <linux-arm-msm+bounces-86365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 278A0CD9D81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 16:48:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F93430CBFE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 15:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60366348889;
	Tue, 23 Dec 2025 15:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KOAM20OU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AgfYHiyX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF64347BCC
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 15:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766503916; cv=none; b=evVJclq/a1+UdX53KI3+OBO8t7HQsvMfH3XikIRIqoPXfPmtUtnCCyUNkzL4WSi5x6hxooo1wbrasmh80qJJTqu8AhdQpp7SifrgSd1E4whM45/9JX25RpziPc4zS3IfUa3BBh0rp8ijOlbP/F4y0Zi3wnRrHhhmZfUhPO27kW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766503916; c=relaxed/simple;
	bh=mRURSOhF+5oxTsiHB3JzqXrgmG5vJ97h97ZPykOmr8g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pw8TxpLymQha8PJP/i5n/hxIOMUQsSAY9LGwJBFzsdb1HOB08kHMGXoMu6aqX9wn4IBP9BU2lD2Sq1Y3d2ZtQ16EzHELlIKSDkImKz/liSjlUVcs5stDJHi/P/tYCOpFRo+MsQyPMO32n42tLcUBt2rx26jpM84RX6URdkUswZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KOAM20OU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AgfYHiyX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN9kDxr1889180
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 15:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jbONXNm+IJ7F2ekdkqPBXVenYQQPW3TJnPq
	ff6v6Mn8=; b=KOAM20OUgHdcNqJniN2eNCjI0K+WeZvY2AAJ1SwfC6wSJ0Ic+TD
	YyKLP2d6tgfs3gc2KWk+6JNFFbEHRelexnsMp4mKn8bLsVt1Uo5QKHcriCCqH/9Z
	MpeH3L2C1iifkmNDQmMer2BQddZ+LIOb5jJxPDF35R1EhKU1tWIxHuhwa/CSIFaC
	10WVCvUWBBGo3PNBWrCxtsDk6mIuW8LVs64ncL/GeG+gxFIK8NSq+wx0OVFG1H+G
	aAAq8y/U5EgaVOieHs+aN9sFmm1b9OSphtNSSO+oWQdPStcSdeQ65TV/alDj3/7J
	doHAmKfg8516Gk48b0RybjYuof0lOl6qKrg==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b770am1jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 15:31:53 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-644548b1d9aso7083468d50.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 07:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766503913; x=1767108713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jbONXNm+IJ7F2ekdkqPBXVenYQQPW3TJnPqff6v6Mn8=;
        b=AgfYHiyXFzy5fFLRD9brsJGcX3X7fWAzLUvmMz+DBXy5z7j3WEeP37H2k/e/F6TW5j
         DWPXjRsp6LJlOJ8uCHgbsoW2lkS3yCq6YRywoXohWHAVfAfmGfGBZM6wxQHLLzA9yoAy
         K8rbUk0t2q2DclT06C9Q/bho1HFI5OakE6PYroswpV+w7af4pMi4GHcnesvcK+9h/WMk
         wcr3TzabrhCvdKELyrqaZh9JSEdxeUTRhu2R+RIBw5Fg91ZII+/3DEYEoonoFcWKtdtX
         72/8ZxF42UrORQ8Lk8ar+aeWi3Y/ALc374cscL381tQVaoL1PHu1JZhndI+yAXxwzxyo
         c/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766503913; x=1767108713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbONXNm+IJ7F2ekdkqPBXVenYQQPW3TJnPqff6v6Mn8=;
        b=YS9WYlHau6TVrWug5kqzRKyZjY/LkCt4Vwyj99IMHffZgaZIDZwK3kUVeSn2T81T3g
         WWO7aEvC5QtWW9PqcZ6Qy07O7QMYyWw6jevO78BoFFL1kGOfi/XRe+zXojpPY68D+ehP
         AaOw34QY5ugfCtI9+T9OCMGU/UNSObvibbouNtmv5iyxHNcMyVtZb9W8KptAk/cgjWLO
         Cm56Wohilb3XpPVUbBp2eehoRtzMgl65wjs3G7X+hPwsjceCMdFke9uPxOkpFs5gj6KM
         u8vIm+WIbR+TtRyEpkjsJv9aCiIuE/Hy8wtpxQmU3QobNv1LgJPwUOhtFUt/jFSwAYoI
         VdJw==
X-Forwarded-Encrypted: i=1; AJvYcCVeEpMT/uWWgKPDBCtsFmoW9XHQhup5UFtfpcYG69bXjIbrtJxoSfRsDXjlXGgsPg0DlD4i3EI2JFwXmxP3@vger.kernel.org
X-Gm-Message-State: AOJu0YzJlf8+HXL4vUyPvhVSODBUKvM0vUDK0y5vNPMHNRPVVImuvYsr
	6CoMz5LugpRquDN9vd/dhAdO0O59BftEZp2Qpnjna57VCLYXTeDZSov7k14Nn8BpXnHUjUViuVX
	7ClZLdz7ejhOSIas40qkxCKtbtVP3ggWPgisZxX+Dewc0iTC7B0a3AmGhcTdq/tyIcJCM
X-Gm-Gg: AY/fxX6ubMC57OUMTExbUt1r/bC2YyVushx6uLyrrv5aNEKexAGAXNGqUnlc9BdD4nA
	YtsInX8l5LvbKDJpc68Sag3Vs9iVPFvJ9LZ/rPX1FCB5BLySDrxKE4CJUU0dN+eVD3e1UxApnvJ
	FeU5/dTIHcQldzU595fKRtbSibDV5QL4TVGTmwkKBkib6laqzFrCQtJE/8ym4dCpTPJt1q/Xs9S
	7cUxLmfAwhdwoBJ7hF8zCrFVvHC5Gw2GL97NcICWOV5zmgyeUjYuSu9gOw2XuAjLj6pVa0W7Vnf
	E8rD8AOve7M8pExLdQBZ+uySiK6QklEWLYeMFrVpZs9Eq49cXIdlAm8TFRLVN8NmpWhnUCLn0gG
	7PqJRzbkTYF/tPyYwdJEAPcVy8gkxznF1xq9ME8Mg0AOYvZb0mw==
X-Received: by 2002:a05:690c:4b0d:b0:78f:afbe:3e85 with SMTP id 00721157ae682-78fb3f51e45mr264053217b3.24.1766503913076;
        Tue, 23 Dec 2025 07:31:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDYZ/ypVkbjPVdKz60EJU5OhF3k5WjJVvfLWiQfiibbASy0/y73nBqB6WDkm4Ecqp5h0jZuA==
X-Received: by 2002:a05:690c:4b0d:b0:78f:afbe:3e85 with SMTP id 00721157ae682-78fb3f51e45mr264052857b3.24.1766503912634;
        Tue, 23 Dec 2025 07:31:52 -0800 (PST)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a604f5sm1459672366b.11.2025.12.23.07.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 07:31:52 -0800 (PST)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Handle DBC deactivation if the owner went away
Date: Tue, 23 Dec 2025 16:31:51 +0100
Message-ID: <20251223153151.2232297-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEyOCBTYWx0ZWRfX4SAoySidGK+Z
 jYEHo26Us00yA1J1igNCxSg5CId90kjhogxdbNSRxMJWfqa/tUjjorjoCfGpO9ibPhMoO1ezA1X
 mJnSpYCiQjCNZlXjDtRGSnAMagn+bjN0p+GBavLP1RfpSr0SNOFxuOy25J1l3vBZY6A5ED2QHty
 zORsmPvr56IKgt2FPpFKZWRrmWZa+9aseTPIda3J+XTsb22xqMvex3+H0r75Dj9TOZ9C/fEGhAl
 6mUvBO0JCaEp0PDWT0Dw+9W0zDuldxsMy59ZlJ1g4AboEDeNvAwMHPeVsYFXpf2WTqyTqn8HoqM
 nffaPKm87zSfA+tq7X+kBqM+gUX3lyJGCerQjBEOFGW0b8RJeAM/ChaIXFbnepewLAtpd3+xJoT
 mHtPTZUCNyB2ApeVQWhzmbV6QwTSih3zkDhyOE7nf6gpHBr5QauwmqJstdTVPO3g4tfiztZtsIT
 TLR7pnf3vPgZ1EYM6og==
X-Authority-Analysis: v=2.4 cv=VqAuwu2n c=1 sm=1 tr=0 ts=694ab5e9 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=s4thIBPa2s14-dBPQAIA:9 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-GUID: ZX0hW26NcaJV6rD9NEq-gxlkiaKyfmce
X-Proofpoint-ORIG-GUID: ZX0hW26NcaJV6rD9NEq-gxlkiaKyfmce
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230128

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
 drivers/accel/qaic/qaic_control.c | 46 +++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 428d8f65bff3..16bdae028935 100644
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
@@ -1418,7 +1421,46 @@ static void resp_worker(struct work_struct *work)
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
 
-- 
2.43.0


