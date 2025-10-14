Return-Path: <linux-arm-msm+bounces-77092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C9893BD781F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 08:04:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AA9BD4E84C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 06:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BACA83090DC;
	Tue, 14 Oct 2025 06:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OWZMcuVG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DB02253A1
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 06:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760421863; cv=none; b=tC7IioTbnMwvCDU9tReeBCm98Z5eUA/IpeehvGkSYnhfHnfzlfuh2HV26VP23v4CrxmV6iwtXIVRoL15NxsGfaZfYIqICi/x18b0hTG7bgMBB+aLnPGsu5yhi3VhjImsLI00UYn4sj3koC+9coHITPmuqoeyBppeBORNbafa8x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760421863; c=relaxed/simple;
	bh=SETPzXBTnAMaQ1frJwUjp06dh5JmQoMduT94d5pFWU8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=takDKr1cW1AUKMDUvf36GdO77/6S5Mu/HyZW+w1nRfmkBO/VF0jcqFX5cms8kypbJQmvney8E/EbzTYIzE93KIifZNafF9NfQIWlTIdm/fEAqQdASa9g+dA1leh1dUIFBvN4ECRdaZmh5ftj7fAglTyAlKIvdMX8UGkxh2mwkrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OWZMcuVG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHD8k5005568
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 06:04:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XpaNi5zmsS21XsRleV8eLPwHkBN0I4IbPH8
	sMXSuuhU=; b=OWZMcuVG5EuU+Ec32Zi9AvoBchnwyDhI/2DmAlRFOKIWUIMNjhm
	J/EjtaDAhwGgFMChQs0Rz2m6rKrPOnXXiD0Ss1syc12Hd6s1xrJA0iD8JzGaoAdf
	XH5WCGQ23w7yxffc1zXgLQbGNuaU3zVMquAjhmFzz3+p3DDIbRJ2N+DqKrovz7BI
	vI38dN3rwPX7x7km/EDlBOc4U9OtY6s6/vKSucyKW9+dafQ97YIKe0+zGasXg4p3
	BQryZJiakCGg6WypVjpEzPfVXL93MZ512JMzKS9TDpOn5wJ2dXnxq1PMypqOMZNk
	/6c88rMFK7Aib22EvhbuOhJN/iKDuXwxfJw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa87bcj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 06:04:21 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-78106e63bc9so7255189b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 23:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760421859; x=1761026659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XpaNi5zmsS21XsRleV8eLPwHkBN0I4IbPH8sMXSuuhU=;
        b=U/FLmY8bfDneyW96LDKDKmbAcBDjPhxsZLWgQ7Pvbw8siPX8CaQBSg+skpo4QJvwKv
         e+rBlKTzBTjjZyv3lmdqpXOd5jPNJJKCBkrAU5ES0ILI5r5k0Ok0P/0+xdhdR67t8QVn
         mhvtP3ArweAYXDQ/skKZ61WYnLpFfn04iEaikU3Ui13VVMIyy+wcBHrAZaid+ka0OiBt
         krdMmp5n2wj0uYJQQ7DvuuGBx6lKl8O3GCbYPrY07eGf7dytKViXPhSkFPrBuj0t3uSj
         L0HR6PgTw27DykPHtTUW9a+rJiB5UJ3gcQfqix8Gqm2Oie0WPIz6DGqI6P1dPfC6+kUG
         z60w==
X-Gm-Message-State: AOJu0YwqS6+pC2UK04kPPf9xNQ8yxG5FaYFKEnNJAp+WoB9d4+7xJJdQ
	YpkVapHNFFR7ADNQxcF/EzQCFvdp2Z1UpfLADXNlmXiuiDVp4dQEHIXno338mQq+Kg9wNJ6Whjd
	EtkaqTHXaeDuy+YqUl5n5uuAJgPiZXhmhYs8JcBqj91TNDwROqs09ayOaT6ZQfk6X8k7e
