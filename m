Return-Path: <linux-arm-msm+bounces-97377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKQVMdrSs2l5bQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:03:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE2D28025C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:03:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C74043018E2E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF8A38910A;
	Fri, 13 Mar 2026 09:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p0TDtLkT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iDmYBfrX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629623890F3
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773392576; cv=none; b=ItCXGU5nBLr544bghLppBaf9Fye66Ed36jyn0QkG+cSqzIKCL9ZP9Zu7TbqqTJh8Ly2o7I9Ncp6MJoYOED6rta434RM96IQ696cfZl0pE5jkvF8SysZwJOFyz3ce2b+hrbFJRpPLD5aF1M7+3mXJVYWyP8bDHj7nmwr/Tg1kzu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773392576; c=relaxed/simple;
	bh=nC4Owf4MXjBHiFj34VEuBfBkJjEC2Xd5I2Sevk5UnH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eaRwMSJXAismRlm6mDQEedALT5K+ZvxD3phEFYe4LRJdxCWA6OAjEhl0ka9r4lUduJRNZZ7MYHISf851IDgdPhqCjyVV0wGK27Z+s/w8RwRC0v4xzG/Vv4UGMo3K8VSrnqTairSiYtJ0KvJDRp4LLXsmTiIlV6LkmhCf3op/s9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p0TDtLkT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iDmYBfrX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7JLJM237704
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L48WYHJuhhkO9dFp26TAm1fpnJhYIgGr7XXmW7vKLpc=; b=p0TDtLkTPv3bP2+K
	76YjEI1hQq1paFdfLoK5BaWrKQUr5vNoltpAW2sJyXJXn1hc430mPyRk2He1zifa
	Lw/VAXOITvm27EB8SzltmyC9fZdEGyPzFFMRHWBbU70ULyH5ES9T3OwmmCQf4edg
	tc5d8yE6A7LL+4ASrl53OXsQ1eF+k7+7dpkxRFxurrIQ6y5rRG4e2wdT3e23ltkG
	g+OOKGIvSjklQRAFen4QL1jGjKc3rLtRhEgmpImS7noZaUsPjYqaFM6oNH4xHusT
	ZfUOqlwBaid3JFMHZqPacT6n5Rav+FpEvtESIW5utWA1bkZabqvMdRVul+YOwErF
	vOQFEg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cve3d8cby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:02:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35641c14663so2213935a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 02:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773392573; x=1773997373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L48WYHJuhhkO9dFp26TAm1fpnJhYIgGr7XXmW7vKLpc=;
        b=iDmYBfrXTmXBrAmygut2wfp7o6IfS4dYPVOsTjOva21GRikdPpoeESf/rRD70MLkCu
         2MPyHXO8l/yern6Q9l+keCHsCDBUqKnCoTKxHr6CIwapacpqacMlybHUEDlRkDzJE9y4
         9VYXFzooz+AvswRGW9QR5wRNZMngzf3RxHYhcTcW6kewqt1CVYd8gujBMQq6O+mxxfpY
         Vm0hWJoGgrce89zwfx/l79h3gEQq4dEjC63V1woBhMYD3dNrZXaBEmfbOvQRAE6z1mXC
         BXLV5/+i2r7wBi5oZ8HsqfY9Fl2Cr5djmZjOszln2etIyFQyrN0JZ7OYNxm+AtSqtfW1
         ctcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773392573; x=1773997373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L48WYHJuhhkO9dFp26TAm1fpnJhYIgGr7XXmW7vKLpc=;
        b=YP2YDJ1AwFslZ/Ecqk2jfudVp3iLjziXieRP3vRjXYqnkLeZhuE1xRuTt805tWVK2o
         2PEUebq5PkB6k3gN+xy3/P1R1IsXi/h7OglU9jucdPQyt/sy6BxCzcJYMe4imLALvugi
         rzqBUNDUrYO530ao4q8+Cnyy/yY4Ev+AWlAOBteMU9cH2+qMMd5dWmGJvz/L2zd0Qq3k
         RaBdGx9LJQO303rMTmKozAHGcmSVyK0wp3poMQdL2VNywCsZb7f0p1nENhflwz/LHPgN
         NzoccKAps9+9ksEljtKssvXkNYrNM4zQ/0GNLZ/7TJm5CfZO3JzIji+DAZZF/LcItBS9
         W6GQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoysi6uMrsYElzzz68nh25fQPGktypJLGWRUb3zf6BVVzELmJUKIkKMqGVw2iMtqV6B1HSSRleuHfBrnoJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwqyfG0QFkBPN718HzBqB+adDCdMIXzX6lQBinv/BoQL9AJbDlE
	2tquaSXiy7xsNvCgLUBOmRaUi6ObGTnKvUdvRc1rnu187vy+fs+RRsZdOP5u3mQRssQX+2j/b9y
	6OMikrSwPo4Y7pJzA2bSw+sFkdKpXIZuD0xHvh17h14AQdBa23eg0esaPf02EHgj81lqg
