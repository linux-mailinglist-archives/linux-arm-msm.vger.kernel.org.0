Return-Path: <linux-arm-msm+bounces-74294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C985DB8CF43
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 21:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5706E7E1EC6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 19:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA4B23E356;
	Sat, 20 Sep 2025 19:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QxOt2bpX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4336F245031
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 19:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758397311; cv=none; b=H1pgHG4GUB9UZSIy2XMsQ0YoiGYC03v8wDvMW9JMK417pddTh12cKveeZnv7K7oTR97HopfH0xNhX2GUOE485yNI9Z2ZcfWMcEQmvBkCci2pbg5gBIdfZM8MB1MlhFbon2L2Vdwem43venjW/jBiEZZSAqwxNalqZNPTTkiDWaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758397311; c=relaxed/simple;
	bh=tSq2SNwEFNwiGMDSa+4QkuaPG2Nrg0N+mFdMy21QWv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VSchuKqhbbOfxri7Vdy08mHelIKNZSJECuE013md47LDvV8itj2e0vSze1T/g0xjXm/Rx2U8tkq65AkwUwOK3YEY1jfkCmXaFDlWuOfg4VM9ZNhPjNIP0ezTj6fbMESMkaZOu+8hMbwU34+Gjqf+qPM4UGNRsdIGj3Rd3utrhkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QxOt2bpX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58KIUDKc003389
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 19:41:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bj4fuwVE2Q5uRTzWgOejIvsFJ5SHNp/2bx2S5Pz7mM8=; b=QxOt2bpXQ6RHWWSJ
	3xSBE79DN23f8bGWpBeGyy/Pc53AeznxTxA6oJqKchJvMkvTnfuU3PB57MypVB8+
	OZQ8KsSYRRk9pFoRXWGY5KadxNIPR7OeYWCE9hp7COSY4cS1hchLzDALSdz8xf/c
	a1yYrBhTO0HMCtyevbuCIcWU8C0qqtmpviP4j+ELv43uogVIosUBkOK0WQShLf3m
	Il3E9uFBiKo/M/xELi8o2XmVw1KsdvSFLRG0CnWvY7ezEb5IF2okUkm6OPygG8ZK
	8Al4oTySSAn6leKCRocuMTCR0J02dN4e+qD0tQGU9/38o/mP+Vvbqiu21bkYC6LX
	TqAZxQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mg316b2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 19:41:49 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77df7f0d7a3so2185280b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 12:41:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758397308; x=1759002108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bj4fuwVE2Q5uRTzWgOejIvsFJ5SHNp/2bx2S5Pz7mM8=;
        b=qeUsGHkjjwwvEcr8zqpXlbTGr1QvtpSS5iHbhruObeJOUgM3ALZxk8JKVDNw5wOpK9
         dz1BClXQwv5humZP+iHe5w65f6GLfmfJXqUvmwX+crdwLKR0yi+hDpyy0p7LirVIIqCD
         2ekRqRhOPulf9Flw7gEGfF90NEX8yAk3E4VJYVJ/4yhnH6j3Sqjn1H0KYFsqBjqh/AQE
         v1CcxwYiV/0PI2szY79BXHbxTy5qQxGahfEkkVRquBHJRfnYrhudckXBw0/gh1ucoqyr
         1zVRRk6sA/7iq7xOT1tB+dyEtwREgT1LIBMFldeQUcwdOHJ6J5ZxuKxlfB+dD8QaIvTD
         sN3g==
X-Gm-Message-State: AOJu0YxubK5eO0PJYcbwj+Dpv1LDIeZ9vTkVux4lvorqN1MFpk0zxgeH
	+KGhLRBe5Q51Afwvmdj6zQywYgxFxtDCi5ZqHkon/1TFmtjc0KJlGIZoQfLdbRtxwIRv6hYKz+e
	uGcTllyGailD0aLzK+UA4HtHh0wD+2bAyOLLnqssE608kr+kvJr13831YPiVB2V+rNGw2
