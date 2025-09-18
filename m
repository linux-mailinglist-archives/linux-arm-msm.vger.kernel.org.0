Return-Path: <linux-arm-msm+bounces-74046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A95ABB83C8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 11:28:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D67E16EE7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 09:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 806EC3009D4;
	Thu, 18 Sep 2025 09:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SESQ9tHW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7CA2FBDF5
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 09:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758187686; cv=none; b=dyhSuWaTTz6BpFNNF95WkQ+T+P5wsN5PTDS3EWhwPmLawVjN1s9UiDa3zAUk6YOk12KsFAEFwadTrwkMjyos8ho1VQaBb/B92MgQjCglqpn+XnOaOp4mVugswTpyy8ppbMXhHR2MsLlzbFAnxm0IyeY7R1WlMQAfLNC5oioDLC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758187686; c=relaxed/simple;
	bh=l6H4V0fQEokHqrkMVzviMMbf53iH0VnNQQZCKS04FPw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RDne8b8MSibsft3tRQXR/V0HWGuIHT2xMNsHOJnUSk9xNOC7jjZ7+e/qVoFpspCVNet+rvTH1NKEJenCx16mBp8oYIrp+1+yHBXezMqxHdftOuxE51D3e0u2oXl8q6X1G8iYTr64Xj17+eNVZuZ9ImFoAEPvzyrivAAEzAgs63s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SESQ9tHW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I5UMjY017934
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 09:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BHFxrzpGWX6fpMMyJtE9Sd
	73ze9X/UFyj9mR/CCnpNI=; b=SESQ9tHWfvNidSpU2IDiakLhvL4iDlruqiWkZh
	BJZ/TsZ/TkG6IaNP52Eh8BWMhFMRjdU2uBggz67pAqk66X4Bz6wYT0z4qUz+knop
	I3EIjh1EL+iY9jWMJEdhZqw9csRNEP/HE1FzIKe/Z3qT+p4NAJjI/gbvEV1/rm4E
	OdBV2XnO/RIMoIQDCSfigPcLIPQRvIIJsIsuKyMu6BHCGiqWkYgD8A3b9plfF2D4
	qf3KQJNFo4TNJlmTyLCRT4phKoaLEhbRvmr5EprDXq/UXpmeKholX3bQyWBwpskP
	yZHAF5gEGPg2qF+KUUEtgVl9KcgzPfa4hnqwjL5MLcIKIF0A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4982dea8rm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 09:28:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77d1bd8d0a5so653937b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 02:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758187682; x=1758792482;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BHFxrzpGWX6fpMMyJtE9Sd73ze9X/UFyj9mR/CCnpNI=;
        b=CDScjQA6aDRVfXQpz79c/fq+hDfxHYvwGhEYdB0ntQOk97lXeK3PdTMnBdzQ1QxKr/
         hvttmgRF3XQ8TM/tfNDijuXF20XDbcIgFuI31oIxWe8eKvZkJsNddjVvbe1JScXSWbI1
         83TWvWIuW9t6Rd8j4c6eB09fkNcg4Yzs5Oy2qLnGMqA9VMeXViGBBdvnXKVpDrqtu+lS
         bG52HVCP5Zk6F4VGvjQVGzZ9sLW5oBzMR4+4KUuObmCXobbVdCfZfSwUOk4CJB/RZs9I
         3RUjL68OLnkl1T1r0etVznwCHy2BHmYsGuD3Zrph2Kgp+5XQEuM0kPY1ClXqBr1U+Oa1
         ZNlw==
X-Gm-Message-State: AOJu0YwnnkLmq61rW2QWVjK26nqEjNj2Cn2uM0QFLfPK3fm3cEp57jbA
	WcE8gvtu+YT6kqcElL1wBu9sMe4FxRZGClAT+Xh9v4TnjxjucMwpry8KLddh+TmbgDCnEaB9SJc
	HSxTsTGhnsa4FByF1mtJXYhuVloljdTeSbsbalq3il2cdNgAOaBmAy2uKOo8ZSVBMeNgN
X-Gm-Gg: ASbGncskiiki0d/34Q+vKluCE5nb6DYDk5U+BYk/E3T6z3BeIllTlkcGuLs8laM4CVl
	0YiA3WijF1+8m7fiSpUShWLr/IomNgGtfRGRQE011+1lhkpVSG1vYDTXOaB0ZQn49tRcud6GnsW
	azYpOvm+cbW4L+umpqT+uU8IJv4YUPfUjrGfmmPgjpaR6bLvum62yQmCGH5NZwrw67037QTKtCw
	e+QwrlxsW0AhrMTMCC8rWhpavNk6nNuExFRuebnpJ6ZFSO1CDYwSEjLOV96ghpWKRYgkJ+kmM68
	zHYI8EE3EDUm62W5YUicLZteIDoJEOCUNjQNBH3UaZw2FYejLJGxB6x6BYh5LZ+vQl2XM8iR0Xc
	5pWTMvCrIvO1KDZPaCgoSdChxyw==
X-Received: by 2002:a05:6a00:39a0:b0:772:a5c:6eea with SMTP id d2e1a72fcca58-77bf936aed3mr7399516b3a.17.1758187681810;
        Thu, 18 Sep 2025 02:28:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLbURNKAK354nvvmQrQ7xrw5OdrE51GKcGvT0vEwNXT9BwkSQR+mZlitAF9htpDXo2P52P9Q==
