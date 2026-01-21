Return-Path: <linux-arm-msm+bounces-90037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JGWNL/wcGk+awAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 16:29:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E19459301
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 16:29:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 99BC1749FAC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 14:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B076A48C8CD;
	Wed, 21 Jan 2026 14:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n1KV9Yc3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HC7Ps2GS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D17948C8D2
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 14:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769005723; cv=none; b=LJeLXSCyQ4/GjlpZUo+lEOJYvzBLZ2Kw7EL8K24jhunvsIhg0qjbvfOTZDUUjRZoUzrqcObOyrP4NIKzg9TrOLIHa21NRa6fEqT4/RnDScNt13WyOw/ESFM84aM3zqbnsQcknKMaCKBjY0Rc/iQFJy1bWe8P+9x8uNRPCEmsQ3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769005723; c=relaxed/simple;
	bh=teAxHbElOznh3VmP5do71pIkKy82z60s95eFARQExj4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SFi9Cuzwua2mpYszVyWymNLrWRLUdbBAOHl3iUrWf/ylyfoyjLLuxcOmWGFoCkuSM2N7QiL/Oc6qNQFSQIDzCAlhsJ6oyUOGnuOtrLsCPKkmjwlsbDEby1vXOs9zah0nGJJPTo5UvP2t0f1MhVQOs4D2uB91dP3ETbOGV3U8KHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n1KV9Yc3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HC7Ps2GS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L9ujmA2840468
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 14:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ln9pfv+G9rZ
	K/+CNAJvHxyEnhRF0Mq08QEYcCVR70Mk=; b=n1KV9Yc3cfg1b6g2CfZQUNt2caF
	LlZ+ufyW4K4+ezzB+badqeYzkQD2jiXb/Hmt/JO+rWLXjhcm20UAhe+4XtKoePFR
	+y9GXnHTyv+zwLivTi10dfJqFgE/Hj4pP1RBty2EqPG1jMDiQ4G+I3mgYH9koLVe
	tQVLtL7bcjxSotn8UDAFkZ7C1/itdoGcHd4JIr/2HUUB/qUpq1n6CXprRSbMSB8o
	41ZwtfphD+q+P8WD+SbbdteGM/Fmio2JHcBN71m6kwYs+GnzzfqpFvJvkhjB1wvV
	MVgZNEU19mpmFSAyu9DQ+a71URSR806pgO74h2IoJUz8RapbmhyTXMjI+OA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btqm1tay8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 14:28:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c53919fbfcso1613216085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 06:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769005720; x=1769610520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ln9pfv+G9rZK/+CNAJvHxyEnhRF0Mq08QEYcCVR70Mk=;
        b=HC7Ps2GS+lEV1eJ8K56wNpzXqn/9yWmdhF9PzlUzSRgaDUbUaIwefNZTan8X4jaxzV
         MTdAoyPgake4RJmF6y8ZcQiKrvGX9kqb2YMlz2uPaGeEz3Esys3ZMbwMwcQTzIKp1tA9
         EWE33ZlVUjptfmiqz0JFsK50M8IZJu7/6KJJaYxISQpPkBNfThMW5zMxJPrFkKpzH7Zk
         rmhxvX17cnX4Zonb9NCQ3IAaCavTkq3MgfluxseLjk8LDU4kz7VP45BF3UV44spiGBCF
         U5mAmlZb2V6WRpkUE1QkgQ6lfA2CPYcXI2wddDiTU4qjf7M3ZZA8QahuH1qpKR277vfD
         Z0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769005720; x=1769610520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ln9pfv+G9rZK/+CNAJvHxyEnhRF0Mq08QEYcCVR70Mk=;
        b=hCjGs2Cqz1yLgwdH15Hkpj3Ze1j6CorIX2o+aIcCqio1ZWx3rvanSGVeaWc56uOcS3
         bpkmk8d7/vd4C41oCZZLzkOyRnWyvdrYkjNA6UTnMbmnER9nkfn0388MXnEhPN2JEYfI
         K22uTbm1iS/y3zJSKo/LZTrB3hWAysMFxjkMy8v0vdI2luB10V3EA1DszoaH0/CqFAS6
         1I7zDeCLKS/B+6OFDEJcMA0IdMIleS+rHbp/mlWimfT4TWevTGMIMi2w29slLnUnHqfh
         bmFdZX17mlBjaZYR+mRAJlXqWpuul8fagixwMc85s2Vs7HHMhcQbs3bvuiIIIpOnnvk0
         mO/Q==
