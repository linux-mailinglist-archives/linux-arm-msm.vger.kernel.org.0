Return-Path: <linux-arm-msm+bounces-103034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Hz5Ix3K3WknjQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 07:01:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5FA3F592A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 07:01:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 28CD3301AAB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 05:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8C9A28D8DA;
	Tue, 14 Apr 2026 05:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L5L3neXs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A4gQIkbh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E7827FB1C
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 05:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776142868; cv=none; b=ThjcTSKtqL9TzsElD6tBy6nl3n5XEIAuRdNRUw8WXmt7dNJ5amuaC/fx5+hQ5nA7Iw3rwggwQqQ2y8+b7U7sQfw9++CIBmjYL/gjxmODqwqXmLOKSRhXmYQbzg4QwjPqM3vFn1upWBMkl3jlHbB7kSLobogAO1WEdV3RkPf1ovw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776142868; c=relaxed/simple;
	bh=edy2kMVwJlZrgW1tBAid4oqEWe4R7zlJ4fxPhhm9PSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V0Gak9T5ZuJVrDG+zOXt+uWlMl+ouoGHrSVthwrwjvN1oARX8W1yagrqVL0cthcqeguLF/UAJAcHxZ95fboc8NAWf8EvGJ3SlFaqpb4NOp+jHj9KYVa8YKWPHDtAg/b6FTuMheeDXtoZzyR3y6B0AJXFO3uutctMbKi4w349EfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L5L3neXs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A4gQIkbh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLD3tB969085
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 05:01:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VsDgmQ4paNxvBDrunB3lIADe+Nf7UCMYP+LaiT3KX5o=; b=L5L3neXsZs848hg/
	l6VdIGmUzEXMYr19S+e8iv7Xy3hoDBcEIABJvCB1916Q4cyYVGs3YKdypRtJiiY0
	BAMmxssGm4N6UoWYH/4ahQhg9nVkJodsWnwrc5n0X1JC5LYao6AQOUkVp6e1eJxO
	rlcbV7X2Wqm/SiLxW5hzDfJ+l4fhF75WDPdCC/3ORz6UAg8dIPJ/hm7+MBwFomuM
	KI+2v/RDMbFDetThWntSa0enKl4LkMs6+pGrMlxNHloiZJ9wGPi2cutaBsYvX2v/
	AdSgZ7fOQlmM3IIkJg6NGRSPjHD+sZpUfjFovc08+Clj/e3SZwRdJd+KR5IejFZt
	wCX3nw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86v11va-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 05:01:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b454cac322so19433705ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 22:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776142865; x=1776747665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VsDgmQ4paNxvBDrunB3lIADe+Nf7UCMYP+LaiT3KX5o=;
        b=A4gQIkbhI0hJ6SBYyOTpTHBeIY9Iek8v8lXqe4ysCv4smrAF3QeC6H220W8B1OaE0n
         Pk/0WQukTpqAHGSQIDkUP9TAWStRkqJsWSBtZJ4WaYav+i7WJOSZ1Ima4Vrf4lHjnZxk
         ensBVXs3iTopoU2dGvQPwFKreunchW+LNTp3CRwQ3GuCEclxpkQV3E+Hm2TGQP9iZoY5
         sfbDd6SIYFHd/aN+dzlEeO8VNBO+zFcrxPWbvkk86UeL2VNj5SmC+iwLco1UHxPJb69C
         hr/B6ZnirexXHhbS/Re3jplL7EN6nrOhoAsByfcL1aEOezLSBknF/zOyQc7YrVAb6Mlk
         vWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776142865; x=1776747665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VsDgmQ4paNxvBDrunB3lIADe+Nf7UCMYP+LaiT3KX5o=;
        b=T292rmv065eId+A6XpN/iYDhwuEuu5Tf62hs9I2GZhGuR2JFz81TB4OvzjPB3ZggbO
         t4MNJQSTxybsIoX4zC8lrTY6W3Jr859Gm+pkYW6lCfNRra0EITp8e+x9S2f/o7yRoN/k
         3fDymXT4J+9wER1cTr39LI3svyEopM234/ZDdZKW4LfHT6UYNrrO7hvFP2GXb53KKHg7
         KNSJ9LQ6Lf0pVjKWouh5On1fB24wlq4WIy5S0s1SVzW/93Vmi3Sqf9ZIxSV+svxTfea6
         ITZOxgNJimcbsc4UEh8WqzTKIcu8O8kXFb0JV1Owm36+aIEtwoXIAMxmG+UuhAeHS9du
         ppLg==
