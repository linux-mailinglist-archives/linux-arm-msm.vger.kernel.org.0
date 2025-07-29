Return-Path: <linux-arm-msm+bounces-66957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C254B147BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 07:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75B621AA25E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 05:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B00723B609;
	Tue, 29 Jul 2025 05:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JGXYWVk7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED474239E75
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 05:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753767772; cv=none; b=TdaaIaZjIONcQCDwVUsX4grKr4EEVtX8ciOT0tCQzz8mH5G9pe1hyqevjcyFktLtLw2kUq/N1gQCF2ibCTLZyzp4XFgYdLSfoo1PWv5KH8JBddE451UJmD+5Wnfe15ELHRXVjIeBf4CuyajTsf5abreyDn8Mji+jx/a1jt0OxmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753767772; c=relaxed/simple;
	bh=esSyQi0W7TyT2YkgO1r6tVX3e2HQHpTIX/6q2Ao/a/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TDBdT+mh2w72n/+BYNwKtqxhXfV+q7I0bxu9UbOwHJnzjwGWHSbHJM6JUefFTpVyN+F3ar2r9zddicU8VZCOWgw3jz/1SXGi4qivDEc3jriwNWsLlowH9U0mPNxcUkVL/QRQtAtwggwkgc3arXueagShykmhcd8cWQkHns72VZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JGXYWVk7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T02JWL027028
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 05:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6rnpiLU3hM22/JhSpmUfTbNPUyp22pzKiCZFvxt0pVU=; b=JGXYWVk79w1UQ9DB
	uWHR6uuD0pKY1y1X8F2Wq8hchuvhf51pE3Hw5W2wrIowEHPBt7aooHWbNWn8dWeU
	DdYTXzHK7Fh45ZpoMDGkfHv18VzoeZbPiq098AGb/GLC+w6zIXOFfrurNOdgxQNT
	aKLn88nakO4R2egjQNeZh3eLDsFkEm0doT+KroWoBr+s6yxK67qPaD5nOfhZ1abu
	14sWGf00hUaIhtWQbYKmQgF5lBwsLVh5/9JS5Oz7ucnWrNMVE3S+SEMFAQrN5KSC
	DS4HjUvmTlbiVFLhXm4YdUyqZp/1LYPkaTmhzYbbfbl7ZxxSDFwDiN9S+u6K83Iz
	RsKE2g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q3xpvj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 05:42:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2369dd58602so53956785ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 22:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753767768; x=1754372568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6rnpiLU3hM22/JhSpmUfTbNPUyp22pzKiCZFvxt0pVU=;
        b=O+pPhAaSX7bxFmUqSugHZkCkid5Xn3OpATZfmCEg+v+8exYx4hatn+l+NCLbFJXESd
         A0fulDO2co5cAzD6g9bDVkTEjnzW3YTo2iBhTvxVHpCF2vRSktnCzV30wiGZSuHTo5Ti
         voMoS0Og0DTwdZpfixhmuOWnpNZ7gc+Xj3OaDCQa20bKbgKbXhuZbsHcjMK2AKB8/oM8
         nrtY7B1HsO3MLEPKpZvtPgJ6CJhPpn9BrV4zSPC++ZaZdYk3YpkfYxrGv0VFTSNXK019
         8wUnqrBAqNUaEvV6ONrhu99I8jm8tOx9rQSZCTnbplGXf3Pfzap2L/mU7Ok39LcPuHh1
         YSSA==
X-Gm-Message-State: AOJu0Yz/sR2wIBWJ4MyZWkpHMHj8aztwk1OBzw7ktRl/BMhesh68lugs
	pPD0fjWsrqDO60D0UuFwmnasa0wg9oviAOPWvRRZ5Vu0xw/ErOEkSkeRTjt7NeRvmRsjjCnjPXi
	DEcxzSwAF/9nImf7LUswHKGfgVAQDZYECwI5sVD8OIu08Y+mEJXrueQmswRNmkA3Bvi1L
