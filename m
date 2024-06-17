Return-Path: <linux-arm-msm+bounces-22787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B472790A128
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 03:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C70B1F21B2B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 01:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B28111CB8;
	Mon, 17 Jun 2024 00:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mIVazxxg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63308F47;
	Mon, 17 Jun 2024 00:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718585956; cv=none; b=SJ804ZNYg8EDRvFiZ/Ym2ZZ8jBHmGfPqVZPtdokux+Z2EPFW5BG1Hrai9GzG2pd68Lh/Iw0mEywmTCoDFFip27T3QkYuCbNpzW2eNM4xKwRmIy1avMY0tOPcAnNVikl6fIxsc7VdXmhnlGvBwNlZmc/YNBj8UaFGzQwPIbfgPBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718585956; c=relaxed/simple;
	bh=fR69s1tRAc633PEvpZH5oRnVOKGBc0iV6KQJceGnkYw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HGvCzE/5RYsw/4vd37nM4cwHkthBxT6SVAmJomAoFIJxQcwpvIc9mVsQvTkYYk8Tte1yT6nZboHhvhyFhGzMg6dHuMeiEc6ZcA+uTveeYLk0O4dr94wVG/ErWWdS1uomA4CQ+c+bhlT18/oNU8rqX6v6tbV2dZfoVqCvcuIjRpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mIVazxxg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45GNx6dA024818;
	Mon, 17 Jun 2024 00:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aZ+ZQsmEke9+r+pC+kT6Vc
	4w5p9Fal8f/qHdKA2Dx6Y=; b=mIVazxxg1/Ar3TrkGuQY4BG8Pixte6G/0k5Ydi
	fH8WaW9a57kpbXZ80uuVVHLCx/PYi9U8E4fjlBVMRH+rzCWdDByiet8LNHQFMwXR
	6HX69ohubSgadFEzwqmom7qoX6jEGZFxoyt3Qs8GmFiB855pNOebnHeeU/ugl7rX
	D8aXzbrrL3cEOe0pQTKNL9pGz9/Tz33hV/MSNEZxR5c1ekY08KQdtI1yrJUHL/AE
	JEkHwW2aiCpLZD7NARE/Trn4EI7AGVoIZq2TSfq952JHleNpqR+33M5it6CMo5lQ
	UiQ5+G1SGG728n4ekn8I9RDxPHtn/h5zjQzaQihzAUuojUag==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys3qf2cr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 00:58:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45H0wvun001215
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 00:58:57 GMT
Received: from hu-gaurkash-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 16 Jun 2024 17:58:52 -0700
From: Gaurav Kashyap <quic_gaurkash@quicinc.com>
To: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <andersson@kernel.org>, <ebiggers@google.com>,
        <neil.armstrong@linaro.org>, <srinivas.kandagatla@linaro.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <robh+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <kernel@quicinc.com>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_omprsing@quicinc.com>,
        <quic_nguyenb@quicinc.com>, <bartosz.golaszewski@linaro.org>,
        <konrad.dybcio@linaro.org>, <ulf.hansson@linaro.org>,
        <jejb@linux.ibm.com>, <martin.petersen@oracle.com>, <mani@kernel.org>,
        <davem@davemloft.net>, <herbert@gondor.apana.org.au>,
        <psodagud@quicinc.com>, <quic_apurupa@quicinc.com>,
        <sonalg@quicinc.com>, Gaurav Kashyap
	<quic_gaurkash@quicinc.com>
Subject: [PATCH v5 00/15] Hardware wrapped key support for qcom ice and ufs
Date: Sun, 16 Jun 2024 17:50:55 -0700
Message-ID: <20240617005825.1443206-1-quic_gaurkash@quicinc.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YciprQkJV490rk1IXffMg-WvllDZReui
X-Proofpoint-ORIG-GUID: YciprQkJV490rk1IXffMg-WvllDZReui
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-16_12,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406170006

The fifth iteration of patches that add support to Qualcomm ICE (Inline Crypto Engine) for hardware wrapped keys using Qualcomm Hardware Key Manager (HWKM)

