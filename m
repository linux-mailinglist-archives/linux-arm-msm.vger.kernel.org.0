Return-Path: <linux-arm-msm+bounces-57371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6083BAB0C68
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 09:56:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7F243AFBF0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 07:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6F18270573;
	Fri,  9 May 2025 07:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N/tpxrvH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36F9270560;
	Fri,  9 May 2025 07:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746777084; cv=none; b=CSsT8D08ZIPcOSScXdnYVBmMwfRR/ABPwRF8c1MnYJ3Db5w4lUhlM5d2b1p/FrgU69wlPPchMT8NpuUqWopBNToXn+4rZQgcTIHR/gUN8z0AvYjbKGBwhgUowaxjTcPlU3y75odO1+12uxr62N/nYtjQJpV1riBBmGsbq45jGmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746777084; c=relaxed/simple;
	bh=EnWnvGDkb/JKE5KBeChih8Upjz/2E3KMmIBPuzo/MlA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=khSujTDVOYYLw1o+I5/y05fVz8vXOSL67jwFv3ozqpzlARESEjJkocTcy0/do4r/AtVo+EMLS1DG/OXPOXHrMXvCP+f0AA/iy5GTHgjJUvW90u+fmStzFuYmRotwONWqLFtnQTcNSpfELOpGeP8JX42hfaBOlWftYtB83TJoziQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N/tpxrvH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54930v8D011683;
	Fri, 9 May 2025 07:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7Ug1huS4kKj2oVcIF9y8/OJBfc0rtw5zckh
	v9IlawN8=; b=N/tpxrvHp/pwDF3Kye9VfmTKmyUMAqoGBLflwat+TeWgz5eRArI
	CxMr9/ajMlb5K/OdIz8OsbNqekCkg0/QyI3Ei2IDxmpsiJZv9V47qtkpWCqSjdas
	FhSpLlaowkVtg/LFqV638449DQf0udlrCjZpIng01CLv45bOexaarJNwSoUDGwgo
	BbX9bDnakFnvlVgqZPW2cQCnWvJhCanYOFZ66d8aPNZSPUH3cz+LUy3EKaNcD6MP
	qWmpgu3HmHlcUqMR/daPfUG5BendlKaUG0bYf984OZUmOquoGeTFUBeBYzp/WzV3
	VBJSAMR/Kndocs/s86d+33r5U5g9xVTFdcw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpmku22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 07:50:58 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5497outH024708;
	Fri, 9 May 2025 07:50:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 46dc7mxntb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 07:50:56 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5497ouYJ024698;
	Fri, 9 May 2025 07:50:56 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5497otkN024697
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 07:50:56 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id C397840D81; Fri,  9 May 2025 15:50:54 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com, neil.armstrong@linaro.org,
        luca.weiss@fairphone.com, konrad.dybcio@oss.qualcomm.com,
        peter.wang@mediatek.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: [PATCH v3 0/3] Bug fixes for UFS multi-frequency scaling on Qcom platform
Date: Fri,  9 May 2025 15:50:26 +0800
Message-Id: <20250509075029.3776419-1-quic_ziqichen@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=TpjmhCXh c=1 sm=1 tr=0 ts=681db3e2 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=KKAkSRfTAAAA:8
 a=8rBbSUgJeRhHr57D6i8A:9 a=Soq9LBFxuPC4vsCAQt-j:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 7K18AzSJEsm0ciR8gLvPergFriuvLnmz
X-Proofpoint-GUID: 7K18AzSJEsm0ciR8gLvPergFriuvLnmz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA3NCBTYWx0ZWRfX5qNQovSLrMEe
 9KOSJ1/+r1BmQ1+s+BbZsNv1LN28NPPkvta95hmcF3FZ2Fgn98LYnCYdwlNl45lK6Biar3HWk1o
 JsjIhVDhWH5Z0qRUUh9eE7d9YQU7b8YvSRaMSWUukRxqrkwZIiXt6kK0I1ib4nD2MW85AQf7B5a
 qLehPSV6YSFCISzKYsd6uphK5kuSXc9AFsxp1gjKnTXw04XeYDOejDkktb6APxohYT88qLUuZ4R
 8sVmjLTJ0mjN6QEj9ZBCbYVRrheT24ooViJELoUUrRc54V7kc8LIRc+Nh330lJ6VzXDm9J3NqIb
 9tEKR/j7fJeFAmeH0SRXf7nX51qT18mcGv3TqNCZ70CPCCYSylfe62rxrHbKXgKxU6fFGZlLzwz
 RMUSnkjQ8rAeKfLU8IKLPn6qqMxVGKItHV21MHaYUKunje7tlERkG5TlPgWhQkyG3AKJwT1n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 mlxscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090074

This series fixes a few corner cases introduced by multi-frequency scaling feature
on some old Qcom platforms design.

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
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on RB3GEN2

For change "scsi: ufs: qcom: Map devfreq OPP freq to UniPro Core Clock freq"
           "scsi: ufs: qcom: Call ufs_qcom_cfg_timers() in clock scaling path"

Reported-by: Luca Weiss <luca.weiss@fairphone.com>
Closes: https://lore.kernel.org/linux-arm-msm/D9FZ9U3AEXW4.1I12FX3YQ3JPW@fairphone.com/
Tested-by: Luca Weiss <luca.weiss@fairphone.com> # sm7225-fairphone-fp4


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

Change 'scsi: ufs: qcom: Call ufs_qcom_cfg_timers() in clock scaling path':
Skip calling ufs_qcom_opp_freq_to_clk_freq() if freq is ULONG_MAX to avoid useless prints.


Can Guo (2):
  scsi: ufs: qcom: Map devfreq OPP freq to UniPro Core Clock freq
  scsi: ufs: qcom: Call ufs_qcom_cfg_timers() in clock scaling path

Ziqi Chen (1):
  scsi: ufs: qcom: Check gear against max gear in vop freq_to_gear()

 drivers/ufs/host/ufs-qcom.c | 136 +++++++++++++++++++++++++++---------
 1 file changed, 103 insertions(+), 33 deletions(-)

-- 
2.34.1


