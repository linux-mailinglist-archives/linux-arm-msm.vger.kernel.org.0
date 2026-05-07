Return-Path: <linux-arm-msm+bounces-106379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uK/6M0GQ/Gn3RQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:14:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E734E9090
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4492330DC4DC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E21836CDFE;
	Thu,  7 May 2026 13:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uu9ocJ91";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L3dWd8W9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B8C42315B
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159060; cv=none; b=ZOhzIjXhv7AJnms0q7wNhFFCTOz7bQVWPvoUOvC9fxX1fpXdoJ95Zl32ZOYV21d1BcBcohdON+tZ1tpBXXRuGOHx0P5Jr/eH66I16rF5qOZyV8uFMI9D/6fEOSVDux0fIKPd1+3aJHTwefEo8kHZNuOiDsdt5tdir6dcyyvD+Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159060; c=relaxed/simple;
	bh=GaD3OADWseoOG5QeHpQmN/nkA6MzTACq4ooKbr03Zf4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l7aQ28XZ34Mdt3B/FMuN+F4UME5haG1XlT/oJkZjeskaiv9mFeARJCp7236TRiUHlYfAii5EkxWjTG1OrNEv5JAmsKMv/6Leh7LFNAX+ZK0aYzBH8Gm+xRWufY1YPJIMqaLr4oizyMMtMpibKaHbf18n9XAgsIKTt07w9IKHk6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uu9ocJ91; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L3dWd8W9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6477pYdD1424508
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VGf89U6GYhkUCRMDjtnMSMgOlYsB5OBRKvGiOBHGpas=; b=Uu9ocJ91PN6+Ozbd
	QYQWijujKMLLrMBH9dh58k5kjc+EQxyjz2I7aSfPYuHpumm4KAMruALesF0GX6Dr
	fOA19pK6BLvR8ouykNMQJm1GjtgtVQuq+NwHYS/MemqHVBDXxlHzDRYdRPIkoj1t
	82N4YR7yL0+yIKDMgOdPj15ysp9eTfLe/g+HPRQdmuP+7iz0gx4hxjRmtCWHroG6
	PJXzMAD+PBvSRFwtZrq2q9Aa5Mf3lo+grCIbouFoK+K0lnV0ARi9YYd5Hf8iqika
	permiJt253sT0FVV1YDXuWXyc4qxeVmte5Cdwgp+XbBzVelws7B5G5GBhmTz+/OY
	u67n7Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0pqfs481-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:04:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba3245a43dso9384605ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159057; x=1778763857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VGf89U6GYhkUCRMDjtnMSMgOlYsB5OBRKvGiOBHGpas=;
        b=L3dWd8W9IVXU1iskrL7tEIV6AHjdXW5xUigxEAc/biI3JMzjHddo+whvtY3woijv/b
         zm6WQHeF+umIFrVcncIblSL6ixoBXsEAs9yB6ztIH3doWMmJ/9BX83mHtyjMkAkwGb3O
         xY4h/gEZth6gu6/EeU7ZQvTnOlY8fdXfmtERWc2sD+0+P+VFb36L77xJ1DrYDuQ6ySqQ
         FLcb6lbxIPQAyhBKppH+OhtWTliaY8ccRCbS3iT5QZ+98c3yv2eKqOi9ilwl+AQb0gG+
         9TZDsza9Wc9ttoaCoGLX1xdRoQeuqFdbDsw8j/JCF4ejDHjIQSTXXTQ7v5KHbcG/g3+I
         7zdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159057; x=1778763857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VGf89U6GYhkUCRMDjtnMSMgOlYsB5OBRKvGiOBHGpas=;
        b=tEmCfy5ZRTWXQcUlnJI0TPrdxcYgTdHJmmLWidgY34hSr4VnpXGLTF4j5YDSH+2/TO
         oVr+6hudRibEyN9hrr59wTniZ355M2LLgcqiLI73Ht5+gc1XEt6yEZFY+zIjtDnW0teZ
         yF8hBVvV1QVbjl4k9zbIbgQ5//xNN7Jo+SSsszn3dO2j+V31J3i1rnXsELrUeZ94fj7l
         1I8y10DYkgVMRJYOOKepzgZcUL1FtPnnHjNId6yCd41Qh1aPxnS4iHbkD2T67PRwuaOM
         euTSmI/AE7MaZJIZocDzyFHqMOeayqo1xkrbwo99kwGrzm1avEzHI8aSm/ODjZ88Rovi
         G1+Q==