X-Forwarded-Encrypted: i=1; AFNElJ97a4ZAJ0BOnj29BlmIuZcQAHgElBarj3Dk+Gqh+qXVLxJBc29rIWDLj0nzjXd5uHMhKO0vXLfmU/hv9wng@vger.kernel.org
X-Gm-Message-State: AOJu0YxTKe0/DkvZZz9YQpBPE+Kxk9xzHCx8PZLNAVU/ScqeX26JPyDY
	l/Zez1rE6nKL4F3O6/1AkQGGUleJTqQRfXCZxzAMySPbnFzrqb/08I/hCo6IFeqiCh2Qv0SCiVG
	9UYZZmgbOgK4w7aOq2OusKqGHN8pTLqnF1HnbB5xzXC/0aQq29psNJQdJdUDve4qZAavR
X-Gm-Gg: AeBDieuR90Bpwahp2tgH7ARQsscUMknH6UkLZqfKL/NeqXQQWjmajpk5aSAHEdN1UOS
	ANW57eULehE1AAGo4z5r57gmH06FGhFNHVjnI87WeqWFS7Cf2GcnBbepjWinRNt+t9NLuFZHqTr
	J0Cyh59DttxDq3IVRH86X7K4ikJ819+KAbNb6itUhRB0U5cyaOX8J8FhJsFGuQhL3ZyE1URIPOt
	kHP6tiFtrbv39D8WcENSuP/iFLlcFQh7UoTbsaQ7BhyyxE3k1wIC06bosI35jFH/TiRbM6rOGo4
	/FRrBn/BrapGi/+z59r5axeiXzB4gbCdtkwtq3a0dLBzLhLn4iklsqq5yGg9EupYeSFkiNON6E7
	KtAM0HYzXrTXWo7flpkR1D5DaWlayTYDvElT+5YjjToOnjDUVAYpLzoQ=
X-Received: by 2002:a17:903:2c10:b0:2b2:e6e8:3c09 with SMTP id d9443c01a7336-2b2e6e83e45mr89105285ad.40.1776142860050;
        Mon, 13 Apr 2026 22:01:00 -0700 (PDT)
X-Received: by 2002:a17:903:2c10:b0:2b2:e6e8:3c09 with SMTP id d9443c01a7336-2b2e6e83e45mr89104685ad.40.1776142859413;
        Mon, 13 Apr 2026 22:00:59 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4db198asm134678425ad.3.2026.04.13.22.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 22:00:59 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:30:01 +0530
