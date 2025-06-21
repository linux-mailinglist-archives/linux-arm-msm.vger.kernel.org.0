Return-Path: <linux-arm-msm+bounces-61944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC915AE2B0B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 20:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31BCF3A3FAE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 18:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD89A2701A3;
	Sat, 21 Jun 2025 18:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EiXymH2y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2376026FA59
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 18:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750529660; cv=none; b=lUsC3OmHk3Fmefum5iz7zFznMdtPBH6s1LFJ8+XprJmM/8S4dwpr1ltmp4Wz41DPKhTmPLbCx8M84LczpFPAhcqTb3hn2LFSieWZS6OEERBDPYO8yPOPDkJcz6uUyLmbtzYPO2o+1zspFpDTORobTIXLQ5D+U14wl8SofrTxMX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750529660; c=relaxed/simple;
	bh=X82NT0To0cHHxEVthOIl3cobJlSNDagM+IRg4TmYzKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D0poxP1UXfkvDmDZPs3Eos/46KN9Pe4GQ1Fm7TkGWYmOWRdXs7rlRnFrihQ5LoutQHQULnFfcr9FPVoVVMuXEVCZ3DJpF6T7Z2DHo2Mzu6WbNIqS538yzLU2fE6atlf1cmLGnnHc491gAYSdLFqbLF2EgLIt2ZbMoWW9pVuBCR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EiXymH2y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LHDDPE016257
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 18:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	avdnB+hgZU9bp52v1KCtyf6jWRUeqQMF8YsHerstNhY=; b=EiXymH2yfLB9uYE0
	2rLUx8XLym0Pl2pwFuYUS9CPeR+QTHWDr3zaqWWM4oBPANCun9pSU+VszDB+Z5tI
	32wGlZq5F29yJLFcLYn9rNkHpK3V6Fz3cxy7GYsC5J/181KpWDZzJejHHzFzeGGr
	0L0xAVB6KBkXowqkkNHNgeB69p+wYbGyrCGoKPKZ+EgekpSy0GPvd7sur7I6jX6k
	Rj8Ai4L/ybEgoMxT0tM41BlVeOnZbsqNWcStd9ADUSlKricsun/iQmRhPKa6TtAy
	aPg8luqwvVPyBJz3joXneqO5aw3o6xiTzYf0m3Lvn5rft0bp/+WcGN+7BkHsNk6N
	TDme/g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dung8dux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 18:14:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c790dc38b4so462047285a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 11:14:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750529657; x=1751134457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=avdnB+hgZU9bp52v1KCtyf6jWRUeqQMF8YsHerstNhY=;
        b=DvDVuHdE0c5KrNJpa2k528khQcISfc8NkorUyC5CMHHC+177TNoh6oXomxc65KTiFS
         RYFia8tNXEoKBmPWpflK03BuyuT8/psc7wwKoKyW43aUJ9CBclxBwFpxgd5hRBFNxu3t
         z4q9vkrlka2oiIA5tJ6eUGrqPEWkSoin6zcL0BQXApDxWoj+YHuIbQzbCpQdkA7NFsC0
         /gfhXOsB77D7390pEd5D8JDoTGUeGa7aKAit82FCzxgitIa57sJN62dBF4pHA4FXgHgw
         QI1YVz+laugvHPZA0RXaDYiU/XGoBG5SbCS8dTkl6cM7IF/hJM+CSYEjkXBZc2EJhFDV
         kNcw==
X-Forwarded-Encrypted: i=1; AJvYcCUOn8PTzPj42h2KJkjBDw1oHLT/lsJXu9v8j1qyKd73Jg8ej3+zCzODg3mQFAGb+KASBsqNnrHXHm49saEo@vger.kernel.org
X-Gm-Message-State: AOJu0YxGcbZkxV/dZRiKjJ0e+5t+k4WqVI9nbc5XFloYWMIpOm84dAzj
	+NiEvpxxYWyfjm3lknNAPapjLamxVxlxAC1pSoHvhrLMrgUmnWFKwRAXR+5htYBOh5fIrn0D9ZG
	g+uzoWqtDqEKNI3sW3PKzOIOg9WnquxBiLzoQNOzOweWt6CI9iIgHdazsqNx0IrVbdoDTRqTawc
	bMrLw=
