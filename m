Return-Path: <linux-arm-msm+bounces-74717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C99E8B9C7E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E15641BC3AC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99CD0296BB0;
	Wed, 24 Sep 2025 23:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VJvZn3PX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6180284B37
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758755837; cv=none; b=DmMFVVKeECo7q8NhevFTAp4Yt3j4ZVyVXes7OVZW6MGMWXRJE8nLec85dD0xwIWywZBKmLDM+tCuFnNZ/PuLnlN1+Hqmy6G760JKcEvjdd6PWz5B2ymKtUBKwBf6evsf0FoaPGUC/doGL7fnwq2EYRYrZEmb4jrXHot/2Bnt4sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758755837; c=relaxed/simple;
	bh=bZ7vzZyfQX5UaLwavPV3mZ1y1L64kpa5LLrsI0ThiPU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AeWKS8pquKBi34LuLklxN/EeoW29//3lz8lbeQ5QO2mHNYb8ooBQih8ZefZLNFAO8wzvqKnApqnl1pp41dezVmNZNByTO57a5ULt3BX0OwRE9jqPk18LC9XmwtJzJaH8Ps+3rJWuSPy8S28AdG8EqEO4DgPm/siJZRgKfNp6zXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VJvZn3PX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCO0Oa021670
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cYa/YlwfkAw4Rr816M6vHs
	zMvOg2HLMgmr6PGy3HUyI=; b=VJvZn3PX7oMHbG5nTdbVOKPhmKCwVpwwgybP56
	s6ihRz9UDqHms9LVrQ5SoqlWjkdKkUmV9JUwN3K4Zai1tyxqxNSEnjtPhU8OHtha
	zUKvrV6Es8I56Ia3i/lHBBnnnm4lrtIEE4v26Z9wYniX2iHcZfwA/ghSZylpUHWU
	NjgZxV4CaKqPffLmVGgsU1L3/p+M86KoPLPlPKEO60nfG615TXUsedSh3w7Kjax8
	dJgI/PDBfHzpqA9cO+JL7Zxc2BpZcIxHbYwcQ/KU/1XMK8y9tNQgZeoLCddt5grp
	EjClTpvtSD7GE7Fwt9bF5X5CNg/93lW0wL5w2e/8zStdNTZQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budadjee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:17:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-25d21fddb85so5019465ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758755834; x=1759360634;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cYa/YlwfkAw4Rr816M6vHszMvOg2HLMgmr6PGy3HUyI=;
        b=hLLuu0+Om2n13CmCcPmttA3R0xAsirWldAM1HCiLdGL3e33O3appEVXSDUEnU8ik/B
         tKe9oJvoI1F1AjnbIGSreVNuKKPYzs653BZ2n1dR7TLUbtfPJ8NheWrkzJh5+LeHI/wC
         gM2SPt1jtAqeE4sH+0RxvsSsws1BNKt6Y4s1ZdN+Z1jsOU641q7WBg64sll/gTG9rv3h
         AYZFDNEKAMdnXm9TSqj25Y8PqLkwhHF4a/4p25c0hWPEancakoD2KfP/B7iJ587faXiS
         cJrLg7olyf3zQN8PH/us5u3hS9bVvsqM+Ne0ZXa4WHO7NRlzw7vDnmJagucE53EKlk28
         DreQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFJJ9p3MU+stU7EopmPv2t1BHIjUoH8NsNwHh2hfgtKj4Xo5tuwOKdUspSL+MWSmXAizPMN0HoM2tJMUfK@vger.kernel.org
X-Gm-Message-State: AOJu0YwgCRmEA0ZRVoPxXIeKZrxxStkGQ5UadqytxLLKVHoRWd48bC48
	zSXnGfXviH4BNU+EEsm9wFX0ZKvrYnTkRd1OU4TavS7ZPyiEM6mjaZLQcPbl4utWFyizhwhzgvz
	AIVkGFP63EIAiyF51MN6I0lCvYT443EM20+q83VZfyHT4UAF2ftvQrvetvs6GJK0Joj/C
