Return-Path: <linux-arm-msm+bounces-64175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6269AFE5C9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 12:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A1023B06D1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 10:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F44C28852B;
	Wed,  9 Jul 2025 10:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SAA6Tj3P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98402580F2;
	Wed,  9 Jul 2025 10:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752057222; cv=none; b=fx2CEbd82SccixhuPelC7dwDJvVXfa6c86cXv3TJ30vIO/9paf9X5Jwdu5xP1o8JLUONChhiSmLKNIky3WAPUYqqwPU318ktXTC+WOL5Em9Ulv7b6Y5612sXxyU3jkZLvrcNFnrTue+RuaVEjTSn2QjyMq1VeWiDYhDgrCrkBgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752057222; c=relaxed/simple;
	bh=evxnbxNdJiQRpJidwIbYDYSlAfPi1lXf9HEFeAqyEZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=PnMD16kLo/3pDCgpTMDbKx4nwR5tKSD1G2oobnQzeBsw9QeeCTwne4FayqYEv2zhag+si7rGNuOSlD4RV0JqVSTzswa1FmL9htEo5NBY3Rb0dfkk3t+EKwMKARTZZHDwy5w0a5l8jJRc7Un9yj2dTDRMQk3Y9vVgRn/fH3AGtmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SAA6Tj3P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5697Ttwi030346;
	Wed, 9 Jul 2025 10:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=v2PHR2DDu0TFELpkQm+Yxc
	D30hXA+1bfpoDVptwA8D0=; b=SAA6Tj3PIDNLnrP5p0/FUZ9sQn/mbM1w48uR18
	BK3eKPHRP3YY94O/ECwfQHKFTWor1tgm7pThzjrD8fklRDQuxX80+Un/jPDa63/N
	yPEaUlQNKiiMB3SmP6QID7d8/Yx9YcUaA+nYfjfM3QrUjTDmtEuqzYgkn9b1cexl
	TCMiL7hs0+DosWba13NeN06bQdEQf/6iBdByUCpnx8WExNI14KBrARiCwOe4xQ92
	PZ9BAjNE5cDXK6yMQznGHhTzOB8DN3XyliY61zSqtoCZeWZ3S3YcQD5Kwwq7/Wan
	ie0w5aarrsjuhOdpE2zNspSfJa096HLDs61m6NJ/rKeyc/eQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b11d1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 10:33:36 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 569AXZN5020320
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Jul 2025 10:33:35 GMT
Received: from hu-sumk-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 9 Jul 2025 03:33:32 -0700
From: Sumit Kumar <quic_sumk@quicinc.com>
Date: Wed, 9 Jul 2025 16:03:17 +0530
Subject: [PATCH] bus: mhi: ep: Fix chained transfer handling in read path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250709-chained_transfer-v1-1-2326a4605c9c@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAGxFbmgC/x2MQQqAIBAAvxJ7TjAp1L4SEVZr7cVijQjCv7d0n
 IGZFzIyYYa+eoHxpkxHEmjqCpY9pA0VrcJgtOm01V6JpYTrdHFIOSIrPfsuuhBD6yxIdjJGev7
 lMJbyAU5sdMpiAAAA
X-Change-ID: 20250709-chained_transfer-0b95f8afa487
To: Manivannan Sadhasivam <mani@kernel.org>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_krichai@quicinc.com>,
        <quic_akhvin@quicinc.com>, <quic_skananth@quicinc.com>,
        <quic_vbadigan@quicinc.com>, Sumit Kumar <sumk@qti.qualcomm.com>,
        <stable@vger.kernel.org>, Akhil Vinod <akhvin@qti.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752057212; l=1704;
 i=quic_sumk@quicinc.com; s=20250409; h=from:subject:message-id;
 bh=PhpwY58S37BveL7G5MxE5ZMM1hdgADLcuh02r6C4vaw=;
 b=HZjUTZvaTlrvZ86GmR3+aEbZluTRdqVuFB4QihoAf7cXqgIConUo/KzVFMBMAMMtWRjlXzJ+l
 NbaV91NSn2kDJY065lJFu3W0ZhyajAcH1Cxbm5DYi9XPCB21O95iV2e
X-Developer-Key: i=quic_sumk@quicinc.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686e4580 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=g1IBsBNUH_a299RqqfgA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA5NCBTYWx0ZWRfXySKsRwfhtFyF
 AhbtOOD6MwQt5DbVnCf7a4CSFgOnAKOoifl0lLtVgLJTV9Flhw4ddPd3tpKe6iRUdWZPazZKF91
 gqd1S5PwRIY5tm88EtTa8yXgSKLV2jVkN7GQCPln7uzWmuhyjiSOhPDVBn1TT7qRczqX0UBQF5k
 BGY07xeschpQjM2WhkHPwQ9DTMK/8cSd0hdz+oblaTZnY74S9/rz8o37D5frjVmoU2Pm0W1shHK
 hskZhv8HE0kMmA+dxAUtDqsRCP9+mFn/ipkLzIS9ctDNZGzox74nwAHtrkyOz0pXA2JLQfoVGK2
 tawXTBwaSqpDuyHS1cq4tcuPfnOThdyuh6jXUeK+Yf+VgpHPqaaxWpCzvSLxGFKuSjTbyypyi2r
 jRWMTC+wY+wVWw51RcyFZVxj60RAFRAEg5lajsCxhABiZUXFXaoJBfSDiuOc7x1Lsa4pdPyD
X-Proofpoint-GUID: wV7ae6Rqvf3m0bS-2mVBa71B6PbTKvXe
X-Proofpoint-ORIG-GUID: wV7ae6Rqvf3m0bS-2mVBa71B6PbTKvXe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=479 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090094

From: Sumit Kumar <sumk@qti.qualcomm.com>

The current implementation of mhi_ep_read_channel, in case of chained
transactions, assumes the End of Transfer(EOT) bit is received with the
doorbell. As a result, it may incorrectly advance mhi_chan->rd_offset
beyond wr_offset during host-to-device transfers when EOT has not yet
arrived. This can lead to access of unmapped host memory, causing
IOMMU faults and processing of stale TREs.

This change modifies the loop condition to ensure rd_offset remains behind
wr_offset, allowing the function to process only valid TREs up to the
current write pointer. This prevents premature reads and ensures safe
traversal of chained TREs.

Fixes: 5301258899773 ("bus: mhi: ep: Add support for reading from the host")
Cc: stable@vger.kernel.org
Co-developed-by: Akhil Vinod <akhvin@qti.qualcomm.com>
Signed-off-by: Akhil Vinod <akhvin@qti.qualcomm.com>
Signed-off-by: Sumit Kumar <sumk@qti.qualcomm.com>
---
 drivers/bus/mhi/ep/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index b3eafcf2a2c50d95e3efd3afb27038ecf55552a5..2e134f44952d1070c62c24aeca9effc7fd325860 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -468,7 +468,7 @@ static int mhi_ep_read_channel(struct mhi_ep_cntrl *mhi_cntrl,
 
 			mhi_chan->rd_offset = (mhi_chan->rd_offset + 1) % ring->ring_size;
 		}
-	} while (buf_left && !tr_done);
+	} while (buf_left && !tr_done && mhi_chan->rd_offset != ring->wr_offset);
 
 	return 0;
 

---
base-commit: 4c06e63b92038fadb566b652ec3ec04e228931e8
change-id: 20250709-chained_transfer-0b95f8afa487

Best regards,
-- 
Sumit Kumar <quic_sumk@quicinc.com>


