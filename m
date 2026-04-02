Return-Path: <linux-arm-msm+bounces-101415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLL+GB/dzWlVigYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 05:06:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B33BD382F41
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 05:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39843309699F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 03:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D743570DF;
	Thu,  2 Apr 2026 03:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AIcHgeQe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gWkAj3lZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549A1358373
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 03:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775098906; cv=none; b=IEv0GiC+j1NSUZlQkDuhGokh0H4gR36UP6M+UWVnGOketxYVtgzrzZooPl8N+lnPV2fHcm5PrSQzx4TKwIoDUlOBXTQqTFhG5V/3cS12uBeJ0KAcTpQ3CzWlvx4BO3p1v3+LGv9VR541SeDUOt/evY/977XEQgo9skzcomL/nTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775098906; c=relaxed/simple;
	bh=2Y3ZNVnqNzvGn4NwizHcAhPQrYo7GkEd/vnRF4b+W5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s46dAKrksm63V3vyuXu0twVkLbDN7G1QzDkMCZPl1QtlEi4SySCEaGyj4q1TkawmmlkAJ5tFHjDM8hrcv0pgCP9e5yaJ5myGjaHTPAjE7SJnv5vue1QzRxyfeemGBGsaPIziJo0kZpqloWoAvy76o9089qP+cAbM9VtOLGVCKrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AIcHgeQe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gWkAj3lZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4q1j1966350
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 03:01:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dkodzDOEhiLOVRt5dWjZn1rS8FD4B1gl5hvYY5lrWII=; b=AIcHgeQeRQQHrK8u
	QuwsrkmMTXDqqFZtpEcmF2+8l0DI0uVtc9a8hjzradoR6YY9BIuGkMHgCamAMTba
	wvF0cXS54fAw6E9QCPwISOmBrzE4CKwOSS0YywXA3lRqCfHqK/C5O0ZSzmzX0jKr
	LhQaRbnCwn5zW8HlVIlyGVM4XjVjjHeBNgvhoBCrVloKihhg9TVVlYTG6qiL8fdy
	C3VQ/PxizYwGh9996aOznFkgMt3RANWSdndDVvzh15XJmsthIdtqBGib6yq+rKTq
	ufu3WG2R7JnsjpY0VCcnl19xRR6WHNp2zuO2PeyCJtYQfSQVnKykfeZeH1A6FsHX
	0gNyMw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9b9h0w4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 03:01:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso721778eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 20:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775098903; x=1775703703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dkodzDOEhiLOVRt5dWjZn1rS8FD4B1gl5hvYY5lrWII=;
        b=gWkAj3lZLcLOzREsKfVGFeFw57d/YLOTKqGEf0PbrTpDDdVvQdm/jBH1bZFgzZSiqp
         2MfTLL+7DkpMpcOCHBZBohMf2FK/NkRisQTuuqu5o4ZTq17UqXDCtzUaIFV12NEKFcVL
         IfZueckUqJI4QQNiJq4pdKouwX6lXfm1ULIdwxNqP5xlOCvC858flhYb7YPeCEohWZE4
         YKxwwCvFmp5UFfQTVMDhYlalMoAK3rP8Ke4p0/+jvVdyMrn5YWiKRgHyyODFE7vnPbv7
         UeqpdFpbaw0HErLlHtPWFTjjeovJ0CVVSL+Fl9IxoprcdgvYGSQ6sgSq4U+oJPlllDFh
         Egdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775098903; x=1775703703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dkodzDOEhiLOVRt5dWjZn1rS8FD4B1gl5hvYY5lrWII=;
        b=aQRTn33cBsNFb9nhteoyJaxRCXBl8JGUIZ+6qoObOW8JSFLRC2aAtyboWyT9I/iTp8
         qJT8zounb21okg9ecArzJlLvf6kLYEI+KN+MrEVaFY6p12InY19yGJYOTF3pFqT8il+l
         YTrietVCCnIH73u25lIRg0hSpSoMbL3m82uazUMisf/vtOH4V6pxKPruOn64LRyrUu/P
         Ngorq6Yutz5/m75d0w2vdI+SdB8DPUAA4FEtT0cQTatuWvhtmM/OybmpkCyh63G18jvJ
         aKJ0Mv32RhjGDuFqr2GvlCUlLO/mGWyGV8j0Dqj+XhT/PhlmEpNQrWy6Ibqqd1OP7h50
         JIbA==
