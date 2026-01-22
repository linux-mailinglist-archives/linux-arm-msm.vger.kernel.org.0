Return-Path: <linux-arm-msm+bounces-90108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CwODueHcWk1IAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 03:13:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF5560C6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 03:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7E7D4846F90
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 02:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6843803CE;
	Thu, 22 Jan 2026 02:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KIgsA6gf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="biZ5pFSe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC2837E31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 02:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769047769; cv=none; b=XDMaDpRNSaiYE788ceNvLQNFvJIwNr2fW0adKvPsr/AkzBD+0HjKI9GrPLtFLydpD+Dm6xwVhKfBzx9PytxXMx2PfTI0SZxzLnTpIT0UWsth3QFXzWqsyX7Y4C3/vb91DOm/Bo6mzL0PZ+Ul3DsbTPYLWmlaos8h3/i/LYrCYmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769047769; c=relaxed/simple;
	bh=Oy7z+jq/TjNetJ2Zgz+w8FIQKCJz069QL66/p8AMAm8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P5a2cPPJkrI81tPUYL88zGnzM8k9dEqrU/bgekYKTshrpCZqTkqInHEoPwVWw2+Ei599xJTOk9R6elX2tx3A2NqcPKGGjSGKwMxuYDL/Uv8nJuz4n+VbIfkuaFmln1VD5V/zi/DF/r22oViP6rrXOKBfancikO9twbCAIl7K8c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KIgsA6gf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=biZ5pFSe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LJ1RmY3902080
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 02:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vt0RRfM8pFKfBxD6jKeqJVSWMlwtbL7pwYs+oCiP02U=; b=KIgsA6gf/++GLgnp
	yOzQIrL5u5xTxvm6RuyMuCAtvzKPCIybMa0Ia6ipu38y5fCfcfQaELKBAWTAmsDc
	1TEZDvmNYem/9SdNrZSz+tXTDWqIHqDVdd42FRBr0b3KUHsVG1gjBgG81HXBDz3e
	UifqyGIQxwmbccWNhp7omAwQiunrOPMZf0ME5Gvzgk7z8kmIYsUEf/dZyuePp46V
	EDiPu5QWgvBHtHNiRmGOlH4uq1oK4ew3Agc5DPIEavlcgTGV7xTYeduqHJhoca6F
	eEVIQKWDGlZS9V3MS1jilDMj2t9KZjOawMJjHFX/jvr6Xb4yLxEQ5LfNCifivwNy
	hu4CZA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu4khh1sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 02:09:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a79164b686so4622885ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 18:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769047756; x=1769652556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vt0RRfM8pFKfBxD6jKeqJVSWMlwtbL7pwYs+oCiP02U=;
        b=biZ5pFSejzpNyHAhmxfHLsfzYmj7egpwQutE5jjXop/f+sQG1JezcCzA8Jvr/9oNmW
         V3KdVJ54Fy1GIPkzGjwTKLNfuX/IejICBlmJU3ozlHVkfZMlF9J8hAm7XJeu9r02IF0w
         zU3T5uQwD4tHqhn+FsXXx2pYK2nCSBDfcR0jcq2iYcBFcMOTDSPgBuvRc0DdU0U8b8Jn
         DM8FtonONZ2zqoVgvSV/ynroff6tTKW1YUY2O7ZpnOnik4wyYklcJMD5lgoPlbCy19Qy
         ctLaRea3GxoUClOQ/2K2M8hEKiylujHyxPCYtCjfo11TaP560Uf4VqZsWSfCVj+KMUlD
         DWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769047756; x=1769652556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vt0RRfM8pFKfBxD6jKeqJVSWMlwtbL7pwYs+oCiP02U=;
        b=cuxxLoQhmKBElLVqw+VYc1iMefWFl6FbqbNybQzV1jogN8W3eg6GsakS1xubfrTIRZ
         dSjngVicBhQy0zaR54vBHNsZY0UdgIUVKTs1a/YEad8hbHqr/heP79dYwWb+MlsjAgH1
         ZaD5EdvfOcvOS/iiVu/+foOvtGpr2FzKduGJZwuK3120ksHdMy3c/3ISnbjA6ZqeDBq9
         Q+pgQ9dM+6sM/BGDaIdjpOrnnlosBw13gg6XhkABRS2GiWkMkcb1mtiBD+ZwtZhw3SDX
         QLfTM/KRVIX+BUhAnjkEayM1KeT/U8vddrG2E13Ufk9tZcmBK02U0EPJV22j611U1/wJ
         eQmw==
