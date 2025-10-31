Return-Path: <linux-arm-msm+bounces-79921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74379C25B3E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 15:54:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31ED11B222DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 14:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91DC28D83E;
	Fri, 31 Oct 2025 14:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NYMSkWvv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bhl/NQg4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6391B2749DC
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 14:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761921954; cv=none; b=BTU7gP0ZxaFdR50NbV0wWcUhH6b/IpEWpvzsSUq3I9ET1A2UrwfROJXynvmPW5RitohMs0p+MY3bGhB+HukdoQoGT226lYYD7Rpb7VpvO1pf4SpTMIf2jjIXvpZRsCd0CP9nFB2x/O3K9kPSONFxE5jUOgLqq+XKglQ08+Vl+to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761921954; c=relaxed/simple;
	bh=/qKqilG7VpG46YajDiI8SceWZnK6kS0A7BvPvv5Clf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YKjNZ19EjfWTxbFCCgvPC6QwwlH7bMKsalK3K+ELuaN6y0XJ8Xorp/cegZwwqCJDu/P/+H7PI7s0l1lSZSnSNl4cBO+iSMhnSZgJVhNyHTIWfMeZ46fXAphgyJZa1yN1k3Lv8xczbvcWEo3+0+/fL1T3iM7P3CN9RbFpH7uTq6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NYMSkWvv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bhl/NQg4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V8Twfg899073
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 14:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	grCV8vq9vRvuhd38U9eRM28bcUeCtT0/WIwuizL0Bxk=; b=NYMSkWvvAFTeyy/b
	hOsWSTUvMSlPNXu/9xR044qpQEQvfiqOD5LnrRe1ydqlNm+777n4ZErtPXAhjYnw
	F+08sOF2ysIp0sXS4j8bSmO7Qj4IaPPC21JNeHslIlsnyQK5ylBNWJMv/uV1oq2i
	MmUOqhoAhPB28ZBlPp6UVvixQezgyap1TJALhn56PRELOQGlFnYeN1CNw5eOroeQ
	7enrLRtKxEoJQ5DsI6+Lx/2abaUteXm8fJsCFsREF2sULZyJtiHU691kL1H3p5sX
	wlQ6BOds1+xwoYE8NFWIDNjb8F4a4U+D1Wei1Y3nl7XZh+wD/8jhqIVqCCbwNDn3
	3Z9wXw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4gb22d24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 14:45:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ecf4540bb6so60124741cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 07:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761921946; x=1762526746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=grCV8vq9vRvuhd38U9eRM28bcUeCtT0/WIwuizL0Bxk=;
        b=bhl/NQg45l0WY/JJc5zgsYbUQB/skayPIfSFjDxZZkwD3aPWrSAQVb3GfG/X1b8w8U
         yUFELLCehpp0RAGGJKimPhK0EqQu1ztK/qb/KBEtNAHUbqXSacyie0UJBxVbLKE1e9Cn
         2TtvIdgQo7/t/qTYjvolaPBD0cynX16Z9GHBCDQ5BxBWQ2nt3HOHAdYXvzboVC7PKuUl
         EgrlC8yRtrLjU2RZVaTSAKVl3v/Ec+F4CHFYHGjny2Byfu7A9q6ntGyaVLLE0qchR7b0
         ekV8KqrnskUHUssChvxeX+iGzBjVNlFbkCE8Ff+yos4dgx7MjkhAo1WF3IwtcvBhqCsV
         U8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761921946; x=1762526746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=grCV8vq9vRvuhd38U9eRM28bcUeCtT0/WIwuizL0Bxk=;
        b=wrxZyUc1sVBYKsXiOvTj1Pv42nyadfGTVVrdef0WjoqzlhEp4cSspXqzoOE8vqEH1S
         9FTqFTH2yPyO+xE+JYiFuTcSqzi7bxCvFsVvH+BYFlg2QY3qbSMJJoG+CL64PDguDMEE
         DBEMkcXO8sEpL2+DzgUd+ZWdeshI00KpLZsEbHZIBrrsrlnGAw6gK8q6nkyK3mj4mSs5
         Qgi9rfFSSTbXyEt+0h+xrrQW7TY/OW4b78ki/S3N2VBiUOATxsaFAKNwgkC4BuA9Z5r7
         ehl17Qm/V5jM1yaKYoiADb0tDIJl0ZD1s49ZS/tea0oRxlEuo+6dzdWaUwGupba+OuCD
         3m2A==
X-Gm-Message-State: AOJu0YzYxreUHGZZzWl4A7la32oo6X7jvgS8GSx+De/8S1XgbhP7A5Ny
	YiMhM+Dz7ju2H5RPANi3xfk1XqMxtKNUXB6FCl6Y9qbsJER+jCBgWBeek3XTG9FxAwqsHxZN5NN
	cs6lFijn7t+tDgUPaT5wJzysGwzRHpj23xcxyflp+IV+ik86yjj+B9Drw26sd4s0A102p
X-Gm-Gg: ASbGnctT0q43AovroWqxOihDWHf3Zn2eubJRtXH54ry+zB+7MMuuGtIRgfjb98rAstc
	YMLBtJ0A7EFlmQPKv+kfgSHczA5ChrWTc6/P10GKnOBoz05DxctYmQK6X1dDPoZcaqpB6dR02oa
	KCVtPMSWs03fzdgDABqo0GqCSaZ+8/49hbRxgjTk8c9V29ekY1hGXJiAUN9/PKtZvTcgDTjCO0b
	7+doB9o+khi/Xa9JwQp9K+B5M2EXrDrc8qoENbwN50Q1/lCoKxG7Yi3QSadAXAKoDY2z68W2DVD
	lgLKwQMntRXjLoyW3YjWw1NuZo2W/b7fAzZja03uBkH/jwLbpMg0WL4NbubLkf81vLfIboHL3aP
	Xx6oKyU4kLbAJLdVmtD2uX+VbdalzXdsSY4NhQ9VcbOrG+Rlxkm6ohQFZz53+dzMltvmQgE7ZOb
	rFtKeUoZSN3HPR
X-Received: by 2002:a05:622a:4c8f:b0:4ec:fba9:e0fe with SMTP id d75a77b69052e-4ed310db742mr50187451cf.55.1761921945644;
        Fri, 31 Oct 2025 07:45:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBTLF8CyF9UaHUa/RP64f0SvQr0luPo0R7KHv62M39GuEHyHKLTlSdZGZVw+tQGdwq3tryUA==
