Return-Path: <linux-arm-msm+bounces-86945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F03ECE96B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 11:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 53E4830036F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 10:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66CE22820AC;
	Tue, 30 Dec 2025 10:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXo2moKB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F9Wapg3V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90783284662
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 10:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767090451; cv=none; b=qSreJ1Nytf1DUPXw4Ldn3gTyvvgIVXeyGugyq0+ObQ1+wBY6NFt/tzPsT6UJyfQZvHP7K+xzkStdT//onk4W1B1e1e6+sMHyZv49+PWvxWGwYMvAn1MI6RFlt7Vq/dsFHjTI0mEkX0/pZHfHs1aEubmDAob7M1Q9qaWRoE9LfYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767090451; c=relaxed/simple;
	bh=FmWe6rZe/HDTlZ7P/ixCrGi5PfkWJIMRILt4LaYdJ38=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=vC6V2MXqt03VWFd+J/uewDOXAEkkPlbBxAB55pL/10eK1EqbiJGI89WTfZb2cU4rtkNdyWt4sZAkwIjvLi3SgH9RkkMae/TPZU1u7TYgiH/5hgttrvHdPd00/QNoRrCFBh9XyJBtKtfj3B0UkNEe1PYAqqU7wUpwsICRzwxpi3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXo2moKB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F9Wapg3V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU9NrdW1839424
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 10:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GxnlGpGN7Tjmm9TUj3vJg9iTVu8V3od6YKF
	QIdTCMfM=; b=XXo2moKBWDg8JTn8Ug2lHyibrAkO3lHERdLjb/4IqAuATXNLkJG
	ogLnTQIg/Te6xxqJHt3h9n1I5pcX/ETggPshxm41bedFGbqdycCtfQPSY3PEU4Q1
	o9HdUvpbxoRAxI3MA+cs1Qs7aQk41Kktx3N3yUm6exN6qtUj6/CKeujvVxqlhufJ
	KYqalXf5mf9PcNb7QUDQ4HE6tzGTPtbNmwL+uPgCLaZjf+71qv0h4i7rTziEZfDT
	nBunJHjXgi5MftKq6gIAlTB3mB0JR/7pDH+QxA5238c0HQRRhJK8q2knWQvejNg4
	nb+1etgqIO5fFTkik/aq/ytZHYcgvSvELQw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0sgshuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 10:27:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c21341f56so29553323a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 02:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767090447; x=1767695247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GxnlGpGN7Tjmm9TUj3vJg9iTVu8V3od6YKFQIdTCMfM=;
        b=F9Wapg3VLEykEIzqH0bEPvDQIsW9rvV3XZVT/TldbkFFPZsncm1zNsAgLx+GNku0EJ
         +q6hBGum0zyKhjauMEjXAwYw50u1nXn1PYX6gd1sFCkPMeLAH6dCZgOfAvEseaPQWtqW
         TzgRu4Wy70sKJ74+04uWWJH47CmIM5diRg8IjtItIG2+7qkH/P8fDYsr/KMQlkCLhm0k
         4xEwftD7MOkCNoaBGNfjy3ficUayRd3/X+AmFLuJeF9RDjai+SAPCT7pihYY/XwfVa7N
         OfVQ7MiuABaIR+2dtvrPP5QD8S1bVjjUOEJ21EH6T+Xpnauzv1ARls2J5eIEN/MoalsH
         98yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767090447; x=1767695247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxnlGpGN7Tjmm9TUj3vJg9iTVu8V3od6YKFQIdTCMfM=;
        b=JEarDlMX49jwFuhIm71DiNHUGHMNBI3REl6JivpQPzrvB/yK5rms9r7CW8o/WNk51k
         Hby8FOd64pam+vJknOneTt6HXywknfiOgtaN5fWRg6K5e1xmVDlwxn12PB0/pu3YspD8
         5Pw6EWLbqUtLcTtfquGax+OW/lL5I7aqJzNkTWeBPzWPXJd11NM5GWXZaWVbDLGa3sgh
         jbXetbBUhtPMllsd1FpXYXyTgHNgmPuobiG5kumNB1zsJiUXZCrLAsfJlYMz6M7dNgDl
         oCQUdRHGgwfYXY5CJFt1IqTPoF6WNgQRV02+FQOT1ZThDVUmgyqjQmLEh2XvJGRDOEPw
         GzZA==
X-Gm-Message-State: AOJu0YyJLBZ5e2THzi5S0QusAoFUbz7n4YU2R0qBSfntE8OlCZ66i5wy
	VR2ynQ9W4J/vz0SRKN1d/MZWmKQajG6KClvYBRt7a7rmOXjpc8OLozYwuTu8TyesAXmp30Sb5rs
	eZTzaxLkFQW1KPGYiyz3BAPPFDfI4w6+rYJtvTOgCJB2ONSqgl8IEYh87s98L14mKkuY0RV/UaJ
	T4
