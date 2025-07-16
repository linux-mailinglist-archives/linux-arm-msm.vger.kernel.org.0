Return-Path: <linux-arm-msm+bounces-65115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D76CDB06AA0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 02:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28DAA178B66
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 00:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B154E136358;
	Wed, 16 Jul 2025 00:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gAEzoZ8w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116FB74040
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 00:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752626410; cv=none; b=oYGxSjEeTQRdPbqvSqsRtgSpTsG31XuharXR359DBumiePGFkjBiFA4HfV2VMSLaJy8H8dcOBapVscTC1B6z/KMdhxMIdnI5/BXOT8BGMB61nuBnr/0nZxkHAhcFWb2O80f63EuPr6GKiZB4iYPR7bdBYQXxTVScW8nDvLsB4ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752626410; c=relaxed/simple;
	bh=1Z6UkGBZr7oN805L7yjX7D1r1YPj7Qg+OqqyeMr4cyE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P02Ebl9yeBftw30lQRjJCvEagCyEonqY6paeeUYk3KQklYh7/zEy1FYsAsFlD+Dph0/QEI6vXoPesjV71l+2HlQi7x3ejqBEa/nHLMRvlGiDDyQksk9FKPc+aaXLHVwQHnruzm6tfJfOITBPgcAHP86pH65NHwYMQAKR0XwGynk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gAEzoZ8w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDHRs031181
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 00:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VzUYJgFGxoAVYBUN5oc7Pqp3z3f3GFuBQrm
	QxX8NW28=; b=gAEzoZ8wub87aT+QmrD5lAyTodOyu9WtMtiKUyw6qDnVvaIJgQH
	PfGDkJSUUdqlkMxdTynEnJCSlpNoXWdvVW25FPef7qe51RGS2u30dJ4tVNxLhWPv
	hgVJuxzIClnJ8hMXJ6L03v5RqEN6FsQrjZVwnFaADyqu1dtKyGXmQ05d6K/rR66B
	LWuGfFR8dYSOjHeCH53Bmo+H92txnEqtIb9lkoXPDeBnXF7F9lsYDSQ1CjgXjg38
	d6eu32cZSJsX6bXtjREcTbNmtKz1ke9lnKioCjgWahMRJqt/l7VakNpWgrZRIjZh
	SSCtEj4VZfa9fO0/cGFoYS97RUqKy3e1XDA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufut9wan-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 00:40:07 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2356ce66d7cso97553545ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 17:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752626406; x=1753231206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VzUYJgFGxoAVYBUN5oc7Pqp3z3f3GFuBQrmQxX8NW28=;
        b=SjspuUnc/bmyVtY5dWMeTR/a2w+iN2W9rTEYUltvVdx2daN/pkqvvD9gmFmeYi1UA7
         PHE8b4pRvIw4YXqLvI04pWDVHFdF6HsrS5J6hIX/BBZmlIlymDU0i1if5szqlwOR2SNz
         F3FxYZit3wwJVqjnRvVWwLDq2vxfAooP1lCKy0VJ5h94uu0DIOY8k4sj1P9KMz/Gh6+4
         XrkMDQcxocAypxJXYt21OuuRgqzxgIUNdnJr2OZ9dvrnKzsOQTXkcYXKqriWTQiwQ+zf
         ROTZSgOy0tMW7RHALt43bBXrbSKWQd+Otf9tBdFad3e67RIVQauI9u3r2qmrZ+GYpBsY
         aB+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUy0udHv3hbnEIBwAfYI4MPpNVwzkVCu0wIZi+Uyq0wdnzRG3npJbdWcFx1mV+BqZ3DtRgNHS1ejrWCY1Ft@vger.kernel.org
X-Gm-Message-State: AOJu0YxYk2dHAee82PKCfhAlu8Dlot1esSNT6GEePsBMgIdht7o96rgE
	4oKnFnbahCqX6RS7TY2Y684EqwvbTpagGPtiA+ILod1DmUXe/BnFURVFYst46FsiA/JKBZ/ErWc
	qYEE+PFLyU8BbPlahAoR/0jlBfW12gbR246iTqMzHd53gTTSaoTOGZXnfz06H4xopF9im
