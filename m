Return-Path: <linux-arm-msm+bounces-80014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A84D9C2899C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 02 Nov 2025 04:40:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC906188F2FF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Nov 2025 03:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD10422D9F7;
	Sun,  2 Nov 2025 03:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CLdrFoc6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DeGD1chO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D61415E5BB
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Nov 2025 03:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762054834; cv=none; b=b83Ylz3ytBq0GBvhSYDBuBuuzCF8oRvfGHOLezWbSZCN4LMtt4tz/cejvcBX9ZoEh8rSiv4t8SjPuiMEJkdYLdXUrO7BdfV+PZ0woZW1JTJJiVICnTU1fmJ7SyX0q2rzEkjT4W0WY9t7BAt/Wm4nGkJDxnEW4PDXPEIW+H14IFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762054834; c=relaxed/simple;
	bh=tsTTP88YqQQw2qNCj/kySq4M0ki8akBPEdfHNXPcJ9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lM+ilxpMcUlQxavG9UcHyRvnIjYfUOfuneSCbaOlM8I0nMhMKcLCBFz+uJj8a5IBL1bXe/yjC5uvfXRyEVn6RG7aJUTtGzo0sTHFa7xOG7YRQaLAS3HlW3DEX8m6rl6Ja53UWzlo9iLwkz2Y9u0jJsoj6B4VuMraTXW9t5NHdPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CLdrFoc6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DeGD1chO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A21CPaC2966745
	for <linux-arm-msm@vger.kernel.org>; Sun, 2 Nov 2025 03:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hy9CGwxUFV2jhewlnGeGKH
	PswSddzu4TDZNw7XBAfsw=; b=CLdrFoc6rX2dUdrMCRKv+SldbSrUfU7RxJ7bhq
	PbjdDXOukC5/XDZ8UP46VtMiqfz/YwiayoAXHDPje9zxH9ARXao9tUPJaKQ58Ehu
	3hgutkWrGnqOnOst6uwqNi8XW+Bu1rlnotLWhpfwIQWarfqveCwvRF+86sRjX3aj
	BeepKm43O5bVQGu7na53Q3SyrMYIK+Wn0JYGv/RN0RxxTy1hmu2fPZ/+p4H/j38+
	rsHtbOBytvzG/mBIMa9eQfonOw9jLPEvVwJAN53VPtXxwic3AXx6ow5NEHvpDsOY
	/8/cxcdRahZQKVmLyOsVePDykeuVORxSta8vWKj9DFp5TP2w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5ae31jcd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 02 Nov 2025 03:40:31 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso3108370a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Nov 2025 20:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762054831; x=1762659631; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hy9CGwxUFV2jhewlnGeGKHPswSddzu4TDZNw7XBAfsw=;
        b=DeGD1chOPhTGL9eXsog1x62aGJGhz0LEoaNXPFpmL5bcc5mdHMUA6i442zumVgzCxI
         Va70t2wxQSAxrcKN/w1m+tHwvGKz/MsOuQc82abt/fRkVufhjIQSEwhtJiR8SVwUOPlQ
         PtqgMRbJ5StXZLLj0V2kDMhWiV8MqzVY5U2PeB3MAfHOQeXiHEfezm2W08C2gbaugWvc
         7okkmONqKUQDXWrz0xJ4NChFWRlNcUIYqRVcP2zbIjCTUKlyagJLhOwEprbTv7Nggi82
         IGOzzerWMrgl3D62oeWKKvrV9vaIG825G6R/iuVpPIj3BWly4gD+ULK/WICwiDpuK+pT
         DBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762054831; x=1762659631;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hy9CGwxUFV2jhewlnGeGKHPswSddzu4TDZNw7XBAfsw=;
        b=O8D/kk0IlEsp71lyi+6QlPklh8owXTtVShlNyydwi7W5KRR+HNV6bI1k1Kqlf3hZJ/
         qgGXw6WTkO387EnrfhOY2lS5kWUWvXYJ+o+u0MAfDHBm2oCtHJVVRfcVFV1YUznwoHah
         38I/gQwQA0oHWGao7+5WfLg6RvNKaZESNlu/W5Xa1KPtDVrhwsqFlQZn/LF4wO+Nhwsz
         rcgNADO52hiW+Tf7Aw8BLKjfnYULokQOJf4Jal9ttStkyHWOaD1O4ON7Ppi4DeC4oKMb
         jYh4uR8pXl4iQ93aYJfyGBLk3yMUigkFp/DrgQqy5ZAana852UiUefe40ydlJkRlsTl+
         bILA==
