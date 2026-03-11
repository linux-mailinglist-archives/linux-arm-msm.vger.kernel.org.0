Return-Path: <linux-arm-msm+bounces-96851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMYhAhvhsGkuoAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:27:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BF025B913
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:27:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 26BC9303FD25
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041E8372EFD;
	Wed, 11 Mar 2026 03:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AtscbT91";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a1NxzGQV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072C937DE8A
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773199469; cv=none; b=RkGmUyNv43N1pNQkaBsgKB7U0OURKO4ON+iacEd3ZZQNR7rcNXz1Jom4KKBrQ3DLrJJeZuA0wdDEDxx2oQQ1MwvB71JlqmpKg1of9cScBYsbvE0E7QpvWXEhYsbzZ48rRSAE3/DdIbUxf9g2azHrJla+kM260iwix+SCCI8r7w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773199469; c=relaxed/simple;
	bh=cuqO+m9BSceBUKXzD9bGuTtW3yUhyLay2fImgUonSHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eZxww0ME10UfLsQqB8lvTNSMz9GtFxhRpeosTsTpcDdm6vGQI0tGpYQJ121FxEEu2r4cw9e2ghWgLQaslw7kbhdF0VwiE7IFxPEFswEgfUHKCCZ+pQF8wChY1wQib8yilsdSapJVH3E4I34oiDb2I7dlf9tYeYq3VWgFdD6zTVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AtscbT91; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a1NxzGQV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B1Jvr8509379
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wCF7c3TBX6o+MiU7CsW3tf4ENTO+38tQp5kbxgZiMT4=; b=AtscbT91Nw9VV5Jh
	CygIDwFPGhuuHK9MdkPtz0c1LllZJG2R4Ix6KMPYbhSbBUdim56Q6vFZf7MkUQWy
	ppOdkgzQzq+K1N1wGjMOOsgRFSXrZdjrsXPjExmzZJVKWsuU1/3dfVqpBhkepRSV
	M+ThEw4P/CgTL4audQTXUlnCngvB0uVv+WWvzemtyTYCxQsTmWzv185fwYY0qQfQ
	9CKWziGFpwKRnt1xCtwu1K7uE5rI11XDjxpyKros7qazPCYgzKWwABbdovDrpnfs
	VZAByNSd8mw7XzSaugoQdOCPPzqMaFF+xadhR0VHns8ln+gjDKBscrsgTS6HI+SX
	wyHIWA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctppaj148-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:24:22 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94ad0ada31bso5462881241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773199462; x=1773804262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wCF7c3TBX6o+MiU7CsW3tf4ENTO+38tQp5kbxgZiMT4=;
        b=a1NxzGQVNI13r5Cs/eXh7qMk59/wMnUBlGUQZDjoLU+aizF4beC9XmObnPXcQURAWO
         w3f7IS46+iFX3qcyGOTzw4U9QxX213IxY/y+9RV3mcK0FrR657/F9VGxKjQVLq6kCS/r
         uOvfb7JD97rcRQGg8fQ9s60Eav+MF7G8nWfOFyeEuSxkHS1JTuKyVrKsWCrshdbK1Q36
         /JooukkhlIiGMpkSfcXF8c6uHXFuQpErSgkqjbwEgVdVrOk+xzSN0nega7ug6RrU9RMR
         ChEBE1JdBQ4m4U6eB8Mhlzhg6pN9u0Zq7BuawJFvR/6NIUq4SRF3R/uL6I2xVWDLXb13
         s63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773199462; x=1773804262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wCF7c3TBX6o+MiU7CsW3tf4ENTO+38tQp5kbxgZiMT4=;
        b=ioe687VkqRXpYInmgnooIFJGnGLLb44tm2r3c1jCWM6l1Nip+wZWIuBZDlmpQ2MO9m
         7Jlwx6NtfBSY+p1OtOoZAe1XUxKtwyrCeBhhBxk2OyBHzW8zLY9U6KGlBxT5cNDryDLl
         PPJQFGuHhwLmlvGYnVcx9jJGxelhIwWrXQwFcQac5jVL03v0NHdBJ9UjeaC0NOIkAGgo
         BN+pevqKWJneuFawi1ufYb07rgzz1tNmVxHVAQZ8NlLAxfr6svs5NKwYayvTLgV2/qT8
         FZQZihso5elCa8qdi7e/Q9wDAz7EOmqzmsk3JNWMPOPykGEnixm2TkqIKoQSF0d9cBdq
         7e6g==