X-Gm-Message-State: AOJu0YzsCRKBTwWh7PNxKNFNeEwc/P5RxZBgY5/AZcOs+3YA7pvNQxDQ
	ZfdcVyfHGDq4iDGv+bVPy2ClH+mW/UFS5sEzapZDKefgyVGYQ94IH6Qg0Stj0EK14IukT9rbO6w
	J+jXaE5M1ESIjJ3e3lIKZCeXVMZurGXBo4QEhYVy3swEcu1g3WO4SVrR0P0AfzOeKuew=
X-Gm-Gg: ATEYQzwMqCE0RnVLKQdyyUiNjI8mrvvJeI8YKFwwCVU6wDXuTdv9Ifxn09Oe6GrHyoG
	vdSKtpuEy+N0RCCzvYPsSIT72GgAGXII9kXF3zReMkTLTmaTwaQdEhq1RaDVgZgsyaTmOb5gxZC
	nE+j2igFESTef/lPJ2BT4i1kcMYB/WFArmjSQshRxIcnETWuk8ePmgt7CEN3zELLbYR0y19AxmR
	7dqWZum6JGcYjCcCxKP27uVK8tiI3WHlhrQuNXw5NjIcl2o8l9v975nuAmiBm4fDSG8Yc0fjOUM
	TojPfGBO4vaW1vQWDQkYeq4ALlnt9HHOlxG5T8ONNrTDjkeRindrWOKsmKYP6RVtduHp2Ktwjnt
	qUJ0iIhCXXefnAJ6d0bHxI1JKQOWlYJmBlZ/Y2RF1eJco8i279SI2Wl0BQQsG18+QHFM2LURxYw
	==
X-Received: by 2002:a05:7301:5781:b0:2c7:3a7:c7b6 with SMTP id 5a478bee46e88-2ca8d488e9bmr743711eec.6.1775098902694;
        Wed, 01 Apr 2026 20:01:42 -0700 (PDT)
X-Received: by 2002:a05:7301:5781:b0:2c7:3a7:c7b6 with SMTP id 5a478bee46e88-2ca8d488e9bmr743694eec.6.1775098902036;
        Wed, 01 Apr 2026 20:01:42 -0700 (PDT)
Received: from hu-fruiz-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7cf010d7sm1287044eec.25.2026.04.01.20.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:01:41 -0700 (PDT)
From: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 20:01:36 -0700
Subject: [PATCH 3/3] soc: qcom: llcc-qcom: Capitalize LLCC/EDAC in comments
 and diagnostics
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-external_llcc_changes2set-v1-3-97645ede9f6a@oss.qualcomm.com>
References: <20260401-external_llcc_changes2set-v1-0-97645ede9f6a@oss.qualcomm.com>
In-Reply-To: <20260401-external_llcc_changes2set-v1-0-97645ede9f6a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Rob Herring <robh@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775098898; l=8946;
 i=francisco.ruiz@oss.qualcomm.com; s=20260305; h=from:subject:message-id;
 bh=2Y3ZNVnqNzvGn4NwizHcAhPQrYo7GkEd/vnRF4b+W5o=;
 b=eUVBjU5hPRQgFzDy1xUyDIQWqODJzNfEn0b0yMAFI9sCZwmOKamdcXK7CFzEHSPS9zuYNrJsf
 wJZmEjTYYhwAhgcSxYk3egu7lnbB2Z89rpsfAERYqMNa7IlzKe9zVzH
