Return-Path: <linux-arm-msm+bounces-105258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LLAOQE78mmgpAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 19:08:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B28497FDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 19:08:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 401CE311347C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162A83FE377;
	Wed, 29 Apr 2026 17:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QL3WfiV4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DxbCveNP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5003F41324F
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 17:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777482123; cv=none; b=DueBZifWrjaxUv5Jd4KxCJ+hKg+luxL4CJd3NeF2jICRIyRiNW2VhfdnKo4IiT+X8yOg9UnSYsGiJBcIhG11HuEEzxVfTv20lBKbMihKBXxF2vyFP5hFpTg7R3Sx8GTV7HxDYjVjWrALkxnF+mlkad7PFNQ7i70YP/pQsvaactU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777482123; c=relaxed/simple;
	bh=jFRNIsAAfyAug5VRjXEXqFLZUcaJoNigQqeYCKQMUe0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QRDBF529Kmi9SDhi/xZusxuZwKTaGWvdCdcVXX2uol6eN3faN+FjQRUnls2W4QEEhBwHZOSjaYR0vdXVyfawABXjKTni8Z/9s+TJS1tacOKI87M+DgKWpCQgjsN/rKJMATS0j7KQB/5/u7EgdVefhUt7Qjbl9MCy4lJbOWWDSwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QL3WfiV4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DxbCveNP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TFTjuX1641981
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 17:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ajOkDbyqj2nICqoGPG637xYt2lDMFeRBdsFcCgJXb4E=; b=QL3WfiV4EO4cJUd5
	WIH01uUT7U1QAeTTCjDhjhGFEGFl0By930BnDXOj5TwDSwFQS5FTFchtmlaYpFSt
	sHDSCY5Ad4gtn/C/15TXs4W/VS+/sH3VQqzUDkdiJLRYVgCaDmlcYvXkkLGboy6y
	LoDd1DD2Q/4gxmkT+/GXJftzctI71drI/xvNJqw8v8QywvEWSn7sUNmDejWASzWd
	Na2Ay+Timt6dLxhicdCRCODYUCy3+FYkPyrenCGT1UK4F6V9lVmdsHQYPXnujGoG
	GK9bFrQ9SvnlP08VQEJW5iy8doNeTsl5p4HbhfWL4kt4tMcOumeQp073LXMWviJY
	d08yWQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj82mj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 17:01:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2e06219cbso51465ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 10:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777482115; x=1778086915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajOkDbyqj2nICqoGPG637xYt2lDMFeRBdsFcCgJXb4E=;
        b=DxbCveNPWRhFWYMVFEHT0vEAB3Gq1VxioPKJgZpmxC9jP3mlfPpCdHTDfL4V9veMkz
         FGROVGab+FeitlkVufbeR9NeCT28jZfBbGI1jMEgyXo6yLrEce/VFQiWC+r1yP63Z7ct
         /EmMCJbiqUt8IwftzpALwwxZE93H+nZYU93WGs9nLcJj6wzhc9D+UtEm2apbpPQktSJ2
         bWnf0b+LnacxVVpzpk+JIhnL4+x9OFGCEhsa57jmNV+qoQq45hSL+gJI36ZOsoXQuoVd
         njRmqtDWKwI5zpfF/pJjNNo3xI+aSC9j9QQ7REqHf7u37ZM24swaUXPCG4XX/9oX0WIC
         uNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482115; x=1778086915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ajOkDbyqj2nICqoGPG637xYt2lDMFeRBdsFcCgJXb4E=;
        b=IHHEfR82zrt8vQe4xpmLEgpjAKv2qQC12UnGyojz0I93ilSMgjy/hbw4eMBPseGTuv
         Msc8RzKp2MiSkytmhRNNAGE6AKlWDV6JJY5/zM/QiQ8JXzcShNyuelIXFuQFlstorPSR
         uUajmRFk456egPTYumigJdNmnF0FqYHFAKRPvUj8/KMcc48aqEIoGYdLzwYolLTC/dc+
         UTddazqGIrbonK7ISMUYafuG9k64mEc3bKPGdp6wzx3Key9KUYP1hltxGLPe1Wzc8q+Z
         WBT4I55HCHTaTH4yy1/bwg//w42jYmWlDr8dEvTphKGvPtpxWTCD9bJF297qo9qCQsxI
         nJqg==
