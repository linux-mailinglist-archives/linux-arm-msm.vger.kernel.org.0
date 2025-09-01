Return-Path: <linux-arm-msm+bounces-71346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE57B3D8CF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 07:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E41F1897D4C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 05:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E2321E097;
	Mon,  1 Sep 2025 05:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UNSYt1eM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E980D169AD2
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 05:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756704826; cv=none; b=aD0Mq1+pYmrmWW8vCr5WFeUq5U3ZLVNr6HzKj4nXBA/Quw1XcSJySZcYno/DZvP2r20OFJ3zHV/ti7jURHoMQGzWyWA+MAq0udxmdSVaVA9OBu1VJgA6gEjNnFqg/ZJqSiML29YXj/o/qPLepp7yn1IL/Ra25fZYaK1chCveDlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756704826; c=relaxed/simple;
	bh=pN/xGrUePnKxy/4KHL+rTPjWD8KshGCJTqUvJaoyIm4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rfMhbTes/1a93ybMgheAn2coO9czYBDK0+wktz6CF9mEiJFTy+QeazAqcZQUZzpLE8yiW/qjA1ERMV0yC9a98ix1ocHz5uZjdShZP6vlqX17Y12uk6/L23gK699Gkk45oPi+h9V628V/Cu9+2SrndHJ6jRR4vlnBCnRN0THhvGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UNSYt1eM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57VMK29B019553
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Sep 2025 05:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5Gj2fHHRocveNDazOUaXByhIdsQ04V2LnYy
	pYBX7Xjo=; b=UNSYt1eMUffl5Je3IUB9dBx76rP80PA92HfPuqDlXM6uDgiLRLa
	5x5KfUiCzlzBLMciXwynnq97r0hmx8ZKBkcp/b5Z0iiVf6SrxXP0hg0MCnH58dt7
	aTNOPtKA0aXqE96x+OmxgbArAkeTd0FzZQLRbj+VTT7ST9BPquydqM+urEShdfXJ
	BRSbYTQfCbmREhohkJ3KSsNTM7u2Ir+744cyJRW5T/yQ9B0xHZF0P6skiA2J+CTw
	kBMb1IQ2blZnvnQl3bgOif54UvwPG6DMVgho/PYT5XxJ+d9oS/aJo6+Y/uMMZ/Rj
	Kvuk9AL9fAlztZ9GwxCX5UYj1l/1SzyK4Qg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjbd47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 05:33:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-249118cb74cso27964465ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 Aug 2025 22:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756704821; x=1757309621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Gj2fHHRocveNDazOUaXByhIdsQ04V2LnYypYBX7Xjo=;
        b=ZeHsRM+zMO8Wjvvwa7/wZPzK2aR6swCEUdszPQEh8LAiTtB4l/FAoiVhhxEvbnQNsb
         hYvm/KK26XROF359spLh6tkYtVefnuTzyH6KTc6R8GY8+gwsQrq4sgi/9DodGzZ95DrN
         G7sZ1bpnvkFG7jLpwbrQdhpumDgZwx0RaTRzdUXYgGqjNFkqcUfjhEKWPHItApBFxkDd
         JXZ63EXFSLaHJYNUHIEB1rqNWN8z/DuXN7ZOc5aLhVZA8eiGjCTPa3eQaAbF0B/VGg6p
         t+7mB0ETt2jSDUAU+4ffIqniUT2zT0bIEU0I5aAyuGboXACb4MQot0oNbXPpzIAVfwyd
         UYxA==
X-Forwarded-Encrypted: i=1; AJvYcCWwnQ0xCFpNprsqBwcgfJHZ/HSwhUWnoKPBrfk/BqfOZnabt5fblcWaQNX6yCnhW8Oj/TzR1xe1s135ZLwC@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi8DNmMPrb9uZmCv758Anlfa59J8QAaJrZoTn3jbx5z/P1DgVk
	WK/zWm/3jwqPob72P4z5n6A/N+X4Qq0p+3//vXnbdwdMQlZBmD/z9bp7dQNODYSe7PdphyWNqAz
	z0IsaaWX/bufnSRFpN3EoR9EKJOia4KSyYtBkDU/noTscB5WxBSHzz8ogi6QwXSVF+dOf
