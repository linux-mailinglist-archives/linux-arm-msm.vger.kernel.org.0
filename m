Return-Path: <linux-arm-msm+bounces-61948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF0AAE2B17
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 20:15:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C95C1897A0A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 18:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E07B27147C;
	Sat, 21 Jun 2025 18:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZSq5Uatp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA8D26F45A
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 18:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750529667; cv=none; b=XmiUA5QVAGie5R/w+eC28n5Mw/rfVDUBAm6hzIi9j/6cBanu81/ax+z5AzcBpVIuvbEgaI9bJIzo5VV285in9vaOS9ckFn1LL2ByrzZdep3jWAieyz4nSTT5iHPZarKZ0NGOhnt+EzUbUXJzVvtCknge6SHDYXNc6lL9w3qZMsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750529667; c=relaxed/simple;
	bh=Run+O2mI2A76noQdH2tqShWLEpuGZIuywf14cmX4Kk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kjd3vJXyfVeB2ooXvnZJ1grLjqOAFScPWRxCdPCL6NexA0tc/E8LsRxisIcUqNAjCsdUWxQnDYaVMaJUjVg37h0YxsjuSa4gRGRGu+9IEaop+MWXNc3FnS24sRp3VA66hE96U5MfLuctPmx/Rjznhk3jyNjfyN37iTehiexLMzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZSq5Uatp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LDfqNl028151
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 18:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1aqIaLvUpP1zFWPwZcv8zHZi9hcPKnIY5YKRhPTvJuk=; b=ZSq5Uatp+fG9ELBr
	RRwTAdWxWNSz4z6UtG5++e+SRg5K4sGGGnzchc7TkXzBZjKYFSDXdL+FymHxFJW6
	S8Xlrm44tjahnBo/NVKVH06HOsYtT3gyP3ZAc1Jf948YfVeN1F/DzXKMhDh9djSD
	IIhrDSDVsjf8vWXx+KApWNY/oUwsgzRiDdmgo4UXWUO7J0Ls5lN8AE1mW+CDqbFv
	c1ZN2i4LuI0bYCHBTPtBPaO6TfgdsrthGJG3R9wt3H+14AWS3MwBEYn0vhu03cCj
	i2wICl4stcHVS8rF+EnwihaCGV1WNu044e6h8DJsbL28ra0pv5eNTSBJcBTo7wiq
	pdpEqA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ducj0epc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 18:14:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3e90c3a81so242170485a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 11:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750529664; x=1751134464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1aqIaLvUpP1zFWPwZcv8zHZi9hcPKnIY5YKRhPTvJuk=;
        b=QgCpVoJEfB4/DBvsZZ3WINauPQUMEstPMJOf5o/drFz5nfaTymIb0IugOOpbyZ7OFu
         ojhxSp5dT9xLbM51/flnSuiAqrH+thEG2LnDTBF7MrfEo6y1yLhPAwXLz9x3oz1OC5il
         PzI6JdP3zFm7SWog6rfCjjWuqEsyfMGOzPrQdc+Ve+jpL1zACqwQEMLG1gV39y9X3QQm
         pYyi+GDEnZBOhit3d/olC0GRzLyru78mU0+aMO25TB8XdbzpqcV6aegta2q2vBwXPHKW
         xf2oB64yTN0NUQ7CGtlPpSC3+84GYWaVzMVh98VEzh698/WnU8dwubV+XhbwAd4PNFuZ
         MvCg==
X-Forwarded-Encrypted: i=1; AJvYcCXt9XuTxfHp5v106ryzKbTUp4Olm00crB8T+sNtAU2NNTAQqdYd8YVYLKcUPmb56jtTYnTdCs+OyeM3Ojsc@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr7gKL+DOGZFWNQ3n4ecQiV5PQaH/GUhtu4h5BrhZoP/IDI6d9
	c9YJb0K8hj5QBVqgcQccomXX8zc7TmKIBWOTqNkXqMQL3hgLCIdzo9fB6+ApkORuRZn14UUFJrk
	dPxx6EGRxgkqDbQIhguk4WgEZK2zY80vUxmnWVHKBEZUqmguUZ32pzGvIiBydMbEO9QTQ
X-Gm-Gg: ASbGncs0JUgxbs5A20NmEYPBeFecoOARXlFPUMEf6pZZyO7fO/a2sNfQUluvNUmuo0i
	wgIRV/T50nUptjmKOzgfYgyqnlR03WP/ScyYCM7ROOIMLU53oZxU7SD5L1dEc/dX4xQ331DqePF
	DMU1fsCWedO0h62qgiE95smMieVtCGnQfRQltkoAEPaHTNsFmoO4Y6raun/vsn/LsVAgiMYEvgb
	1leNpzomkewseaLqiuyRzSkBgl8o2AJ0evkv1BuylRgY9yrRlndiK0JYiYWszeg5/NqL0X+G3C3
	h3S/KVLL332xkrjdMkEtSVird9D7rYL9pHJ+7THfv+CGOANhGi2wuWXVXbhB5AsGySSpU3wzYMC
	4LTDCyBdl+pcZtF9e/CWfbFljSHnQBkCvAtM=