X-Gm-Message-State: AOJu0YySem8ZOZN1z1ZZWdcBQy0QZtSmnJglol0QZh1Xwzo10d65+Xls
	/NiUcxXlQH1OFwam+EI1g4YmZHLb96m2OTHFptb8lydhMTeke+7N40MYXmXgT/TjgCH6ICzwzGW
	hch9fn8j6hoEzeruSCov5LNuqZPPC4XmnM970sK/aS0x5d0KGqFW7hsuLLTFUsAvzOucq
X-Gm-Gg: AeBDieuJLD/rwhpHg6gkjNcw9WOSxx08b5K+VQ5BXaIe3GyEQ6EVDNq011JeesmSfjN
	Bo+oex6f3L1KPjYEXl9sIiZqPZNKn5JCWZKQDZTd97NnSKiJtObxCE7VTPFXJFxvnXtQzc04bHl
	gGSiBKFvg0NDx3mTThSV4DyO7Loz3H0RkWmYIREe9R5lZkvt8wZGugpKMIg9v7ydj75aYpN8x2/
	a4cMXa08FWs9kcYr1y0sltzzhfaz6lYi/pXEHmn6CUt6tYvDfGPQFjHmSUEQtgg86BIANZ5s8qA
	kaY/a4bKavUDCeIJEqaAw0omD86CtnGiE124zSBFxt6ibkJWFbGAom4cHDla7wbGhchXMMQjQxL
	/PMblpueuBrwnqS+mflF9Wmm9wbwahebafwe6NQ+kuYkwvPlS4GcxhTtE2YJ2+cVTgqc+YANX9d
	VHW+7Nw5Xw35WdE8dg5HegL/a14/OO+OnRf6uWCTvtQtoLdQ==
X-Received: by 2002:a17:903:bd1:b0:2ba:f5f:14f8 with SMTP id d9443c01a7336-2ba798b1bf1mr57238185ad.39.1778159056500;
        Thu, 07 May 2026 06:04:16 -0700 (PDT)
X-Received: by 2002:a17:903:bd1:b0:2ba:f5f:14f8 with SMTP id d9443c01a7336-2ba798b1bf1mr57237485ad.39.1778159055766;
        Thu, 07 May 2026 06:04:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230c68sm5595959e87.19.2026.05.07.06.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:04:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 16:03:20 +0300
