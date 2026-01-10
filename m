Return-Path: <linux-arm-msm+bounces-88364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A8CD0DBA7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 20:38:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C244302929D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 19:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8358429E109;
	Sat, 10 Jan 2026 19:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+6u4JTq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VqcAgnkP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECC526F289
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 19:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768073884; cv=none; b=L3X8eOqB0B+PJaskfUOadkh3/HF6tLOo8NAl63Fh+4kh2L3VTSfSUkgKvL4Ho2JHK77zgKtRF3+isZuC8ZfMeEUofaktRGnOEyaMOr1njO7rqZDd3Olw+y0A8vlsO4hNBRnpS//mXeJE7YKBrYGAlquY2Ym0BkvjvFe2MjffE2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768073884; c=relaxed/simple;
	bh=zKJ+c8HSILFFBvnz1YjV0aR6Aoj/wvUlPAFO+6q13BQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JohK/n2wzydZ8DV8IXdospiRr2y7NM8wJ24JQ0bw1vSy/jXxBhVDXcD17EPtMoZgr8hoBNpa4MrKt0QaonDizdsyD1O6fDE8ljmf3MfBXLUseT5FpWXyS0DZbvt2jncmVthgCdrArlHQIP3QCyNlKE1SE1/o3ZRX5J+ioe9MVcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+6u4JTq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VqcAgnkP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ACo1sb3339694
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 19:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cE1iNK7oSYb2ENHxgn2Nm8Ct5MGHGyoDIREyhbI0Xwk=; b=m+6u4JTq7WcFnqHU
	AZqj43pxtaOmHj6ro0EZ5VzxUTgxCfiv+Mbf1qD04IyVoEvpmt0VwZ6L8PVkgHk3
	JEXs4ZXWXd0rrGLuYoVqdcVJceSmFAo6BsC9CMov7c4rxR4H/5acquqFn4OEo17s
	Ie/JjQXkRsl84zbezJFvPkelYjD8b7M9JsqkDr+HCcUZJaaowSpXaIdFcbXurWTb
	mglSjN/34ZWtYgTeOQ9ZKUodpdfnSGYYotEnDnP+ouWtz6riw/Ojxh4pesZ7OdA7
	xfroPAWDSAXsQkId8ObGxnLfJvpKX5WyauwyJomVztQAzoMWiJcTUbC5bsZPLNrm
	dWeRug==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkf5795ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 19:38:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bc4493d315so1328810185a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 11:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768073881; x=1768678681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cE1iNK7oSYb2ENHxgn2Nm8Ct5MGHGyoDIREyhbI0Xwk=;
        b=VqcAgnkPxDudAjUVjp4dJmf3QafBzA7IHiq+/uBWFZIXSp4KCyxJ4y1PLHscCfEovK
         zRZCUev4T8pLO4Lm/LlX/CMwbQzf3FiMRwR6Nhk67cQ1PB6q2LTdcZiaoP4u+CEdlXV8
         KyLBkId2e7Dwwwnt9FZ4YU7RN6uG84TdFDVszdcr6RLL2STQS85pf5LnBCAjTkcSug9z
         1M2PZX+F4ZaPSPBDqCCnnhNEkdRqHED4HIaiaxzQTEFEoFePz4BhTHezqbP65wCVthhj
         JDoAKI90CnB5gWb99ealo4qXxPFlRCV9Gg657TzB20xDLSOYNtU6FqN1Kt88d6YDa9d2
         Sr5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768073881; x=1768678681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cE1iNK7oSYb2ENHxgn2Nm8Ct5MGHGyoDIREyhbI0Xwk=;
        b=Q9utOt/LeVyUum/A38gWbKxr7ZcM2qR1i+FGtSQTtRkKMj6fuC9o4MtDVQL2UQYJT8
         ELzeeJmp00KIGL4O2v/FEGlrJbAUHlqlfIhkOxSaaerLU1U40jIJo5v5KmgzrqglELeC
         3Ozde2klukwEailLmamm4DLIuKAUrMqiTEAs2rlzKzJbTYIky12bCSF2qZsgmh1iNTq5
         tSeImRB3/gMu/1tGZAwQZpjEj5ZJjAXJWllxPREFvQlvulE8f87PKiAgHu5nx2aWhYqf
         he4IIo00OW1/FX3qKUm6ohMnOAc9ABbCVVcnRXP0qbpJvVed3HxkSIBAyBThpapOrqT3
         qA2A==
X-Forwarded-Encrypted: i=1; AJvYcCX68loIL8SMnyI1jU04jwBwYpIeaM1H5ahlsxCdGNFDY9m7TvvjPtv0wYS+bzrrmGceLFJOSE9dIuEyb3Q2@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ17oZs2ZEYRcLhDXBcNr2IBM4zi5cT9ymLZIxmH/YT1rz2LVv
	cAw/SC+YvptWbm5VnuoiIKX+xOvGVjRRzALWdL+a0LVU0FC1MRmDZsZRdsZWVYDBOuhWgiBh4Hm
	GCN3etuIsOHMfyJomORgaiMb5Fqc6K1CUlwSX/YNb6VZS9ZSr7NPrBsR7OQKATahSSquY