X-Gm-Gg: ASbGnctID1VrgRsl5Hm+DKEMjGm0Xw56DZso7wHp/3PQc1ze33DW2wd7u6Krl7VcaNB
	c6JIs3oeZr0A/L8P2ITohaXOK6B4V6qcgxttH5mKCut0yOdnsa7rshnbvM/DRuwURLZ0RQbfLDN
	YSeP+6j0FkcOZCAjHw9W0JWUb2zwmjzv8v9Q3MibMFXQMU7pcAsrFYbp4Qp/vHQZFOHBeEqq2U1
	m2JHJgC3+Ewtfq032fl6HvvfOESz+0XQT3TT6L0TKrzpc9NSX9XlMS18J3YbrHtTxEHXQ2gCLJ3
	cItvcGA/B/+GRZeFz0Tf7b1kbb1xLnMsP9Z0s9uwZORDbvPE/axHteIulRHtU57v
X-Received: by 2002:a17:903:228c:b0:23f:d47a:c9d3 with SMTP id d9443c01a7336-23fd47ad8e2mr144843145ad.15.1753767768584;
        Mon, 28 Jul 2025 22:42:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiYKbGhzM8cnhDQGbr6CQb4riSZZBU6sRu8Iv3TLyFtGnM8iE/iHelWGK4PqkoRYkCzceoMw==
X-Received: by 2002:a17:903:228c:b0:23f:d47a:c9d3 with SMTP id d9443c01a7336-23fd47ad8e2mr144842865ad.15.1753767768169;
        Mon, 28 Jul 2025 22:42:48 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fe9b67485sm54505235ad.47.2025.07.28.22.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 22:42:47 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 11:12:35 +0530
Subject: [PATCH v3 1/7] dt-bindings: clock: qcom-rpmhcc: Add support for
 Glymur SoCs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-1-227cfe5c8ef4@oss.qualcomm.com>
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
In-Reply-To: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
To: kernel@oss.qualcomm.com, Pankaj Patil <quic_pankpati@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=JovxrN4C c=1 sm=1 tr=0 ts=68885f59 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Fi3-m60RFDWPkiaf7JwA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: H-ejisr5POAIM_O7B9wZJ7u1pfaoQ8hP
X-Proofpoint-GUID: H-ejisr5POAIM_O7B9wZJ7u1pfaoQ8hP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA0MSBTYWx0ZWRfX0IIo3JsgI4Eq
 u//FPDCGmTwiCiN7+8aeGZxhDiIH5pJ+27beLVPYvUSvSYdj8fLOW0hL7/rff8EWntMrfZ3qS3C
 wT8BpTzmU1sBIZyMRSy9jjU1FVVH5R20TS6UwJPdDOTKaNQWBjbX8vmCW93CRmPE0JpVo4LWg8M
 dqpa1+RbtX+9o1f6LQQyxXOaf0WYAd/1x7Swl8RFXDhp6rDeFAUAqtKrVUYm7R+387VqqmkzUS9
 NM4Gkr7P6FghzgydBv5Q0mNJNcDDUfm0x2HQ9VqmWQsEhcHoBUEmo307b63N3TGQ7LwO1HbjO+Y
 TXuM0gYp6zVg9O1tE5XtjTbBbL57it4nAFRgelH+WoHI7wtPl8QowESjWLAdnj8CXl3sa3TnJ5U
 PRj3Fsz60nGyeX7W5kGkTWdL8FrTO/2RFYl67vXVlcfneyk5+7qs9vUi5jmfitFaYOwFiYht
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_01,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=989
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290041

Document compatible for RPMh clock controller on Glymur platform.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index dcb872b9cf3e01f87d4fc546311eb758ee63af9a..27307e7bcfbc67853b91de5408b009cf6ca75ba5 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,glymur-rpmh-clk
       - qcom,qcs615-rpmh-clk
       - qcom,qdu1000-rpmh-clk
       - qcom,sa8775p-rpmh-clk

-- 
2.34.1


