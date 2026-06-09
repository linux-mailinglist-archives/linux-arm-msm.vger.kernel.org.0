Return-Path: <linux-arm-msm+bounces-112126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Vib1LrnqJ2qn4wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:28:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 989E365EE4D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:28:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=prTT0DVp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Wz/EeXg7";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112126-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112126-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C25E33055F08
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 10:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1033D3F39F9;
	Tue,  9 Jun 2026 10:23:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF413F23B6
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 10:23:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000616; cv=none; b=CD9n9t9S9sNmImlc3YF4L2X4VWV6DKijw89HcTlZk36+6dGnlzHar4yeihjXKcT4JLVJ3K4KNNe3zCla41nWur/HV4kuFWzsMkgRJcqnv5mhcsYFma03G7CKDyx3k4gZS6LEnlTyZiUNYoj6+SXLfqxgNs2c1aMunuhxYrQC7Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000616; c=relaxed/simple;
	bh=Vgpcm917rI9AZrXT6kF/x9okjO0L2rzuk+62qAXi46c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TRMc/BVFUJm+3AkuEvyK8oWImCVU+FESMPudFAZ47VCtFOMpZ45gR56sKeXpT7F3vO7HSLJB1l/NQHWM2RSJIIo/LL8vzHqklxh2lIHYGcXC4rWzCoGtJVOwVard4b2EBBnKhsTpV8EcO5cWf9y5unms+fARb9v9efOR8YUVxvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=prTT0DVp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wz/EeXg7; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599vJiH1800728
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 10:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hjwWogEPwpKGwvQdDpP2g/5MCS2LNqM/7Nc3Uixz8zg=; b=prTT0DVpy46+BNts
	Qfl1PDFGUjsjqXqvTsv0XYQDNNaOOUJqktHXkmUYdonpfhFQPVv/c9WAMMFPDVAR
	VRTI92i5euj61Ys/yEAbDGsNZZUEZhA59+MKgz11TPYade4lHC54K99ulyhiaAFl
	QRPjDQRvVxD7KIrbt806HrXDt/dmSq/jHdu7gMXAb1izEA6kKFxs6z9CHWxtHH71
	HsrugnCyEaIvW3gkiMRistxkEZddbij2mZxypttVl3YvPh6iVw+PmBeUcAt3lEbX
	JH9yvi/CFkzkoxVwMArXKNXv2QTgE46pIi4cPLYsZbeT973FUbt/bWL8M66oVi+w
	vjcHCA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenr8n58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 10:23:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c20f7581so58248855ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 03:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000614; x=1781605414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hjwWogEPwpKGwvQdDpP2g/5MCS2LNqM/7Nc3Uixz8zg=;
        b=Wz/EeXg72SgQwxWHKIASYaRPJ0Jw8s3ke/LJYam7V3gR2fQm6iRYiDIVbxRKoVudbi
         7acLIUSJVgwRa39qmRgoc0EBa8RFgxNAOl+6+LhVXGHmTLO1fLXBaZ9e8D+mbN88gshV
         vQnsAyrttIN6oEVNixQcq+osmi+Y+yzSGtS5npnUBqoCgeTsM+JmZYwIgZP8fM+tNs3y
         vJyWU00T7hQpg/N1UG7AsBW9vWYFgdmGzWE5YNCKSMAOcKmTeRG4/iCK2rIx3rzrsFMS
         gwOxgA1KoCAM7rAl/fJqzikoilLjl3xLtN0GkJDuA2+Mnyen+y/593EP8s5PbzvWQwrD
         Dryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000614; x=1781605414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hjwWogEPwpKGwvQdDpP2g/5MCS2LNqM/7Nc3Uixz8zg=;
        b=Yi4QOtbRXmqLvb/odfAqZxjDF0ncpcoP3AoHD7jIPnq9gwKPv+5WtfxUAV5SdAlDss
         aV/x+SqYnFOtGD6Y4g3ugR3IPT5DulksjRpLQZzZW6ZmjVtp2FyB+FdIH+zyYtg3sFAU
         MPbYylMkPuhAco5DIRaYrTzaw1wgkAQAv+4Pj4dCRpXOAPuqrs2an1g7xMtVyIVdmCtm
         pxPCrcR/kWxMp8ay2r/dhNqsp1/WHo52Ne8YTJIjL5EMbOj9V41kl6qwPZcS5NdupZoC
         M67OQDVjpT3F6SqPFMav72LItH0NkBSgmnKxStLyAM9iRXhBVXwiqZMx936mpKsOm1WO
         qOqA==
