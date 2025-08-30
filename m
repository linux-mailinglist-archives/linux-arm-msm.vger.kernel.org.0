Return-Path: <linux-arm-msm+bounces-71274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 806E2B3C895
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 09:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 138203AE150
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 07:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BBD21D3DF;
	Sat, 30 Aug 2025 07:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dqz9yX6I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6298E86337;
	Sat, 30 Aug 2025 07:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756537449; cv=none; b=u0dKyclBbaDVHqfpp5UbLhTztZi1JN9WXnXoAMDKAvumqmeGXE47jXumDJUs2ty5BzOR/pP5FsUQuXBYqqOqIBnVjv1eK65PSeR3ANi1BQWx+d6MjlQ5QVgYCK2XpUcD6TGuBQ+X6NqA0dUXLf2W8HOvO/SAaOH5FXryZD6VD6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756537449; c=relaxed/simple;
	bh=auCzWDGD1h5QDVx1b1tC1NJRevkvbzvUlxRrQe/Bqp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bG/GiNxxb2JkiFUmXCjCd/Lu5g4MAkBn2BOVqYToe+Q9ZezQ34zc5qF061+oWjGpZftJzqOoas2Ys/rfp2wJi3ZBVKVCWljlYDaixvBMVT5PnfKdKSLtxKAABprW9kRsPj8HODfGWE+0e/7ULg8z3i8PLXiX93oiX5nl7IadBu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dqz9yX6I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57U2plxF008843;
	Sat, 30 Aug 2025 07:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KJRnB+sK0pG3qApXkBgH92
	Qu4j4cAyXZMOLbTJDO9/A=; b=Dqz9yX6IBZZSfTWsyPyUcPYzR/oho5uvvIqdZ7
	Hq+DAMPrkliCaZ9GBhFtUKKq/6t5Qn00kxYYR+EcMGkIlpewnyG6MoSCU/Oyrl9N
	frBW5POQcRIuI2F1BzhcrhOzn7j8CG1kOeLBTU4M3QmOXhtv+POomhoAnLZ3808q
	m1Uf1QrkXuwHq6qY+QiHcesr+s+5ypt+hrezUMlmC++PlOenIygN6Tb9xMxpFlEr
	P3IxTej7gWlWSKniRYoxgCWD2p7NfhNpPRKgqewyQKOc91TNnfstTAKdZB2wdgvZ
	F0r7YOZ0Ht7vBgMMaWRi4a/uTFGGl8SO1tngZaXM/j4LqEzw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urvyr9ec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 30 Aug 2025 07:03:59 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57U72QAK001004;
	Sat, 30 Aug 2025 07:03:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 48utckgbyf-1;
	Sat, 30 Aug 2025 07:03:56 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57U73unI001747;
	Sat, 30 Aug 2025 07:03:56 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 57U73t48001746;
	Sat, 30 Aug 2025 07:03:56 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 399EA6009E0; Sat, 30 Aug 2025 12:33:55 +0530 (+0530)
From: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
To: vkoul@kernel.org, kishon@kernel.org, mani@kernel.org,
        neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Subject: [PATCH V4 0/2] Add regulator load support for QMP UFS PHY
Date: Sat, 30 Aug 2025 12:33:51 +0530
Message-ID: <20250830070353.2694-1-nitin.rawat@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: istb9w-ADsrhRLVmCWO8Te0L02FFWo6C
X-Proofpoint-ORIG-GUID: istb9w-ADsrhRLVmCWO8Te0L02FFWo6C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfXy7s79QNcszw5
 LI/hWcye6FEQ+USXgNFBNSmHGqzGmwT/dPjl+85InscSnLVDA4PuBWnbuaqmyfA5lwpZXnGxoV0
 ZxWtvdTFxCOW3YqDN8BpTxCygOguN97G+ulr7ksQ3TzwQFXSefw5w6F041hzjvv8ni1X+Q++lFQ
 7onusYHzvDxi+mY3AUsChqHA72HPw7fbyjzCMhjEDTNT5peafMWgWKucvpaTBVVNAysQsDq71NN
 BuRYl4YJ04mU94NB12sjZOroPjVey2dWmO6lJfRy1HJTIhRCQ0w6g2aKaPi63z6xUnF1xBZMnro
 q0H2mEACcufF9uoua2qcKv8q1G1eu0eZIweZDzlBraR0RuJvdBRjkTRdOWU+Be4rka2rpdfAn5I
 QGK3o6/F
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b2a25f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=zxPLyqCQwrrZPiHgX0UA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-30_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

The series improves regulator handling in the QMP UFS PHY driver and
adds load configuration support for all supported platforms.

On some SoCs, regulators are shared between the UFS PHY and other IP
blocks. To maintain stability and power efficiency, the regulator
framework needs to know the UFS PHY's peak load, as it determines the
regulator's operating mode.

The first update replaces devm_regulator_bulk_get() with
devm_regulator_bulk_get_const(), converts the regulator name array to
a bulk data structure, and uses the init_load_uA field to automatically
apply regulator_set_load() before the first enable.

The second update adds platform-specific load settings for all supported
platform to ensure proper power management where regulators are shared.

Changes from V3:
1. Addressed Mani and Dmitry comment to include phy and pll init_load_uA
   for all platform.

Changes from v2:
1. Addressed Dmitry's comment to replace devm_regulator_bulk_get() with
   devm_regulator_bulk_get_const.
2. inline the qmp_ufs_vreg_init() function

Changes from v1:
1. Addressed comments to move load configuration from device tree to
   hardcoded, per-compatible data within the driver.
2. Accordingly updated commit text to reflect the same.
3. Addressed Manivannan's comment to avoid initialization of load.

Nitin Rawat (2):
  phy: qcom-qmp-ufs: Add regulator load voting for UFS QMP PHY
  phy: qcom-qmp-ufs: Add PHY and PLL regulator load

 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 159 ++++++++++++++++--------
 1 file changed, 108 insertions(+), 51 deletions(-)

--
2.50.1


