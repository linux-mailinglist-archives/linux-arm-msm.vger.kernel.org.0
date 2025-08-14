Return-Path: <linux-arm-msm+bounces-69124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D567B25D10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 09:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CCF85A14A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 07:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D5B26B97E;
	Thu, 14 Aug 2025 07:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TygObaPa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06D3268C55
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755156153; cv=none; b=kw8C7CMABs+qf0EWB5nlrpmlde9FKC/0qfKkXiqbyJXofDP4hT4XsyO58mkdOuzTrhgwdxtfSIi6IRgRpDSUrdTZc35fbb+5iwQJ4wXqY2bKOxRPU9PCz/3zwyssq8tccT2dNwC0pnfmWw1VXTSbYFTTnPmLPVM3Q4r7H6IcFlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755156153; c=relaxed/simple;
	bh=btgYT7isNyxSHT3vBtmVm8ZFwJQkF6zS599ztboiirE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BZSClHnL6nHNRN+xzG0Oh2BpRRALuGHHr9qjRfgXn8vhLDSFmWuQJZBm+JRyfV6aF2Zwc3kIQCM3xuRqUrfsyMT7VZYczgx61kLi755VjnzVfkFuL8csqHTa4cZKfzOHI1noY+XxMzf/7SB6AUiAiV4cWkjv7OF+rkipuCuvjxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TygObaPa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DNMqWs021243
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kjeDTlRvqKRVSDE2XA3jPNpD7W2lMMrCoAkGvvLiNPI=; b=TygObaPabM5k2Ffv
	CfZrgVnWwAL9bhiYVaNQ/McKao2NXDnJkM3bOzFcVPIUT/d0CfLbmOlNsPcIlrSw
	4mj5yDriPrv0+c71lY1LtTzSGFY8yWWs+QYXmQorRCZ7WhnBZQ87q4GaZ4gIuaXi
	0y7f8vzUJ9B3A8T3QtGQwOns/OKO9cpUSzgc+1UTjn0s/i9Mpt+TpAROPhZJkKG1
	c0LKdKuDqkMrQr8FOuuIlBWvHU6xTDQ6GMgAswHw4XE+2piCNnZlTmnz7YUSeTBV
	eZqHpSvF5NiittwUH0eCaz3DtXatroFaao0Co+lN3e+galEBKqywQWmYW6c3z0lD
	/wuc7Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sxynb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:22:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b1098f924bso18903021cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 00:22:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755156150; x=1755760950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kjeDTlRvqKRVSDE2XA3jPNpD7W2lMMrCoAkGvvLiNPI=;
        b=DtifS3D4J5HORJR22EIsQu0Ek7ML3ceyfMx1VdZgRU0mR9w+9PGWBWRIZ6Cn/i962i
         WV/aABZWbAO1piHproxXLaIuTwL/KZvW6z/P9on0+wDczV+iillf32O4oY25mEVl51A/
         XnFac6V4CJXA8VtPpTujMVhH9tywR51uIw9pEDPL24148p+OLAlav5sDIlIb+rUUAVRh
         xv4xSX83TSJdFS8L7eSEF8aLV7p4jyFAIHWaVg1Lh5R+Ope7G9EDU0YXhlXOP9lIMaMT
         3/lRzZFuZMciHwHADH5nZd1cqMc5HITbjzbXYfYd2Zms0x7PoPXwCs6oGBoeBgrySXrQ
         dCJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOIp31dhVHlVH8um1ReG2BRPeWItzPQyVdsM2omPhThXj3DSSVbSVWKFxMFfWQKurIFSuufT8+7eWrWbBJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyP5rCt+2q4Nv+1TwckC+fzNSQvFP6guFMDC7vbsFlBKOCr6PIp
	qzajN4nikvYZK8hRwP69jG4RPZ9+6GDWnIKUdDq5O8OtT4QLV6ffb931Tyk6/MQJF+OgnhMR3U4
	hjZeb8uiOVDEzltIcP9RcJxjBbJAFVqjfNS6qYodJCM3THj/8CrrBrOqY2NAR03L8dNICctZJ//
	gpW5k=
X-Gm-Gg: ASbGnctSQKQcUAoIwhuEzOPcxfgej2ZcPDAQTRvT1TkbCLroLws4pnY8Zbkx0DSXLRW
	gUP2a6BlcvOsOIoH4gudiZfmq9SGkLrcng1OESYvkhIyz+DqAvXRQbZQw7e5DT/Tc+WXDePaG2V
	eRCv++UryTVbVABgk8t59f2OX8VIp75zBZ5aNmhTrA5I60l3xe3uYugDMUeEdZfXX8TxjZy55Wk
	yWUsW4L/E9BD2EbcIUs65J2t7BsLiowZvI2dlGaXeTPWBnuaY5+qDxqTWJ6DBMXQMszjr8ybS9Q
	6QQ5qGkOa1YmD+5ukWPUjdraBESeL18ecdG0b70VOXC4UvNXPa9ouDuR6O6oPvEaRr05uXoukaS
	sXWyNxc8Ctw2hVfYP9KvBfvuG6RxFj2a/tmoy002qqB4iAUr7lIx1