X-Received: by 2002:a05:620a:2693:b0:7d3:ed4c:fe84 with SMTP id af79cd13be357-7d3f991d7d9mr1216213085a.31.1750529663609;
        Sat, 21 Jun 2025 11:14:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELim/6+6aSoh9DCQhdH9yeSt9LxI2hvvLw6WOJeokVXk9fuz4Lf6Jl1owf+XMfbDNvPIp+vw==
X-Received: by 2002:a05:620a:2693:b0:7d3:ed4c:fe84 with SMTP id af79cd13be357-7d3f991d7d9mr1216210585a.31.1750529663236;
        Sat, 21 Jun 2025 11:14:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414cf36sm752336e87.86.2025.06.21.11.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 11:14:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 21:13:01 +0300
Subject: [PATCH 6/8] usb: typec: ucsi: yoga-c630: correct response for
 GET_CURRENT_CAM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-c630-ucsi-v1-6-a86de5e11361@oss.qualcomm.com>
References: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
In-Reply-To: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1228;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Run+O2mI2A76noQdH2tqShWLEpuGZIuywf14cmX4Kk8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoVvZzwGwXYpmPvXDx4iRsvi9cjZU0WfvZSDkRh
 IDMJvCJeDyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFb2cwAKCRCLPIo+Aiko
 1RSLB/4obyjbVEnnrgRFrKXyP8J/IIWxADau7nzq5Ef21hBWZml2P4EjvzYsPPBuYZSTClzcuAj
 i9NZEYyViwIasFDsQU9aDXQ36I65lGrnjnnTl1ii2BiHQggjgHDrBkcvET281KnEXY/1CemYaIq
 o5gMtd+k4A2/zRLotSO3SH6SC/yulmYj7ESWJxLmwllFHF4SWEM5XqSgmklCvheY2QxYdFJjCms
 5enH57R56RTgJYT8bkt2k0GGIOSkW+1R7s3ZVFdLw4xeBHlp5oDjDucDFKS0KHIPvBM3Nuj5BEO
 kHqLWEgb46YmdGXSNyV5WOCM40B7wuDuRBgucsJl25ETxJax
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDExNSBTYWx0ZWRfXz3mXuZTFOkZZ
 kUF4JcLdpjRqg7H6+nGH+60XH9mw0D8FjaKBPDn7zZFTiKf9YdXMokyKXt8UFcQjykZrwkrsg7B
 HWDYOf2W0ULztqPtB8X5UPmMTcjYwWuB2uaiV0XhQkUu7WC9l6EvmoQ8kHZRfwKjjFD60U3oqrK
 aixzsRfQcFWNd6WE0ptoeuvhVf1KTMsbVoGAWMiXuxVbrqDAaKx8Dpn4+khHVDySa/VekWrKGHe
 tfTICEFyDpo1jcYHoHaWV2K+qcRR6OLqrdYLqqLQpygVgPl2glLQCiiNtZXV5umrTvp10yJnSd7
 gGekD4+XDScX7bCOk7ofbELHgeCiV4Df94NCrFrzXbXB3qX72jTgP2VsUPNTUtU/pAi6glA6cRH
 ibE2QCerT3AMt04q5hlP2fARDbG051Iuqr5iuBvTn+HpVCACGd6MntBYzt33uYV29QRK4Ewu
X-Authority-Analysis: v=2.4 cv=MPdgmNZl c=1 sm=1 tr=0 ts=6856f680 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=btjbPSU_vhCAQAxPhXgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 80bnAdmyvo3twYK0WBsG-YPJEXbKVvCO
X-Proofpoint-ORIG-GUID: 80bnAdmyvo3twYK0WBsG-YPJEXbKVvCO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=804 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506210115

On Lenovo Yoga C630 the EC handles GET_CURRENT_CAM command, but it
returns 1 if DisplayPort is active and 0 otherwise. However in order to
let UCSI drivers handle AltModes correctly, it should return 0 / 0xff.
Correct returned value.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
index 506faf31b6e3a056e067f2bb69f5e9e5ea40e514..76afd128d42a2573ff55433f815c2773462a6426 100644
--- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
+++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
@@ -111,7 +111,15 @@ static int yoga_c630_ucsi_sync_control(struct ucsi *ucsi,
 		return 0;
 	}
 
-	return ucsi_sync_control_common(ucsi, command, cci, data, size);
+	ret = ucsi_sync_control_common(ucsi, command, cci, data, size);
+	if (ret < 0)
+		return ret;
+
+	/* UCSI_GET_CURRENT_CAM is off-by-one on all ports */
+	if (UCSI_COMMAND(command) == UCSI_GET_CURRENT_CAM && data)
+		((u8 *)data)[0]--;
+
+	return ret;
 }
 
 static bool yoga_c630_ucsi_update_altmodes(struct ucsi *ucsi,

-- 
2.39.5


