Return-Path: <linux-arm-msm+bounces-77273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A92E1BDC378
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 04:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EFB1189FF82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 02:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75B882836B5;
	Wed, 15 Oct 2025 02:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fj7BQ+f7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D137257AD1
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 02:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760496980; cv=none; b=TKNwC2z7VaYEWnhh1+9laQTh2fzn7MPY5IsS00xwpVp32BangxkzQqxmHJOeo/ylr2bXdD7WgsQ5cMsydx637Dsd6Hbmn8Z7S1coik5SvM2vc5iAIOHFKBPVyP6NoGyP7GDCk6uJEU7JwCPVCeRVEJJl/YmPgqGslNRCNdyAlCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760496980; c=relaxed/simple;
	bh=Kjr3ghiFhoEm7AjSPByV1uHThM7S353r7iIvTBhT2YY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b326PLa3Nv22cw6xOHxb0J6BEDicdl2H27HVTBALDLZDNkNiCBva78rXTGIvDBUgkA0RBqpoFDYGr+kkRwFRg0/EXvdMpWT9/MnbP/bpsFhQku0IsemkHFDZGz3Vz3fFB2Fzi0Rfjx6vbGsRYgY8tk/uTJ5mPcxD2pWVDepWJQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fj7BQ+f7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2s9IX016154
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 02:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=K1dAs08UzkyLMIXJtBsx5r
	bZIrn2HyC6e0aCnh1ANvI=; b=Fj7BQ+f7iD8YJakmYY00sY86Xgc1H5A32JyttD
	lc1k6+9YdDeSAQ36qQXxyZUQ8ENwJEgtjCraIn6JQtpYfJ7V2U1kUU1vWaqj+CwU
	C5zG8fgEap4bqjAxjuwexa30+iLpMgrZxd5QSQjaInZs+7mY0aURZ5qg153TaypW
	fVx69sT6lGTwU0V40G8gCT//DTtIbmNtFkl6n+MmGfEIlZzSkDFokwACyxcgSjPq
	pOFdlLYiKb/EupsjeuNkfWP4EY6X+SPJmM0HrL8jYVgBrt1FKQ+g2Zsqg3NUnlR0
	hFW1UtN5omngh3OUff7UFnwd1g/vqDD78BYSsA24aSoSSfhw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdkatu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 02:56:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-277f0ea6fc6so215702345ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 19:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760496975; x=1761101775;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K1dAs08UzkyLMIXJtBsx5rbZIrn2HyC6e0aCnh1ANvI=;
        b=fz23KhbMQSuSWT3SIMF45g/JVQpa7NA2IApoRBICtZOn39PhlEmmT2u/ee0D796uDi
         qPTGmnuDgkJcNiXnO6NvgEcVr76vthoO18m1H9pxQaoUHK5XhVjMtHdHkFxyjJkhwl7j
         iP4waD2ldqrwSk3XC+/yodsgH0iTiLowm+VZ/Lubszkqe36DNUzaLfYELP8MzoHRp1Wl
         iSPiMzzmpoRnwHBj2Wk27R01cLTgZJTVM7xzdPflmjrxEDGBYBXhwfsj0BvaPm2mmY+y
         oHjde484wdqMpcqoxP5YThv3SxCNB3ifeWL/P+zHO95n1IPuRNNgqpoUbzFYh0816rrA
         NptQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeMhGzc9UGM7yL+KPovnaJweRL8wJ/dhHbCcyx/UHBmfgAz6E+FbE3Ooqh+pBKivSQPezwGp5ON4N9yIg2@vger.kernel.org
X-Gm-Message-State: AOJu0YynK9wl6371wJen7PVJ3ldbRqnha6tsAjJdKpqxB8ZkgEaDmcCe
	Ymeo8yMam7HxCYxAeMe2SjkH1UYEZAgn+kyoFEQTCnPfvozwHck0IzbVMX2VOhCU5Fw0mSsxjG9
	IZj6S1xVj4clNiIDqjHnJuYNRAAfLAPw8MpVMu3i1W/aYp3J13p0rNro5NGP2S4L+SzhA
