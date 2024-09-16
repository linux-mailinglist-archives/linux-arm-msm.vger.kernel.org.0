Return-Path: <linux-arm-msm+bounces-31810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59218979D99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 10:58:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D2531C21F41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 08:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589941487C5;
	Mon, 16 Sep 2024 08:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hGsUr3Yg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC03B1459F6;
	Mon, 16 Sep 2024 08:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726477105; cv=none; b=V57q+fcn9TFGotq4/oms0tiCRLphLzsM5J4549surwZDmz+AoH+69eeX7BryBt0xJ8HeSBI5X0sox3Z0IB/XivqJ95mGJ27Hci1SfeLo3oWEhrNlCeYXHMxGf/52EHCo8l7l59gtTJ77LwBLShFVc8SDz48I6fjTGVGxn+Oxe3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726477105; c=relaxed/simple;
	bh=xBA+E4KTUuwEoEWvQDGK5J1hbYvnFYe3rBLV0t3JzyQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=In7n7FDvZSbCxE//TL7ARpkGxVpasLruXZgH2iHux6XONabcLQlJt1XTB2rY8JnA6kxjc5jvsgjsUnr9XWxA8YxWqlOFK+XZDfMPGnQ0g9cixaexhEhBbV02LZIZdquPyo+8J4MegVy+GEZd4wWUIEHpmXDBcHYQg4ol5SDRDTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hGsUr3Yg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48FNARGM015144;
	Mon, 16 Sep 2024 08:58:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kb0B4norh/6bbwZZZg795m
	MCaKhwSmMy8XzMHe3AEy0=; b=hGsUr3Yg1txBHSMSCILP4NEo623VFL9KmtskLh
	MtEsaG+BsPOGuIG3rPrgETHWeE6yxbMley0mMfjnKpQuU2fU1urH7BmbeL6xiaOs
	FNPBdO6F5k6XW4KzHQosZ+F3YlyPYlx0fvBB7P/e8BHxMET0+QujJFzLVqlTN0yI
	mOkPuF/neJqhdKrv67sTadxfeoNJmOyOJXBwOD8bO84SXSJcVn95jQTpp7VoeB2H
	flxGe8MsPDgbPJrAtwzY+/RPsQsvbRLzcj+EQw0iMIOpeDlyOmi1oCyue7PYvaLD
	tMWUHDmJdU7EEnr2UO3ADsa0GidjQIqlt7jC8Z4j4vt8dfeQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4ge3cmh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 08:58:04 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48G8w3El004510
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 08:58:03 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 16 Sep 2024 01:57:56 -0700
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <axboe@kernel.dk>, <song@kernel.org>, <yukuai3@huawei.com>,
        <agk@redhat.com>, <snitzer@kernel.org>, <mpatocka@redhat.com>,
        <adrian.hunter@intel.com>, <quic_asutoshd@quicinc.com>,
        <ritesh.list@gmail.com>, <ulf.hansson@linaro.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <kees@kernel.org>,
        <gustavoars@kernel.org>, <linux-block@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-raid@vger.kernel.org>,
        <dm-devel@lists.linux.dev>, <linux-mmc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-hardening@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <quic_mdalam@quicinc.com>
Subject: [PATCH v2 0/3] Add inline encryption support
Date: Mon, 16 Sep 2024 14:27:38 +0530
Message-ID: <20240916085741.1636554-1-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ym74qACMiDUgz6EKJwdNdumFaOfWLRvb
X-Proofpoint-ORIG-GUID: Ym74qACMiDUgz6EKJwdNdumFaOfWLRvb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 clxscore=1011
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409160056

QCOM SDCC controller having Inline Crypto Engine support
Inline Crypto Engine do encryption/decryption on fly.
dm-inlinecrypt driver will be use to do encryption/decryption
with Inline Crypto Engine. 

v2:
 * Added new driver dm-inlinecrypt
 * Dropped patch "md: dm-crypt: Set cc->iv_size to 4 bytes"
 * squash patch "blk-crypto: Add additional algo modes for Inline"
   encryption and patch "md: dm-crypt: Add additional algo modes for
   inline encryption" to the dm-inlinecrypt driver.
 * tested with dmsetup command as below
   dmsetup create test-crypt --table '0 251904 inline-crypt aes128-xts-
   plain a7f67ad520bd83b9725df6ebd76c3eeea7f67ad520bd83b9725df6ebd76c3eee 
   0 /dev/mmcblk0p27 0 1'

   dd if=/dev/urandom of=/tmp/data bs=1M count=1
   dd if=/tmp/data of=/dev/mapper/test-crypt bs=1M count=1
   dd of=/tmp/data1 if=/dev/mapper/test-crypt bs=1M count=1
   dd of=/tmp/data2 if=/dev/mmcblk0p27 bs=1M count=1
   md5sum /tmp/data*
   b45d728bfb499b6de9b12c98fbb652dd  /tmp/data
   b45d728bfb499b6de9b12c98fbb652dd  /tmp/data1
   bc4107e19cf6fc012c5b997bdd3f0de4  /tmp/data2
   dmsetup remove /dev/mapper/test-crypt

v1:
 * This series of patches add additional modes for inline encryption
   This series of patches depends on [1] Add inline encryption support for
   dm-crypt
   [1]: https://lore.kernel.org/all/b45d3b40-2587-04dc-9601-a9251dacf806@opensource.wdc.com/T/#ma01f08a941107217c93680fa25e96e8d406df790

 * These patches tested on IPQ9574 with eMMC ICE for raw partition
   encryption/decryption.

   e.g:

   dmsetup create test-crypt --table '0 251904 crypt aes128-xts-plain64
   a7f67ad520bd83b9725df6ebd76c3eeea7f67ad520bd83b9725df6ebd76c3eee 0
   /dev/mmcblk0p27 0 1 inline_crypt'

  dd if=/dev/urandom of=/tmp/data bs=1M count=1

  dd if=/tmp/data of=/dev/mapper/test-crypt bs=1M count=1

  dd of=/tmp/data1 if=/dev/mapper/test-crypt bs=1M count=1

  dd of=/tmp/data2 if=/dev/mmcblk0p27 bs=1M count=1

  md5sum /tmp/data*
  b45d728bfb499b6de9b12c98fbb652dd  /tmp/data
  b45d728bfb499b6de9b12c98fbb652dd  /tmp/data1
  bc4107e19cf6fc012c5b997bdd3f0de4  /tmp/data2

  dmsetup remove /dev/mapper/test-crypt


Md Sadre Alam (3):
  dm-inlinecrypt: Add inline encryption support
  mmc: cqhci: Add additional algo mode for inline encryption
  mmc: sdhci-msm: Add additional algo mode for inline encryption

 block/blk-crypto.c              |  21 +++
 drivers/md/Kconfig              |   8 +
 drivers/md/Makefile             |   1 +
 drivers/md/dm-inline-crypt.c    | 316 ++++++++++++++++++++++++++++++++
 drivers/mmc/host/cqhci-crypto.c |  12 ++
 drivers/mmc/host/sdhci-msm.c    |  10 +-
 drivers/soc/qcom/ice.c          |  65 ++++++-
 include/linux/blk-crypto.h      |   3 +
 8 files changed, 419 insertions(+), 17 deletions(-)
 create mode 100644 drivers/md/dm-inline-crypt.c

-- 
2.34.1