X-Gm-Message-State: AOJu0Yw/FQa3vdbt8fYAlU8tXb5ROElNaMKGPY8JiDZZNrtAChfIliGt
	gWnv4wuHkLvmxQhcUQioJ8oNq4sYFnBRxN+TJ42FC7Sv/lX3rtaXYOr/6qJzhPBn5Gu2ok93bLa
	mgcugqQxpudcPtH8U8bxPEYRaxE4Xkv7nHTXY77FUD7ZpAerOP6dsnHDE7KzR/qQS9JlL
X-Gm-Gg: AZuq6aI2HRAQK85T3KSsnl2dc4AVeTWyVao79+tWvDVW0ixTWPEkVl+ma4eEKVA8ZFJ
	AuUUqU6aKhRO6HO2KVLw/XAy3T2qMQrUFo13ej1xlW0pRrb2bxkXHJlSkEX3ANS+sq/wxPdNlXj
	4GFIuqN/G53AKTMIXnVJG03opnFe9pyrosBXs48xYScGPU/fpCtMZOJ2LQUonKW0wFNJ4krVJYp
	EK7CHzTzQZyVVjeLiez7x/Xc7mNus3IsLwsfKVs/feD4H0kgjXK5uFCpOPAc6b4ulQxcDwJJ9RI
	eDoQZdSSbole+EIv9OwPL6LZoajkVZ+OhNjFJ39Q1NqVqxQgh/NXaKqWw90fj8ELfqRaCVt8gFm
	Bv8UulBkCtb6UeHZHoy4ox4tK/2DTPLd+X4krM7NMQgYA3HZFFrUJuucqqqDPipOgtibe/sS7UZ
	l+b9oI
X-Received: by 2002:a05:620a:3942:b0:8b2:f9ac:a88b with SMTP id af79cd13be357-8c6a66e453amr2432299985a.21.1769005720365;
        Wed, 21 Jan 2026 06:28:40 -0800 (PST)
X-Received: by 2002:a05:620a:3942:b0:8b2:f9ac:a88b with SMTP id af79cd13be357-8c6a66e453amr2432297185a.21.1769005719892;
        Wed, 21 Jan 2026 06:28:39 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a0d:3344:10b3:c488:b09f:b54c:1120:95f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435996540cesm6098180f8f.43.2026.01.21.06.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 06:28:39 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: vkoul@kernel.org, kishon@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 3/6] phy: qcom: qmp-usbc: Prevent unnecessary PM runtime suspend at boot
Date: Wed, 21 Jan 2026 15:28:24 +0100
Message-Id: <20260121142827.2583-4-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260121142827.2583-1-loic.poulain@oss.qualcomm.com>
References: <20260121142827.2583-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEyMiBTYWx0ZWRfX0INz7Vh/1D2F
 f9MI+8uNXNPLBIANK13u6RW5SeoQO0r2eCnyob6p4qXlTVR6Hud0PCU03TmWceL+5ZyqCtDblIJ
 dOH3YXzj+hcTFTui0RDIVwvaFTPAbId8g4Fs1tPtGndmGbKaZ+5qcfrAuL7U7onpIwXbV0zsnTj
 bu79UKdJEFE20BeUrjCBvEDFjuMo0ZUqWlokPB4gwhgeBsb4vn8DGxsdomo7buVv3JIWyO56Yu/
 rVmYxSgtFFEC/D/eGyPSDYhxkqTQNafhF31ZA540hpraiK5UvkXf5QRsyndBDPN+LaeRPrVK+8e
 qrkS5nRrW1+y7LScVwqGwQNWEu4n+aIgW/RQDEi3qyg/+qilRL3I8HsPuorzkec9Zq36kEJ+QdO
 ZLXvTEzlwEkLfrZjs3AEDspGEOIC+qxvyvXxclwpc98U5ZlOcWdCyfxZKXXW38561snz6M3bj6+
 WmKutpOAa/GpK8MmoZQ==
X-Proofpoint-ORIG-GUID: vqveEzvufCxPNp8JwO_x9BUAKRxy8ePh
X-Authority-Analysis: v=2.4 cv=dtnWylg4 c=1 sm=1 tr=0 ts=6970e299 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=FmOiMsbJW-36OGxlXE4A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: vqveEzvufCxPNp8JwO_x9BUAKRxy8ePh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210122
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90037-lists,linux-arm-msm=lfdr.de];
	R_SPF_SOFTFAIL(0.00)[~all];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7E19459301
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There is a small window where the device can suspend after
pm_runtime_enable() and before pm_runtime_forbid(), causing an
unnecessary suspend/resume cycle while the PHY is not yet registered.

Move pm_runtime_forbid() before pm_runtime_enable() to eliminate
this race.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index edfaa14db967..05717ca85c5b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -1083,15 +1083,15 @@ static int qmp_usbc_probe(struct platform_device *pdev)
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
 
 	ret = phy_pipe_clk_register(qmp, np);
 	if (ret)
-- 
2.34.1


