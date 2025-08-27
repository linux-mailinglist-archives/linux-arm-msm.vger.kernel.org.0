Return-Path: <linux-arm-msm+bounces-71002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5D6B3805F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 12:55:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E044D17EABE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 10:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E4034AB17;
	Wed, 27 Aug 2025 10:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QQGO7Kcz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0090A34A331
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 10:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756292154; cv=none; b=PA5lIls/ho5Jis3ai+bep3zqLKsVcc+qX9ovnw1C0HBRP4j7Pyw+e5Q7YtJgmUeOyX5u2ijCBdqTG+gRFjDdszRX1YzfWadoD8LacND9aXmKGB+zHqyXcXJQEfXQw6N8nq1YNpEZKe7HHdVcWBnSJ1dAeyLZ4RX1RPxyBewFj7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756292154; c=relaxed/simple;
	bh=F9x8TdUV+UhMn8v7bE0wMU2bAIkaskGlFBsUzzEMYSY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mWJ8MoLRwF7H8MG6X5Op44TXnKIFgGMPbgl4rpRQxl5S51PXbZR5yw6PL4n61z+JHkqsdo17BNZh8+4j1WsSibb96iCZJFL+FxENy/oV8oF/IAaMD8A1gqkwNdvBYmLfkRjh3cGx0GZhYy4J9+BzqYZ9WlkXtw0X5Ej7/2i7UdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QQGO7Kcz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kMFu031332
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 10:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9wdkqfpaZOOvxTwoHvHvU8nhHI49YCbpuNr
	KJU42fBg=; b=QQGO7KczCjbgvYYk+9uhic9rtK0iddHdETY+RpOHmkKn4up2YXn
	L1Q2n0ZfFDweFi7bZrN5hnOvJEwWCPUNlVxsJY3qdyCNIUo+2qk//dWhwyulZQc3
	ibNg1Pik+KCZdEk/Fg+yM0Q6I1YtAxf73Jd1ZgK22qkuQqoccFQpsRNRvd/ZziT2
	1aDoGUzWMxGY6t/jP86V2fQ5rRdeU9ibCoKmD+wCMFuQCQHLFaAlmSKM8+7NFMlh
	skmjYHRYKlOLd+3mCESuErznGZIvHxRiH9EWUDJoYEzTlOnlpHVitm2mqlMjQ+z1
	B1vBSEyaCnmNk7j7nQaU7Dm3842OdDTm8MQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615ma7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 10:55:51 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7720f59c0f6so145420b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 03:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756292151; x=1756896951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wdkqfpaZOOvxTwoHvHvU8nhHI49YCbpuNrKJU42fBg=;
        b=TTwLMBmzbmPsXGNpq75gbTaAVIO4SuXOjOl6K825Odos1MCigDUrWqpo+IXFMFhZZC
         d2iZgiT0fgXEse88BtjIILIc2XgsiKuUX0cJeBaQSFDUgJ6ws+S4F0M6sE4ptuwrIRZN
         ECFbTYX7HwOEf5kNCAi1y2LW7VjDbF5KVo+c/0I/zOFCwCgfD3p5IpFwHMXXq2ztH8TX
         EGp7frW4aG2N6frmB31cmt+qwaXkq70HzbBnpxijqE+rXsiq6Pnn7eAHgEoLomt0P+d7
         ZoEuSmuW+an62ThcMTbLapH8Bopu4duXhQcIfLvLy8P40PYeoSN7mRP69l/O1nnajdGG
         MIVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWct20SXSK6XeJasAowi9jyrOBng4dxY5f8tObLxSBFcJeE5Zn9OA7p1LqsawcG7U6CMpP9CdIN1yUpOsBa@vger.kernel.org
X-Gm-Message-State: AOJu0YxsPXxM1JkOketioCdb3k1m9p19XPvzdNF+tU2Elfp52WCZx4jR
	UYEF+Ms1nalj1AyGPd/zrbu1EGVFiNY4iamiVLnL2toFfeVP8MsVCDR7aBc4GL7gjT3qaRmv/gn
	MIT3yP9rqpr987Fy1gr8KWYDdo7e+DlkF++2ZaDkwvYsJQ8av2orjEi5oTGcoRMrcWs4v