X-Gm-Gg: ASbGncsykjQmT7ERLsnkd/PymC4lDoTm5dDvXeyatqBTC5RgEPJilqZ2aUc1zY+dDEJ
	cHc+GEAzZgHSUiwEP8wWf6vK6kiK0NQ+CSPNg2O0ksg5RXC0bdbHGiUiMmsiOa34olJOYDpzeef
	9C7uNYAlyxNdAztLXIp0rnKHxbQD8JGr4YlyVcsQi9thWJ4hzOrpQ630nA0BwOFYICCpGoEIWNK
	n2snr2D5tsZQRMkI78Vf/Mw7ioxdR+/haN5OBbjpfOsUXS1fTu7T37J7rmoi5n8I5I9eoABzkL2
	mk5C071csKbBfY7QzeVch8wi2mcjYNkeMz5QnsKoCYR5AoBRH2SubZrjYxpqGfIOJe8=
X-Received: by 2002:a05:6a00:1889:b0:772:8694:1d71 with SMTP id d2e1a72fcca58-77e4a2f389cmr9026003b3a.0.1758397308206;
        Sat, 20 Sep 2025 12:41:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyHMvCfqQ7DljSEbSnDD9A3ZUWErb4ZcDZOGMOi6jmxDxthhfgBS5u6gNrbW8W2GNgCM7IUA==
X-Received: by 2002:a05:6a00:1889:b0:772:8694:1d71 with SMTP id d2e1a72fcca58-77e4a2f389cmr9025978b3a.0.1758397307749;
        Sat, 20 Sep 2025 12:41:47 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f2c8aa554sm143767b3a.34.2025.09.20.12.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 12:41:47 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Sun, 21 Sep 2025 01:10:59 +0530
Subject: [PATCH v3 01/12] dt-bindings: remoteproc: qcom,pas: Add iommus
 property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-kvm_rproc_pas-v3-1-458f09647920@oss.qualcomm.com>
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
In-Reply-To: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758397299; l=1056;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=tSq2SNwEFNwiGMDSa+4QkuaPG2Nrg0N+mFdMy21QWv4=;
 b=+1DbyQpiADAbwBPK3OEENAcWwRw71lHn1Wwyfh45P2QlbbrgzL+dSsY94TCicZQ/YUxE6sc+5
 WVu4Cy0nKYvDaRwaiGDf9NWBZQWEB7kCVM3k2/LBJG0K13N2ua57KYC
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMiBTYWx0ZWRfX8eJVCpK1hBKW
 WDsY/PSHkQeUr2qKG35LPh4UflddIX0CFR3y3793d0qDDAoDtXM+GbP6lIAlqACVucO4+pWvc/I
 JpqqJ2EnncmEyZeN1ZMDaCF/1kpleiVQ8hdYI2QejEWlow5ZsOd/JceDqUxBTE6UG0JWycAi8GS
 BQlQCPG0MeYzZCe1tN0Lzvf7DLYkigKwJ+nbyxLPdOUU3cvmfHixStleiwDhxL4tRXnx11BQtf8
 YgKDQbzWiJ5Rh7EbwjJcKiuoXOg8om9SyUlu3fvxXYJPSsytIx4xYQEPvAsorgco6qdTg9b818S
 lmnoaWFbQCTRCY263EidnLwhsZkFjPh1DbyS6g9N6InYboouEhqNSzNPewhk3E5YGJxBBAbmYnD
 uCduTON3
X-Proofpoint-GUID: nh-X3LJh1N2ESidUyuS47SreWuy8yrct
X-Authority-Analysis: v=2.4 cv=UvtjN/wB c=1 sm=1 tr=0 ts=68cf037d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=yGyP_gyn_XtU8QVV77EA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: nh-X3LJh1N2ESidUyuS47SreWuy8yrct
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_07,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200032

Most Qualcomm platforms feature Gunyah hypervisor which handles IOMMU
configuration for remote processor and when it is not present, the
operating system must perform these configurations instead and for that
firmware stream should be presented to the operating system. Hence, add
iommus property as optional property for PAS supported devices.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index 63a82e7a8bf8..8bd7d718be57 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -44,6 +44,9 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
+  iommus:
+    minItems: 1
+
   power-domains:
     minItems: 1
     maxItems: 3

-- 
2.50.1


