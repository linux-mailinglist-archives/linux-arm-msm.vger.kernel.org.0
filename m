Return-Path: <linux-arm-msm+bounces-49810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8328A490FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 06:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E9EC3B7F50
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 05:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A77A1BEF63;
	Fri, 28 Feb 2025 05:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aN/lrN+9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D911BEF9D
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 05:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740721109; cv=none; b=Y0XoswDuxp6rIgelZj7Og4p08Kz/Q5lr3UopVajdJSzf1tpz4Ziiz0kC2f3aXvvdOkMun0uwsjTC8MA1BoWcxIJZC7MbOXHKyG895TjjPg+BJ95q7aVW+5zPWm+gLBAK6vpf1VfnPBX/BjfLzOrOOxQo9wTJ7imaP/hc5BL75pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740721109; c=relaxed/simple;
	bh=hw1IKnio0hEFUBpGb98LZHc628nITmF0Wle08C5jWo0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iaJvx0AojS2ntM3KuaBq93C/Ek9tRPg79xcZorle5BfS8BzMCS33glECE0y6RoofnZAWlsJUd4i/f8fHIvcJm4a/DWK2OK0R4h393Wf/A9Uc+1VjZ3zjtG0BQrNdDWnL2lKf7zLD6+lMRPjGW4b8IQRvyzsSPPX/4UZEcZTx9WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aN/lrN+9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RLmVkK003314
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 05:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CH4rVnfK21YMgQrbM2NxvF
	nBMLD7yj2zij8upDfFnKw=; b=aN/lrN+9hJDwntiFu2B2y+LHSPIDy3IbhPV/yD
	1wBfZFZpCnsXALWENaHd3QHMeChkukPfeheKoR6thQns0Na7ZGZYCvjiA4UshwWu
	F16hLvaR6Z2FyQXvprA6xvTZ2FXNxlUuOJGl11iYxCQbTZ4V8pmpcPpZmMDKiMgg
	QZ6JaVJF8xw9+TDy0rXlM5tbT29Ih4aGZVvdyaidgLOiFqyhRhT6SvuJgSCBuJMd
	B7uXd5Lcc6dlEU2nWdy8hw5XkaZ1F5A+suE1KJDY2tKfUT1JhwaHe3O8j1ip+c1e
	WSL7YdPXsAZoI9mLO0R08BV4hWqJ5dOZMx9Y+X8jpOfP7jhQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 452pm7js4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 05:38:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-220ff7d7b67so33293505ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 21:38:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740721106; x=1741325906;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CH4rVnfK21YMgQrbM2NxvFnBMLD7yj2zij8upDfFnKw=;
        b=CV/nvUF7teAOQz325Y95sdzGa5oay/mPtj9YsTQRZU+mKYL85wcsDzokfJMV9Oy85G
         fKk+lehDDNF9AcmqKphG0dOjQyOX9QlKEgkMVmahxPPAbkEdUBRi9vGl2FrlhRBLrZ5U
         w3V6u5+I01el4eN/CFZ1rNpHCRIXcEHFwPt3Hsx488CoRLDLGHW3m/MPQNUJgFUSOLVN
         RclCtv4krhE0K8WiAP2ZUH8T+5qLxanOLleXPeqJm9QVT4Jh0ihY71KasKrojnF0jpT2
         zWVm/9s1NU5/mvSC7I7n2DaXIXEP24EwwtLMG5kQ8Q5f8NUmyqs+vq7QwV8JjezUaZNY
         UQoA==
X-Gm-Message-State: AOJu0YxQPJD8smbX1SJQIJr1jG6glzee6uKV2g8H7IfbHuHarNFayl/V
	qzlp1V13boekdnsOvht/3nUf3FfJ6W61FYGFkXVN2JulT5vjgMyNr8QS06VcRZMMTIjnXv+AU4D
	nOyi1aRf8Q2KMmSENKAVt3ZRKswYng/AKEU0S6jJGNQ/97tSjAUrVYVPkNcjlqvyq
X-Gm-Gg: ASbGncvxS+l37wRSE7IvnbcL8x+8w+868K0FGi5XaQIVmBoEh5UsmXXv2Qod1+4L5ms
	OPzVyY0OmAaDaiwZFM2DaPVJAFZafAtFjm/gVwFwAH/bhGVX/aza8CLLYWjv1gt1eMsqlE5auTq
	URNec/70vOpCoyCtQILs2ikt50GZ2GrAP4rRIV6RZpDYTZW76LziUOmT52UQZF7qwQD/3jkes2B
	wBMpF1cn9R/qii0ij3JN3RuASZhJwKi9pSBvLduOnU9SvxzI+TmX7vpVRyET7IbKNLnF5In0cF/
	DvNNQBUBnUhMyQ9CVVjxrfD6IYl0ofnlKmdoEuIXGRPrDACSiP4eZaAGBRqNeig314lsxM353wj
	inBOnlYw=
X-Received: by 2002:a17:902:ce06:b0:223:501c:7576 with SMTP id d9443c01a7336-22368f85359mr35092205ad.12.1740721105835;
        Thu, 27 Feb 2025 21:38:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9kWwpW0HteN6ONpvYLlIKS/cwxCBm5mIKmi36A6eB7TNk8E8ciGYQXf0L7gtttf53+nHBWg==
X-Received: by 2002:a17:902:ce06:b0:223:501c:7576 with SMTP id d9443c01a7336-22368f85359mr35091825ad.12.1740721105430;
        Thu, 27 Feb 2025 21:38:25 -0800 (PST)
