Return-Path: <linux-arm-msm+bounces-65685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB13B0A840
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 18:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 365B11899CE9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 16:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF9D2E6D30;
	Fri, 18 Jul 2025 16:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lw8xueDA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7C52E6D2A
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 16:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752855245; cv=none; b=pUnrOwA9sdQVagqJXsHPLZ+G7UMxELTqoISfi3zT+YxUYRcm4nkfRqQRbLywegFOst2c3rJJ69tO9QDGj6FNi8jYm2OXlCV8vsu1QbAncvNzNmwJX3xS3oYw0yiN051/7PV1nrGf/PWxEEX94SYFOyNX+0ZtM4bvU25jLUzaO0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752855245; c=relaxed/simple;
	bh=+xxLOwS3MGx2kqnHazzxF1Z9hjd0cdKHphI3OkVanZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iz16o7QyGKHlQkXo/qTzEAe/ntfhePyO/Wu7iLvi3wiIIdyvOZT6HT7CCfZr6wtixiu5KmakvlP8+3O9szYULb8qwFUwCWGSCNqnViErrihxP5TfY1A7U/QMGF5FoV+Ll+Q7GcNxaEp+CFU+y80mSAzWWvcBu6wK9YMTMHygB8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lw8xueDA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8WSnj007297
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 16:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	upe+/+ZNiN4rEM8lxNMtjuLncvLHFDi7Ix698gnE0ac=; b=Lw8xueDAzFq+c2mT
	ba/DSmcA+bFywa2eaZ4Z+8tmEq2IFrw7/IdjgwHxh++QTDetfUJHkKckdlUe494s
	uH+nx8sx+e/8k0wWPNVQFrz7EWQSnOVboYeVokMdyCtDfVsOxkFB6iMQn1/qx9p2
	vMxIxBuiC3MD1x7szYq/fr3pAWhpGwWlKNo4h9GrTt09rR34OKDPyV33zOiPUZFx
	uvr4CD+HaP1rLId4EBL9SfVVbxCl7vSxmqHGTjqMqomMd7Fu/8QWQlIJ5bNDrxdC
	u0+ZsQPAVO8uddGf4/wjLQ5Q9QD8uPEq3AKOOXUu/JJgEQBUvZo4o+/3QFVONXAu
	QYmqwA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfcadchk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 16:14:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ab60125e3dso41029631cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 09:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752855241; x=1753460041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=upe+/+ZNiN4rEM8lxNMtjuLncvLHFDi7Ix698gnE0ac=;
        b=Qzn5k1qeGts3eW1GBesgFFAhIDsUy3Dso3OqoB14+y8WZy6qx1Vb4lrpyfTVv0OKtA
         zX374nET20InUyDL1wNkE+/OgMzFxTczr+Yxy+MTXoovIj+ONtO4BgjIccr3x+/Ex29Y
         /ZFGHK/1uuHcyxYSCU06L4nj+fMv8oTdGV6EA9JQ2ifg9l40QjELi4eNQgNlyoATlEle
         bMiJFpqUgoJ20ZCj9mooNIPSKQxY/OYWc/+zePYa95RGPDhg9R2CLEKewqXcTabaxcto
         j6xGg5lD29C9nT88QLQDVrAs88a6KAQtXVhZOq1hrMJ0cx6gLM7aqq9R/f5H5pPuobpe
         Tqhg==
X-Gm-Message-State: AOJu0Ywe9O4nxrnp3+Dnd2zdvY3Bq+hvapnhfkFFMF/sOhHLyBED+ts2
	SVlUN8F9GkyQWAfn2t8DiS1rq/ge8Mz7ZLXGtlFFgRMcAIEaco7i7+PVMOMk1r8MFSdt+ni9kqb
	YGOLcpJP1Uyu4JEEvYq9e0+A2Bo2PScZJD5BnyFMQy6484UUIm4X+iMeei60Wpu8DStwkcri0Sx
	8x
