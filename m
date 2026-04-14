Return-Path: <linux-arm-msm+bounces-103184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNrBMat13mkqEgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:13:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F7E3FCE6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E64230A1C29
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 17:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E048E2E8B98;
	Tue, 14 Apr 2026 17:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mLOOyRpB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hK/aeEnv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B582F2DC321
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776186529; cv=none; b=Vkh4CZ89/sQgVqQ80yWKTzDJZn6FPh568UfX2r6HEtx2Y56oLbtQ/hSO+ZxkbZ6O8ZqI2gq79efCv8oqjX/wcxJlfCUtLrBazXamiw1LdzqPXv0XAcDt4itHB8ByUxfo+71zyG0qCGW7Iu59t9L+YwFCAOdcsHSXreI3y0Nueu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776186529; c=relaxed/simple;
	bh=nG3HGLtKAAk6JI8ZPXSU1m2OMN1KOTGzF+vXFrB2bfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qjfPkUPAbDYv2GROMU/PIr469autwz1hghWOJ3Nqtcpbm1eSKafANUDI2iTkl5OT4lsocZxUgS+i6TapXNXIXgUfasdWs7Qnd9BMlUa3zQkVo2DC98U1rvw9PqpCKfNVoA8ICLx7k07YqApEcho/O2wW1mLDHJ665oWrCbKcJ6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mLOOyRpB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hK/aeEnv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EC8K8g280867
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wmgIZX9kqMP1Kel1luzD38WggWBRb6Y5G8TMEPPawwY=; b=mLOOyRpB1HgTUtUV
	mHRy7RL4O2GFBN0mw4O9LcmtPlXUrVSK94ggV5lx6CUF9IDJD9Gy63zZdVKKJIf3
	Afluu/mIt6OnnUTI5X0ht57k5CrXAq90wCmpDtG6nlsZKJkdAHbQQiiZ0n94C4gn
	29HywD+dXSPTw2rxhjUOTI64WdGTD8Sd4uRSNUwlnAen9NcmLje0N7t2hkDkNGdD
	nlO1XGjOR2ntpnXvFWPG/6Ms0S++vgOqy0Z2EjHah6BuAGkPVkLkA+yq0KOzFNO+
	XugDqxTwJ3vTKCL87Zh6HBbPvVrhF1OXvie7Pdxf0S7hhMvf6irCVVJwBC9ukv1n
	9LSEUQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86vkrh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:08:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2adc527eaf5so42019755ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776186526; x=1776791326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wmgIZX9kqMP1Kel1luzD38WggWBRb6Y5G8TMEPPawwY=;
        b=hK/aeEnveK+NNYrMwT9UATB8WXo5iHUIqMY9mCbB4Ydf22L+XXsd1Pf1zRrQp4tTKO
         vcdkgcoLvOk9Jn3TuW1dft6KIR4IzOXqzNfvRQ5Xx8UftFJzjcTYsR1xvoAjsVc25DCC
         zv0AOxy+ZL7x/CDvtFirichpM/S99CDgQcvZ5JZmPW1I1+W0pbvwT5uh6D6sbnb78Qc2
         bKS4PZxQYwvH+Tmh0huCMFyZb7lVjUvAnTr7QclswVv4QtVdkCPTua7eEfmCyliIVcJ3
         FE4QHXAvIaIdFf9QD9cd9QgHDxSIAzOAfd6zw0FO366HiQdWbqUB0msswGvIA+yjxiI1
         Ye2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776186526; x=1776791326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wmgIZX9kqMP1Kel1luzD38WggWBRb6Y5G8TMEPPawwY=;
        b=hHCIo0mWLy2yy5EkWhatgSYPEklmoax5hyEouwOm/ubmYbkyIbLiqutObI5dfFiAjJ
         pXEz3U5cviQmy7b1qMWnKVri/R3CmjqbUrTH4gN8JXAjOzras2CBR/V2u5YtqpU4OBxD
         F8uES7DzhPsrC+uVEArfnBu2E/9tJFSqjSW8Dg+CHImNh4sAIarZpawD37Kf+K2/jvgB
         +/TFGYx09UbqxefZcZDbTXSBWL6c5vaT1anq7+umC/b4aFYXftd+TFMqBfGu9JqF8da5
         UdQOxzNQ9GzL6QN5SkC3Lij36lW7MaiEInG55kbJHLF/q6pUhr03IuoFi/edn10dp3zw
         XcWA==
