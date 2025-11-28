Return-Path: <linux-arm-msm+bounces-83683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 91604C90DC1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 06:05:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 412EB4E0568
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 05:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3B23A1CD;
	Fri, 28 Nov 2025 05:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gXVOfY9E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AR3xxcq9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01610134CF
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 05:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764306343; cv=none; b=KX7na0qf4HtNY0noW9wo24cdY3GuScJhZaSJ2sGKPBsNobIQvDq0K+wqCl3X1NJneRpzK/5rYG4d2yGVNPt2hcWkx94K/JtdxWLktqMA+/yZYhASOelJypAApb155Hrk/6if+yTYYsxSbAGUAOmyRLOX7lBd5PasOalsu7cc9vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764306343; c=relaxed/simple;
	bh=Sq8scCBPYXmh70VWWlLzsFVxp6DIzVFhTDa4xcyx400=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PiAbWIiU2Q/OrGUYxvqWrjL1J6gLNA6m6g+lDCur9KGE9b29weXSxwAAxk7UZQsuP8kINrENfc8gzd+TnIJEoI7RYaRQjFliP8YqsutgEE14GP1Hg6AaohsRv8sd2sTG2SZP48r5SmKsp/GGrpig/B7Lox74KA6Sztk7N+cHOoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gXVOfY9E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AR3xxcq9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS1Vkdq848530
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 05:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uhrEIbweefDleZHY8SlZRuqlAF2tHqjBzep
	W5abz4kA=; b=gXVOfY9Erzr5FXV1YE5oXUyu0a1oEUMTgvwfCn4xd25RWdPJxNq
	GUCJUsgjA4Ii70wWZhxv4UaRcEWc5KqcBwHA19D/cp+QXsIXKk5+nUPPWt/v1C4I
	8lAnSIoaSjYlY3P63pgG9BrFgD5NGxlLYw3pIE4euCssMxKift8mYbCBYfzqbNVu
	sE/J7HYNUilHSSOoMt3utDRpVsaOyFrg5YccozFNTuk9NhiG2geM3i2Vz4slWLqP
	Odrmyb1s76aHQiKnMIUVHNp2yc8f+Otg05HzI7az0pc+SGfbfEpHAh5bPt4WEZkj
	/2Gh2W1bdhbSPGqvm4eFr3yxJrqxMVzukfA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmjda6gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 05:05:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297f3710070so28367695ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 21:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764306340; x=1764911140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uhrEIbweefDleZHY8SlZRuqlAF2tHqjBzepW5abz4kA=;
        b=AR3xxcq9UBrdNysZjWDur4eAFPAlSlDOOd1QQVtvaDIu2UvTw3JczQEB+B9IcfXYTj
         rfYjb7e866CrBzR92/t7pJ8QlRERbYcwd7f6Y98ZTvu+cd1824PejLRLKifcECPyE9Ij
         mzGM/ioW5bgTsAJUvNQKgFXaSRxmYnPMHrq41EXyPduYK2jmPPmxH9Rmb42+ccms4Acv
         VevfgUGCS+9FqWEWj/t1EYreYFOWbSS8//QktJyQ66oJykAKCl6A7jyj/LxFFhn+HYFX
         16twW+J7zkdOB1nL7+GUy8+ANJTkOKBw9AgE7OvXleH5wVg76z/WLYFJNhjA7aiYE9ga
         8I0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764306340; x=1764911140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhrEIbweefDleZHY8SlZRuqlAF2tHqjBzepW5abz4kA=;
        b=NiXejFgvWglHBn3brDYKkR1L1q2I3e2IHomU0VzEh3YA25AyhTmrnOSXN4rU1IUr3F
         LdIMspkaVlS959ad8ymxE3Yp1/hgPMgOYNbSrDnKEFsXsfuVBj/JoUwyB5K8vrXNZ6vN
         UXeEax+T2iEh6aKIpo5HVkud7ps4cIM3BCjxB3t0gn7tqPFqdX3fUeZxWKEL5zOJjSCy
         nQODN7QN4cQaKHYrT9YUD9oNqBQoM0Y5tshXS9L427W595yQoqdcnr4O5bwbVaF2Rr7y
         EhRPGQk5X2Yiw0jMf3eif+YNyYjTTE83zziwHstCCDCXblsiR3NJ+7Auok4dVDg9p9k+
         +dyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiOVpwFGftaY3/BYwwlZu58GjruwgdLqGcl8/BOuRRNK4upaoeZFHuU0DleMUWzLOVjY5sm1dHxHmThwQQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf+3YxHretjw+58v5g2qwPNiZEZMeJrEjHsFzDoR4lSn4O2wUx
	ZHw1otdDp5AkzMyjdu+/in00NuH8N7itr+J6z0Ky3/2KwJTRbHoj0++Bw5hT80NUQOjyz2q41E4
	Kkxoytlx9ryVsfKEVSlaNQDpn1Q6Oqx3IoQ3J6oHl4mxST1PSrmTcjTPAh+cyxIa22Tct
