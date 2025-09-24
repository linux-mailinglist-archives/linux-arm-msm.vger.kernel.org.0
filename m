Return-Path: <linux-arm-msm+bounces-74733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 586C5B9C8C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12F583A2851
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25CAD28B4F0;
	Wed, 24 Sep 2025 23:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TcP5LqKx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984BF27E1AC
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756397; cv=none; b=RoH6lOzSu/2SkOyBZeV1gTpBvcY8E1ZhX6fXvSplLrdpCaRVYpGu11+dE5/S20fv1sFwg31yB+QnoNViU/6mL+bp1RUlMdVa9G1wgsMHe1CGySyk7EnbFX3TuADukdIc7B42nRgjSFHeJXr+zKOxteI0e6slmADzf7EanptwX0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756397; c=relaxed/simple;
	bh=KT4ShPMIXLANybsIW6VxtTuV7gN4jM7B2/hI9Y0zV7k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=grYaH2eErAoB8iv3Nyyb3iiExTMul1tKpCzCKG0k/lH7zyKt6yeQEwBeM+2kv6/yZIbxR1lifLSsltns3pZ0upCBZvfw5eNDRFzQJM0JBpKYQHCqh5pYo5uHTVEsgT+gooD5v843Kw21ByAyvel86iXST7IT56kkvTj17LGgE1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TcP5LqKx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCUZ8v002652
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GQjtDrodqm+kp1P7e5GA5rJcackIeBkx7Xt
	o8W4z+sM=; b=TcP5LqKx+6Nd7i4JuclQORnrpoMg8Jq1/c4fGfhO8bOg4hn+8uv
	ONolC/rtN5x02hC5MzM7HFfl/HCkdwP7Pxu3/hqbF8pbz1QvU6y+a3TSlDl/jHmu
	mGzjsykSXjFyPmXhcYBX625WWQENNnmqGqDDKUbAerM/Z/i2CoBg3FKpxbb5Wp8z
	BC2f/s9qehtAiGcvnFov0aRzu8+VMSJ1IXWgeIjX8znQZkj2YvdK7NGuapPlbxmz
	0n9HrfylDEujxM7NDDIbfQ6ZzSoJ9TUdlGdPY++u9PjHWGtueIdTAGtzYOcdaBPg
	eI1xbDbwmd6AtQ3llNnlTfKGV/4NmeYjCbA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajf0k3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:26:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2681623f927so3375355ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756394; x=1759361194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQjtDrodqm+kp1P7e5GA5rJcackIeBkx7Xto8W4z+sM=;
        b=vVn8y3NL6sPopGoy+3BND5XYXGsAFovUsJ2K9RMrrnWmq8ngNJW3SOeEIJeAw15nn0
         nIgIhsuFv6kmLS7t2pRj9CzuOWil/5tSg4yA5uNxdLW+Jz0OmdxOUMAaFwj3g0R7cLgb
         NyJYzvKxZultizTwFO/HPea8XW/n3Xn28I9BMRgo0BoQ3E6Wt2AYh6wG10INH2HzQDGB
         G3dRtQv3d0OkUsEah+Ov2/3VNPzsz2n04TDjTye3zHyCGvuLViBYSsdFOxndlhr8Zpud
         eNQj5ulOiShXgAEBQBCx1oM65AfNiCoC7nZBiuPzWnLTK5981dLm+D82Ema1q3dAKt9Z
         1ANg==
X-Forwarded-Encrypted: i=1; AJvYcCURejLSC1gp2osRuMv40KuudSdoUhWFk3uWfFCbIC0aHNzj35mylLiNl3B1quUaJruufcvfrwbzXfZXFxts@vger.kernel.org
X-Gm-Message-State: AOJu0YzRNZRhzqPdxbnRK36JhNAu88kSEZLZgBxIb0o2H9hNtWi8sny4
	A2N9UG/G9EYnoj90mT+b6sobc2UejuMatc9Tga5k6C+Nf8rmWUSYNgLZPzq/ei3jQRZGRw0p8QP
	yV7Aab5fngh7U5seYCZaT+gytuDrKztdvUPc0JWOWRAR3pBwCJhbZdTyKPkVs6ZC5ZTl2
