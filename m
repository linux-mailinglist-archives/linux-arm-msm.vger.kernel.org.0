Return-Path: <linux-arm-msm+bounces-63732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E70AAF987B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 18:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B93EC3B704B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 16:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E7E2F7D13;
	Fri,  4 Jul 2025 16:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O9Pjmo1M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30102E5B24
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 16:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751646929; cv=none; b=tstmJcVxTE5MBKmSxeYCzMdemsNSPgaKMvwhxzL/MsV4AVRBtSmkW23vEq4MhfWbFCnkEDm8oqptwz+DbG0xZhbJifeoYYTsq+/QmNAnebKJr91C6zQ2R8CMn0E/JzuqXwwQ0GTs2gKTBgK/VpDXaC/314eZmm2nTtrCwu8R7io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751646929; c=relaxed/simple;
	bh=gfgsNf97a4gh+Kj/WAFR7Au3voGVBKemXRNGvFV/pQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I3vV6QT5hJ9Magl0RFhqcbb9qnERMSNpjlqIKcOlIAnJaIibfPNuFoRJNvXvXAfPtvBQxnM9KrtJgoQiBSwvmMcMgSgjfBzpWh3c74PTPE7dPxBDSjaamrRyGXiB67oAHf1Io7Gu3KX/AbyejWTU8bYnr8vZ5ZHWIDocAM2tN7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O9Pjmo1M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564B6SRe020519
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 16:35:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FfzLENn8AreWFlLbfZZwByLrmHBduXBntme3gzzOYSg=; b=O9Pjmo1MDjryCOMZ
	QWV+ISc4yHeTnhBN6wCYr+Mryws5Gya7KyT62gT869o1Zq035KV/9fBs0buRW4iv
	eMP7+YCgnPZZ7v0Oi2RAc7f+KKrK/r1KmQjNHyeu2F1BcD65hmnKmqgl7s+E5z/I
	XW7OKxInpCkAvhjXD9qIO4dtba7sEwQq+eE4apwTM9wIMbHMeJa/9lxM9z5aQ6kb
	Mn0akcBYiYyuRDdKYXH0tJuBVJhh73o77ZXifket71vSgyk7DKuSb+DUywmTzh9J
	R+CUZa7xN733kATqiOMJqnuaZ+3H4Znps/E6+9Duu3tMMkwBTJtimqhf3Qfpq1pv
	9SwwYA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pdsh8sy2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 16:35:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3cbf784acso282343785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 09:35:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751646926; x=1752251726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FfzLENn8AreWFlLbfZZwByLrmHBduXBntme3gzzOYSg=;
        b=CZeK2JCdw7cw95WZjBdWIN4SHDT49Z9yM+7PypYTvvYN4e6QCSLn6cb2Lr/5af4q9o
         i2oleq40bg4UMalOK2o7sI7z6GMAtNsGKa+ZP3hCpJuc517UOFutJjkZtfsBkCLvIjCE
         MGS3QXne9Td+uGC8KwvlCipi8CsZCt5cIGrkAYQsAynIvtyybCsM9ka0N9zV5MshFxpz
         GN09W9/o3WHII41ir3outG7NlWVovk5RyvB/2KBalWWb7PNOYagD6gtA7JuN8dmEZb99
         h0+gYYIItr9eWaASlS1psuSlA0D+1qmJAOuo8CrVQHQRPAar1oLfcYe/FYuejak3+WJi
         bPZw==
X-Gm-Message-State: AOJu0Yweq5RfqTMdpD5x6oOVPr4Z/x/mi8yEhD894A7g+9gzqf2gDjMv
	clevWoM6u/ySL6Op1naOOf0R+yhowcdVG+bxcbLvK8tHzPy+EwCjDJQdS62u0V9/vH5p8qwAAo7
	tQT2f7MadF/FIz/N2nYKv1bR0yh1GYqzDkSRfZnfxB2pn21BGo3O2AyqfSOetKL8U4MtW4z4jtL
	32MQk=
X-Gm-Gg: ASbGnctfB0cx2+SaOVPzQ9E/DqIv5LZLShNQotrdr2zArDLoAcFn4H4WyFokqkm7KAl
	sI9pN2LCf7EFBo/uAX3jYsk0lrl44FaEBI2mBCmOt0pUPfCzOjaeJxNp/3iMyFi7Cy0snqrBQ/k
	1zNVfQ49MnI8Qez6dBeDBg/ifGxm45Se8jxwi/eJLOP39ieaF+UWcBFf7k18Wwaz0GfK1C+z8Df
	dig/mjJr9wp+C4neNO+cB693MOgwhLpLyhhZJctk5Vs7Xvh+YIOzK6w35gDrKIjwnTgwjFMa9yp
	Ggz9bo1bctvx/QaFM1pFPoBNauL/paBIkqj8iIZP6PIYhNkZW+tKJs3UReWrkI3vBh9EeEtwGq+
	30fPHIGuodj4qWPI5MOF8xcSIyxqxDLZ5Vbk=
X-Received: by 2002:a05:620a:2487:b0:7d4:5361:bb7e with SMTP id af79cd13be357-7d5ddaa7e54mr403616385a.8.1751646925584;
        Fri, 04 Jul 2025 09:35:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSiIrbj5T8wan4VzNj4OM6LypfF2CYwdOWFucarddTghF4qTmlqyWy4L3a86W6cPqRfAe6hw==
