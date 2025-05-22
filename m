Return-Path: <linux-arm-msm+bounces-58981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A62AC025B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 04:16:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25D871B66D91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 02:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B188634F;
	Thu, 22 May 2025 02:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pLl0Al9U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429B3126BFF;
	Thu, 22 May 2025 02:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747880174; cv=none; b=h7cPdwkPKHCrlRTlRO4Q4cIXUfUfBt98qrxMKdxufvcaziYO0GJOhJMdxuMK9rVXZefo6h880583pRX5nX072PE6ff30yfratzMk8fcdwUZSiW6YCsXgRfwAWWKH62nT9DrefOHtbxbeoxNgVGaiUGDwz0AuMEsho/G/hhRgUnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747880174; c=relaxed/simple;
	bh=lzOcx99qVQ2hGV1odStv02k39hCzfRrsaK6LK0CYjdA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=P9LF4/b6bvCjQy3VvW3jc6bFoDlOO2YzQDON9fHOUus7C9xoamV8sP0wkawPPItq7o9GAMbdhl6mU6Yp98r+2oLvdXI+minh9xNNixwP7wWBxi2QPDeaxVuKAbL+cGEI+KLx+rnE1l/yEWyyG/p2sBP3Z0ILjQ2uuSwI5yTfEZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pLl0Al9U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LHp0CM020601;
	Thu, 22 May 2025 02:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/gyQwGN0xXP0EhyED4iEkc
	ebE33+j0NNrI2jWgznRNk=; b=pLl0Al9UZSYN4dT2ETH2BP4UPQmMGEk8bJY0Px
	4SvxAWNyKwznLsLdHRpZ69fWDPioq4zvQzZV/8ecd6ntPtME62XIu7McYGzyE/Vx
	DQvBtyXWWzsBPDPtna0RASfmeR5Nj5XCUwU2SeCA4PM5VPIRwkoY5Bbm4HpmG1uY
	u1VU//Jct1yiYVAv5W8lfg5Oro3lNYd2XHAsaiY8/6ale0vUF39LBDr8ZlgAPbyW
	Z9hIGnuhpYHdElpg/JPPB00ShBoDJxQoQPCjrSk9xK6Wp2Ixl7Ap2mRBdri9xgYR
	AAYHlN30DOWJNg2Z5zmbqXb9VCDjXcfIeimBVMimq6sR1hig==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s9pb31pt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 02:15:44 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54M2Fg6k011735;
	Thu, 22 May 2025 02:15:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 46pkhn5p4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 02:15:42 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54M2Fgia011730;
	Thu, 22 May 2025 02:15:42 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 54M2FfXh011727
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 02:15:42 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 3C87540C05; Thu, 22 May 2025 10:15:40 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com, neil.armstrong@linaro.org,
        luca.weiss@fairphone.com, konrad.dybcio@oss.qualcomm.com,
        peter.wang@mediatek.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        =?UTF-8?q?Lo=C3=AFc=20Minier?= <loic.minier@oss.qualcomm.com>
Subject: [PATCH v4 0/3] Bug fixes for UFS multi-frequency scaling on Qcom platform
Date: Thu, 22 May 2025 10:15:34 +0800
Message-Id: <20250522021537.999107-1-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=WJl/XmsR c=1 sm=1 tr=0 ts=682e88d0 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=qf4gfuq51q0A:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=5VHRwT-5Lh4Tu3CGrGIA:9
 a=3ZKOabzyN94A:10 a=k40Crp0UdiQA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: TiCrAKGQdRaTaapFGjakmcJBO-qVwY3b