X-Gm-Gg: ASbGncvn1UD6xXJoH4vmfTI5UlMeNsE6QM7sd6+Nr+sP8/xzHk45Vi1kCslxjRZLEO3
	RdUOPWQyOZuZfZNbIx0MBS27/JymZnjbiambI9YhzwtviedCBZC265HuBdH1THAcjGT198DkR6Y
	0zBdIISMshVlAWTd2vlfYXIKxglInvkzDLxBF7/ama+Z7SgIB9q+1wWbQpzZ17ccruZv3bt9AfG
	+/o1b039Wk0AMTUbZA3Z7Gx65TUXUFsZponVm6NZ5BljF9624jwCF3CwP3SqdlyDuaJ/vo9lDqT
	Hq3nn/eSxCwCxGH9aEHctNMWFFtXggdeiPlUCHoDLAz7at/IkfbvPR8r/+JWQPsFhWi6Se0/Wpf
	m2semvUMGlN2Pj36Y8Biz7jfJvRzTd9HAWmTGG8Iuvv1RfWPTb0aK
X-Received: by 2002:a05:620a:4692:b0:7e3:3da8:1cfd with SMTP id af79cd13be357-7e343348060mr1756141585a.1.1752855240390;
        Fri, 18 Jul 2025 09:14:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiXloHUW/dJO5B/sZQcQE3qVCQt888ju18d+F/l6OyveVlh6FnxLRN/AcVdeTx/p+qx3IOwg==
X-Received: by 2002:a05:620a:4692:b0:7e3:3da8:1cfd with SMTP id af79cd13be357-7e343348060mr1756117585a.1.1752855237251;
        Fri, 18 Jul 2025 09:13:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91c1ab7sm2388131fa.50.2025.07.18.09.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 09:13:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 19:13:45 +0300
Subject: [PATCH DO NOT MERGE 7/8] dt-bindings: power: qcom-rpmpd: drop
 compatibility defines
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-rework-rpmhpd-rpmpd-v1-7-eedca108e540@oss.qualcomm.com>
References: <20250718-rework-rpmhpd-rpmpd-v1-0-eedca108e540@oss.qualcomm.com>
In-Reply-To: <20250718-rework-rpmhpd-rpmpd-v1-0-eedca108e540@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4721;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+xxLOwS3MGx2kqnHazzxF1Z9hjd0cdKHphI3OkVanZE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoenK4HhBlrW4LBOGjAi3YKM9tPJ00EfyW/7rmV
 BUhCPwO746JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaHpyuAAKCRCLPIo+Aiko
 1QysB/sHJ314jwjcgpVtgmwYMJFDToUfndEx6PnhAL9Gn45FCk5EehXwWUe95njZR42zFwX4wOy
 frgXN/cFZNIIKl1rG57nVRmNPKn3yXTRGd98AlY72IS60DkO2RV+gkpbSDUCrkdzSm3d3JvJWYe
 Aj9noA/27DhJAdmELhSkm8GUTKSz8r6TiopA2FeFK+rEffEqc7HYDw4m9h1tSYSRQlgyckx6cl2
 HoEPGbIiw5leKfldpHBBesO3XFGCAUiMDdpVBOlv/62mId2l3yOjz2p3qqeebby39nFLRfXQkdE
 +kvHuDI7xGRF02cNmnOVjGawyoMp9GQQDAopjK4TyIAoaX0H
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEyNiBTYWx0ZWRfX9oLQroRo1Cab
 z03wNnbbzn9+gFKs9UizrYmisgDYWDyXmCUdjPo5pg6kPA8HQ9ogP8ARXkOU7JJd/juO76ESJ1x
 r1A1yNIet+LgzoYjjdmRqKaknBmuiMLLZ0e0UGQAaNafmZ5B9aniE3vVWU3ke2ZQOMsjPJpnLPt
 irNzgsTBSr7s3fYoK9FQ/8ysQqLQ8QFdcvtw8v05gBcjFJFW6ARBVpONyL2YG/+/q+XPbEeQRI3
 qwUxh9kvGQveMT4sd+PHTnmealHp1JwCGnDvGs4I/X2XgwXb5cdPt2tZkBi3hadfbKkzxnzyb5u
 tLaRDr6eypIF8HKQu7ZmAJ+XQIl3H1INhWwaWEvrp9LaN/9Gi9NCWvh/hFN7SC05N0bBHmJJFBu
 ZtWzufvHcxJF6brgoqi/9maKBqkJG35AdTVqfvwnhwh4LnAo3SZqjjuA71UtWQUmpAxO8NvW