X-Gm-Message-State: AOJu0YyA9w02OTbgEaPyGDnf6CL+vvdtdlElk0pDuAgEE3jTJtkh+nWO
	Kqrp6aERu2ih8uBivLoUuRxP1zGPWrg02R1uT5h5J2daVJu4eXIx2peyL8d6Ctl0msJykMwRl2x
	ZNrVhBoAyoIlCW4cryQuxnw40O31s3WQt2LF0rnaKc/MOBL5JIuHznqqBZveDNK0s237D
X-Gm-Gg: ATEYQzyruPv7PBFk1kEIaVUVgqyKJhvZr/QvskIigTJx4yq/6rdpErozZcY1RaGpslI
	Nmib2/6aLyDAoyM8A0WI4d8WxcyAMrwZ7e/uFcitMdpCw4hkbWkgPsXF723AaFwx1tPhI+1rUV5
	EOF9OeYZTh/86y8j87LhmS874LOOXSKdpHZl1lMyAAAA8eIafAFmavA64mVqgw064sLcOqh8RQr
	tPKyYBpXyq5JNPK7VuH//bJqBkyNlfN85kQ1z5s+uDglIRf5RhkwnfXrY8OaqzP8cj+8prIedHI
	EGk+/30BmOsjJYTSb2HVJuubb8hPSNh3Jr+KsU4mcTWoptKL8oVK+wxV8rIiFoPbbsLcvqjmnMY
	X6zUEW+g29DtKTiNGCoJsm38bg0f/lLHZkKebg6jWd7s1W8gS+lytDtH9s1jqQZUuSzEpGtWbMa
	5wAs/1kmu4TMNdo4TznEO2J3VGI4ehdHtNe4w=
X-Received: by 2002:a05:6102:3910:b0:5ff:e545:593a with SMTP id ada2fe7eead31-6003a5966ffmr2480879137.21.1773199461586;
        Tue, 10 Mar 2026 20:24:21 -0700 (PDT)
X-Received: by 2002:a05:6102:3910:b0:5ff:e545:593a with SMTP id ada2fe7eead31-6003a5966ffmr2480866137.21.1773199461124;
        Tue, 10 Mar 2026 20:24:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed41sm1422721fa.25.2026.03.10.20.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:24:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 05:23:19 +0200
Subject: [PATCH v2 25/25] soc: qcom: ubwc: deduplicate UBWC configuration
 data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ubwc-rework-v2-25-69f718f2a1c9@oss.qualcomm.com>
References: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
In-Reply-To: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=11102;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cuqO+m9BSceBUKXzD9bGuTtW3yUhyLay2fImgUonSHI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsOAhREKwJvo7jCv/CEBMykx97M6YMRoklSQVt
 Ddn58OtmxWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabDgIQAKCRCLPIo+Aiko
 1f2ZB/4/VxhpF+vhW9SiD8SPjfbW9w1HKjz1EcTkmfvkZD/AWIMWzOQvIo4+hqQTFjgd9+Zxjh5
 JQ641QxnOKIaFvpxc0SJZi3Nd8xStBFbBlsVFFzlODdBaLiGfXtVLi15z6aHVytqO2TqwTmqoUx
 gAS7jIBWXIlNMVM3zVR8EQvIwFRTWtNrE7T152c+fHO2qdlTcE606pTu2L99QeVxVpgfDrsfd4n
 ypL46lH/ELssFihKiR7A8Gyn5M5rnMElql34ArqQ8ShKXm/bPmUut8oIM54UWS+EI7zAQaf9vgI
 I55JnyNgS3g0mN+61+b6v1ZZHKGfacELtx9YTHiG2QGB+VRB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: GvMz8O6_HTgd2619O3mi_eOfl22Zrvb0
