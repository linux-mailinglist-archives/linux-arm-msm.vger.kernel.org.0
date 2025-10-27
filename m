Return-Path: <linux-arm-msm+bounces-78862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D951C0CB9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 10:40:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5408A3A5648
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 09:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06FFC2F0C45;
	Mon, 27 Oct 2025 09:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PjSOtokh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F1D2E8DF5
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 09:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761557800; cv=none; b=TRKkP6olithPyGsjJTmHFAPmnMGuXPTGlJNi7hmvU7mvilLoCfri98WA+s18zQpVZLSb4zn1JVnJHRVgd3zYinDNnCTHfaK4hICCI2BIBOLJsXRr3OvlqLgGQaSZyN/OpB017qOh/mbkuWt4Km42CHhKc2gKfc1Yyg7SyeSzbWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761557800; c=relaxed/simple;
	bh=Khj94kjwzlJbqlD/zjORwwhcFLyw8gdkdROyQ3iMPHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oZIYByAyp6xv6rQHx3oFbIKtGmFfNostvdpj3jI9HMMTcl1iET5+6iOdmWFpuqo3ZHrcGiV/DambDM9+DW9siYB5QhCE6rjWZS9RLlt97+YN1lJX0tun+qiVCHU/0TjE2VOLkGakiQ9oMBih5SzhMLJ6bMWCiejRwlEBpbXcJGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PjSOtokh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R8TW5v1002902
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 09:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ENIfG/XFqoejrJF6odTVWj
	Lh+6lA05rZTNqAr24kEaE=; b=PjSOtokhFThbRN/QDQg7iwJBEFe3XUJxANEpot
	RHPVSPyXEqfcU6YbBCKhZ+VRVSZxYwJ0vIwUpJWGLbP/OYCIAfRBaIFr5rZbLlLN
	3T9Je1LLosHZINgCmvUx89vE1IDYH1uMT1jQw43Ofrmvh+PDkurFK0KtCuR54Ehr
	eBfUxuLAvNM/Tsncm4LO1hMjJWmHaXW7KdzM63+Rfhqky3tlStSthXsaf/j4QKk0
	gBWxb630Nj4jQTFPFAEqxLLbdvGimYKJxLYoURxYI2uB7vVwpsx6hw8O+76EimJR
	9H6Fo8sve9QaHA8qidmHRnfIPoG1e2STImZ7Qi1PSfnSV8Lg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0p4g42cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 09:36:37 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-78105c10afdso3872905b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 02:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761557797; x=1762162597;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENIfG/XFqoejrJF6odTVWjLh+6lA05rZTNqAr24kEaE=;
        b=k7TDdw+Wj9683KXYMf5ALCqb/evhGd5eR1u0zLN3axgXTsjHRResqiKSiUc2NLN+K2
         heQQ2rmLV4g5dlI4vcrC8ilN4ibSAaIUh8Dv7A0T1Y2lZulroHssvhVqmK5amrH1a1/P
         m1qE8a0lRD0FX0i8tG+ApMW0N3hWQIkaPx9ne463sxQsAXkQTmJXdRZN4wD18x6mJKeN
         ereI/kR4h5+c2ItqCPWGJ0b4Ue3tkwXhdrh/oj3/+zUImxQzhrwNEbfvlVQu+yZ1yo1S
         nbWfLqOGEtLlzDGd8WQlThK2d/luDXeqN069bCeAC+SfXipcwIrL/HfORH70WFFQqeDX
         Zeaw==
X-Forwarded-Encrypted: i=1; AJvYcCVuczZsl04kdr2/+mgs/PmlL5tVQwlcd9D6zaiYePgvJtfRJoU2hkkAIH84MVJ9q6BdajOBUZX3N+rNmtz8@vger.kernel.org
X-Gm-Message-State: AOJu0YwDrENINpsv1XlpmbWMOoPNciAGYsBf5t0oK9hxE9jSr77sXOR9
	+2qeY4+Zh71N3LeK09lHd81IW2/QlvXR2oCsQOqoEJKMWf4aiMLZZs0NsxGZRazrdiQcizO9/B/
	gf73FcE+NWqOFk+oyvcOWpEK8mA2eXx2IF/Fx5I6xQtTFZoE5/NEMVBEh9fx/OVvpgXMq
X-Gm-Gg: ASbGncux7pVCPm3tai37keG26F8qGpFi8QiD6o5bz0ED6542vLv883Gmdl8x3qEb5p/
	GycuGBRXADINgJgA47kd7vC2gZSbOe58m4XHrTzzw1sDG33cUfghzpj2QpFifXx2qKCLlC3o8jb
	glq7xsZcXr20iH5RinW64hRnvmivXYSGocyj2QFQvM560Rtf2ZKeSA2WjzdBkkP+Yegk/lUc7ua
	O+kJxD0P/6Xz0HEEuBGGeJpxF19eoSDYPJsRw2T15fHxRGRDohOtH0Igy4jzE30kHLQQT1qB7+l
	rfRr61NbMRes2m0WXekm+jhLUbDdPwgjCN/uhzazjhSXZhobWj84H6KTDYI4dGOYBqNiH301qrD
	CSVW0WttWZQF8XiB6qM1c71i2tLj1aaNGzbwbAtkviz1NV0tjcPULBKeZmXjJ70dBLDl/ZlmwC3
	C5DQ==