X-Forwarded-Encrypted: i=1; AJvYcCVzaAHnJQnI0wtqygKRZGqXE6hVFNiZwyI4yFKX+9b66rqc98lSiWWWgsO/0W1wzyofo+ZthRjlGAtubmMg@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5kqqTqD+FAfLN9kJJXsqTL47BcmNfb1O/MmDEp6rKuOut3JL1
	Fnvo984Zr/QevdMeEwpZ09UmRiXVir7lSGwO+XBKyystaQY0xjrx9IpHAmxOycxweBNUn4PisAl
	+OmOnLKWN6E9W9sQWVlxPneXE2Ql4pKe0FK3OGlAMjeZWODCzSuVzX8YB8SQc35GpxmBudhdqHH
	6u
X-Gm-Gg: AZuq6aIdabI99fkrHS9dWY/62544uFBxopKKPTo5RvO1CVR1q5qfi6h6ZruG6hAsmki
	ZyLHHtZfcAdzx8mc8sen6sdEInYShrPl3REDhV/KAeFxkGStPoZUlZmUH7LIi7PSMsW/0Inn/D2
	xTWBkaXbVUh9FJgG9IrNgC8gs1u2+SYZ52poXMZX0tgzp13GgHC+yFaqYKDW3tKav9CpQw99tih
	HwxnDSOSHxALlbRU1Yq24LSoixkUjObifd42r0sWMcjo7R9hi7ts5Av3/BsRE8iNIE6yg+vSaFk
	mVokV1f/1mha3S9rPWpXB9pg4D22mZ1KFn7d3GKmDG6gVkUOZQZaFMx8sLCaQyYp+4k09jt7Bfg
	s5xlzxbHEPkxPpnYwiC7p70YH6QUWbOywnXAX/tov/oxkWYcYtfHlCA1dm58GA3nbyv6fOn8g
X-Received: by 2002:a17:902:ea02:b0:2a2:f0cb:dfa2 with SMTP id d9443c01a7336-2a7698f854bmr65694975ad.13.1769047756514;
        Wed, 21 Jan 2026 18:09:16 -0800 (PST)
X-Received: by 2002:a17:902:ea02:b0:2a2:f0cb:dfa2 with SMTP id d9443c01a7336-2a7698f854bmr65694615ad.13.1769047755874;
        Wed, 21 Jan 2026 18:09:15 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a780a4631csm49710305ad.18.2026.01.21.18.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 18:09:15 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 10:08:20 +0800
Subject: [PATCH v10 7/8] coresight: tmc: integrate byte-cntr's read_ops
 with sysfs file_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-enable-byte-cntr-for-ctcu-v10-7-22978e3c169f@oss.qualcomm.com>
References: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
In-Reply-To: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769047716; l=3605;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Oy7z+jq/TjNetJ2Zgz+w8FIQKCJz069QL66/p8AMAm8=;
 b=zE/jK9UyRQbvKpqffm83KuM46KoAYI0VPJL922Np2j6tW1PMB3kyKxwvTMB133OMVD6OegYk+
 SqkWTifXQahDLNDYnWSxW4vIOOKm8qRn7epsNrqh/MCR7f8AqHpK8iV
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDAxNSBTYWx0ZWRfX+kV/LsamUug/
 U3FYIAaA3WGRC83K8kWiK665ZTc3AGz3GBsamd/+xaN0Tte3u5NcgqyuqJnFWG52IM+Krrf7mv7
 LxYPNnJB4VXZgb3/ucrPy+Hgmg7f8aS4Q+IwuNYa1kSgBqE5JHeQGIFNRxtn6yQDk04nwqabQf8
 1xMgWmhWLyPwlrd719cZeLZdk4EsPqHNouKocAwEpDq+U5gZQ0GVBG6Dr31/5id7DRIwzXO2FUg
 z29IChJJKT8OLGUzSyouKPDLOV/qiyNCMuPlnCDURxRoVYvmPrrjZxZqNp8wL9wEO/zJHyTDfXA
 T6+kxVAwENA4unPiuilTwCvJiINBQ+NG/4tH4PXoj4cvZ89N9utJRvQeLWH+H2dtohSFrGkBwEP
 phqq8UbR0NaSh+gaQQ5V843sP09D5TrvEN7IosQGI5ARc4/2bCge8LEcI5FYQzby7j3X3aNMkCG
 LFGd7qD+Vp/Cu0eBXvg==
