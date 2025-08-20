Return-Path: <linux-arm-msm+bounces-69883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF776B2D685
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 10:33:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1BC03B2113
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 08:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B9B2D9EEC;
	Wed, 20 Aug 2025 08:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DhSXmS1D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BE82D9ED7
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 08:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755678550; cv=none; b=gOKZ/toEtzPIwGZQI7/7DhuMn9npr3q7bEelYXY26ACazd5OWZf2oW0ipWY+jFfisRJa8riZQI8LPekzQWhzbUqdtQe6VqX34QIt056l1/v9JY2uHiJHsxFs9WU2j9B/4qBPv5Yu9JuqvNveL0QLHQLH04ZZhuAsyZnoj1O3+M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755678550; c=relaxed/simple;
	bh=qbiTA97ecG75CN8dtvPjbRcNXFdrEC8SJKen2afmr8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bvz6Cfaip8AAnfdrvtZ3usLZHxJCc+ffy5ahRh+aBSZxFzpN91xPrnLwxTQIx3wRzQ2WALniSAsSszHZaeXEk+RokLOpdhE77yAzAXmYl6lRRwyCD6YqFWbnmgP6U1/8HA8JgCjUI1ohaBjfBYD/4a2khvpndNV26mUxWMNfBvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DhSXmS1D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1ojAH005731
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 08:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wWW4BGFpCWnZEZLf1V0C0XICc4F6I83lE+aOEu8pGoQ=; b=DhSXmS1D2tEcfEs+
	0F1dr8C9vF75Db1WZpcBehjJyqnZDzAmxIQ/2eeLoQGP3x6SaOX9iU1elAFGoZY3
	Pd787xDJ86WbgVE8OhdGxRlX+Xt4F6zGna6qkpocWZNJ4s0BjNSxlGG3MCxP1mmt
	jwioZudGCfVFco/FfO6AqEi7BpmFOVrdoTRbA8FncN/Dvg7ScApr6WwtPnf/S++l
	Zq+BHogpGSttwdOaZWk4hY1IydOIi2Is880jq365zlQ0o3OWbOdlBkBRA1otn8wa
	fvaRxnSk/vG+TKCkCNqzgO+cWBXmy5sIwl/Ii/hdtSNUhi5Ka40LJYFtGlgRNnFA
	K/lB4g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52cgyef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 08:29:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-244581ce388so142171325ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 01:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755678547; x=1756283347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wWW4BGFpCWnZEZLf1V0C0XICc4F6I83lE+aOEu8pGoQ=;
        b=SkAWcwsidS79NpeaPhFemcXPpsw0l7XEbmf/Pr0c6sPoFciutmUtYXkntXtMvpNOwf
         CBDp0a20aSljKhguQk1xVMEFETwc0eNK91SwZaZBfxbTsPnhSFzxpadhTTSJNtH0ioFA
         k00dR3POKHqhetHafFz8DIMyU3DKhcB1RRo2H9Yoz0g4UNTPQ4CwYS3oAhW+Fh2nWmCc
         m4tTG4KZEVlnaQ/kPqK4XXj3Du154bJBE9K2HSNxGcCD9kjGvGDsR+FIoVLXKnAca5vP
         /dSyZ/+Y6Os7N2LAN+tkZpox/IXhf0kKkf/qj5KeiZhaIk+diEB/PTtCGRbV3JTMC6oZ
         Vhmg==
X-Forwarded-Encrypted: i=1; AJvYcCXrE86hHACH2cWy4k8SF86nU+QPIQ1eb41/7EubXKBqa3iJc3inh5mAW5ikty0EC2wTiWh+Q9QNSoljdVSF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3wUDh8+QkQj3hsDUJMkG3H6cZdLZZQvf3PBHx4zuvXcRPi2Ld
	cO7InZ0NjlavU8idaYAhevI8LIOVqRwilA/al9LQArK14lyuvlU/8UA04CL84FX/mV7cZbWG1f7
	dvmJ8hHLN62SQOapGSm+6TPfb9+uWFpaD6nQUv6ZZeJsqSbaAQzANAptp51oA8a2yzkwP
X-Gm-Gg: ASbGncvH/VHQ58Y9jzBxbD+wKREt8SAnCL9XqWd/zJbcQwH2zcCwTn+BL/VFYPXVr+t
	CxgpTwo04EnQZDv7l8oY31IiVF3Fb+ZeELn0nNTv2dW9A53RKPasS16RpzXqjxVRGsYbT9CBShB
	FnEZ9/GmCx0q/VyomggINHDN+gQyApDjpOG4Nf4e51pNcV8Zx00lSwC6V5PVbXDeqnC+K9Ltgk1
	APRzHFXuy/SpTq/qftwgHdO6YcZvB5LI+p52UQmfoz8ocviipGY/u5qgSKSJgcGRHHEis0D/qTx
	5Is9AwiEBT10noyYojb49amffLsmWu2m+AufzGNk3Q2LryPW4zxwyeYZS0pbV/yPUWo4NlOLRzg
	=
