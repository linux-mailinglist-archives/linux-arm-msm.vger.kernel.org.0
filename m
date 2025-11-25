Return-Path: <linux-arm-msm+bounces-83210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 288C0C842CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 10:16:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9F77734DC28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 09:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A1E1D435F;
	Tue, 25 Nov 2025 09:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l0J3iZqs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VCeXhwH7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C07D271
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 09:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764062200; cv=none; b=H885p2cJpWvdhwDtiPGUfxNes/TLMsPKbffOVUq2sVjsPvq1EDcFqy+qy0wmZln/RLgYR3QLKX0tryl8fGVOC2fEhEMnE0QaQcdA9LD6ClJLaAtpMC3sqlvBWRlDTVba+vLDqfFywO6CwPO7IkUjFwYhRgfTklQ9WWoJnFvsFNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764062200; c=relaxed/simple;
	bh=lpKqk+txzrx+3eFBp9iWcFlFALJWT0f3evvH5dpVAoU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bWx3ubooM2IwtkUepi3MWGg2M7g3oHKhW34y2q/nZrugWimzwnyRPCgpX39qt4l+dZuwvX6SfHEcF9+U07RjM09pdx9+TC+p+k/6VfYte+Ab2ODPRTIhxLDfLvvBtVcaKYZCbKLYVCvgbmTSXkIZiS9UztQF5KTZOFMDm177l0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l0J3iZqs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VCeXhwH7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2gmGk1979149
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 09:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4n8WnEgH+BqhO0fDi2/HU0
	87EN2nbA+rpdxtzrTFbjY=; b=l0J3iZqs1ggxG5L2VCVRsT4jXwsoqzfuszMXui
	+dY7hXC+ByvlUIa+UB+bP+wVpd4zniCSLh10NI5WwafSIm017+zJkHHz0pNbV+BW
	R4rK1WeydKwD693e5LVmkqzWdAkZtXlb0HHUJpOQziJizMJ+4r3eO1/WlYE9XSre
	TeaJoux4Kv73hGmz4N3fmovdGZlZYMBRgZEGc8JfnBqhVO5/YqhbnNoMJizB8U8q
	7ZE0iNCP6Z4tnOPUSbjZAnZI7pVElmHvqayhsauGbau5MOQodVefp3xC9W4h76Uq
	2P0MyvnBuxZqfKnPEGjTmBMCySY8lsG5avPeoMmAHCOpJenw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amw9gt0xr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 09:16:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-342701608e2so5552712a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 01:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764062197; x=1764666997; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4n8WnEgH+BqhO0fDi2/HU087EN2nbA+rpdxtzrTFbjY=;
        b=VCeXhwH7uCAx5SxJ1BrIjs9qeA4k8nZS8VGEQjsITAjzHhsu9cbZZdhi/etxzCcAK7
         sK96Sv8VE3WGQPZ80/xFSKL8aqSHpNoCQVJZSbinhYb/A2wLUtplCYYupWD5oU7DNm8m
         MY5fkKI+Blfm1iLZFkgGa7ZOULcj0uowIMpAdOlyg7Fga5nbC3mc59u81EqOrqfetsH+
         4BduEP6pqNQFWhCTcQBDApMT9l1QK5wkyQfCaqqIpfzBkd5sz261ptcyzEfKo9dERgcY
         Y+HX8sTQBtjgJ8G0wU7LS/UWzWR3fi9mxjs+j82/SAlVKhyJ+Fi5oxvVu6uttofffDps
         0Zvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764062197; x=1764666997;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4n8WnEgH+BqhO0fDi2/HU087EN2nbA+rpdxtzrTFbjY=;
        b=nHL4tpHo/Coix3IymuL9TA4mYptgtbX/buH4Uwn5d4yVEVcg0qpkL/3Jst3zWeraDL
         QKdn3zs9St77KAfOrYvPDsKDZdhJ1JLNF+b6F0yPJGIDu+To0WNCUQ6xmZ+xNizZOEke
         L09SSpl5+AuLHleNeYmMNjI3P/ystDuARPMamSjDmGH0Z1hntW5eT9/E9DZMR2ecvU0e
         qTEhr6XnPra0zvkiwZQTOXbK2nFXUjYKKyMDfvEZEbw1jVLKgY33AQp53b3RszRKYn0Y
         VJm7abz8v5e/AYaPR4DHyiQ5APelt+lcgUt9J3NuqW+FaeYzye+2f5tUG2eFNYm2Ka+C
         ncIg==
X-Gm-Message-State: AOJu0YxMqfvgPEsE+g6AOcO1Bcz1IWCj37u0zbJ5Tfp8/1vLSJKkXina
	5Mfn/2REBnxmFh0X6kmJBZEpBYniVIVJ1vXE+6l5m2GUVeUK3h51r2750rcHJQCtM398TPYad89
	tPDQGahn6FNr+HRasDVq9KHvwZKHEuij0UrPzQeQaPsuf2NzJzenwZiHSAt2PF5RsAtpH