X-Gm-Gg: ASbGncuunwM/XOZ9QnNUzG/JrinMhnenz6Mc2rTsmVY/KL1sRMdgnWPs4/MeIW8/xB1
	55LLW/ngpY/gmNpVjTJrdgpC4Vyup3p5FW2rYyGH0kf1dYREOtHH5jCbJ69QlabvLX8pTF9Adf3
	NXAOdV0iqNvyqKNkdUQpTnEIIIp9fBhl0cJf8NttKvIDUaGln4J1LSvXnh1vHMGDQTy/QUCRcAT
	UKxvUCrnBZK/4ysldkCcia7vd5EpRzoADr4Plu+fiAkdFMUeswXQy0LSZKMJHa0xDwmklZIAQoU
	e5Q6UxYAf3PhSXcjxfIOhir5ElJvRnIxLP7Gplmx1M09mZ8LHyEcKfJ/Wi09fQu7AoPlvj6a5Lq
	onbKHCvqRiTzT9Xo=
X-Received: by 2002:a17:903:78e:b0:269:9ae5:26af with SMTP id d9443c01a7336-27ed49d2c58mr9052795ad.13.1758755833502;
        Wed, 24 Sep 2025 16:17:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRkzT6M07G9l1gLomwbTaMNgnrfjjd3aHGRwNGyWdAz1cnH5Pua65v227ovxIpszjWLy8YkQ==
X-Received: by 2002:a17:903:78e:b0:269:9ae5:26af with SMTP id d9443c01a7336-27ed49d2c58mr9052555ad.13.1758755832995;
        Wed, 24 Sep 2025 16:17:12 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed699cbfesm3892125ad.108.2025.09.24.16.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:17:12 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/3] power: qcom,rpmpd: Add support for Kaanapali
Date: Wed, 24 Sep 2025 16:17:05 -0700
Message-Id: <20250924-knp-pd-v1-0-b78444125c91@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPF71GgC/x3MQQqDMBCF4avIrB3QaFviVcRFTCZ1KMYwI6Ug3
 t3Y5Qf/ewcoCZPCUB0g9GXlLRW0dQV+celNyKEYTGMejTUGPyljDhifnW1tH8PL91DiLBT59z8
 ap+LZKeEsLvnlnq9OdxI4zwvzzlfRcQAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758755831; l=819;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=bZ7vzZyfQX5UaLwavPV3mZ1y1L64kpa5LLrsI0ThiPU=;
 b=bfdzGlAywR+6gVqy6RQiPTKGLFSjSfgL0KX0z9Lctgj3wlXQev4gxSq+0wcBd49uQbszgp+0K
 nD2JAyMCZL+AvFue+GYBn8KeJafTFqikUg7E9OiyoWopFccU4STBZ6S
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: _f9StFOfoMhGXo7XX0JTsZapuzox8Vr3
X-Proofpoint-ORIG-GUID: _f9StFOfoMhGXo7XX0JTsZapuzox8Vr3
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d47bfa cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=hsnQhQ_IG91HmfWgDXAA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfX3iG9U90l9ER6
 nW0TiOcQkEEbTor+x28SpXqVcYTbuk+YtqrjzctGcw9MSsBpSHK4NyfzVAeb7YfLQ2sp4J/Ei4d
 9dHogzh+16+tn+f/EZxAsnQnlaAZUWU87jlEp3RHk0IZj4YzGrvzj2nELUiToJ01X4eeI8fg8Im
 B0AXbdCWDB3RlOIk1Zkb3hX1mkmE4Fk4skU+99MQQo/ZwYmEgA/coaY87bJkbY+Z+3i2hPsxmT3
 5ubud5cEI+G92n+kjgbnMK43bKaoWh4HuSMYlJS0QySnoUjXrdmo1KyqQKJ9ymmBsHGmnCx97hX
 AMSJOTrtjpcPyc6O2qODAa7R5Ta+7IyO1gIAalQXGBxlh3w2vD9nER75zW/3gxL1gHZm7x8BmVp
 /Uv454bc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113

Add rpmpd support for Kaannapali Platform including RPMh power domains
and new RPMh levels.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Jishnu Prakash (3):
      dt-bindings: power: qcom,rpmpd: document the Kaanapali RPMh Power Domains
      dt-bindings: power: qcom,rpmpd: add new RPMH levels
      pmdomain: qcom: rpmhpd: Add RPMh power domain support for Kaanapali

 .../devicetree/bindings/power/qcom,rpmpd.yaml      |  1 +
 drivers/pmdomain/qcom/rpmhpd.c                     | 28 +++++++++++++++++++++-
 include/dt-bindings/power/qcom,rpmhpd.h            |  3 +++
 3 files changed, 31 insertions(+), 1 deletion(-)
---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250922-knp-pd-f639194fd7c4

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