X-Proofpoint-GUID: OQym8pOOlM21wcMDXmUsqzYjxxSs9H_L
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=687a72ca cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Db-YKvRWyNvzAwfAYpAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: OQym8pOOlM21wcMDXmUsqzYjxxSs9H_L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=750 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180126

Now as all relevant platforms were converted to RPMPD_ defines, drop
compatibility defines from the qcom-rpmpd bindings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/dt-bindings/power/qcom-rpmpd.h | 88 ----------------------------------
 1 file changed, 88 deletions(-)

diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 4371ac941f29d9657b6573f4934658f100726224..5405efa4cb77e8e6d43168889c5c83927060b780 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -25,19 +25,6 @@
  * RPMPD_* above.
  */
 
-/* MDM9607 Power Domains */
-#define MDM9607_VDDCX		RPMPD_VDDCX
-#define MDM9607_VDDCX_AO	RPMPD_VDDCX_AO
-#define MDM9607_VDDCX_VFL	RPMPD_VDDCX_VFL
-#define MDM9607_VDDMX		RPMPD_VDDMX
-#define MDM9607_VDDMX_AO	RPMPD_VDDMX_AO
-#define MDM9607_VDDMX_VFL	RPMPD_VDDMX_VFL
-
-/* MSM8226 Power Domain Indexes */
-#define MSM8226_VDDCX		RPMPD_VDDCX
-#define MSM8226_VDDCX_AO	RPMPD_VDDCX_AO
-#define MSM8226_VDDCX_VFC	RPMPD_VDDCX_VFC
-
 /* MSM8939 Power Domains */
 #define MSM8939_VDDMDCX		0
 #define MSM8939_VDDMDCX_AO	1
@@ -48,41 +35,6 @@
 #define MSM8939_VDDMX		6
 #define MSM8939_VDDMX_AO	7
 
-/* MSM8916 Power Domain Indexes */
-#define MSM8916_VDDCX		RPMPD_VDDCX
-#define MSM8916_VDDCX_AO	RPMPD_VDDCX_AO
-#define MSM8916_VDDCX_VFC	RPMPD_VDDCX_VFC
-#define MSM8916_VDDMX		RPMPD_VDDMX
-#define MSM8916_VDDMX_AO	RPMPD_VDDMX_AO
-
-/* MSM8909 Power Domain Indexes */
-#define MSM8909_VDDCX		MSM8916_VDDCX
-#define MSM8909_VDDCX_AO	MSM8916_VDDCX_AO
-#define MSM8909_VDDCX_VFC	MSM8916_VDDCX_VFC
-#define MSM8909_VDDMX		MSM8916_VDDMX
-#define MSM8909_VDDMX_AO	MSM8916_VDDMX_AO
-
-/* MSM8917 Power Domain Indexes */
-#define MSM8917_VDDCX		RPMPD_VDDCX
-#define MSM8917_VDDCX_AO	RPMPD_VDDCX_AO
-#define MSM8917_VDDCX_VFL	RPMPD_VDDCX_VFL
-#define MSM8917_VDDMX		RPMPD_VDDMX
-#define MSM8917_VDDMX_AO	RPMPD_VDDMX_AO
-
-/* MSM8937 Power Domain Indexes */
-#define MSM8937_VDDCX		MSM8917_VDDCX
-#define MSM8937_VDDCX_AO	MSM8917_VDDCX_AO
-#define MSM8937_VDDCX_VFL	MSM8917_VDDCX_VFL
-#define MSM8937_VDDMX		MSM8917_VDDMX
-#define MSM8937_VDDMX_AO	MSM8917_VDDMX_AO
-
-/* QM215 Power Domain Indexes */
-#define QM215_VDDCX		MSM8917_VDDCX
-#define QM215_VDDCX_AO		MSM8917_VDDCX_AO
-#define QM215_VDDCX_VFL		MSM8917_VDDCX_VFL
-#define QM215_VDDMX		MSM8917_VDDMX
-#define QM215_VDDMX_AO		MSM8917_VDDMX_AO
-
 /* MSM8953 Power Domain Indexes */
 #define MSM8953_VDDMD		0
 #define MSM8953_VDDMD_AO	1
