Return-Path: <linux-arm-msm+bounces-75673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E57BB0327
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 13:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 155171709F0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 11:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0822C326F;
	Wed,  1 Oct 2025 11:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JmWaF0kP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C112C3263
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 11:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759318710; cv=none; b=UXkES3b/inGLXOZFX1ZH25rMyxZS1qDEivGuM40vTOG0g/RrWIKJpWmFOGsxRUDwN2llYupSQBoKU7bMBLiSfHMaN1ZGFKlj8K7gMU7ULinDugPTPdRgMOd0UbEAXuKBOOW1xhZHBrHMi8mPdkUSE6Lu6V4wiH5GLbBmpPgN800=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759318710; c=relaxed/simple;
	bh=WoyeNOztcb+Vnk81dBOL+aT2GzfNPFRVc4TyK8sgBVE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T5BOh3rIq0SY+s5qtLxbk10q7SpRNAt4DsCZx0K9f8rxKsBNqjtKDUIgONv0q2GMacrmUspnvJZrPAIuW07nZwlRhqIGmzCQ2uqqiOFfnc2cCgv9xOPJ/780YYOEdFhGA79r63xV5vIZCn64Ts5j4brlN7i2e6Yw/8kn2rYy21w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JmWaF0kP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5918TFdU009320
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 11:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TD3Ehl3AFe7cNv5YiBoEzt
	pI0Xi1nVstsVb5Bpudtws=; b=JmWaF0kPY4GoXLLokOsdypffGVMatpgqtXiJTc
	Q9ZCEYu2dFrS7pnFi6yj/+CzYk0x3wmidQOqB9vfKbEWbl+W5l6+y4iZWyMrhk7w
	ArnNdQsHArxVW/S73pdzeziQk0R6dSp6+MszYsV9f9yR0Ej16bCG21ezsMGKDHnZ
	2UFY1XacwN0cDDuXMTDQygxRUTrNgSIfYPJkh67O52U+v3MmORtklVMEiQaY0uHs
	pGKvf8HwdjIYZPP4vgyNcQdCqtv3NLiTNs540dZdIJSOErIcFLdihAFMVZzsfCn1
	c2oY0y9xEA0s74Hhxax/xGLWOqfThLKFr5AAuTh+jqmQHH4g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e977v878-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 11:38:27 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b54d0ffd16eso4979381a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 04:38:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759318707; x=1759923507;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TD3Ehl3AFe7cNv5YiBoEztpI0Xi1nVstsVb5Bpudtws=;
        b=Ca3hiZqCNLazbxaDRaSMeDCJ9Dk6EDi/jG/m4vNktr6bOlKpTALuxxvHsb/z0262mC
         dcEmrx3AqgYKtvvw6TZjw59qa1mdi9//m6/G0/NRi58C2Hodn4K7a3DbwmjbBaRgDJu5
         GHvWtIj9NbCehWl9NWRc5sYmGlz7Iy2H2HgWHYbhxpGZwHWWqlEhWgLBDd89pk9W9csv
         D5Lw0dNDlmtFDFqaK/CpdVs7QTOzoamuGlal1BgWhK5rZwZIdlWErUx3Pod0yrD/vBC4
         hJ5wfDswzVbZCTBBSYFpViA2sMBC3yeunprpx0nMEvp4kVuBb/XaebuUFSoJe4V/MtnA
         nUKw==
X-Gm-Message-State: AOJu0YwH9JSVReiIKX10SKLdM0wGfvFt1M64qqRlIVTzBx3t8lz8RCFT
	uGzLV9lOTHK/zNr4B8Vg8Bz2zG4/W48KFecQOMn4HYCtBmPBYzHGrIxjoXU2w3frmgbSVrAotdT
	HHPKrP3cLhImG4kQT1ucvnuc52XqoJ/obOaft25IIqHJMo4mdKtyjIWel/JxtIQ1DX1FK
