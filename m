Return-Path: <linux-arm-msm+bounces-77037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C5CBD40DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 17:21:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E09E1406532
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 15:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A776230C357;
	Mon, 13 Oct 2025 14:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bdqkbqVW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A232830CDA6;
	Mon, 13 Oct 2025 14:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760367215; cv=none; b=t3JIbwWBy+QtsVQpCZ+9Yym6DX7t91H7+oAPFjj326qUJsB/Jm+Ff2WRbYVmf5PANFsKTq9juWf3MTK5UfAMmW/Wexu6Y75rwwfdo8SdKpfyZ02KXBzFHknFBt6uNAnb0ACYBBNmrJ7WPWo35CaWXDlWjYfKjhOXiJ9xsicg4Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760367215; c=relaxed/simple;
	bh=vXgZHGLV+vrSbr2V2AcsRP31cgZuixWbjqoaBJSPGlc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=j5vVqEyTvTxDUsg+cH/aO3vmlloCv/ojOvNDFOHuzxw/uy6f1uwlAz9sGANWe8p2m+mDAN8Vxo3nLMEhqnhWSzVHsXEEFD56qapkWPagkakcZItdKVNSu+CUlfy0St/YVIo5uvc8yA7mLObVXssKv3Hqd8CymLTpUZLhr6wIgnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bdqkbqVW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D7QpWM013107;
	Mon, 13 Oct 2025 14:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iCUnh79ch5KB6udbNdKrZ68OI7hRghip3CA
	voijZZMM=; b=bdqkbqVWQN7CfoptngwfGYBw896xoRsPB7EHYSGQkqNZf33i5fw
	6cRwg4OEi0JIl/8z0EogrkIZNAUpsnzVqQ/dSk+YLH7QZX6vUrtAowuvfjV2pIV5
	N8NUuekFZLr5lKWs7vfldu57KLCwoDhrSqifTBCl+7y/1kAKRtcBQ39ZWTcQKdGU
	xnv+7pCgMHC0a41CqSS3yJ2ekWUgDp+n8JvvTyx+jUDU0Xd7Vkg1cdPfFXnGk9E2
	X1vVYviJxi4LMn1wGv8ygOe/UFOfO7zj75eoJLMHLxs6rjQ1SKAoL5caqA3Ed618
	wVqPwDSAvtVdUyEYzopAMJC4jbp61vCRqjA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1a9b3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 14:53:26 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59DErMIK025960;
	Mon, 13 Oct 2025 14:53:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 49qgaktjdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 14:53:22 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59DErLE6025955;
	Mon, 13 Oct 2025 14:53:21 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-rampraka-hyd.qualcomm.com [10.147.247.88])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 59DErLpv025944
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 14:53:21 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2305851)
	id 62FCF5C8; Mon, 13 Oct 2025 20:23:20 +0530 (+0530)
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com
Subject: [PATCH v5 0/4] mmc: sdhci-msm: Rectify DLL programming sequence for SDCC
Date: Mon, 13 Oct 2025 20:23:12 +0530
Message-Id: <20251013145316.1087274-1-quic_rampraka@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68ed1266 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=1A1B0rMuCxM-LqAl2UMA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: doIx6vp42mCXb2g2sEBKxNtixOohfVnO
X-Proofpoint-ORIG-GUID: doIx6vp42mCXb2g2sEBKxNtixOohfVnO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfX2+03uFyPMILk
 i0/CHgrBpb+pSIGLIMhAvlXjRLWTCOzONRLApfHavRHL5Xl+R7RTTBz8+fjXqTVuEEODJK6TiY4
 PwDfmzmsODUOwygZyAo1D8HpUdDbunzUfnUWdoD8F/6gRyLSt6G1azAK5U26J+nJdsJ3AR2xg8Z
 F6DZUh6Rgmcc4w9l/YF3oPjiar/F/pzpKepBp+TfxwX/b5W8uvIugDoNwImEj5Am7NzguRPYFyO
 TR524qeGQry8SfAHSoulkw5CVmR98bhEzHMbds4EZIT5dXjGvFdm66IetkbZtuxFt88w4DSKujS
 5Q1Dg8ajhRFP0XQdW6AKtw7sAPd+R+tE9VVDpUXQmnTwHfii4AC+yGfsj6t9Yheh1cv7xx8cqLg
 Pxjp52+/seoLSLGACd8ccNEUWh4AuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035

With the current DLL sequence stability issues are seen in
HS400 and HS200 mode for data transfers.

Rectify the DLL programming sequence as per latest hardware
programming guide and also incorporate support for HS200 and
HS400 DLL settings using the device tree.

Changes from v4:
1. Addressed Rob Herrirng & Konrad Dybcio comments:
   a. Regarding naming of dt entry.
2. Addressed Adrian Hunter comments:
   a. Regarding parsing of dt and storing variable in driver.
3. Additional change:
   a. Changes in patch 4/4 according to parsing change.

Changes from v3:
1. Addressed Dmitry Baryshkov comments:
   a. Regarding clk division by in V2 patchset
2. Addressed Konrad Dybcio comments:
   a. Renaming of parameters
   b. Memory allocation
   c. couldn't address __free, as didn't fit here
3. Addressed Krzysztof Kozlowsk comment:
   a. Regarding the dt binding
   b. commit message to reflect the need of dt
4. Additional change:
   a. DT parsing logic
   b. Maintain backward compatibility

Changes from v2:
1. Addressed Dmitry Baryshkov comments:
   a. Regarding TCXO frequency.
   b. Regarding clock rate.
   c. regarding checkpatch.

Changes from v1:
1. Addressed Tengfei Fan comment, added missing semicolocon
   in sdhci_msm_host structure.

Sachin Gupta (4):
  dt-bindings: mmc: Add dll-presets values for HS400 and HS200 modes
  mmc: sdhci-msm: Add core_major, minor to msm_host structure
  mmc: sdhci-msm: Add device tree parsing logic for DLL settings
  mmc: sdhci-msm: Rectify DLL programming sequence for SDCC

 .../devicetree/bindings/mmc/sdhci-msm.yaml    |   5 +
 drivers/mmc/host/sdhci-msm.c                  | 316 ++++++++++++++++--
 2 files changed, 302 insertions(+), 19 deletions(-)

-- 
2.34.1


