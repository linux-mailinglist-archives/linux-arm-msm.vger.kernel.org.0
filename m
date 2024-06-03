Return-Path: <linux-arm-msm+bounces-21511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 185158D8AA1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 21:58:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A34A1C236EA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 19:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDF1B13A878;
	Mon,  3 Jun 2024 19:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RaMqEoqy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9EB20ED;
	Mon,  3 Jun 2024 19:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717444700; cv=none; b=lhDRnTH2olMoXMOJmSa6dLu5PL9LCQdbKkFGhZV8xbUvQLq0NiJsVJHWRZKUSY4j8iodXiN3SdBr35evVzg+6sV43HWzUDXl0b8xufsbm56GK+Zxux72MrcvPUfLZylxuOGMiHFHSKpWlOesocuFIg+6Ae0StWlF19yRVJ7x4ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717444700; c=relaxed/simple;
	bh=Jv0wPuxLn2IQz24vgyugJvpXmcF7+iYuRiPa7kIs1QU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=nMW8piQSrU8WSuKqA2lSHdypTqs0xnpesA/XIzpoLDF8YqSiMiK6sx39n3/cHmHDwdQqSF57CrzHfo/x4lnrOgPJTS7/sHu6S53EdyjMYr3SwnoFfIip9FuwL+OlcYCNBLPu9u8j+p0US2xcgzeVGTyNEcEgTy7mMxB59LDOo70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RaMqEoqy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453CBSfW021825;
	Mon, 3 Jun 2024 19:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sIsUCiNIgn3qUYEH9v2KuI
	DucBsR0bH+FVI6oGRdiaE=; b=RaMqEoqyo+9XdqH85m6lKdFGCnsIL9M1aniytZ
	atHvKD3cpmCD8m1kAu+pzAjcvxLXlxMAk/CQC3oeRp96MkuKtALjYT3tJO8ord9U
	Jk+5GP3rLEucbDyIbR7TxZa09ywZlX8607o8aObrphse0wMLX+QNfFaKR90z4hVF
	whAXt5lLHjWFwfTk2gdzI+bL8NSWHfhjDrTcu4OBUARp16MCN0FiGIYwCVXLdZCQ
	LQ7OkmvaYSoEOHmra2GqA7DDk0k2QseQ7SyLlTwa485g21KxNm0a0H4hfE7pprTp
	OuiMhy530Wa5eRnH2+7ilXP2foDUOmQbfISc/OAiZR5w+Taw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw7dmup3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 19:58:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 453JwCMe020715
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 19:58:12 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 12:58:09 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Mon, 3 Jun 2024 12:58:08 -0700
Subject: [PATCH] misc: fastrpc: add missing MODULE_DESCRIPTION() macro
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240603-md-misc-fastrpc-v1-1-6e6d73d08315@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAE8gXmYC/x3MTQrCMBBA4auUWTsQ2xB/riIuknRiB0wsMyqF0
 rt3dPkt3ltBSZgUrt0KQl9WfjXD8dBBnmJ7EPJoht713gU3YB2xsmYsUd8yZ0zB++IvJwpnAqt
 mocLL/3i7m1NUwiSx5en3eXL7LFgtJoFt2wEpFXrAgAAAAA==
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari
	<amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, <kernel-janitors@vger.kernel.org>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: G-FtRymav2VaB9gHqOae5bPDvBcbP8ME
X-Proofpoint-GUID: G-FtRymav2VaB9gHqOae5bPDvBcbP8ME
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_16,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=975 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1011 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030161

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/misc/fastrpc.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/misc/fastrpc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 4c67e2c5a82e..e040cb5470c4 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2478,5 +2478,6 @@ static void fastrpc_exit(void)
 }
 module_exit(fastrpc_exit);
 
+MODULE_DESCRIPTION("Qualcomm FastRPC");
 MODULE_LICENSE("GPL v2");
 MODULE_IMPORT_NS(DMA_BUF);

---
base-commit: a693b9c95abd4947c2d06e05733de5d470ab6586
change-id: 20240603-md-misc-fastrpc-b644f497e68e


