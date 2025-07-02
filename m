Return-Path: <linux-arm-msm+bounces-63457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE8AAF6250
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 21:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E46B94E829F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 19:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C0B2F7D15;
	Wed,  2 Jul 2025 19:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hnSl+EKf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE6C1BC099
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 19:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751483007; cv=none; b=rSDcu+4aceJbSm4SRxvMA95D8fX0a5Ft9wf4tlzGWIm1S7tO+JZce2LT8ucy9I654VZfgkI5rnIAAMxNIdejAM7vXZBgn39MM4RESEa1L/STcgHL++HNZk+XrmDRqzwvMGZcm+ZMv2ViQEK/3M54916B5ABfvJILZe4pZcOhChw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751483007; c=relaxed/simple;
	bh=nzdt0U1Bc8O8zOylboCzufd3clxq6GDqWTmio+5DHcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dSDpVPZCCv+SxLVJiQpdjPue+PNPtHHCs5IYPWHUibJudvKcHYPyViDxLLwlZC/jPWsPergHVCBvrOwqHhs6PGVccJPXjKgeCQr7WQ1NK8GM+7i0JJdF9w7UXUK0CI3xXws0ZmzbFF97UuWzqH7dJziN3eQRDG4hyqk4fH5w6aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hnSl+EKf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562BmBnD024702
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 19:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mWEmiCDkWM/
	dyt4IuSaxnV9KdbWUyishGyxyF47FjlM=; b=hnSl+EKf/CXIEnKMPeI2GVE41Fi
	7hbeXiT3AiPbbp9nZI8DHEDCpIHyxkkEdF4VAHo9TQxxwI+A0zxbi87wfJYnjDqa
	yx4L5/QEvcnKZuz3NtoUtmi9MO/RJkj2ZG4aCrbyFCgP421+NjyBiASQ+c6yPkIU
	TRNTW9FJLl46VlMDlClru9rUY+C3eg16EL/tncOiQOaFJT3ZkJFnX7sL2bxBsoCI
	gbfs8ZOL0KtPsOlfV9btUGh4t3lBDdbIr325C/mwmUOxd6lON5O+50fpnI2Uyane
	xfGxkBnuXecttsVVEnKVm5F72bavOU/ixVXMq6lS4srL8qxYza9cwighikg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9nrw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 19:03:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23632fd6248so46226195ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 12:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751483004; x=1752087804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mWEmiCDkWM/dyt4IuSaxnV9KdbWUyishGyxyF47FjlM=;
        b=cvlyVzRjRecRPIB74/L1VbFQw7fxebT5gyd/W0pblb2E4FDOXFxNT6de3u82L4EvU/
         mYndFugmKwY4LShEsHB38OObQpmv/tRzkUJMlOOlW5tyPAaXQpSS3stquSoQwSDqu28+
         89Wv+FyfZSNheWzxWHPPVJKAKaBm5nW7EBBlDRF2wL3jL0QN+53hRXZmgvkhCcZrrxrB
         0htfM5LdHJSQynryyS4JpXZIy9qT7kNyIuVHqfwKf8n+uT6deOtOqUZzu+Ns+NIN+oT9
         pB31BkbkQ19eLL2eeorwmM1t+1eTt6afUxQ8AWuI9rQ1dJ1c3Fw9UF/oAjCcZuCML+FZ
         QMJQ==
X-Gm-Message-State: AOJu0Yypl80zzcqpkYCKVuzre1wz1sGZuSzUaiDIRIwHdcV3CWXbeiy7
	nkqe9NZlxsHicBQzbf0U5LIhbpBDFWZqi/93QjzskTWmD8g7953rY+AQ2DLJeLyZVJ9D3NqazBD
	0eomnTswtgvYwCiVC41u545uSiP3puuHz07U5N3rccyZFUwHzwA0MYvEC5r1w80r1In/hQtMFZ5
	Zb
X-Gm-Gg: ASbGncsJvz5k+Zlj6v2rLNHzDjjbAqmuqE+gcA7YW5L4SviN7Kw3JuZEHoazBY8yN4s
	v9nZNRaMFR34ZulsCcOwAz6LUnsvdSXtTdqy+l6g28uIXH8K1sR3s0YJPVewP0a9Xr/mkdqbfBM
	2UhXbn7Wze5qt1R2XTmruZjMeVau13b+BXDy00sUTkneFHodpQZOQNEWgpZF9bSEZNaK5+Wyhv1
	ss3nDbhSdsTpNDa9Fr0yQF9ysPNEePja/AysE9VL2Yi7BEMvvsjr8Fm/OU/jnC9gSSK1QuYY7MV
	JjFpLwNHdoQ+FGiP7OMN1CVDg3XgQbIaMQ==
X-Received: by 2002:a17:902:cccc:b0:237:f7f8:7453 with SMTP id d9443c01a7336-23c797d1357mr5118135ad.51.1751483003808;
        Wed, 02 Jul 2025 12:03:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3xXyh/GdF446atAWsLKw/m8TCDkOAGDaWGBMDHaHcikjQQV9DawDYJih2h3x3oe1lvqBS9A==
X-Received: by 2002:a17:902:cccc:b0:237:f7f8:7453 with SMTP id d9443c01a7336-23c797d1357mr5117885ad.51.1751483003377;
        Wed, 02 Jul 2025 12:03:23 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e400fsm134594205ad.34.2025.07.02.12.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 12:03:23 -0700 (PDT)
From: Rob Clark <rob.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
        Kamil Konieczny <kamil.konieczny@linux.intel.com>,
        Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH i-g-t v2 5/9] tests/msm/msm_mapping: Handle BO names with spaces
Date: Wed,  2 Jul 2025 12:02:45 -0700
Message-ID: <20250702190249.376313-6-rob.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
References: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=6865827d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=LsNcMMtZqy-lO6dUSW4A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: JE6ocrpR87fkriBM_vF9WOML8JYzbxA0
X-Proofpoint-GUID: JE6ocrpR87fkriBM_vF9WOML8JYzbxA0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE1NiBTYWx0ZWRfX7HYX9oXPzCYw
 pTOt8HUYY6ZEtPWduIIZvd6wB4Vh8dwnntzOIjftJ7E23v/Yg++JClt3H0ucVR0ZzUdQOP37o46
 J46h9CnkK3rhy61Xy2VTifBq3a9u1BhLZBVXXD588LZ6yS/hAjV4JZDS4+2IduZ1UYbll5xnTfg
 lzoYN2jQrYROPIqvr6NUgizvjKgU2UbjKJtM6fe9dR1nB4+40njSuTboz3+pukc46UP1pAyGWQ5
 xUntpEaw/ZtaUos0zFiCd1JBjuYSED6a9lwvBSG/a3u3iMXl3wJeyLLJpHkpFgYFwtPWEbxbF2P
 yb/8EQJF6P8j2YDkUC2Bm02tuLUqTfsf2XmkzHlr4V0Xrl+B03mxrBuuyiafDnO/ZIDsKoancZE
 rwkQDYLFtGeTaMBL9zOZ0enL4V7TppU4w/NsKdoId9qlLhzQOrIXL2VT46BXp/Z9EjtkGehN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=830
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020156

Instead of trimming at the first space, scan from the end of the string
until we reach the first non-space char.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_mapping.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index 64dc62c3cda6..923bf8734bd2 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -101,13 +101,15 @@ endswith(const char *str, const char *end)
 
 	/* Trim trailing whitespace: */
 	if (p) {
-		char *c = p;
-		while (c) {
+		char *c = p + strlen(p) - 1;
+
+		while (c > p) {
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


