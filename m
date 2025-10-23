Return-Path: <linux-arm-msm+bounces-78448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 576CCBFF301
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 06:58:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A354B3A89C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 04:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB1C257427;
	Thu, 23 Oct 2025 04:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OuEeMT2i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A18254AE4
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761195473; cv=none; b=BiB/to62XNcP/wHIkRCxXuXqZDoGQfOPIJ+lPDglF88pSZX8YVCJLdSoE+7HsHvVUHj6FFRz8L/a+3Ly6iy/w/MnJtOuKvznrn9clSFTe82WBXuOLI2WXaNP6NQ7IXvbtmE3bknUPqVMyo2pjhfXqF6y4QZs3tjA2dd4pQfHTNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761195473; c=relaxed/simple;
	bh=eJ7Y5VSwo4ss1PtD516LDcXHrGyKt6PZu+aZj51XL9g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M14ay9hPLZABboeu5EQ/7rsOQahw62QERBJwVCSY2/BqrZupWYLJmS6YvYNU+mLEMEgQYn48vxWyQE4xT5u9fFRtuie6Pm8iHNbLKDjtzhAlpTwTM6zqg2Y/ouGW+siqU98zvEvXbWIjbYMsyQja94FE5tX0762JWo1nIukTcCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OuEeMT2i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MKNBf6022116
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:57:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4uQ/De1Ln8L8ulGWOV2no8
	d6dEvtTp0uEoplF7rP/UM=; b=OuEeMT2iLyj7zfZAcImMVQ8LdqeGeVUn+zB5ia
	Hw9EADA6ivalJEVi3qqDLMuG87KAJDQ2UwQLPVQNefWvwL6+Xrqg3zryKprXlmuV
	aCj/qTpIEz8KiEw4+T8cZonLSk9r8lqNclx/Fjtq4bOIApsIZAF5jdmCUb3j6DLb
	Ao7oAFGAbEP7m9qzbSHGNPc/xpbPalUzIMnPtlWNcHgfKqyMwOvlf71GY7lLcMxc
	tLx7XhRRk7Dv+QfNCBlfFX7TzJCrceHNHU5myBvhN7wfJ5MOCzD1EnL3lotqta2S
	SO7G/2qOfkGbJXK67o7uWoXSYns8fg6hxYwCEG++J1o8TzKQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qh142-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:57:51 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b522037281bso245448a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 21:57:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761195470; x=1761800270;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4uQ/De1Ln8L8ulGWOV2no8d6dEvtTp0uEoplF7rP/UM=;
        b=p3zgSJ5/kKj7VFEPaz6gcapxbhtypK74fGuTPxX372E8Fm4DMANHPiXUv0IWZVHVi4
         LJatTXIcl8Oq7xE3N1Jxut4c3dcOhXJb3/YAU5dxVCWSOZaGZrhkVxablv0c/lU7HQJn
         iXP3u5szB8KbsgzvDxuFYQCTNujRVTcJ2I5n6i8r36xNQQmU4JnmFsIx5Wpv8/PmHL2T
         Z3vmLTJ+ZYbvl6b4x5iutdjkf6XwK+RywlVDOrI/xoajxMLjBcXzA9jo9nXpPg0mcYr6
         NUQAozCyaLIeQ8goVCETPU6DZWOwRGnPp6Vcy8ByejJT1WTRpcv5yA4pv1bIgQaDpuhV
         lWeA==
X-Forwarded-Encrypted: i=1; AJvYcCVyxgzzXfqlctksLLNPIx3nY/8D1QOrMGOLx4Ja+PvEt1OkdGyDXYfoiZGN49vyjplc1ehDWKzWfY5kUdoe@vger.kernel.org
X-Gm-Message-State: AOJu0YwIeJwfF38Z8MKz9pyE5qosikIgCm55VotMlONhF7j5S5h5W35I
	fR2vGxDUcSbLkEuCqfr8bNtyFzjqSINUUSsJwZcR873DWVKK8zcUDaSzZGtIfz94NaM1e3HkVKl
	6GeO0iuLOOzVi29T6Ec8Iy7h1dRoTypATggGO+V+dpDzsl9rnMgqtrIxZW/S5hfFkLqOv
