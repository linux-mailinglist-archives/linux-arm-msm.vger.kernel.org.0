Return-Path: <linux-arm-msm+bounces-66840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 775F8B13A57
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 14:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFEDC3BC2BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 12:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97769263F34;
	Mon, 28 Jul 2025 12:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mla2ryas"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1593125178C
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 12:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753705110; cv=none; b=fmBmdSd4aKvjmphOyVXYfFvLgI8zQ2qGV02fORG/eos8FvetAQm7tVthjeAxgz8bM6c+le+omru+8EgA0Ru3OEHSTymzI1LjhdJgbHa+/+qkWlsnwUtNI6rOKOu32h/LspQhPp7a/0bKqTxSGKe2fzBC4PUsDTStXwTu2gblk/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753705110; c=relaxed/simple;
	bh=M38ztUaJC2lhdH7j2nFkM9hqv0YhD+Yd8t2Mfs5xBEc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=euXBsHqqF4K4i8dOXm1MMXxEI7Kn9co80jN6+qiOfkNRZXifI5YD3WLyDvDqyaV2bHXXmn3YydmliKpkbioVpx3ir0uuWilCtDNSViUc7398fHJK1/Hwz78vpg7lKcW4pEovMbnlhOD7HsPBQUTs+wR+cRJVBl4csiWW5RNSxPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mla2ryas; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlM6x026806
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 12:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ptZuHaxxZdoWHu82b8or6U
	lvOYiK665hzjqcsDuocac=; b=Mla2ryasFfujnFqb9TEC4V6mq2D56FmtKDPMHQ
	syaM5fiJ9ELkXzDR3qAIn5RRipQgktuXX3R23qlIugKEdTxCQXdnj3mdIzLHJNva
	T/7froIuidXw+S9MCtEB5tmDJ7x1zr5FmvBs0Ravd9pmuL5GX92CWD8a4Sa76XNP
	8vz42ZLEA8xjMnCLELqIS6GfBoSnR0h1eBI6OEdDdmZpJ99N2p6wGHvAAbg6qAxl
	NYnvSib0n7LnIZIiNYDisfpPSohTNSe+FhpX6zjRqryIKSamSTN6utpEOi4SgQTU
	1t4tdCfOT0N3Uq2WbgzrehM1K3rucrwFUn7eBhEvXVqSdVMA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mcr4qpm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 12:18:27 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7073140087aso30226396d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 05:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753705107; x=1754309907;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptZuHaxxZdoWHu82b8or6UlvOYiK665hzjqcsDuocac=;
        b=HYsZUyL+wVUGeLemgERxNRNS8BfJHvFIsq6RTMv/49GPIyVznxzmeyMmfbC718qX38
         F9XKQGlwz+51EhWdnLSI7H7ysgO1YIc8zhZpy0QfRvsLfG7jaJbkyp3NcdVM4zGr7DV+
         m5M5Eqr4ez5dnFycrZwhphZ4Sw99PZLtkUjoUiWyfJ1Qa8IMV5tPD84srPlDrET1Kd40
         yA9QK9akZuw5GrhMJVis7xj4sBX5rv+HznDdf1ZL1IG4SjAMP2u3zxsqu+ZsjEZ3s5r8
         +lxwVrz8eBVC0pKpYND40RgbKxF/gJbjIIr3RSWA80sT9UOLkNL3KZmp7gDU4D3nOtvn
         jTNg==
X-Gm-Message-State: AOJu0YzkADFj/oMqxDZzCEEtDhPhFtD3KaU02bQdw3lqoqggQYFqTebT
	bLO9Tu7J4HnOcGSoQN7MpLOqf/pbbXiaZSePB8GqDyIU1Klev+yiQSHwfbZc0LMTY2/3VKHQouy
	XxAVE8og/tddDZzhl1OmF+le8RBWLs6fBzdvBeqh1BlM9JWn5mpXXkp0d2Ia/cZ+npNI6
X-Gm-Gg: ASbGncsZ3355VWCkgEUgcuTJdUR7IiZzrU17i/tSv7Z6QXng5NtMhgbwvhZYZ1wrjUk
	AZIQiy/WV2vsb9IvAtg9qptzJI9KnsvyFqV4ikxF6FwOCyun7hnKZURO8olu8xo3TWe4rYaCfwy
	VKTTRaeA0Q29BA56cVl/sYZrnzHnuCLD33y5zGxcsDO7+cZINal9H0ZOu+FW0vARJZA3Rlk4pBY
	CH0CHjCaqsdv01jcz6QLFU4LuS1UI44Bdx7QPmNEvGG+RfhCsgA1iXf+HPxZW5evJM3uw0kXjoY
	ApQ2wzdrU1Uwypkyppcd7jraK6o/sReIp/OB3e9JFwI41pwID9R796KuZTxVY1QwzqFZ179EqZ0
	IiOPehj4Vloac/gfI2hdFLVMyRZOcP/v+rjMpxDF2D2vkjDxbE+OS
