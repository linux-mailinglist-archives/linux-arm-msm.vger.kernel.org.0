Return-Path: <linux-arm-msm+bounces-59752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 750D8AC749B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 01:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 242CB1C01433
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 23:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AF6420FA98;
	Wed, 28 May 2025 23:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UdUalJcx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E704C188006
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 23:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748476233; cv=none; b=ZHLrjRXa2ULzu5vUv6qmToQz0kKEU19i+RgUtJcOSPj52jU/ROBv1TxOEFOT25EX8pa8zxYMdK7rGlUhbA/s7P6qXHHPuOFvgtIJLTj7AHv8qTOUU1TcRZNSh7VBBagg6P8ikpeGU0nXaDAWkiMrne1v+zlcVpJf5wcsx4+A1A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748476233; c=relaxed/simple;
	bh=DbeySvr/sM6ieT7r42V6BOeJE6c/w1wzpJwxDwDaH50=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fjdfL2ujthSKSIeT3xZElO6ckObQWZGrEQXw9YNYSYiiE1+yIO3x0JOrKO9B+pGrBFVcc55CQlyEBD2bKfcW+JXRsbOtKmXxqktg/eJv5z0wYhuXNxLoTakVjH8VdZb9X39yzgQP/2KJmTIgKaS39PceRAxZl5Fh/ZBmBumtyvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UdUalJcx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SF3dCa002310
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 23:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NEJfu7w/sAhMqmfIv8hz+5wbco5lcwAIRcg
	/3MPS5pw=; b=UdUalJcx6cttlqUDYoTe3PgN8R3hO5kcvBMx5l1TmsJUhDhrP5q
	kuKzrnTAoLYbwZTIRsAyPhpgBhWGzcsexFOEk2cI8t0aIbbcIRm797rEjDdAg8yk
	wciQtIo0cPV61iV60EN1OS+iv3vDPGG6FNnNleBqsUJVOC8veiSmB3VKhsIjMARj
	58H5V6uqdiDdk53mmau+dt5vrNGk/2QuWop33X7qWagkHJYQade3jRWSGwXJVnUx
	uf3fdjc0MpKm0iIZDi74dmaOKNnw4m7eFygEZOWamRtiRX7nGvT0/f0Vxgnpqlfz
	crEDSekNA2B6LqGT8J4z0TYYCZnTnHf0Nww==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavkwpe7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 23:50:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7429fc0bfc8so1196398b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 16:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748476229; x=1749081029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEJfu7w/sAhMqmfIv8hz+5wbco5lcwAIRcg/3MPS5pw=;
        b=gbMOlvoDRp7fR1SLNrDPnlmmvPxYzi73q0vPejsHm7oBmvWDV65yKbyT4PGVzgxCcT
         4VjK4AA2n5ske/tAxxxDZaHnLZFYfCFzYJXkJSdR2cWu8gPK+0GcHDTFmRsIGgUV511y
         3Siktlur1SAKuAi0get/Pxl5txMMgbYlOu0JPY9+ZSNm3HXrMesYcoIBo2QN9mu5eumQ
         u+Z+04PTxa+syW6mqLRinTz3rzVl2iWTMkj1dxQ3rwrv/RPlSyPaVGYfESWPFaYwBVia
         rWSIG6eZabQI9xCWTxGs7voZWJ0y8Symebq6QReXXAwuzDJLJL+gnUb9VOaBiHfuebAj
         OiAg==
X-Forwarded-Encrypted: i=1; AJvYcCXsLA3zbeUC6eUXCiCtTnE52SVP50m8L1Zr60qvOQepGHkaW/thbXitIEyxNZi0BxTyLnfJdp9Rt3tP2DWd@vger.kernel.org
X-Gm-Message-State: AOJu0YxVT5Yzl8wop+WmwhqRQDUWDlxWmlfrDonC+jgRP/Ies4eZhMik
	SQnJ0feSV6+dZkk+1Ezu1q9Rzf868TiK/Y5wdgs58vAP7qEBAIxg0zksZZCCyXEHQ/PeWxWZoLu
	n+xAB6TEwzzBcxvZr/6eL2MJ9uePiI8CgiJVrx3KhfvPVskkYfM/C/fJi5+PkIRQS80SK
X-Gm-Gg: ASbGnctn2ifILQyonLL8/R20/pJQBKeSu/OtvmiBI5DnEeMQXduXJIo/GHnhsH6p7r4
	oNX7qSbO8biV1YiRirGr1FK5SI773A7JhOHd+zlOOctCtsOPfR3/Oneq1BZCFKLv/VZFnLuJuWq
	MhNb0cnkV8fdfvLUnI9iv4oBEuBYNUazPSKksTOvTQaUgVpbINj5YDDVFRE1AuzaKPf5+B4yVmm
	tmVv9Lrdp0YWdPdpaRPPu4plKmlssn2p1fvkcDQvKa+cpBKt/oTF2F60V6Kj8oQQ41F+lDtdkw0
	m3OOfSovKT3dGH2hyIBHIe+ubRGPPIIn7QFXaaWHy/inaeF/dmNXfUc5Pa8JIMNZFGHOI6GMJzk
	=
