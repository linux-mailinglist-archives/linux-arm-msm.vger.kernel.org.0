Return-Path: <linux-arm-msm+bounces-82931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE21C7C750
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 06:01:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 49B684E321C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 05:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF66A2C08C5;
	Sat, 22 Nov 2025 05:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g6k7KR3e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hy6SHcit"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226942C0276
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 05:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763787663; cv=none; b=kQROtO8HjkUDvcWzaNBiIPUd70ry6MFOmKfQODRRFiil8PeG2MXcdhCq81CH0WMfXHXkEkU50l2/SRCHNcI5jSZ6qtuat1FtUC1aX6xNt5BGheEszUUnP9NNMDNDSyeJYjbmdPcbW8kUlOdscxG17ESOg4h5O8T9HbCnLJRxM6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763787663; c=relaxed/simple;
	bh=rDxzoo9mPvrgo+TgdB83NXCLEhXKq6UnZhUCfS8cFKw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tc4dD/+U9F6D5J/Zsemn0VnfvHEGbHmeVfVR/0H5gadbMSpBQeEQGeFGPgs6zgqq2ShGvrLFhyQwX/hWCh5RpxMSgv8AoX+fCYjpJlmsttNo5FU/iVRIcLf8ucr1w+gWInJ5duDrW7dvAU/jryea7gYB+2ij/9RrcmN9Kq5BC7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g6k7KR3e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hy6SHcit; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AM4lkUN1252927
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 05:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BDBSS5w9Uh7
	89kT2CYn7fWvlfuaEBPwFyHC5Vg/UJG4=; b=g6k7KR3ez7Z+bOZKSJc2PiEelYM
	OQS3ddHreIdKwHf/4bRUOULo3otE1h3sjayzLy7G182EFG9k3DIL4+Sj2rmBO+3D
	4nUXOb8+E5q0h248yOTx9QIc0OhxqRhHRpItmFN2aZhw9HMmUU+x7adTho3a7XX4
	ZgZX/qJnpd9Xl8YZhiD7dglzaOqPkIahEaFfeoNbW9XgjTG946/Q+Allv5AsdGAJ
	TxYzmQLM8FyiKDvnKL7oqz3WN2qezxJ8xYcK4qHQmyqMgwjIlg9n0nlwY3R+TuIS
	iHwGER8ytnqOE0xyxJ562ZPkzV2D5m7+I4tfCmuQewPIvmGGSQrj33VnCQQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak6f800px-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 05:01:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2982b47ce35so29713955ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 21:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763787660; x=1764392460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDBSS5w9Uh789kT2CYn7fWvlfuaEBPwFyHC5Vg/UJG4=;
        b=hy6SHcituKYOkRSz81gbT9gRgoagD987DKiI8NZ74XDWaSPRh8gnOOqQRf/FT0jjE8
         /VuZXbNl+1vIgQ2Xs041GYd3PLoE5og8zxBDuH4jVkvawrYvYY/u7ei5QMuWGR75/j4R
         mBNrr6OFopZOW1ICQl1rto2eOw5KviliPI+ZNadTKKpCnaLIONmdx2Jpo4GXfs0e4Gno
         /HqJu+PWeMbZ5JcRAqDaB0vYg40bouvh3H/xTzUjZUQZj0lDHYfRNOq7FA4l6+7iBkTR
         0VL0Y08TCCyV9r3GLj4S1oClGpq5OQBS7Yj4QHuYfuFKE/VhcRW0kFjrRM3+WMeM2OeF
         cA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763787660; x=1764392460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BDBSS5w9Uh789kT2CYn7fWvlfuaEBPwFyHC5Vg/UJG4=;
        b=cqHItn1ilPNxfGLG7mKO+kONOI16k5ZM7whUAMYsOslyR1f513BKmSkkuRIsfum9MA
         IIAYgYtWSUuoVRZhZEHwbkB3FEGVyWjVadvINtEBESELuBkzPpOwdeNl7s3IwIVfBhYR
         hMWUcdRfH8fvWJjyWfI6BZ8No7ysEeTwtoqzCc4sIjVFjSB3BDw2UQHkgwRk29ivLDQI
         J37sL9dref4fEKCv/FzyHwo2zRpOrzOL1oJLZOkt4d+6A1W/WzUwPaP+wBu02wP4T3Xa
         ejozTMtj0LMdigrS3Vl/Ej0VtY3iDor9eqqbKsnEqlC9TmQ0Fs/PtpPPKPEaNSy3uqRc
         eYVg==
