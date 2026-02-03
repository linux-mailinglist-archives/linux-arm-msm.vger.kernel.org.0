Return-Path: <linux-arm-msm+bounces-91584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LjkEBeOgWl/HAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 06:56:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC5AD4DCF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 06:56:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E396430DFB99
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 05:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B08366828;
	Tue,  3 Feb 2026 05:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="En++TTvU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CgzovpqN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE7B226CEB
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 05:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770097927; cv=none; b=qMpF3vdz7oZQypD3hWdgRrO8+AIgeumxzwy+2eShcl+XjXIxcTcRwkPCQrA4afgtSv7nZbG4PbFd24ByLX0aIwCol7yULS1C+W1psNHWW3/HEgbxmmGWYpqa/Z3iis6bfTbzR3gzBKAAjQmQ+6/tvrNG4XL/HaNoQnjbk07e0h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770097927; c=relaxed/simple;
	bh=CwCT5/x9boKhb1Ajkz+foUdUOzmm0/q81QDotkFpGzA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KCyeNP0qt4FsTotaBHZVoZtLre7gKK7VdED19nd7ZvTdKCFhB9d5RN3wW/rJIr5mTu60z4B1f9L44w6BPIpJ7qlpbiaPMthUvTUprtRgFQLcpNJW7BIaOAbLYyNaS0/om/g0j5Lul4WpH8h7Co9oY2eZ2ocg518fm5elThodSfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=En++TTvU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CgzovpqN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612J3n5N2899952
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 05:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	51VyzH5MVWt5pCU+WtqPfgt9gr9jXVE/0KTTZNnKYmU=; b=En++TTvUAIK5TZHQ
	J+sDgDrZmY2qq6ex6kuRa6RApo9SnxG2GekP3G1ttyHiaXDkoeeXtTymcq2GeTEC
	6vurqtAYnx2eVeNyiIM5D5LhXL2/Leni3hhMnRgpCaB1aIoPm0EnsmmflmScYfND
	StkMisUmOHF1lkbrekNKJsv+4pGt7TIYvBb3aNRabaLMrBELzvJ15t7auLL4Uhin
	lgJBKlzgbfOyABwEsyi2ePj+NPOcwo36t8h4TqF0cGL2ZKlT8zM1xNRtp5qxi9lD
	FPneeTXzmQxXWfF8KialDDe08FOZvncl7I8yie/35FOtqQoRduiRVFQews+kNVJu
	XUPL5A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tp0u1km-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 05:52:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0bb1192cbso44008855ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 21:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770097924; x=1770702724; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51VyzH5MVWt5pCU+WtqPfgt9gr9jXVE/0KTTZNnKYmU=;
        b=CgzovpqNi5MArdXDvAshvxh4xdE+GQhP2CogI8rZFPwwQH7yTBV6sphFpWYcXUHLbb
         tmSYtl/4CUk8wemqVjCioMhVpoAlnAv0F+LIZR3txDOY1S2rlcJitFdyVs8oeMAK5+cM
         2zDw6on7ioyR2dTOtsSePxhyxCbXx/n6SXQgSYCawVjLcKxClqIkd6v/gcIyoj2K/1kb
         tHhHlcQt+bxVNsXhNnu9kJ+NLwlyFtQLp3Yk490WopL2vcS/1QFyr+m7Ho6SeOA8imtd
         QPePxZEsDxFV9xah/1lJFjklllIjBG33wSL6XL3859xBxxOUVcHeemLoydTqplQs/k6Z
         ueCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770097924; x=1770702724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=51VyzH5MVWt5pCU+WtqPfgt9gr9jXVE/0KTTZNnKYmU=;
        b=nEvxQCm/N72zk8fO8cHEtr2MmKWj9rpvV2OVRgxI+FSt4dWtu/BX6d7gokeAKJGsmv
         zSwOFphqIEiyDsoOS1Pm0067I3eFbq9c+1Rge0sphobNGKQQXflV7xM89Svxtu9iQjKS
         fm7a5udsvMOmFyKdYyL+jFw4sVsuqxYvtUq4uwtndm6oYTt9ts23Oc10hydV//mL4aOm
         OLSeLxe9AWYlon+gYDvrg38lyKakMn/TCETElOFTpT4nE1afZzlQTIdm/5Vgkdj1WovW
         nVgTjlu2b9lo2dsA48XSLcojLVGMN7nwSz2KxEK8vIhOcOj3GgPFncAAnvwkXuezDwzK
         cKNw==
