Return-Path: <linux-arm-msm+bounces-80068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD74C2AA40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 09:53:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7653D1891D89
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 08:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C5C2E6CA1;
	Mon,  3 Nov 2025 08:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G07ZWxKE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HBSWID1D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3A953363
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 08:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762159922; cv=none; b=rE+chgN4iDxEp6s/XX3RXzOGNVyKrD/bbfAFhYrv3JIGai8T5wXp3uJuundzCR1fm/USe0Gu5oFjx+2qpJA9KVSPqsDb7tFEDfq5r5gkqz/YTaye7Ys8FjivitjCGDrBBobu0kzwybffEfJ9mGWz1F9hb1fPVmO/jm5PVnt0t1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762159922; c=relaxed/simple;
	bh=HZekR+X1QQ8T+n7KBLJNAnNWovL2r7FAK8kQNXZzh34=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uiQsNNvRgdv1I/ifRdEWzANA+JZy+1J6gfPZQeqp4iGpfUEmdV+haigJ7jlB7oUnZcqa3TxpNPkUIdylEh+jTyUzQ1xvYPuguLtVLHIrgHTBnuH2rpC5bOYD6OSGsSGq0D20VubrzMqAMAI+8Ci0MsGDreLi0ZCYbzYQ3kLNDDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G07ZWxKE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBSWID1D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A38hJcn1224589
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 08:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=c0vqi6jj/b8CbGVumVnkzg
	xG3KjKbgL/ynWKTJBgytI=; b=G07ZWxKEJdR6yvZAoy96zzRTt1U2QH7asRKYYw
	lfl/7uruRMFLgT6INo0nTZhp5ZDJLqyE9SHtC9IOMZbhlNCH392Vjanp0Rhj0oYy
	BYtaGQoeVky2ToDZ8TNrHugUi6RIzo9JMzvBk7FhfKn57sT0v/OzmSP1hnB6b3W8
	2ba/TgZwLnk8thbKer7gtc1lW1AKPxRNpKojDi+3XmA5Myx8vGlVZDfCKh+Comdm
	mRzfb3eW0t2w+/MwMJv9W3Y2TbUhtByt2KBGMQLCgPpQsM74jf8ufDOEnMdEJcgP
	tmANYXG6wGiAZ6uO9XmMxhtlXiwHraG0Et7l4DyS1GdlIsVg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6f0w99u9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 08:51:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2956a694b47so16171625ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 00:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762159917; x=1762764717; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c0vqi6jj/b8CbGVumVnkzgxG3KjKbgL/ynWKTJBgytI=;
        b=HBSWID1D8Wxq081UP/8ANSXHVTM7xRYjaattsjjsAyFEYIdMeHH6VA6PH9DPJBjqFc
         oHKeY7c8EiGYiRzLHsOPkWK3enIS6bo3bTi46Fg6aCEMwlPdcdH6z8nmnf/Ye5JYpuCf
         tF+4AiDrwQI8TkW5U2CqmCAl/TxG0hl3y0/3IzlCCBtYECOZvesmLSeyxbSTa993EsY+
         h3aPezkxo4c8MmxM1B330AaQQr6Sc8ZwyHg4+45vARrVNQi7mRisHdD5gFA6mJQjUjD9
         R1eo81XMkAycYJJTEFFnR/LEKO9PWwJQmh5mVrmiIMd7fP4zwtNkrjxW0Ui9MrsYwdEy
         bLvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762159917; x=1762764717;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c0vqi6jj/b8CbGVumVnkzgxG3KjKbgL/ynWKTJBgytI=;
        b=aqIJ5gatqPpWAe5Nucrdq7TqjiwW6ejgoMw/3PQQ845oekMVREGk99stvAc7LJHY1k
         PGOpZhhvM7BL3wimbItHQvCz8QO4LrqUoNIuK9POh6Ro0BBBwY8VLw17vfzl2AEr7h6c
         KN4/ULd7zR9hCFc5rmPyWThqkEWOca6knEIDsDsY0UWkhKwue3M6ydYwyjBXI46xdHG8
         yLv6J0M9pQbVOfaSxLwmSMyoqyznHoLXI0cQXH1+9YYNVTCh6NN0Sg5PRoUZgIiXiEPN
         X5eYXIn7eAv/msnzkO2JFfdrp9aekzOM+WSCTmmSQ8iefYTCp8+pI4+A4FtrOc7xSij8
         hM3A==
X-Gm-Message-State: AOJu0YxlrQSrlpUTqVr0Rh+d9Jtk8JvOwE/IiJR9f6ggQ6Hv6uuZejGl
	6PIYtljPAce9jELVZMOV4JmpIHCiyB/D8QmmxYe9X3h+Cvcj/Dnk9tI4cb0XwPlEVRtLgFOELyw
	+zKZoIKXWhPiV80ikXUFfRzmvq4mP9lks26akF4LPUwrFtVLuv+ecZRJNQWLir8muLDt9