X-Developer-Key: i=francisco.ruiz@oss.qualcomm.com; a=ed25519;
 pk=Gcv2CX7iHozjnQ4oK+9fINmBiQTmVC4SpaZzoM63CHE=
X-Authority-Analysis: v=2.4 cv=TqLrRTXh c=1 sm=1 tr=0 ts=69cddc17 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=19UnNs3dAo88WjIHmoIA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: RgR0dnwE0Qkt6oLmePTFnzy5jK4mAwbF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAyNCBTYWx0ZWRfX3FOxV8mS4qSA
 91AXIWx3tOyDL36EV/sixJa04utInN9pVsEi5GyvdZDMZ0N4RKO1Uq7c8YWjGrmAMhSuK22zWyB
 RNnxvwE57+w+UsayVPbi+18jrtTE2pv2RF0YRaZDPdr6wf0z/uI8KPqtMMJUAUuWlKYUAow5pgM
 QIbBoXYbsJTD4fd7SaIwuN2NCTnfQn5sa72FlnQNNkKlWyYsIcg0Ms1/lgC0398KG8bk1deWe6F
 3gzCTfnoVObZTEKsSRnk1uLR048+8LouEG/fw3sFB8RpOHlaV1VzQXoVlRt2ewka1XV4Q8OvDPZ
 5xZfCCMdsHJoMBkZUhLCOFLfsdq/SQdNrf/o90Je75N0l9h8itpB4h06kMZ+/tUVLYf/3yMOoKg
 9OPXIDBLpE07e9R8OSsnwFD+ki71jr3F4vktdhVZRoxOwZgGnwAc1PgiuLVMZBLSnNZ8JLhqOIq
 NaKpXKOi8pRd2jgaL8w==
