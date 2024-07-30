Return-Path: <linux-arm-msm+bounces-27414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF3A94115D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 14:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF758285463
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 12:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A1A91A01C3;
	Tue, 30 Jul 2024 11:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DXm/Ygex"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBC41A00E3;
	Tue, 30 Jul 2024 11:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722340756; cv=none; b=rXZGmgLOlh677RcK41iK5YAEY/3JM1DFpxv8xuyZ7Fb0JLRNQ9J/xs349oFoVwLomeUNNahz9yPRBgsElo7Od/woUfAHymWJpGfjuHLVkJ09qe5Pa1XG8zwIm5Q9BRI3QbBnhFXWi77pmPN5dMQziyXo89y7a3tKPBCaiaI4Vvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722340756; c=relaxed/simple;
	bh=KxtpEEJFDgjJUycJhbeYkwdqrxeGuVwbSLagdf/Iw/A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bau5YU8ng2XWjb3QH6jWs2a4Wk0nywwWoSC1KH2TEG1xbTbHgPCZ4a2ZqXJ1lYhfZquVWm/Qog6riymsYJhkhWYfwtJaPr8Lth/pwmYuQ7/44dF5HA3ZKdEVL+YSCleoAEcXRfry1iJ0TZ8+D3pxu95oNNpc+KSNp3djhsHCmhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DXm/Ygex; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UApx6B021468;
	Tue, 30 Jul 2024 11:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jSfZ/eroKzS7KHFFb8xfqf0mCszdCzpq2ex
	HaAg2JAk=; b=DXm/YgexAT0fZYq/NDSufavSmuYeXIaiL+/w4/rB1IuMjyCvRVj
	FA41Flpx9ks6I2xlF5DnS5flC/W+nP7NXtQzXe9XYgVFocgDaSOdidSTXXWGCD9x
	SmxY3Bzdj77iIH8lNVyVJC07MXahIGzg8CVXPJv4GaOjqgIzTKhI/OBxjUo/HG2R
	nxJ6MTZgOyeWWqum3NDb4TmECThafYHrh5Eqt2OeyA37SC4WU98wKfy7p/eeOWCR
	S3XQ7MxzvEDDTlMJKzHN/yUWRcKmri2yGrctPaUGw1UT0vUgiR4ZaA2CM7WDhl83
	XZAb1efjnsrezHkotV/uwSfJfMf8TvUN2uw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40ms4375bm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 11:58:45 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 46UBwf72001365;
	Tue, 30 Jul 2024 11:58:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 40msykdx67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 11:58:41 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 46UBwfAw001322;
	Tue, 30 Jul 2024 11:58:41 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-mdalam-blr.qualcomm.com [10.131.36.157])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 46UBwfkp001319
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 11:58:41 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 466583)
	id B00E9411A5; Tue, 30 Jul 2024 17:28:40 +0530 (+0530)
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com,
        adrian.hunter@intel.com, quic_asutoshd@quicinc.com,
        ritesh.list@gmail.com, ulf.hansson@linaro.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, dm-devel@lists.linux.dev,
        linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_viswanat@quicinc.com, quic_srichara@quicinc.com,
        quic_varada@quicinc.com
Cc: quic_mdalam@quicinc.com
Subject: [PATCH 0/6] Add Additional algo mode for inline encryption
Date: Tue, 30 Jul 2024 17:28:32 +0530
Message-Id: <20240730115838.3507302-1-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qAJEhT_iv2CgjusZ-B-v9p-f03oo0i8q
X-Proofpoint-ORIG-GUID: qAJEhT_iv2CgjusZ-B-v9p-f03oo0i8q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_11,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300084

This series of patches add additional modes for inline encryption

This series of patches depends on [1] Add inline encryption support for dm-crypt

[1]: https://lore.kernel.org/all/b45d3b40-2587-04dc-9601-a9251dacf806@opensource.wdc.com/T/#ma01f08a941107217c93680fa25e96e8d406df790

These patches tested on IPQ9574 with eMMC ICE for raw partition
encryption/decryption.

e.g:

dmsetup create test-crypt --table '0 251904 crypt aes128-xts-plain64 a7f67ad520bd83b9725df6ebd76c3eeea7f67ad520bd83b9725df6ebd76c3eee 0 /dev/mmcblk0p27 0 1 inline_crypt'

dd if=/dev/urandom of=/tmp/data bs=1M count=1

dd if=/tmp/data of=/dev/mapper/test-crypt bs=1M count=1

dd of=/tmp/data1 if=/dev/mapper/test-crypt bs=1M count=1

dd of=/tmp/data2 if=/dev/mmcblk0p27 bs=1M count=1

md5sum /tmp/data*
b45d728bfb499b6de9b12c98fbb652dd  /tmp/data
b45d728bfb499b6de9b12c98fbb652dd  /tmp/data1
bc4107e19cf6fc012c5b997bdd3f0de4  /tmp/data2

dmsetup remove /dev/mapper/test-crypt

Md Sadre Alam (6):
  md: dm-crypt: Fix compilation issue
  md: dm-crypt: Set cc->iv_size to 4 bytes
  blk-crypto: Add additional algo modes for Inline encryption
  md: dm-crypt: Add additional algo modes for inline encryption
  mmc: cqhci: Add additional algo mode for inline encryption
  mmc: sdhci-msm: Add additional algo mode for inline encryption

 block/blk-crypto.c              | 18 +++++++++
 drivers/md/dm-crypt.c           | 26 ++++++-------
 drivers/mmc/host/cqhci-crypto.c | 12 ++++++
 drivers/mmc/host/sdhci-msm.c    | 10 +----
 drivers/soc/qcom/ice.c          | 65 ++++++++++++++++++++++++++++-----
 include/linux/blk-crypto.h      |  3 ++
 6 files changed, 103 insertions(+), 31 deletions(-)

-- 
2.34.1


