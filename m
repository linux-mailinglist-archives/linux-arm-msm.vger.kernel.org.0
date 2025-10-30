Return-Path: <linux-arm-msm+bounces-79629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C9FC1F55C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 10:39:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 03DD14E7B06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 09:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F1E1342144;
	Thu, 30 Oct 2025 09:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nT34+Q1c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aqLLQUQY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC783451DA
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761817076; cv=none; b=lLdegICsdYZ55pBIU6BBKQhuurpBeiedTOI+YvZkN/uUEKr0uOarVh0tELdzyG8gCvVdYAf3RhgTrFXTEfy3kBjeYlFrA54sPJysPsB19jefG6NdGTAuMjaa/Vc9NPSJOD9U3561GmuzMUBjOqSnq0vu1dDZZGPrx5jddctwnq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761817076; c=relaxed/simple;
	bh=0bCr4/wnV/HW3BBCIuwyR4gn2MCKsZrGArTvwCNdTgc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z9+tuKKUshIOGFbbVtcjKGjDWvrMYSI/dsZwWYlCsuGRvtW2Ydvqetl6jzDIZfEheHsyaOgUKoPQXyhQV0w1j3g9V1sK72B9myULHNGXqRRBoNtd7LUo/O0LSta0X6DTUvw2yrKGMdflUVCJ+oFPiRl6n/Pd1rtQ21tD9uPeLXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nT34+Q1c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aqLLQUQY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U7VTB71578742
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=K5HucAoMZbV/tahaTphfW6
	YCK45m5+kty0FraJp/7QQ=; b=nT34+Q1c2gJdqmGH96h/MZJ8GjTlby9V6uJNgZ
	9VzdTZVG7n7HquiUNGSe0DOLfhwEg5AJyqzETSM+fPxa9r5HnEWKnRu/AZCdrki5
	zYjwDfFTlupT2TQKNeUmylbtH0GkGaSVpWApDfqXfpkLzCqItggQek+U79q+efFe
	7yQYIvTxz0SgPbkKvfh3EmFSfiQ8bzZriv9OSuwCaXRBAFHWWPgKF4ShmjVsdCLr
	ZwAngOBhAzSnkC5i1PGf7i/pDEamRaaZ1ImPkl7Uqa8FOd5t7LGv/NEVrc483ngF
	3BoZuOImd4hyf6udW3Cyg+Vp7OAh5Hb2xZ7ZaNIEQq0sUbqg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3tjehuwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:37:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-294baa12981so11602815ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 02:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761817073; x=1762421873; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K5HucAoMZbV/tahaTphfW6YCK45m5+kty0FraJp/7QQ=;
        b=aqLLQUQYFdo4Gyq47NaVyWanB1gb35Rq6jGQ4CUp4dnSi/SEh56Q+TnTBNIOepBN/c
         axG0cH5ZUUCWOQbmE72MjtTNcxmDz6mw+OVLgR/vRa9CEon7EKGbAiBFin1kEIYMZMtk
         KVaJ4y4Lcbjg2em5vJw9iZZ4KfBVN0f6ECHEE8D7wUvIkduBBA09cjgu3L0Ugv2Xsy6I
         rvZBGm7QO3ixZe+iH6kxcMiGKDNNzThn6okhVgu5lKqSX5pI9vf5RdeR02tldJy2wtEd
         7rhrhUuP88JNs6bPsCB7QapdP/5EYFkOODzGdSR7hONRhpp+mllQ4C/5LKDwrVLr8uPu
         FUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761817073; x=1762421873;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K5HucAoMZbV/tahaTphfW6YCK45m5+kty0FraJp/7QQ=;
        b=B7ad1nnt32RdqZnbarKdqyOkk43Z9lOGfx7sPf537lmlnNeLBIYYMdVdYaIVNFFD4n
         qaTxfQuzzNHJZD9Fi2VcMlcxqyPUfSREc2WsSs/+awY8v/r67JWCbeO7E8nWdoj0Y/MT
         rqrTwlbcd7iEDJPRf5UxBrtZv3EF5d9TCZIHcJRTXp+WTrUkxUeaqEgXmOr0eL/3dfmS
         tJz/gyXmQoTCB7yt/0aLhUnbJvlGmtvqfPbMLagO9/D6LYR8aDrqEBCuds5wwmraeQmm
         KDsHHGvtKrnoIEPGSWrRE9XDLFwQqQGQPRNmvJUY+tr5hs7VFrxN/qihGdJxR00Mbe/U
         Bbbw==
X-Gm-Message-State: AOJu0Yz07YP660EofvNMhQycbMB4FJbtcttEHAm2qvl9QQVUSgvAhKvz
	3xiQipU5XoEJP+Bgg0KX6zYe0o70s523Z98G7pDnQRn3rCGjK6uT4ie8lz7Kl0pTGDQmNGx2Y/8
	fvgbL3EjoGWsWYahtmPm8wj432hJ7YdwJGShannCd6UJvH8nmQtNBNK8LGqZO7PQ/b/6P