X-Gm-Gg: ASbGncvnOf/MJUppg8aOAyB4kh03Qsiig0Fj0PqgWBP4RJ8c6/B/nmQrZNwEaba2vZ5
	v03PXmQpcGnhnkxlSoS2kGvoTxYudBx+V2jmPb+TexaaOBC7zq0QhrggaRFXc/A7hkWTs8KZGlD
	mAh0TVrsIfMmZfMK4MPzq3zVBVl8H+7eeNrymoOVW9VHgivth9ZiDP/mpIlePU7H67QUaETk9Kd
	O/7FSibjIszcv/sR4VLTceNOrSeUYSqY3opSrCmbzC9LdmH6RvdCmdNY0QLX8qTbIojiB5aCyyb
	Ur0XV/NturZDeuX+B77ubkssDbpgHk8fREaBwATggWEbEZjOYT0YMW9mxDcDqelhu0q3EGMuY3g
	OGIdDVggo43Vs3BIb5/ioAHmd17pQKfnNqSC0qpiFjLRbjVs0kkBB4sDqXkD8aepJHWaHJATZx/
	J/8KAXE9fzGrjeo5C0r5dSEUKzNXeVdg==
X-Received: by 2002:a05:6a20:9148:b0:334:9b5d:3876 with SMTP id adf61e73a8af0-3637daaf589mr2372763637.4.1764062196853;
        Tue, 25 Nov 2025 01:16:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHktHb35KAVI3HX6XVjNajJJ6Z+gYDQKmRreGn2F5GazLD3+ij1wi2Mz+4vrNkksCxAvH4G7w==
X-Received: by 2002:a05:6a20:9148:b0:334:9b5d:3876 with SMTP id adf61e73a8af0-3637daaf589mr2372715637.4.1764062196355;
        Tue, 25 Nov 2025 01:16:36 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ecf7c29asm17288851b3a.9.2025.11.25.01.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 01:16:35 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: [PATCH v2 0/3] soc: qcom: llcc: Add support for Glymur SoC
Date: Tue, 25 Nov 2025 14:46:21 +0530
Message-Id: <20251125-glymur_llcc_enablement-v2-0-75a10be51d74@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOVzJWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1NDAyNL3fScytzSovicnOTk+NS8xKSc1NzUvBJds0QLQ6NkA4s0k2RDJaD
 mgqLUtMwKsMHRsbW1AMBpcWhoAAAA
X-Change-ID: 20251029-glymur_llcc_enablement-6a812c08f4c1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764062193; l=1505;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=lpKqk+txzrx+3eFBp9iWcFlFALJWT0f3evvH5dpVAoU=;
 b=88Vm43Gaxl1wBtQF+hf37aZK8bmzPR+C9iXW50ZB70xRi2keSjnPb0CJ9DUf6h6yedqE9UE2S
 9r5h1vQ6or/C95HuXcf/XsPBmhwESaPwc0KKZNweoNkybTOLzPer6i/
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA3NSBTYWx0ZWRfX1ElCjUAEtnRr
 YmkzvhfaYohhm1a4bMyMlDguzLwaojaG85Itymq2GvH4FCYwAFg76kBNgi0jQnffuNmNLM7q7su
 BiSZ/4XhCaW6WcYkVlbJxt+tBypTI0O5BOrR1E6913ubNI3DxDUQW8QUnJBOgfMYmDjWR0zsCRN
 6I6OkXAs464mSA+XW7M9Pu8lSoF8GLFHlaoEsomnTWcHDrn6+ZzBodb5YpAZ9w2jtC21uzY7h93
 7AmheGAZa6SYIFjWEVH1fvC8H5c90pbH5q0DR3AAmwUWvf47E0EwpLQPa9iC5Lzt6Zm0mjB7tsX
 0kQ49JhoA51UUWa9IxTcSNXbxbmzfXFnnnWAA4MgqFF4lqcGWdBDKD60gMXdvseI2/OYpkYyZ6V
 VxsoSkbt+PZ8ScBrkpZxVhARBEoPzw==
X-Authority-Analysis: v=2.4 cv=H53WAuYi c=1 sm=1 tr=0 ts=692573f5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=P8xJj-QnlYWevmRsA_UA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: Cr_2h0hUfOIcwE0GRFTmxNoaICkjvtk8
X-Proofpoint-GUID: Cr_2h0hUfOIcwE0GRFTmxNoaICkjvtk8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250075

Glymur SoC uses the Last Level Cache Controller (LLCC) as its
system cache controller, update the device-tree bindings to allow
maximum of 14 registers for llcc block since GLymur has 12 llcc base
register regions and an additional AND, OR broadcast base register.
Updated SCT configuration data in the LLCC driver.

Enabled additional use case IDs defined in
include/linux/soc/qcom/llcc-qcom.h:

OOBM_NS
OOBM_S
VIDSC_VSP1
PCIE_TCU

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
Changes in v2:
- Updated dt-bindings for maximum no of registers to be 14
- Re-ordered the fix alignment patch to before adding a new entry for Glymur
- Squashed commit for enablement of usecase id and driver changes
- Link to v1: https://lore.kernel.org/all/20251121-glymur_llcc_enablement-v1-0-336b851b8dcb@oss.qualcomm.com/

---
Pankaj Patil (3):
      dt-bindings: cache: qcom,llcc: Document Glymur LLCC block
      soc: qcom: llcc: Fix usecase id macro alignment
      soc: qcom: llcc-qcom: Add support for Glymur

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  47 ++++-
 drivers/soc/qcom/llcc-qcom.c                       | 207 +++++++++++++++++++++
 include/linux/soc/qcom/llcc-qcom.h                 | 152 +++++++--------
 3 files changed, 330 insertions(+), 76 deletions(-)
---
base-commit: d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
change-id: 20251029-glymur_llcc_enablement-6a812c08f4c1

Best regards,
-- 
Pankaj Patil <pankaj.patil@oss.qualcomm.com>


