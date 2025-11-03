Return-Path: <linux-arm-msm+bounces-80139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F226DC2CEEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 16:58:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B13533B35E9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 15:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4098131813F;
	Mon,  3 Nov 2025 15:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BkutaiGv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bu2ewWuU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0E526C3BE
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 15:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762183792; cv=none; b=RzaEG80LHkA0VqYL3AOwxucCD3Ptc8cafNH2vrGbZHCQkq6F158/g3afo+dXYPiN2eBbv3Zvchgw8Jf3zjB0If3HKJIXpCBbnvES4z9tqrRWPXgAmDVyvr2fTzc5wIPmGSf7pPK1p24g+tFZV8QqZRiN2gFeJWPhduVKGSlw38I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762183792; c=relaxed/simple;
	bh=Qu4o+5vdG4guuxWL13xICD+nDkAgjCx0T8HQXjzGPZk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D7HyRb5MB6OGJd9BQk5Z+9xxohDWkfqEiyOe1/f8A+remlpl3BX19EqeIFDnqILFrl2085mN8yMRKiJrY+47KDkaE6AY7MvQ/A2Q4zm/oCbQPuRvrK9sXdxwcz0gVWgVFBwLQODblcP/UPKO5vIONb+arneaSGfMocxeQXyqe6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BkutaiGv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bu2ewWuU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3B7a4R2984021
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 15:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iuUp7Twb1AkLQGRdG3T6gdiruxN1hkGWsFs
	xCM/VYy0=; b=BkutaiGvu9FDIxWl/+NFZuQGHNvm6/SwZmaRUkVGMiwJ++zuspL
	qzwLX1/D2mI31HoBm9ReqWQoUI/5pNef99vPZ22uxl9+tIqFfAr64XhLlBnYQ7yx
	Zs4wBx7fm+AucLRcwm32p6wGGcqjfo52osdLyDgvxIaonvO2lRHbZCbDV/ek8BAC
	8aDmgnlyVcQ+eKd2yn1xC/4Ets5M5HFLnOCVnYfKpmf151PaNsaivol6lkglQ/F3
	HIZsdkF8QJEbzD5Yd9WHKDJ0MqH/0ml7RhDFOw+fXdnqkkQdXBaqLmdzDx7g0FJJ
	pGwun54Hh9CezSEG5PR2MsJtYzTx0UNKGUQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6u8b0n6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 15:29:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2904e9e0ef9so107094565ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 07:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762183789; x=1762788589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iuUp7Twb1AkLQGRdG3T6gdiruxN1hkGWsFsxCM/VYy0=;
        b=Bu2ewWuUChgjxu9VwTa+tcghF4cmT/BLKT0ewI5gZLsx8w2TK3d0rE9eQuSnpAMje0
         Tac86dPMUynFy3N71UTKS49fk+y6/6ByFhtAL36xgtq++tLT6oDfPPMNVjzrZ8lNCMRw
         CGIisqliW6Je4tKP/ybxL3iwmKlmaV1ZCMQsrq7I/tWjwZbPC0oryj8owJL4WwbIruuU
         fJVkaDDZ4JkeBJEyfoY+UcTJCg8DXEbjYc1UO1f6VDWENfUhohlx7ipsCCwUsuIZDvbc
         scXzwMypX4AHEVZSRkbzULHcdAL2Y3K5uCPrmcrEh4NQPGSNBFYdKOokESC+LMD/TY2A
         5tqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762183789; x=1762788589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iuUp7Twb1AkLQGRdG3T6gdiruxN1hkGWsFsxCM/VYy0=;
        b=eMDLQFrM+6cjbLNXPtMPqiF1AU8jQonkmTSsdlMR8V3d9LHthoXNTw8vAE6rcALi0G
         4kshyOyVKMUA7GNas3jAreUIY/Auvt+5wlGbTOv8cm3N16BNc68tWf8mGaory+5bFEjw
         ky3aNyYDEMiK964nvqk30iE3G1zoc66Zc3ESF63dRSvyEZfnodiOlfFzv37czhDS4HuV
         EiBSeA1Q4gpRDzB+twqL6h35MEnBDN8EnHZJnBKlAeyh6uqCqv6SSxNxBPqxG5fVhqfg
         aQdJbHT5E72WJhf3f8H16bj4gT3+KnBU1MMMWQ++1hUJOdXk3Vwk7M7ltcNBHyrNewyV
         Y6OA==