X-Forwarded-Encrypted: i=1; AJvYcCVUe57oT3xFA0uzlTPtjQ+qLrn+PKboPaJjXIP0mXncUntg1oqW5jyaAmH8984Sd7AoyRaBtA/QlAg3GaOJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxLrfNuslISL+YNCN5M0Joik/iBT4K+nV+8Ab+j78KXt+IgXyEE
	1ppD9IMFnVbxfha6s7VOD55fhgiop+UnD0ly4xay1dbLLPhyo+iGQDQYV8f0rl5gZA2ONAHb7PM
	hvB8Ej9C3rdQnQnfXm9c20zE7m/JQCaUx66NE613SufxsS1pMHCPm/iKl8uBKF/14ywfn
X-Gm-Gg: ASbGncv0AbOprHLO3mDLtsVAcmaEM7gzynZpkvxgfT34bH/5x8Nyf++AHiqVocu21oQ
	UHNmsKQNQtSwSOQimiqql9MgZO7Sxj4zVaI5QqDb/xvM6w16wGI6n/GfAzsXuWAQFT0M+WHcz6a
	orf1cGxEuJdx25a/FwBZ8fG7DQ0SQMhWsHDvw7nkNRS5Bwc4nZ4vZ6N8Rf50ouZBhW1jAX5p77C
	FC3EZYeiPVN0ftTfejnavVkYZWY5NkMrii3TxK+dTnEiQcSPHHXQiFudzNOFpPSE0irBYzlNCyK
	WssnQQF9Ql7slx1rJKMrnnAbmP+Z/9qgbSRhJSRUamoIdjF8Rv5LAHzSa28nU69W24Aht4mkD2d
	XYpWKskoKtWGZBR4Lp629CsdppjMq624zFCbDIHdKOfM=
X-Received: by 2002:a17:903:19e8:b0:275:81ca:2c5 with SMTP id d9443c01a7336-29b6c6cfe76mr54889965ad.59.1763787660380;
        Fri, 21 Nov 2025 21:01:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzbOAksoEAfNT3rg9bezuKN9iAxY86Pk44AoY7Q9p62Ql/tgh5TPxES/EbRak1Yg9xb8JQUQ==
X-Received: by 2002:a17:903:19e8:b0:275:81ca:2c5 with SMTP id d9443c01a7336-29b6c6cfe76mr54889385ad.59.1763787659758;
        Fri, 21 Nov 2025 21:00:59 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138c08sm70688725ad.25.2025.11.21.21.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 21:00:59 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com