X-Gm-Message-State: AOJu0YyUWAsmx3h/Q/p49M3G3jgWif6hldrcAgw9WAoBRhVE9YXK6Rj9
	1VH85HaQBp5FQqYenbCjzdtIhfqivbkNss5I/yRtYqxUXKGxCbW5vp2cV/7nVLH8ImRKfVn6aWi
	GPTg5RRs7oA9IYtK3Pup2ZtCx5yilNNJ8vMqe1U5Zrmjhk1CAZ8FBfLfKnYEtSraY30tt
X-Gm-Gg: AeBDieu3UBLTENkXiwYFJjzCfJLby+9dOKNFLJbkIOoI6IomNGbZdQpswPT9bMPFUNT
	eueX4kv4yK16ORN+iZloL1UpJaLawnrAigm5V47YRdxE5QPyTX13LL9bnuSbmjF3LjgHXkUJlj/
	gnb7Ue0VkOHHuiHzeBeSdfW7uFu8Pxy3tDwi45vwtx8K84VettiBXbD55GfqtMpG2h6Q4ezHoLx
	14wqk8YaBcLcfzvkqHjIMyQI7Lc9jmxkXUBKe4FuLtetGYuKP3rDaqj3q7w5KY0Jm9YY8i3NccL
	/fi/WUbfkZoum7zt5b9LJE7ksIUL1cldWIHPlu/xrr2Gu28anATx+ugjlNuJ5IALZ4pmcOKP+HN
	k1lsP1l4tbIUMi4NqFgARrbpiGXOoKBRsTkKajhN+/ZELUP0hxCfqmc9EFPQsOgOItKuK
X-Received: by 2002:a17:903:b47:b0:2b2:481b:de68 with SMTP id d9443c01a7336-2b98746e3c7mr42278995ad.35.1777482114893;
        Wed, 29 Apr 2026 10:01:54 -0700 (PDT)
X-Received: by 2002:a17:903:b47:b0:2b2:481b:de68 with SMTP id d9443c01a7336-2b98746e3c7mr42278615ad.35.1777482114300;
        Wed, 29 Apr 2026 10:01:54 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9887853a2sm29530195ad.18.2026.04.29.10.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:01:53 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 22:31:37 +0530
Subject: [PATCH v5 2/7] spi: spi-qcom-qspi: Fix incomplete error handling
 in runtime PM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-spi-nor-v5-2-993016c9711e@oss.qualcomm.com>
References: <20260429-spi-nor-v5-0-993016c9711e@oss.qualcomm.com>
In-Reply-To: <20260429-spi-nor-v5-0-993016c9711e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777482100; l=3312;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=jFRNIsAAfyAug5VRjXEXqFLZUcaJoNigQqeYCKQMUe0=;
 b=e9pk922tgW72Aghv532bXlAF/epcSjxC2XCRXTAJ/nCdJzBC4NQ80gqS58gm53FiOPp0iar1s
 vnvki9gxMtbDhRsCId6Q8iCu7gl+nuE93r3BbjxbUxH5C6JKlU58N9j
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-ORIG-GUID: Lxp9af0jFIXtBAwTS5mVKtDxmIutv9Di
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f23984 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=GfYcMVghsOmS6C78lsIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Lxp9af0jFIXtBAwTS5mVKtDxmIutv9Di
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE3MSBTYWx0ZWRfX8SvO0hWRrtT9
 KknAzOk11tKPNu5quLNn2iT+7Cm652PnJS92NbXpEHDXnftOTQtJcinXES+PrPj8fdA2FIVO/aA
 i/C3eHs4u9gwZKQcHRrGZ9GBj/Te0Sw4iDfbytskCjW+gRhYTBzByICrjqduM+Tq7bh6jjIR2gN
 SJ7R8gaMP2hwERnUDRrvywE6akvHQZE+q1zZcT5GfOCTsGZewYyOIcZAauFOPi5siTrzpLxXHyq
 i2eO2yCwA+86P8Vg9hc/D2Z6kd/j09Qiv+G8cRFF2wTgwBI3h+YJ2qvmfAPyeQJW+rLSv/7gVG4
 BVCNmOpX6iloSaUnZJMvmKJBlJJCCVi1Tg1BSgC539XWRhUAAbp9wwOovv8lmVJQcYJA7njLvSV
 5rSfS4yg/cr/qGaHUicJd9h6MV7Zn6Jov7M9mDwE7wADLbM8+7yhoEXORVevO/oh287+111JoQj
 fUJMTbQiBT6ihLsg4tA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290171