X-Gm-Gg: AY/fxX5ASy3OMnoM/UGXG0mYBqI/Q0J2q/l7Wyc5liOcpDDmekjqi0voZRw9K98JmUF
	E6B5CBFkJsJmKjt4yYm9kiJP3h76cwTbBz8FigcI0S6bPahLi0lZkUDNuAWR30H8RqfgO7Di2lX
	3XrK6I/Xa03uN88R/fnH6eWZtzLxbeAu5HiHIPAzLsZlYcprnrMa6qsOJU4tKuUUkUwuol1ptDp
	rrEwGkKsYh+oouYEsiOtsGjQhX73Yd9R/2tUNyhkuRTi6OrIwJ8/0vKpxqa/PgQkupK2j09BwhT
	YV81T3WqCQO/7JpbkXX7WSCdMstBbfJ3msp8BWrghdTNZHehvtABE5TC5Z8S9IZ5huleX5LbaCL
	Zy4vWiqkmIMk7cay6Tr4D2odVZID0EzhjvNXxIn2wztqOcw==
X-Received: by 2002:a17:90b:5607:b0:340:e517:4e05 with SMTP id 98e67ed59e1d1-34e92139901mr32623887a91.12.1767090446964;
        Tue, 30 Dec 2025 02:27:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHFhHr63zQEI7+flX57+GNMHlaA4Hy04H01qIHOyP2Q2eVEFLoRxtGALhBZQ6jjASFyJBDQw==
X-Received: by 2002:a17:90b:5607:b0:340:e517:4e05 with SMTP id 98e67ed59e1d1-34e92139901mr32623873a91.12.1767090446506;
        Tue, 30 Dec 2025 02:27:26 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e79a13f95sm27526387a12.9.2025.12.30.02.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 02:27:26 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] soc: qcom: pd-mapper: Add support for SA8775P and QCS8300
Date: Tue, 30 Dec 2025 15:55:08 +0530
Message-Id: <20251230102508.1491296-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA5NCBTYWx0ZWRfX8ug1ZlSV1FvN
 9gPlweNDc3TPEWouzBU78lC4X8EIJJVEdlYwTuKnbIYNRYzOZlENN3V6zTyVG7HDvf1Tg3i4Kzp
 DRCs8TRlIS/oSTwMHjNtyyEuQT4sFsiR2YOQ7ziGPCikF+157y530NbFfqMOjbmiLI/sCBYQzP3
 uIfDYDSuczAJbDsQTN9cMphSkuh96FViXK+FWaM+8VCgPhxMmD1eaLkDMLl49JcZhgdHduZr3He
 KZA700f8/0NifBYNjGWCzJMv8G0k1zRL+B5l4DGg38P3KowfPLK3x/d36YwA9oob+W3forCBJ8S
 rz1YNXT2hXcBG4DBPfqODYn5CZp1cEwY5C0mqD3ALxRL2NfUR6yzbKlMAQ37cuDYGISy3aq24VI
 ngyciSk07yKXsF3kxuxHSPAPpFCJCkLF/9ckclBVhMGsbYNJ4inTh6nf9fT9jeediXuw8izOf9Q
 wBm++n6juibKpsGpppw==
X-Proofpoint-GUID: ZLHmts8qrh2u9-RqIouIE7gtm68gJFve
X-Proofpoint-ORIG-GUID: ZLHmts8qrh2u9-RqIouIE7gtm68gJFve
X-Authority-Analysis: v=2.4 cv=foHRpV4f c=1 sm=1 tr=0 ts=6953a910 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=D-m4OJWLYRs1EUmHoe8A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300094

Add support for the Qualcomm SA8775P and QCS8300 SoC to the
protection domain mapper. SA8775P and QCS8300 shares the same
protection domain configuration as SM8550, except charger_pd and
mpss_pd.

Add an entry to the kernel, to avoid the need for userspace to provide
this service.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 1bcbe69688d2..82a923d41914 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -401,6 +401,14 @@ static const struct qcom_pdm_domain_data *qcs404_domains[] = {
 	NULL,
 };
 
+static const struct qcom_pdm_domain_data *sa8775p_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&adsp_sensor_pd,
+	&cdsp_root_pd,
+	NULL,
+};
+
 static const struct qcom_pdm_domain_data *sc7180_domains[] = {
 	&adsp_audio_pd,
 	&adsp_root_pd_pdr,
@@ -572,6 +580,8 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,qcm2290", .data = qcm2290_domains, },
 	{ .compatible = "qcom,qcm6490", .data = sc7280_domains, },
 	{ .compatible = "qcom,qcs404", .data = qcs404_domains, },
+	{ .compatible = "qcom,qcs8300", .data = sa8775p_domains, },
+	{ .compatible = "qcom,sa8775p", .data = sa8775p_domains, },
 	{ .compatible = "qcom,sc7180", .data = sc7180_domains, },
 	{ .compatible = "qcom,sc7280", .data = sc7280_domains, },
 	{ .compatible = "qcom,sc8180x", .data = sc8180x_domains, },
-- 
2.34.1


