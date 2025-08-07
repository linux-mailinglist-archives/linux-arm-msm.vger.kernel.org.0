Return-Path: <linux-arm-msm+bounces-68011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A860B1D82B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 14:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1607D1885F48
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 12:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871655695;
	Thu,  7 Aug 2025 12:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L10Vzkzo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D444405F7
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 12:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754570728; cv=none; b=Q7bis5nE3DOoytfmIp8FejwuLRxGlYA4gvLW/6yD0tZ9DnPTLGgqQy/UnUcyk5XFPCamgvFN9zgklyiquo4gHPDlkInwFLDwD0tinwkYUeyuo/WURMIg+ez3uwEYXg0P4v9An+Xcd0LowcarlqXDLGQ0TZ6+PBAOLWeu4alw+uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754570728; c=relaxed/simple;
	bh=Z8yoGArUYT9SNrHBSHLq3OP2pZRmhTNjDq6ZaFHBZSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=onjPhVXmJT+0MUdxNk0/k/03+MZdTPAQ244nQnc5bIDaKVf36vxbgWIWzwRezTp/59W4Q9cqi3blgcdd+x0rre7LXvtgLpCbs35MccxfOy1bg4VEMJkw2HyM4XGlE4swZI0Ic3DBcOBGvWTbUtmHyln5ecKLf9INsNjD45vFzGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L10Vzkzo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779CuIW007839
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 Aug 2025 12:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wrHOKVSICyQX9AnKwsmyhYUmWE9fXEnMJYQ
	W5r4UgOI=; b=L10Vzkzo/wSulMw99SebqPLntv1M8JgFaptK8y2bQUggSjG4xbr
	hdD7CcxJVKvaxijwCjIDA4XvzDzORjL9vQ6U3+olE5qhvTvHEZnSbx1YWmKZK8im
	fJKjCO6JklXEMuq1Gb6F+nypWGnGYAFNJrIz08yRF5RgEqtq3auly+3cB64tBaxn
	D0+FmJ0ffCorP8K4KxLCKnV0/4XGAe6zrX0890x7/kiQw7haRfsYIVNhRGaSg/N7
	nxO/DV6LGviQToxWSspQaGRtAE+uDU0ikzRQFgirN2lnAfRQwL+tOz8JPEh17zO/
	VtDx/iiOmb/Jk6J84bGguXkNPGzpECv806w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy6x9s0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 12:45:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23fed1492f6so16680935ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 05:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754570725; x=1755175525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wrHOKVSICyQX9AnKwsmyhYUmWE9fXEnMJYQW5r4UgOI=;
        b=q4LEf34mfPETRu99cZ5puRQfZGHQW/hQfLzF7Qb3GQkPjZjw2Pc8BOZrDDEMxKF/sB
         Bo4egKUrWJlR2gYOgTjyS0AL6DrA6/XR/6p5vvcrLFNgxXdo5Kj43JpCCMQ/sRl+5gyV
         nogCZLNc2Tb/Oxe0gVrk7rcgiVfFn4ZjiEvbfoz6opZk0Ds2qsFfW5pqaw+dM9ZHXVe9
         QVLeqGqLxbqLJqMcbe7iDrXWZEPDJQelv8B/+dicLafGTCQyBF3stBHFEBrR+DCFGW0d
         Ch7IZsnXAUW1T0vFRmD5uZrnhEjWdR/6cZHhnkAiZl89TWEEj7TB2rNGq+9Xe5t/VAY8
         kpnA==
X-Gm-Message-State: AOJu0Yw20r2HC47HiCTfZtiunEEi/PV1EL13XLrQD8cctz8mz7JC4Pnq
	D+AascH1cVqp7kBjcVmvkUR8hpIkP1K239KJJQCk7g1HJFg3CwUhDCTabQytwCGQVfo3t/R/FsT
	uuv71tf6ZkN5KMfZp3//SNe168HQNKjNQlfXRUwXAEUfn0nd75BcPrNqTbn5Sa6x4B1uF
X-Gm-Gg: ASbGnctHoT3Zgt80GOHoC369B0XioBGXNdiI4R9wijN+WeBvGuwwWSrOP+xPX6vxr8W
	LINzWTvCY/fUSCYwd/bbU72SH4SIhGwIsWMBIYdVYYN/xYsRcSlJqMRMYiiwEzis47KnjGheZKY
	7mnLd7uM+m/YWBr+d0hlokW2j05CZPYl97Uh0KECTXCqqE4Uk9yGKTw9HjfzyE2zu0GL8CBEkEb
	r/VIA8+7ZQcRgTzI8drgp5ehZ7wyZ5iZryCPatdl0++NqYfflQvN8fNdFPwKohspFQaA9BpPhsy
	B3pLSab2zbbdJFTiEBufZAfkGRMtL9lnNeOTkFaEFx4NZT4HClXOu8KRLR3KWseOcDk=
X-Received: by 2002:a17:902:f552:b0:240:1441:1263 with SMTP id d9443c01a7336-2429f575d69mr95195455ad.50.1754570725398;
        Thu, 07 Aug 2025 05:45:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxQ1r8hY5P++ie8R3gvSD9SBl5jDxZUrFQJHSk2ZVhsSUgMYMrnz5fDl2TFO/OyalX7WPLiA==
X-Received: by 2002:a17:902:f552:b0:240:1441:1263 with SMTP id d9443c01a7336-2429f575d69mr95195055ad.50.1754570724921;
        Thu, 07 Aug 2025 05:45:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32160ae5eb5sm5526914a91.0.2025.08.07.05.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 05:45:24 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] firmware: qcom: scm: preserve assign_mem() error return value
Date: Thu,  7 Aug 2025 18:14:51 +0530
Message-ID: <20250807124451.2623019-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Wh3sJR5L_5xi1gRW_0NsLYaRKFXq8mbp
X-Proofpoint-GUID: Wh3sJR5L_5xi1gRW_0NsLYaRKFXq8mbp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX/a/5A/OLuN3l
 KuoBMI66uJD8QQHJpP5intYBSgTUpauv6ej+Nx99Fzd4SbtwfLGhOzyumaixZBclmHdrwaNS4WF
 lfMHLr7gQ86K8PKQLGSjDKIGJqxoxYAfAYpYciJGbRYvmWhYOf4LOBMQnLAfkNw+sE7yQXXdYb8
 ApQDdg3A/gtcai6o4lm9oP35EiKHK6JWXq7Eua26VAaWlyqxVKN5G6dWLfD+eL0guq4ZI1pjCrF
 mA3yecugnd57s740ZERcG/EfoIxa72b+L6V+xjZwAVTppIFQx35fdV3SzTJvPi7hBxg9EXqccE1
 sU/8Uv4hBcPrQjFhrvkoryiSe1XFsaO0HDoIz93H9eC9Lyc2Whwt3+AKGJSJOPpPBd37qesiiry
 HiEOAst1
X-Authority-Analysis: v=2.4 cv=LNVmQIW9 c=1 sm=1 tr=0 ts=68949fe6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=D9wtebwzRzpNM3HYBSsA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060009

When qcom_scm_assign_mem() fails, the error value is currently being
overwritten after it is logged, resulting in the loss of the original
error code. Fix this by retaining and returning the original error value
as intended.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 26cd0458aacd..5243d5abbbe9 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1119,7 +1119,7 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 	if (ret) {
 		dev_err(__scm->dev,
 			"Assign memory protection call failed %d\n", ret);
-		return -EINVAL;
+		return ret;
 	}
 
 	*srcvm = next_vm;
-- 
2.50.1