X-Gm-Gg: ASbGncs7H1Me5KvK5S3nLZ1aHumJNy1H0qmztpAUvPindEgBX+1BJATtMoEI8/mnQFf
	PmjvlHK+rycE0eBJQGKwybOw3oXWKx9tcFswnGzoJOsLN1wgM+EhnQ5JsMoz6EF/aoQlyXDv6dx
	3y04pAW/XzZxnzsS8veVVKZZPy5i4S2DvFY6aIIhAV+kCx3s/RTKZejV6JeG0SaLrzShTgbk8M8
	aBx4JomrF6q3ZOKqC5cMgifSiYArSo3GNVsxDokErHc1k+DI+hFS29I33E/+XshTiyyYKjfJWRM
	e0BD776xTwoRIWgtwx6D2o41IPNLbxikI/Y8lbE/q07f5BGCBWdxVMgzji6Ibii9G0Qha4N0
X-Received: by 2002:a05:6a00:92a2:b0:781:17ba:ad76 with SMTP id d2e1a72fcca58-79387c17394mr28610038b3a.24.1760421859523;
        Mon, 13 Oct 2025 23:04:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFC6tNUKNUKSOjotjmKZx/9exMqkN4NekwtaO/BhywRYMP7gUY3U0B74E+0I+cPrGa37Hy3ng==
X-Received: by 2002:a05:6a00:92a2:b0:781:17ba:ad76 with SMTP id d2e1a72fcca58-79387c17394mr28610003b3a.24.1760421859081;
        Mon, 13 Oct 2025 23:04:19 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b0604cfsm13946024b3a.9.2025.10.13.23.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 23:04:18 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, peter.griffin@linaro.org, krzk@kernel.org,
        peter.wang@mediatek.com, beanhuo@micron.com, quic_nguyenb@quicinc.com,
        adrian.hunter@intel.com, ebiggers@kernel.org,
        neil.armstrong@linaro.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
        quic_nitirawa@quicinc.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH V1 0/2] Address race condition in MCQ mode and enhance
Date: Tue, 14 Oct 2025 11:34:04 +0530
Message-Id: <20251014060406.1420475-1-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZeWitAirq1eO3WKheSWWrgNyQ0vzZDG6
X-Proofpoint-ORIG-GUID: ZeWitAirq1eO3WKheSWWrgNyQ0vzZDG6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX7LQ/e37HmS13
 2TJtwYn6ksTHr8Ot/tE4J2I4z7R3i0TWK55xpF/gpLRSm8kae2XpGKakMZpw4dV/qlOb6fNMHyF
 Q8S69PFPenkSLrBCvlcmPNxX0HBywLkbGzGv6joIPeXf372OcUOZmsbLp8IMN/jhKVNkNUKl4Cu
 DqKTrLkwV4yDnlPAgDCcnn3bUlxCEh6w6VkwsF3+9AiJw942mhW6FHAMrAMatce9STinyEnsp+5
 GxV4bSPTH0j8AtNzcPVMI6GHWeLK3nZ+x/w4EunRzFwvkJ39sId+s9wjJH32YrNSAI8gtG+3VT6
 xOwmALJDkKTPR6K4hNcjm6eW7r28lbVzR4zZBOM1PU4b4OzVxepTlXfWBJG8PQQDzd7rN9PusO5
 bMtSk5tmD7ocS5olD2xqZJ4wQnfGLg==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ede7e5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=AlCj3w5ouSWVjIIyBF0A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

This patch series addresses a race condition in MCQ mode of the QCOM 
UFS host controller for hardware version 6.

The second patch integrates the logic into the UFS core layer by
invoking appropriate vops.

Can Guo (1):
  ufs: ufs-qcom: Disable AHIT before SQ tail update to prevent race in
    MCQ mode

Palash Kambar (1):
  ufs: core:Add vendor-specific callbacks and update setup_xfer_req
    interface

 drivers/ufs/core/ufshcd.c     |  6 ++++--
 drivers/ufs/host/ufs-exynos.c |  6 +++++-
 drivers/ufs/host/ufs-qcom.c   | 35 +++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h   |  1 +
 include/ufs/ufshcd.h          |  5 +++--
 5 files changed, 48 insertions(+), 5 deletions(-)

-- 
2.34.1


