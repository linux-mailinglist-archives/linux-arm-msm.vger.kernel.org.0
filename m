Return-Path: <linux-arm-msm+bounces-79793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3FEC2330E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 04:39:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FD0C1A23534
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 03:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2BA527B348;
	Fri, 31 Oct 2025 03:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iF3Waumu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cOiXJEe+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC3A26F28D
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 03:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761881955; cv=none; b=Pp0Ei2MzXBfUuvRQkMaTDf7TSrSLztLwjMPGzCQfqUQQXYScIylIlNbC364R7LuC0gQ2cQz6uURfhFef5V0sNY/j2jS/WdMBgsRi0MhiVZHZFUfccvXcNhruJyJ2dcJsdDDD7oLlW8QYRJ9HExq300pwgvM4zRxIpDHo0g14tGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761881955; c=relaxed/simple;
	bh=b/c0TtRbUx8JtnHR4dV4m75OEsqkoKzuORRPKWB222M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FW2DxSWnaQ4VOdMvEoU8LuiupMV9+TM9CGWyKHXGaK7BCahcx17hUdY2HuYfBbxgrbN95fDtnUIlVYNWvUze/HIZlOX3Sc1x6xbpEdZZuAOkWPdqPGg6PPEQkNme3SYvr6gJd7g3KgFA6CZE1sKTNf0nWyQ477truCnBgmTiXEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iF3Waumu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cOiXJEe+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V1nc2Q1573206
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 03:39:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=i4IorI58Uj68IO5CjjCNPB
	BlGw6Gmk20pgNjO40wFiI=; b=iF3Waumu7YmzPqbhZFaigxE2atA0dgJS7+Ag5K
	cjdyrTZhJethbkNtaKLPtNQYBbzgV/wRgJuYKlhqNkinz6lRsq4cLsmqXkjEch0N
	x1O7JI7GwqA937Vakt5JrtvZ398AaE36bB+TVqO3sjrueSD7UveFXPrH0uBgjh0D
	M0EUTKHZg+02JQQCRasy4g8/aBWsI6lq0UORJmPzhrNHJ7xD8FxtwN7pcUDJwSHx
	qJwhJo4EQt61Z+wA+/1FPo6sAki9ZqHiBfss+qG81HaW95+jP3C0KRu/b9oWHuul
	vaS2by/UJKtTBPFjbGbi5rRlUrK6CEYnIu/Cg/dVYua67NEg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ksc08by-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 03:39:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3406aa44a1dso2212161a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 20:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761881952; x=1762486752; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i4IorI58Uj68IO5CjjCNPBBlGw6Gmk20pgNjO40wFiI=;
        b=cOiXJEe+aO/A2h+2o1+JeIVaXajXDlx+Bq/pzhnoXtHX9FHr8OQCF5Bp3q6V6Z2FOA
         awlBjKhBnI0qszdxvq5+T9qGcvXQw+9fUeuB6mqVRRm2aHZEn+aULbvCOTv242jx565L
         8hbqkCoGG99xUK+tLC0vscrdDCiUa7HSUs0o7Iep5s9tlMK9T7e95c3JYjwjUY7ilnr2
         Kq+wmXNe5DTGOdrdXhdwgjkuzQ7AtqB5gYbJOCOL9DXkCvP1I9Kvj3ZmHQlxSS0mH99M
         9aiuo0VhBTOn/MhijyHICscy7JoR8C/rYxCclgOeTVlaoi3I5ZhQmxfDHPO3O6bkbG3G
         uQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761881952; x=1762486752;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i4IorI58Uj68IO5CjjCNPBBlGw6Gmk20pgNjO40wFiI=;
        b=FfFK+Hd+RlCZ0030QWXglHNjJ1fI2h/k9aib8UHmv3zPil14cetoB7W7sbPyhZtGxf
         CTODsvlo/2+Y5Yf20SwvZYbFliJTuDYB/Hmel1lgBWi0vsY20Z9BJFHEmmJ7cdffVnB6
         7jXz2tZ4ug/mh2qjJqk+AnOwYUr/6MIX9/bbyxqD+QGlKJDwHI149tZrAFA8BaT2ayKf
         4cqHXZVkSh791HpHQTxVih827E3kuqpkRvoIkIUJ/J3nmjHCqsXJuBnSeMwKmSJM4uVm
         D2OxjD1r8yGzl9o5H0JPJdpNQaD/9NkLeDG1xmWAEo9EM6jBHfrZDL3gGrw73UxTAfqW
         Iquw==