X-Gm-Message-State: AOJu0YwkoI+fdwntzVm9/2EeXoXLqpQD4+uJE2tIn1tNKBqSFJ1R4OGk
	pozq/ZC+SXYM48GH4wpuWF+wN7JMR3iFH6HcRfxRz/MNDUDyAOmIZ1irS2cdJhEMmaQYFZ/A2eG
	RXFXTAo3M+FTGnEJyutv85qBDlqB4Y/qVZJZTbFR8YEHrJZ+EerESxvaz8fcAPIJR1buk
X-Gm-Gg: Acq92OHU3k8VLZCysxmYiPgIXX1mnzirRcztL53DTEwCMW2fMITb9efWxGKWpglBxUj
	tP8HMf69o+TFDbG37QDJeRC9JqJqlQEaeOwwT/cUeStixgO7nm28dkY6CQN/jGECcZvLusCI38G
	ZsEfrp8CjN0vuL/JEqyEmmZpwEIufnA2jBbhdOjnt/4v9f8wYO8UWkmqo4ZmNCQjz9cjwVjlFaJ
	nHZ5KGCwC6hH1b0s35jHxRI/EOxDoXOwlDu9V97zaqVzScRIWlcdIzNBofim8Fm5w6RMEIX5NRq
	83VL8kdVrFgBEdp2JZGZGaEWyUjKddAdJUy4Fd4/Y1levHsCkvtv816uo6XJXVvzLNznqNExFV8
	eX0l92kO+6Ea8hxx8xnCLi5y8iv7NuQVK0jDBdUDE5sFVSkoLgLfON2PbCqhMkA==
X-Received: by 2002:a17:902:ffce:b0:2c0:a746:7aff with SMTP id d9443c01a7336-2c1e80ebb9amr221575655ad.24.1781000614144;
        Tue, 09 Jun 2026 03:23:34 -0700 (PDT)
X-Received: by 2002:a17:902:ffce:b0:2c0:a746:7aff with SMTP id d9443c01a7336-2c1e80ebb9amr221575045ad.24.1781000613695;
        Tue, 09 Jun 2026 03:23:33 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c2a4a64e22sm14738915ad.61.2026.06.09.03.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:23:33 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 15:52:58 +0530
Subject: [PATCH v3 3/8] remoteproc: qcom: pas: register TMD thermal cooling
 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qmi-tmd-v3-3-291a2ff4c634@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
In-Reply-To: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781000588; l=4010;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=Vgpcm917rI9AZrXT6kF/x9okjO0L2rzuk+62qAXi46c=;
 b=v1Ic0FXdRYOPlaKPI+tvvVuHSsoolHXtuOodAQ+nk3K/gvi09iOybzeNknDfxDjkSwPL+Oo0i
 2fN6D1GKrH7A8Knx+Ag7A1EekKeHIDSJojGPhQA9lhGc9Um7PcrPjJd
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-GUID: JanjBT_1Dd9XxFDssvfhgdsYX1xt6dSc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NyBTYWx0ZWRfX52tm56IuwHIM
 UCBach9voYMwYnw6ia9rGvLTObDFOhAzhKJGoaztu/VqXekehVBz5MFzPTDCTQD26WYOiJeX91s
 XBGN+yJjpzUgqbQ+IBEcpXiDXNGsZYavcvik/GxoB2FpW8dr9ryz7TyskZppyAxktvHt29wvdfE
 Mez/AYTgfKAyZtwq8VuV8UmV71ObXeDN36YrSqDwDkC8HTpCKjRPmCekhCfmkJ+ZBXqur30Wn+w
 1f7PKDGcjr43bPE31RPrtBFmApSIeJ4C/V9UGNH5f7BL1u5QnB7kb94umwdeIUCzDyMbEb1srAd
 kKcg/NR59fI8sjNcN1WzFIop38bXxiFVHHQjtdi1LkbfSl4NKviM5Hpdv/PlhZX64K9m1QyEmQP
 22+QwKorG7QB8h3661P8CjvnyRU+ZJ521DWM7Xrb17XEoIGcIbSkEg6q8gXWBv7saZx9mumrD9i
 rQUEI4p//qp+JT0Cj5A==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a27e9a6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=tEZXOP7woKDf_sZP_QwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: JanjBT_1Dd9XxFDssvfhgdsYX1xt6dSc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112126-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 989E365EE4D