X-Forwarded-Encrypted: i=1; AJvYcCXGU/r22ABU92CoNglQCvGKoUW9nn+dhQL0gPvegoH0jhtKEmnsZGOsWuUJ/0wmnfZbLCRUGWP5TVXQcojg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+pRCz5re44cPFywo56vjrTi8mo0h38Xp8KZgwjVqziZIUNVii
	uSUSU8u5jNoK8UaPbgjaP/e82Kgq5kafjjJ81xgSHfW2zzFN2JMaMwrH61Sek7tpFWSm2+7laL7
	V9mM5e8I7C0BD4FaR0Em/FfFGzi8QGzP6OTrKbo97yxo8CNwcFX3sZvJbJSyOx0tjCgo2
X-Gm-Gg: ASbGnctsWaMdjHGYRgQe7E7nOjjeoS1A5J4ECI9xpmb7YL1oppYDUl7+fq8OmneRd1H
	NAPvxLrCtQR3OaFEDBFWAhlyVBdVSct/IY3PXIRsBPgDnWd/2vqFAJuNBMmo29XhxMXYUkBQT8s
	4c7/uNgfaMthEDKKn/RmMZxIyT5c1ct+dUjx1cBfeP3qozY5rHeGNaoD4ldwXKYuc9yW9noUhgE
	488y/bsQXPZLuQNkaZ1X0xXEVPfw0RtJ8iwPF4FXa6yDLEokoj6dhwYUBcZdFqGsN0uAiYEdZwv
	oqhuQDv2MrjEp7NHT9JzJRb/3TVyEp2QHzWUW33Go5GGPRe7e+b9zrXODmeVim237pyLmcASYpT
	VD+zYaY6Kw5YqgSuaj3zXYYQagnncgmHlwM6y
X-Received: by 2002:a17:902:da88:b0:295:5805:b380 with SMTP id d9443c01a7336-2955805b770mr45636285ad.49.1762054830794;
        Sat, 01 Nov 2025 20:40:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFn6sLOMnqKd4YQV6ffKNfc4XqFYxeONj5fp5ikFI1eo+sp04UEXUS7roUXZh8dPk87Wj6lpA==
X-Received: by 2002:a17:902:da88:b0:295:5805:b380 with SMTP id d9443c01a7336-2955805b770mr45636085ad.49.1762054830276;
        Sat, 01 Nov 2025 20:40:30 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29526871023sm71818025ad.13.2025.11.01.20.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 20:40:29 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Sun, 02 Nov 2025 09:10:19 +0530
Subject: [PATCH] media: iris: remove v4l2_m2m_ioctl_{de,en}coder_cmd API
 usage during STOP handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251102-iris-drain-fix-v1-1-7f88d187fb48@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKLSBmkC/x2MQQqAIBAAvxJ7bsE1LOor0UFyrb1YrBCB+Pek4
 wzMFMiswhmWroDyI1mu1ID6DvbTp4NRQmOwxjoyA6GoZAzqJWGUFycXw+wME40OWnQrN/0P163
 WD+9DAwpgAAAA