Subject: [PATCH v4 24/29] soc: qcom: ubwc: drop ubwc_dec_version
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ubwc-rework-v4-24-c19593d20c1d@oss.qualcomm.com>
References: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
In-Reply-To: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
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
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8355;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=GaD3OADWseoOG5QeHpQmN/nkA6MzTACq4ooKbr03Zf4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/I2Hd2+yAAyg07S8UgV+8frAvzxAxCrxv7Ogb
 Bbze9as/SOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafyNhwAKCRCLPIo+Aiko
 1XPcB/4qUiMOO0DqP5nQOqKItSdkd3L3mhTkDj6UD0Hf5V5jhHp9UtBJ4y4CrBkaBWyym2JixZZ
 grEfbo4YNDymDdbFLHCaYPge7wlp+zRDLoXMiGH9xg7kDsSM6zqk0l4bwApCMJS61H46ETjU+tW
 mZDALXozy8Gha+uqOKMDqoyzJ6ZMnk48AIIs4/XewFQHjLzpcR3Rnb8+fEbJ/unMujwgLHRvA7y
 i75P5ZxJ0xnPyGJnnH98g2P35EKTOL7NbznQhjPFiJTQMVV2zUvQtcl5afJYsCTxNg8atILPqOz
 HsVoW+QNYBmPegO1oY0cKcuMYy+5P3W384jvEk5R6kyx/57F
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=TJB1jVla c=1 sm=1 tr=0 ts=69fc8dd1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=BpkRCZfudPv80oEIFw4A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfX8CLvJzHVafoM
 cdM4YDDwqF3Z9y6mp+HWG3aMSIG+Bz2stzKpNaS8/CUlAXx8i6gZ5cf8DMikjuq7D9fEnMYwTZS
 qEnqNrEK31zPytTN98tIfwnYTyryONzv3gY4DMuGmx3K2IKRTQlPJtsALRLLdBTBxgMUc5orepE
 EvbukWWVfLrQHgvS+xNRRqgdkJ8atLnkCBIJdOBpGZfNCrFWw/uQl1Ndx/KNaFpfoOrpBvNGC6E
 dcDjyB2WC/UlzJE+Qxg8kB5jsOzBiA41Y5BDRAhucomsrcmd0Aexgzg+TvpQPTs8V5nURc4Hpod
 SqW/ITeZTtSBZD9zrAfqN60i3JyJrJyC1pjTJRv6laOcBTmoAuJFpq7FgGEk0o31egkMFkLE9sh
 frL6ZWwos+kRnLbQzDxB6+fHMNPzahw4DqGmE44WjwQeCqzf/jYmQxBtZf48fVohGG0RPgPR5o+
 7QYPf8GrwHV0axu9q/A==
X-Proofpoint-GUID: T7_8up8mFF6jS8Pv1ncHiA1dHPJK8iys
X-Proofpoint-ORIG-GUID: T7_8up8mFF6jS8Pv1ncHiA1dHPJK8iys
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070130
X-Rspamd-Queue-Id: 39E734E9090
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106379-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The ubwc_dec_version field has been inherited from the MDSS driver and
it is equal to the version of the UBWC decoder in the display block
only. Other IP Cores can have different UBWC decoders and so the version
would vary between blocks.