X-Gm-Gg: ASbGnctiDrnANbL2rR1Z4PuDCqmc+LpkUttzB/kTrsdd4d9khuJUN+Va2eCel7Ujatc
	CO8wC3qryXU4OixIjYGAP2yQ8AoY/ZcgcF8uuL9ZNh+Pn6V0Ox1eYTxYLm23uUrO3NVtKbcIrCg
	IJGTDjJoMkhINPYH0004O8v6Xiev/2/ilJ4rPDroDxLcYO7HkZ1vxjNJSN8uIto6k4FAgvq91Xx
	rG+6NnxqMO7Vhkzkx4hAuaR0FVMeBnf4SJi0GXAcLZPF3KsHjWXM+hHfkOBiy6/J/Qf0teTVQfl
	YwGDGTIyK0QYa+1H/SRZ42XEjZ0I5u7rgs5cH+DMFcJvkpDnnZyfOroCF93Mv2uQPvxR5INd
X-Received: by 2002:a17:902:d2c7:b0:249:d3f:d238 with SMTP id d9443c01a7336-24944a1b54fmr104707295ad.27.1756704821451;
        Sun, 31 Aug 2025 22:33:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT0lCSPA0prHCF1BZxoGfFc43i8lpaZz8hGnkqmiBs1T6OVS1NVSTdRMrSKkgif461D57Law==
X-Received: by 2002:a17:902:d2c7:b0:249:d3f:d238 with SMTP id d9443c01a7336-24944a1b54fmr104707015ad.27.1756704820968;
        Sun, 31 Aug 2025 22:33:40 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24906589986sm90575215ad.111.2025.08.31.22.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 22:33:40 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v1 0/3] misc: fastrpc: Add polling mode support
Date: Mon,  1 Sep 2025 11:03:33 +0530
Message-Id: <20250901053336.3939595-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b53036 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=qQG2SJLAMOdS_Cv4HkgA:9 a=zZCYzV9kfG8A:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: KfphqIB5DJV1J5gmJi9EdAzTXSVFT7xi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfXzUw0AdPlfG8L
 SuhXxkMKkQRB4Kd/B99m+0hOmuce7cpGI+Qh5OstwCKEohyuvsWdSV2hA3ccJxv/GghU+HjwHYw
 d9ExKEon+xIHuQmOyMdhX+Q3mJiMGpupRjP9hHVNk0kd6BoJdm1iS8gYaoLBUGWehZMchQBVD9Y
 ezf8iCV1VXhzjIvV3ONl69087rbFsxg1HI0mgctxRsYfrgJOMOn3PprrQD5UyvfINhQ7ZI15Jmh
 8SicLpOdBYP/Yb9FlFPoTaESJ6DR4HGDuJIjH/8+0qCcglEGrTyxj7EpJd7QSQMwy7ZkFZn35L1
 Z33aWJgGz9KfdqSwJgcfcbmuN/cyG2lFNs7ceWNNhpO6rlCkJns0nRvleu/znqwS/k9ex0mnjcI
 lSxOeM7d
X-Proofpoint-ORIG-GUID: KfphqIB5DJV1J5gmJi9EdAzTXSVFT7xi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

This patch series adds polling mode feature that have been missing in
upstream FastRPC driver.

- Add changes to move fdlist to ctx structure to avoid code duplicacy.
- Update context mask to support polling mode.
- Add changes to support polling feature.

Ekansh Gupta (3):
  misc: fastrpc: Move fdlist to invoke context structure
  misc: fastrpc: Update context ID mask for polling mode support
  misc: fastrpc: Add polling mode support for fastRPC driver

 drivers/misc/fastrpc.c | 145 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 123 insertions(+), 22 deletions(-)

-- 
2.34.1


