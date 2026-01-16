Return-Path: <linux-arm-msm+bounces-89326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B07ADD2D2BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 08:27:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A1603041F5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 07:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 200E834D3B2;
	Fri, 16 Jan 2026 07:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mfJSSDoD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JCYlmoL9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF65B3385BE
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 07:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768548464; cv=none; b=RP4PS0LER5SwL5RzhoXHsw5+XkpyjbgOIRs18bCCJU8ErKDB+F/Ac5QIP22hPvQ2HE85ItymP5LFRHJdb3QCpPljL2dDdZcLv4c0h14IZWUvAGjaDKvWXR2j1v1NcCivSrs3oeOZE/De/3Ka6gYFcDRcXCgLTjzeRUTtAEMptMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768548464; c=relaxed/simple;
	bh=/pPr+dRIKfLnp8Q3woKxExVLtAqBn6gFla+MK36Boq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iCw/L1rCjlmncMRDVoJBovdNtW7BABRm/QLpjpwffiRZj6p8y7/KGcZttTmZH05z7qjUC5HZaEIk52YdwBUkku8F3PjJHXgT7TybaIF09sx3S4Hh4DV1vVy6cISWY/smUBkYd4cjpk6jpawAvYbnG2V04h+wWcwts1efYfWtb3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mfJSSDoD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JCYlmoL9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMchqH4100638
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 07:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wgF62A0Vusbbe68co/vJ8MiSnUGF6/3kIJAgIkf9pl4=; b=mfJSSDoDKd+l0yyp
	nPbIotzAReyT4WSca4wXc2GjvafC4liDhf+VlJGNE1ZvWHiSH+oXxLPVNyYkVRix
	5T6/UZdyBbesDwEVfCanCcpXR3S3/zjlMreLMd4JVrSDo1Lxq9h4RzD5BSrhF64C
	16gNioOhE5B9G8+Slu1JidtG7zzhFttMbLihz4BKALZzSMbzL4l8Z4W4tpCcN/Cj
	YRGnaTdv6ODjgkKqteavI5z7qMjZB9T5U8HKlZlzIXExlsw90tJX3XJ6IDcaje6P
	tXKmgqQVvuZUA0IaZ8pd9w4DSq618aEQNbzZRjT9LA/qgovz4X4BFda+dfnKimCb
	mEs1Sw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq97517e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 07:27:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52dcf85b2so678633285a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 23:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768548461; x=1769153261; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wgF62A0Vusbbe68co/vJ8MiSnUGF6/3kIJAgIkf9pl4=;
        b=JCYlmoL9j+KHLQgO9+CxtLDYoNSS/ABJ49yE4ZHGpEQw2O5yK3LF76LPBnlea4fNvX
         kEBkq+F1Cap+RKsAOV1k/+uF8tCenRJhR2HvCLyt6Qdtn5vPVHwV+Xugb1HCZre83BoY
         BzFXzHXfO2M7R2aWxfW6zlKku8O3Mrc5uNJcUG7Lplvd3wUcnbMSuYgnkVdH/zeZ6B9N
         1TjnB7q1Mg2NSUJ1Eg4P8ChrLqdOyVzr8LtyFp5JzaMn618kwkbn6ZtpbducFVddikxL
         CRc1ZBHQhhPo2ipeYTu6kYHGAIgT/ARILKUBeMSF08Fv9/7NjzbP59mFl63SFIrYEHJD
         OXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768548461; x=1769153261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wgF62A0Vusbbe68co/vJ8MiSnUGF6/3kIJAgIkf9pl4=;
        b=DjOivowO6Qc4dl/gDx5PQzZJMF6kdA0aS3MIqPx6dYZDTkbT4ExBufaSE/jOdnXTHb
         WyUZc0rjoVXz4kkkINQLSgoVZKdCyuQ+lFsq99dUFip69bSiTgAk4auoRxGnsprB/c0s
         g7Hu9h2Ebr5c1NL0DDsH1OpV25kNksnYRqfogeqPdG9jNj8a6389ZAbRRH1n7KvM6K+H
         mJD/GMRGSVx/UepWe433A6AQk2tnPE6arVinGrTwGLINYBvx46T6KhShxLzChSJg4Wx0
         a/7beZXo6zuKfEjCMY78yVbLxonl7Tjcr9i/UGBmBD09OxAnwDOlVhOwGHgCiSBBE0Dm
         Xuwg==
X-Forwarded-Encrypted: i=1; AJvYcCWIevFjfQn9ix/EqM80gSfMKg1onH9Ie/CA3OqJElT/mn5colLlPj85vCYX7f43EJod7PRX4zpwl4rmxzWd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8FwUTtP4RuR3P2f/quKn67PqzXcToi3KSfg/jf9d2WWl5hT6y
	houfPwWyo4PXxmNT7wZLDzXc41xaoIx6uGh5S1c56NSoFvQGFFLZa5+N+woN8f5qgZzWokj/CIG
	VTTeCwMJppTaqY8kzignhEo5zmqbW+I+im1z+IT5ZVa+0xBLzH/YRTpLuZftPf9KAbw+e
