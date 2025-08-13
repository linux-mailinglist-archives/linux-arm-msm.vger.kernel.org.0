Return-Path: <linux-arm-msm+bounces-68864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF01EB23EBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 05:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B57C189CEB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 03:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F88D29B8F5;
	Wed, 13 Aug 2025 03:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GzPfOsjR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C861E3DDB;
	Wed, 13 Aug 2025 03:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755054433; cv=none; b=hGA8kpek5b5VJnT0hUqUDdRAokaE5KSpzfh1vM+I6bseXvUt46yOdw0MIh8tnasKQDz2zuFtpV17osfX4IInMiBGlOpVbUZfhXyXgymeTN0DS1e9KHY6hCQnPwPIeoPoboVxZIMfP54E6IsDlG3sQyr+3+4RJ8MQqfa7KoiL218=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755054433; c=relaxed/simple;
	bh=MEoAc7TPYE8ygQ8y+xMrBzxhxVQHdjRmbJoDoLLK6lM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sik+yIG0dOf3rVEswkDMwT2VsS/xXgOTJud+5Q+q21Z+XDy+XUGwMevJ7GWjdUN5V9VssUz6JovSClW6zV78aHhGlHjAXTGwHFLK7GoNwuQnZw0FpWCxh0BxnjG3T0TY0EctYYmOWEEZLjgv6F/5E9KAO2tI0OEeYzeLVB+lKW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GzPfOsjR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CJT0Ib025655;
	Wed, 13 Aug 2025 03:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tPrkZ7G4xkJuAyn6k7vawU
	oFD/v0UauaMNQHDOVvi0g=; b=GzPfOsjRsxd2SkX4NWCD0DLXKkf/5JZy9SVwdn
	9PXpQUVInHkQb6wWwvSEc0d06kIJi6fsZrHX5Qv8EW4PWQeXKfulqGmtjaxqOPcK
	6hcaqjrX1tOjz86F+7qKR5dDInJTVJVdcy3ta05v68x7nUZ0xgIq3j1q4vwrtRqW
	fQHO1tlqYoHKHTooL6zoTL71f6fkuHFKUWt7+4+Hx7AfpyqSwHQkPyHQCmHwFJM3
	S5yKWDxBswJIcdjkCdk9RIYegik/Q0zo6BWjwEzlO2LwRLW26OG7HyGQfXndcP5r
	RGqtNpe4afaZOhWGmhT02DZLrvfrkHXq1HkeSNo6U3H+zC2A==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9stej4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 03:07:05 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D374NB029787
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 03:07:04 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 12 Aug 2025 20:07:00 -0700
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
Subject: [PATCH v10 0/5] Add support for gdsp remoteproc on lemans
Date: Wed, 13 Aug 2025 08:36:33 +0530
Message-ID: <20250813030638.1075-1-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689c0159 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=qgJfyGv91k1fQCYRv54A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: TZ9Api2L4Q6jQ_swmd18kL7uSOWqEkBi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX+tGszF4cIbe5
 Ijpfwv7tL0skrC1/Y2vVG3BMMr95aprHl4hvCBCrgeKJ+sJtr+Dsl8mbDZ4sDnJ835LGBMLnO/A
 CqN/uqEvxR+sXvQ2E4xZxOUSxf+kf23X/rNa//qT+uCMM+ZBSPSr0iJewEd8nPbBmJY9s8CfKqO
 CKLHiFkxnxCL3wP4n0j0FycgPlsCps2m6w6Cu8c0JDX1yh2kmjU+PzL+9Fdq0KbD1AAEGGKeCB8
 MRRxtAU0RsFySZeRVP9Lz35gdZ7IQXc0/hhnaUIAhpzIQesZOO9Gh1LrZehIs3LpN7928thr3pK
 WSjpexoGYgWGEgEscrYBIgrdRbzj8htgmNHZFYNt0211SNIy209rQIDCqENyHHiWisKIP68mBCj
 ZqX9fxUD
X-Proofpoint-GUID: TZ9Api2L4Q6jQ_swmd18kL7uSOWqEkBi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

The fastrpc driver has support for 5 types of remoteprocs. There are
some products which support GDSP remoteprocs. GDSP is General Purpose
DSP where tasks can be offloaded. Add fastrpc nodes and task offload
support for GDSP. Also strict domain IDs for domain.
Patch [v9]: https://lore.kernel.org/linux-arm-msm/20250716132836.1008119-1-quic_lxu5@quicinc.com/

Changes in v10:
  - Rebase patch because the file is renamed to lemans.dtsi.
Changes in v9:
  - Change the patches order.
Changes in v8:
  - Split patch.
Changes in v7:
  - Edit commit message.
Changes in v6:
  - Edit commit message.
  - Remove unused definition.
Changes in v5:
  - Edit commit message and add sapce before comment end.
  - Move domain definitions back to driver.
Changes in v4:
  - Split patch and change to common syntax.
Changes in v3:
  - Restrict domain IDs to represent a domain.
Changes in v2:
  - Add GPDSP labels in dt-bindings.

Ling Xu (5):
  dt-bindings: misc: qcom,fastrpc: Add GDSP label
  arm64: dts: qcom: lemans: add GDSP fastrpc-compute-cb nodes
  misc: fastrpc: Remove kernel-side domain checks from capability ioctl
  misc: fastrpc: Cleanup the domain names
  misc: fastrpc: add support for gdsp remoteproc

 .../bindings/misc/qcom,fastrpc.yaml           |  2 +
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 58 +++++++++++++++++++
 drivers/misc/fastrpc.c                        | 54 ++++++++---------
 include/uapi/misc/fastrpc.h                   |  2 +-
 4 files changed, 86 insertions(+), 30 deletions(-)

-- 
2.34.1