X-Proofpoint-ORIG-GUID: 0RFeRwR2BYm7w-qX1ViFI2g9nbwrZ85O
X-Authority-Analysis: v=2.4 cv=UOjQ3Sfy c=1 sm=1 tr=0 ts=697186cd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=i2GxayCjj04of9N-vEoA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 0RFeRwR2BYm7w-qX1ViFI2g9nbwrZ85O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220015
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-90108-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DBF5560C6A
X-Rspamd-Action: no action

Add code logic to invoke byte-cntr's sysfs_read_ops if the byte-cntr
is enabled.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 53 +++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 8b0397a77e57..5e74f33f6a23 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -31,6 +31,7 @@
 
 #include "coresight-priv.h"
 #include "coresight-tmc.h"
+#include "coresight-ctcu.h"
 
 DEFINE_CORESIGHT_DEVLIST(etb_devs, "tmc_etb");
 DEFINE_CORESIGHT_DEVLIST(etf_devs, "tmc_etf");
@@ -228,15 +229,47 @@ static int tmc_prepare_crashdata(struct tmc_drvdata *drvdata)
 	return 0;
 }
 
+/* Return the byte-cntr's sysfs_read_ops if in use */
+static const struct sysfs_read_ops *tmc_get_byte_cntr_sysfs_ops(struct tmc_drvdata *drvdata)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct ctcu_drvdata *ctcu_drvdata;
+	struct coresight_device *helper;
+	int port;
+
+	helper = tmc_etr_get_helper_device(drvdata, CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
+	if (!helper)
+		return NULL;
+
+	port = coresight_get_in_port(drvdata->csdev, helper);
+	if (port < 0)
+		return NULL;
+
+	ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
+	byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
+	if (byte_cntr_data && byte_cntr_data->thresh_val)
+		return ctcu_drvdata->byte_cntr_sysfs_read_ops;
+
+	return NULL;
+}
+
 static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
+	const struct sysfs_read_ops *byte_cntr_sysfs_read_ops;
 	int ret = 0;
 
+	byte_cntr_sysfs_read_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_read_ops) {
+		ret = byte_cntr_sysfs_read_ops->read_prepare(drvdata);
+		goto out;
+	}
+
 	if (drvdata->sysfs_ops)
 		ret = drvdata->sysfs_ops->read_prepare(drvdata);
 	else
 		ret = -EINVAL;
 
+out:
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
 
@@ -245,13 +278,21 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 
 static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
+	const struct sysfs_read_ops *byte_cntr_sysfs_read_ops;
 	int ret = 0;
 
+	byte_cntr_sysfs_read_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_read_ops) {
+		ret = byte_cntr_sysfs_read_ops->read_unprepare(drvdata);
+		goto out;
+	}
+
 	if (drvdata->sysfs_ops)
 		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
 	else
 		ret = -EINVAL;
 
+out:
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
 
@@ -277,6 +318,12 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
+	const struct sysfs_read_ops *byte_cntr_sysfs_read_ops;
+
+	byte_cntr_sysfs_read_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_read_ops)
+		return byte_cntr_sysfs_read_ops->get_trace_data(drvdata, pos, len, bufpp);
+
 	if (drvdata->sysfs_ops)
 		return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 
@@ -300,7 +347,11 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
 		return -EFAULT;
 	}
 
-	*ppos += actual;
+	if (drvdata->reading_node)
+		drvdata->reading_node->pos += actual;
+	else
+		*ppos += actual;
+
 	dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
 
 	return actual;

-- 
2.34.1