X-Gm-Gg: ASbGncseKNhThgP650gYv9lY8OIFQtCgupGfVam5Ma/EETbIOlM6MIp2OzQ3Xfz/tjN
	1LovL5cQ7RfDQ8fGCdt1WvkE3O7yYfVWzqNjpUlT9OLluduH+3QM6FQ9VrlQK5gv6RcryfrTxq8
	05LkBgIhm6X9zPNpQ1w1FYndEKLYyHDSjAkJDAgPk71gUCas6zoUK4g98xLnEIpXjxgqNUnVYhq
	WUDZtvvOARS4ED6WjPSU9hcHsIcf9x+ec6TWctPp3OvwrUJNWNXz3gFkXCcHSy7mrDDN5oUmYR0
	9qUpo/Jigpu7XilS2vTyur2NV5b20DrdzUwiive3F/32aUsICoXoin18aFLRhGo0JbsJ3ooowgz
	BrgP6M7Q=
X-Received: by 2002:a17:90b:3843:b0:332:2773:e7bf with SMTP id 98e67ed59e1d1-339a6f3cd62mr3333622a91.18.1759318706995;
        Wed, 01 Oct 2025 04:38:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMafiEGimHKc0YfesDgOhniAOMnM4qXUrYhpaT/0+SzzXPVKsLHZShVPI8EJXqlbEe44F44w==
X-Received: by 2002:a17:90b:3843:b0:332:2773:e7bf with SMTP id 98e67ed59e1d1-339a6f3cd62mr3333592a91.18.1759318706537;
        Wed, 01 Oct 2025 04:38:26 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3399ce47d7csm1861646a91.10.2025.10.01.04.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 04:38:26 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Subject: [PATCH 0/2] Enable UFS ICE clock scaling
Date: Wed, 01 Oct 2025 17:08:18 +0530
Message-Id: <20251001-enable-ufs-ice-clock-scaling-v1-0-ec956160b696@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKoS3WgC/x3MwQqDMAwA0F+RnBdoC5HVXxkeuix1wVKlYWMg/
 vuKx3d5B5g0FYNpOKDJV0232uFvA/A71UVQX90QXCDvnEep6VkEP9lQWZDLxisap6J1wchEFO8
 hUh6hF3uTrL+rf8zn+QekTYxpbgAAAA==
X-Change-ID: 20251001-enable-ufs-ice-clock-scaling-9c55598295f6
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: bzfj6UkPhnuJJaUm_g6qEQq3JpfhCOCo
X-Proofpoint-ORIG-GUID: bzfj6UkPhnuJJaUm_g6qEQq3JpfhCOCo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfXxdxG/O8tPyED
 kS3xkQSCwQfk5XqeOEB2ETEvouFW5H5JwXsBW/kWG/vm+oGLVblw3gKBM+9hkugHi5ldyJwv4Bl
 RYBGmshysZkS4HO4eaU/tmlzL9YSEH1i80bNI2eLIIgsVl8iXrp6OF5KECXdnrHXMTytvKzvk8Z
 Mz3nREA8vrZgB69ELDEhvIc9cP7UfCi9d4/hHr30IEdCCvIOYVyNkN80oU116Pn1ppM13+zRs0k
 gE1/OacNiD86qECmukHK5eSUogc1BZM6bNnpj44WjkF/ZvxIJeiOheh8ll8ZkpJhwLo3UzPyVH2
 gozAIoK9d0zlQU64DKsvmGV2aWJg4LmROvO3VZt5IJnxRSOHc4Vk96IbQg54Uf9VqPT3FWRm7Af
 PR2YZN5kGJTZLam3qQTqJ1g7UCAb9g==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68dd12b3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=leelLz0WBGCC_s1OHCUA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_03,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043

This API enables dynamic scaling of the ICE (Inline Crypto Engine) clock,
which is tightly integrated with the host controller. It is invoked by the UFS 
host controller driver in response to clock scaling requests, ensuring
coordination between ICE and the host controller.

This API helps prevent degradation in storage read/write KPIs,
maintaining consistent I/O throughput performance.

The implementation has been tested using tiotest to verify that enabling ICE
does not negatively impact host controller I/O performance during
read/write operations.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
Abhinaba Rakshit (2):
      soc: qcom: ice: enable ICE clock scaling API
      ufs: host: scale ICE clock

 drivers/soc/qcom/ice.c      | 25 +++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.c | 14 ++++++++++++++
 include/soc/qcom/ice.h      |  1 +
 3 files changed, 40 insertions(+)
---
base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
change-id: 20251001-enable-ufs-ice-clock-scaling-9c55598295f6

Best regards,
-- 
Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>


