Return-Path: <linux-arm-msm+bounces-36666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7249B89D1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 04:16:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 843EC1F240D0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 03:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8336F1487F4;
	Fri,  1 Nov 2024 03:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e06ZpUlN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4679B13A24D;
	Fri,  1 Nov 2024 03:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730430951; cv=none; b=PoEvkHsJ6zVfgxlPUc0pldWnIDeifdePIEwJ8cVOP/OPtbKvSfaN4V8ocvB7fmbMlnssxoKaC+x3L1zYi+Dxi47d3uTKAQUjqF7kkkqFfCbKbwfBHEg2ZmyV4GF5Hor+BsbAY2aedpeXuzOYFZQ642AYt6/xCBb8Blbz6mqvpiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730430951; c=relaxed/simple;
	bh=Z/Z3v3f5ZNuL1B/BD2BcQLw4mmBCJrnNHI1teHcC+iI=;
	h=From:To:Cc:Subject:Date:Message-Id; b=lOLBw3wiv5eztpIJeHV2yIq+BNIF1jKyyR8TIvbEPxkeC+dlLj3RNO4MsivNKjqrMJnzxZgoGMeUajOcm8GdD0Z56uhKYKxMwNuVtWGyXREc81gNnhMsH/JGAvnAPtmOHcyPX8H+XeAUmI7E3iB2bsfvXBlNBtzI6qbPabu6diU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e06ZpUlN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VMbU12008963;
	Fri, 1 Nov 2024 03:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=xrhQ149HLnk4
	JXhbaoX5SCWn4CD66hZ2w9+VqWyaaLE=; b=e06ZpUlNfoP+xUzayshvYCGYsG6+
	+yVW4rlYPF/4jJ17LplVRQui6Rl/lCzMksxk7SpxODpkjytg9xMp9c3+xL3MSlfF
	+XSFGlVZ5Vi1T8T1+hGgJkOJPjB9zZcKFPTgZ7rT9CbnldDjXtdR33eY2+dfcDYk
	HjpV0qQhI7Xq2n8KHDHofs2Htc9atYiJNDFNW68uVvyUTUBaWQlH/PVtTq9rKD/P
	4SOZGJVnrC9om0/kCua8qolgw88V7JQrJ4AEe/dhPcutdU2zn3H//V7p3xYxxL3Q
	W8q5S5A99xs1ncWJ1eHf2bldc5KbTQo68uVQ5lUm0Jz2vgC+d5Ixn/Eb+w==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grgusq53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 03:15:44 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A13Fe6e010611;
	Fri, 1 Nov 2024 03:15:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 42gsgmd4tc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 01 Nov 2024 03:15:40 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4A13FekI010585;
	Fri, 1 Nov 2024 03:15:40 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-spuppala-hyd.qualcomm.com [10.213.108.54])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 4A13FeQt010579;
	Fri, 01 Nov 2024 03:15:40 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 4137148)
	id 7B3D95001B7; Fri,  1 Nov 2024 08:45:39 +0530 (+0530)
From: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
        Asutosh Das <quic_asutoshd@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_gaurkash@quicinc.com, quic_neersoni@quicinc.com,
        quic_spuppala@quicinc.com
Subject: [PATCH RFC 0/6] Hardware wrapped key support for MMC core
Date: Fri,  1 Nov 2024 08:45:33 +0530
Message-Id: <20241101031539.13285-1-quic_spuppala@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hj8AtRXfLcJMXeR1v4kl2u5FnMUYeUho
X-Proofpoint-GUID: hj8AtRXfLcJMXeR1v4kl2u5FnMUYeUho
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411010022
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

This series adds support for wrapped keys by implementing relevant
callbacks MMC core and QCom layer.

They patches do the following:
- Tested on top of Hardware wrapped key support for QCom ICE and UFS core: https://patchwork.kernel.org/project/linux-scsi/cover/20241011-wrapped-keys-v7-0-e3f7a752059b@linaro.org/

Tested on QCM6490.

How to test:

Use the wip-wrapped-keys branch from https://github.com/ebiggers/fscryptctl
to build a custom fscryptctl that supports generating wrapped keys.

Enable the following config options:
CONFIG_BLK_INLINE_ENCRYPTION=y
CONFIG_QCOM_INLINE_CRYPTO_ENGINE=m
CONFIG_FS_ENCRYPTION_INLINE_CRYPT=y
CONFIG_MMC_CRYPTO=y

$ mkfs.ext4 -F -O encrypt,stable_inodes /dev/mmcblk0p12
$ mount /dev/mmcblk0p12 -o inlinecrypt /mnt
$ fscryptctl generate_hw_wrapped_key /dev/mmcblk0p12 > /mnt/key.longterm
$ fscryptctl prepare_hw_wrapped_key /dev/mmcblk0p12 < /mnt/key.longterm > /tmp/key.ephemeral
$ KEYID=$(fscryptctl add_key --hw-wrapped-key < /tmp/key.ephemeral /mnt)
$ rm -rf /mnt/dir
$ mkdir /mnt/dir
$ fscryptctl set_policy --hw-wrapped-key --iv-ino-lblk-32 "$KEYID" /mnt/dir
$ dmesg > /mnt/dir/test.txt
$ sync

Reboot the board

$ mount /dev/mmcblk0p12 -o inlinecrypt /mnt
$ ls /mnt/dir
$ fscryptctl prepare_hw_wrapped_key /dev/mmcblk0p12 < /mnt/key.longterm > /tmp/key.ephemeral
$ KEYID=$(fscryptctl add_key --hw-wrapped-key < /tmp/key.ephemeral /mnt)
$ fscryptctl set_policy --hw-wrapped-key --iv-ino-lblk-32 "$KEYID" /mnt/dir
$ cat /mnt/dir/test.txt # File should now be decrypted

Seshu Madhavi Puppala (6):
  mmc: host: support wrapped keys in mmc
  mmc: host: add support to derive software secret
  mmc: host: add support for generate, import and prepare keys
  mmc: host: wrapped keys support in mmc qcom
  mmc: host: implement derive sw secret vop in mmc qcom
  mmc: host: support for generate, import and prepare key

 drivers/mmc/host/cqhci-crypto.c | 79 +++++++++++++++++++++++++++++----
 drivers/mmc/host/cqhci.h        | 22 +++++++++
 drivers/mmc/host/sdhci-msm.c    | 59 +++++++++++++++++++++++-
 3 files changed, 151 insertions(+), 9 deletions(-)

-- 
2.17.1


