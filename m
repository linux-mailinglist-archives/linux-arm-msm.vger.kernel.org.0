Return-Path: <linux-arm-msm+bounces-91943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AO/PBNrAhGnG4wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 17:10:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C374F5008
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 17:10:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 366DB3051D27
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 16:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29F042EED3;
	Thu,  5 Feb 2026 16:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aHANCioO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TuKYM4uR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5A5428841
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 16:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770307382; cv=none; b=EhtB4qkX/fkLLeSrBhasqyLhVV0waCJleUbIUYlucsndwKFXBgy9VK7wt7NS1URLRTeZNhcdH/9UFECv5+3lQqI/sH5qcrn0Gp/hpJE7lqfgpfrFyKxk+TKntrkOlqNuQHMz5mxRA8jeURjFAxEN1o7sJn6/zRHk2ow/e31VBj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770307382; c=relaxed/simple;
	bh=OZ1fF/5EofYExMyjWTm4qdd11HBw10CtrT0zf/G32nU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UzZ6WGEgM8zkjDEoPnccI6jINdJpJGqIzPsgb6Xl6UKmIUbHiHKAQx4+LiBHEBWPCrcE6k0B9zj5grSb2O9bAxcniLQb4AD9+d4UWRYcWGCCBMpu3xElzftAPx/CupHzbVRGctW/VOBZFB49OFv6h0onoVrvRXnl9xl/ELZXexQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aHANCioO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TuKYM4uR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615CijDA3047932
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 16:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ybqu1gqc5/l
	jFP6p80WyL1AxbJVtoUP4uuAxu/GgF0c=; b=aHANCioORxJyevwEaqBkxi4QBUi
	0h+rAMlUPSCZf9a5ns0CdX5LvAS09naffUNpJDMBhJq1wG6DfSkeupi4tc7+1eEG
	oMnBhGu6CAY00MSjIXa8wQXx3g8dtX4pM8nXIfuWaip2iqH8GJ711vtxciCi4WGl
	DkNMj6yKzZHT3c7fysnR3NRCLzLT7p1MtdLqWIk+pVuNp1iM668VAiIFBDuJTyRH
	SXGrMNlqER9tbZYaYtRRCna82Ic1gtuv0bHWghOZXRLgtb9rRty4s+utrW2D6mhh
	ktR08h29FxkFYinQBqzUtvfi9zouDx4dZ/5f+kRxzINgR9Bsn2DGk19JkBA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4mrthyp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 16:02:56 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-45e76684274so3590769b6e.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 08:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770307375; x=1770912175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybqu1gqc5/ljFP6p80WyL1AxbJVtoUP4uuAxu/GgF0c=;
        b=TuKYM4uRhKFzBqaiRMUrAZFDONIb3G+1dnz00gU/RNG0qJlF84qC/J2jBYtLL9n8w6
         Dk33EDbumr4B2nLS10cNS4skSeoIoNmUw5Fwwb9ZY41WWSgytEdAOlwHe7kLU4l6N8Xr
         3Nm3f7ivQuDbhTFrj2eG5k4Ea8CPhFHFlGtMDjbgTj+9eRzn3Vlkz/0REY4o1DWzZmxp
         OJllX1lUwMJbtg7a0jB+7zBBPrwbArsVdX1lBQgi4uWJh58vxy1/IFKVDT1Dsyal3IfW
         KkWXF94WxMUnWch3itY5rpdnsTV+MV723Gn7klj2NkrSAFSybCNwau3C4zGHCu/WS0fL
         iSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770307375; x=1770912175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ybqu1gqc5/ljFP6p80WyL1AxbJVtoUP4uuAxu/GgF0c=;
        b=h4Ky7a+Ko1V9t1qudGEjfxIH2oQ0uWd9a2bof49qbmieozPk60KqcodSSC57TrNIKS
         xXY901SJQV85WmOlhqJoW2WpgGEA5xPz8WWfm63S96TTMqH6mbbgBp9ThlEotsVxQozV
         7AHgDXbLj/4mez24QqZ3h15zXN4g8V+O8ICZRamYNYVUyneqhWK6i+OOVEPSxLObaHUi
         CiEJcaY2TwmcQGf2sXYArfbmJTs+LM6AHsWhpEydS1Xz7+D+MAgddR+yV4clGfCP/F1C
         0DblyEzsvyPb7VoWeGUcpQMsQxYsw4/7geNj7WU8ks5FYxAW739nK751WdPzjhG9rBaR
         EuHw==
X-Gm-Message-State: AOJu0YyKqtzHd+aJ9SzV4Eip6CWnKujvsBGGJKERE5745oil6A+xV3mX
	zrECN7cIhtZpuK7QbQn7RLxfIPFbOQ32556S5Qen7MtieR54jzZgflpPPujbFOOq8U/snY5DeBj
	p5y3PYCQlVr/ZIi8mYPJxgxlCS5cvZP/fw4Srwz9aIhXGotDFPKPnUfwK2/bq+dZQgrVs