X-Received: by 2002:a05:620a:2487:b0:7d4:5361:bb7e with SMTP id af79cd13be357-7d5ddaa7e54mr403613185a.8.1751646925135;
        Fri, 04 Jul 2025 09:35:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383d33f3sm298321e87.68.2025.07.04.09.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:35:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 04 Jul 2025 19:35:14 +0300
Subject: [PATCH v2 02/28] interconnect: qcom: sc8180x: specify num_nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-rework-icc-v2-2-875fac996ef5@oss.qualcomm.com>
References: <20250704-rework-icc-v2-0-875fac996ef5@oss.qualcomm.com>
In-Reply-To: <20250704-rework-icc-v2-0-875fac996ef5@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1448;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gfgsNf97a4gh+Kj/WAFR7Au3voGVBKemXRNGvFV/pQo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaALE8wL7DGkOZpUsG21ISBXejjozAU1TYZo0u
 gCLksE44X+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGgCxAAKCRCLPIo+Aiko
 1UIsB/95IXcFcAp3rJaW5SDpehXV0cFUM15twIA1QVGZv5Fl7nmafvVlVszgSMExLecPYn3itU9
 zbUe8MawNQdHFGmcUliKp9po/zHYAPA4WMopMGcBE8vC+85ngz+PgP596VO2JNJmZs4v9EwHN0A
 cC4lgR0EjRnpmyu8BcVw4+w9Kq35deM2bPFVh7y3vhOp9PrbMEyS1EE1btjvli3VooETB+UcJE2
 rCB8iS90r872pMwSfKqfVXzTgFO5Lkb46kbgkO+rpUHmFcJ2+7/WC5oPsvDiLJoystwam2UZBLl
 RMZGN/cRomBLO+lEYcMDA1eYgCEiVa0Z+FUW6EDSARXNH5R/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyNiBTYWx0ZWRfX0wr+IacaF63I
 ywBy5mBvNNsEcU0e0SVAjWIbD1Xe6r5x/Vd8yUeopZ07FWKainOY2y2nKLUMaqSzME/ib3XPWkU
 8LOqdMJOwaL6fcD2Tv+/ZnI2A3dAllYvZQcKVu1C1VGwGgd08Rp0sPQTXdYxa2rLqVme9XhPdV0
 ynW/eVJu7q9GSCo5lIQvml0WZ0s93jiQoZhp1cDfx/h33Di5abo83m0mG83utfBF88fhEHABMWE
 F1IShO3NQZPbqft0LSuJjyBMJ1BbFX2pBGQnBByHA3GWbU8D4AUihZJeZVeU30zuc9y+kJhtNG+
 Gj3tfuPD5/+4McELHI+ILmzpsTvj2Kjj9lJdk0TKcaryWjEa4gCCCav+QZu8FGo0zzFcm6RvNEz
 xKs/yXzULzKwSQqvUy1KxOBl5Ft9oPRPkmIM6A7BZSBWElJivF7PTIb7vLZdjkx+lhjUOe2Z
X-Authority-Analysis: v=2.4 cv=RJKzH5i+ c=1 sm=1 tr=0 ts=686802ce cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=vjf1cmd32cIfnlU9i4cA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: TP144bTgjcZmL-Kervhx-RFXoqXRbOP6
X-Proofpoint-GUID: TP144bTgjcZmL-Kervhx-RFXoqXRbOP6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 mlxlogscore=846 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040126

Specify .num_nodes for several BCMs which missed this declaration.

Fixes: 04548d4e2798 ("interconnect: qcom: sc8180x: Reformat node and bcm definitions")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/interconnect/qcom/sc8180x.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/interconnect/qcom/sc8180x.c b/drivers/interconnect/qcom/sc8180x.c
index a741badaa966e0b1d0e0117f73f5d37c6ef9f19d..4dd1d2f2e8216271c15b91b726d4f0c46994ae78 100644
--- a/drivers/interconnect/qcom/sc8180x.c
+++ b/drivers/interconnect/qcom/sc8180x.c
@@ -1492,34 +1492,40 @@ static struct qcom_icc_bcm bcm_sh3 = {
 
 static struct qcom_icc_bcm bcm_sn0 = {
 	.name = "SN0",
+	.num_nodes = 1,
 	.nodes = { &slv_qns_gemnoc_sf }
 };
 
 static struct qcom_icc_bcm bcm_sn1 = {
 	.name = "SN1",
+	.num_nodes = 1,
 	.nodes = { &slv_qxs_imem }
 };
 
 static struct qcom_icc_bcm bcm_sn2 = {
 	.name = "SN2",
 	.keepalive = true,
+	.num_nodes = 1,
 	.nodes = { &slv_qns_gemnoc_gc }
 };
 
 static struct qcom_icc_bcm bcm_co2 = {
 	.name = "CO2",
+	.num_nodes = 1,
 	.nodes = { &mas_qnm_npu }
 };
 
 static struct qcom_icc_bcm bcm_sn3 = {
 	.name = "SN3",
 	.keepalive = true,
+	.num_nodes = 2,
 	.nodes = { &slv_srvc_aggre1_noc,
 		  &slv_qns_cnoc }
 };
 
 static struct qcom_icc_bcm bcm_sn4 = {
 	.name = "SN4",
+	.num_nodes = 1,
 	.nodes = { &slv_qxs_pimem }
 };
 

-- 
2.39.5