Subject: [PATCH v1 04/12] soc: qcom: geni-se: Add geni_se_resource_state() helper
Date: Sat, 22 Nov 2025 10:30:10 +0530
Message-Id: <20251122050018.283669-5-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
References: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HJGffeTuJ3s0IW3kqYFnZJj_H-wU6iqk
X-Proofpoint-GUID: HJGffeTuJ3s0IW3kqYFnZJj_H-wU6iqk
X-Authority-Analysis: v=2.4 cv=SINPlevH c=1 sm=1 tr=0 ts=6921438d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=yUT396-8qwsxfMvC63wA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDAzNyBTYWx0ZWRfXzbJgOijlAOB0
 IlOyNZb0FBxWEkqwuIfJMHj51iGCwH8NTtw6nm5qzBRN4jObm44FalvB0oyEuqHFjd1Zs6YiIJp
 BltJX+pESoAHrzQ8Sv+G1CSgqhDtGdOpqKKcHgG06MQo5mXlk+SLS3MaBWqkf2UJg05rJ5gn6qm
 p/R95PaW9/3tnncdzn0h7/k0BnFWjAzE2c8kxcFkh2y0rWmWsXr/S1Vrhe8UbKYPQR810A3kC42
 No32RYINjz7NL7eFIJvJmvELj1G+w/ogqOHVwVratL7tgnHSvbWjGNIDW+oN2IMPoFEnFcXZyUc
 RIPJ0nZ9TLemmv00po9Ga3xmPfXj1iNuw7MhCVxU+vkL0Is6oSpkn7a63mXYnXQUgTwTj+/wmTB
 P5GkoZKn1+rIJe4kle0gFGIog8r/mQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_01,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220037

The GENI SE protocol drivers (I2C, SPI, UART) implement similar resource
activation/deactivation sequences independently, leading to code
duplication.

Introduce geni_se_resource_state() to control power state of GENI SE
resources. This function provides a unified interface that calls either
geni_se_resources_activate() to power on resources or
geni_se_resources_deactivate() to power off resources based on the
power_on parameter.

The activate function enables ICC, clocks, and TLMM with proper error
handling and cleanup paths. The deactivate function disables resources
in reverse order including OPP rate reset, clocks, ICC and TLMM.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c  | 61 ++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/geni-se.h |  2 ++
 2 files changed, 63 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 726b77650007..7aee7fd2e240 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1013,6 +1013,67 @@ int geni_icc_disable(struct geni_se *se)
 }
 EXPORT_SYMBOL_GPL(geni_icc_disable);
 
+static int geni_se_resources_deactivate(struct geni_se *se)
+{
+	int ret;
+
+	if (se->has_opp)
+		dev_pm_opp_set_rate(se->dev, 0);
+
+	ret = geni_se_resources_off(se);
+	if (ret)
+		return ret;
+
+	if (se->core_clk)
+		clk_disable_unprepare(se->core_clk);
+
+	return geni_icc_disable(se);
+}
+
+static int geni_se_resources_activate(struct geni_se *se)
+{
+	int ret;
+
+	ret = geni_icc_enable(se);
+	if (ret)
+		return ret;
+
+	if (se->core_clk) {
+		ret = clk_prepare_enable(se->core_clk);
+		if (ret)
+			goto out_icc_disable;
+	}
+
+	ret = geni_se_resources_on(se);
+	if (ret)
+		goto out_clk_disable;
+
+	return 0;
+
+out_clk_disable:
+	if (se->core_clk)
+		clk_disable_unprepare(se->core_clk);
+out_icc_disable:
+	geni_icc_disable(se);
+	return ret;
+}
+
+/**
+ * geni_se_resources_state() - Control power state of GENI SE resources
+ * @se: Pointer to the geni_se structure
+ * @power_on: Boolean flag for desired power state (true = on, false = off)
+ *
+ * Controls GENI SE resource power state by calling activate or deactivate
+ * functions based on the power_on parameter.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int geni_se_resources_state(struct geni_se *se, bool power_on)
+{
+	return power_on ? geni_se_resources_activate(se) : geni_se_resources_deactivate(se);
+}
+EXPORT_SYMBOL_GPL(geni_se_resources_state);
+
 /**
  * geni_se_resources_init() - Initialize resources for a GENI SE device.
  * @se: Pointer to the geni_se structure representing the GENI SE device.
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index c182dd0f0bde..d1ca13a4e54c 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -541,6 +541,8 @@ int geni_icc_disable(struct geni_se *se);
 
 int geni_se_resources_init(struct geni_se *se);
 
+int geni_se_resources_state(struct geni_se *se, bool power_on);
+
 int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protocol);
 #endif
 #endif
-- 
2.34.1