X-Proofpoint-GUID: TiCrAKGQdRaTaapFGjakmcJBO-qVwY3b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDAyMCBTYWx0ZWRfXxh4louBoxtYQ
 Hm4EN3b+NYvQ7syw0IEqgfoEEBi9dZT0avaJoC2BJHJyLcY9loB50uzSrdzhFUkgv2rHs3x8pVg
 mGrYMjWtmhu5vcyivD7s6F40DkmmnFNfNh9n5/M4pGfMf7UxMBoOFTftBTEn9xqsD7chl7iOTeb
 ffux+f1em0MjcmZSUzJEGR8wJl59pmsY2IGpRQO4pbgGyNTDFzi6fyGQ3kd9Pl+zHmiokBxur4H
 wwb/MU1Istc8k2HLXzV0/LZ4V3nrgdvweCo3HCoZ2TJ1deeKtNm7iFrJp25+u/WrtcE/2Lff9Oj
 frB5pt6QZUfy8SRncA3/OFeNCrRrge53uIicC1jWlcO+b7tg6+MhX+D+9jWVZzDcw5lrg58SrEk
 0IFVGmTr9PboaHULQf+a5RU2CbX/vEZdkfL1nuC6OKG8G8fA88S3K9IWv3rzWEaDABuduCJz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_01,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220020

This series fixes a few corner cases introduced by multi-frequency scaling feature
on some old Qcom platforms design.

This series should be applied since 6.15/scsi-queue to fix the bugs of series
https://lore.kernel.org/all/20250213080008.2984807-1-quic_ziqichen@quicinc.com/
"Support Multi-frequency scale for UFS".

1. On some platforms, the frequency tables for unipro clock and the core clock are different,
   which has led to errors when handling the unipro clock.

2. On some platforms, the maximum gear supported by the host may exceed the maximum gear
   supported by connected UFS device. Therefore, this should be taken into account when
   find mapped gear for frequency.

This series has been tested on below platforms -
sm8550 mtp + UFS3.1
SM8650 MTP + UFS3.1
QCS6490 BR3GEN2 + UFS2.2

For change "scsi: ufs: qcom: Check gear against max gear in vop freq_to_gear()"
Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
Closes: https://lore.kernel.org/all/c7f2476a-943a-4d73-ad80-802c91e5f880@linaro.org/
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on RB3GEN2
Tested-By: Loïc Minier <loic.minier@oss.qualcomm.com> # on RB3GEN2

For change "scsi: ufs: qcom: Map devfreq OPP freq to UniPro Core Clock freq"
           "scsi: ufs: qcom: Call ufs_qcom_cfg_timers() in clock scaling path"

Reported-by: Luca Weiss <luca.weiss@fairphone.com>
Closes: https://lore.kernel.org/linux-arm-msm/D9FZ9U3AEXW4.1I12FX3YQ3JPW@fairphone.com/
Tested-by: Luca Weiss <luca.weiss@fairphone.com> # sm7225-fairphone-fp4
Tested-By: Loïc Minier <loic.minier@oss.qualcomm.com> # on RB3GEN2


v1 - > v2:
Change "scsi: ufs: qcom: Check gear against max gear in vop freq_to_gear()":
1. Instead of return 'gear', return '0' directly if didn't find mapped gear
2. Derectly return min_t(gear,max_gear) instead assign to 'gear' then return it.

v2 - > v3:
Change "scsi: ufs: qcom: Check gear against max gear in vop freq_to_gear()":
  Replace hard code '0' with enum 'UFS_HS_DONT_CHANGE'.

Change "scsi: ufs: qcom: Map devfreq OPP freq to UniPro Core Clock freq"
1. Skip calling ufs_qcom_opp_freq_to_clk_freq() if freq is ULONG_MAX to avoid useless error prints.
2. Correct indentation size to follow Linux kernel coding style.

v3 -> v4:
Rebased to branch 6.15/scsi-queue.

Can Guo (2):
  scsi: ufs: qcom: Map devfreq OPP freq to UniPro Core Clock freq
  scsi: ufs: qcom: Call ufs_qcom_cfg_timers() in clock scaling path

Ziqi Chen (1):
  scsi: ufs: qcom: Check gear against max gear in vop freq_to_gear()

 drivers/ufs/host/ufs-qcom.c | 136 +++++++++++++++++++++++++++---------
 1 file changed, 103 insertions(+), 33 deletions(-)

-- 
2.34.1


