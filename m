Return-Path: <linux-arm-msm+bounces-63310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB2CAF08C5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 04:54:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EBC64245DA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 02:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C0521D54D1;
	Wed,  2 Jul 2025 02:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="p1aKVy5F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82CC1CCB4B;
	Wed,  2 Jul 2025 02:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751424857; cv=none; b=tTV3iwu6jmCEsxAyTqON7x5biipomtT7nP1qjXApahHzyL5FyDMgO1T5XBLr8AmNA8vykXAZxJDhEQl3rz4DC9k2HUJGx6fGd3GxYT7wgTDlIoR4uwMpKNqTGOsJjRV8cbuVYDdhEPvMtg+A9ubEZgabnTy46qWtlk61K3fWyrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751424857; c=relaxed/simple;
	bh=9FfNXftnoyfeNUWbTQqwXVjjQBV/Xfb1sI3VCkad5NA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GilCJvOOS8CU5TXOgfgnGYOnPaCCUbJ7sW+YYbKdpAi9qa/JQuweNSqUFQ7l7Mfvo7DT9MBqP8ywNmN8+Gtam+gH0Zmj/d2oj5a2T+UYbRSmJssrBAl5KYpTQunmMPekG6bUszhRqWo+hjq+rL3W8NxzwIpzmC9YzDrU0xeQTBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=p1aKVy5F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561HhFS6000415;
	Wed, 2 Jul 2025 02:54:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fh32sk3oHjOabXoWNT73Qy/sC7KekH2ZXEqZcjPETXU=; b=p1aKVy5F1o43V/z1
	1bTDLndlNmsu1rdAtDGNCGYrAualSKDHdAb6TgDo51VvIoaXZ7twiPotcENrn34d
	DTSJxs3igAN6SbFx3qrmIfNG86vDy1suAIKJ+ozppKhRjx0LzdfOORQb+dc+83v3
	7lrly5YZ8bHHQy7wgiiq8BQkR6gwoxX144jOu97xhRcqBFpiKjWAoOgNqwO4iOza
	Abamga91sg6DxGScO6PHe77rDwt1XZf5ksnucv61B802Iq6ssn69P3m1pLTYrdh/
	sW24BlyBSLQzTmgYdukjSnY2jAxIsbjLE9AKZHoCLoIOxJRZ9UTVfcUypPd3sN3+
	XimEiw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmawcp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 02:54:09 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5622s8lA031306
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 02:54:08 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 1 Jul 2025 19:54:05 -0700
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
Subject: [PATCH v5 1/4] dt-bindings: misc: qcom,fastrpc: Add GDSP label
Date: Wed, 2 Jul 2025 08:23:38 +0530
Message-ID: <20250702025341.1473332-2-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702025341.1473332-1-quic_lxu5@quicinc.com>
References: <20250702025341.1473332-1-quic_lxu5@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=68649f51 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=y9j2seIhk4up1NT0-iEA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: tHZwb7LuD9xNJk8WM6TDdmvboYpg2MWv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDAyMyBTYWx0ZWRfX2A5ds+hb3hwg
 1ZgAIQMbphn2sYnIplq1hZLLN3fbIaFKeu1xluYbeEFrJLI6csprqhyaClXy4igV9Y5HnewRcDX
 Wfb1n82fmQBSrRPOs+rYa6SVECD6rUitv90ey4dyNsRuB/KJ+2aVUtCIcRMP/jViRahIJt7gGLL
 R3GmIbEg6r2vyfC+F5yTrWFrl5wV1HyWhSh5OV11oWZwOG3P+n9JhmhF/RAFyAtvfp1QYffl5qG
 IBp0IhzBy9I7OsGb7IxLi9vZY8Qo9duQsX7Yt0Qw8ccfwBMCfTk4S8dyCAkqtMMGkJL44T11UT1
 +rmo+rHaT2yKCIYZTE+c7F1u7sMlzdSGtf83qYklDMKk0Ty1PnZCwAHqyw986ZdTf+NsO3UXnbs
 x27WDklIqTGiX7YyoaX4eOq8F+sW637NHM90d9vNbX1iNLulH928QeN36xu7sGaatJERnkfA
X-Proofpoint-GUID: tHZwb7LuD9xNJk8WM6TDdmvboYpg2MWv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020023

There are some products which support GDSP remoteprocs. GDSP is General
Purpose DSP where tasks can be offloaded. There are 2 GDSPs named gdsp0
and gdsp1. Add "gdsp0" and "gdsp1" as the new supported labels for GDSP
fastrpc domains.

Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 0840a3d92513..3f6199fc9ae6 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -27,6 +27,8 @@ properties:
       - sdsp
       - cdsp
       - cdsp1
+      - gdsp0
+      - gdsp1
 
   memory-region:
     maxItems: 1
-- 
2.34.1