Add support for Thermal Mitigation Devices (TMDs) to enable
thermal throttling of remote processors through QMI.

This enables the thermal framework to request mitigation when remote
subsystems (modem, CDSP) contribute to thermal issues.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/remoteproc/Kconfig         |  1 +
 drivers/remoteproc/qcom_q6v5_pas.c | 61 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index c78e431b7b2d..cd8cc911e1be 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -228,6 +228,7 @@ config QCOM_Q6V5_PAS
 	select QCOM_PIL_INFO
 	select QCOM_MDT_LOADER
 	select QCOM_Q6V5_COMMON
+	select QCOM_QMI_TMD
 	select QCOM_RPROC_COMMON
 	select QCOM_SCM
 	help
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index da27d1d3c9da..1ad896de42fd 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2016 Linaro Ltd
  * Copyright (C) 2014 Sony Mobile Communications AB
  * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/clk.h>
@@ -24,6 +25,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/remoteproc.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/qmi_tmd.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
 
@@ -120,6 +122,8 @@ struct qcom_pas {
 
 	struct qcom_scm_pas_context *pas_ctx;
 	struct qcom_scm_pas_context *dtb_pas_ctx;
+
+	struct qmi_tmd_client *tmd_inst;
 };
 
 static void qcom_pas_segment_dump(struct rproc *rproc,
@@ -733,6 +737,49 @@ static void qcom_pas_unassign_memory_region(struct qcom_pas *pas)
 	}
 }
 
+static int qcom_pas_setup_tmd(struct qcom_pas *pas)
+{
+	struct device *dev = pas->dev;
+	struct device_node *np = dev->of_node;
+	const char **tmd_names;
+	int num_tmds, ret, i;
+
+	if (!of_find_property(np, "tmd-names", NULL))
+		return 0;
+
+	/* Get the TMD names array */
+	num_tmds = of_property_count_strings(np, "tmd-names");
+	if (num_tmds <= 0)
+		return 0;
+
+	tmd_names = devm_kcalloc(dev, num_tmds, sizeof(*tmd_names), GFP_KERNEL);
+	if (!tmd_names)
+		return -ENOMEM;
+
+	for (i = 0; i < num_tmds; i++) {
+		ret = of_property_read_string_index(np, "tmd-names", i,
+						    &tmd_names[i]);
+		if (ret) {
+			dev_err(dev, "Failed to read tmd-names[%d]: %d\n", i, ret);
+			return ret;
+		}
+	}
+
+	pas->tmd_inst = qmi_tmd_init(dev, pas->info_name, tmd_names, num_tmds);
+	if (IS_ERR(pas->tmd_inst)) {
+		dev_err(dev, "Failed to register '%s'\n", pas->info_name);
+
+		ret = PTR_ERR(pas->tmd_inst);
+		if (ret == -ENODEV) {
+			pas->tmd_inst = NULL;
+			return 0;
+		}
+		return ret;
+	}
+
+	return 0;
+}
+
 static int qcom_pas_probe(struct platform_device *pdev)
 {
 	const struct qcom_pas_data *desc;
@@ -855,12 +902,21 @@ static int qcom_pas_probe(struct platform_device *pdev)
 
 	pas->pas_ctx->use_tzmem = rproc->has_iommu;
 	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
-	ret = rproc_add(rproc);
+
+	ret = qcom_pas_setup_tmd(pas);
 	if (ret)
 		goto remove_ssr_sysmon;
 
+	ret = rproc_add(rproc);
+	if (ret)
+		goto remove_setup_tmd;
+
 	return 0;
 
+remove_setup_tmd:
+	if (pas->tmd_inst)
+		qmi_tmd_exit(pas->tmd_inst);
+
 remove_ssr_sysmon:
 	qcom_remove_ssr_subdev(rproc, &pas->ssr_subdev);
 	qcom_remove_sysmon_subdev(pas->sysmon);
@@ -883,6 +939,9 @@ static void qcom_pas_remove(struct platform_device *pdev)
 {
 	struct qcom_pas *pas = platform_get_drvdata(pdev);
 
+	if (pas->tmd_inst)
+		qmi_tmd_exit(pas->tmd_inst);
+
 	rproc_del(pas->rproc);
 
 	qcom_q6v5_deinit(&pas->q6v5);

-- 
2.34.1