X-Forwarded-Encrypted: i=1; AJvYcCW/hrzyGsq1hc0iyo4oT3JR2Jh5BVBENzf1TBdkO7xkc8usJz2Ns6Fvm5eZolYOKHe0Bk5ia1Ti6ZCZwTGr@vger.kernel.org
X-Gm-Message-State: AOJu0YzanGigCeBQAdV2aix9U4u3a+E9SA1ibXdpFmuXs2rb1tj9wboS
	yPhfB9ogK9X76wycf8q5+HW0yntQeLgBatYAUmjk5t3zg4wlpn+Y092t2wyVtUze9qNeWchjfh4
	Ts1tJ+Y1oQO35NjezQUuT2dVT2byXffuv9FUzCZMxq77gOdsbprya4TsKxcP6augptspP
X-Gm-Gg: ASbGncvn6DkRsIMyK7IpH5WaUUqFCko4pzJwVopl9PX1rLd3XMq/OXSKG4+39AvHl9e
	81QJxBmy1qARhoLDEvY+cxJrIpMYPYZHT75EUJRlnvkGpajQg5BMDdWZUnfFL2QW1cnWnGV6NFz
	tEjbwG4VvhPgh/6/bvXCHykwMKPoGmG2XTgC3GnXUFNtlpsOKcBHt+y9X8YCxitOrTLTUATMUDK
	buc6p9zVCXOpad3z5ighJ7Vgz+sNVH4iLzq5sl/Nu2ncSYUKIRnj2xdY2TFq8B5hezvNgF+v0Yx
	IBAX6a0kmhRZuq+8K+KUo+nNGWFAjB6hpC9sv5/4HdR4V9C7VV4NDSa1qu4EsjGn+U2TlNlrVt9
	4m/J5j3Wx1salt6JISJm/4pIdh1zY
X-Received: by 2002:a17:902:c40a:b0:295:54cd:d2dc with SMTP id d9443c01a7336-29554cdd5eamr137298335ad.16.1762183788600;
        Mon, 03 Nov 2025 07:29:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFeFoMWtVRbtUqyET77Erx4bRvUg7ngB/KYLbL8h2qmcG5sVT+8D18sM053N+dGTqJqIll3iA==
X-Received: by 2002:a17:902:c40a:b0:295:54cd:d2dc with SMTP id d9443c01a7336-29554cdd5eamr137297895ad.16.1762183788062;
        Mon, 03 Nov 2025 07:29:48 -0800 (PST)
Received: from hu-deesin-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952699c9dbsm126087675ad.84.2025.11.03.07.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 07:29:47 -0800 (PST)
From: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
To: andersson@kernel.org, chris.lew@oss.qualcomm.com, konradybcio@kernel.org
Cc: jingyi.wang@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: [PATCH V2 0/2] soc: qcom: smp2p: Add support for remoteproc early attach
Date: Mon,  3 Nov 2025 20:59:27 +0530
Message-Id: <20251103152929.2434911-1-deepak.singh@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEzOSBTYWx0ZWRfX+vqjc4sSAYXU
 TuGm0GYVEECBqw715TiliINRKKI4/Cw9zmq6vOWwetqHQM56SEiIdZtocx4yAD9hG2/IDblQCpt
 3wwRw9nniufW9Q3oXydmJTzKktnu8sPQVo8Fmb/9mVhE01NHq3x6Yv39HmQIvzIp6+R3xVthqO4
 LTR3FIOl7WNRuxqRrOmmfXXn+7HWt+GaU9Ki27pfziNVv/3zXmM80PB5GRaWmyFRZCuh2Ihl3bh
 l0/vNwvGfyT4YLHdXowABADP6IfqBTdr5PO3wRqwaq0lUAbG1s4ay0DZ46i2IiFZefWA0RlxMA9
 R2dzlCqKw3ZajoCMRz7l9BO4BUV06UeQkAVL+zSgu6WscG/D2VLmD1txOh7V1GvwAbTsrdZgggn
 8aau1e6/YomA8t3LLtMTmuEM2s2ytw==
X-Proofpoint-GUID: 5PKJGEYyBkwSKwaR7u9_hMuTzZ-LNHHy
X-Authority-Analysis: v=2.4 cv=Ha8ZjyE8 c=1 sm=1 tr=0 ts=6908ca6d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yQkoZ8-9xyiC3PRw88EA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 5PKJGEYyBkwSKwaR7u9_hMuTzZ-LNHHy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_02,2025-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1011 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030139

Changes from v1:
[PATCH 1/2]
Update condition to check version 2 in qcom_smp2p_start_in().
Add more comment to describe above condition.
[PATCH 2/2]
Add description for version v1 and v2 of smp2p.
Check validity of in_version.

Chris Lew (2):
  soc: qcom: smp2p: Add irqchip state support
  soc: qcom: smp2p: Add support for smp2p v2

 drivers/soc/qcom/smp2p.c | 102 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 99 insertions(+), 3 deletions(-)

-- 
2.34.1