X-Gm-Gg: ASbGncs4s2rzjVwOns70nNzd0784wpOX8uE/u+hdw8YEYO7ckO1anIwW5gpsLtNuOPu
	/FYS3+KjQ0iqfBJhOXnKs+CHHiC8v8mJSVdxjXSdkoM1FBOlntuhdh1JsSrEgLZwVShoDjndu6Z
	dKp7A7B+3CXYq3gcjpVHhbxOYm6ZvOkaVHuoaTq5HRAMvtkLhsGwJ0i9cRapt+eZXlotSTYXGEI
	WxXb0ftdMFe00rn/qDgQ5ucNr0P2wSNOQj14JxzaHRbAsO4p3GJATN755zzhfnUOu6L/fNQCf7f
	OKTvbabFi4M+f8nskjsNDDo7RYNjw/W25ekWiKszOWbe7bPgL8J2Rve1ohPjkgES2/3ZH5qt9Ob
	/a8DtPgkxHTE5F5zGNXUgsF/FwiM=
X-Received: by 2002:a17:903:41cb:b0:267:ba53:8bd3 with SMTP id d9443c01a7336-27ed4a7f36fmr15577835ad.28.1758756394050;
        Wed, 24 Sep 2025 16:26:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXuz6NROEJCCwAfaZjwUd/ObLojVp7gbPqPbI5a4jnc0lC0U/zZvVWy96pgUlXuOuy5c3Ung==
X-Received: by 2002:a17:903:41cb:b0:267:ba53:8bd3 with SMTP id d9443c01a7336-27ed4a7f36fmr15577555ad.28.1758756393584;
        Wed, 24 Sep 2025 16:26:33 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed68821ebsm4005735ad.84.2025.09.24.16.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:26:33 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 0/2] usb: typec: ucsi_glink: Add support UCSI v2
Date: Wed, 24 Sep 2025 16:26:29 -0700
Message-Id: <20250924232631.644234-1-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2N-yS88O2valc164vIVW485vVtaPccBo
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d47e2b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8
 a=AXDibm61ZLAIF834zmQA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfX82xaq7UIuYc8
 9/K7ZtWDP08mVH17A+aYDlDjtyfEH5olKhDkN2WajExEy9lAS54X/+xBtPzVNqLDnfVwoXspvz0
 mORiAp+O51UneiI/o7lZTvHCw+btDkL7W19VHd/gYZmA6sPT+RzYfYmRa3Xa7WVvA+ROpq0+/ey
 5xrIXTbAQcJpwb3hP9JoY/bSHfi79dg5+Y920CBsjQoKCTUEtJNXpdu2/jcUD/GzOTxbh7E+N/p
 JyihKXgIixgmyc2PYELwlwrnco8q0xncKJo/Seyk1XheBJjtbFka6bNr3Z0aTHbaQg5MPO0WGD5
 8T4CUMEl8U4Y6agiB9jIXa9oISq2tCqSXYXQDc04ZzqL1Rl6qb+Z0OmooqSS8Oa1AbWpNbWnILZ
 HCrvE+cu
X-Proofpoint-ORIG-GUID: 2N-yS88O2valc164vIVW485vVtaPccBo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168

UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
16 bytes to 256 bytes each for the message exchange between OPM and PPM
This makes the total buffer size increase from 48 bytes to 528 bytes.
Update the buffer size to support this increase.

While at it also update the UCSI read/request buffers to be packed.

Changes since v3:
 - Added "Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>" for patch 1/2
 - Updated 
 - Fixed if-else if conditional in pmic_glink_ucsi_read_ack() in patch 2/2
 - link: https://lore.kernel.org/all/20250827201241.3111857-1-anjelique.melendez@oss.qualcomm.com/
Changes since v2:
 - Added "usb: typec: ucsi_glink: Update request/response buffers
   to be packed" patch
 - Added length checks
 - Updated version checks to use UCSI_VERSION_2_0 instead of UCSI_VERSION_2_1
 - link: https://lore.kernel.org/all/20250716005224.312155-1-anjelique.melendez@oss.qualcomm.com/
Changes since v1:
 - Defined buf size in terms of other UCSI defines
 - Removed UCSI_BUF_SIZE and used the explicit v1 or v2 buffer size macros
 - Removed Qualcomm copyright
 - link: https://lore.kernel.org/all/20250624222922.2010820-1-anjelique.melendez@oss.qualcomm.com/

Anjelique Melendez (2):
  usb: typec: ucsi_glink: Update request/response buffers to be packed
  usb: typec: ucsi_glink: Increase buffer size to support UCSI v2

 drivers/usb/typec/ucsi/ucsi_glink.c | 85 ++++++++++++++++++++++++-----
 1 file changed, 70 insertions(+), 15 deletions(-)

-- 
2.34.1


