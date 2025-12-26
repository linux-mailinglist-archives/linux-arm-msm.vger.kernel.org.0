Return-Path: <linux-arm-msm+bounces-86642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B98CDE952
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 11:27:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3099300D14B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 10:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FAD3316909;
	Fri, 26 Dec 2025 10:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mvx85HhZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A4829D28F;
	Fri, 26 Dec 2025 10:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766744841; cv=none; b=apwHRByDVe36ays9trfNII8kegifYqB6OrDh0mcyM/vkX6xOoY2JxEb7uah8I1Jcp7CRHVjYRbvQvbOpf/mtL9wA9Eb080D+A79bWBQZj/nevERUchC3VuVf/GHJ6KkfKDjeMdXK60hbA3Bu7VRJQnpw4tucpNa5zZ6yswlysug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766744841; c=relaxed/simple;
	bh=ACrZwaVGgmwAL7AB8wkOMGZYe7RQ8wnHLgDpRT1cMx0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E0K6OZ/pbteF7S7AaSgJPLIMB/0SAoN0eRmT5aGOTxDjvSLrCaDro6gzNTL8ZH0qHdU+vpIxmUUNyN4Zzbw/JRRp/h5+pZSXdCyC6b2w0+jnWEbLEZjMLyI6szBXw0GRyavWSwU7c0wIYjiONKAKXvtVTwe4irG3HWxiLb23lsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mvx85HhZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BQ8bcRS1097774;
	Fri, 26 Dec 2025 10:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ny7ukMeYXBHuHcHmTqsoheqQ0OYpYl4NTp/
	JJiXh1lI=; b=mvx85HhZOHTgVg3icjmXw8UX0TUjk22oFAa18IUA0MmyPsGWIZ8
	fiTTtX8XQrTHrKSuOND3lxz4ryWm0Ayj1gmeILcUSUQlyNEs/nfyob/VtxgKsCMy
	Xo2bmaTfQF06JJXQG8W0IQNSBoYbODEDnDPowdGpTNj74pxdCjAxJ4fEmdGRPGAM
	2CjlYiSN0+jke7lVPfrn/sQkFwidAt3fPUCrbMIEkkVKuWx/ZJfPi4kxFTiGHcSy
	Gi/MfNWt0/qaOM5fOo0n6/1DX+w81a6qD5zb/Kv1d8RTt3QNbXYg//p7RMxakc/e
	igUmLiHEYc/1h9In6oopLsBYhO47BaDplmQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8v9f2wqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Dec 2025 10:27:16 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BQARCLN005917;
	Fri, 26 Dec 2025 10:27:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4b5mvmprdk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Dec 2025 10:27:12 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BQARCtx005909;
	Fri, 26 Dec 2025 10:27:12 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5BQARBul005908
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Dec 2025 10:27:12 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467392)
	id 0357523234; Fri, 26 Dec 2025 18:27:11 +0800 (CST)
From: jinwli <jinwang.li@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com
Subject: [PATCH v2 0/1] Bluetooth: hci_qca: Cleanup on all setup failures
Date: Fri, 26 Dec 2025 18:27:06 +0800
Message-Id: <20251226102707.3449789-1-jinwang.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-GUID: QF-cwhbhyiQeqbEucDzzs_VlCm-CflPb
X-Proofpoint-ORIG-GUID: QF-cwhbhyiQeqbEucDzzs_VlCm-CflPb
X-Authority-Analysis: v=2.4 cv=O8U0fR9W c=1 sm=1 tr=0 ts=694e6304 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=XBxrt_mW9kFB8plLcXYA:9 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDA5NyBTYWx0ZWRfX817EcepDKXpP
 rORtndKRpI5+ePI4cPfb2vAzmN9mSgplruGgrr/RhWFm8bhEGWJuVZVC9L9E0h7f22W2RdCqNc+
 PuZnQgb8XQPeEouhOo8ffqLH0yqTM/1w7YUkfnhGX4pwSnQ818TSYraiVg4xAfhshSHVBSomdCR
 pbNpqS9bgZfk4TDCpKCjK80D8MXsAwBDohzNIk8PWxUIiXb9CMVtxuT7Aq/E5uMbvCUgWe2mZAq
 L8q6aQBBloTRLdcl5R1MWZghjDPyw/kkSot6Vo/UUTBJsnZX9easpIrh2HOb7hbnxw4OkzyvL3g
 9IwTSiaZjdpX8Qe3tvKMWoS+HPLPqZgE4yOF6drlSmCK2hqh3hxK0k1Rx1L3S8mL1XghHDsm7+r
 AfNfdS6bCex3t5eBGnAVJ6H/lGdQZ5IpNgCKV9N5DlHgChMFkKsmB4gYSDjHLzmcutGRx4ZgPVG
 e3k4lufImruAqokjQuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260097

The setup process previously combined error handling and retry gating
under one condition. As a result, the final failed attempt exited
without performing cleanup.

Update the failure path to always perform power and port cleanup on
setup failure, and reopen the port only when retrying.

changes v2:
- Only reopen the serdev port when retrying.
- Return on the final failure.
- Update commit.
- Link to v1
  https://lore.kernel.org/all/20251222123824.3000167-1-jinwang.li@oss.qualcomm.com/

jinwli (1):
  Bluetooth: hci_qca: Cleanup on all setup failures

 drivers/bluetooth/hci_qca.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

-- 
2.34.1