X-Authority-Analysis: v=2.4 cv=D7BK6/Rj c=1 sm=1 tr=0 ts=69b0e066 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=f57iFBScQPT45aafJKQA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyNiBTYWx0ZWRfX34JJkIFOh5ns
 kMRjSkE/S+JWZnEY18p9zDmiLVpXhjvRtmzt1P50XTpU+gEHwxIC6QnD97kOnWpY+3MiqOetPWN
 mTojTC3jih1u1Dzhtovbfqx7ttr1YcCxFC1XtdPjGczqYGYbfSiLXQOrP0KN0IV8E+fil20YDSj
 fL4DGemczcPmf52YjiBbr0AbDx4IUJY/e2a1Xi1IEHYuZzTuWFPGydE1QcFwW1LnI1QiEkV+xlb
 LQBMGOm3SlZpMniGZv6gMAXNw5J7nuC6suzBhzRpvnvoQBQqKlQK1+9QxpL9HDlztbYfiMrLnqd
 mv37xHIHt5gMQfW0+53G3b2WMjx2OuXfMYAv23gGm4sWHRgEEW05sE9S5gcS/zHUYyx8nhobyqa
 eydcuiC0SFQC2BIX8Oq8QzPvcZIydYqhs/9N4bcfoIinwcZ+tJy9aSIoyIhsxdLk5nzmvh4yGE6
 LEMmQS8vPQqeQmjFQQQ==
X-Proofpoint-ORIG-GUID: GvMz8O6_HTgd2619O3mi_eOfl22Zrvb0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110026
X-Rspamd-Queue-Id: E3BF025B913
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96851-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

After removing all extra entries from the UBWC database it is easy to
define generic entries, common for all machine classes.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 189 +++++++++++++++--------------------------
 1 file changed, 70 insertions(+), 119 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index ccee20913115..2ee40a26ec68 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -16,119 +16,70 @@ static const struct qcom_ubwc_cfg_data no_ubwc_data = {
 	/* no UBWC, no HBB */
 };
 
