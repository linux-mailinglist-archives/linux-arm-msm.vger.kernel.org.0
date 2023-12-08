Return-Path: <linux-arm-msm+bounces-4065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD0880AF6C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 23:08:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ABBCAB20AF6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 22:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A72C5915B;
	Fri,  8 Dec 2023 22:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GGCJsY3C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95E22171E;
	Fri,  8 Dec 2023 14:08:45 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B8M1qn5026906;
	Fri, 8 Dec 2023 22:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : to : cc; s=qcppdkim1;
 bh=B23GovXxqp99o/l4fZ6ai8goWBskAqHEnHVpvbkPoWE=;
 b=GGCJsY3CyuhTGLZUXlKGQo/1tTO/smZX8Rut95r8qZnXNYfuOMTcxdU9tmRsAdH9/YFr
 /DDrHSEQteGIZgf5auZQlPWpCCFAt+SbatKXqzL4kktNcAfdOkf+K3RABunYco36Swpw
 beR6aESXWjFSUivS55RWSIFeGRRne09oSuV1kaBOM1rR3fQcU3w6hCSwjoBXmWTkDfmT
 wV+DashsilIAkTt3hgTgX21NJE50U9I2F2e+P/xLUXZ0eTj0MVANTJWQXHZnMQGWZJ9n
 qdUJCoZPLhYiqVzqW35qiplZREfCHrVLn7VLiACnZsSWMUO0hK2+PMaw658hVz5CWza3 5w== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uuu1dt3cm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 22:08:31 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B8M8VlJ000510
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Dec 2023 22:08:31 GMT
Received: from [169.254.0.1] (10.49.16.6) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 8 Dec
 2023 14:08:30 -0800
From: Elliot Berman <quic_eberman@quicinc.com>
Date: Fri, 8 Dec 2023 14:08:29 -0800
Subject: [PATCH] clang-format: Add maple tree's for_each macros
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231208-clang-format-mt-for-each-v1-1-b4b73186b886@quicinc.com>
X-B4-Tracking: v=1; b=H4sIANyTc2UC/x2MSwqAMAwFryJZG7C1LvQq4iK0UQP+aEWE4t2N7
 mYG3suQOAon6IoMkS9Jsm8qpizAz7RNjBLUwVa2NrYy6BetOO5xpRPX8yNk8jN6CtQG54iaADo
 /Io9y/9f98DwvQ5nILmoAAAA=
To: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <llvm@lists.linux.dev>, Elliot Berman <quic_eberman@quicinc.com>
X-Mailer: b4 0.13-dev
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KzngbB3wzlZSq2qL5v8BZQAwCgEY3oet
X-Proofpoint-ORIG-GUID: KzngbB3wzlZSq2qL5v8BZQAwCgEY3oet
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_14,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 adultscore=0 clxscore=1011 bulkscore=0 mlxlogscore=569 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312080184

Add maple tree's for_each macros so clang-format operates correctly on
{mt,mas}_for_each.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 .clang-format | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.clang-format b/.clang-format
index 0bbb1991defe..54bab11d38f0 100644
--- a/.clang-format
+++ b/.clang-format
@@ -494,11 +494,13 @@ ForEachMacros:
   - 'map_for_each_metric'
   - 'maps__for_each_entry'
   - 'maps__for_each_entry_safe'
+  - 'mas_for_each'
   - 'mci_for_each_dimm'
   - 'media_device_for_each_entity'
   - 'media_device_for_each_intf'
   - 'media_device_for_each_link'
   - 'media_device_for_each_pad'
+  - 'mt_for_each'
   - 'msi_for_each_desc'
   - 'nanddev_io_for_each_page'
   - 'netdev_for_each_lower_dev'

---
base-commit: 5eda217cee887e595ba2265435862d585d399769
change-id: 20231201-clang-format-mt-for-each-cada9d44aa5d

Best regards,
-- 
Elliot Berman <quic_eberman@quicinc.com>