X-Proofpoint-GUID: RgR0dnwE0Qkt6oLmePTFnzy5jK4mAwbF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020024
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-101415-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[francisco.ruiz@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B33BD382F41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Capitalize occurrences of the acronym "LLCC" and "EDAC" in comments
and diagnostic text to improve consistency and readability.

Signed-off-by: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/llcc-qcom.c       | 32 ++++++++++++++---------------
 include/linux/soc/qcom/llcc-qcom.h | 42 +++++++++++++++++++-------------------
 2 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index f8cd35b205eb..dcc08f63e020 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -83,9 +83,9 @@
 #define SLC_SCT_SLICE_ACT_ON_BOOT     BIT(25)
 
 /**
- * struct llcc_slice_config - Data associated with the llcc slice
+ * struct llcc_slice_config - Data associated with the LLCC slice
  * @usecase_id: Unique id for the client's use case
- * @slice_id: llcc slice id for each client
+ * @slice_id: LLCC slice id for each client
  * @max_cap: The maximum capacity of the cache slice provided in KB
  * @priority: Priority of the client used to select victim line for replacement
  * @fixed_size: Boolean indicating if the slice has a fixed capacity
@@ -99,7 +99,7 @@
  *             slice: normal or TCM(Tightly Coupled Memory)
  * @probe_target_ways: Determines what ways to probe for access hit. When
  *                    configured to 1 only bonus and reserved ways are probed.
- *                    When configured to 0 all ways in llcc are probed.
+ *                    When configured to 0 all ways in LLCC are probed.
  * @dis_cap_alloc: Disable capacity based allocation for a client
  * @retain_on_pc: If this bit is set and client has maintained active vote
  *               then the ways assigned to this client are not flushed on power
@@ -4626,10 +4626,10 @@ static const struct qcom_sct_config x1e80100_cfgs = {
 static struct llcc_drv_data *drv_data = (void *) -EPROBE_DEFER;
 
 /**
- * llcc_slice_getd - get llcc slice descriptor
+ * llcc_slice_getd - get LLCC slice descriptor
  * @uid: usecase_id for the client
  *
- * A pointer to llcc slice descriptor will be returned on success
+ * A pointer to LLCC slice descriptor will be returned on success
  * and error pointer is returned on failure
  */
 struct llcc_slice_desc *llcc_slice_getd(u32 uid)
@@ -4652,8 +4652,8 @@ struct llcc_slice_desc *llcc_slice_getd(u32 uid)
 EXPORT_SYMBOL_GPL(llcc_slice_getd);
 
 /**
- * llcc_slice_putd - llcc slice descriptor
- * @desc: Pointer to llcc slice descriptor
+ * llcc_slice_putd - LLCC slice descriptor
+ * @desc: Pointer to LLCC slice descriptor
  */
 void llcc_slice_putd(struct llcc_slice_desc *desc)
 {
@@ -4716,8 +4716,8 @@ static int llcc_update_act_ctrl(u32 sid,
 }
 
 /**
- * llcc_slice_activate - Activate the llcc slice
- * @desc: Pointer to llcc slice descriptor
+ * llcc_slice_activate - Activate the LLCC slice
+ * @desc: Pointer to LLCC slice descriptor
  *
  * A value of zero will be returned on success and a negative errno will
  * be returned in error cases
@@ -4752,8 +4752,8 @@ int llcc_slice_activate(struct llcc_slice_desc *desc)
 EXPORT_SYMBOL_GPL(llcc_slice_activate);
 
 /**
- * llcc_slice_deactivate - Deactivate the llcc slice
- * @desc: Pointer to llcc slice descriptor
+ * llcc_slice_deactivate - Deactivate the LLCC slice
+ * @desc: Pointer to LLCC slice descriptor
  *
  * A value of zero will be returned on success and a negative errno will
  * be returned in error cases
@@ -4789,7 +4789,7 @@ EXPORT_SYMBOL_GPL(llcc_slice_deactivate);
 
 /**
  * llcc_get_slice_id - return the slice id
- * @desc: Pointer to llcc slice descriptor
+ * @desc: Pointer to LLCC slice descriptor
  */
 int llcc_get_slice_id(struct llcc_slice_desc *desc)
 {
@@ -4802,7 +4802,7 @@ EXPORT_SYMBOL_GPL(llcc_get_slice_id);
 
 /**
  * llcc_get_slice_size - return the slice id
- * @desc: Pointer to llcc slice descriptor
+ * @desc: Pointer to LLCC slice descriptor
  */
 size_t llcc_get_slice_size(struct llcc_slice_desc *desc)
 {
@@ -4836,9 +4836,9 @@ static int _qcom_llcc_cfg_program(const struct llcc_slice_config *config,
 	/*
 	 * LLCC instances can vary for each target.
 	 * The SW writes to broadcast register which gets propagated
-	 * to each llcc instance (llcc0,.. llccN).
+	 * to each LLCC instance (llcc0,.. llccN).
 	 * Since the size of the memory is divided equally amongst the
-	 * llcc instances, we need to configure the max cap accordingly.
+	 * LLCC instances, we need to configure the max cap accordingly.
 	 */
 	max_cap_cacheline = max_cap_cacheline / drv_data->num_banks;
 	max_cap_cacheline >>= CACHE_LINE_SIZE_SHIFT;
@@ -5424,7 +5424,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 						"qcom_llcc_edac", -1, drv_data,
 						sizeof(*drv_data));
 		if (IS_ERR(llcc_edac))
-			dev_err(dev, "Failed to register llcc edac driver\n");
+			dev_err(dev, "Failed to register LLCC EDAC driver\n");
 	}
 
 	platform_set_drvdata(pdev, drv_data);
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index b5e917154998..f3ed63e475ab 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -89,9 +89,9 @@
 
 /**
  * struct llcc_slice_desc - Cache slice descriptor
- * @slice_id: llcc slice id
- * @uid: Unique ID associated with the llcc device
- * @slice_size: Size allocated for the llcc slice
+ * @slice_id: LLCC slice id
+ * @uid: Unique ID associated with the LLCC device
+ * @slice_size: Size allocated for the LLCC slice
  * @refcount: Atomic counter to track activate/deactivate calls
  */
 struct llcc_slice_desc {
@@ -102,7 +102,7 @@ struct llcc_slice_desc {
 };
 
 /**
- * struct llcc_edac_reg_data - llcc edac registers data for each error type
+ * struct llcc_edac_reg_data - LLCC EDAC registers data for each error type
  * @name: Name of the error
  * @reg_cnt: Number of registers
  * @count_mask: Mask value to get the error count
@@ -148,17 +148,17 @@ struct llcc_edac_reg_offset {
 };
 
 /**
- * struct llcc_drv_data - Data associated with the llcc driver
- * @dev: device back-pointer for this llcc instance
- * @regmaps: regmaps associated with the llcc device
- * @bcast_regmap: regmap associated with llcc broadcast OR offset
- * @bcast_and_regmap: regmap associated with llcc broadcast AND offset
+ * struct llcc_drv_data - Data associated with the LLCC driver
+ * @dev: device back-pointer for this LLCC instance
+ * @regmaps: regmaps associated with the LLCC device
+ * @bcast_regmap: regmap associated with LLCC broadcast OR offset
+ * @bcast_and_regmap: regmap associated with LLCC broadcast AND offset
  * @cfg: pointer to the data structure for slice configuration
  * @edac_reg_offset: Offset of the LLCC EDAC registers
  * @lock: mutex associated with each slice
  * @cfg_size: size of the config data table
- * @num_banks: Number of llcc banks
- * @ecc_irq: interrupt for llcc cache error detection and reporting
+ * @num_banks: Number of LLCC banks
+ * @ecc_irq: interrupt for LLCC cache error detection and reporting
  * @ecc_irq_configured: 'True' if firmware has already configured the irq propagation
  * @version: Indicates the LLCC version
  * @desc: Array pointer of pre-allocated LLCC slice descriptors
@@ -181,38 +181,38 @@ struct llcc_drv_data {
 
 #if IS_ENABLED(CONFIG_QCOM_LLCC)
 /**
- * llcc_slice_getd - get llcc slice descriptor
+ * llcc_slice_getd - get LLCC slice descriptor
  * @uid: usecase_id of the client
  */
 struct llcc_slice_desc *llcc_slice_getd(u32 uid);
 
 /**
- * llcc_slice_putd - llcc slice descriptor
- * @desc: Pointer to llcc slice descriptor
+ * llcc_slice_putd - LLCC slice descriptor
+ * @desc: Pointer to LLCC slice descriptor
  */
 void llcc_slice_putd(struct llcc_slice_desc *desc);
 
 /**
  * llcc_get_slice_id - get slice id
- * @desc: Pointer to llcc slice descriptor
+ * @desc: Pointer to LLCC slice descriptor
  */
 int llcc_get_slice_id(struct llcc_slice_desc *desc);
 
 /**
- * llcc_get_slice_size - llcc slice size
- * @desc: Pointer to llcc slice descriptor
+ * llcc_get_slice_size - LLCC slice size
+ * @desc: Pointer to LLCC slice descriptor
  */
 size_t llcc_get_slice_size(struct llcc_slice_desc *desc);
 
 /**
- * llcc_slice_activate - Activate the llcc slice
- * @desc: Pointer to llcc slice descriptor
+ * llcc_slice_activate - Activate the LLCC slice
+ * @desc: Pointer to LLCC slice descriptor
  */
 int llcc_slice_activate(struct llcc_slice_desc *desc);
 
 /**
- * llcc_slice_deactivate - Deactivate the llcc slice
- * @desc: Pointer to llcc slice descriptor
+ * llcc_slice_deactivate - Deactivate the LLCC slice
+ * @desc: Pointer to LLCC slice descriptor
  */
 int llcc_slice_deactivate(struct llcc_slice_desc *desc);
 

-- 
2.34.1