X-Received: by 2002:a05:622a:4c8f:b0:4ec:fba9:e0fe with SMTP id d75a77b69052e-4ed310db742mr50186851cf.55.1761921945038;
        Fri, 31 Oct 2025 07:45:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5941f5bc218sm541405e87.93.2025.10.31.07.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 07:45:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 16:45:26 +0200
Subject: [PATCH v3 10/25] interconnect: qcom: qdu1000: convert to dynamic
 IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-rework-icc-v3-10-0575304c9624@oss.qualcomm.com>
References: <20251031-rework-icc-v3-0-0575304c9624@oss.qualcomm.com>
In-Reply-To: <20251031-rework-icc-v3-0-0575304c9624@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=29988;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/qKqilG7VpG46YajDiI8SceWZnK6kS0A7BvPvv5Clf0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpBMuDZZWOlxmyoBuqVY7tm44QON0/gWOoHDAyO
 21E7j2v65SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaQTLgwAKCRCLPIo+Aiko
 1dRvB/9sfAv73/PwgI7jvojg4mqQ+CrPIqWEFiic2VrxIG9S3KKaTMTfPHahQEDSpVXKWJjN5kT
 ssz5i4//tNyVolSADCl4HKnIry2KQvTI/s77YdnaK3tdbBAOSqwK0WcG2EXelV/5NQe81pduX/m
 IzGvtTrspgoxgZl4Z8XaVpXpZnw7/iIyQPmMCY9xsFaVZoHK1sMT00D8TLo4Tt6PJPLCQOd7Vy7
 ow60rma/Hw7pH66jXUDS53tEUJIqx00eyBs6QxQ9xNe0gLyZHZQn/S/mBny1d4cepKLrHyuV2AC
 5p8K/wOUQLmdtk3NFldfCSyaE9tMenXYIhRpDZ2w8g5Adj1P
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=efswvrEH c=1 sm=1 tr=0 ts=6904cb9a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=86aMue_Z6Yzeu5b6tqIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEzMyBTYWx0ZWRfX/aeqcblbFAap
 NE0JWFxatauj/JuKdWvxYQmRgq7qxQg/KDI83m0kIAReOY96NSnmsaoRf28NxaB5wxWKDE8j2/y
 RuKvLZIiSuDfgQWvQ9xoRANxzvSbqdczc9Se8S5nixYlZ2qVmbknV9faBa6Jn9dBFb0DrGD20Oc
 tanVVj+LkINFYqfyv5LWaSrokOS2vEkAEhEFfUn9JolnUOM08qRc9/Krtfs/VUtDa4ScA3pMDIy
 abajrcO7Piv36Gv0SXZeU/YOjJQ/YLhXi2NxCKPJlTEZfC1iCq3r29KJ5/orfvSGtzOXzIJZ6IM
 ACTC8S/KNlO7BaCDmJyu8LARNvdrefMLBwzdT7gHqE0q6+qfY5RGr9JnN0XCoLVhl59jX61oblE
 c2+VW3LmhbWk6q3i0zmkOzsD1Vt5YA==
X-Proofpoint-GUID: Ekdj6CTSfK5bJCb9ygJidSJAbu6shd4K
X-Proofpoint-ORIG-GUID: Ekdj6CTSfK5bJCb9ygJidSJAbu6shd4K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310133

Stop using fixed and IDs and covert the platform to use dynamic IDs for
the interconnect. This gives more flexibility and also allows us to drop
the .num_links member, saving from possible errors related to it being
not set or set incorrectly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/interconnect/qcom/qdu1000.c | 352 ++++++++++++++++--------------------
 drivers/interconnect/qcom/qdu1000.h |  95 ----------
 2 files changed, 155 insertions(+), 292 deletions(-)

diff --git a/drivers/interconnect/qcom/qdu1000.c b/drivers/interconnect/qcom/qdu1000.c
index a7392eb73d4a990ec65e9d55f3d0429d05270802..4de0f17e4c57f77e9bd6f8bc7108359c4370c396 100644
--- a/drivers/interconnect/qcom/qdu1000.c
+++ b/drivers/interconnect/qcom/qdu1000.c
@@ -15,756 +15,710 @@
 #include "bcm-voter.h"
 #include "icc-common.h"
 #include "icc-rpmh.h"