X-Gm-Gg: ASbGncvI8pVSmSbVPDcohsMOgM6LhgmSxuxbAAO/ZBCxKvp1FTcQLUyGVCIOv4YDOEA
	vQA03RyRbTHUSbKn9G5lU0/5uKZwjCNPYvF0hoTl0FvR3u9YRmzbat79zM5FtlGzI4nESaYCM8y
	qUFwikkvRYNj5csxBaN+go3fhxL3SmhpWETX2ozH6ZFOP/WeerAKDuIHtlFXMEmLpgm490u3gDG
	yShZ9+pC6FAZvfaEUcScC1dx/4IftK/ulW411ZRHjj2C3chR3LKCoWIAyUWppAgjo56ytTXqTQf
	kHp6GPDTwdIztpdrsjhWWlIXy+ZKFscZK7DKnSrpDhIiZA7JQHzgZTcgR7eeMHIcVSTY6cIEV5l
	VDoEf8a4wuD/bAVS2eNgTlpr9LuttLEqh6fDk9IpLBiJYEn1uTA==
X-Received: by 2002:a05:6a21:3086:b0:2df:b68d:f73 with SMTP id adf61e73a8af0-334a8611cdfmr29242007637.34.1761195470317;
        Wed, 22 Oct 2025 21:57:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqZ8VAhBRbtmgIzX3pXjSZr1ekf3A32HB7rzY3mUQ56n1fbN01Nzd+vDSQoWVzK469z6n2Jw==
X-Received: by 2002:a05:6a21:3086:b0:2df:b68d:f73 with SMTP id adf61e73a8af0-334a8611cdfmr29241979637.34.1761195469877;
        Wed, 22 Oct 2025 21:57:49 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4bb86cbsm814289a12.7.2025.10.22.21.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 21:57:49 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add Qualcomm SM8850 socinfo
Date: Wed, 22 Oct 2025 21:57:35 -0700
Message-Id: <20251022-knp-socid-v2-0-d147eadd09ee@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMC1+WgC/02OwY7CIBCGX6XhLGYYoYqnfY+NhwFGS9SiUJvdG
 N99ob3sheRPvvk+3qJwjlzEsXuLzHMsMY114KYTfqDxwjKGugUCGgWI8jo+ZEk+BukgWNoZYut
 JVP6R+Rx/Ftf3qW5HhaXLNPqhGdp1w4ZYppR/l+KsGrzIwaL+J5+VBHmmAMb6HnivvlIp2+eLb
 j7d79v6iNNnjWZ+vuq/p7W8ZhsUp2NHRNbvjAHXQ+jR2NAzHZxSe0OBD0GhRq01V9nnD+JSK2s
 MAQAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761195468; l=720;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=eJ7Y5VSwo4ss1PtD516LDcXHrGyKt6PZu+aZj51XL9g=;
 b=quWZ0dtJBw4mgDgA3O477qU7bj/rsWlXk1U7Q+0f5WO4RQGhEgAoHgfVXdBQyMJIvE3cg/STS
 IyfLyvYVdmlCCoHBCXg6TkNPUSi3s9HhYWEf+oun2NZrDAZ8anhgvCF
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfX+i3W4x/KAKtF
 UjPSfZLtWcFI7Kc4YPHqlKu9CL8pahmgQbuzci/Pu4uRZVQAcvuu4DL2ywBjQJuDU+Do8CPTI8F
 Waukc1CYhDHdEscabRAX3ESLvgmfdGNvBHjcyWSWS4C9olX7Uw6y9TRd0k68+4D+jUXX7XXwGJL
 akR10gV8gR4Klsc/B9sd91GqAt6V+63tnwiZ0AGo/KNvuTBSx3ptq9dAQ1pmr/sGrBX2P6Q6dbt
 gl22RwctIGgn77ixtkBLUobtEn1XTyWltS5EEE/8eFg9kuvrfElxdkN+bTX9OciEvazggzKjrv5
 SB+1qqJ5Guortro4x1tBHYrJs2pA1UQCs1fw2WrbqALaosxQ3mx5WyukwGFlYljpJL0DrF3pprn
 GsuZAbOEZgrrNGSfl55GEK+Exx8onQ==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68f9b5cf cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CTwZ_wOYRK3Eq8s6QOMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: -g_fYI5JP8rRtsNu0SVqg3A4x1JjQu9t
X-Proofpoint-ORIG-GUID: -g_fYI5JP8rRtsNu0SVqg3A4x1JjQu9t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168

Add socinfo for Qualcomm SM8850 SoC which represents the Kaanapali
platform.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- Add info "Kaanapali" in the commit msg. 
- Link to v1: https://lore.kernel.org/r/20250924-knp-socid-v1-0-fad059c60e71@oss.qualcomm.com

---
Jingyi Wang (2):
      dt-bindings: arm: qcom,ids: Add SoC ID for SM8850
      soc: qcom: socinfo: Add SM8850 SoC ID

 drivers/soc/qcom/socinfo.c         | 1 +
 include/dt-bindings/arm/qcom,ids.h | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: aaa9c3550b60d6259d6ea8b1175ade8d1242444e
change-id: 20251022-knp-socid-b0d9a35ae9ca

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