X-Gm-Gg: AY/fxX5h7pZEP8zJTzJh/eORNvhP7tHx4P6RzuOoUk+ahfnnr4p43CTcHvtBnbsky2N
	dDnbHFtmmc1JTQHd9XVqMJuHSIytQ8QR+YZjkSeFmMjgT9jMDhzATb+++r99kNsLKyixikywx4q
	EHn11LV3IZkJSeloTv7as3dZXrWzysEgJmxiSspfjLEsBzepjn+1u7Rc6uEFBSYqloz6uwijl37
	Rj6iWJjMHyZPCKgY/fIsl+Hn68fmj99BG4dE0GfUVx6ZAAL/LPVj1OAjdrNdaOzuNWq8RoOh/N+
	stOLB7GViUX6mhUn+d4FIJbNCVp+dHUOl8g+sBoJBSVr3EeHOnXMxKIsDZXD4Qg+fEoIHuUDgSg
	qsO0zOxK1LhYy8PTJH+aG99hckGFWoc32coqhmjeSeJAN49chCxLn+dnTxk1c+H6+sBFfCfudR5
	kTwpNZ5dUPk3UcZp0+RPJ/aDE=
X-Received: by 2002:a05:620a:199e:b0:8b2:730f:134b with SMTP id af79cd13be357-8c6a6944de0mr277056685a.50.1768548461209;
        Thu, 15 Jan 2026 23:27:41 -0800 (PST)
X-Received: by 2002:a05:620a:199e:b0:8b2:730f:134b with SMTP id af79cd13be357-8c6a6944de0mr277054785a.50.1768548460795;
        Thu, 15 Jan 2026 23:27:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3976dbsm516941e87.66.2026.01.15.23.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 23:27:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 09:27:35 +0200
Subject: [PATCH v3 1/9] soc: qcom: ubwc: add helper to get min_acc length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-iris-ubwc-v3-1-662ac0e0761f@oss.qualcomm.com>
References: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
In-Reply-To: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1369;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/pPr+dRIKfLnp8Q3woKxExVLtAqBn6gFla+MK36Boq4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaehpR1T3VBTIQkkyCWtBdhXU5YpA+KxUORAvI
 bellaztkwCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWnoaQAKCRCLPIo+Aiko
 1UwDCACat6lqDOs4O4mFhWUV0YM5NoK2p4O7go9R7f0ZP2lW1boDmpYL47eINtt7v81/t8RFexC
 4JyVdynfkAM43wuBa6wCrWHDm04nxJLr/RX92tSdynVM15uH4aghcMVvVPG4ZLY2labtWx/9Tvi
 om95wvBAbbvZf3vkD/+b6xrtcbefxRkV6qZBd0zUZpBMWwDSshmEfknkyOgxp5WMpAB6VF7muQo
 8LYHaCxcO/ME5Lr+6cQWMQjRHtmP6u9+tD4LYYm8hhN192xaRuwwzh/YZpUaDlXUQkWN+aWiHpB
 S49ef/WFOg5lgsl8P5TSbpTq3Ad4uehuOholTmwFweY7gMfF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1NyBTYWx0ZWRfX/qtCZWppB0Je
 6X5VhcN/XDJLpIYiMUg/5Y+mwU03+2pqQ0YXUXeZQaxOs/9/jQ4Nityz+XzKygQr7kPIOHENiWv
 mY0wFl2TfSul9BUy3vd3XIowHLFV4HEtq6qybI6a8J0PS+ej5h4mW5HY28ReOdRkz45mqIuH1V3
 TN2jKgWrVY8dTZx4ZDm2y3CW6eu0O1CFJZK4Aj6lQRrh/OqdM7wEJfngJQjh7Mr1fRcif1W3+a7
 HQT3NMSWjoTCg66qCtlUgOO2ZBWbhgc4fB/NPRK0TCH/elxo9+tHNNYvjJ0E4sEJaHyJYRVRyWF
 f3prDCmpFX/Da4VDMDjjwXlTpN7Qk0x928oSXRUM3oIazVSVm/B57ya8IMrzbWWuWVtGiBxxbDp
 aE3vvX8QSEnTE7jHaSzixGnqv9rWGzss0SKjkLoqkUdwrXxc+66Wy8/yeefR0x7QqGRmCoAILMz
 4ysRwyyFa04VZPzpCPA==
X-Authority-Analysis: v=2.4 cv=Sv6dKfO0 c=1 sm=1 tr=0 ts=6969e86e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZnE8w8QzOYjIZ_Lrp0IA:9
 a=4tUkUnfIpJ8A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: KMDY8ouaEbJqFB0YUJEh7FhXMyNTwJAa
X-Proofpoint-ORIG-GUID: KMDY8ouaEbJqFB0YUJEh7FhXMyNTwJAa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160057

MDSS and GPU drivers use different approaches to get min_acc length.
Add helper function that can be used by all the drivers.

The helper reflects our current best guess, it blindly copies the
approach adopted by the MDSS drivers and it matches current values
selected by the GPU driver.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 0a4edfe3d96d..719b31c8fb3c 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -73,4 +73,14 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
 	return ret;
 }
 
+/*
+ * This is the best guess, based on the MDSS driver, which worked so far.
+ */
+static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
+{
+	return cfg->ubwc_enc_version == UBWC_1_0 &&
+		(cfg->ubwc_dec_version == UBWC_2_0 ||
+		 cfg->ubwc_dec_version == UBWC_3_0);
+}
+
 #endif /* __QCOM_UBWC_H__ */

-- 
2.47.3