X-Change-ID: 20251031-iris-drain-fix-75fd950e1165
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762054826; l=2368;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=tsTTP88YqQQw2qNCj/kySq4M0ki8akBPEdfHNXPcJ9M=;
 b=Kc5rdsfHPSXdaj/NBj2Obv4p52uiMbY7Lmx5qo8Yp45X2l/+q2BxT5isrvQntQTZ1VlHPMQXr
 W7w4VYdqes+C7yiUcPZiVeYn+HelMrIEYwNU7WFA/Ji92LdNK9L3Isf
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-ORIG-GUID: F6df5h__8mP5xIR5cwAB7P8Qt9wt-JJM
X-Proofpoint-GUID: F6df5h__8mP5xIR5cwAB7P8Qt9wt-JJM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAyMDAzMCBTYWx0ZWRfXwdSV/QjyEjlC
 bxEgSqENx7m2NzvZbLr8l+cz6iXl8o27s1oJKBulaSHA8w+AYUQMwNhFIT92u97ApG0ubhvqe7j
 2QsppYbdfFtd/UBYR4xVNMWLOM/MiPlzDD50pUvw3UlAq2brPiU2lv0g2fJ3ZUfiV2qHF0NcXaS
 3ZH/siuStFYkX1FElI+us5iXzyTtNZvLauOmwowtXG46v9NPgPxwAQKyAOCTKQfLtE6ILG3yd1l
 hrTHIpq+zgY5cDTdc2ghPHFFATuS3z1lMzLWRfc8Fv8QEeO3ilZAWoiF02HY+PepFr7Xgo9uZaq
 A3LGzzS2WVQDUSJ6QMkfSe6MFR1jYv+RG7EyFpq1jkpx4nN1OzsyzfhLjrnvWS7/mTKQSpdBuiw
 cDf9IAWf8qxhP1l4SMuJ+fN/lk1liw==
X-Authority-Analysis: v=2.4 cv=CfUFJbrl c=1 sm=1 tr=0 ts=6906d2af cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=YXM6clFYWdcNeUECVfIA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511020030

Currently v4l2_m2m_ioctl_{de,enc}coder_cmd is being invoked during STOP
command handling. However, this is not required as the iris driver has
its own drain and stop handling mechanism in place.

Using the m2m command API in this context leads to incorrect behavior,
where the LAST flag is prematurely attached to a capture buffer,
when there are no buffers in m2m source queue. But, in this scenario
even though the source buffers are returned to client, hardware might
still need to process the pending capture buffers.

Attaching LAST flag prematurely can result in the capture buffer being
removed from the destination queue before the hardware has finished
processing it, causing issues when the buffer is eventually returned by
the hardware.

To prevent this, remove the m2m API usage in stop handling.

Fixes: d09100763bed ("media: iris: add support for drain sequence")
Fixes: 75db90ae067d ("media: iris: Add support for drain sequence in encoder video device")
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index d38d0f6961cd5cb9929e2aecbec7353dcc2d4a7d..07682400de690ad29c86ab2798beea6f09fdd049 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -572,9 +572,10 @@ static int iris_dec_cmd(struct file *filp, void *fh,
 
 	mutex_lock(&inst->lock);
 
-	ret = v4l2_m2m_ioctl_decoder_cmd(filp, fh, dec);
-	if (ret)
+	if (dec->cmd != V4L2_DEC_CMD_STOP && dec->cmd != V4L2_DEC_CMD_START) {
+		ret = -EINVAL;
 		goto unlock;
+	}
 
 	if (inst->state == IRIS_INST_DEINIT)
 		goto unlock;
@@ -605,9 +606,10 @@ static int iris_enc_cmd(struct file *filp, void *fh,
 
 	mutex_lock(&inst->lock);
 
-	ret = v4l2_m2m_ioctl_encoder_cmd(filp, fh, enc);
-	if (ret)
+	if (enc->cmd != V4L2_ENC_CMD_STOP && enc->cmd != V4L2_ENC_CMD_START) {
+		ret = -EINVAL;
 		goto unlock;
+	}
 
 	if (inst->state == IRIS_INST_DEINIT)
 		goto unlock;

---
base-commit: 163917839c0eea3bdfe3620f27f617a55fd76302
change-id: 20251031-iris-drain-fix-75fd950e1165

Best regards,
-- 
Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>


