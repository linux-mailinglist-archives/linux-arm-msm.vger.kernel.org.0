Return-Path: <linux-arm-msm+bounces-63108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8171AEE685
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 20:09:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C275B3A3196
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 18:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98262E3399;
	Mon, 30 Jun 2025 18:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bMFGamEv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D9A2E54DF
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751306982; cv=none; b=lwaKsIcPi3MFNcaTK+hCaTx5jx0wLTOm12HF1XAfPEF/D0mEryXNg53eOPgX6n+wxi9IAcXdKOPxsZpa9VbVEfNxbwilKBFyDvj835JpBthDKhSnC9ke8RmNeF50wUkjvqeVeHyoElSb6g9wBCdqmBsEbyUPX5ucpAtAYhdeBBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751306982; c=relaxed/simple;
	bh=1ub7wRb1ktKsoTkxp93Z096dWtMhvMIA66wDXDGQux0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hWafU0NNPT2bCL7CUqEM+9O1IyFmBYuqvtuZ31tI94Wv3L99qCb5Ex19VwZbNqRQAHeYWmCJktnKKSYTOhqHAPwEk/gMrWisGuVnGQQmwdZrm7adlqKh1nkXHDWxwU/qLIcEBD//EK+ANY2KZXA10dBTo6hL/JbH4KLxdJvmoFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bMFGamEv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UGH64M024876
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=isUN5GZLBzn
	+dp1fRJTXJzKqfql8MsFBJoHLS/tVce8=; b=bMFGamEv5MDesp9rZSoK9Wub2Ri
	00QkqrdVcdUmALd+A+i1cS3Ncpl9mJtgQquuSktpiXJZ1A4v4S+hExoK2Pyu6cYS
	jCJ8cffPByKpO8SqLfzvi1O+iOJ7bdsr9nTjHBhf57VVzIKFXOznbkYKkHV4gZ/E
	i98Qv0x3JjMo4kZOsU4hcwbr8SmBWIPuIawps+e3VO1RCgcZ+Eau5ESSBCq0gD46
	fxLZz58TcfX3m+fHaj6EbJTsWtGQcQVqG+wpGs5hsrQYyGyy9Vd0cS07hlb6zNMy
	nlv7R5O3KRWq0IW9FDzRn20R6Xou1rszEJvLfEI1fkqAgduGYUFeNSGnkjA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j801wqj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:09:39 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-74ae13e99d6so4097723b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 11:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751306978; x=1751911778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=isUN5GZLBzn+dp1fRJTXJzKqfql8MsFBJoHLS/tVce8=;
        b=PCbj4vMZnrGGYfjxsSduV27sg1BlGFHob8kp523alF6rz5lyjbDOXsQudy+OvVNB1Q
         fmY09iLz4v+bJN3gFBvJkcxCTOS6VJh6w2pNB0zlSYCqykdbjV+zFj3HdJRVMf/Y9znM
         mClSP2/SWnmP/8xb27/kAEcU/bpjCDkJmNxsZBpsoDrGuKtFlUoxnSv2pGRA7XgYIINs
         TyVfPVOIFAKaty/JwYDVtK1QiMEjEKDwS74ORs1N26ZwS2TgJDp2WuSv8W56y7xfvpTo
         RecQolJDThnx4J8WAEbM/Zb1G0+gnXvds9onni9KFjr/Ka8JO21EUDVgmwMI6w9pDhOf
         I2yg==
X-Gm-Message-State: AOJu0YzuWteYgFge5cmkCo8PMaKpcun7EjaI81lQ7NeO2p/F3m8Esyjy
	rXw5SsVuMPasviAjKvW1pmQwP31RwV5vmIWqXnyiWX7iJRlfjG6+9OfE6jZpUghrM7MBsSAV0Rx
	Pi0C4VTeHe206TKBuQid8qQB6oIfwiVCvBdEIIB7B9hRWwZFvg5Wqtyb6jS2fkIqPO4Y486JVnH
	9E
