Return-Path: <linux-arm-msm+bounces-42916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DFC9F8C85
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 07:19:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1122816764A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 06:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257861411DE;
	Fri, 20 Dec 2024 06:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Cnd6c6/i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ABD25949A;
	Fri, 20 Dec 2024 06:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734675559; cv=none; b=lNxbUXLKt6OBUb4Se5LVBQw8GF5F4ZLW3Wwqb/JmQAKg0NDOOmuQ4a8gVgSYy28joOP7q3VT8LoHNtyemorGDkmouM65sGbJnudG8uMVzcurSXsXjDVSYT2M9l5db8imWmSdLqsHD3gI0mOSU/oyCAmPfjR6TxB0zFzA060rTpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734675559; c=relaxed/simple;
	bh=3esmhTIRu33mBhwq99hPNjc6rqVxUcyMJqw12ySm9P0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EGvl7+DZ1dPkey7I4IfghEkU9e0WkY+6nsGWA66ngUiUuWkwpblJwA0YD3iIxeMrL4JDr09HLbVmE79cY5jTnaivINsFEnjzY+YSsDso4U2sTfq9t+1XFH/uBYmNcdSzO1EKQG13SrWpDlGc4exrBEtnh4Y09bhBwbmNGuvmzXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Cnd6c6/i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK5fAdZ005358;
	Fri, 20 Dec 2024 06:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=Mo9PDt3CzHwASeGRBFRXc3hyEqQtgzED4o7msV0h/Os=; b=Cn
	d6c6/ipZCMGHGNaeHj42Ln/b6IxqHRPNYxJybk+NziQeC5vNEoaWNiB2ZiIVNv5B
	gJynl2CWupjEHWqJY0gkIVuPGErLvQ7/a0e8NL7cLylt/NN1hizTnYD5jBdnwWTs
	fdPmvb+TalqqON7smozG7yE78yMGOMdv73o2DnQMB6nfGj7cahnGxsePp9IzBt6W
	IQVsXxYMATl0BGyX34+HWYV4tiGB8ZxUeyr3Rcw4HUKf7agZXMCk41tw5iziHjDK
	fh4kIRZnTiPPrGtODX6pSKwZbUmyYigQcLcTNYTpc0/LVufqZ6dNf3qTQr84Xshc
	ZAW194cK/z5bfrFJLQMg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n2n5r2ur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 06:19:12 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BK6JBsN026383
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 06:19:11 GMT
Received: from hu-anane-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 19 Dec 2024 22:19:08 -0800
From: ANANDU KRISHNAN E <quic_anane@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v1 0/2] Improve error handling in fastrpc_rpmsg_probe
Date: Fri, 20 Dec 2024 11:48:52 +0530
Message-ID: <20241220061854.24428-1-quic_anane@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BJg1zgmglM9fM4J2AVWKGNGgSJdVq5k6
X-Proofpoint-GUID: BJg1zgmglM9fM4J2AVWKGNGgSJdVq5k6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1011 mlxscore=0 mlxlogscore=587 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200051

Following changes are getting added as part of this patch series:
 - Add proper exit path label to handle deregister of device node
   properly in error scenarios.
 - Add meaningful labels for exit paths in fastrpc_rpmsg_probe
   function to make it intuitive.

ANANDU KRISHNAN E (2):
  misc: fastrpc: Deregister device nodes properly in error scenarios
  misc: fastrpc: Add meaningful labels for exit paths

 drivers/misc/fastrpc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

-- 
2.17.1


