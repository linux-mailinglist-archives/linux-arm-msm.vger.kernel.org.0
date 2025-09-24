Return-Path: <linux-arm-msm+bounces-74720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C32AB9C804
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAF6716FCF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3729E2C11E1;
	Wed, 24 Sep 2025 23:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gDQjWe/e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABD428B3E7
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758755841; cv=none; b=OEBu6arnIwUip1Gd0jC8zJc0+5BtpjR4kb4gDUpWrQ4yFhBICb2SfJdXBu75XKx0+07Uh1ew2/3zduhiNqhYd1UjdIxxrIISTv/HhSbp4Kva2RDZsYxkLXqL5hs6EuWeRQbUJOfxA/xRBDqfkcGEvCsB4V/mBhNCSh8MZOFYiX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758755841; c=relaxed/simple;
	bh=Gof4pKeTlVAfV4FxLQb9dzAHN3tcbZ7WLBE3vor4mPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VWDUzmsmoXs9lvlQHXGXj1UKt8fdaL3ZCc9iH+vquApqnY7lNlOvS4u+n+DerKwBax0BXj57u2xDXm/lvD0LORiolH7h3ztqPgK1ON0i5G8yGY5V+KKlnoiJUo6AdX/bdXU3sX/DyTMuDPd5XMk2s8Z1YlB9b990gUdS786P0Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gDQjWe/e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCu4OU018033
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CCS9tU60/YFF8M8i7W5MAb37OoGC+vKy4CyRgEo2uag=; b=gDQjWe/eLiBGFUie
	qmYpRs+ivyfrr25ymn7T/pAptNSqRGV4rQkoXLs4q4rrrDXjQg9EYzDxWEuZfS/X
	iHja9Dy2JOarjNjoS++xYZ2LNOulh3i+EpRBphppasu2wIjmBZLeVuUFMEcdK8w2
	C07Zw8OHxylFDU57GdTmKbsVDyQugTf7bDFi+T278LDR9UKjBCk8v0sIE1ZEI5fz
	bUldHw6/S1c078WmyUyz4FXWzbSLD4VL+5zoKAHly23vpxvjyIGznPUz0RT/o7F/
	ux5/3EnEpQRYsITduDkk4D8awiOW1LPDks8I18JSLWDygO8KJmFQa9G9zv772EfO
	dLxt/A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kk9yba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:17:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2699ed6d43dso3320285ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:17:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758755837; x=1759360637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCS9tU60/YFF8M8i7W5MAb37OoGC+vKy4CyRgEo2uag=;
        b=uOfnr9fA33DOBxKgxsyBnT7js5uo6EgDr8qa3rEMzGphIQRlcc/PGw8yolQwbpRnKv
         s+C0DENS19NaMHjWhenFEky4Xp9J14S5YAvza62/hljQ0DTliCAkE7/SEGR0l/wafSyd
         U8mY2HnMkxfjH9M2TEy1chiCpxvU1S56EJqULrhglN6HYwMh5oQNGgbJT3s3qv6GXY7W
         xHpOXGDgVEDHJa2mASRXc0AaLzbhIj8OLXzTGvh2H0bzoVI6nXIQOHGVaqEYA4wNvKrk
         pyPbSM1oqVNK5RIbij8gn7AtxkueYk15+MWgVmeqNsH0MUFqPneTLYMu+7KksuNpYPxy
         UNEw==
X-Forwarded-Encrypted: i=1; AJvYcCX/f/BQCL2HNrm2JSWwh1EFnEeg4hEkE6Jx+6rD/ta146xAyh4yxF9WgRKHhiESDKi0Vh0Rk6SiMkyMY4jF@vger.kernel.org
X-Gm-Message-State: AOJu0YxUrRb5kDtf3SorgWOOrSoKcIiLkjTY3ksWnGPGdVVMl31Z/jnb
	ye+GfmKNnVLp4JsAy+m3i6D6r2+TWuDGQz5MM+IKsieX9B61sAB3nUzwwT/ZuG3IUqPAFzLp4r1
	Z7W71FEFx8fjNKj6lq03ZtNRn+ksDWdj84smXxByWrI5yOx/vHVyXNtsasSi4O/NI0pco
X-Gm-Gg: ASbGncsdYb6dhxQLxPoxGcmx49VmmkoQOxACj9kP2mR9yXhzLXelPJAHy6jQ+j9EIYW
	+0yiImzStrlryWYXAE4W6Lp37cK0DsMBSSvcgkkWHMFk5NqC60eU1OQQNjXWy835N48GvcnpQ0t
	0Gix4ohHkbesUK4Qw0AlnD4jVn06M0jcoVtgcgTIMWoSxTqLqBWaBxFDOIK4SvsO7pzHsMLjO5N
	H6TfSMb5aeitAXmy6nSqkAGSRbBhNArF4fsx0dFP/19H7vcNtGCTZKTxTM0nWjuSdxxVeSnp0ej
	F6qJheDkf8uVbYQEJfg6yhXybFdhs9kVu5OiGWI6k56sal6f5FvJAIK9X3tzvl8nSowJ3P/q2hH
	qFGPtdvwMdU34R/A=
X-Received: by 2002:a17:903:3bad:b0:250:1c22:e78 with SMTP id d9443c01a7336-27ed4a09192mr16009615ad.1.1758755837286;
        Wed, 24 Sep 2025 16:17:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8RNAE0dK78ZIUhrtpS8noaRXHuZuj/3uciNFcs6W93z8jq8mpZU26oSG9p/RkrT9v/zQzXA==