X-Rspamd-Queue-Id: 70B28497FDC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-105258-lists,linux-arm-msm=lfdr.de];
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

The runtime PM functions had incomplete error handling that could leave the
system in an inconsistent state. If any operation failed midway through
suspend or resume, some resources would be left in the wrong state while
others were already changed, leading to potential clock/power imbalances.

Reorder the suspend/resume sequences to avoid brownout risk by ensuring the
performance state is set appropriately before clocks are enabled and clocks
are disabled before dropping the performance state.

Fix by adding proper error checking for all operations and using goto-based
cleanup to ensure all successfully acquired resources are properly released
on any error.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 drivers/spi/spi-qcom-qspi.c | 44 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
index 7e39038160e0..edfbf0b5d1fa 100644
--- a/drivers/spi/spi-qcom-qspi.c
+++ b/drivers/spi/spi-qcom-qspi.c
@@ -818,20 +818,34 @@ static int __maybe_unused qcom_qspi_runtime_suspend(struct device *dev)
 	struct qcom_qspi *ctrl = spi_controller_get_devdata(host);
 	int ret;
 
-	/* Drop the performance state vote */
-	dev_pm_opp_set_rate(dev, 0);
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
+
+	/* Drop the performance state vote */
+	ret = dev_pm_opp_set_rate(dev, 0);
+	if (ret)
+		goto err_select_default_state;
 
 	return 0;
+
+err_select_default_state:
+	pinctrl_pm_select_default_state(dev);
+err_enable_icc:
+	icc_enable(ctrl->icc_path_cpu_to_qspi);
+err_enable_clk:
+	if (clk_bulk_prepare_enable(QSPI_NUM_CLKS, ctrl->clks))
+		dev_err_ratelimited(ctrl->dev, "Failed to re-enable clocks\n");
+	return ret;
 }
 
 static int __maybe_unused qcom_qspi_runtime_resume(struct device *dev)
@@ -840,20 +854,34 @@ static int __maybe_unused qcom_qspi_runtime_resume(struct device *dev)
 	struct qcom_qspi *ctrl = spi_controller_get_devdata(host);
 	int ret;
 
-	pinctrl_pm_select_default_state(dev);
+	ret = dev_pm_opp_set_rate(dev, ctrl->last_speed * 4);
+	if (ret)
+		return ret;
+
+	ret = pinctrl_pm_select_default_state(dev);
+	if (ret)
+		goto err_opp_set_rate_zero;
 
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
+	return 0;
+
+err_disable_icc:
+	icc_disable(ctrl->icc_path_cpu_to_qspi);
+err_select_sleep_state:
+	pinctrl_pm_select_sleep_state(dev);
+err_opp_set_rate_zero:
+	dev_pm_opp_set_rate(dev, 0);
+	return ret;
 }
 
 static int __maybe_unused qcom_qspi_suspend(struct device *dev)

-- 
2.34.1