X-Gm-Message-State: AOJu0YwCVGCR7lnKLPdi9+bd39gvgdZzVLc21HKog1YLLSCypO85eUsn
	ytvd8fhvm01k3iuAHxriFEbGOlUWKncVLHx58UpRHzHHKnoFQAedFTDYVTQWZOSfJsEaKxrantW
	PEGDIMCpZZ6SCEUhR1vQmTALO43LG0tQSo/vyRiBlQNL0hjRiD6wzFWTpg1AzX9M5Qvcl
X-Gm-Gg: ASbGncuNRoMFdBj8bTFc/fqI0PP6TH/JdRpFihqDUceHjNeGrZLqZQ8sHKTwtq+ft6n
	XwLWHIKiUONXzzoTtIbiY2MJqzrmdeyAbJeJi6b1MP4YpzJyXx1cwRuvXjXRQIoR3PdPxY6erep
	O4fgPY7Jd4L5kCBly8m7stTHDDJLkbJVa1R37xAqiB94P7Drxj+Fd3VC8u2+QaSxfFnzLXbJif6
	yzrEoY/WYvPEmD6p2FhuAC9GhZ6o8FZffoqg6R/Yn+wdIRU+yH6XFXdHH9igYEyaBfeI7zX2vNW
	Nd11WkD3mp6U7VcN4NJF/OPUC/R36UszNdPWVdaI2A2vhrCeArAnom8I5L77pLPB0pPanFLO8Pi
	4ty4nhsPglaJXUXUINRc2qA==
X-Received: by 2002:a17:90b:1f82:b0:32e:a5ae:d00 with SMTP id 98e67ed59e1d1-34082fc7b43mr2536973a91.13.1761881951757;
        Thu, 30 Oct 2025 20:39:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjnJe4PvNt1debsSjTxLEoIU/F68bM+PqIGJDGv+FMr2j17u2RS7apMk5Va8eik46A4OJF4Q==
X-Received: by 2002:a17:90b:1f82:b0:32e:a5ae:d00 with SMTP id 98e67ed59e1d1-34082fc7b43mr2536934a91.13.1761881951267;
        Thu, 30 Oct 2025 20:39:11 -0700 (PDT)
Received: from [169.254.0.7] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3407f0845d1sm646419a91.4.2025.10.30.20.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 20:39:10 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Add interconnect support for Kaanapali SoC
Date: Fri, 31 Oct 2025 03:38:46 +0000
Message-Id: <20251031-knp-interconnect-v4-0-568bba2cb3e5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEYvBGkC/2WOSw6DIBCGr2JYFwOIEbvqPRoXSMdKWkEZNG2Md
 y+aJl10M8k3+V8rQQgWkJyzlQRYLFrvEshTRkyv3R2ovSUmgomS1byiDzdS6yIE450DE6lURpi
 at11XKpJsY4DOvo7Ia5O41Qi0DdqZfg8aNCbzVxhgmlNl/Kl7i9GH97FnKfbvUc1Zwf6rl4Iyq
 pmSWgolKl5ePGI+zfpp/DDk6ZBm27YPmPMqGeUAAAA=
X-Change-ID: 20250917-knp-interconnect-48c2c91bff58
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAzMCBTYWx0ZWRfXynU/xPIlPD2O
 bXvI8NEa2oNWlxJJAs3jYyeHj/ebmhq+z0AptZ3RQ4guzUJ2TzG5So7w9o/GMUEf2TgcULJFE5g
 ECKMopjyen4MlQ879jmpk7/jepkOaGnmicZjFUf1xm1WWJ3yv+5Om1niGVBpwMwVyAoRMumnTi1
 v6Cj1IEgYWEBx7qJX/8G2etEOqZobAfuWH+oC5d4uK8DQxiBc8bAIAGnKJJiK7ESWhAUEi4XBvx
 kf7XfNMx+7pCIDVNMxGVSpyyB1r36gLY5wA/ZlIEIuPbvcl1KKtNNCjs049hPZkCh4jAl5PnpB8
 PT+h9LNNbSfi8dt1Z8i2MnHUxt8wHuaB9HhhqiNiFjMYvZRsjLtfDzHpngfQyggt/iDgZ0Du+0t
 I/Jb7vL1lFedzpwnE+lXukx1gfEzvw==
X-Authority-Analysis: v=2.4 cv=Q8PfIo2a c=1 sm=1 tr=0 ts=69042f60 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=06_svp_evkBEmB2vVC0A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: xZ_D79Nj7Q0jOtcDf3TtabjnSc_lwP9x
X-Proofpoint-GUID: xZ_D79Nj7Q0jOtcDf3TtabjnSc_lwP9x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310030

Add interconnect dt-bindings and driver support for Qualcomm Kaanapali SoC.

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


