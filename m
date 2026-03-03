Return-Path: <linux-arm-msm+bounces-95078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNV2GHispmn9SgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 10:40:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9D91EBFF1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 10:40:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 886B7303389C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 09:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED64538C43A;
	Tue,  3 Mar 2026 09:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JgFqto/l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZQ0gEvGZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89BF38C409
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 09:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772530539; cv=none; b=hTRlbmFJA3BCzoxPo0nZM4zrBLiwYBkSacsj5BvisrzatzsDr2OjTZc8GaGJ6h8Cc+icA09Zc83EV/359TlWXCbZ1meQTe1gqJB1fLR+IG2E7Q+TyxGn1ql2IC1ODpHtxlLPViylOnPBioEx4nAAVjCa1Pa8esv3l+90pHbKE1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772530539; c=relaxed/simple;
	bh=wEPfc0ygU2GYfoP1v6X5uIwJoeoMWGQ0SrsE83Yt0po=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QCGPpHCDIvjKIHS66GyW+UOO9/WD65wyU/51cVw0kC0X6+t/unoTP/Shh5FGUPhh+UJ7ioSC90+001BjGaKFpYdAPB98oarbXnq6zGDTQI3A8ydgdjJmk5zeLj9l+uTVEKyhLFyposbcVLeNAZb4jIgpzMxm1K1kVhujfeAjR5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JgFqto/l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZQ0gEvGZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6238DhBX670310
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 09:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pw9OXHUwWpHlSsYUeP25ZF
	lkTojQSwDyCD+RcTmM+/E=; b=JgFqto/l1ccQj7jTlUjrjnVlqkxN19BmnOoevc
	lGfU8DSaz6wpxYWkoJs0mOOa/fbc1nUeVPK+TgLg78bCri4e8UgevmupSNVsBXTV
	e30oY02GySLVieMbaoJyGt7+DgDAeHFH9BFWC4w39WOI+URtLwOv7SD/x1Vf2BOJ
	oSF4bjuJcrmbfoD02cRZZI9eqsGRXwwDqjsvhkqYTP+2gZZmYI7U+U5wekrBU2T2
	JWv/BcP1URgLO8LARnLm6P/QXGn7kjwWnMChGDdTuqR6oHEC80os9bhZp7C/j0ZD
	5aF90rrSvhnjAULRbOly1ijBvfiMbdv+H+G65MZke9gCbVJQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnngg9n51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 09:35:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6e1e748213so3016646a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 01:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772530537; x=1773135337; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pw9OXHUwWpHlSsYUeP25ZFlkTojQSwDyCD+RcTmM+/E=;
        b=ZQ0gEvGZ4OOJ7AhYcQCnkv/bARXUTEIkTBLT+j/fM+0w0othXdmObSBHfELzbp63r5
         q114LQJvuNY8TR3b25LURZjx200DM02EuhOem/MkKiumF36+ZkxyUhV7Luu8rO08HbqS
         UnjgBrdVgS1ZuZts7eGM8xGW50lKJUrzV6qmruH3z3dVBjW0bc3urmJODl3s3rFR3m9y
         BvV6nOh5CD1esB7LGQMe2vmsmW8wUuDQvMwirndqXY0F/nevvPO+aMVx/fZv/4ZG2NMA
         5VOtAExWMIm9dfOElSwV3IBPxQWLGHB7oEjCT2aPkHdoxEpEJoZr2HfB0ucNVYhX2Ocp
         hSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772530537; x=1773135337;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pw9OXHUwWpHlSsYUeP25ZFlkTojQSwDyCD+RcTmM+/E=;
        b=ZWVQo5PAjtIyW1cqO6rk9FRfoQf+nsR+psvJGg9rdXTNGSkuvXa1q495xrMu0udlI8
         c/DfxhTAlfsBIpbsZdxk5W2TnwkXAAWdjUJJJD6Q6/LHQbTS9GJfZXqGu3rAbJDEYgxF
         B/LIyqQ50PT9z8JrDWr8TCHBdVUO1Yd/Uh14+VgpxsIXlVx6vHDKPtnklAq5HGxr+Nxo
         eXv43ZzzYnx6XffS3ShSDqyTz5Qb1FCfWaZmbsOf7kiQOYn6K/fxFhSY/U9taZxDP4gl
         5Oy76ZN8t9+6oS1pfD5CpZPuGlkVwW9D2SMspvGNeQDfewbBfZNz2TiOrzjG9CnX61rN
         5dpQ==