Subject: [PATCH 05/11] media: iris: Enable Secure PAS support with IOMMU
 managed by Linux
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-glymur-v1-5-7d3d1cf57b16@oss.qualcomm.com>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
In-Reply-To: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776142821; l=6543;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=AK/IikVbNscMxyS51GbRl4z1SBPDNtAAb/8F+AsSepE=;
 b=L2f4JzXOExhbuC0QmwJjObxFietbVV6/UlJnKknEqH/nhBNVsZBo6DSZ3kjuaQRH8kxVlLYQu
 /gJ7ARIx+pPACOhxXHylsS+h9GM3TQp7p5K+BNwKSqDJZAjdQvGWPkb
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA0NSBTYWx0ZWRfX/iRK5fsWP9qU
 07J3U9ipFmUaPX6ncYNc/AtN+dcb1FZwZ9giewRg2Gys2ZPmylgnEb+G2Q44YyX/kOAlzv/VaG5
 vHckbhFe4PeNOjXxeBpgHYBT0+JHfcE4MkY5/Xr9xsgrAr7Efq9Aks5sugIcJHWup821ZV8MMFl
 qn1Wf+GWMV9+41Kyx+gL6wg/NhlPVuSQWRst+Gvr/mu8cbyhaBv5RTUAwKXVtNEsdW0dZqsFGVn
 Pn/7/T2AoRN0t4nxDkaWtyOJzPtlF/IkyRpZYB1/iiADGzs9hO6sJC9WPeB3A3eRC4KYw0Dt7aU
 k7HzVZXExXLZrXLd7FdpZNYD4PV26Kw0IVfcTOr2BG+R5kdC+Vp77SjoZHY+2R0BXTVj2Y0CEC0
 L233W+lhgmLjUESTIVLY1aS9enK3kDzGJ9tS2AkygmAUxrvWOB5b6vwt/NuxwSezdTDeZtM+PMj
 0/8i0+5RqfztCypLiYw==
X-Proofpoint-ORIG-GUID: 9rjcmat-_xwPNwz_aKq-fbWWYJkQ1TGl
X-Authority-Analysis: v=2.4 cv=Iowutr/g c=1 sm=1 tr=0 ts=69ddca11 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=XipGDMX4SS2hnaP5fVAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 9rjcmat-_xwPNwz_aKq-fbWWYJkQ1TGl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140045
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103034-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2B5FA3F592A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
or QHEE), which typically handles IOMMU configuration. This includes
mapping memory regions and device memory resources for remote processors
by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
later removed during teardown. Additionally, SHM bridge setup is required
to enable memory protection for both remoteproc metadata and its memory
regions.

When the hypervisor is absent, the operating system must perform these
configurations instead.

Support for handling IOMMU and SHM setup in the absence of a hypervisor
is now in place. Extend the Iris driver to enable this functionality on
platforms where IOMMU is managed by Linux (i.e., non-Gunyah, non-QHEE).