X-Received: by 2002:a17:902:f608:b0:234:325:500b with SMTP id d9443c01a7336-234f6a00996mr20513535ad.22.1748476229048;
        Wed, 28 May 2025 16:50:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKbW1/kLYzGQbIQ/o5WdKXwB0TpfoIo+PFYWnoYFwlzs+U0mDAJrZ5d1L/i0+BsVrOUOkC4Q==
X-Received: by 2002:a17:902:f608:b0:234:325:500b with SMTP id d9443c01a7336-234f6a00996mr20513255ad.22.1748476228683;
        Wed, 28 May 2025 16:50:28 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd3506sm1403445ad.156.2025.05.28.16.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 16:50:28 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        srinivas.kandagatla@linaro.org, stefan.schmidt@linaro.org,
        quic_tsoni@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@linaro.org, dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v4 0/5] thermal: qcom-spmi-temp-alarm: Add support for new TEMP_ALARM subtypes
Date: Wed, 28 May 2025 16:50:21 -0700
Message-Id: <20250528235026.4171109-1-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: z3MyZQ4hkmKFvSY-hm1TY3N0PQzW1fy0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDIxMCBTYWx0ZWRfXwNN6YtkJmKL4
 I1bkaoZ0j7P+CnNGfOyNrPe3TP7Qj05UWocP94NbE7fIZvCwAqnQpvkqAfXsu8ESG2ry7SGcwmi
 5EmUb+4hj19O/g9mALIoU4vw5CMBm0yutf42jKtWlUN51AxFvVWC8wTk3F8YIEhcTIq87tU8wnS
 8CB/U3osJHWrTDhZcPhFCD8Ot/hSI9zC2YQukkBJr4qVxApG6RmwtQoqeJr4b6kbQCdxgW20baw
 m12+Vqk80p/BCg42ODR7OAOyMNP2MfoPfUj/VgwWfh99/SenHGstVizfTqLkHJlcABXsSSoOS2k
 ikT8z4T+0vXGJ3tNaXDRM9nnMnZVIYeOZKWAuQTVFsajIPyUFPvMkkiJ4QQWD/rABfggE6UKlSx
 z1HTsxDjT7XpbWkrSOa+9K13L/vfny+W79dLg5gEIQQq2AhscTsT2PFyLfr6+GRDtS1Gtyij
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=6837a145 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=p-nOP-kxAAAA:8
 a=EUspDBNiAAAA:8 a=R1SgPpZEabuFLtygwqQA:9 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22 a=XN2wCei03jY4uMu7D0Wg:22
X-Proofpoint-ORIG-GUID: z3MyZQ4hkmKFvSY-hm1TY3N0PQzW1fy0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_11,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280210

Add support in the qcom-spmi-temp-alarm driver for the new PMIC
TEMP_ALARM peripheral subtypes: GEN2 rev 2 and LITE. The GEN2 rev 2
subtype provides greater flexibility in temperature threshold
specification by using an independent register value to configure
each of the three thresholds. The LITE subtype utilizes a simplified
set of control registers to configure two thresholds: warning and
shutdown. While at it refactor the qcom-spmi-temp-alarm driver to limit
code reuse and if/else statements when deciphering between TEMP_ALARM 
peripheral subtypes. 

Also add support to avoid a potential issue on certain versions of
the TEMP_ALARM GEN2 subtype when automatic stage 2 partial shutdown
is disabled.

This patch series is a continuation of older series from 7/2024
(https://lore.kernel.org/all/20240729231259.2122976-1-quic_amelende@quicinc.com/)
but current series has been reworked to address the change in thermal framework to
update .set_trip_temp() callback function variables
(https://lore.kernel.org/all/8392906.T7Z3S40VBb@rjwysocki.net/)

Changes since v3:
  - Updated order of logic and made dig revision a local variable 
    in patch 1/5
  - Updated Locking Logic in patches 3/5, 4/5, 5/5
  - link: https://lore.kernel.org/all/20250320202408.3940777-1-anjelique.melendez@oss.qualcomm.com/
Changes since v2:
  - Updated function name to include "gen1" in patch 2/5
  - Added Dmitry's reviewed-by tag in patch 2/5
  - link: https://lore.kernel.org/all/20250225192429.2328092-1-anjelique.melendez@oss.qualcomm.com/
Changes since v1:
  - Remove unnecessary moving of code
  - Added new v2 patch 3/5 add a preparation patch to v1 patch 2/5
  - Updated temp alarm data function names to be consistently named
  - link: https://lore.kernel.org/all/20250213210403.3396392-1-anjelique.melendez@oss.qualcomm.com/


Anjelique Melendez (4):
  thermal: qcom-spmi-temp-alarm: Add temp alarm data struct based on HW
    subtype
  thermal: qcom-spmi-temp-alarm: Prepare to support additional Temp
    Alarm subtypes
  thermal: qcom-spmi-temp-alarm: add support for GEN2 rev 2 PMIC
    peripherals
  thermal: qcom-spmi-temp-alarm: add support for LITE PMIC peripherals

David Collins (1):
  thermal: qcom-spmi-temp-alarm: enable stage 2 shutdown when required

 drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 522 ++++++++++++++++++--
 1 file changed, 472 insertions(+), 50 deletions(-)

-- 
2.34.1