X-Gm-Gg: ASbGncujA3MFXoG5Qht0XjLBrNp41tqwzipl7uFQaWvfLF56xyaKsTAUkgHB9xwY4I9
	CDy5tNeb/VNVQ7ZaAplsNY/spIlckS1WnCdkA93UjUl9BKefffs0njNVliiL6f+RJlxGssNVGgF
	a89yhfkeT9zP0zY7K3eYeh7eAne7Y7TrF/ECfAwBR0lziVCFWUEpEhKUEgqGdIohTZDW31OpZKV
	Zdfwb+guzujA4Q2mfib3ygtDQ3bK/mLbtBkrZWv/g1AFLswMJqHPLDfC6kOFFs0GiubpZThFvEl
	qEFp26lHAZGj7z+322pui/ZhpNulj3OnEuWnh0p5pvTcfiMHd2Crt76SwWr4ihTCkKsFfSEyjcQ
	no8+4uv21eLYOrZ5xV8Cl
X-Received: by 2002:a05:6a00:b44:b0:771:ef50:346 with SMTP id d2e1a72fcca58-771ef50091cmr10777471b3a.15.1756292150578;
        Wed, 27 Aug 2025 03:55:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqpJCRpa3pgQwwL2DXQzr+CaxFnBbfnfaaX9zy/10KGXLksC4chuBLZap7O/yZiDteErLiCQ==
X-Received: by 2002:a05:6a00:b44:b0:771:ef50:346 with SMTP id d2e1a72fcca58-771ef50091cmr10777433b3a.15.1756292150108;
        Wed, 27 Aug 2025 03:55:50 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-771f2f2ac7dsm5573035b3a.43.2025.08.27.03.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 03:55:49 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 0/3] add sysfs nodes to configure TPDA's registers
Date: Wed, 27 Aug 2025 18:55:42 +0800
Message-Id: <20250827105545.7140-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX40kNqG22oqVK
 EmHJJ0wdTfuLrs0zA8LDTrmL1iVFFj+ea4N0nYCllJ+EBwgP1o38CMhwy857YDofIwmwXsH7Fpm
 hi9WOZyLXU4ZBZsQaQFYTYDyOnAGRxeZtmFl5XpObYHGCsX5pBKEREiUa15PVdfnLQmYFsCeJSZ
 TiS2bxUTjqScv2QFSfW5hDkufRUXSQp404VMCQdR80NewcNXMxvWllJRv1MaIYDX0dCBA3c1dMZ
 Qu6cz+EiuRBVADg/0/Y3FLNv8Y1gogQAbB9dZUHP1torbwCw81OIM63TYq3mBv6hF0pAE6SGLwZ
 TwbPJZupqmr8H3KWj8NsIku1T1Y7UXhfkOHBnugfdJx3O9+lb+Eak+L+0XW6hnh5zTS9oHqwZjW
 /2sQSupY
X-Proofpoint-GUID: 3WB20KHA-zL4tRPjywMQ1VtkMZp7rCko
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68aee437 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kL9tw6tk32Vw8pM4mOkA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 3WB20KHA-zL4tRPjywMQ1VtkMZp7rCko
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034

Patchset 1 introduces configuration of the cross-trigger registers with
appropriate values to enable proper generation of cross-trigger packets.

Patchset 2 introduces a logic to configure the TPDA_SYNCR register,
which determines the frequency of ASYNC packet generation. These packets
assist userspace tools in accurately identifying each valid packet.

Patchset 3 introduces a sysfs node to initiate a flush request for the
specific port, forcing the data to synchronize and be transmitted to the
sink device.

Changes in V3:
1. Optimizing codes according to James's comment.
Link to V2 - https://lore.kernel.org/all/20250827042042.6786-1-jie.gan@oss.qualcomm.com/

Changes in V2:
1. Refactoring the code based on James's comment for optimization.
Link to V1 - https://lore.kernel.org/all/20250826070150.5603-1-jie.gan@oss.qualcomm.com/

Tao Zhang (3):
  coresight: tpda: add sysfs nodes for tpda cross-trigger configuration
  coresight: tpda: add logic to configure TPDA_SYNCR register
  coresight: tpda: add sysfs node to flush specific port

 .../testing/sysfs-bus-coresight-devices-tpda  |  50 ++++
 drivers/hwtracing/coresight/coresight-tpda.c  | 278 ++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.h  |  33 ++-
 3 files changed, 360 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda

-- 
2.34.1