X-Gm-Gg: AY/fxX645xK2Cbs3IuhPkJHMXOZKHC5aS16zYnZEko8sDIB7NJ4j2YUoFEGukTcS/bA
	Ha5OXlsAaV2aTuvJB0F5RRkmn40j0Jv9nORoSRa2PVWxjE+B4IdK+HgCt5vcJqt+Bu9BCG4I+KJ
	2HfGoA8zWlNsfKbFbbH8QlV/zZ5TpozXCDRuJ7vJQcksE7QsMsqcON/aSLNPn06++/2zjrLCgxl
	X26Z1sZ6GUWW4VAM2cdWSAD1SCG3paKbOIfCbwnFtV9a8JBdOuDL+4jmS+854ke67fOiozFw0RN
	vxf4V+8iRRO6ZwLRItKVOptw2BCx2Uiq3a9Dr5S7ul3qY18WQ+YmFr29EB61KZfXDC+8RH5QR+n
	znxE5GNnO2M8qggaCku3ScTf3vvOUePCsuo5Ke/IBNjywUwkz1cP9WclPCAHd2VO0JFa4TmFtEL
	ble/Pbd2r+mu/Q9OID7hpU7gg=
X-Received: by 2002:a05:620a:4613:b0:8b2:e8c8:671d with SMTP id af79cd13be357-8c3893ffedbmr1740245285a.60.1768073880846;
        Sat, 10 Jan 2026 11:38:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/f2rvS0VmS+7ayW3OO3OHA0x8A7hZk0tNL9pAd+oYNFUThZJ515f7N2X2V1J2Ht+V25Vy5Q==
X-Received: by 2002:a05:620a:4613:b0:8b2:e8c8:671d with SMTP id af79cd13be357-8c3893ffedbmr1740242985a.60.1768073880324;
        Sat, 10 Jan 2026 11:38:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 11:37:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:37:54 +0200
Subject: [PATCH 02/11] soc: qcom: ubwc: add helper to get min_acc length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-2-dd70494dcd7b@oss.qualcomm.com>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
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
        linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=873;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zKJ+c8HSILFFBvnz1YjV0aR6Aoj/wvUlPAFO+6q13BQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqS2+miKKkIMNsyVf/kiv0DOSE2UY6Wq5hSj
 kyX2UCIbleJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqkgAKCRCLPIo+Aiko
 1YDeCACAIpwx2qMLl0UJtMK6ivOoRA+N9ufTPpXO0ue1uvr1rIKYFwDC6s4Up5Lsd9O/6KKrsF+
 +GJ/xpjfpATisd/7FhAIqJGMES+O83Hb1UpFxKzHZBinekFpWpzs1LUFMeRHONj6v/GR6Ex40sM
 GX8hbcj0PhSPvJOEvOvh6QIMjHA6GfCLqsjhXztUij0QnWlX7BSbRw3ChUGBphTLRo4lAlheP32
 qnqALsCxc6lsZnmmqHLDJTWfcigghWgEQp50E/vOneTnGtg2j08PoK50KuAiE2XQ0Vl78HcSp54
 4fvV812T3g8WS15Wd3ulfz7auQSa9IQZvZFa6LjMb0K8PbLh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=K/sv3iWI c=1 sm=1 tr=0 ts=6962aa99 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IHcyGVePH8s1r17UYT8A:9 a=4tUkUnfIpJ8A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX2PvEvIAV8Whq
 CpupSJT1bt7UDufict0h5jQ7xxkbOWznaftP5uHBhxHpVThDM4sRNrpmeH0lY6RSVkJg7IwM7+4
 bwhHgdpMdw+8Loe3CiwR0lJ6sFwAk4xvLQ4iRUaGzKPSChsb+JEMFGUCMOFX/AFiI8tbpgwl+3a
 25UB8gbr3Mkqa60su6D3DyXlvak/e5Xbsx408hFuZLFIQAUwsQB8YG/DmkKVpoT8O3Ya/Za+8kT
 6i/HScwZAMs2xMzP//4FpHzZF6DrVKEuCkeWIcPF4YFks6A3BadwaMAFckRoVzOWLUtEBVo/2e1
 uB0CUg0WcEM5HGJZ4jmUd34bpaHE0Sx/gLKWoYfmUYssy7eccErgJ2s9bkPJz1R9z+J1PzIAM1W
 0+eRD7tVfV7NesXDHIsFOBJnZSh8Xw/5sz0DFt65f4idcsiBakr4Bb0r0MZbNZtqObd7vGRp+d4
 xFZeIkbxIfbWFJFOvWA==
X-Proofpoint-GUID: E0fl9JsNgAeygwalXTSKAyZMzKZkysR8
X-Proofpoint-ORIG-GUID: E0fl9JsNgAeygwalXTSKAyZMzKZkysR8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100173

MDSS and GPU drivers use different approaches to get min_acc length.
Add helper function that can be used by all the drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index f052e241736c..50d891493ac8 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -74,4 +74,11 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
 	return ret;
 }
 
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


