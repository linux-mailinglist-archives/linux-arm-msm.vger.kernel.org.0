Return-Path: <linux-arm-msm+bounces-40011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF45B9E12E0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 06:31:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B11AE16176C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 05:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E3114A09A;
	Tue,  3 Dec 2024 05:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="erFGbFwJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88FA2B9A2;
	Tue,  3 Dec 2024 05:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733203868; cv=none; b=psBHFIJorzLd41AYo/CPktHredpYNCzUXJhM8ORkVv3dc6ieOVHMvq4f0eF2B4kSkyIFLh2lStSsQpozfREbXTYDrAi6XVq0lRq6ChwgrueLG+TLICHqOS14/LBn0eiHI/RNRa+E1U9H2vGIByGPp2n6FqcBTfowlUKvct2foeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733203868; c=relaxed/simple;
	bh=wYJk7XiouoR4Bc3inleTLZTeMsb9EnDJ6ivssf7uhYo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CSUreyQI968fyxUf9oeevvfCPZyE+ex1hmDfu2V6y/vJzGqd+0pEoy04pe/NyLc4N45RYUTX/D+TXONtiNJM17c4KfSf+UIOaLBntuEP/QSMgFr/ucI/yM3eRipbCeL27wRlAga6wIYjHpSfR+jeicfNqkn/vsSNTkVmRugkrqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=erFGbFwJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2IvONG008173;
	Tue, 3 Dec 2024 05:31:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ic8z5LOI5QMeynbuU6TBrj
	pC8vFyuvDqS3CTuzVa5XA=; b=erFGbFwJ+R8ODzyfbo4uUTbmc+PAerteKN61IH
	z449+yPRNE8sM7K/0TDSvRp6Z8hAkUMiYk0bbZ0BbzItfMYzLnq/TpaxGdZiNI4R
	HYmLeP5XudjGzDMh+XcDRfWvrFFrV046kjk136mLVZx5h7Bg+771OTD0mmylBoRz
	G4y5qpnVbQdE9yzugcjOWc7vIN40PSR43qN3XvS8LSeWBwW+RH9mu97utHfGGSHy
	F2guoEiej3KuK+vIUjHZaK974cl3hM3tfrkj2jBUuM9ONmy4uVovUppQrg0tKrl2
	FwK0xY6Fi+Ulj+hIecrNXKLYiOVhxZrUi7xvPxAqh8n7f9yg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437sq66ykf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 05:31:00 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B35UxCd014317
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 05:30:59 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Dec 2024 21:30:56 -0800
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v6 0/2] Add changes to use session index as identifier
Date: Tue, 3 Dec 2024 11:00:46 +0530
Message-ID: <20241203053048.1690069-1-quic_ekangupt@quicinc.com>
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
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PYRpJstUNwMcvG_f5S-HE7DeRNYH1Yrx
X-Proofpoint-ORIG-GUID: PYRpJstUNwMcvG_f5S-HE7DeRNYH1Yrx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0 mlxlogscore=824
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030043

This patch series carries changes to use a masked session index
as an identifier instead of process tgid to support mutiple PDs
from same process.
Patch [v5]: https://lore.kernel.org/all/20241202064806.1164800-1-quic_ekangupt@quicinc.com/

Changes in v6:
  - Add single-line comment.
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

 drivers/misc/fastrpc.c | 58 ++++++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 28 deletions(-)

-- 
2.34.1