As the value is no longer used as is not relevant to other UBWC database
consumers, drop it from the UBWC database.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 23 -----------------------
 include/linux/soc/qcom/ubwc.h  |  2 --
 2 files changed, 25 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 3fe47d8f0f63..1344cda0fb75 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -18,7 +18,6 @@ static const struct qcom_ubwc_cfg_data no_ubwc_data = {
 
 static const struct qcom_ubwc_cfg_data eliza_data = {
 	.ubwc_enc_version = UBWC_5_0,
-	.ubwc_dec_version = UBWC_5_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -29,7 +28,6 @@ static const struct qcom_ubwc_cfg_data eliza_data = {
 
 static const struct qcom_ubwc_cfg_data kaanapali_data = {
 	.ubwc_enc_version = UBWC_6_0,
-	.ubwc_dec_version = UBWC_6_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -39,7 +37,6 @@ static const struct qcom_ubwc_cfg_data kaanapali_data = {
 
 static const struct qcom_ubwc_cfg_data msm8937_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_dec_version = UBWC_1_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
 			UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
@@ -48,7 +45,6 @@ static const struct qcom_ubwc_cfg_data msm8937_data = {
 
 static const struct qcom_ubwc_cfg_data msm8998_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_dec_version = UBWC_1_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
 			UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
@@ -62,7 +58,6 @@ static const struct qcom_ubwc_cfg_data qcm2290_data = {
 
 static const struct qcom_ubwc_cfg_data sa8775p_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
 	.highest_bank_bit = 13,
@@ -71,7 +66,6 @@ static const struct qcom_ubwc_cfg_data sa8775p_data = {
 
 static const struct qcom_ubwc_cfg_data sar2130p_data = {
 	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
-	.ubwc_dec_version = UBWC_4_3,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -81,7 +75,6 @@ static const struct qcom_ubwc_cfg_data sar2130p_data = {
 
 static const struct qcom_ubwc_cfg_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -90,7 +83,6 @@ static const struct qcom_ubwc_cfg_data sc7180_data = {
 
 static const struct qcom_ubwc_cfg_data sc7280_data = {
 	.ubwc_enc_version = UBWC_3_0,
-	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -100,7 +92,6 @@ static const struct qcom_ubwc_cfg_data sc7280_data = {
 
 static const struct qcom_ubwc_cfg_data sc8180x_data = {
 	.ubwc_enc_version = UBWC_3_0,
-	.ubwc_dec_version = UBWC_3_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
@@ -109,7 +100,6 @@ static const struct qcom_ubwc_cfg_data sc8180x_data = {
 
 static const struct qcom_ubwc_cfg_data sc8280xp_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -119,7 +109,6 @@ static const struct qcom_ubwc_cfg_data sc8280xp_data = {
 
 static const struct qcom_ubwc_cfg_data sdm670_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
@@ -127,7 +116,6 @@ static const struct qcom_ubwc_cfg_data sdm670_data = {
 
 static const struct qcom_ubwc_cfg_data sdm845_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 15,
@@ -135,7 +123,6 @@ static const struct qcom_ubwc_cfg_data sdm845_data = {
 
 static const struct qcom_ubwc_cfg_data sm6115_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
 			UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
@@ -145,7 +132,6 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
 
 static const struct qcom_ubwc_cfg_data sm6125_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_dec_version = UBWC_3_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
 			UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
@@ -154,7 +140,6 @@ static const struct qcom_ubwc_cfg_data sm6125_data = {
 
 static const struct qcom_ubwc_cfg_data sm6150_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
@@ -162,7 +147,6 @@ static const struct qcom_ubwc_cfg_data sm6150_data = {
 
 static const struct qcom_ubwc_cfg_data sm6350_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -171,7 +155,6 @@ static const struct qcom_ubwc_cfg_data sm6350_data = {
 
 static const struct qcom_ubwc_cfg_data sm7150_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
@@ -179,7 +162,6 @@ static const struct qcom_ubwc_cfg_data sm7150_data = {
 
 static const struct qcom_ubwc_cfg_data sm8150_data = {
 	.ubwc_enc_version = UBWC_3_0,
-	.ubwc_dec_version = UBWC_3_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 15,
@@ -187,7 +169,6 @@ static const struct qcom_ubwc_cfg_data sm8150_data = {
 
 static const struct qcom_ubwc_cfg_data sm8250_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -198,7 +179,6 @@ static const struct qcom_ubwc_cfg_data sm8250_data = {
 
 static const struct qcom_ubwc_cfg_data sm8350_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -209,7 +189,6 @@ static const struct qcom_ubwc_cfg_data sm8350_data = {
 
 static const struct qcom_ubwc_cfg_data sm8550_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_3,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -220,7 +199,6 @@ static const struct qcom_ubwc_cfg_data sm8550_data = {
 
 static const struct qcom_ubwc_cfg_data sm8750_data = {
 	.ubwc_enc_version = UBWC_5_0,
-	.ubwc_dec_version = UBWC_5_0,
 	.ubwc_swizzle = 6,
 	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
@@ -230,7 +208,6 @@ static const struct qcom_ubwc_cfg_data sm8750_data = {
 
 static const struct qcom_ubwc_cfg_data glymur_data = {
 	.ubwc_enc_version = UBWC_5_0,
-	.ubwc_dec_version = UBWC_5_0,
 	.ubwc_swizzle = 0,
 	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 0b5aa9d0343b..c3f9efae5db8 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -13,8 +13,6 @@
 
 struct qcom_ubwc_cfg_data {
 	u32 ubwc_enc_version;
-	/* Can be read from MDSS_BASE + 0x58 */
-	u32 ubwc_dec_version;
 
 	/**
 	 * @ubwc_swizzle: Whether to enable level 1, 2 & 3 bank swizzling.

-- 
2.47.3