X-Gm-Gg: ASbGncuiADfxTM0+03fW4rUoJqVbLihi8JCARehz28ZZpONbKe5CDjUODi6pYt77kC2
	AaxwB8qhEPLH7XsfR/zk09uRKNh81XFtNZALyRgmAFgqVD5/GHrl0OWJWMGiB7Ds+g5nvdNJiju
	qlsMeZrgBXx6HdaQpFd91ew7vfrsQSgz3+fa5woVhpf80sZjYXtGr5h8sjH56N3KzPJB6fiAF2d
	zqQrAJoeDBwMUAepEfDSnQsb2pPBZnqYtOCscz9fxWegP2LyVOj5LClLhK3eXkq2TtUFxk6vzvk
	D1NnHjdD9UK8wwglsdj8C65JJpFEz9zboQQmv7c9z0WWVsyvcas1tt7ZmYAz9c+pB9W7bHz7jwm
	lxaE/hV9o9m2mSU2JMOc=
X-Received: by 2002:a17:902:ef4d:b0:27e:c18a:dbb1 with SMTP id d9443c01a7336-29027373cb1mr378846245ad.16.1760496974802;
        Tue, 14 Oct 2025 19:56:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbPuuZJwubZcA1X3TvL9jOZsDcH79mZnR3vcviKmtSdz80fMT6aRjUwjcu/dItkzNrfnnBzg==
X-Received: by 2002:a17:902:ef4d:b0:27e:c18a:dbb1 with SMTP id d9443c01a7336-29027373cb1mr378845925ad.16.1760496974323;
        Tue, 14 Oct 2025 19:56:14 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de54d2sm179122855ad.12.2025.10.14.19.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 19:56:13 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v2 0/6] media: qcom: camss: Add Kaanapali support
Date: Tue, 14 Oct 2025 19:56:00 -0700
Message-Id: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEEN72gC/02QzW7DIBCEX8Xi3I2A+P/U96hy4GedoNjgAHZTR
 Xn3rp1KzQW0q9E3M/tgCaPDxPriwSKuLrngaZAfBTMX5c8IztLMJJeV4LwFZS2kZZ5DzDCECEZ
 NKUHwcFXKq1mNDrDStdW2krxDRqA54uDuu8nXieaLSznEn91zFdt2x/NOlnD184aEVQAH3UhbW
 0TFq/IzpHS4LWo0YZoO9LDT88WOeFsod34Z/MemFntoIWFJCJOKJkAOYNGHTIJJkUwvw4AR/DJ
 p+oxGwxuh2/JY9xTt/QpvuO0GHr/BjMFcwXlYh42fzcX5M4xUD2Q1aIHHpjVl90fSilJs6V3uC
 493Eu2tRUNVnr+QQfvQigEAAA==
X-Change-ID: 20251008-add-support-for-camss-on-kaanapali-e5b6dbd5209e
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: U0rsA0AjGGzYywdEAdnHBuKijbVRxPWa
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68ef0d50 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NMcFVE--X395r7UwzKoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: U0rsA0AjGGzYywdEAdnHBuKijbVRxPWa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX00ZArqrAR3GH
 3xJtLTAG5JbTKfkj81JSY9uAp3TA+nsYJlOENmScS63eWnXceiYqjcvKtQDkIcT9cScJqzbT6Vg
 wlAITxsq7RzwZNvZYach9bWGH9CQ2TfA7jwDS2oMOy3yPg5MUhrpCDs8K8Bke6+EsoaS4sSBryZ
 HSC/gG/DrXBeIH7uSPG0EKeqYkDqPipwJVyqWZlRhPfSMeYJwrwy53KNmMPc+ehFHII1hmdzjbB
 tqEIp894cpjgkwAMTtQttukPALZHGJIeeOl4odtaWIAiQyTY7sBQd9d1x/PLSs20TxgGyTFsxUH
 GaUgemKt7dJMQ0M/GErbKeJ4jo0tmiWiespIuf2NbOME3wBrGYJCm20erdqx50fg05UN8FHmCal
 y7CX5MeDfaBhGv8bvjs25A8MSVRbAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