X-Received: by 2002:a17:902:ec88:b0:240:a430:91d with SMTP id d9443c01a7336-245ef0d5915mr22618715ad.10.1755678547498;
        Wed, 20 Aug 2025 01:29:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSJ1H1k68/Z9d58rrQY87Pvbazso9gHhcBZnMUte8gdhBHonHKpDa9vvaIPOQgp3qW13nehA==
X-Received: by 2002:a17:902:ec88:b0:240:a430:91d with SMTP id d9443c01a7336-245ef0d5915mr22618395ad.10.1755678546826;
        Wed, 20 Aug 2025 01:29:06 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed53e779sm19037735ad.160.2025.08.20.01.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 01:29:06 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 13:58:48 +0530
Subject: [PATCH v4 2/7] OPP: Move refcount and key update for readability
 in _opp_table_find_key()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-opp_pcie-v4-2-273b8944eed0@oss.qualcomm.com>
References: <20250820-opp_pcie-v4-0-273b8944eed0@oss.qualcomm.com>
In-Reply-To: <20250820-opp_pcie-v4-0-273b8944eed0@oss.qualcomm.com>
To: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755678529; l=1497;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=qbiTA97ecG75CN8dtvPjbRcNXFdrEC8SJKen2afmr8Y=;
 b=Y2kKzNaAKkSTFkX+ee44JG1EL0b6zaOZsUtgDls6JWW7HqrCg8Dons6oSWblDqtIqytD7X1iJ
 PylRDO/5ugsA96VHM0f7uTAOTYikgrV1LorOMCRMWAuPEYWHOKoTpC1
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: JXZf6ZMw4LQuYGMXvOPNprNOHJyCTKWT
X-Proofpoint-ORIG-GUID: JXZf6ZMw4LQuYGMXvOPNprNOHJyCTKWT
X-Authority-Analysis: v=2.4 cv=Xpij+VF9 c=1 sm=1 tr=0 ts=68a58754 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Zg3aejBZfcS9hqUhyUQA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX2zZ1U1JBIeCM
 haJHjpSzeuomYAgF+2Ol4lhWp554PSCNPAhrO3lFSue3P6HAZ3WV2q9bZwFwmDeGWkII0vD7GYQ
 xAs07dOiCJp52GMYMzN4YFiVnLb/f89mod/lWVI7zs19pvTMaQ6kaLa2jZJaBH/0D+q/WvCBbsM
 grrN/2PtzeUbtNaCJhUAYmSkMEQlBLiSst6+GfaGHmax2p4ZRydQHaiN0ZBAENZ0TRMW+Yf0HY7
 9kki58Z/rBbn7pN6sVurytEvFVZKpCx8YUgXMNcSHqBVvgoifN7tyCPSvBcHdFoiA+HX6+C9Ft6
 KA+qDh3D7+FgJw/I7XbDVyTq1CrR3co61Ahgn0MmLBX48A4JsQzC5kevEQTayuZtHlVCZ0sXLTh
 8u0AYWCMAE3CXlQeWXv7U+6GHfLkQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Refactor _opp_table_find_key() to improve readability by moving the
reference count increment and key update inside the match condition block.

Also make the 'assert' check mandatory instead of treating it as optional.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/opp/core.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index a36c3daac39cd0bdd2a1f7e9bad5b92f0c756153..bf49709b8c39271431772924daf0c003b45eec7f 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -544,24 +544,22 @@ static struct dev_pm_opp *_opp_table_find_key(struct opp_table *opp_table,
 	struct dev_pm_opp *temp_opp, *opp = ERR_PTR(-ERANGE);
 
 	/* Assert that the requirement is met */
-	if (assert && !assert(opp_table, index))
+	if (!assert(opp_table, index))
 		return ERR_PTR(-EINVAL);
 
 	guard(mutex)(&opp_table->lock);
 
 	list_for_each_entry(temp_opp, &opp_table->opp_list, node) {
 		if (temp_opp->available == available) {
-			if (compare(&opp, temp_opp, read(temp_opp, index), *key))
+			if (compare(&opp, temp_opp, read(temp_opp, index), *key)) {
+				/* Increment the reference count of OPP */
+				*key = read(opp, index);
+				dev_pm_opp_get(opp);
 				break;
+			}
 		}
 	}
 
-	/* Increment the reference count of OPP */
-	if (!IS_ERR(opp)) {
-		*key = read(opp, index);
-		dev_pm_opp_get(opp);
-	}
-
 	return opp;
 }
 

-- 
2.34.1


