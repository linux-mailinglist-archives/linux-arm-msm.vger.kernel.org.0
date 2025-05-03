Return-Path: <linux-arm-msm+bounces-56666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1A9AA81B4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 18:27:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0E3B189963B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 16:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834CB27D76A;
	Sat,  3 May 2025 16:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kMWzIEiY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6331268683;
	Sat,  3 May 2025 16:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746289521; cv=none; b=um1oUPhAIkY1gpXoqBDQZ4sPTF3+O9do2Oiu5jjGCi1aCt6GrhF1G5PJbLtgkEgaAGSRSf8iWjPhbJztWt1ANdmxUONnIICVl4jtWGwhRvlyQKEnF1QFz9e/wJEDk41jgKosc85EtcqODuqG5bg/CfskyP10NCFjtSb/I2+urH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746289521; c=relaxed/simple;
	bh=YFUbEfjiwoM2IPl6ky0yvJ7jAHrwzrY0wl0Le6yyaRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IRsWxMIkh+XGwB1lCTzqBCeKsFpJnS+dPF0zWnQWqZd01AX+NCKv8pcXgcEVBinud0ZIwsvURfPNUXwxfENSZAKIq6suuEvucr5ckoOZXQLV3LRbuYmBFk7FcgfCfrfcMMz4C6BgQq/XDpEkByzb942fQrwUkorzKLCe0M0TTqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kMWzIEiY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543AuOi2013388;
	Sat, 3 May 2025 16:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=v+VnIbxF890
	Du9AsveZG/tNEfQ0Ybfeh8g60ENdwZ8A=; b=kMWzIEiYfqzFKqaY89rwUZMWXUo
	0dITNk+8ovH98ypi8H+itqBWqAxbyIPOTESY3C6k7Si+tbK01lgWAgqATUoVkY3f
	8frJxcGtIbEhXZq0vfTejhp8nXwAKpggrQdMaz+dB2JsTsKQ+/+74q+/S4IJ2i1K
	25mkB8RZ3PW+ZFlpJserCHHbbLHSuQCVr/iSMK+PhYwCdIudH3xcZ1tPveCh8zvq
	l1/ioUCXqKvpmlKKwljUtRkux1dAgFkbfvrpuqAcoWsXAHUqgC0y5WdDzj1HVG1r
	3r3+Cm5DMMrCPVDxiHr0zqZZxjkpv7KoQ0szjinG/hOPyB5/dJgu3S+AaYw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbwfgsfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 16:25:00 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 543GOrbA029903;
	Sat, 3 May 2025 16:24:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 46dc7kb1h4-1;
	Sat, 03 May 2025 16:24:57 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 543GOhc5029761;
	Sat, 3 May 2025 16:24:57 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 543GOudt029961;
	Sat, 03 May 2025 16:24:57 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 668155015A2; Sat,  3 May 2025 21:54:56 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V4 11/11] scsi: ufs: qcom: Prevent calling phy_exit before phy_init
Date: Sat,  3 May 2025 21:54:40 +0530
Message-ID: <20250503162440.2954-12-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250503162440.2954-1-quic_nitirawa@quicinc.com>
References: <20250503162440.2954-1-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uqxELhWuceALrZBbTPSLVvCWouGReras
X-Proofpoint-GUID: uqxELhWuceALrZBbTPSLVvCWouGReras
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDE1MCBTYWx0ZWRfX8KdvWmMh7BZh
 gns7ZV1gvPfRdw40jgJKDcgDFRFrgeav/240nlSKOPJHhtT+rhlVBCOdlEOezs5XvbpThFv5K5n
 rodBf20q7x4sEg2NIalQ+4R4bH9ZXPZG1mziXBltbA7kTuGBWAnfWEFg9+Pxl+hPCcmgBRRVwix
 XiMWAfdYVaVwix3qorf8NODPwzR9L+gNg7zBKxwv0+CBddU5lY+P+7tk5D+rFjJHSxfBHrFyyeU
 vZR9qRIhgBI6jnY8BEMOWVeVklsJjBSx1UvKZFQASFiqizRyLV+b1p+Uyt3u/ws4kOkmC9mWq8+
 Zc8ubLGAaJDjeXbd7W4n53QMR4ZOs0ls6zWGQxKSNc7qLeXczVXoMulp7fy3XMIgHPQx1cWqb7G
 2WUkWK0MaobBO8S2qRb3sJRjgccgYUjz6vhx6Yvd97uWGvZt8iqifzoEBBnHG52j/ExdwrD5
X-Authority-Analysis: v=2.4 cv=AfqxH2XG c=1 sm=1 tr=0 ts=6816435c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=6qkdr0EpClcQ5iOZAa0A:9 a=zZCYzV9kfG8A:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_07,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030150

Prevent calling phy_exit before phy_init to avoid abnormal power
count and the following warning during boot up.

[5.146763] phy phy-1d80000.phy.0: phy_power_on was called before phy_init

Fixes: 7bac65687510 ("scsi: ufs: qcom: Power off the PHY if it was already powered on in ufs_qcom_power_up_sequence()")
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index a7e9e06847f8..db51e1e7d836 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -482,7 +482,6 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)

 	if (phy->power_count) {
 		ufs_qcom_phy_power_off(hba);
-		phy_exit(phy);
 	}

 	/* phy initialization - calibrate the phy */
--
2.48.1