X-Forwarded-Encrypted: i=1; AJvYcCULwa86NMZEOPvQvk97CGc32KFe4AMKDvrx1lKQCrz9vX4IcK6YvyU4EhHK+nw/qRG9chqFa0Jzr48m5pYF@vger.kernel.org
X-Gm-Message-State: AOJu0YxEdMVLC4jV6XQ4RNwm7puHT51Ep7cpdTH1vwzYQ7IUvdqcmKbJ
	aikzEhgLPDj2uCEWg2ME42vNIPS2qbKXH4pN/63wGZ6U/N4+axShP8tAjuvpipPAayZsInSsrOE
	Uq8eoX+DZzqLEVLE3jPB8TdS/iaqqssX0MgSc6XMtBajsadUrDzq2+9K0hDsxeqIRQG+A
X-Gm-Gg: ATEYQzyyzzdG+cuHoneCC0oRf/rBjQWI7V55uO0mxqIfjw784Ilm6+J/sNXasOlvxI8
	vA3P41pCzA7Ih9R4Si80p7uqm/aMKXlCIZl7ftci2HjnSL5KL0AEFIX/iC/PS0XAqBFr5+lQFAR
	ToV3lKU6WBicjS4ZqewYvZcndsAyKx2qJ3DBumhAbT1OcfqbWnCbPoe/zJNy6fEr15WdR0VW07Z
	AG7UvU2uy6TvqxxJYq8X70aqLMdQq35nEMSRkwSs7+gvS4xwqEU/gQ3mU3oRp/X8wgQyZow8PLG
	pNoIPo/BZwKS/tseMuopd6MuQWKimasGskdU80SdkGoXFTKO/5aweK3jR0FUelJNw2IWYwnHk+X
	udY8Ul+2qVGledRd7xrxDc5HfG4CzkwUOyAz3OKo+rCWLSg==
X-Received: by 2002:a05:6a00:2e04:b0:821:a7b6:10a3 with SMTP id d2e1a72fcca58-8274d9e67cfmr13924036b3a.34.1772530537261;
        Tue, 03 Mar 2026 01:35:37 -0800 (PST)
X-Received: by 2002:a05:6a00:2e04:b0:821:a7b6:10a3 with SMTP id d2e1a72fcca58-8274d9e67cfmr13924010b3a.34.1772530536689;
        Tue, 03 Mar 2026 01:35:36 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ba6275sm19644212b3a.0.2026.03.03.01.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 01:35:36 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v4 0/3] Add support for GPUCC and GXCLK for SM8750
Date: Tue, 03 Mar 2026 15:05:24 +0530
Message-Id: <20260303-gpucc_sm8750_v2-v4-0-2f28562db7c9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFyrpmkC/2WNwQqDMBBEf0X23Mg2mkR66n8UEdlGDVSj2Rpax
 H9vKr31MvAG5s0GbIOzDJdsg2CjY+enBOUpAxraqbfC3RODRKlRno3o55Wo4bEyCpsoRaW1Mlo
 b1bUIaTUH27nXYbzViQfHTx/ex0Esvu3PJfHPFQuBQpMqsVK6pIKunjlf1vZBfhzzFFDv+/4B6
 Pa6QrUAAAA=