X-Gm-Message-State: AOJu0YwBMmNy0YBhlg3rRSWzIfhXjz0IVkFoGD9xaoGc4ByaqtGGf9Hp
	yqTtqqWktDN/axT4/dEwL7wS5F58xCOqbN2zRpFFQiJV6f/hBmAcRmCDAEhsHjiFGBdJxMGAiQG
	VWQkCtE11x3PxcDbgXwv9RPdY0xZN/JcFUdrn2oLfb3KHnHDFKhf5lG6o7mUy5I973MLn
X-Gm-Gg: AeBDies58WvCvbrJNnajMB0LT1Yc0tauOXyeScAYDVrA5ItHBtqP9TePbTd4dPsQPie
	i380db8cijdj50dm81/j+6eVzqkpx0+SJIj/N5QZSLxO7ktPQNYnc904SF+uy0Z8+5loDFvYbM+
	PxSN7cxay+F9XwDFoj2PBQJKcJd6HQFZsqTPJgtVZHASf7xndg7vh3OveRLJ1I9517eC8co5rIq
	ByN1j3pMscA05azxH9a9RSuOrHvbWWhsSQppbc+VfVBjN1K9SKyS1N0WeMQJ7JSh75ruaU/+Glk
	epqGeolL9Z3clm7enUfOEvv6rimBDteikllLcOWQxRTRTphsjdDsGcWksVA3qYYdBWnhdMXJ4cj
	KZa28It6WEeSutpgdubDAgbBt10g+kpmv1bc6cb/rGrjMWnw8PaYFXlD5vnxWowh6mhua
X-Received: by 2002:a17:903:2ac3:b0:2b4:5df2:ebd8 with SMTP id d9443c01a7336-2b45df2fa77mr80727175ad.45.1776186525519;
        Tue, 14 Apr 2026 10:08:45 -0700 (PDT)
X-Received: by 2002:a17:903:2ac3:b0:2b4:5df2:ebd8 with SMTP id d9443c01a7336-2b45df2fa77mr80726625ad.45.1776186524861;
        Tue, 14 Apr 2026 10:08:44 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b45d1ab540sm97535225ad.40.2026.04.14.10.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 10:08:43 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 22:38:20 +0530
Subject: [PATCH v2 2/7] spi: qcom-qspi: Fix incomplete error handling in
 runtime PM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-spi-nor-v2-2-bcca40de4b5f@oss.qualcomm.com>
References: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
In-Reply-To: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776186510; l=2901;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=nG3HGLtKAAk6JI8ZPXSU1m2OMN1KOTGzF+vXFrB2bfQ=;
 b=31644fZHVoQSXMrcYnJW71B4KkmEd7vugysgBf0qD9Mv0ylYtPuBiwaqFomH252uATFdCyovW
 I+nIxsM0ftwDU2ceey1RfNMC4UeeWupbwR5PlwqCLgPxAIxIFkjjose
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-GUID: 2yPqN9xAkGzaVKwtniTS5CJaB3Nxwguh
X-Authority-Analysis: v=2.4 cv=cffiaHDM c=1 sm=1 tr=0 ts=69de749e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=8HTBTZp0RI7lF_4f_zEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 2yPqN9xAkGzaVKwtniTS5CJaB3Nxwguh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2MCBTYWx0ZWRfX+fvf+8mw1hgy
 ANoVdNevJG0UvZDdpuOQfvhiK0W9XABfiOlK+bcLYRx6ZALB1J8Le8c1N/24PiGihsnwn0lxcD+
 8U5lQ9vrA+8SNQr++QRZ/0mw1gfEQ2vSJutk2V9WcAQ8DoZLH19XxtFpQkyrfDpP0mT3S+EZpgd
 hcHxmVIvItMPYPNNXM8wdBGvwvzh20Sod4Yc+LdUhtX0AEek/MvqzIf0LV1NmHGZSZ2lZ32LUu7
 LA9aTMizirpfnzqHq9/tkHJ7n6CGR6Qi4TB0qmjiiobZnVqEIn9DoNlau2cOpMSApkm8M0xobCJ
 HR8nGGYXfIeyxoHkHbeY0oLfSy2JjciKYK0aT5LM0Q2wyGv9sdzowQVvp8OryMMchnq7naNy+op
 5IwwuvUjGJVqaf7iGb4O1etFFO6i+AOjjqpHiAGhbSBJurMR4LmBfTelpFRkuU/ECcxcyVHnk7N
 z1ivWqgT/q8qz7r8iVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140160
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103184-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 20F7E3FCE6D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The runtime PM functions had incomplete error handling that could leave the
system in an inconsistent state. If any operation failed midway through
suspend or resume, some resources would be left in the wrong state while
others were already changed, leading to potential clock/power imbalances.