-#include "qdu1000.h"
+
+static struct qcom_icc_node qup0_core_master;
+static struct qcom_icc_node qup1_core_master;
+static struct qcom_icc_node alm_sys_tcu;
+static struct qcom_icc_node chm_apps;
+static struct qcom_icc_node qnm_ecpri_dma;
+static struct qcom_icc_node qnm_fec_2_gemnoc;
+static struct qcom_icc_node qnm_pcie;
+static struct qcom_icc_node qnm_snoc_gc;
+static struct qcom_icc_node qnm_snoc_sf;
+static struct qcom_icc_node qxm_mdsp;
+static struct qcom_icc_node llcc_mc;
+static struct qcom_icc_node qhm_gic;
+static struct qcom_icc_node qhm_qdss_bam;
+static struct qcom_icc_node qhm_qpic;
+static struct qcom_icc_node qhm_qspi;
+static struct qcom_icc_node qhm_qup0;
+static struct qcom_icc_node qhm_qup1;
+static struct qcom_icc_node qhm_system_noc_cfg;
+static struct qcom_icc_node qnm_aggre_noc;
+static struct qcom_icc_node qnm_aggre_noc_gsi;
+static struct qcom_icc_node qnm_gemnoc_cnoc;
+static struct qcom_icc_node qnm_gemnoc_modem_slave;
+static struct qcom_icc_node qnm_gemnoc_pcie;
+static struct qcom_icc_node qxm_crypto;
+static struct qcom_icc_node qxm_ecpri_gsi;
+static struct qcom_icc_node qxm_pimem;
+static struct qcom_icc_node xm_ecpri_dma;
+static struct qcom_icc_node xm_gic;
+static struct qcom_icc_node xm_pcie;
+static struct qcom_icc_node xm_qdss_etr0;
+static struct qcom_icc_node xm_qdss_etr1;
+static struct qcom_icc_node xm_sdc;
+static struct qcom_icc_node xm_usb3;
+static struct qcom_icc_node qup0_core_slave;
+static struct qcom_icc_node qup1_core_slave;
+static struct qcom_icc_node qns_gem_noc_cnoc;
+static struct qcom_icc_node qns_llcc;
+static struct qcom_icc_node qns_modem_slave;
+static struct qcom_icc_node qns_pcie;
+static struct qcom_icc_node ebi;
+static struct qcom_icc_node qhs_ahb2phy0_south;
+static struct qcom_icc_node qhs_ahb2phy1_north;
+static struct qcom_icc_node qhs_ahb2phy2_east;
+static struct qcom_icc_node qhs_aoss;
+static struct qcom_icc_node qhs_clk_ctl;
+static struct qcom_icc_node qhs_cpr_cx;
+static struct qcom_icc_node qhs_cpr_mx;
+static struct qcom_icc_node qhs_crypto_cfg;
+static struct qcom_icc_node qhs_ecpri_cfg;
+static struct qcom_icc_node qhs_imem_cfg;
+static struct qcom_icc_node qhs_ipc_router;
+static struct qcom_icc_node qhs_mss_cfg;
+static struct qcom_icc_node qhs_pcie_cfg;
+static struct qcom_icc_node qhs_pdm;
+static struct qcom_icc_node qhs_pimem_cfg;
+static struct qcom_icc_node qhs_prng;
+static struct qcom_icc_node qhs_qdss_cfg;
+static struct qcom_icc_node qhs_qpic;
+static struct qcom_icc_node qhs_qspi;
+static struct qcom_icc_node qhs_qup0;
+static struct qcom_icc_node qhs_qup1;
+static struct qcom_icc_node qhs_sdc2;
+static struct qcom_icc_node qhs_smbus_cfg;
+static struct qcom_icc_node qhs_system_noc_cfg;
+static struct qcom_icc_node qhs_tcsr;
+static struct qcom_icc_node qhs_tlmm;
+static struct qcom_icc_node qhs_tme_cfg;
+static struct qcom_icc_node qhs_tsc_cfg;
+static struct qcom_icc_node qhs_usb3;
+static struct qcom_icc_node qhs_vsense_ctrl_cfg;
+static struct qcom_icc_node qns_a1noc_snoc;
+static struct qcom_icc_node qns_anoc_snoc_gsi;
+static struct qcom_icc_node qns_ddrss_cfg;
+static struct qcom_icc_node qns_ecpri_gemnoc;
+static struct qcom_icc_node qns_gemnoc_gc;
+static struct qcom_icc_node qns_gemnoc_sf;
+static struct qcom_icc_node qns_modem;
+static struct qcom_icc_node qns_pcie_gemnoc;
+static struct qcom_icc_node qxs_imem;
+static struct qcom_icc_node qxs_pimem;
+static struct qcom_icc_node srvc_system_noc;
+static struct qcom_icc_node xs_ethernet_ss;
+static struct qcom_icc_node xs_pcie;
+static struct qcom_icc_node xs_qdss_stm;
+static struct qcom_icc_node xs_sys_tcu_cfg;
 
 static struct qcom_icc_node qup0_core_master = {
 	.name = "qup0_core_master",
-	.id = QDU1000_MASTER_QUP_CORE_0,
 	.channels = 1,
 	.buswidth = 4,
 	.num_links = 1,
-	.links = { QDU1000_SLAVE_QUP_CORE_0 },
+	.link_nodes = { &qup0_core_slave },
 };
 
 static struct qcom_icc_node qup1_core_master = {
 	.name = "qup1_core_master",
-	.id = QDU1000_MASTER_QUP_CORE_1,
 	.channels = 1,
 	.buswidth = 4,
 	.num_links = 1,
-	.links = { QDU1000_SLAVE_QUP_CORE_1 },
+	.link_nodes = { &qup1_core_slave },
 };
 
 static struct qcom_icc_node alm_sys_tcu = {
 	.name = "alm_sys_tcu",
-	.id = QDU1000_MASTER_SYS_TCU,
 	.channels = 1,
 	.buswidth = 8,
 	.num_links = 2,
-	.links = { QDU1000_SLAVE_GEM_NOC_CNOC, QDU1000_SLAVE_LLCC },
+	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
 };
 
 static struct qcom_icc_node chm_apps = {
 	.name = "chm_apps",
-	.id = QDU1000_MASTER_APPSS_PROC,
 	.channels = 1,
 	.buswidth = 16,
 	.num_links = 4,
-	.links = { QDU1000_SLAVE_GEM_NOC_CNOC, QDU1000_SLAVE_LLCC,
-		   QDU1000_SLAVE_GEMNOC_MODEM_CNOC, QDU1000_SLAVE_MEM_NOC_PCIE_SNOC
-	},
+	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc,
+			&qns_modem_slave, &qns_pcie },
 };
 
 static struct qcom_icc_node qnm_ecpri_dma = {
 	.name = "qnm_ecpri_dma",
-	.id = QDU1000_MASTER_GEMNOC_ECPRI_DMA,
 	.channels = 2,
 	.buswidth = 32,
 	.num_links = 2,
-	.links = { QDU1000_SLAVE_GEM_NOC_CNOC, QDU1000_SLAVE_LLCC },
+	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
 };
 
 static struct qcom_icc_node qnm_fec_2_gemnoc = {
 	.name = "qnm_fec_2_gemnoc",
-	.id = QDU1000_MASTER_FEC_2_GEMNOC,
 	.channels = 2,
 	.buswidth = 32,
 	.num_links = 2,
-	.links = { QDU1000_SLAVE_GEM_NOC_CNOC, QDU1000_SLAVE_LLCC },
+	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
 };
 
 static struct qcom_icc_node qnm_pcie = {
 	.name = "qnm_pcie",
-	.id = QDU1000_MASTER_ANOC_PCIE_GEM_NOC,
 	.channels = 1,
 	.buswidth = 64,
 	.num_links = 3,
-	.links = { QDU1000_SLAVE_GEM_NOC_CNOC, QDU1000_SLAVE_LLCC,
-		   QDU1000_SLAVE_GEMNOC_MODEM_CNOC
-	},
+	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc,
+			&qns_modem_slave },
 };
 
 static struct qcom_icc_node qnm_snoc_gc = {
 	.name = "qnm_snoc_gc",
-	.id = QDU1000_MASTER_SNOC_GC_MEM_NOC,
 	.channels = 1,
 	.buswidth = 8,
 	.num_links = 1,
-	.links = { QDU1000_SLAVE_LLCC },
+	.link_nodes = { &qns_llcc },
 };
 
 static struct qcom_icc_node qnm_snoc_sf = {
 	.name = "qnm_snoc_sf",
-	.id = QDU1000_MASTER_SNOC_SF_MEM_NOC,
 	.channels = 1,
 	.buswidth = 16,
 	.num_links = 4,
-	.links = { QDU1000_SLAVE_GEM_NOC_CNOC, QDU1000_SLAVE_LLCC,
-		   QDU1000_SLAVE_GEMNOC_MODEM_CNOC, QDU1000_SLAVE_MEM_NOC_PCIE_SNOC
-	},
+	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc,
+			&qns_modem_slave, &qns_pcie },
 };
 
 static struct qcom_icc_node qxm_mdsp = {
 	.name = "qxm_mdsp",
-	.id = QDU1000_MASTER_MSS_PROC,
 	.channels = 1,
 	.buswidth = 16,
 	.num_links = 3,
-	.links = { QDU1000_SLAVE_GEM_NOC_CNOC, QDU1000_SLAVE_LLCC,
-		   QDU1000_SLAVE_MEM_NOC_PCIE_SNOC
-	},
+	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc,
+			&qns_pcie },
 };
 
 static struct qcom_icc_node llcc_mc = {
 	.name = "llcc_mc",
-	.id = QDU1000_MASTER_LLCC,
 	.channels = 8,
 	.buswidth = 4,
 	.num_links = 1,
-	.links = { QDU1000_SLAVE_EBI1 },
+	.link_nodes = { &ebi },
 };
 
 static struct qcom_icc_node qhm_gic = {
 	.name = "qhm_gic",
-	.id = QDU1000_MASTER_GIC_AHB,
 	.channels = 1,
 	.buswidth = 4,
 	.num_links = 1,
-	.links = { QDU1000_SLAVE_SNOC_GEM_NOC_SF },
+	.link_nodes = { &qns_gemnoc_sf },
 };
 
 static struct qcom_icc_node qhm_qdss_bam = {
 	.name = "qhm_qdss_bam",
-	.id = QDU1000_MASTER_QDSS_BAM,
 	.channels = 1,
 	.buswidth = 4,
 	.num_links = 1,
-	.links = { QDU1000_SLAVE_SNOC_GEM_NOC_SF },
+	.link_nodes = { &qns_gemnoc_sf },
 };
 
 static struct qcom_icc_node qhm_qpic = {
 	.name = "qhm_qpic",
-	.id = QDU1000_MASTER_QPIC,
 	.channels = 1,
 	.buswidth = 4,
 	.num_links = 1,
-	.links = { QDU1000_SLAVE_A1NOC_SNOC },
+	.link_nodes = { &qns_a1noc_snoc },
 };
 
 static struct qcom_icc_node qhm_qspi = {
 	.name = "qhm_qspi",
-	.id = QDU1000_MASTER_QSPI_0,
 	.channels = 1,
 	.buswidth = 4,
 	.num_links = 1,
-	.links = { QDU1000_SLAVE_A1NOC_SNOC },
+	.link_nodes = { &qns_a1noc_snoc },
 };
 
 static struct qcom_icc_node qhm_qup0 = {
 	.name = "qhm_qup0",
-	.id = QDU1000_MASTER_QUP_0,
 	.channels = 1,
 	.buswidth = 4,
 	.num_links = 1,
-	.links = { QDU1000_SLAVE_A1NOC_SNOC },
+	.link_nodes = { &qns_a1noc_snoc },
 };
 
 static struct qcom_icc_node qhm_qup1 = {
 	.name = "qhm_qup1",
-	.id = QDU1000_MASTER_QUP_1,
 	.channels = 1,
 	.buswidth = 4,
 	.num_links = 1,
-	.links = { QDU1000_SLAVE_A1NOC_SNOC },
+	.link_nodes = { &qns_a1noc_snoc },
 };
 
 static struct qcom_icc_node qhm_system_noc_cfg = {
 	.name = "qhm_system_noc_cfg",
-	.id = QDU1000_MASTER_SNOC_CFG,
 	.channels = 1,
 	.buswidth = 4,
 	.num_links = 1,
-	.links = { QDU1000_SLAVE_SERVICE_SNOC },
+	.link_nodes = { &srvc_system_noc },
 };
 
 static struct qcom_icc_node qnm_aggre_noc = {
 	.name = "qnm_aggre_noc",
-	.id = QDU1000_MASTER_ANOC_SNOC,
 	.channels = 1,
 	.buswidth = 8,
 	.num_links = 1,
-	.links = { QDU1000_SLAVE_SNOC_GEM_NOC_SF },
+	.link_nodes = { &qns_gemnoc_sf },
 };
 
 static struct qcom_icc_node qnm_aggre_noc_gsi = {
 	.name = "qnm_aggre_noc_gsi",
-	.id = QDU1000_MASTER_ANOC_GSI,
 	.channels = 1,
 	.buswidth = 8,
 	.num_links = 1,
-	.links = { QDU1000_SLAVE_SNOC_GEM_NOC_GC },
+	.link_nodes = { &qns_gemnoc_gc },
 };
 
 static struct qcom_icc_node qnm_gemnoc_cnoc = {
 	.name = "qnm_gemnoc_cnoc",
-	.id = QDU1000_MASTER_GEM_NOC_CNOC,
 	.channels = 1,
 	.buswidth = 16,
 	.num_links = 36,
-	.links = { QDU1000_SLAVE_AHB2PHY_SOUTH, QDU1000_SLAVE_AHB2PHY_NORTH,
-		   QDU1000_SLAVE_AHB2PHY_EAST, QDU1000_SLAVE_AOSS,
-		   QDU1000_SLAVE_CLK_CTL, QDU1000_SLAVE_RBCPR_CX_CFG,
-		   QDU1000_SLAVE_RBCPR_MX_CFG, QDU1000_SLAVE_CRYPTO_0_CFG,
-		   QDU1000_SLAVE_ECPRI_CFG, QDU1000_SLAVE_IMEM_CFG,
-		   QDU1000_SLAVE_IPC_ROUTER_CFG, QDU1000_SLAVE_CNOC_MSS,
-		   QDU1000_SLAVE_PCIE_CFG, QDU1000_SLAVE_PDM,
-		   QDU1000_SLAVE_PIMEM_CFG, QDU1000_SLAVE_PRNG,
-		   QDU1000_SLAVE_QDSS_CFG, QDU1000_SLAVE_QPIC,
-		   QDU1000_SLAVE_QSPI_0, QDU1000_SLAVE_QUP_0,
-		   QDU1000_SLAVE_QUP_1, QDU1000_SLAVE_SDCC_2,
-		   QDU1000_SLAVE_SMBUS_CFG, QDU1000_SLAVE_SNOC_CFG,
-		   QDU1000_SLAVE_TCSR, QDU1000_SLAVE_TLMM,
-		   QDU1000_SLAVE_TME_CFG, QDU1000_SLAVE_TSC_CFG,
-		   QDU1000_SLAVE_USB3_0, QDU1000_SLAVE_VSENSE_CTRL_CFG,
-		   QDU1000_SLAVE_DDRSS_CFG, QDU1000_SLAVE_IMEM,
-		   QDU1000_SLAVE_PIMEM, QDU1000_SLAVE_ETHERNET_SS,
-		   QDU1000_SLAVE_QDSS_STM, QDU1000_SLAVE_TCU
-	},
+	.link_nodes = { &qhs_ahb2phy0_south, &qhs_ahb2phy1_north,
+			&qhs_ahb2phy2_east, &qhs_aoss,
+			&qhs_clk_ctl, &qhs_cpr_cx,
+			&qhs_cpr_mx, &qhs_crypto_cfg,
+			&qhs_ecpri_cfg, &qhs_imem_cfg,
+			&qhs_ipc_router, &qhs_mss_cfg,
+			&qhs_pcie_cfg, &qhs_pdm,
+			&qhs_pimem_cfg, &qhs_prng,
+			&qhs_qdss_cfg, &qhs_qpic,
+			&qhs_qspi, &qhs_qup0,
+			&qhs_qup1, &qhs_sdc2,
+			&qhs_smbus_cfg, &qhs_system_noc_cfg,
+			&qhs_tcsr, &qhs_tlmm,
+			&qhs_tme_cfg, &qhs_tsc_cfg,
+			&qhs_usb3, &qhs_vsense_ctrl_cfg,
+			&qns_ddrss_cfg, &qxs_imem,
+			&qxs_pimem, &xs_ethernet_ss,
+			&xs_qdss_stm, &xs_sys_tcu_cfg },
 };
 
 static struct qcom_icc_node qnm_gemnoc_modem_slave = {
 	.name = "qnm_gemnoc_modem_slave",
-	.id = QDU1000_MASTER_GEMNOC_MODEM_CNOC,
 	.channels = 1,
 	.buswidth = 16,
 	.num_links = 1,
-	.links = { QDU1000_SLAVE_MODEM_OFFLINE },
+	.link_nodes = { &qns_modem },
 };
 
 static struct qcom_icc_node qnm_gemnoc_pcie = {
 	.name = "qnm_gemnoc_pcie",
-	.id = QDU1000_MASTER_GEM_NOC_PCIE_SNOC,
 	.channels = 1,
 	.buswidth = 16,
 	.num_links = 1,
-	.links = { QDU1000_SLAVE_PCIE_0 },
+	.link_nodes = { &xs_pcie },
 };
 
 static struct qcom_icc_node qxm_crypto = {
 	.name = "qxm_crypto",
-	.id = QDU1000_MASTER_CRYPTO,
 	.channels = 1,
 	.buswidth = 8,
 	.num_links = 1,
-	.links = { QDU1000_SLAVE_A1NOC_SNOC },
+	.link_nodes = { &qns_a1noc_snoc },
 };
 
 static struct qcom_icc_node qxm_ecpri_gsi = {
 	.name = "qxm_ecpri_gsi",
-	.id = QDU1000_MASTER_ECPRI_GSI,
 	.channels = 1,
 	.buswidth = 8,
 	.num_links = 2,
-	.links = { QDU1000_SLAVE_ANOC_SNOC_GSI, QDU1000_SLAVE_PCIE_0 },
+	.link_nodes = { &qns_anoc_snoc_gsi, &xs_pcie },
 };
 
 static struct qcom_icc_node qxm_pimem = {
 	.name = "qxm_pimem",
-	.id = QDU1000_MASTER_PIMEM,
 	.channels = 1,
 	.buswidth = 8,
 	.num_links = 1,
-	.links = { QDU1000_SLAVE_SNOC_GEM_NOC_GC },
+	.link_nodes = { &qns_gemnoc_gc },
 };
 
 static struct qcom_icc_node xm_ecpri_dma = {
 	.name = "xm_ecpri_dma",
-	.id = QDU1000_MASTER_SNOC_ECPRI_DMA,
 	.channels = 2,
 	.buswidth = 32,
 	.num_links = 2,
-	.links = { QDU1000_SLAVE_ECPRI_GEMNOC, QDU1000_SLAVE_PCIE_0 },
+	.link_nodes = { &qns_ecpri_gemnoc, &xs_pcie },
 };
 
 static struct qcom_icc_node xm_gic = {
 	.name = "xm_gic",
-	.id = QDU1000_MASTER_GIC,
 	.channels = 1,
 	.buswidth = 8,
 	.num_links = 1,
-	.links = { QDU1000_SLAVE_SNOC_GEM_NOC_GC },
+	.link_nodes = { &qns_gemnoc_gc },
 };
 
 static struct qcom_icc_node xm_pcie = {
 	.name = "xm_pcie",
-	.id = QDU1000_MASTER_PCIE,
 	.channels = 1,
 	.buswidth = 64,
 	.num_links = 1,
-	.links = { QDU1000_SLAVE_ANOC_PCIE_GEM_NOC },
+	.link_nodes = { &qns_pcie_gemnoc },
 };
 
 static struct qcom_icc_node xm_qdss_etr0 = {
 	.name = "xm_qdss_etr0",
-	.id = QDU1000_MASTER_QDSS_ETR,
 	.channels = 1,
 	.buswidth = 8,
 	.num_links = 1,
-	.links = { QDU1000_SLAVE_SNOC_GEM_NOC_SF },
+	.link_nodes = { &qns_gemnoc_sf },
 };
 
 static struct qcom_icc_node xm_qdss_etr1 = {
 	.name = "xm_qdss_etr1",
-	.id = QDU1000_MASTER_QDSS_ETR_1,
 	.channels = 1,
 	.buswidth = 8,
 	.num_links = 1,
-	.links = { QDU1000_SLAVE_SNOC_GEM_NOC_SF },
+	.link_nodes = { &qns_gemnoc_sf },
 };
 
 static struct qcom_icc_node xm_sdc = {
 	.name = "xm_sdc",
-	.id = QDU1000_MASTER_SDCC_1,
 	.channels = 1,
 	.buswidth = 8,
 	.num_links = 1,
-	.links = { QDU1000_SLAVE_A1NOC_SNOC },
+	.link_nodes = { &qns_a1noc_snoc },
 };
 
 static struct qcom_icc_node xm_usb3 = {
 	.name = "xm_usb3",
-	.id = QDU1000_MASTER_USB3,
 	.channels = 1,
 	.buswidth = 8,
 	.num_links = 1,
-	.links = { QDU1000_SLAVE_A1NOC_SNOC },
+	.link_nodes = { &qns_a1noc_snoc },
 };
 
 static struct qcom_icc_node qup0_core_slave = {
 	.name = "qup0_core_slave",
-	.id = QDU1000_SLAVE_QUP_CORE_0,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qup1_core_slave = {
 	.name = "qup1_core_slave",
-	.id = QDU1000_SLAVE_QUP_CORE_1,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qns_gem_noc_cnoc = {
 	.name = "qns_gem_noc_cnoc",
-	.id = QDU1000_SLAVE_GEM_NOC_CNOC,
 	.channels = 1,
 	.buswidth = 16,
 	.num_links = 1,
-	.links = { QDU1000_MASTER_GEM_NOC_CNOC },
+	.link_nodes = { &qnm_gemnoc_cnoc },
 };
 
 static struct qcom_icc_node qns_llcc = {
 	.name = "qns_llcc",
-	.id = QDU1000_SLAVE_LLCC,
 	.channels = 8,
 	.buswidth = 16,
 	.num_links = 1,
-	.links = { QDU1000_MASTER_LLCC },
+	.link_nodes = { &llcc_mc },
 };
 
 static struct qcom_icc_node qns_modem_slave = {
 	.name = "qns_modem_slave",
-	.id = QDU1000_SLAVE_GEMNOC_MODEM_CNOC,
 	.channels = 1,
 	.buswidth = 16,
 	.num_links = 1,
-	.links = { QDU1000_MASTER_GEMNOC_MODEM_CNOC },
+	.link_nodes = { &qnm_gemnoc_modem_slave },
 };
 
 static struct qcom_icc_node qns_pcie = {
 	.name = "qns_pcie",
-	.id = QDU1000_SLAVE_MEM_NOC_PCIE_SNOC,
 	.channels = 1,
 	.buswidth = 16,
 	.num_links = 1,
-	.links = { QDU1000_MASTER_GEM_NOC_PCIE_SNOC },
+	.link_nodes = { &qnm_gemnoc_pcie },
 };
 
 static struct qcom_icc_node ebi = {
 	.name = "ebi",
-	.id = QDU1000_SLAVE_EBI1,
 	.channels = 8,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qhs_ahb2phy0_south = {
 	.name = "qhs_ahb2phy0_south",
-	.id = QDU1000_SLAVE_AHB2PHY_SOUTH,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qhs_ahb2phy1_north = {
 	.name = "qhs_ahb2phy1_north",
-	.id = QDU1000_SLAVE_AHB2PHY_NORTH,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qhs_ahb2phy2_east = {
 	.name = "qhs_ahb2phy2_east",
-	.id = QDU1000_SLAVE_AHB2PHY_EAST,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qhs_aoss = {
 	.name = "qhs_aoss",
-	.id = QDU1000_SLAVE_AOSS,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qhs_clk_ctl = {
 	.name = "qhs_clk_ctl",
-	.id = QDU1000_SLAVE_CLK_CTL,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qhs_cpr_cx = {
 	.name = "qhs_cpr_cx",
-	.id = QDU1000_SLAVE_RBCPR_CX_CFG,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qhs_cpr_mx = {
 	.name = "qhs_cpr_mx",
-	.id = QDU1000_SLAVE_RBCPR_MX_CFG,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qhs_crypto_cfg = {
 	.name = "qhs_crypto_cfg",
-	.id = QDU1000_SLAVE_CRYPTO_0_CFG,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qhs_ecpri_cfg = {
 	.name = "qhs_ecpri_cfg",
-	.id = QDU1000_SLAVE_ECPRI_CFG,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qhs_imem_cfg = {
 	.name = "qhs_imem_cfg",
-	.id = QDU1000_SLAVE_IMEM_CFG,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qhs_ipc_router = {
 	.name = "qhs_ipc_router",
-	.id = QDU1000_SLAVE_IPC_ROUTER_CFG,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qhs_mss_cfg = {
 	.name = "qhs_mss_cfg",
-	.id = QDU1000_SLAVE_CNOC_MSS,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qhs_pcie_cfg = {
 	.name = "qhs_pcie_cfg",
-	.id = QDU1000_SLAVE_PCIE_CFG,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qhs_pdm = {
 	.name = "qhs_pdm",
-	.id = QDU1000_SLAVE_PDM,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qhs_pimem_cfg = {
 	.name = "qhs_pimem_cfg",
-	.id = QDU1000_SLAVE_PIMEM_CFG,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qhs_prng = {
 	.name = "qhs_prng",
-	.id = QDU1000_SLAVE_PRNG,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qhs_qdss_cfg = {
 	.name = "qhs_qdss_cfg",
-	.id = QDU1000_SLAVE_QDSS_CFG,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qhs_qpic = {
 	.name = "qhs_qpic",
-	.id = QDU1000_SLAVE_QPIC,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qhs_qspi = {
 	.name = "qhs_qspi",
-	.id = QDU1000_SLAVE_QSPI_0,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qhs_qup0 = {
 	.name = "qhs_qup0",
-	.id = QDU1000_SLAVE_QUP_0,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qhs_qup1 = {
 	.name = "qhs_qup1",
-	.id = QDU1000_SLAVE_QUP_1,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qhs_sdc2 = {
 	.name = "qhs_sdc2",
-	.id = QDU1000_SLAVE_SDCC_2,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qhs_smbus_cfg = {
 	.name = "qhs_smbus_cfg",
-	.id = QDU1000_SLAVE_SMBUS_CFG,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qhs_system_noc_cfg = {
 	.name = "qhs_system_noc_cfg",
-	.id = QDU1000_SLAVE_SNOC_CFG,
 	.channels = 1,
 	.buswidth = 4,
 	.num_links = 1,
-	.links = { QDU1000_MASTER_SNOC_CFG },
+	.link_nodes = { &qhm_system_noc_cfg },
 };
 
 static struct qcom_icc_node qhs_tcsr = {
 	.name = "qhs_tcsr",
-	.id = QDU1000_SLAVE_TCSR,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qhs_tlmm = {
 	.name = "qhs_tlmm",
-	.id = QDU1000_SLAVE_TLMM,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qhs_tme_cfg = {
 	.name = "qhs_tme_cfg",
-	.id = QDU1000_SLAVE_TME_CFG,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qhs_tsc_cfg = {
 	.name = "qhs_tsc_cfg",
-	.id = QDU1000_SLAVE_TSC_CFG,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qhs_usb3 = {
 	.name = "qhs_usb3",
-	.id = QDU1000_SLAVE_USB3_0,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qhs_vsense_ctrl_cfg = {
 	.name = "qhs_vsense_ctrl_cfg",
-	.id = QDU1000_SLAVE_VSENSE_CTRL_CFG,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qns_a1noc_snoc = {
 	.name = "qns_a1noc_snoc",
-	.id = QDU1000_SLAVE_A1NOC_SNOC,
 	.channels = 1,
 	.buswidth = 8,
 	.num_links = 1,
-	.links = { QDU1000_MASTER_ANOC_SNOC },
+	.link_nodes = { &qnm_aggre_noc },
 };
 
 static struct qcom_icc_node qns_anoc_snoc_gsi = {
 	.name = "qns_anoc_snoc_gsi",
-	.id = QDU1000_SLAVE_ANOC_SNOC_GSI,
 	.channels = 1,
 	.buswidth = 8,
 	.num_links = 1,
-	.links = { QDU1000_MASTER_ANOC_GSI },
+	.link_nodes = { &qnm_aggre_noc_gsi },
 };
 
 static struct qcom_icc_node qns_ddrss_cfg = {
 	.name = "qns_ddrss_cfg",
-	.id = QDU1000_SLAVE_DDRSS_CFG,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qns_ecpri_gemnoc = {
 	.name = "qns_ecpri_gemnoc",
-	.id = QDU1000_SLAVE_ECPRI_GEMNOC,
 	.channels = 2,
 	.buswidth = 32,
 	.num_links = 1,
-	.links = { QDU1000_MASTER_GEMNOC_ECPRI_DMA },
+	.link_nodes = { &qnm_ecpri_dma },
 };
 
 static struct qcom_icc_node qns_gemnoc_gc = {
 	.name = "qns_gemnoc_gc",
-	.id = QDU1000_SLAVE_SNOC_GEM_NOC_GC,
 	.channels = 1,
 	.buswidth = 8,
 	.num_links = 1,
-	.links = { QDU1000_MASTER_SNOC_GC_MEM_NOC },
+	.link_nodes = { &qnm_snoc_gc },
 };
 
 static struct qcom_icc_node qns_gemnoc_sf = {
 	.name = "qns_gemnoc_sf",
-	.id = QDU1000_SLAVE_SNOC_GEM_NOC_SF,
 	.channels = 1,
 	.buswidth = 16,
 	.num_links = 1,
-	.links = { QDU1000_MASTER_SNOC_SF_MEM_NOC },
+	.link_nodes = { &qnm_snoc_sf },
 };
 
 static struct qcom_icc_node qns_modem = {
 	.name = "qns_modem",
-	.id = QDU1000_SLAVE_MODEM_OFFLINE,
 	.channels = 1,
 	.buswidth = 32,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qns_pcie_gemnoc = {
 	.name = "qns_pcie_gemnoc",
-	.id = QDU1000_SLAVE_ANOC_PCIE_GEM_NOC,
 	.channels = 1,
 	.buswidth = 64,
 	.num_links = 1,
-	.links = { QDU1000_MASTER_ANOC_PCIE_GEM_NOC },
+	.link_nodes = { &qnm_pcie },
 };
 
 static struct qcom_icc_node qxs_imem = {
 	.name = "qxs_imem",
-	.id = QDU1000_SLAVE_IMEM,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node qxs_pimem = {
 	.name = "qxs_pimem",
-	.id = QDU1000_SLAVE_PIMEM,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node srvc_system_noc = {
 	.name = "srvc_system_noc",
-	.id = QDU1000_SLAVE_SERVICE_SNOC,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node xs_ethernet_ss = {
 	.name = "xs_ethernet_ss",
-	.id = QDU1000_SLAVE_ETHERNET_SS,
 	.channels = 1,
 	.buswidth = 32,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node xs_pcie = {
 	.name = "xs_pcie",
-	.id = QDU1000_SLAVE_PCIE_0,
 	.channels = 1,
 	.buswidth = 64,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node xs_qdss_stm = {
 	.name = "xs_qdss_stm",
-	.id = QDU1000_SLAVE_QDSS_STM,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 0,
 };
 
 static struct qcom_icc_node xs_sys_tcu_cfg = {
 	.name = "xs_sys_tcu_cfg",
-	.id = QDU1000_SLAVE_TCU,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 0,
 };
 
 static struct qcom_icc_bcm bcm_acv = {
@@ -880,6 +834,7 @@ static struct qcom_icc_node * const clk_virt_nodes[] = {
 };
 
 static const struct qcom_icc_desc qdu1000_clk_virt = {
+	.alloc_dyn_id = true,
 	.nodes = clk_virt_nodes,
 	.num_nodes = ARRAY_SIZE(clk_virt_nodes),
 	.bcms = clk_virt_bcms,
@@ -907,6 +862,7 @@ static struct qcom_icc_node * const gem_noc_nodes[] = {
 };
 
 static const struct qcom_icc_desc qdu1000_gem_noc = {
+	.alloc_dyn_id = true,
 	.nodes = gem_noc_nodes,
 	.num_nodes = ARRAY_SIZE(gem_noc_nodes),
 	.bcms = gem_noc_bcms,
@@ -924,6 +880,7 @@ static struct qcom_icc_node * const mc_virt_nodes[] = {
 };
 
 static const struct qcom_icc_desc qdu1000_mc_virt = {
+	.alloc_dyn_id = true,
 	.nodes = mc_virt_nodes,
 	.num_nodes = ARRAY_SIZE(mc_virt_nodes),
 	.bcms = mc_virt_bcms,
@@ -1010,6 +967,7 @@ static struct qcom_icc_node * const system_noc_nodes[] = {
 };
 
 static const struct qcom_icc_desc qdu1000_system_noc = {
+	.alloc_dyn_id = true,
 	.nodes = system_noc_nodes,
 	.num_nodes = ARRAY_SIZE(system_noc_nodes),
 	.bcms = system_noc_bcms,
diff --git a/drivers/interconnect/qcom/qdu1000.h b/drivers/interconnect/qcom/qdu1000.h
deleted file mode 100644
index e75a6419df235353a5dcfbefe1cb3979ae966054..0000000000000000000000000000000000000000
--- a/drivers/interconnect/qcom/qdu1000.h
+++ /dev/null
@@ -1,95 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2022, Qualcomm Innovation Center, Inc. All rights reserved.
- */
-
-#ifndef __DRIVERS_INTERCONNECT_QCOM_QDU1000_H
-#define __DRIVERS_INTERCONNECT_QCOM_QDU1000_H
-
-#define QDU1000_MASTER_SYS_TCU				0
-#define QDU1000_MASTER_APPSS_PROC			1
-#define QDU1000_MASTER_LLCC				2
-#define QDU1000_MASTER_GIC_AHB				3
-#define QDU1000_MASTER_QDSS_BAM				4
-#define QDU1000_MASTER_QPIC				5
-#define QDU1000_MASTER_QSPI_0				6
-#define QDU1000_MASTER_QUP_0				7
-#define QDU1000_MASTER_QUP_1				8
-#define QDU1000_MASTER_SNOC_CFG				9
-#define QDU1000_MASTER_ANOC_SNOC			10
-#define QDU1000_MASTER_ANOC_GSI				11
-#define QDU1000_MASTER_GEMNOC_ECPRI_DMA			12
-#define QDU1000_MASTER_FEC_2_GEMNOC			13
-#define QDU1000_MASTER_GEM_NOC_CNOC			14
-#define QDU1000_MASTER_GEMNOC_MODEM_CNOC		15
-#define QDU1000_MASTER_GEM_NOC_PCIE_SNOC		16
-#define QDU1000_MASTER_ANOC_PCIE_GEM_NOC		17
-#define QDU1000_MASTER_SNOC_GC_MEM_NOC			18
-#define QDU1000_MASTER_SNOC_SF_MEM_NOC			19
-#define QDU1000_MASTER_QUP_CORE_0			20
-#define QDU1000_MASTER_QUP_CORE_1			21
-#define QDU1000_MASTER_CRYPTO				22
-#define QDU1000_MASTER_ECPRI_GSI			23
-#define QDU1000_MASTER_MSS_PROC				24
-#define QDU1000_MASTER_PIMEM				25
-#define QDU1000_MASTER_SNOC_ECPRI_DMA			26
-#define QDU1000_MASTER_GIC				27
-#define QDU1000_MASTER_PCIE				28
-#define QDU1000_MASTER_QDSS_ETR				29
-#define QDU1000_MASTER_QDSS_ETR_1			30
-#define QDU1000_MASTER_SDCC_1				31
-#define QDU1000_MASTER_USB3				32
-#define QDU1000_SLAVE_EBI1				512
-#define QDU1000_SLAVE_AHB2PHY_SOUTH			513
-#define QDU1000_SLAVE_AHB2PHY_NORTH			514
-#define QDU1000_SLAVE_AHB2PHY_EAST			515
-#define QDU1000_SLAVE_AOSS				516
-#define QDU1000_SLAVE_CLK_CTL				517
-#define QDU1000_SLAVE_RBCPR_CX_CFG			518
-#define QDU1000_SLAVE_RBCPR_MX_CFG			519
-#define QDU1000_SLAVE_CRYPTO_0_CFG			520
-#define QDU1000_SLAVE_ECPRI_CFG				521
-#define QDU1000_SLAVE_IMEM_CFG				522
-#define QDU1000_SLAVE_IPC_ROUTER_CFG			523
-#define QDU1000_SLAVE_CNOC_MSS				524
-#define QDU1000_SLAVE_PCIE_CFG				525
-#define QDU1000_SLAVE_PDM				526
-#define QDU1000_SLAVE_PIMEM_CFG				527
-#define QDU1000_SLAVE_PRNG				528
-#define QDU1000_SLAVE_QDSS_CFG				529
-#define QDU1000_SLAVE_QPIC				530
-#define QDU1000_SLAVE_QSPI_0				531
-#define QDU1000_SLAVE_QUP_0				532
-#define QDU1000_SLAVE_QUP_1				533
-#define QDU1000_SLAVE_SDCC_2				534
-#define QDU1000_SLAVE_SMBUS_CFG				535
-#define QDU1000_SLAVE_SNOC_CFG				536
-#define QDU1000_SLAVE_TCSR				537
-#define QDU1000_SLAVE_TLMM				538
-#define QDU1000_SLAVE_TME_CFG				539
-#define QDU1000_SLAVE_TSC_CFG				540
-#define QDU1000_SLAVE_USB3_0				541
-#define QDU1000_SLAVE_VSENSE_CTRL_CFG			542
-#define QDU1000_SLAVE_A1NOC_SNOC			543
-#define QDU1000_SLAVE_ANOC_SNOC_GSI			544
-#define QDU1000_SLAVE_DDRSS_CFG				545
-#define QDU1000_SLAVE_ECPRI_GEMNOC			546
-#define QDU1000_SLAVE_GEM_NOC_CNOC			547
-#define QDU1000_SLAVE_SNOC_GEM_NOC_GC			548
-#define QDU1000_SLAVE_SNOC_GEM_NOC_SF			549
-#define QDU1000_SLAVE_LLCC				550
-#define QDU1000_SLAVE_MODEM_OFFLINE			551
-#define QDU1000_SLAVE_GEMNOC_MODEM_CNOC			552
-#define QDU1000_SLAVE_MEM_NOC_PCIE_SNOC			553
-#define QDU1000_SLAVE_ANOC_PCIE_GEM_NOC			554
-#define QDU1000_SLAVE_QUP_CORE_0			555
-#define QDU1000_SLAVE_QUP_CORE_1			556
-#define QDU1000_SLAVE_IMEM				557
-#define QDU1000_SLAVE_PIMEM				558
-#define QDU1000_SLAVE_SERVICE_SNOC			559
-#define QDU1000_SLAVE_ETHERNET_SS			560
-#define QDU1000_SLAVE_PCIE_0				561
-#define QDU1000_SLAVE_QDSS_STM				562
-#define QDU1000_SLAVE_TCU				563
-
-#endif

-- 
2.47.3


