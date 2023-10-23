Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6901B7D2C04
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Oct 2023 09:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbjJWH5t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Oct 2023 03:57:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjJWH5t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Oct 2023 03:57:49 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FF0DA6;
        Mon, 23 Oct 2023 00:57:46 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39N7RVnO003055;
        Mon, 23 Oct 2023 07:57:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=c7KP3Zqe35K/UITXRHfu9WloJc95Zxfye7HE8lRDw1Q=;
 b=LO04fbQGS+K5kWBRwLwH/SFLsQWsCW3igdRmGALdXuURqWRcSqyt4BlB7BYMaC97ikzK
 uDSYPDrzPj7wMUpOwLdCxsFCqFkcWJruehMJg31XGB/2ncRDpOMa87kIqVfyZc/uugmK
 PK2GgbY7EXuN1OTTVxg40OetT1ZbSv6+o/WbC1NclUNw+G+PYSpR4hzF/Ijy7LrRSmhO
 oJaYBO0YF6HfUNZtzGBcAlQemjQaKHk5431stZMyYVLxu6odP5w9Jk85ts+56yDdP2xn
 W1auaDR0oTnlkqjv/o+1z1T1Er7WM6TeSst1Rp9nepACXMF8My+gnqx/mwfhcei4rwbp /g== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tv5ndue0r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 23 Oct 2023 07:57:36 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39N7vZET002897
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 23 Oct 2023 07:57:35 GMT
Received: from aiquny2-gv.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Mon, 23 Oct 2023 00:57:29 -0700
From:   Maria Yu <quic_aiquny@quicinc.com>
To:     <catalin.marinas@arm.com>, <will@kernel.org>, <arnd@arndb.de>
CC:     Maria Yu <quic_aiquny@quicinc.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH] arm64: module: PLT allowed even !RANDOM_BASE
Date:   Mon, 23 Oct 2023 15:57:14 +0800
Message-ID: <20231023075714.21672-1-quic_aiquny@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mFIgwhexEX5_sUkfBMghA9gGEGxsMVFw
X-Proofpoint-ORIG-GUID: mFIgwhexEX5_sUkfBMghA9gGEGxsMVFw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-23_06,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=430 bulkscore=0
 adultscore=0 impostorscore=0 mlxscore=0 phishscore=0 priorityscore=1501
 clxscore=1011 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310170001
 definitions=main-2310230069
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Module PLT feature can be enabled even when RANDOM_BASE is disabled.
Break BLT entry counts of relocation types will make module plt entry
allocation fail and finally exec format error for even correct and plt
allocation available modules.

Signed-off-by: Maria Yu <quic_aiquny@quicinc.com>
---
 arch/arm64/kernel/module-plts.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/kernel/module-plts.c b/arch/arm64/kernel/module-plts.c
index bd69a4e7cd60..21a67d52d7a0 100644
--- a/arch/arm64/kernel/module-plts.c
+++ b/arch/arm64/kernel/module-plts.c
@@ -167,9 +167,6 @@ static unsigned int count_plts(Elf64_Sym *syms, Elf64_Rela *rela, int num,
 		switch (ELF64_R_TYPE(rela[i].r_info)) {
 		case R_AARCH64_JUMP26:
 		case R_AARCH64_CALL26:
-			if (!IS_ENABLED(CONFIG_RANDOMIZE_BASE))
-				break;
-
 			/*
 			 * We only have to consider branch targets that resolve
 			 * to symbols that are defined in a different section.

base-commit: 05d3ef8bba77c1b5f98d941d8b2d4aeab8118ef1
-- 
2.17.1