X-Gm-Gg: ASbGncuGrZ7tDQvM6HjtXo7UzcXPJKTs0XzP2vhubJG/SQZ2AusF/meRqxLq6ImqUjG
	yNjuXJcG3Uq41pHVFXOzvKNR2MM8Enk0QqIn4eR1B8wKbpEE42KGJS8MC7MhNnF16QY+c5CmBWG
	koEEf8I+ZVJldZ5dWs8uM/sQ77h4lATRS38B0ncK1sjPRdBdQ6d0bExOgaH6hMKR1Bo52iteqe/
	7Li1P2HFNkjnkISlAomVP4wHvFUtkHFxx7emM3v9mXNtf0+UXaFV3+NaD/u9E/xOG/neLOnR2cp
	tRA/Psp0/rK9QkuIfTzmxzzl/LcBoj+v4OY/rVkNMno2fq82lve15yIWQk5Rsxngo6JVB89cNUF
	5ZHGtOrkfhbhf3OvB6pQFR0xfE34j9kJr+I+rqmcYQx/12HmntDHPOWVS9FyW9pnG9+01BUk4cb
	7IOxEKHcAyqflslJrcAMON07rrx/s/dnk7VQ==
X-Received: by 2002:a17:903:230f:b0:266:3f63:3500 with SMTP id d9443c01a7336-294ed0c53e4mr32533915ad.12.1761817073164;
        Thu, 30 Oct 2025 02:37:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+HkN8fcbuCFP0TRBlNMyxmDyXoXm1ORN9ABgATWIptEfXxENAROgfHGDyHKHOJYkE0z28YQ==
X-Received: by 2002:a17:903:230f:b0:266:3f63:3500 with SMTP id d9443c01a7336-294ed0c53e4mr32533545ad.12.1761817072579;
        Thu, 30 Oct 2025 02:37:52 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-294e3ae4ba2sm49350335ad.40.2025.10.30.02.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 02:37:52 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/2] Add support to extract the image versions beyond the
 first 32 images
Date: Thu, 30 Oct 2025 15:07:47 +0530
Message-Id: <20251030-image-crm-part2-v1-0-676305a652c6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOwxA2kC/x2MQQqAIBAAvxJ7TtCFQvpKdDBbaw9arBGB+Pek4
 wzMFMgkTBmmroDQw5nP1MD0HfjDpZ0Ub40BNQ5Go1UcXZNeorqc3KhMGNeVAjncLLTqEgr8/sd
 5qfUDrWCwemEAAAA=
X-Change-ID: 20251028-image-crm-part2-1f6bbefea2d8
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761817070; l=1068;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=0bCr4/wnV/HW3BBCIuwyR4gn2MCKsZrGArTvwCNdTgc=;
 b=/2qNN5zadQqilnck8TxEhlZxyaX3ZSn7KgJhASALRJPcrzJozo4LdsNNqc5xCZ9r5ubo/4w+i
 uOU/D0M3ceECGBSV0w8vULe9ZQH30LjKV3tkYkH9lSaxHXLRPo6FlG5
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: w8RX7Q9dEwGgPb6jYI_g2Q49Y0xv4EIh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA3OCBTYWx0ZWRfXy3VpYCBNpzi3
 NU9Gw9sSUkoUBYp54r3dPIlvOugn2mVNNyhIJ+j7ylgv/rlhEo5yvR4fJ4mOUsUU4+Qx7eIZvQW
 FeiwClsQ0hHIoQYP6JZoSeiMDimgk+Cv5VZ4ssBu7hafxv23OuoRCU1sAFqI7GYT1FEP0AuNiaZ
 3E3D1qmbR6s7bwlj6X6ZNDj2Hz33GrFZcLbj4MBEYN9yJjXFYT6bVviADVOOG2XedlBQaELw9pu
 4M3GrN7cApyBRzR5rxE3qu9SymjpULcVTvivuvDieC2acCxRdb3XgGDP+jFwkbETYR02qWWGe6H
 94J9OV2tJlEq2UcY9VEZu8IxDbeeZ6N1x+BPFkn+ku9fDm5r57SYpPYhS2+A3gek35NVmuAP/rv
 tqyz/n1l93Uvs6sqILE8FjxlzvAGHQ==
X-Authority-Analysis: v=2.4 cv=a/Q9NESF c=1 sm=1 tr=0 ts=690331f2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=yCE4tiJ5SOckIsVVh2YA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: w8RX7Q9dEwGgPb6jYI_g2Q49Y0xv4EIh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300078

SMEM item 667 contains the image version details beyond the first 32 images.
Add support for the same. While at it, introduce the new API
qcom_smem_validate_item() and use it before getting the image version
from item 667 to avoid the invalid item warning.

IPQ platforms doesn't have the SMEM item 667. So I couldn't validate the
image version details from SMEM item 667.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (2):
      soc: qcom: smem: introduce qcom_smem_validate_item API
      soc: qcom: socinfo: add support to extract more than 32 image versions

 drivers/soc/qcom/smem.c       | 16 +++++++++++++--
 drivers/soc/qcom/socinfo.c    | 46 +++++++++++++++++++++++++++++++++++--------
 include/linux/soc/qcom/smem.h |  1 +
 3 files changed, 53 insertions(+), 10 deletions(-)
---
base-commit: 131f3d9446a6075192cdd91f197989d98302faa6
change-id: 20251028-image-crm-part2-1f6bbefea2d8

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