X-Gm-Gg: ASbGnctVqxwyAmZ5Bdx/pVZAIePhFCGXL5FsN6VyKIpmI2LEQQaVO3xNqxZJ6V9k0g5
	7KNrTJZ7JA3avKyLv9nY2PEnbN6iZ19/+UMwgz57SoQcm/3w5i7jzMG6nRUQirnG5JEmkBLl5D+
	O5fXJQR4/1oan1HlaLE7ZL0riIr7bJPIpOXbKVil8mh1D4m/0rG8cydTpbsG9aGMf0BUxxDsmO8
	j3lpFZVIjajlJEHu5/7Z0Mc8mn0pm7QqXGD6COug0vep8H2wDC8yCti8tygWa84Djv1NfkaIrAF
	D+v3LLAytaTrvl62ZzBcZ6slqe/Es2gDX3Gy2HGiIW31c3+FVMhxUJfuQjH0puF9bSe/dFpqFYi
	XuzG2KBNpMAyN0PMb9Pij4g==
X-Received: by 2002:a17:903:24f:b0:295:24ab:fb06 with SMTP id d9443c01a7336-29524abfc57mr117895425ad.22.1762159917464;
        Mon, 03 Nov 2025 00:51:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdFWZ5eL263AhpbzBjcsP/SoG/gFdyoVlX/8S0qnFen85cVcRcaeE00KTs+4TsynF2ykEGmg==
X-Received: by 2002:a17:903:24f:b0:295:24ab:fb06 with SMTP id d9443c01a7336-29524abfc57mr117895035ad.22.1762159916789;
        Mon, 03 Nov 2025 00:51:56 -0800 (PST)
Received: from [169.254.0.7] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341599676d6sm255142a91.9.2025.11.03.00.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 00:51:55 -0800 (PST)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Subject: [PATCH v5 0/2] Add interconnect support for Kaanapali SoC
Date: Mon, 03 Nov 2025 08:51:17 +0000
Message-Id: <20251103-knp-interconnect-v5-0-f9929faddb66@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAVtCGkC/22O0Q6CIBiFX8VxHQ4QkrrqPVoXQL/JSlBQV3O+e
 +jaasubfzv/zvnOmVCEYCGiYzahAKON1rskxC5DplbuBthek0aMMEEOtMR312LregjGOwemx1w
 aZg5UV5WQKMXaAJV9rsjzJWmtImAdlDP1AmpUTOGPMUA3pMr+665t7H14rXvGYvmu1ZQU5L96L
 DDBikiuOJOspOLkY8y7QT2Mb5o8HbQwR/7LoRscnjhiL7VWzOgCtjjzPL8BQZPlni0BAAA=
X-Change-ID: 20250917-knp-interconnect-48c2c91bff58
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA4MSBTYWx0ZWRfXxq59vv1urTXF
 dl239HGnkDgQHJzv7kW1vKoknIGQQjNCFh/vGq4I+8ghuwUeigGCgyQoEbziLcomLkz+7XSfd/t
 oNdbgEV5260CqFeZmZITiO2ytAsw2CYOdD5ugma08JL5OfT2bOI3iJvWdJ31O2OhCJKdrUsMe9z
 BQfOHw3l8Ww24gx23YMZbhvfLFEikl6xh3Q1uGt9BOij90IXZ3eCfrf1+ACCqWWDCbxc3wjPntZ
 QdzWA8z481weX/uQnU2x05eqICWd1DInuSzN5RIxy2OQL+1/XPn1OasbR1zQb07ChwI3m27uAcu
 qFVf3uyE62RrZohbXXTI9PXNSBD1dAN/8MvSMEzmo1sml18pWNtOmMZZb4pigVqIjHU3KE94GEI
 7TFFU7qx3zl/FWVvsWdQi0iu/7Qi5w==
X-Authority-Analysis: v=2.4 cv=LcAxKzfi c=1 sm=1 tr=0 ts=69086d2e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=NeJqaqV_MRuGqkmvWOwA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: qmKRenMZRX3brfxUAdt1mUKTPtb4B5pw
X-Proofpoint-GUID: qmKRenMZRX3brfxUAdt1mUKTPtb4B5pw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030081

Add interconnect dt-bindings and driver support for Qualcomm Kaanapali SoC.

Changes since V4:
  - Updated the SoC name in bindings [Krzysztof]
  - Link to v4: https://lore.kernel.org/r/20251031-knp-interconnect-v4-0-568bba2cb3e5@oss.qualcomm.com

Change since V3:
  - Removed unused header dependencies from bindings [Bjorn]
  - Link to v3: https://lore.kernel.org/r/20251030-knp-interconnect-v3-0-a084a4282715@oss.qualcomm.com

Changes since V2:
  - Removed the dependency on clock header in "qcom,kaanapali-rpmh.yaml"
    bindings file [Krzysztof]
  - Corrected the patch revision number.

Changes since V1:
  - Added b4 dependency on the clock patch [Rob]
  - Updated the Module Description to "Qualcomm Kaanapali NoC driver"
    [Dmitry]

---
Raviteja Laggyshetty (2):
      dt-bindings: interconnect: document the RPMh Network-On-Chip interconnect in Kaanapali SoC
      interconnect: qcom: add Kaanapali interconnect provider driver

 .../bindings/interconnect/qcom,kaanapali-rpmh.yaml |  124 ++
 drivers/interconnect/qcom/Kconfig                  |    9 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/kaanapali.c              | 1868 ++++++++++++++++++++
 .../dt-bindings/interconnect/qcom,kaanapali-rpmh.h |  149 ++
 5 files changed, 2152 insertions(+)
---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250917-knp-interconnect-48c2c91bff58

Best regards,
-- 
Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>