-static const struct qcom_ubwc_cfg_data kaanapali_data = {
-	.ubwc_enc_version = UBWC_6_0,
-	.highest_bank_bit = 16,
+static const struct qcom_ubwc_cfg_data ubwc_0_0_hbb15 = {
+	/* no UBWC */
+	.highest_bank_bit = 15,
 };
 
-static const struct qcom_ubwc_cfg_data msm8937_data = {
+static const struct qcom_ubwc_cfg_data ubwc_1_0_hbb14 = {
 	.ubwc_enc_version = UBWC_1_0,
 	.highest_bank_bit = 14,
 };
 
-static const struct qcom_ubwc_cfg_data msm8998_data = {
+static const struct qcom_ubwc_cfg_data ubwc_1_0_hbb15 = {
 	.ubwc_enc_version = UBWC_1_0,
 	.highest_bank_bit = 15,
 };
 
-static const struct qcom_ubwc_cfg_data qcm2290_data = {
-	/* no UBWC */
-	.highest_bank_bit = 15,
-};
-
-static const struct qcom_ubwc_cfg_data sa8775p_data = {
-	.ubwc_enc_version = UBWC_4_0,
-	.flags = UBWC_FLAG_DISABLE_SWIZZLE_LVL2,
-	.highest_bank_bit = 13,
-};
-
-static const struct qcom_ubwc_cfg_data sar2130p_data = {
-	.ubwc_enc_version = UBWC_3_1,
-	.highest_bank_bit = 13,
-};
-
-static const struct qcom_ubwc_cfg_data sc7180_data = {
+static const struct qcom_ubwc_cfg_data ubwc_2_0_hbb14 = {
 	.ubwc_enc_version = UBWC_2_0,
 	.highest_bank_bit = 14,
 };
 
-static const struct qcom_ubwc_cfg_data sc7280_data = {
-	.ubwc_enc_version = UBWC_3_1,
-	.highest_bank_bit = 14,
-};
-
-static const struct qcom_ubwc_cfg_data sc8180x_data = {
-	.ubwc_enc_version = UBWC_3_0,
-	.highest_bank_bit = 16,
-};
-
-static const struct qcom_ubwc_cfg_data sc8280xp_data = {
-	.ubwc_enc_version = UBWC_4_0,
-	.highest_bank_bit = 16,
-};
-
-static const struct qcom_ubwc_cfg_data sdm670_data = {
-	.ubwc_enc_version = UBWC_2_0,
-	.highest_bank_bit = 14,
-};
-
-static const struct qcom_ubwc_cfg_data sdm845_data = {
+static const struct qcom_ubwc_cfg_data ubwc_2_0_hbb15 = {
 	.ubwc_enc_version = UBWC_2_0,
 	.highest_bank_bit = 15,
 };
 
-static const struct qcom_ubwc_cfg_data sm6115_data = {
-	.ubwc_enc_version = UBWC_1_0,
-	.highest_bank_bit = 14,
-};
-
-static const struct qcom_ubwc_cfg_data sm6125_data = {
-	.ubwc_enc_version = UBWC_1_0,
-	.highest_bank_bit = 14,
+static const struct qcom_ubwc_cfg_data ubwc_3_0_hbb15 = {
+	.ubwc_enc_version = UBWC_3_0,
+	.highest_bank_bit = 15,
 };
 
-static const struct qcom_ubwc_cfg_data sm6150_data = {
-	.ubwc_enc_version = UBWC_2_0,
-	.highest_bank_bit = 14,
+static const struct qcom_ubwc_cfg_data ubwc_3_0_hbb16 = {
+	.ubwc_enc_version = UBWC_3_0,
+	.highest_bank_bit = 16,
 };
 
-static const struct qcom_ubwc_cfg_data sm6350_data = {
-	.ubwc_enc_version = UBWC_2_0,
-	.highest_bank_bit = 14,
+static const struct qcom_ubwc_cfg_data ubwc_3_1_hbb13 = {
+	.ubwc_enc_version = UBWC_3_1,
+	.highest_bank_bit = 13,
 };
 
-static const struct qcom_ubwc_cfg_data sm7150_data = {
-	.ubwc_enc_version = UBWC_2_0,
+static const struct qcom_ubwc_cfg_data ubwc_3_1_hbb14  = {
+	.ubwc_enc_version = UBWC_3_1,
 	.highest_bank_bit = 14,
 };
 
-static const struct qcom_ubwc_cfg_data sm8150_data = {
-	.ubwc_enc_version = UBWC_3_0,
-	.highest_bank_bit = 15,
-};
-
-static const struct qcom_ubwc_cfg_data sm8250_data = {
+static const struct qcom_ubwc_cfg_data ubwc_4_0_hbb16 = {
 	.ubwc_enc_version = UBWC_4_0,
-	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 };
 
-static const struct qcom_ubwc_cfg_data sm8350_data = {
-	.ubwc_enc_version = UBWC_4_0,
-	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
+static const struct qcom_ubwc_cfg_data ubwc_5_0_hbb16 = {
+	.ubwc_enc_version = UBWC_5_0,
 	.highest_bank_bit = 16,
 };
 
-static const struct qcom_ubwc_cfg_data sm8550_data = {
-	.ubwc_enc_version = UBWC_4_0,
-	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
+static const struct qcom_ubwc_cfg_data ubwc_6_0_hbb16 = {
+	.ubwc_enc_version = UBWC_6_0,
 	.highest_bank_bit = 16,
 };
 
-static const struct qcom_ubwc_cfg_data sm8750_data = {
-	.ubwc_enc_version = UBWC_5_0,
-	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
-	.highest_bank_bit = 16,
+static const struct qcom_ubwc_cfg_data sa8775p_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.flags = UBWC_FLAG_DISABLE_SWIZZLE_LVL2,
+	.highest_bank_bit = 13,
 };
 
 static const struct qcom_ubwc_cfg_data glymur_data = {
@@ -143,59 +94,59 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,apq8016", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8026", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
-	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
-	{ .compatible = "qcom,kaanapali", .data = &kaanapali_data, },
+	{ .compatible = "qcom,apq8096", .data = &ubwc_1_0_hbb15 },
+	{ .compatible = "qcom,kaanapali", .data = &ubwc_6_0_hbb16 },
 	{ .compatible = "qcom,glymur", .data = &glymur_data},
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8917", .data = &no_ubwc_data },
-	{ .compatible = "qcom,msm8937", .data = &msm8937_data },
+	{ .compatible = "qcom,msm8937", .data = &ubwc_1_0_hbb14 },
 	{ .compatible = "qcom,msm8929", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8939", .data = &no_ubwc_data },
-	{ .compatible = "qcom,msm8953", .data = &msm8937_data },
+	{ .compatible = "qcom,msm8953", .data = &ubwc_1_0_hbb14 },
 	{ .compatible = "qcom,msm8956", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8974", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8976", .data = &no_ubwc_data },
-	{ .compatible = "qcom,msm8996", .data = &msm8998_data },
-	{ .compatible = "qcom,msm8998", .data = &msm8998_data },
-	{ .compatible = "qcom,qcm2290", .data = &qcm2290_data, },
-	{ .compatible = "qcom,qcm6490", .data = &sc7280_data, },
-	{ .compatible = "qcom,qcs8300", .data = &sc8280xp_data, },
-	{ .compatible = "qcom,sa8155p", .data = &sm8150_data, },
-	{ .compatible = "qcom,sa8540p", .data = &sc8280xp_data, },
+	{ .compatible = "qcom,msm8996", .data = &ubwc_1_0_hbb15 },
+	{ .compatible = "qcom,msm8998", .data = &ubwc_1_0_hbb15 },
+	{ .compatible = "qcom,qcm2290", .data = &ubwc_0_0_hbb15, },
+	{ .compatible = "qcom,qcm6490", .data = &ubwc_3_1_hbb14, },
+	{ .compatible = "qcom,qcs8300", .data = &ubwc_4_0_hbb16, },
+	{ .compatible = "qcom,sa8155p", .data = &ubwc_3_0_hbb15, },
+	{ .compatible = "qcom,sa8540p", .data = &ubwc_4_0_hbb16, },
 	{ .compatible = "qcom,sa8775p", .data = &sa8775p_data, },
-	{ .compatible = "qcom,sar2130p", .data = &sar2130p_data },
-	{ .compatible = "qcom,sc7180", .data = &sc7180_data },
-	{ .compatible = "qcom,sc7280", .data = &sc7280_data, },
-	{ .compatible = "qcom,sc8180x", .data = &sc8180x_data, },
-	{ .compatible = "qcom,sc8280xp", .data = &sc8280xp_data, },
-	{ .compatible = "qcom,sda660", .data = &msm8937_data },
-	{ .compatible = "qcom,sdm450", .data = &msm8937_data },
-	{ .compatible = "qcom,sdm630", .data = &msm8937_data },
-	{ .compatible = "qcom,sdm632", .data = &msm8937_data },
-	{ .compatible = "qcom,sdm636", .data = &msm8937_data },
-	{ .compatible = "qcom,sdm660", .data = &msm8937_data },
-	{ .compatible = "qcom,sdm670", .data = &sdm670_data, },
-	{ .compatible = "qcom,sdm845", .data = &sdm845_data, },
-	{ .compatible = "qcom,sm4250", .data = &sm6115_data, },
-	{ .compatible = "qcom,sm6115", .data = &sm6115_data, },
-	{ .compatible = "qcom,sm6125", .data = &sm6125_data, },
-	{ .compatible = "qcom,sm6150", .data = &sm6150_data, },
-	{ .compatible = "qcom,sm6350", .data = &sm6350_data, },
-	{ .compatible = "qcom,sm6375", .data = &sm6350_data, },
-	{ .compatible = "qcom,sm7125", .data = &sc7180_data },
-	{ .compatible = "qcom,sm7150", .data = &sm7150_data, },
-	{ .compatible = "qcom,sm7225", .data = &sm6350_data, },
-	{ .compatible = "qcom,sm7325", .data = &sc7280_data, },
-	{ .compatible = "qcom,sm8150", .data = &sm8150_data, },
-	{ .compatible = "qcom,sm8250", .data = &sm8250_data, },
-	{ .compatible = "qcom,sm8350", .data = &sm8350_data, },
-	{ .compatible = "qcom,sm8450", .data = &sm8350_data, },
-	{ .compatible = "qcom,sm8550", .data = &sm8550_data, },
-	{ .compatible = "qcom,sm8650", .data = &sm8550_data, },
-	{ .compatible = "qcom,sm8750", .data = &sm8750_data, },
-	{ .compatible = "qcom,x1e80100", .data = &sm8550_data, },
-	{ .compatible = "qcom,x1p42100", .data = &sm8550_data, },
+	{ .compatible = "qcom,sar2130p", .data = &ubwc_3_1_hbb13 },
+	{ .compatible = "qcom,sc7180", .data = &ubwc_2_0_hbb14, },
+	{ .compatible = "qcom,sc7280", .data = &ubwc_3_1_hbb14, },
+	{ .compatible = "qcom,sc8180x", .data = &ubwc_3_0_hbb16, },
+	{ .compatible = "qcom,sc8280xp", .data = &ubwc_4_0_hbb16, },
+	{ .compatible = "qcom,sda660", .data = &ubwc_1_0_hbb14 },
+	{ .compatible = "qcom,sdm450", .data = &ubwc_1_0_hbb14 },
+	{ .compatible = "qcom,sdm630", .data = &ubwc_1_0_hbb14 },
+	{ .compatible = "qcom,sdm632", .data = &ubwc_1_0_hbb14 },
+	{ .compatible = "qcom,sdm636", .data = &ubwc_1_0_hbb14 },
+	{ .compatible = "qcom,sdm660", .data = &ubwc_1_0_hbb14 },
+	{ .compatible = "qcom,sdm670", .data = &ubwc_2_0_hbb14, },
+	{ .compatible = "qcom,sdm845", .data = &ubwc_2_0_hbb15, },
+	{ .compatible = "qcom,sm4250", .data = &ubwc_1_0_hbb14, },
+	{ .compatible = "qcom,sm6115", .data = &ubwc_1_0_hbb14, },
+	{ .compatible = "qcom,sm6125", .data = &ubwc_1_0_hbb14, },
+	{ .compatible = "qcom,sm6150", .data = &ubwc_2_0_hbb14, },
+	{ .compatible = "qcom,sm6350", .data = &ubwc_2_0_hbb14, },
+	{ .compatible = "qcom,sm6375", .data = &ubwc_2_0_hbb14, },
+	{ .compatible = "qcom,sm7125", .data = &ubwc_2_0_hbb14, },
+	{ .compatible = "qcom,sm7150", .data = &ubwc_2_0_hbb14, },
+	{ .compatible = "qcom,sm7225", .data = &ubwc_2_0_hbb14, },
+	{ .compatible = "qcom,sm7325", .data = &ubwc_3_1_hbb14, },
+	{ .compatible = "qcom,sm8150", .data = &ubwc_3_0_hbb15, },
+	{ .compatible = "qcom,sm8250", .data = &ubwc_4_0_hbb16, },
+	{ .compatible = "qcom,sm8350", .data = &ubwc_4_0_hbb16, },
+	{ .compatible = "qcom,sm8450", .data = &ubwc_4_0_hbb16, },
+	{ .compatible = "qcom,sm8550", .data = &ubwc_4_0_hbb16, },
+	{ .compatible = "qcom,sm8650", .data = &ubwc_4_0_hbb16, },
+	{ .compatible = "qcom,sm8750", .data = &ubwc_5_0_hbb16, },
+	{ .compatible = "qcom,x1e80100", .data = &ubwc_4_0_hbb16, },
+	{ .compatible = "qcom,x1p42100", .data = &ubwc_4_0_hbb16, },
 	{ }
 };
 

-- 
2.47.3