@@ -99,14 +51,6 @@
 #define MSM8974_VDDGFX		3
 #define MSM8974_VDDGFX_VFC	4
 
-/* MSM8976 Power Domain Indexes */
-#define MSM8976_VDDCX		RPMPD_VDDCX
-#define MSM8976_VDDCX_AO	RPMPD_VDDCX_AO
-#define MSM8976_VDDCX_VFL	RPMPD_VDDCX_VFL
-#define MSM8976_VDDMX		RPMPD_VDDMX
-#define MSM8976_VDDMX_AO	RPMPD_VDDMX_AO
-#define MSM8976_VDDMX_VFL	RPMPD_VDDMX_VFL
-
 /* MSM8994 Power Domain Indexes */
 #define MSM8994_VDDCX		0
 #define MSM8994_VDDCX_AO	1
@@ -125,18 +69,6 @@
 #define MSM8996_VDDSSCX		5
 #define MSM8996_VDDSSCX_VFC	6
 
-/* MSM8998 Power Domain Indexes */
-#define MSM8998_VDDCX		RPMPD_VDDCX
-#define MSM8998_VDDCX_AO	RPMPD_VDDCX_AO
-#define MSM8998_VDDCX_VFL	RPMPD_VDDCX_VFL
-#define MSM8998_VDDMX		RPMPD_VDDMX
-#define MSM8998_VDDMX_AO	RPMPD_VDDMX_AO
-#define MSM8998_VDDMX_VFL	RPMPD_VDDMX_VFL
-#define MSM8998_SSCCX		RPMPD_SSCCX
-#define MSM8998_SSCCX_VFL	RPMPD_SSCCX_VFL
-#define MSM8998_SSCMX		RPMPD_SSCMX
-#define MSM8998_SSCMX_VFL	RPMPD_SSCMX_VFL
-
 /* QCM2290 Power Domains */
 #define QCM2290_VDDCX		0
 #define QCM2290_VDDCX_AO	1
@@ -156,18 +88,6 @@
 #define QCS404_LPIMX		5
 #define QCS404_LPIMX_VFL	6
 
-/* SDM660 Power Domains */
-#define SDM660_VDDCX		RPMPD_VDDCX
-#define SDM660_VDDCX_AO		RPMPD_VDDCX_AO
-#define SDM660_VDDCX_VFL	RPMPD_VDDCX_VFL
-#define SDM660_VDDMX		RPMPD_VDDMX
-#define SDM660_VDDMX_AO		RPMPD_VDDMX_AO
-#define SDM660_VDDMX_VFL	RPMPD_VDDMX_VFL
-#define SDM660_SSCCX		RPMPD_SSCCX
-#define SDM660_SSCCX_VFL	RPMPD_SSCCX_VFL
-#define SDM660_SSCMX		RPMPD_SSCMX
-#define SDM660_SSCMX_VFL	RPMPD_SSCMX_VFL
-
 /* SM6115 Power Domains */
 #define SM6115_VDDCX		0
 #define SM6115_VDDCX_AO		1
@@ -178,14 +98,6 @@
 #define SM6115_VDD_LPI_CX	6
 #define SM6115_VDD_LPI_MX	7
 
-/* SM6125 Power Domains */
-#define SM6125_VDDCX		RPMPD_VDDCX
-#define SM6125_VDDCX_AO		RPMPD_VDDCX_AO
-#define SM6125_VDDCX_VFL	RPMPD_VDDCX_VFL
-#define SM6125_VDDMX		RPMPD_VDDMX
-#define SM6125_VDDMX_AO		RPMPD_VDDMX_AO
-#define SM6125_VDDMX_VFL	RPMPD_VDDMX_VFL
-
 /* SM6375 Power Domain Indexes */
 #define SM6375_VDDCX		0
 #define SM6375_VDDCX_AO	1

-- 
2.39.5


