Return-Path: <linux-arm-msm+bounces-39780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5E69DFAE3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 07:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99870162095
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 06:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FAC01F8AFE;
	Mon,  2 Dec 2024 06:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EClH382l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96BF1D63F9;
	Mon,  2 Dec 2024 06:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733122105; cv=none; b=TPb5I/B0ir+zVWFSbv4dNZoHWX7HeY/5j8Ku/wJXVLkr1oCO8Dzx1wEJmJvp0mm7WVT7P27YrsAsUlUD8LTiajpXEnffiYfWni6Blgn/gKS4X/PX1g7c7LcLheqrTgzfZ3Ysyx/tWaioKqYbEKDVwSYxr3YHgnlEOi9R7HILJBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733122105; c=relaxed/simple;
	bh=w4Im53Zv924krnpGjoQ8X3vVW1o47ZdklR6s2TaDpyk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oF38Lm4VUdEEoLN3z2i3zn31YBsxMAY/PK70hcPfAgaZ6EHSTJ5S1xGXKCfjkXnvbFjEkhbk5WW3NOb31/YZtoYFgSrP4MPRIuA/U5NkGamBxODGEyslWVFjh91hpZQi/0+VXMnnII73emSnRWIhJH8dvjUNdhJk605zLtUgLZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EClH382l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B21ufd0015990;
	Mon, 2 Dec 2024 06:48:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pViOy2kXUO0v1zVrZeadHW
	GjToPcySQoy/Cj7VWaDfA=; b=EClH382lG9yxxiizY39gfDPzDPOOUK+vvohEcY
	37cTZYihG3AKQiJi8UflvttVGoe6YGVhRsmrBJlNVI5oGil5Rdk1fJJ/+ElQsqi2
	lHsgKCllLkfxb13i3ES8xHgXxK8z4SDEy8g/QyS4jWp2YzqcUe6q5v6bIlzoPvA1
	WwLhEetYtMGqvDORUxKhmJy0HoCuWRxLFq5jhKscUPLoqv5gRRWbYtYAMzpj52KB
	lNhQcroDLSyO7H38lFxz5Bx79V25wy2zWaxiCwtnbVhUW49Es3PTAR8AEvBbNl5B
	qVHQspQkKEqOZJIYxJN0XkH5m0GCMYipfjzhpkpJ1vDqfC5Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4393mp8jns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 06:48:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B26mHrU016168
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 06:48:17 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 1 Dec 2024 22:48:14 -0800
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v5 0/2] Add changes to use session index as identifier
Date: Mon, 2 Dec 2024 12:18:04 +0530
Message-ID: <20241202064806.1164800-1-quic_ekangupt@quicinc.com>
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
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: giMYcr789_GRqNqaJHHYgwZ007z_yHf4
X-Proofpoint-GUID: giMYcr789_GRqNqaJHHYgwZ007z_yHf4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=862
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020058

This patch series carries changes to use a masked session index
as an identifier instead of process tgid to support mutiple PDs
from same process.
Patch [v4]: https://lore.kernel.org/all/20241121084713.2599904-1-quic_ekangupt@quicinc.com/

Changes in v5:
  - Remove mask and just modify session index.
Changes in v4:
  - Use GENMASK for client ID mask
  - Add a new patch to rename tid and pgid as client ID.
Changes in v3:
  - Modified commit text.
  - Removed idr implementation.
  - Using session index for client id.
Changes in v2:
  - Reformatted commit text.
  - Moved from ida to idr.
  - Changed dsp_pgid data type.
  - Resolved memory leak.

Ekansh Gupta (2):
  misc: fastrpc: Add support for multiple PD from one process
  misc: fastrpc: Rename tgid and pid to client_id

 drivers/misc/fastrpc.c | 57 +++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 28 deletions(-)

-- 
2.34.1