X-Received: by 2002:a05:6a00:39a0:b0:772:a5c:6eea with SMTP id d2e1a72fcca58-77bf936aed3mr7399471b3a.17.1758187681194;
        Thu, 18 Sep 2025 02:28:01 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfbb79b81sm1819205b3a.10.2025.09.18.02.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:28:00 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: [PATCH v3 0/4] rpmh-regulators: Update rpmh-regulator driver and
 dt-bindings for Glymur
Date: Thu, 18 Sep 2025 14:57:00 +0530
Message-Id: <20250918-glymur-rpmh-regulator-driver-v3-0-184c09678be3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGTQy2gC/5XNwQ6DIAyA4VdZOA8DomTstPdYdgCsSiLiyiQzx
 ncfet5huzT5m+brSiKgg0iup5UgJBddGHOI84nYXo8dUNfkJiUra6a4pN2w+BkpTr6nCN086Fd
 A2qBLgPTCrKorYZtGAsnEhNC698HfH7l7F/P1cnxLfN/+CCdOGTVGGcZACS35LcRYPGc92OB9k
 QfZ/VT+Y5bZtLJWom2VqQx8Mbdt+wCosCG6IwEAAA==
X-Change-ID: 20250916-glymur-rpmh-regulator-driver-80c9543cdd6e
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758187677; l=2051;
 i=kamal.wadhwa@oss.qualcomm.com; s=20241018; h=from:subject:message-id;
 bh=l6H4V0fQEokHqrkMVzviMMbf53iH0VnNQQZCKS04FPw=;
 b=xbpUVtZC7cZLMFRi5jtkV49vKMoccBhfy1sonC0NksGzZ5U95xbLp2LSPhtRNFPCYdQz4CGll
 hYQ2f0UyCuYDHA/fp7XozC8EhPNSeci0e+X6UYtP6pWNzAClNEecQx7
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Authority-Analysis: v=2.4 cv=YfO95xRf c=1 sm=1 tr=0 ts=68cbd0a3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=BXGrXTCzJtV5nmjeyUEA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: -Uwv5Ns5_ZnQ2Q5rEo7aAuh8Ud0XPYFd
X-Proofpoint-ORIG-GUID: -Uwv5Ns5_ZnQ2Q5rEo7aAuh8Ud0XPYFd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDE4MiBTYWx0ZWRfX2njX/spx0rpF
 E6Mfsq9Zh3IsGrp47b81XdYQ6LGbif4FrAZw88x7v4GRT0qEimUA7ySXICWxeNNr1TlVATwMxVr
 7lFaytzVpYQR/1wg31ul5/lciEkjNkmoPnfTzulaTkB/u9II+4NMQl6ofJl1EHLVQ1RYr1QztZL
 VpNK92VkbaNx8vzSABt+iR6+6zv0x81VCiUIECX1Tsun+OLbzx1wAn9WyVX7bG2b1ACAWkqMWoz
 7fNmlWlpZHT31gruVyINftksPYrVXNxWw+2dDEY2q/fpH8/GHR9kHF9xXG5wzGohjTxj1rF1Rae
 YaqUJkWGdamhwUNobmf9JVVA1j+SZ83iHvtsByCH0ncgmyN2L0TG5xAurztY88JC9L/EqN/Gve1
 0e3P/fCR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509170182

This series contains patches to update rpmh-regulator driver and
dt-bindings for supporting the PMIC voltage regulators present on the
boards with Qualcomm's next gen compute SoC - Glymur.

Device tree changes aren't part of this series and will be posted
separately after the official announcement of the Glymur SoC.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
Changes in v3:
- Added more details in pmic-id dt binding's commit message to clearly
  explain about the limitation in existing CMD-DB names and why the
  new format has been added and how this changes the pmic-id
  interpretation in code
- Fixed the issue reported-by the `kernel test robot <lkp@intel.com>`
  in patch [3/4] code comments to close:
  https://lore.kernel.org/oe-kbuild-all/202509171822.oRjF64pS-lkp@intel.com/
- Link to v2: https://lore.kernel.org/r/20250916-glymur-rpmh-regulator-driver-v2-0-c6593ff9b4be@oss.qualcomm.com

Changes in v2:
- Updated pmic-id dt binding's change commit message to elaborate `why` the
  dt-binding change is needed
- Updated commit message for driver change related to new resource name patch
  to clarify that `resource name` refers to `cmd-db resource names`.
- Link to v1: https://lore.kernel.org/r/20250916-glymur-rpmh-regulator-driver-v1-0-bb9b00e93a61@oss.qualcomm.com

---
Kamal Wadhwa (4):
      dt-bindings: rpmh-regulator : Add compatibles for PMH01XX & PMCX0102
      dt-bindings: rpmh-regulator: Update pmic-id DT prop info for new CMD-DB
      regulator: rpmh-regulator: Add support for new resource name format
      regulator: rpmh-regulator: Add RPMH regulator support for Glymur

 .../bindings/regulator/qcom,rpmh-regulator.yaml    |   39 +-
 drivers/regulator/qcom-rpmh-regulator.c            | 1323 ++++++++++++--------
 2 files changed, 812 insertions(+), 550 deletions(-)
---
base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
change-id: 20250916-glymur-rpmh-regulator-driver-80c9543cdd6e

Best regards,
-- 
Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>