X-Gm-Gg: ASbGncsLUb3eSgUvQ9NqucgoKqelOw8A62Vk1Rw5U3Y2ZbNzYTUXsFGKhqkHH2qtshY
	b4cGwIFEfk7r7eCiQf255u+FyJ8v1GymlWWxs7jaM08LNMOsWg5oMTR0DNvMjFykSP8PxHoLm1K
	yJNBQScmWxy0ojhhN8va0djX/I2H9J8sroaCPIMxiy5XDLk3WGDXs4zWNGYVEs+D8dJMj+6J2ZI
	qxvD3opxQiYomPxKm83eIFX2IoWV5bw419kiLB0sy+A7tcPK/B+NDniLSAYs6Fk1Rtza7zIywgd
	6XkwqervcSRfSXSzBByvIRCWCrXTLfPcVs6bagMAdD6jSFKPQG+IenmOqq/nFhus1wYUl/jbEY9
	fbUuoz3GF1Vrt919/vVw2z/XjtPpzMY4FDRHCb20nAw==
X-Received: by 2002:a17:903:90c:b0:29b:5c65:452b with SMTP id d9443c01a7336-29b6c684a86mr268933155ad.32.1764306339811;
        Thu, 27 Nov 2025 21:05:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYfJG5NZ59k+42ZSt3Hm0ltG3rQQsZCieF28EnpH8Z8aRhgspolw7qsjm1QCtLJ6iPlNJzmA==
X-Received: by 2002:a17:903:90c:b0:29b:5c65:452b with SMTP id d9443c01a7336-29b6c684a86mr268932825ad.32.1764306339366;
        Thu, 27 Nov 2025 21:05:39 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb40276sm31952075ad.73.2025.11.27.21.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 21:05:38 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v4 0/4] misc: fastrpc: Add polling mode support
Date: Fri, 28 Nov 2025 10:35:30 +0530
Message-Id: <20251128050534.437755-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qU73VMpApCQ4A5VBq3HbxKv_m9NYsgq7
X-Proofpoint-ORIG-GUID: qU73VMpApCQ4A5VBq3HbxKv_m9NYsgq7
X-Authority-Analysis: v=2.4 cv=OPcqHCaB c=1 sm=1 tr=0 ts=69292da5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=66tqkxcFYQ9a7oDX834A:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDAzNSBTYWx0ZWRfX3zUiv7fIsSM6
 uENsCYhLs8IG9y+BK2/8aHSxrv2fPV0l8e1QgIstfFx9yxcb9766OG0NbJOZ3/+I37V+XvYTqmf
 t+H4gRLMJnxUh4xABlvK1p3kRs1ed6LY6UUi4fiIwKTnsjGPy+/IGKbPTFQ49YLGrTefQjiUDHG
 8pjau1HaAvAZ63LQ3uvT7D+4a+puCLjnHeG7vhZhTpU5Lc6yDt8d5upCyx2U9bt/oTp1ybZQqQP
 lvrPJsd082nAipINBdcrt1h8urcylSUlPG5HTfeYypBERfab2JGTZHMgebeNIBeCi0/W1bh5WL2
 73vjOcvfrFxsnKNuW+G1ILtf5A4sJMWZe+WzBniX/HqFIL5YEgcnBTTcSaYTSs5eNzkRVy0cCiw
 6S1beXeaJ92Ej5Ueslg7hjMDoJpQyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280035

This patch series adds polling mode feature that have been missing in
upstream FastRPC driver.

- Add changes to move fdlist to ctx structure to avoid code duplicacy.
- Update context mask to support polling mode.
- Add changes to support polling feature.

Userspace change: https://github.com/qualcomm/fastrpc/pull/258
Patch [v3]: https://lore.kernel.org/all/20251113064111.2426325-1-ekansh.gupta@oss.qualcomm.com/

Changes in v4:
  - Replace hardcoded ctxid mask with GENMASK.
  - Fixed commit text.

Changes in v3:
  - Resolve compilation warning.

Changes in v2:
  - Added comments and fixed commit text.
  - Defined context id position as a macro.
  - Added new IOCTL to control polling mode as always enabling
    it might cause excess power consumption.
  - Cleaned up polling mode implementation.

Ekansh Gupta (4):
  misc: fastrpc: Move fdlist to invoke context structure
  misc: fastrpc: Replace hardcoded ctxid mask with GENMASK
  misc: fastrpc: Expand context ID mask for DSP polling mode support
  misc: fastrpc: Add polling mode support for fastRPC driver

 drivers/misc/fastrpc.c      | 164 +++++++++++++++++++++++++++++++-----
 include/uapi/misc/fastrpc.h |   9 ++
 2 files changed, 151 insertions(+), 22 deletions(-)

-- 
2.34.1