X-Gm-Gg: ATEYQzwfWskBGs0DsapuauaV8xMMZO1R4Hv38wMBIC28XYL1pmeUjQHCe8nEo+hHwYe
	6T3GAiSRoXCIYAGy4Ug89jq3Tz6Olmu4CmjmoM1xHpDnZXWGmTX8pnVRa5tBrZ4pf5hqWhI9XhT
	yCa99zGsjsIFLllCHUGT+N7kfPVGvVj/+qZeZ0NMLM+ZseyGnDrIE8Xr/hRTRaOW80BXshUm0Wj
	2tHFPUA0JPFCupiuGWTQdIq00BQOXjd8k0KMWFbjOScLoPlAuHvgpHTCr5dvSK9eD5uQKv3RyJu
	nSe+hQdsC2wbYpqEsbonce7XYQhbnukS/+jUIUbgxAV3qFvoQW+JjaiyBpkNXpiOuD5RCdNvZj9
	X0hZYOWk81d4HL+SeMd2/qKR/dNojU9MZ8+FgXsJQn7AWrtkXOc1W/Y8YhIdtMZ6m7zGATF9SuG
	D7OHT+MZmI
X-Received: by 2002:a17:90b:384b:b0:352:d59a:b28 with SMTP id 98e67ed59e1d1-35a21fbe2c3mr2369890a91.19.1773392572619;
        Fri, 13 Mar 2026 02:02:52 -0700 (PDT)
X-Received: by 2002:a17:90b:384b:b0:352:d59a:b28 with SMTP id 98e67ed59e1d1-35a21fbe2c3mr2369870a91.19.1773392572168;
        Fri, 13 Mar 2026 02:02:52 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73ebb9ed44sm1269275a12.34.2026.03.13.02.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 02:02:51 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 17:02:06 +0800
Subject: [PATCH v15 3/7] coresight: tmc: introduce tmc_sysfs_ops to wrap
 sysfs read operations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-enable-byte-cntr-for-ctcu-v15-3-1777f14ed319@oss.qualcomm.com>
References: <20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com>
In-Reply-To: <20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773392552; l=5200;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=nC4Owf4MXjBHiFj34VEuBfBkJjEC2Xd5I2Sevk5UnH8=;
 b=680OzAf8qsYE3RuttmLZm/HyPOQNsaUyipptyvNuG8EgqR378XZux5Ew4oPnbHNclrPBXigg9
 G4oKQ3bhfgcAefhUXOs3izzV5FOz5ZSQYI/UJMsU5Kh+DhGyugys6lP
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: S2ClPFzuMEwNoSBe6TpRIYI2V_iVhSrH
X-Authority-Analysis: v=2.4 cv=FLwWBuos c=1 sm=1 tr=0 ts=69b3d2bd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA2OSBTYWx0ZWRfX437gfzRKN1Wq
 JOmxa9Oo1NbcPOdlQ/Gzleo2Ux9xpnFXMn/6qJPO4mkBBWZ5MHkl+hjGFvKsf2HSzYLRoRe9FX6
 BV/3siACsZ66QK5dRn3YPwSrGTKm10hC/TfP2FMxTvX4+dz3R4hPy7hdItegfCrX8UzdG2OAAb5
 Z+qkv82Ij1dyeIT9P/2QKrQbHTeLBOQ/v3+N37htOgDF3DOzpr0oh9T3tfu5EOGuZaaOpm5Mjl4
 6cbUepy5H2o/qb/QsOft8/bk5jajxSJTgZv1odG0HfmD7iaVvDE4gQlSU6ofYPTRP8Z8P4zQ0Xh
 ThzmG+Qq+d7wOwW+ZofoEJbjL0YRDa5C8QYVnCpSv3ZHrrQH7OtZsNks2CFR0drRlWffVO1s8cL
 mcOchHfZ3KtsGVcr9+bGFLx6Tts8h9O19bfKx5kbqXwICPNUUdUGR+VC4W4C3n2aKBBTzUmjEo/
 As5iHhZeXULf9h45sHg==
X-Proofpoint-GUID: S2ClPFzuMEwNoSBe6TpRIYI2V_iVhSrH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130069
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97377-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6AE2D28025C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce tmc_sysfs_ops as a wrapper, wrap sysfs read operations,
for reading trace data from the TMC buffer.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 51 ++++++++++--------------
 drivers/hwtracing/coresight/coresight-tmc.h      | 15 +++++++
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bac3278ef4dd..110eedde077f 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -228,17 +228,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
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
@@ -250,17 +243,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
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
@@ -287,15 +273,7 @@ static int tmc_open(struct inode *inode, struct file *file)
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
@@ -764,6 +742,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
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
@@ -823,6 +813,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
 		dev_list = "tmc_etb";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -835,6 +826,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = "tmc_etr";
+		drvdata->sysfs_ops = &etr_sysfs_ops;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
@@ -844,6 +836,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = "tmc_etf";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 81237944b986..4d80105d3fcf 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -259,6 +259,7 @@ struct etr_buf_node {
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @sysfs_ops:	Read operations for the sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -290,6 +291,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
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