X-Received: by 2002:a05:6214:4f04:b0:707:2c79:e7e0 with SMTP id 6a1803df08f44-7072c79fba3mr117172276d6.26.1753705106924;
        Mon, 28 Jul 2025 05:18:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFN2YeovA7z4Fa9KoKkrBt/mxaEt659mNHLOy9z26g41eJUXyUfEXi6Fre24yRnj636ygzN7Q==
X-Received: by 2002:a05:6214:4f04:b0:707:2c79:e7e0 with SMTP id 6a1803df08f44-7072c79fba3mr117171596d6.26.1753705106181;
        Mon, 28 Jul 2025 05:18:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b633b9d7dsm1241315e87.209.2025.07.28.05.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 05:18:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/2] thermal: qcom: lmh: enable COMPILE_TEST testing
Date: Mon, 28 Jul 2025 15:18:22 +0300
Message-Id: <20250728-lmh-scm-v2-0-33bc58388ca5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI5qh2gC/2WMwQ7CIBAFf6XZszRAwVZP/ofpgeBWSEqprBJNw
 7+LvXp5ybxMZgPC5JHg3GyQMHvycakgDw1YZ5Y7Mn+rDJJLzXup2RwcIxuYRmtEh7w3kkO114S
 Tf++l61jZeXrG9NnDWfze/0YWTLBBSXU8DWJSnb5EovbxMrONIbR1YCylfAEj3AYApQAAAA==
X-Change-ID: 20250725-lmh-scm-5eca13e07a20
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Jackie Liu <liuyun01@kylinos.cn>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=712;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=M38ztUaJC2lhdH7j2nFkM9hqv0YhD+Yd8t2Mfs5xBEc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoh2qQzPrWOTULAa+8LQPK9aromyl5o7bomWPML
 St+6PoYc8OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaIdqkAAKCRCLPIo+Aiko
 1ZUgB/4zTD3s+0wa80N9eIBYbJ+kXG2H5AQ9sOnzAJ2rcgICH02fujCfgkalb52Mjf4ME8EPyEa
 7Zfa4bRBYVSCjq1ga8nCUu5q4wkydwNCASDHtf/yIkDAQy53SGaCGY3YAEv2aA13eZ+vBDOy1lQ
 qPlvM9idqXLF4/WgfIZN5bWFSTRpvtyw3h3a0WvIZAnWOSXnlbQ41wAAhWPz3CR9FEfUieQKzaN
 NBpdTk6U2CgiZeX6nnno9arYjOmmDn7FzcP68OMXbRfSJyggkxzoZm9Extv/MUKbVHjM3x/eQ9v
 WRZPjCKaKdpll+TJw1+5YVl/X+sDTNXkqx8g1TYLLLV6dNEJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA5MCBTYWx0ZWRfX3oBW2fjxm2nP
 sr2D6o4uIYH2fnPiBpeZAJu5v6NCr4Kk3vjL26/q4dFDC5I8hScgWKr0UBOma7kjIz8D+7d/if2
 eVwJDa9MPSjZNttKy0ElyDhfbZJ6a8g7y6Auc8oNCchc5mh4nnqon0Jx8qZi/EvfjILQye6cmRV
 2xxWu6Fn+faUEucHtskPOqWjsQy5IN4EsMKPyBSirgsu6Vip/r5T46EXg903g6xU35sw6vND81R
 oTeSUraxc7ukRTNfTh4rvGSs1uOMidp77t4PUPwKyNs/rYCNUFitmAS+5ABbyqs10MAt9ix6ixs
 Alv4Eo89bSzKdch/db/dLa5rDIvV1PYKJXodXjlAVwYTDItlxl/9cJROJjQdv81Olyhk204yQXH
 wA06GrN7MvebtiT31syzOXSFK1mouq3bufvJxsbeN5Qv/vQhoBxV/V5OWveFUgHlxaE7HfRG
X-Authority-Analysis: v=2.4 cv=Hth2G1TS c=1 sm=1 tr=0 ts=68876a93 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2jyfk5HOav9ef5UL-FMA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: hncky9U9ZblpFAx1I0QOqmFzxht2DrfO
X-Proofpoint-ORIG-GUID: hncky9U9ZblpFAx1I0QOqmFzxht2DrfO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280090

Rework Kconfig dependencies and make LMH driver subject to the
COMPILE_TEST testing.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Added missing includes (LKP)
- Link to v1: https://lore.kernel.org/r/20250725-lmh-scm-v1-1-84246981f435@oss.qualcomm.com

---
Dmitry Baryshkov (2):
      thermal: qcom: make LMH select QCOM_SCM
      thermal: qcom: lmh: add missing IRQ includes

 drivers/thermal/qcom/Kconfig | 3 ++-
 drivers/thermal/qcom/lmh.c   | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)
---
base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
change-id: 20250725-lmh-scm-5eca13e07a20

Best regards,
-- 
With best wishes
Dmitry