Add support for the RDI only CAMSS camera driver on Kaanapali. Enabling
RDI path involves adding the support for a set of CSIPHY, CSID and TFE
modules, with each TFE having multiple RDI ports. This hardware
architecture requires 'qdss_debug_xo' clock for CAMNOC to be functional.

Kaanapali camera sub system provides

- 3 x VFE, 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite
- 3 x CSID
- 2 x CSID Lite
- 6 x CSI PHY

This series has been tested using the following commands with a
downstream driver for S5KJN5 sensor.

- media-ctl --reset
- media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0

Dependencies:
- https://lore.kernel.org/all/20251014-use-marco-to-denote-image-buffer-number-v1-1-f782e4cc622d@oss.qualcomm.com/
- https://lore.kernel.org/all/20251014-add-new-clock-in-vfe-matching-list-v1-1-0d965ccc8a3a@oss.qualcomm.com/

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
Changes in v2:
- Aggregate CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition into 'camss-csid.h' - bod
- Remove 'camss-csid-1080.h' and use 'camss-csid-gen3.h' header instead - bod
- Remove redundant code in 'camss-csid-1080.c' and align the namespaces - bod
- Slipt 'camnoc_rt_axi' clock in vfe matching list into a single patch - bod
- Add whole vfe write engine client mappings in comment - bod
- Remove hardcoded image buffer number but use 'CAMSS_INIT_BUF_COUNT' - bod
- Remove SoC specific logic for vfe ops->reg_update and add a new variable
  to determine whether ops->reg_update is deferred or not - bod
- Add description to explain why 'qdss_debug_xo' should be retained - bod
- Add the procss node in csiphy register list comment - bod
- Rename the variable 'cmn_status_offset' to 'common_status_offset' and
  align this with macro in csiphy register structure to avoid ambiguity - bod
- Aggregate Kaanapali items into the definition that introduced by
  'qcom,qcm2290-cci' in cci binding file - Loic
- Format 'kaanpali-camss.yaml' binding file
- Link to v1: https://lore.kernel.org/r/20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com

---
Hangxiang Ma (6):
      dt-bindings: i2c: qcom-cci: Document Kaanapali compatible
      dt-bindings: media: camss: Add qcom,kaanapali-camss binding
      media: qcom: camss: Add Kaanapali compatible camss driver
      media: qcom: camss: csiphy: Add support for v2.4.0 two-phase CSIPHY
      media: qcom: camss: csid: Add support for CSID 1080
      media: qcom: camss: vfe: Add support for VFE 1080

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   6 +-
 .../bindings/media/qcom,kaanapali-camss.yaml       | 494 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-1080.c    | 371 ++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid-680.c |   1 -
 .../media/platform/qcom/camss/camss-csid-gen3.c    |   1 -
 drivers/media/platform/qcom/camss/camss-csid.h     |  12 +-
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 147 +++++-
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   1 +
 drivers/media/platform/qcom/camss/camss-vfe-1080.c | 188 ++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |  10 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 352 +++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 14 files changed, 1576 insertions(+), 12 deletions(-)
---
base-commit: b09b832c719df5e10f2560771fd38146f2b3fd7c
change-id: 20251008-add-support-for-camss-on-kaanapali-e5b6dbd5209e
prerequisite-change-id: 20251012-use-marco-to-denote-image-buffer-number-cbec071b8436:v1
prerequisite-patch-id: 3ac5d6703a9530eda884720c146b9444f90cf56b
prerequisite-change-id: 20251012-add-new-clock-in-vfe-matching-list-25fb1e378c49:v1
prerequisite-patch-id: aacb03b359fdf95977805f42918c0b6c39889e32

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>