X-Received: by 2002:a05:6a00:2d06:b0:781:2272:b704 with SMTP id d2e1a72fcca58-7a286765aacmr12626239b3a.5.1761557796996;
        Mon, 27 Oct 2025 02:36:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAFiQ7WbyW6vRWAA69khlgDmMsnnZ+1kMFCE67svLShDKNyqE5vG5rLgQQdpOVFLPl4sbfLQ==
X-Received: by 2002:a05:6a00:2d06:b0:781:2272:b704 with SMTP id d2e1a72fcca58-7a286765aacmr12626204b3a.5.1761557796479;
        Mon, 27 Oct 2025 02:36:36 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414032c71sm7605282b3a.25.2025.10.27.02.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 02:36:35 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 17:35:59 +0800
Subject: [PATCH v3] media: qcom: iris: Add sanity check for stop streaming
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-iris_add_sanity_check-v3-1-232ad24d75d3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAP48/2gC/3WOQQ7CIBREr2JYCwEKpbryHsY0lFL7oy0KFW2a3
 l3auHChmz+Zn8ybmVCwHmxA+82EvI0QwPXJZNsNMq3uzxZDnTzilEtGOcPgIZS6rsugexjG0rT
 WXHAmNFU7qYSsGErZm7cNvFbu8ZR8C2FwflxrIlu+HyLLqUqqiCiExAw/U6d2ZJGDC4HcH/pqX
 NeRdNBCivwr/XdP5IklVF5ljCpd2OYHbJ7nN3rYFUf/AAAA
X-Change-ID: 20251021-iris_add_sanity_check-34a0795745b1
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761557793; l=2209;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=Khj94kjwzlJbqlD/zjORwwhcFLyw8gdkdROyQ3iMPHY=;
 b=em0DoN2wg7lN7Dz4uWGbJvHlky/OUnrEB9kke3FX3k0obk747wBvdC9HCvU1M4/vPLf34iz2N
 xdxLVxAuJcSB657fkuwBfzxVYa28c1JQSvxcB5YZVwkS8qMtNI3WHNh
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: DDW8p6HKTSKbbL0jLMfgbONOiuvpjfrc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA4OCBTYWx0ZWRfXzP8hH4MFCxbI
 hgp3LP3jECy/PtrJlagCNZ5qVxY8in/bTNkADYjq8/jSAq/98yxPHCTNom2wle2oMHxwxGZSBWU
 a3HMQhFO9hRMOa5oT/2uzh3Uu5Cu6Co8XkFlaHUHV6TdIa+yujiI8hN6AhemE4WMiVLv0Pz8wBR
 PVbQbrxDj0DLJa3K7Y0fvRb2Ha43uSGhInIl7WJtyllK8yHxxInhnvCK9rRSgQuB+fbAIgi9q14
 39JrxeUvvxZar/mLogx4pflT6kVjNWvwQxlK2aeWPNDKOaJOSlkPZRB9bKBfuylXg7pvVONfXhN
 4qxr8OP0xxsc1TQch/pgQpJTY5vGsTxUwz35v91IWXdMwhluFYCO65aQF06O6s9KXbtaa3G99Ay
 qbrhjSdJ59LCipl4KXsliZNC1x9ZkQ==
X-Authority-Analysis: v=2.4 cv=L9YQguT8 c=1 sm=1 tr=0 ts=68ff3d25 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ypO2gLpQ1gAfsPQhGccA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: DDW8p6HKTSKbbL0jLMfgbONOiuvpjfrc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270088

Add sanity check in iris_vb2_stop_streaming. If inst->state is
already IRIS_INST_ERROR, we should skip the stream_off operation
because it would still send packets to the firmware.

In iris_kill_session, inst->state is set to IRIS_INST_ERROR and
session_close is executed, which will kfree(inst_hfi_gen2->packet).
If stop_streaming is called afterward, it will cause a crash.

Fixes: 11712ce70f8e5 ("media: iris: implement vb2 streaming ops")

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Changes in v3:
- Add Fixes tag.
- Link to v2: https://lore.kernel.org/r/20251021-iris_add_sanity_check-v2-1-476b3107a8ef@oss.qualcomm.com

Changes in v2:
- Remove redundant ret assignment in ERROR state.
- Perform error handling according to the value of ret.
- Link to v1: https://lore.kernel.org/r/20251016072517.4845-1-wangao.wang@oss.qualcomm.com
---
 drivers/media/platform/qcom/iris/iris_vb2.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index 139b821f7952feb33b21a7045aef9e8a4782aa3c..db8768d8a8f61c9ceb04e423d0a769d35114e20e 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -231,6 +231,8 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
 		return;
 
 	mutex_lock(&inst->lock);
+	if (inst->state == IRIS_INST_ERROR)
+		goto exit;
 
 	if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
 	    !V4L2_TYPE_IS_CAPTURE(q->type))
@@ -241,10 +243,10 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
 		goto exit;
 
 exit:
-	iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
-	if (ret)
+	if (ret) {
+		iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
 		iris_inst_change_state(inst, IRIS_INST_ERROR);
-
+	}
 	mutex_unlock(&inst->lock);
 }
 

---
base-commit: 13863a59e410cab46d26751941980dc8f088b9b3
change-id: 20251021-iris_add_sanity_check-34a0795745b1

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>