X-Forwarded-Encrypted: i=1; AJvYcCUFLVexEfZkps4n/44pTQnhm2GyE5KgLNClkdFK3cYUdBN9T8MIg5C391wGR4/lwgD2Yx+RksRZXWtsTsPB@vger.kernel.org
X-Gm-Message-State: AOJu0YwNVOkVeRiefJ7DRxmHfJ5UwfSAlkmARD7gN2OFreKVobsOJDzI
	F3LHTojAjf/0kMbnDd1p3OHWE56f+1R2xYvO4Z+VTarabVTwUeaMz5STw8HvYykn9VdYPAaF5bx
	VliYDR2Tk/ZZBVHMrqarGdG6i2iemUULz5ZHQT/vJZXYZx5VDF6dmCWWPO/84T+Eoi3H76idiVo
	Ke
X-Gm-Gg: AZuq6aKLe92rFmNYjiLURJUDKSch/desYE83UumzJwjL+Oj4KezzjiDe7jedrq1ONOG
	n7n8Hv/JE5PhlPOAElO9UDSvEgWTFMoX6rWwvQj8BNHpFdXsEj7CTk20mvI5Vs/UruP4kfK86NI
	A5Gsfy+w29XKIktOES/7rCpqQj9u/nu/kpfwogbhQDNqEck19MdrI2PWGDfDl21MVMr3e6nB/KZ
	Dhsh3ne4IzxdBI5oOZ3lVEz9kgrq9Skkm8//jcwGqxKFkKZGZ9pAYTKE6VkiZ9HcH/jzE9XBlRi
	U7iq/4b5qLdahAe5GGXRiKr9zIJW1eAbtP8EAxUwmbmVHVfV/5psbUl3IM6X7SlnqXZ2dfCmRex
	kxUZdlhSc9ysDK1BRie80OEr+ghwA53dIm5f0OLaQtW8rjAYdh2F0KGL3oPHVWFkGg3XDKEf3
X-Received: by 2002:a17:902:868d:b0:2a0:9970:13fd with SMTP id d9443c01a7336-2a8d9943c36mr99480795ad.43.1770097923986;
        Mon, 02 Feb 2026 21:52:03 -0800 (PST)
X-Received: by 2002:a17:902:868d:b0:2a0:9970:13fd with SMTP id d9443c01a7336-2a8d9943c36mr99480535ad.43.1770097923508;
        Mon, 02 Feb 2026 21:52:03 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b6e4189sm157424735ad.83.2026.02.02.21.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 21:52:03 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 03 Feb 2026 13:51:19 +0800
Subject: [PATCH v12 3/8] coresight: tmc: Introduce tmc_sysfs_ops to wrap
 sysfs read operations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-enable-byte-cntr-for-ctcu-v12-3-7bf81b86b70e@oss.qualcomm.com>