X-Gm-Gg: ASbGnctaiSgmQmdKM16x7xFbwzUV4azHGpq/QrTK4R2w83T74BIBeKzXSkNwL23YUGG
	TIPrrN7Q+yr9r/UubQ96ZWsToFZHHot8T5B5C2w0F7o3MmNRZnOZSbOj8bEeIngpQTdCvIOW01r
	v0Qabpa6q5GGTHnKOun+yUYGrT24ryBdZpJRM6mcQXM1222xDGx25mbPblH6Gs0SEhG7X3S2dSd
	tv4mdAvNIRFMRs73CyPTaI8PBFrOxAkb9xhvO2FiNlDZkjMRL5qPGIPFfKWhDnGSWPsgdJXgtVH
	YuPROni+NTxG3jZ/B6bAErse54AUfRX1V6wT/PSFauCqoqHmfkZXcA7PsTAGxWzCciG8i71kkMz
	cCWLQO1nnWR+WgVuzJy7clnQiJ+m+C9jCCAQ=
X-Received: by 2002:a05:620a:17a1:b0:7d3:acfa:de46 with SMTP id af79cd13be357-7d3fc0560cfmr791243185a.21.1750529656836;
        Sat, 21 Jun 2025 11:14:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrCCipgLc+IJfwkcgPlL/s5L64oH8qO7m3lUECqimODLjYk4FQkVFIcnMxqeDLNaXnR2l5NA==
X-Received: by 2002:a05:620a:17a1:b0:7d3:acfa:de46 with SMTP id af79cd13be357-7d3fc0560cfmr791240485a.21.1750529656379;
        Sat, 21 Jun 2025 11:14:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414cf36sm752336e87.86.2025.06.21.11.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 11:14:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 21:12:57 +0300
Subject: [PATCH 2/8] usb: typec: ucsi: add recipient arg to
 update_altmodes() callback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-c630-ucsi-v1-2-a86de5e11361@oss.qualcomm.com>
References: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
In-Reply-To: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3071;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=X82NT0To0cHHxEVthOIl3cobJlSNDagM+IRg4TmYzKc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoVvZyrcF9ULbQVUsBpsvflMQvumIJQN8uUjujx
 ol4kEFWh2aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFb2cgAKCRCLPIo+Aiko
 1UIQB/9zdlNNR3KBaDfKW01XEjTdzJ8V2naxLu8sdm+UKjdlYij6WoovE4TdJ4SFbfAHfCFFfk1
 3SnqbRf2zjM3irQ68anQQoEsX9ehyNBatJFeL6y4WaH2LDyhaipwNxq1vGTbYRqIvoegKlKwOvx
 Lc//d31F8Ggjy9c7rajuN5Tt4Dsu/92kIN06dfEZa0uhRYZWrO1arc0FT1N4zygvHaEUgBn86Ku
 rtNFNgTmdKuGXi6jdmoqWxpVhJNZgm38+5JMsyCUpl6j3RbpIPeHNZyw1iqEbGhNDnS1W9EMSNC
 SYCkTZO1KS2fxkQgsPcEH8IC+fn1xhIGlyFc+8CMW49xd+0J
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: RoDUdcyBzT_TWQBp0VpLUk2SqEYS4tjs
X-Authority-Analysis: v=2.4 cv=N5kpF39B c=1 sm=1 tr=0 ts=6856f679 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=E64p1VqjvP21rIaO_JEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDExNSBTYWx0ZWRfX7EZSZ6bXIiNk
 zc8EC5KDmherQPHuJu8KaI/kfVDXWicKQagPz0ZneqdJ8mQVtf7EB5QybvVuwi30ww9adeyoKql
 GUPPcH93opGblaMRWVwEbxPHMsLfHJXqaMVpDobkvvYSk3Wx+SP+AJLuMLLHwPbJ4xz9iHtbrPj
 gicazAuuJ4oU3IhsDYZ/lVV1D+AoHYdB1hAPsq8GGNjPWLARRdOJdvIf43ddKZv1GVETN3hMgQl
 gPwTWBf1Ot2aea/qZGMGBb7P+yXAiuWGmzGfvPHCep6p8FPF3YeoG5+g97G9wOdAHp7XUmyAul/
 bfJ6AcY2aoMJiEuFyXR4gGoZd3aynOwgE2ltAebEegOChdBByZzXTVGz0Bt7CpDJVMXx1R4IlK6
 1wb9Vx9TxpBYl/cl/iCA8Nvk2fTFLNiLwtveQbQtoqQ07EIEkChs5QZA4r0n8I3hwFNjcozg