X-Gm-Gg: ASbGnctUsxtz86s8M2q4xcUohL0e0dcRXsLQEcPVqyKLmmWmxO8uzm7/e2opanZ08j3
	ZFYQijjjmHhHNywzPeuAuhY2COwgPV6+5bI1jgxzaM/ibV7r1qbu35s/mzF/BUZF3M0xuco1acx
	bHEtm3tcN+DWB63EBAj3KkeGDNBczyAr2b8gtOFJJBdN4Gh4HXYYdTgfkCHXWrXs+GkDZTk88/5
	oKQaiqRvmR5qt7Ub81lZjqEhn26JhlFxlmyvZ2u0d5ZIrHRogKQID6AHD3BvIWs1GZtr8rOUGu1
	I2vFoEdv3DMCNBKw7x0z0g9qAezQ6b1DSg==
X-Received: by 2002:a05:6a21:6da6:b0:1f3:20be:c18a with SMTP id adf61e73a8af0-222c99b9436mr744552637.10.1751306978179;
        Mon, 30 Jun 2025 11:09:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPRgqubDncr8uyKq1wIxnVAjzcUH26P2qJtukqllyYHhkKLyMS99NCl8+0uSyNFrV1ry74rg==
X-Received: by 2002:a05:6a21:6da6:b0:1f3:20be:c18a with SMTP id adf61e73a8af0-222c99b9436mr744511637.10.1751306977635;
        Mon, 30 Jun 2025 11:09:37 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541e5c1sm9763251b3a.70.2025.06.30.11.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 11:09:37 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH igt 4/9] msm/mapping: Handle BO names with spaces
Date: Mon, 30 Jun 2025 11:08:58 -0700
Message-ID: <20250630180903.77990-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: N1LUocHk6MMziSM0hf4pPfIsVMymtOZP
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=6862d2e3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=LsNcMMtZqy-lO6dUSW4A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: N1LUocHk6MMziSM0hf4pPfIsVMymtOZP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE0NyBTYWx0ZWRfX89Xa4ny5FgXy
 gcwmj7G49/ZrFEID2swLA+1g302CvoXLrUoOC9n4pb53JgvwsZuxWlxCzUg6lH04RZwUn5bIR5d
 fiZMmElUaMlnbaTIWL7AEAG6D5rtHonRU5h62HtO14NYJKWOIg7yd2sJOsbc94Ob+x+XhjFVrbb
 RNMNIjtYInAVPPh2LesxEJpK5U9zt26yLlp5bkWpHy55tbq3an1p8zwYW5oAI7M1fFk6g5VI0Al
 yx9PV5rX7Isah+C5Zy06VwAv295iCxgaTNjo8nD15U2/FVkYo/K4Tj0W3NaXkxrvOPY8yerMBNz
 CjfErfbFCfNddW4mrON3QIZpFJrycCnB/d4sdEBZaRBP+iGHplJTIlv5gjUmum1jJglTiJSYyNm
 nkHpQylj/6+OsoFj7SvGN+OSIjVXlqOUWuOonDgS49pIceOiSeQS57U+TOGdKlsNqh25/JDf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=824 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506300147

From: Rob Clark <rob.clark@oss.qualcomm.com>

Instead of trimming at the first space, scan from the end of the string
until we reach the first non-space char.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_mapping.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index f536db82aba2..5afbcd081fc7 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -101,13 +101,14 @@ endswith(const char *str, const char *end)
 
 	/* Trim trailing whitespace: */
 	if (p) {
-		char *c = p;
-		while (c) {
+		char *c = p + strlen(p) - 1;
+		while (c > p ) {
 			if (isspace(*c)) {
 				*c = '\0';
+			} else {
 				break;
 			}
-			c++;
+			c--;
 		}
 	}
 
-- 
2.50.0