References: <20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com>
In-Reply-To: <20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770097896; l=5212;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=CwCT5/x9boKhb1Ajkz+foUdUOzmm0/q81QDotkFpGzA=;
 b=kA+GBzzIvXNSvvOWRPmGgpNHQ4tzGkRgViKapki96YY2xM5iV5eA7MLSGbpTQeREnapw2+UDm
 sLP7eOQq/76Cxv3LJb0q7HMP+V2TISsKCLBlFP9H35U2ntJPBaC2O5K
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: kCuyOeZt_G7dVcvFHKBCFk_odmy4Fosr
X-Authority-Analysis: v=2.4 cv=VJ/QXtPX c=1 sm=1 tr=0 ts=69818d05 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA0NCBTYWx0ZWRfX22kGo+e9mFRH
 /74U2Onbx/Ef9R4YOYexo8aSK12xdGcXuqYMQiWCXqCqrra3jEojABCs/eeTZD7jY6B4AfFf7A3
 1G14MowOlMK7enU9Li9CHO5Y6nfPdb0BN3yOX2Eq8C4bjqVR8qd6dcELb71SJBHnmmqmS8WHfSt
 4mp/BzVHivn2vBzYnpGHq/3eFHYT9O2AwStMJ0i/caEPJbZoM0Kd6cyn0vHuQqi+V+hT/9WhEJH
 JF5gZL8k/KKuGA4u5un+2zLbzAPwq/WT2l0P8PlAKwhcpdH7iAwjCcCmvMgyQqwYuF/zKfmNe4C
 ZA4PSGxKV2glqmVl65vdxEE962UxVHY9T/6RmYkSlI0PDu1di8KxkpFjrct1zhckRISWrSA52yi
 FctONnRCR3JKmpDQRywepikYKwN2cbWqnKbbozvssAMvjuOdi3cK+NmK+My6logUjwjoKHlDFKR
 W1yJ2EdQ0LNRDz9YAIg==
X-Proofpoint-GUID: kCuyOeZt_G7dVcvFHKBCFk_odmy4Fosr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030044
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
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91584-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[desc.name:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DEC5AD4DCF
X-Rspamd-Action: no action

Introduce tmc_sysfs_ops as a wrapper, wrap sysfs read operations, for reading
trace data from the TMC buffer.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 51 ++++++++++--------------
 drivers/hwtracing/coresight/coresight-tmc.h      | 15 +++++++
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 1ea255ffa67c..32ca2ec994de 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -232,17 +232,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_prepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_prepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_prepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
@@ -254,17 +247,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_unprepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_unprepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
@@ -291,15 +277,7 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
-	case TMC_CONFIG_TYPE_ETR:
-		return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
-	}
-
-	return -EINVAL;
+	return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 }
 
 static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
@@ -769,6 +747,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
 			"Valid crash tracedata found\n");
 }
 
+static const struct tmc_sysfs_ops etb_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etb,
+	.read_unprepare	= tmc_read_unprepare_etb,
+	.get_trace_data	= tmc_etb_get_sysfs_trace,
+};
+
+static const struct tmc_sysfs_ops etr_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etr,
+	.read_unprepare	= tmc_read_unprepare_etr,
+	.get_trace_data	= tmc_etr_get_sysfs_trace,
+};
+
 static int __tmc_probe(struct device *dev, struct resource *res)
 {
 	int ret = 0;
@@ -828,6 +818,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
 		dev_list = &etb_devs;
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -841,6 +832,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = &etr_devs;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
+		drvdata->sysfs_ops = &etr_sysfs_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
@@ -849,6 +841,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = &etf_devs;
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 9b3c4e6f0a5e..c780f6d5dede 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -258,6 +258,7 @@ struct etr_buf_node {
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
  * @reading_node: Available buffer_node for byte-cntr reading.
+ * @sysfs_ops:	Read operations for sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -290,6 +291,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
 	struct etr_buf_node     *reading_node;
+	const struct tmc_sysfs_ops	*sysfs_ops;
+};
+
+/**
+ * struct tmc_sysfs_ops - read operations for TMC and its helper devices
+ * @read_prepare:	prepare operation.
+ * @read_unprepare:	unprepare operation.
+ * @get_trace_data:	read operation.
+ */
+struct tmc_sysfs_ops {
+	int (*read_prepare)(struct tmc_drvdata *drvdata);
+	int (*read_unprepare)(struct tmc_drvdata *drvdata);
+	ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
+				  size_t len, char **bufpp);
 };
 
 struct etr_buf_operations {

-- 
2.34.1