X-Gm-Gg: AZuq6aJ2oPxcpynI2/x23h12g0fhTxqxQ08xvZVG1aKpCYyxj+4Rc/kNSwHWeGbRbhT
	I2kSr5yoidsDqJzfxVhiYrE5opqX/kIRu72Ua0kaJTAGsRZ/vMKxlfOvTKMDT2W+lnAi1g6eydY
	KPU015KyjWHpKu0swiMz8hgCFXbqFuH0xICysDBz0VZ/AMn9mtIXj/htSKaCgp7RH5W2HmKjWYy
	CIRgi3dR4iuLkCsE3QcJn9P3Il4wD3D9uYLns0E+lwjYoNBTz8G5AsJrBIoHXyP4/lpNeWSkagp
	0ktYtdLifQ9sBoHfJm52jpS72WfXy5Vgz8YKYylqbN4HzeaqSogbOa0YKc9XNreE60AC7ZCwHUF
	8ATiqjYJyUOo1l/6zzvf4WIryhAoqtakijAlRUxGZf+xk0VN9X6D8+Lv35aeNYXVtfF2aqlMcwR
	HI
X-Received: by 2002:a05:6808:150e:b0:451:4da2:47d1 with SMTP id 5614622812f47-462d5a04d16mr4101010b6e.45.1770307373644;
        Thu, 05 Feb 2026 08:02:53 -0800 (PST)
X-Received: by 2002:a05:6808:150e:b0:451:4da2:47d1 with SMTP id 5614622812f47-462d5a04d16mr4100689b6e.45.1770307370662;
        Thu, 05 Feb 2026 08:02:50 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:103a:9c65:ad2d:82fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436180640e5sm13770002f8f.40.2026.02.05.08.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 08:02:48 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: vkoul@kernel.org, kishon@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 1/5] phy: qcom: qmp-combo: Prevent unnecessary PM runtime suspend at boot
Date: Thu,  5 Feb 2026 17:02:36 +0100
Message-Id: <20260205160240.748371-2-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260205160240.748371-1-loic.poulain@oss.qualcomm.com>
References: <20260205160240.748371-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEyMCBTYWx0ZWRfXwmQTYmjn6ugP
 TnURNSYwDhk6gHSZopiRyBy7sgADt3+smjFc14+7037xWHTSMO7eyGD8XPYPNnoFaZn66OdFTrE
 aZuwt6QWcLJ4VXotzmXUIAciSlB3wNstRL+caJbi9xc/X0MJcwdG8P8jeDPtpGs3mQLO/OFzHMt
 sdQtPk2ebq9NEgzHVChuHlV8frOSW8c0JpLfey3OckfoV2gl1w94CmtDR++lUNLmKYnM+51XBjm
 HS/8aIt3sT9mgLV7wuz7y/Z5/gmhHxQ2k1lTqDXo6kVwJRG371urFBqXbT4apBbE8bTGf/y4DKA
 y3i6oVR6lZAVekJ71/TKODJE+DMvqe6zR0olHJFtXnj1JZVUwrwZfC8mQ3ONtvBDU0uoSRuBDEv
 RE5xsWj32Ck8GR/+jPugijZ/cUcZkmu57wR0zkvPn+bFFNWlhzSL2L+utZgL0lbbR1Lgd86V4Ze
 NHY1EdkL+K6WJrXu+2w==
X-Proofpoint-ORIG-GUID: 06PIXqRi5r1LBZ_QszQU1DgrwuAyATyk
X-Authority-Analysis: v=2.4 cv=UoBu9uwB c=1 sm=1 tr=0 ts=6984bf35 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=FmOiMsbJW-36OGxlXE4A:9 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: 06PIXqRi5r1LBZ_QszQU1DgrwuAyATyk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_03,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050120
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91943-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9C374F5008
X-Rspamd-Action: no action

There is a small window where the device can suspend after
pm_runtime_enable() and before pm_runtime_forbid(), causing an
unnecessary suspend/resume cycle while the PHY is not yet registered.

Move pm_runtime_forbid() before pm_runtime_enable() to eliminate
this race.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 93f1aa10d400..c3661872bb7a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -4932,15 +4932,15 @@ static int qmp_combo_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
+	/*
+	 * Enable runtime PM support, but forbid it by default.
+	 * Users can allow it again via the power/control attribute in sysfs.
+	 */
 	pm_runtime_set_active(dev);
+	pm_runtime_forbid(dev);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		goto err_node_put;
-	/*
-	 * Prevent runtime pm from being ON by default. Users can enable
-	 * it using power/control in sysfs.
-	 */
-	pm_runtime_forbid(dev);
 
 	ret = qmp_combo_register_clocks(qmp, usb_np, dp_np);
 	if (ret)
-- 
2.34.1