X-Gm-Gg: ASbGnctx9hHqW7nZQPfGuK/+ipWkFoaa/Nf9GoHRLu/uv4gZMvjRknF1zTlkMpQU006
	2UvbzzxKc60WK6oghnNbX3xSb41xVzyBrPK/Rltr6DvxOXrhCd+kw124b9nYzYeQTlaveMoQSrm
	YNm0FuLez0PU/Sr2xLcq4/tIec9YUPax2BcWXbH322wfptctZGVpPFAQd4M2o+qmHFw9RAfytBy
	ICMdzzkH7ITQ1car6ec4vCuIRUGBi/HJ6fftUGS5h5s5whorSvgH5d/QXOd8SAzHZMOkKokg6Yr
	1nqGt+doCfmehrys6LA4mIklyAN+GY+oBQ9U/uw8W2YvmZQXQCU9Fo7NzzKPdjgWvqO0/RVBlvm
	V/Lf7XVLYJCi+DNZ7k0DfnucOrjQ=
X-Received: by 2002:a17:903:28d:b0:234:c7e6:8459 with SMTP id d9443c01a7336-23e256cd95dmr11394275ad.20.1752626406523;
        Tue, 15 Jul 2025 17:40:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3ES/p6LGhzaV34ArPImL6N73MMe/4t3qyNZuIxxo4xO9vbqvGv7dNf+3w6wdfTXF07zgFqA==
X-Received: by 2002:a17:903:28d:b0:234:c7e6:8459 with SMTP id d9443c01a7336-23e256cd95dmr11393945ad.20.1752626406059;
        Tue, 15 Jul 2025 17:40:06 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42aeadcsm117015525ad.78.2025.07.15.17.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 17:40:05 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] soc: qcom: pmic_glink: Add support for subsystem restart (SSR)
Date: Tue, 15 Jul 2025 17:40:02 -0700
Message-Id: <20250716004004.311001-1-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e7gGSbp/ c=1 sm=1 tr=0 ts=6876f4e7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s3rR3T0EdQVOb1-HSqQA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: NCtu7UZSLgMygCX5sE9_rl8xzomuvSZp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDAwMyBTYWx0ZWRfX5o11d6z0WzTO
 VaG5f0SECGa/Hep05x5Oio2iI/k4SXxLeXbYSGOoDwUpphE8ysZg1bUe7wl/cpvFeDp+QTX5R9D
 SjDo50K8bNR8plyhR1jbFWt0LRTqPJljaJVooZoQdSGPZRK1CWZSLRiVIXpoiI5qMlAoPCsgL8y
 0qI+lWXhMb0JySNDJU5ffYnSBa4/W/2iRPtmwumqvP4yac809BKQHG3Tswz/H049/e8tbdkfsdI
 ceB2YaOafKExfc6s5LDWjVD/0gK/oxblGvl0Gszi4vCSUf1cpT0jWxBhvK5FN0aARvyN8bw8PrN
 yCFO4SN8/Jvf7BJHX6W0AGBpjgHh2oWHILHn3zGnEuwJd1zVW0L3vLLCGUz+LApnfsf5SmPQC3X
 wQu1dDVvo+Dx9CfdvxyAaxoSWfURXEURimb3Mnkds0qvu008HURdYojjJGEnJdHXz2WZBUcB
X-Proofpoint-ORIG-GUID: NCtu7UZSLgMygCX5sE9_rl8xzomuvSZp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_05,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160003

Add support for PMIC Glink subsystem restart (SSR) so that PMIC Glink
clients are aware of when subsytem come up or down. 

Changes since v1:
 - Add "qcom,subsys-restart" dt property to enable SSR
 - Add ssr_name to platform data 
 - link: https://lore.kernel.org/all/20250624225535.2013141-1-anjelique.melendez@oss.qualcomm.com/

Anjelique Melendez (2):
  dt-bindings: soc: qcom: qcom,pmic-glink: Add qcom,subsys-restart
    property
  soc: qcom: pmic_glink: Add support for subsystem restart (SSR)

 .../bindings/soc/qcom/qcom,pmic-glink.yaml    |  4 +
 drivers/soc/qcom/pmic_glink.c                 | 80 ++++++++++++++-----
 2 files changed, 63 insertions(+), 21 deletions(-)

-- 
2.34.1