X-Change-ID: 20260217-gpucc_sm8750_v2-866576675fa0
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=P7E3RyAu c=1 sm=1 tr=0 ts=69a6ab6a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TW7xPe3Xj7hOj2XzWEUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: oxjrmmaTUFJ9Dnw_6Cc65Ri6jqgLtiD_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA3MiBTYWx0ZWRfX/a0KnUD4mdkt
 LXDGSmcK+GTaFnQSpuqDAwfbBt2zkcsTu0mv3qYdZ/1JzjxG8lZhci3sBqoogJ0dMlaxCOi9ogn
 1NTlj6CPO+OGuamrZZjO655kRyLQJPrYqeOJV1Hag+aWHLf7+JmKw0nfE2NqJ2NTARA+dtkIk44
 Wzg9TO0ZdOtH77pYWn0PhbmuymSn3nMvAIK+RKqTH1ndVYDyfyxrYRHrbYyybjkAR9vR9XDEV/f
 EVuvr7guPk6UqvTuaUixnxCbAYzW8xGMjgoesZAOhTETg6ZzgQCIULCcj7rOdaee1qaWDkNDAVX
 txvhAh/dZtCEx5c5aXjdC4vkVRGGL6uXEWbuEHoIUKKbv3GvV5aZCmBBaTt3H6t125xr97Kyctg
 CwrURYGDQtG5S5edJTzUf011lYC1g7jk8usxl5GL6BE/tRNtKrzht/kVDIePhpcJfRad4u0oW7s
 S9dIYaWSvVGt2sg7+Pg==
X-Proofpoint-ORIG-GUID: oxjrmmaTUFJ9Dnw_6Cc65Ri6jqgLtiD_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030072
X-Rspamd-Queue-Id: BB9D91EBFF1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-95078-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Support the graphics clock controller for SM8750 for Graphics SW
driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
block dedicated to managing clocks for the GPU subsystem on GX power
domain. The GX clock controller driver manages only the GX GDSC and the
rest of the resources of the controller are managed by the firmware.

The Graphics GX clock controller is a reuse of the Kaanapali SW driver.

Changes in v4:
- Add RB-by [Krzysztof] for GPUCC bindings.
- There was a documentation errata update for GPUCC and updated the
  bindings to capture the MX and CX power-domains and required-opps.
- Update the compatible[qcom,sm8750-gxclkctl] in code which was missed in earlier patch.
- Add the 'use_rpm' for GPUCC.
- Update the power-domain/required-opp handles in GPUCC device node.
- Link to v3: https://lore.kernel.org/r/20260220-gpucc_sm8750_v2-v3-0-6c5408564c3c@oss.qualcomm.com

Changes in v3:
- SM8750 GX controller is reuse of Kaanapali SW driver, update the
  bindings.
- Remove 'qcom,sm8750-gxcc.yaml' as it reuses the driver.
- Cleanup the 'gpucc-sm8750.c' to remove the GX clock controller
  reference.
- Add the corresponding changes in Makefile for gxclkctl-kaanapali.o
- Update the device node for GX clock controller.
- Link to v2: https://lore.kernel.org/all/20250723-topic-8750_gpucc-v2-0-56c93b84c390@oss.qualcomm.com/

Changes in v2:
- gxcc bindings: remove double colon & list the names for power-domains
- Link to v1: https://lore.kernel.org/r/20250708-topic-8750_gpucc-v1-0-86c86a504d47@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Konrad Dybcio (3):
      dt-bindings: clock: qcom: Add SM8750 GPU clocks
      clk: qcom: Add a driver for SM8750 GPU clocks
      arm64: dts: qcom: sm8750: Add GPU clock & IOMMU nodes

 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |   1 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  23 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  68 +++
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/gpucc-sm8750.c                    | 473 +++++++++++++++++++++
 drivers/clk/qcom/gxclkctl-kaanapali.c              |   1 +
 include/dt-bindings/clock/qcom,sm8750-gpucc.h      |  50 +++
 8 files changed, 626 insertions(+)
---
base-commit: 350adaf7fde9fdbd9aeed6d442a9ae90c6a3ab97
change-id: 20260217-gpucc_sm8750_v2-866576675fa0

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


