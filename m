Return-Path: <linux-arm-msm+bounces-61216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F81AD8A64
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 13:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D2623A514B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 11:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582B12D5408;
	Fri, 13 Jun 2025 11:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YyMsduPj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF1F26B745;
	Fri, 13 Jun 2025 11:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749813871; cv=none; b=HPMOkew5XbxhFEUB///wz/rh8Vs8YxcHZdKrhL7hHY0yJLileUQ/ubTy9FIJnx7uZAm7z1yuYWyVUFVr38nXf4EDNyjk9g0ntfpPjYkzcK6ESf70q3gZbR6gdMRjafIp59jIrDtPggrN/PaC86CkHR88MrTmdFu5A3VQCjMOYOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749813871; c=relaxed/simple;
	bh=+9n9nz20eysW3hvOSwmjLXy7CUc0kgZbDK0JC3YESp8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dRL3suWd3p4r9ezzy4cwe5K8ZHn62JaNLtCdEeOCpX+VJKKLEM9SStYcROmGWr9BUYgB3oO8rWuSzsCvdUs2P/aKSmBsvprf8mmh02N8AJhUQD4en3PS1/5gcXaRc2cfmNhxRG811NLGWgkj9js2+oKtdotJMRG2HXNTazMT3z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YyMsduPj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DAsETk009041;
	Fri, 13 Jun 2025 11:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uSPnqybE6ebgzPHGOOW87x
	4xONrGUbjC03IKIpESExw=; b=YyMsduPjrcoUVv+v6tzotgHUl24hD9B8V6wdaE
	Fe76rosgG1b+MigqfjaXxqwHAGl9s0HxAS3y+dcTe1BBACgLp46VEPpq0qh0nhS4
	ZkDjNp+sZeCCVqOWHi27evAdBQ7vzmmBoN9ziirwSbc0COlrhyyp1rLKDtWkcb1F
	8RiekzLaokl6nZbLyvQbXqUqMZFBt3uK2Ym5N9aeH5RJ2bAGHFRzLutHfcHzriDS
	kQZfqdGl2WIYXMPk5z9HmJL0iKVt2E9UqD4g/eargoNIHvd4IUN/zOSo2nm3Xwbt
	Oi+5/P0s+ClvAJOvEiCDGWofDh1um7+vI3WjF238OCGzJpPQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47753by7m3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 11:24:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55DBOOti002992
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 11:24:24 GMT
Received: from hu-gkohli-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Jun 2025 04:24:20 -0700
From: Gaurav Kohli <quic_gkohli@quicinc.com>
To: <amitk@kernel.org>, <daniel.lezcano@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <andersson@kernel.org>, <konradybcio@kernel.org>
CC: <devicetree@vger.kernel.org>, <=linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_manafm@quicinc.com>,
        Gaurav Kohli
	<quic_gkohli@quicinc.com>
Subject: [PATCH v3 0/2] Enable TSENS and thermal zone for QCS615 SoC
Date: Fri, 13 Jun 2025 16:54:00 +0530
Message-ID: <20250613112402.2203617-1-quic_gkohli@quicinc.com>
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
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDA4MyBTYWx0ZWRfXzcUHV95lLTpY
 eteGq2q/CZK2E860zzW9Gbl1xBd/qqo87aelgVp4cr7GKITjqf6tYYPJcXLIfYEmIH+3/CDXwsv
 zasD5D70vP63S2HFZZCzHYM3ER8meVvJRcOMA/QPK51UfZVnbPddhTwXLVJ6luwhBBnjpCXVfdW
 C51c61IHP30KrflrNHQo/aN4E+Ui2oJYWgv2ZhUbwETUItbY4i5/tlftHzXr4vvSsE3HqrTKQpW
 6JZMsZL1D4GiPTClzf48V2NKNj21EXPOFtDrK6JHHlOk6/uDR+/jntjMx0TmU4QnNnxWtD4Uj3u
 p0h2Y2ebEomESaRlswx9nHWjywGua23yRwocgmTJsHok+qKh0VdX7KL4BLm6lDgEWpxAvle8wiH
 5XDYFSVe+8fKo8F3qNWnoIP/uuFm92DkG+59ZBXIlfraT9APxKAA8EIdBo0RO95jIdC+Bgks
X-Proofpoint-GUID: MrkMMLM8SIqJY5o8WrIyXMeD-cosLfGa
X-Proofpoint-ORIG-GUID: MrkMMLM8SIqJY5o8WrIyXMeD-cosLfGa
X-Authority-Analysis: v=2.4 cv=SqOQ6OO0 c=1 sm=1 tr=0 ts=684c0a69 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=4mZqo6zMBS7fLbI5uYcA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=761 bulkscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 suspectscore=0
 clxscore=1011 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130083

Adding compatible string in TSENS dt-bindings, device node
for TSENS controller and Thermal zone support.

---
Changes in v3:
- Add critical for all trips.
- Link to v2: https://lore.kernel.org/linux-devicetree/cover.1744955863.git.gkohli@qti.qualcomm.com/

Changes in v2:
- Drop the passive trip point and add critical for CPU thermal zones.
- Rearrange the tsens dt node and fix the address part.
- Fix the commit subject with target name.
- Link to v1: https://lore.kernel.org/linux-devicetree/cover.1744292503.git.quic_gkohli@quicinc.com/
---

Gaurav Kohli (2):
  dt-bindings: thermal: tsens: Add QCS615 compatible
  arm64: dts: qcom: qcs615: Enable TSENS support for QCS615 SoC

 .../bindings/thermal/qcom-tsens.yaml          |   1 +
 arch/arm64/boot/dts/qcom/qcs615.dtsi          | 205 ++++++++++++++++++
 2 files changed, 206 insertions(+)

-- 
2.34.1