Received: from hu-uchalich-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504dc86esm25058925ad.172.2025.02.27.21.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 21:38:24 -0800 (PST)
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Subject: [PATCH v5 0/2] SCM: Support latest version of waitq-aware firmware
Date: Thu, 27 Feb 2025 21:38:15 -0800
Message-Id: <20250227-multi_waitq_scm-v5-0-16984ea97edf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMdLwWcC/x3NQQ6CMBCF4auQWdumFmqNK+9hDIFxgEkolbagC
 eHuVpbf4v1vg0iBKcKt2CDQypH9lGFOBeDQTD0JfmWDVtoora1wy5i4/jSc5jqiE6btlKmuqrX
 tGfLqHajj71F8PLO74J1IQ6Dm6KBfKcizLZWt9KW0suck54WxXvLfyDjc/+IJJXoH+/4DlMkS1
 qIAAAA=
X-Change-ID: 20250227-multi_waitq_scm-5bf05480b7b1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740721104; l=3073;
 i=unnathi.chalicheemala@oss.qualcomm.com; s=20240514;
 h=from:subject:message-id; bh=hw1IKnio0hEFUBpGb98LZHc628nITmF0Wle08C5jWo0=;
 b=3sVqtO1XemxxVymBlGztmpc85ldQcCl4ylp5/HKVotcMEUNCYnF0LGr3VkOjAAGdl9xJ8UG8A
 xG4TYL5kI0uAvDEzgIlUHcIfir8d6evMHCsgU1hgLIZd8n5skWRpoGh
X-Developer-Key: i=unnathi.chalicheemala@oss.qualcomm.com; a=ed25519;
 pk=o+hVng49r5k2Gc/f9xiwzvR3y1q4kwLOASwo+cFowXI=
X-Proofpoint-ORIG-GUID: PdJceINyN3TOSrT4_ek9PZKyBX5Y8o-o
X-Proofpoint-GUID: PdJceINyN3TOSrT4_ek9PZKyBX5Y8o-o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_08,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1011 lowpriorityscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280038

This series adds support for the latest improvements made in SCM
firmware that allow for multiple wait-queues in firmware.

To support multi VM synchronization when VMs make SMC calls on same CPU,
waitqueue mechanism is added in firmware which runs at EL2 & EL3 exception
levels.

P.S. While at Qualcomm, Guru Das Srinagesh authored the initial version of
these patches.
Thanks Guru!

---
Changes in v5:
- Use GIC_SPI and GIC_ESPI macros from dt-bindings instead of redefining
- Modified qcom_scm_query_waitq_count to take struct qcom_scm as
argument; scm is anyway stored to global struct __scm after
smp_store_and_release(). 
- Tested on SM8650 which has multi-waitq support and SM8550, which
doesn't. No error logs are seen.
-Link to v4: https://lore.kernel.org/all/cover.1730742637.git.quic_uchalich@quicinc.com/

Changes in v4:
- Moving back to redefining GIC_IRQ_TYPE_SPI and GIC_IRQ_TYPE_ESPI macros
in qcom_scm as seeing compilation issues in linux/irq.h when including
arm-gic header. Will send a fixes patch and move to dt-bindings in next patchset.
- Fixed a few compilation errors.
- Link to v3: https://lore.kernel.org/all/cover.1730735881.git.quic_uchalich@quicinc.com/

Changes in v3:
- Use GIC_SPI and GIC_ESPI macros from dt-bindings instead of redefining
- Prettified qcom_scm_fill_irq_fwspec_params()
- Moved waitq initialization before smp_store_release()
- There is no Gunyah hypercall API that can be used to fetch IRQ information hence
introducing new SCM call.
- Link to v2: https://lore.kernel.org/all/cover.1724968351.git.quic_uchalich@quicinc.com/

Changes in v2:
- Dropped "Initialize waitq before setting global __scm" as it was merged here:
https://lore.kernel.org/r/1711034642-22860-4-git-send-email-quic_mojha@quicinc.com
- Decoupled "Remove QCOM_SMC_WAITQ_FLAG_WAKE_ALL" from series
- Converted xarray to a statically sized array
- Initialize waitq array in probe function
- Remove reinit of waitq completion struct in scm_get_completion()
- Introduced new APIs to get no. of waitqueue contexts and waitqueue IRQ no.
directly from firmware.
- Link to v1: https://lore.kernel.org/all/20240228-multi_waitq-v1-0-ccb096419af0@quicinc.com/

Unnathi Chalicheemala (2):
  firmware: qcom_scm: Add API to get waitqueue IRQ info
  firmware: qcom_scm: Support multiple waitq contexts

 drivers/firmware/qcom/qcom_scm.c | 122 ++++++++++++++++++++++++++-----
 drivers/firmware/qcom/qcom_scm.h |   1 +
 2 files changed, 104 insertions(+), 19 deletions(-)

--
2.34.1

---
Unnathi Chalicheemala (2):
      firmware: qcom_scm: Add API to get waitqueue IRQ info
      firmware: qcom_scm: Support multiple waitq contexts

 drivers/firmware/qcom/qcom_scm.c | 127 +++++++++++++++++++++++++++++++++------
 drivers/firmware/qcom/qcom_scm.h |   1 +
 2 files changed, 109 insertions(+), 19 deletions(-)
---
base-commit: 1e15510b71c99c6e49134d756df91069f7d18141
change-id: 20250227-multi_waitq_scm-5bf05480b7b1

Best regards,
-- 
Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>


