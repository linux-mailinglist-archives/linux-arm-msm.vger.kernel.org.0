Return-Path: <linux-arm-msm+bounces-79319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CC986C180B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 03:30:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 797A13475C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 02:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83F322E92BB;
	Wed, 29 Oct 2025 02:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LiltkFIK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DA72E62D0;
	Wed, 29 Oct 2025 02:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761705008; cv=none; b=UIc4JTHJs31LGv7h/1rN/knBjwaSkZB/LuMlN0Tu8ImA+UZEQFVM0njo+Enhf2yerRcv+3oh3FZOfozmW/fo87ONbLSDcD27a9m0O4444NMcqzsi6oW9fEtKVIw9efU5JsvIli9sF9GGheeAAOCp4323YMLNMqXdAPa+nvednDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761705008; c=relaxed/simple;
	bh=6C76wERh6lL91MWw05AiL7uuEXnPJKIt5s+me1hfE10=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tRlJ20PhhKQ7L+xAUosOXkZxYZ4Z5TAcySx7SGKTgBAzKD3T8Cbl/JnylCC1QpFw+7Fpb1ozuHJZQ3BxkqQxJZ2BqORfE1OqU1WUazIZgHjsHbtA2wa1mqWivgwlx8LqMJlZifRUaoO+yyNAML2MBOtS8fAJfi1UHwWeOARh/YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LiltkFIK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlY1g2525473;
	Wed, 29 Oct 2025 02:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gYKzlvGuO5gD+SUsakW9eXf/ZcuyOH1nyqq
	pA23nH6s=; b=LiltkFIKsrk5PqoBxUL2drCIlv92MLB+/2E2sZyL9rO+5b8dcIQ
	DM/PASEoU4VO0qYJd1IWJAjlt1Xb5kCyD3FwLatfA3FWYh4Zlj4m8TY8Nj36EwtX
	+d3RAl4U242Liz5cotP+ZkYehg5xoonuuIjawRBvcABIWbFA0u9kSCHrF70Rgi/f
	4lk0tqASY/BI5ahGDYStzX4VnBY5EZ+yqxAGON0Jv6EaWiaw2gSdScIRVg7z1yRl
	hIQFtU+2LzcOBf9SApEymxr/znWmIEVXVBIwDEFSyXJTwH5OLW5K7Z3RmMe9YQAc
	RZOTK1zHYf65ygjaLcO50I9vMJZhj/4jlEQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a3rvux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 02:30:01 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59T2TxcQ018234;
	Wed, 29 Oct 2025 02:29:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4a0qmm54m9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 02:29:59 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59T2Txeb018228;
	Wed, 29 Oct 2025 02:29:59 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 59T2Tww1018225
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 02:29:59 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id BC4B522C78; Wed, 29 Oct 2025 10:29:57 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: dmitry.baryshkov@oss.qualcomm.com, marcel@holtmann.org,
        luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org, stable@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_chejiang@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v2 0/1] Bluetooth: btusb: add default nvm file
Date: Wed, 29 Oct 2025 10:29:54 +0800
Message-Id: <20251029022955.827475-1-quic_shuaz@quicinc.com>
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
X-Proofpoint-ORIG-GUID: tVquSB-7xuz7ypGdFsU4JHfBgjUhm3I3
X-Authority-Analysis: v=2.4 cv=HM3O14tv c=1 sm=1 tr=0 ts=69017c29 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=e8vtPLqiCcl5ywIsyi4A:9 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAxOCBTYWx0ZWRfX20o2lGPoJzf4
 +hue9WsTo9L9ucWpdg1CtKKQiBL5p1/McVkFsPOVtNRMDCfOuVDgO22bxf+l3NfY4x/N8ruNX3u
 seOZm1D3HDI4pZvvPXBnz2ObLcKVZIfuTQ9m/+Wset2I1XwWPrFclYM8iRfoi6bqGa038haXEMo
 vKZcSGnKnRRLiWGjfl6L3k/f9VAGmbCCInCDWgOnh3MY5z0hArnVlhn1oKraV/Md5bTsfHPGbpd
 qQXEiQWiTiMRYE2gwU6kWlnHf6um58KVqY9Q6pGFuUkZBEKkWBd02lLIWQnSkOOkHlnhUSDrzS1
 e9GXkHzajeRUTDALVZ5ab2QHOhlfKs75WIoic/CoGXnkF5xlHY6NYOjJu4+rtJrVCOWaH2EasvA
 7qUWAb3UJv2jhxeJepUrB9f848LqGw==
X-Proofpoint-GUID: tVquSB-7xuz7ypGdFsU4JHfBgjUhm3I3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290018

this patch adds support for default NVM file

Changes v2:
- Add log for failed default nvm file request.
- Added Cc: stable@vger.kernel.org to comply with stable kernel rules.
- Link to v1:
  https://lore.kernel.org/all/20251028120550.2225434-1-quic_shuaz@quicinc.com/

Shuai Zhang (1):
  Bluetooth: btusb: add default nvm file

 drivers/bluetooth/btusb.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

-- 
2.34.1