Additionally, the Iris driver must map the firmware and its required
resources to the firmware SID, which is now specified via iommu-map in
the device tree.

Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h     |  4 ++
 drivers/media/platform/qcom/iris/iris_firmware.c | 71 +++++++++++++++++++++---
 2 files changed, 66 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index fb194c967ad4..aa7abef6f0e0 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -34,6 +34,8 @@ enum domain_type {
  * struct iris_core - holds core parameters valid for all instances
  *
  * @dev: reference to device structure
+ * @dev_fw: reference to the context bank device used for firmware load
+ * @ctx_fw: SCM PAS context for authenticated firmware load and shutdown
  * @reg_base: IO memory base address
  * @irq: iris irq
  * @v4l2_dev: a holder for v4l2 device structure
@@ -77,6 +79,8 @@ enum domain_type {
 
 struct iris_core {
 	struct device				*dev;
+	struct device				*dev_fw;
+	struct qcom_scm_pas_context		*ctx_fw;
 	void __iomem				*reg_base;
 	int					irq;
 	struct v4l2_device			v4l2_dev;
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 5f408024e967..93d77996c83f 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -5,6 +5,7 @@
 
 #include <linux/firmware.h>
 #include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/iommu.h>
 #include <linux/of_address.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/soc/qcom/mdt_loader.h>
@@ -13,12 +14,15 @@
 #include "iris_firmware.h"
 
 #define MAX_FIRMWARE_NAME_SIZE	128
+#define IRIS_FW_START_ADDR	0
 
 static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 {
+	struct device *dev = core->dev_fw ? core->dev_fw : core->dev;
 	u32 pas_id = core->iris_platform_data->pas_id;
 	const struct firmware *firmware = NULL;
-	struct device *dev = core->dev;
+	struct qcom_scm_pas_context *ctx_fw;
+	struct iommu_domain *domain;
 	struct resource res;
 	phys_addr_t mem_phys;
 	size_t res_size;
@@ -29,13 +33,17 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
 		return -EINVAL;
 
-	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
+	ret = of_reserved_mem_region_to_resource(core->dev->of_node, 0, &res);
 	if (ret)
 		return ret;
 
 	mem_phys = res.start;
 	res_size = resource_size(&res);
 
+	ctx_fw = devm_qcom_scm_pas_context_alloc(dev, pas_id, mem_phys, res_size);
+	if (IS_ERR(ctx_fw))
+		return PTR_ERR(ctx_fw);
+
 	ret = request_firmware(&firmware, fw_name, dev);
 	if (ret)
 		return ret;
@@ -52,9 +60,27 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 		goto err_release_fw;
 	}
 
-	ret = qcom_mdt_load(dev, firmware, fw_name,
-			    pas_id, mem_virt, mem_phys, res_size, NULL);
+	ctx_fw->use_tzmem = !!core->dev_fw;
+	ret = qcom_mdt_pas_load(ctx_fw, firmware, fw_name, mem_virt, NULL);
+	if (ret)
+		goto err_mem_unmap;
+
+	if (ctx_fw->use_tzmem) {
+		domain = iommu_get_domain_for_dev(core->dev_fw);
+		if (!domain) {
+			ret = -ENODEV;
+			goto err_mem_unmap;
+		}
+
+		ret = iommu_map(domain, IRIS_FW_START_ADDR, mem_phys, res_size,
+				IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV, GFP_KERNEL);
+		if (ret)
+			goto err_mem_unmap;
+	}
 
+	core->ctx_fw = ctx_fw;
+
+err_mem_unmap:
 	memunmap(mem_virt);
 err_release_fw:
 	release_firmware(firmware);
@@ -62,6 +88,19 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	return ret;
 }
 
+static void iris_fw_iommu_unmap(struct iris_core *core)
+{
+	bool use_tzmem = core->ctx_fw->use_tzmem;
+	struct iommu_domain *domain;
+
+	if (!use_tzmem)
+		return;
+
+	domain = iommu_get_domain_for_dev(core->dev_fw);
+	if (domain)
+		iommu_unmap(domain, IRIS_FW_START_ADDR, core->ctx_fw->mem_size);
+}
+
 int iris_fw_load(struct iris_core *core)
 {
 	const struct tz_cp_config *cp_config;
@@ -79,10 +118,10 @@ int iris_fw_load(struct iris_core *core)
 		return -ENOMEM;
 	}
 
-	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
+	ret = qcom_scm_pas_prepare_and_auth_reset(core->ctx_fw);
 	if (ret)  {
 		dev_err(core->dev, "auth and reset failed: %d\n", ret);
-		return ret;
+		goto err_unmap;
 	}
 
 	for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; i++) {
@@ -93,17 +132,31 @@ int iris_fw_load(struct iris_core *core)
 						     cp_config->cp_nonpixel_size);
 		if (ret) {
 			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
-			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
-			return ret;
+			goto err_pas_shutdown;
 		}
 	}
 
+	return 0;
+
+err_pas_shutdown:
+	qcom_scm_pas_shutdown(core->ctx_fw->pas_id);
+err_unmap:
+	iris_fw_iommu_unmap(core);
+
 	return ret;
 }
 
 int iris_fw_unload(struct iris_core *core)
 {
-	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
+	int ret;
+
+	ret = qcom_scm_pas_shutdown(core->ctx_fw->pas_id);
+	if (ret)
+		return ret;
+
+	iris_fw_iommu_unmap(core);
+
+	return ret;
 }
 
 int iris_set_hw_state(struct iris_core *core, bool resume)

-- 
2.34.1