X-Proofpoint-GUID: RoDUdcyBzT_TWQBp0VpLUk2SqEYS4tjs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210115

The update_altmodes() is executed only for connetor's AltModes, because
that's what required on the CCG platforms. Other platforms (like Lenovo
Yoga C630) requires similar fix for partner's AltModes. Extend
update_altmodes() callback to accept the recipient as an argument and
move corresponding check to the CCG UCSI driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi.c     | 5 ++---
 drivers/usb/typec/ucsi/ucsi.h     | 3 ++-
 drivers/usb/typec/ucsi/ucsi_ccg.c | 4 ++++
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 01ce858a1a2b3466155db340e213c767d1e79479..e913d099f934c7728cb678fc8e21e75ab0a00cce 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -531,13 +531,12 @@ ucsi_register_altmodes_nvidia(struct ucsi_connector *con, u8 recipient)
 	 * Update the original altmode table as some ppms may report
 	 * multiple DP altmodes.
 	 */
-	if (recipient == UCSI_RECIPIENT_CON)
-		multi_dp = ucsi->ops->update_altmodes(ucsi, orig, updated);
+	multi_dp = ucsi->ops->update_altmodes(ucsi, recipient, orig, updated);
 
 	/* now register altmodes */
 	for (i = 0; i < max_altmodes; i++) {
 		memset(&desc, 0, sizeof(desc));
-		if (multi_dp && recipient == UCSI_RECIPIENT_CON) {
+		if (multi_dp) {
 			desc.svid = updated[i].svid;
 			desc.vdo = updated[i].mid;
 		} else {
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 5a8f947fcece29f98c0458f9eb05c0c5ede2d244..d02f6a3e2f50a4044eb3f22276931017cc624532 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -82,7 +82,8 @@ struct ucsi_operations {
 	int (*sync_control)(struct ucsi *ucsi, u64 command, u32 *cci,
 			    void *data, size_t size);
 	int (*async_control)(struct ucsi *ucsi, u64 command);
-	bool (*update_altmodes)(struct ucsi *ucsi, struct ucsi_altmode *orig,
+	bool (*update_altmodes)(struct ucsi *ucsi, u8 recipient,
+				struct ucsi_altmode *orig,
 				struct ucsi_altmode *updated);
 	void (*update_connector)(struct ucsi_connector *con);
 	void (*connector_status)(struct ucsi_connector *con);
diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index e9a9df1431af3a52c00cc456f5c920b9077a1ade..d83a0051c737336af2543fc2f6d53a131ffe9583 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -394,6 +394,7 @@ static void ucsi_ccg_update_get_current_cam_cmd(struct ucsi_ccg *uc, u8 *data)
 }
 
 static bool ucsi_ccg_update_altmodes(struct ucsi *ucsi,
+				     u8 recipient,
 				     struct ucsi_altmode *orig,
 				     struct ucsi_altmode *updated)
 {
@@ -402,6 +403,9 @@ static bool ucsi_ccg_update_altmodes(struct ucsi *ucsi,
 	int i, j, k = 0;
 	bool found = false;
 
+	if (recipient != UCSI_RECIPIENT_CON)
+		return false;
+
 	alt = uc->orig;
 	new_alt = uc->updated;
 	memset(uc->updated, 0, sizeof(uc->updated));

-- 
2.39.5