Fix by adding proper error checking for all operations and using goto-based
cleanup to ensure all successfully acquired resources are properly released
on any error.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 drivers/spi/spi-qcom-qspi.c | 40 +++++++++++++++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
index 7e39038160e0..38af859713a7 100644
--- a/drivers/spi/spi-qcom-qspi.c
+++ b/drivers/spi/spi-qcom-qspi.c
@@ -819,19 +819,31 @@ static int __maybe_unused qcom_qspi_runtime_suspend(struct device *dev)
 	int ret;
 
 	/* Drop the performance state vote */
-	dev_pm_opp_set_rate(dev, 0);
+	ret = dev_pm_opp_set_rate(dev, 0);
+	if (ret)
+		return ret;
+
 	clk_bulk_disable_unprepare(QSPI_NUM_CLKS, ctrl->clks);
 
 	ret = icc_disable(ctrl->icc_path_cpu_to_qspi);
 	if (ret) {
 		dev_err_ratelimited(ctrl->dev, "%s: ICC disable failed for cpu: %d\n",
 			__func__, ret);
-		return ret;
+		goto err_enable_clk;
 	}
 
-	pinctrl_pm_select_sleep_state(dev);
+	ret = pinctrl_pm_select_sleep_state(dev);
+	if (ret)
+		goto err_enable_icc;
 
 	return 0;
+
+err_enable_icc:
+	icc_enable(ctrl->icc_path_cpu_to_qspi);
+err_enable_clk:
+	clk_bulk_prepare_enable(QSPI_NUM_CLKS, ctrl->clks);
+	dev_pm_opp_set_rate(dev, ctrl->last_speed * 4);
+	return ret;
 }
 
 static int __maybe_unused qcom_qspi_runtime_resume(struct device *dev)
@@ -840,20 +852,34 @@ static int __maybe_unused qcom_qspi_runtime_resume(struct device *dev)
 	struct qcom_qspi *ctrl = spi_controller_get_devdata(host);
 	int ret;
 
-	pinctrl_pm_select_default_state(dev);
+	ret = pinctrl_pm_select_default_state(dev);
+	if (ret)
+		return ret;
 
 	ret = icc_enable(ctrl->icc_path_cpu_to_qspi);
 	if (ret) {
 		dev_err_ratelimited(ctrl->dev, "%s: ICC enable failed for cpu: %d\n",
 			__func__, ret);
-		return ret;
+		goto err_select_sleep_state;
 	}
 
 	ret = clk_bulk_prepare_enable(QSPI_NUM_CLKS, ctrl->clks);
 	if (ret)
-		return ret;
+		goto err_disable_icc;
 
-	return dev_pm_opp_set_rate(dev, ctrl->last_speed * 4);
+	ret = dev_pm_opp_set_rate(dev, ctrl->last_speed * 4);
+	if (ret)
+		goto err_disable_clk;
+
+	return 0;
+
+err_disable_clk:
+	clk_bulk_disable_unprepare(QSPI_NUM_CLKS, ctrl->clks);
+err_disable_icc:
+	icc_disable(ctrl->icc_path_cpu_to_qspi);
+err_select_sleep_state:
+	pinctrl_pm_select_sleep_state(dev);
+	return ret;
 }
 
 static int __maybe_unused qcom_qspi_suspend(struct device *dev)

-- 
2.34.1


