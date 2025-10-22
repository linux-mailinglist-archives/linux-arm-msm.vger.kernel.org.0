Return-Path: <linux-arm-msm+bounces-78239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B6CBF981A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 02:46:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B72D942474D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 00:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B82318FC80;
	Wed, 22 Oct 2025 00:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VqtfG4sN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B361654774
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 00:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761093961; cv=none; b=mtFpMHWypI1nbxetCzzXi/o19EDypZUAKzewROc4jBJ5j0jy06F5vhhOhhn1VuFKuNd7qEAdNMW3ORV3i8mhRttki6OaVHJU4dCGKHzUUhu0Cd7PeICbR3wjC64aoBNi5tuGRFQtmx6zVUZ3MUuUNRn1oqzFHEibeR1hMG0ZAiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761093961; c=relaxed/simple;
	bh=Ff3ly7OYBgQF203NlkpnJPPzsPGuYU3vghG0scfKJUM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=vAKrW9dpCo1bhJSyT7hibn4FxBhooGGq9FM1QByGVaGk3WpU33S15hruZKTCbb3+L3Lk4MQfbghtDBPNXKr/EnVcpGIz+BCgP9ngQ/VawQHQ8MF0Pt5ZjjdK7qEyj+TbVI1xOrCeLBn5rwDsNrtZrGmN84+zKENMKbAvO9vJRIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VqtfG4sN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LFrp3s025592
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 00:45:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EoVdk+R2177hR21peGq1tgmUNMOo/3hzUkC
	rdH8m2TI=; b=VqtfG4sNaBlmeoy4ynrChLaMeRlVGXz4H9wT56xbzAz+zMF7u72
	qfcpNPiapLKhcpEQxkNHiLQlHuIR4bdhKG8gqweXQnG6ZmAra7NRhODKSJtjxktS
	pGj5CsSgWylYieSn0IRis/E6oCGPevFEGuFQq4Fo7beFOjyAP8bu5sWSzKwUuRuC
	FszeCD++gxAfuoME0LCeN5Kis7Z5qCdWpTPSAYRrHR+xQ8hcwKIMlNTtLa5sZNqJ
	Z/CCvBBbgf9KsbpG0qY1A7q5bzf6HBjA+/mWVdyfIMTpDJ9946m5AEJlKayzji2E
	cSntZ7w5K1MYVSI1OEJkteKoBZR+tfIggow==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w82qp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 00:45:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-28c58e009d1so139809065ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 17:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761093957; x=1761698757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EoVdk+R2177hR21peGq1tgmUNMOo/3hzUkCrdH8m2TI=;
        b=wEf1rsdOQCqPGqFU4yvFGdb9RTq89eJEQB/KZtKjXlKQJKHjHM3x2TcKIZRUEol/8E
         6BberKb8u0faFIDZnnYbDDfcmdb6qm/LZz0C1SrgQkfqVxPZrb2VF0duHOJbthn1D3PT
         o9AW5SUIaYR2wGnzbjzgLRN0Q8yIT471lFn3kTnit1J2XK/PybhQ/fnSn4B86i9Jp5DF
         cyRgZ3WFmaJrGdsw5C39e57iLccsLSV+VHB8tAgWNevifsrCJ7tYIO515OHbUcbtG2wK
         0qEpLPTOTa2N+sqPTtEK/ilNZ1iFqOP7v81MF0cBTSpElUee29sxaZiYzKvKPVtjjE68
         6iJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyAWef1HCMF1blqV+QoWBp973/k9TPabVeAv/lKKoiEisSq8O9iNbEjYhHONdFSs863J6qAk5ReG6v0Nge@vger.kernel.org
X-Gm-Message-State: AOJu0YxT7IyX9fWZFK66Oy6UrHwaezDw1qe8hXcAK6Cbzm5VQFpQX698
	Sm06PLYJMbN8vjPwxJCgn1ABGxSHY8FPSNSkzrZ23TO563OY0y+fPs5ZH1zOAlOTky9ojkBRJ7i
	Z7bWZ7v/Bls85XGgzPgloQjKHOYqu7ycX4IYxshEfP3B6c1buFWNhHXA2Ixcj0hoK+dQt