X-Received: by 2002:a17:903:3bad:b0:250:1c22:e78 with SMTP id d9443c01a7336-27ed4a09192mr16009385ad.1.1758755836839;
        Wed, 24 Sep 2025 16:17:16 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed699cbfesm3892125ad.108.2025.09.24.16.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:17:16 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:17:08 -0700
Subject: [PATCH 3/3] pmdomain: qcom: rpmhpd: Add RPMh power domain support
 for Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-pd-v1-3-b78444125c91@oss.qualcomm.com>
References: <20250924-knp-pd-v1-0-b78444125c91@oss.qualcomm.com>
In-Reply-To: <20250924-knp-pd-v1-0-b78444125c91@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758755831; l=2289;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=J/5I59el++Ih5Gq5braSoVsViqw3EJxsHP0Nl/fg2GQ=;
 b=KyHs9h7fzlCc93gEReqzSlaeEsjVk5rIp9T89Kpw6/LXxia2noXXaLRBdJ5ZgU0yAmhcNcHAe
 gFgv4IwnmAIATyjXhI4aI4xfpRDz4x2NdiF1d8eibluUMVzgq/OJltv
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: XZinArtWlMxbCR6EB_rZSbiLQlqL76Hr
X-Proofpoint-ORIG-GUID: XZinArtWlMxbCR6EB_rZSbiLQlqL76Hr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX1p2NCsaJzZ6T
 LaF63dWDDYgh+uU0NOSSmx8TBh6BKQ7yDGfau93nki9iJFOa9MYpEWLEMC4tvBjpJzmisIksjm6
 uYPgUl0/WW5OUWaAA0MmtcAVSkVijISgcw810MNoCR29jXC8+kQayR5F5xowfCx7JMQ0J4QOmQ9
 hohV1gwN3k1w6LE0Mdx21+UZYare3RCJSrDezAvIK7Qebfe3rrDkXqwACGtJWG5ilnNc+9KFW02
 1IOsbIGGPVWyeNoP8LUMVjKvvAE2NtMhbY9lXwJgVpKcPxg39r8DP5vv8jMntGeEQYfazfyB4D8
 uFaZ+qpYlaPuqYRWRbuf5CvP9JgRPyTxWhC8D0SNbB7DjAnCrL2TM0gM2q0BMQT/TU9oa9k39ge
 TxxeCWMq
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d47bfe cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Xp9dVAycJPogQ6Zm-Q8A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Add the RPMh power domains present in Kaanapali SoCs. Also increase the
maximum allowed number of levels for ARC resources from 16 to 32, as
needed starting on the Kaanapali SoC where the ARC vote registers have been
expanded from 4 to 5 bits.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 4faa8a256186..a8b37037c6fe 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -19,7 +19,7 @@
 
 #define domain_to_rpmhpd(domain) container_of(domain, struct rpmhpd, pd)
 
-#define RPMH_ARC_MAX_LEVELS	16
+#define RPMH_ARC_MAX_LEVELS	32
 
 /**
  * struct rpmhpd - top level RPMh power domain resource data structure
@@ -595,6 +595,31 @@ static const struct rpmhpd_desc sm8750_desc = {
 	.num_pds = ARRAY_SIZE(sm8750_rpmhpds),
 };
 
+/* KAANAPALI RPMH powerdomains */
+static struct rpmhpd *kaanapali_rpmhpds[] = {
+	[RPMHPD_CX] = &cx,
+	[RPMHPD_CX_AO] = &cx_ao,
+	[RPMHPD_EBI] = &ebi,
+	[RPMHPD_GFX] = &gfx,
+	[RPMHPD_GMXC] = &gmxc,
+	[RPMHPD_LCX] = &lcx,
+	[RPMHPD_LMX] = &lmx,
+	[RPMHPD_MX] = &mx,
+	[RPMHPD_MX_AO] = &mx_ao,
+	[RPMHPD_MMCX] = &mmcx,
+	[RPMHPD_MMCX_AO] = &mmcx_ao,
+	[RPMHPD_MSS] = &mss,
+	[RPMHPD_MXC] = &mxc,
+	[RPMHPD_MXC_AO] = &mxc_ao,
+	[RPMHPD_NSP] = &nsp,
+	[RPMHPD_NSP2] = &nsp2,
+};
+
+static const struct rpmhpd_desc kaanapali_desc = {
+	.rpmhpds = kaanapali_rpmhpds,
+	.num_pds = ARRAY_SIZE(kaanapali_rpmhpds),
+};
+
 /* QDU1000/QRU1000 RPMH powerdomains */
 static struct rpmhpd *qdu1000_rpmhpds[] = {
 	[QDU1000_CX] = &cx,
@@ -767,6 +792,7 @@ static const struct rpmhpd_desc qcs615_desc = {
 
 static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmhpd", .data = &glymur_desc },
+	{ .compatible = "qcom,kaanapali-rpmhpd", .data = &kaanapali_desc },
 	{ .compatible = "qcom,milos-rpmhpd", .data = &milos_desc },
 	{ .compatible = "qcom,qcs615-rpmhpd", .data = &qcs615_desc },
 	{ .compatible = "qcom,qcs8300-rpmhpd", .data = &qcs8300_desc },

-- 
2.25.1


