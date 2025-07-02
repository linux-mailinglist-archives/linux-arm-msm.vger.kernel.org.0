Return-Path: <linux-arm-msm+bounces-63309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA9CAF08BE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 04:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 551AE4A6231
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 02:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B593B1BEF8C;
	Wed,  2 Jul 2025 02:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PlOMv56U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1623646BF;
	Wed,  2 Jul 2025 02:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751424853; cv=none; b=ZlysRR9zbOA4tVoasQH7ay97gXzSYtxgVHZPAdxI2vFE6ftY04aj2m1r8fe56G5Dvc3gMZ6HvnktKuhqcYbpfWgnXOCNVf1QpK44ScmHuRjT6HumNf/zg6Eo6y8Nm6G5wGiJxNHLY5IAFaNvGs0RBn/XR5BS56n+w3pKi4pSjTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751424853; c=relaxed/simple;
	bh=HWZmQhlxW86Ct2mbmS/kc63+tiN+TTGNHWuGQr2q7qI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M/Whk1E/2avl9HGYVernj7Ss0iUKsg3RSoewq6gi9Fj8hVzHmdUJoUAEhWp2Jqy13/i/ExDH6yoSUJtxyYy5E/tZ9de5KCNrqR3QCKjbEVvo5rWGD7UvZXNxV03lKZgPdmJTAJT4WQJmCkoDyjYfWJkNeuYEv7NFqk2kIhCdioU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PlOMv56U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561K1T0o024893;
	Wed, 2 Jul 2025 02:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Dg/AY+JAL1gmKcYWn8UNrx
	MwRVd2lJc8EUBRk7NM5ec=; b=PlOMv56UzQ0NxQKqFUoPBWXdon/zzfVspirMPf
	TaxSiAH6UoMOBM16DWCP8aJDcSRhglRTgKX+SDEoWRN2q/XNyU5XGBNnwggPc/QG
	VxE1XSCGgfGohAqWhnwC3aCDcanMeFOlR8jrJV8ExtxOoF2+k75amm72muVO9BxY
	bJBPnrqIrLz72sEzdZgei1Q/73eCFqtmosmE+Ye9nnXyNktbiqzEPoARASpsffxy
	fwZa2C9iPVme0x6ZNzw7Sj0WoGyYB4FTxSRKI6wHZeehwdcQew3sui7U+nrXMvx5
	BOhz5syJP2s9bT4xWh6xumoXDfS8k9VpQMBaD9/M8W+DU1aQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8022tve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 02:54:05 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5622s4su016184
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 02:54:04 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 1 Jul 2025 19:54:00 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Ling Xu
	<quic_lxu5@quicinc.com>
Subject: [PATCH v5 0/4] Add support for gdsp remoteproc on sa8775p
Date: Wed, 2 Jul 2025 08:23:37 +0530
Message-ID: <20250702025341.1473332-1-quic_lxu5@quicinc.com>
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
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hyOdIOMOitX-ikIfkv26-h2gxHt5lsFm
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68649f4d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=qgJfyGv91k1fQCYRv54A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: hyOdIOMOitX-ikIfkv26-h2gxHt5lsFm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDAyMyBTYWx0ZWRfXzwyuvqAsO/bX
 W346DgGXLBMAIAxIuxX4xo2ayhH1vrDNrK8av5poNqBDvepIchJykMIVMW5Lj9B7FHPeecUkClt
 IjOckpJeXZMhYmLg30k8gJYHaDiD+9aNqjgsFJcLuG6MahUYgAz6HJK37B8uGZ549rgQfrvhGrV
 i8S9Ft4nLn+GsFuwOfsXgycenqmLgoUKvrQKl6Dib6xNrWK2vQY2BFWN4NFjzOHyaO1fCyYO8rM
 qtUu6mj4gVMqD4GmZxfzdX19VOuPbRjMPvZbHbEaSir3aSdCdxe69fjFBg86j8yUGHFdggT1WwG
 6NgWPs8EGryMCA85lt/IUg/Gy/oKL52yiX9Dgb2s4QmOVvgQ8wfDw4tFJXukJB7TEMwlZh2rNW7
 m1V3iia0pdkO/Ox774BvHlvqGkj/tDVd4XXAqXUNQnPiJmrIQca49S4xi2EfuMbTP4eam9Tt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=718 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020023

The fastrpc driver has support for 5 types of remoteprocs. There are
some products which support GDSP remoteprocs. GDSP is General Purpose
DSP where tasks can be offloaded. Add fastrpc nodes and task offload
support for GDSP. Also strict domain IDs for domain.
Patch [v4]: https://lore.kernel.org/linux-arm-msm/20250627103319.2883613-1-quic_lxu5@quicinc.com/

Changes in v5:
  - Edit commit message and add sapce before comment end.
  - Move domain definitions back to driver.
Changes in v4:
  - Split patch and change to common syntax.
Changes in v3:
  - Restrict domain IDs to represent a domain.
Changes in v2:
  - Add GPDSP labels in dt-bindings.

Ling Xu (4):
  dt-bindings: misc: qcom,fastrpc: Add GDSP label
  arm64: dts: qcom: sa8775p: add GDSP fastrpc-compute-cb nodes
  misc: fastrpc: Refactor domain ID to enforce strict mapping
  misc: fastrpc: add support for gdsp remoteproc

 .../bindings/misc/qcom,fastrpc.yaml           |  2 +
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 57 +++++++++++++++++++
 drivers/misc/fastrpc.c                        | 55 +++++++++---------
 include/uapi/misc/fastrpc.h                   |  2 +-
 4 files changed, 86 insertions(+), 30 deletions(-)

-- 
2.34.1