X-Received: by 2002:a05:622a:48f:b0:4ab:37bd:5aa7 with SMTP id d75a77b69052e-4b10ab1b12bmr23384901cf.24.1755156149594;
        Thu, 14 Aug 2025 00:22:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRvrkglzi1fVUqbShWj1Qq5gaJUsbufZ0ky3HjrRVHTsX7RFPTslpdjFRNw5jy+cv/Bih+qQ==
X-Received: by 2002:a05:622a:48f:b0:4ab:37bd:5aa7 with SMTP id d75a77b69052e-4b10ab1b12bmr23384781cf.24.1755156149171;
        Thu, 14 Aug 2025 00:22:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898bde5sm5648258e87.3.2025.08.14.00.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 00:22:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 10:22:21 +0300
Subject: [PATCH 2/4] soc: qcom: ubwc: add more missing platforms
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-more-ubwc-v1-2-d520f298220d@oss.qualcomm.com>
References: <20250814-more-ubwc-v1-0-d520f298220d@oss.qualcomm.com>
In-Reply-To: <20250814-more-ubwc-v1-0-d520f298220d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1834;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=btgYT7isNyxSHT3vBtmVm8ZFwJQkF6zS599ztboiirE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBonY6ucq0xjkspQWc5hMwEep4/eGUZEqCniAZTF
 k+59f9u2ymJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJ2OrgAKCRCLPIo+Aiko
 1fzeB/9oieIeCBGm4gLbZjhPLy/Xat5Ex0qygzGC2GJuQCqCNNAC7Yf3GtGNm/FGqHI4Whc7EqG
 XxxaovLv5V2AqbBQF5cCU4m1VDNXWghrOd1j5cpe3XWOjXcSpbyc94/GiFhXVluFv7XV/a/vswT
 RJFrLplVU33bdWcM2qXD+QMb5nOVQcg3ph1/A4V5UqVq6MBuraC8+TRUVvhjZfodYUNqOSgQ17u
 ndZNAObnJO5PG/0YUEhs+/n3VczgrPpTumTwjDL27lvarq1JL2nA8VeU0paqGbXd8UrvzTd/gY3
 KNJ6l/C7RCBV/+2B03kYIFJ/qURV24ekAAq252w4HHetKQT1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689d8eb7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=loNKmxCBzsa_v9sKRHcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: kzxEnr-S2bkO1dCnRg1NPPjazZ5siQeX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfXx38p0xJHePs1
 M+z+EW/7sxEclUFODWhejGe9AfEDtbrYszJ/tVgRteMOmqE1G3pz/hatKJExpxrnwypBtbOZPBn
 dn+3gcOqMsCJIbOuthx6AgbufdWHZKi/71GNJZ0zYnrFeJiQbo6is+ZQ+aQdzHa9eOQ7KpYlTxb
 GbNfpISAfACbwHLRZQ26ktHiqXQ4WkNMzwhxvBNha2hmaDUeZEtE0cC6lDMBRKu25sg17689J31
 BX+CQVxc3a1EpVyZPKcO/+h7Dcz2SvS3fveCVjKLKkKprhzGmHMAGnwoGr/2qroxR+6ZgbBWQLQ
 sMc76dcO006HI4E+43ygRPsauBAEqv0znkDpr7X/wkfQfzLf3nruE/j5S2XhWU/aoC6zyAd8X9a
 /Em35xe7
X-Proofpoint-GUID: kzxEnr-S2bkO1dCnRg1NPPjazZ5siQeX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

Add UBWC configuration for SDA660 (modem-less variant of SDM660), SDM450
(similar to MSM8953), SDM632 (similar to MSM8953) and SM7325 (similar to
SC7280).

Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 5113c2902bf2ba3711bb14b35bbbb8a2b49b8cfe..8b23b4d4e3989a7170a9f44f3a5e466cffd70157 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -244,7 +244,10 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,sc7280", .data = &sc7280_data, },
 	{ .compatible = "qcom,sc8180x", .data = &sc8180x_data, },
 	{ .compatible = "qcom,sc8280xp", .data = &sc8280xp_data, },
+	{ .compatible = "qcom,sda660", .data = &msm8937_data },
+	{ .compatible = "qcom,sdm450", .data = &msm8937_data },
 	{ .compatible = "qcom,sdm630", .data = &msm8937_data },
+	{ .compatible = "qcom,sdm632", .data = &msm8937_data },
 	{ .compatible = "qcom,sdm636", .data = &msm8937_data },
 	{ .compatible = "qcom,sdm660", .data = &msm8937_data },
 	{ .compatible = "qcom,sdm670", .data = &sdm670_data, },
@@ -258,6 +261,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,sm7125", .data = &sc7180_data },
 	{ .compatible = "qcom,sm7150", .data = &sm7150_data, },
 	{ .compatible = "qcom,sm7225", .data = &sm6350_data, },
+	{ .compatible = "qcom,sm7325", .data = &sc7280_data, },
 	{ .compatible = "qcom,sm8150", .data = &sm8150_data, },
 	{ .compatible = "qcom,sm8250", .data = &sm8250_data, },
 	{ .compatible = "qcom,sm8350", .data = &sm8350_data, },

-- 
2.47.2