They patches do the following:
- Address comments from previous versions (https://lore.kernel.org/all/20240127232436.2632187-1-quic_gaurkash@quicinc.com/)
- Tested on top of Eric's latest fscrypt and block set: https://lore.kernel.org/all/20231104211259.17448-1-ebiggers@kernel.org/
- Rebased and tested on top of Linaro's SHMBridge patches: (https://lore.kernel.org/all/20240527-shm-bridge-v10-0-ce7afaa58d3a@linaro.org/)

Explanation and use of hardware-wrapped-keys can be found here:
Documentation/block/inline-encryption.rst

Testing: 
Test platform: SM8650 MTP

The changes were tested by mounting initramfs and running the fscryptctl
tool (Ref: https://github.com/ebiggers/fscryptctl/tree/wip-wrapped-keys) to
generate and prepare keys, as well as to set policies on folders, which
consequently invokes disk encryption flows through UFS.

Tested both standard and wrapped keys (Removing qcom,ice-use-hwkm from dtsi will support using standard keys)

Steps to test:

The following configs were enabled:
CONFIG_BLK_INLINE_ENCRYPTION=y
CONFIG_QCOM_INLINE_CRYPTO_ENGINE=m
CONFIG_FS_ENCRYPTION_INLINE_CRYPT=y
CONFIG_SCSI_UFS_CRYPTO=y

Flash boot image to shell and run the following commands

Creating and preparing keys
- mkfs.ext4 -F -O encrypt,stable_inodes /dev/disk/by-partlabel/userdata
- mount /dev/disk/by-partlabel/userdata -o inlinecrypt /mnt
- ./fscryptctl generate_hw_wrapped_key /dev/disk/by-partlabel/userdata > /mnt/key.longterm  OR dd if=/dev/zero bs=32 count=1 | tr '\0' 'X' \ | fscryptctl import_hw_wrapped_key $BLOCKDEV > /mnt/key.longterm
- ./fscryptctl prepare_hw_wrapped_key /dev/disk/by-partlabel/userdata < /mnt/key.longterm > /tmp/key.ephemeral
- ./fscryptctl add_key --hw-wrapped-key < /tmp/key.ephemeral /mnt

Create a folder and associate created keys with the folder
- rm -rf /mnt/dir
- mkdir /mnt/dir
- ./fscryptctl set_policy --hw-wrapped-key --iv-ino-lblk-64 "$keyid" /mnt/dir
- dmesg > /mnt/dir/test.txt
- sync

- Reboot
- mount /dev/disk/by-partlabel/userdata -o inlinecrypt /mnt
- ls /mnt/dir (You should see an encrypted file)
- ./fscryptctl prepare_hw_wrapped_key /dev/disk/by-partlabel/userdata < /mnt/key.longterm > /tmp/key.ephemeral
- 

- cat /mnt/dir/test.txt

NOTE: Evicting a key with HWKM is not supported in the current SCM call for HWKM v2 chipsets, TZ already supports a different call for this.
Changes will be added separately for these after further internal discussions. But this should not stop merging the existing patches.

Merge Strategy:

This is an open-ended question to the community and the respective component maintainers.
The changes have the following components.

- SHMBridge patches (Bartosz Golaszewski)
- Fscrypt and block patches (From Eric Biggers)
- Qualcomm SCM (This patchset)
- Qualcomm ICE (This patchset)
- UFS Core ((This patchset))
- Qualcomm UFS Host (This patchset)

It would be ideal if one maintainer can take in all the changes together since working with many immutable branches shared with each other might get tricky.

Gaurav Kashyap (15):
  ice, ufs, mmc: use blk_crypto_key for program_key
  qcom_scm: scm call for deriving a software secret
  qcom_scm: scm call for create, prepare and import keys
  soc: qcom: ice: add hwkm support in ice
  soc: qcom: ice: support for hardware wrapped keys
  soc: qcom: ice: support for generate, import and prepare key
  ufs: core: support wrapped keys in ufs core
  ufs: core: add support to derive software secret
  ufs: core: add support for generate, import and prepare keys
  ufs: host: wrapped keys support in ufs qcom
  ufs: host: implement derive sw secret vop in ufs qcom
  ufs: host: support for generate, import and prepare key
  dt-bindings: crypto: ice: document the hwkm property
  arm64: dts: qcom: sm8650: add hwkm support to ufs ice
  arm64: dts: qcom: sm8550: add hwkm support to ufs ice

 .../crypto/qcom,inline-crypto-engine.yaml     |  10 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi          |   5 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi          |   4 +-
 drivers/firmware/qcom/qcom_scm.c              | 240 ++++++++++++
 drivers/firmware/qcom/qcom_scm.h              |   4 +
 drivers/mmc/host/cqhci-crypto.c               |   7 +-
 drivers/mmc/host/cqhci.h                      |   2 +
 drivers/mmc/host/sdhci-msm.c                  |   6 +-
 drivers/soc/qcom/ice.c                        | 351 +++++++++++++++++-
 drivers/ufs/core/ufshcd-crypto.c              |  87 ++++-
 drivers/ufs/host/ufs-qcom.c                   |  61 ++-
 include/linux/firmware/qcom/qcom_scm.h        |   7 +
 include/soc/qcom/ice.h                        |  18 +-
 include/ufs/ufshcd.h                          |  22 ++
 14 files changed, 785 insertions(+), 39 deletions(-)

-- 
2.43.0