X-Gm-Gg: ASbGnct6IumJh51QcC/oX4jEo5kXNNMxZEj+DXiUVmSfzDWhU5SvI6dhdiN01dt0lrn
	BBy2Akr8JLzAfby/RKtSQ7X7SQZcoxqnj9URLxewRqLPOX7XrYch0M0rfJUoxJ6M6ZKE+O/Hewp
	MwTjccrn/KWOKwhcfTDs5A2epuiO/2IqBvVbLY7K6albsw4jOebK3pTGLAF0lcNU/8J+A8l9Yc6
	fpefIWgsM3D4Wsxje5yzhA/R+M5G8ZCJ6bjgUXSxgxYiNhia9Op630zscX1ZtcCRrH0zLKfVf8u
	VY5GIzDFTY/lbD+wYltaMJwb/GjBsTb2NrJfwA9isgr7XoSX4XT0yBVUHXqkymTMS60ZKK9wFot
	LqD55K5hp0Q0U3YQYRTfDLkBqi+XuEFy9oMYMBgrURXBlPW5zO9mP7DYv3RklMg==
X-Received: by 2002:a17:903:1106:b0:27e:f07c:8413 with SMTP id d9443c01a7336-290c9cf8f3amr209465565ad.9.1761093957080;
        Tue, 21 Oct 2025 17:45:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAil/FD0eyE9wxbuEjh9p2COtE3nPDA77TDJ8rM4VH2xnt/n4RjQN/WjfhsGu8C/XoxIsf+w==
X-Received: by 2002:a17:903:1106:b0:27e:f07c:8413 with SMTP id d9443c01a7336-290c9cf8f3amr209465335ad.9.1761093956642;
        Tue, 21 Oct 2025 17:45:56 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ebcf67sm121913045ad.15.2025.10.21.17.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 17:45:56 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v6 0/2] usb: typec: ucsi_glink: Add support UCSI v2
Date: Tue, 21 Oct 2025 17:45:52 -0700
Message-Id: <20251022004554.1956729-1-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfXyyKIroJub1Ju
 j6UexzLXp4UGUQ8FhCQ1uv3lew8amKNpr63yRaO2lkriDmPrh+sal6NV0nypme94jZRicu+cAhE
 w8u4Kd9Y7Qz4gsD90Npo/uLTqGNwdMjgPpt08XhGP1XzgzoIpe8slaj/jy/lx28gD5TELvSHmux
 ZE4JY+x1g7Y/2Hc6NbftVg22j1T3mF6RCVfMhxwwjzdW2LLfqM2LD5q9bJYdDDsjmsyUCfw7Ijz
 fMplZHY61LnP0YZCoUs+wAqtTrIDRM55X3Dk9770mfpLlxG9Ln3I/ZjTmsPUrqfhawlJUoIDZbF
 +Sovs5+RF0OdenrWRboClUV8dnpWMpVlSo25OaWRUcZlHlRJgiJBxkmscOasqtLXdq1/KleU6hp
 +12XAh5kkhCc/0ZIbMb04UMwhaLgNg==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f82946 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=QyXUC8HyAAAA:8 a=AXDibm61ZLAIF834zmQA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: xU20c7ZWkc7-P_k3lAu_JLIh7IugUIn2
X-Proofpoint-ORIG-GUID: xU20c7ZWkc7-P_k3lAu_JLIh7IugUIn2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
16 bytes to 256 bytes each for the message exchange between OPM and PPM
This makes the total buffer size increase from 48 bytes to 528 bytes.
Update the buffer size to support this increase.

While at it also update the UCSI read/request buffers to be packed.
Changes since v5:
 - Added else statement in pmic_glink_ucsi_read_ack() in patch 2/2
 - link: https://lore.kernel.org/all/20251003002044.2944497-1-anjelique.melendez@oss.qualcomm.com/
Changes since v4:
 - Updated the read/write structs to use a union for the different buffer sizes
   which depend on UCSI version in patch 2/2 
 - Added a clarifying comment to a size check in patch 2/2
 - link: https://lore.kernel.org/all/20250924232631.644234-1-anjelique.melendez@oss.qualcomm.com/
Changes since v3:
 - Added "Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>" for patch 1/2
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

 drivers/usb/typec/ucsi/ucsi_glink.c | 88 ++++++++++++++++++++++++-----
 1 file changed, 74 insertions(+), 14 deletions(-)

-- 
2.34.1


