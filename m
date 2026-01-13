Return-Path: <linux-arm-msm+bounces-88747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6E4D180AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 11:32:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 091D130731FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90DF38BDC3;
	Tue, 13 Jan 2026 10:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pNksfhkD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NdS7Ywv1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006B42C3268
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300116; cv=none; b=psHABrzRfPzNkgJKIYkJTmvXm0DdqA2t0LfdpZ0s2FcaJD/n0IczkrLg/0L0SbknbJDZ+ofsBDe6HmBo4pFiinh1KpcuStc8rKGg+1YEEYQClILqFA2stbx602p4ajtRVm11OXdlNkiGXu0LybJpZ9PbfQexubW9qGS5B95+/C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300116; c=relaxed/simple;
	bh=7lvYmkvyF65O+UQz5ZzYxY120h7eLHmL4Lbby/WRWog=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eiKQVB56BVkSENaB4CtGuGdBHVZ1PQ3wmk3qTuTHbohNtk1E0eDorCiKSGPwbzczdXycZrQKKHjnadqjVt2yw/OWdziH8dcnxr5KtHPB3SYE0cJDJpUKUdd4AzTDbDctJ56zKMgmPkcrlC7H/4jbpNy7sNiQKNaE8su2Jli9Qoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pNksfhkD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NdS7Ywv1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5nc0j3735222
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7BUyvgrV4V3hKosIFoCQ6q
	XoNT8ClbR3PlwnpOAdCuM=; b=pNksfhkDKHrwHjWpoFcz0YYCYHVI9PMNUMwL+2
	/eXV+/s8w4+i9mxrjPSnuIQuuZSI39NjOUuF6XVR9L5/WSGsmXHbAgT4WjyHrAE0
	pn+yypVxcLBQwZtk8SDanO7uaoFJBPhH8e6duog8bVy397bwrvGy/dCcx5wkd2rW
	nCk+uk8dfzIQxOQwGf7Mr+jsu1tIZ1iLv0iufsz6LZe9dXAf1xd3991OeALGKR9P
	mRLBs/2xo5QHBfy1IZ+/fgbfXwCiS0Bqt3R5iX+oo/fI3OyU/yYbVQB2U83BXgdq
	Qpo7119UhbLRUNfCc7OSBGc/lZOcys8Hh5wrDrlDaFIY20Hg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng878ujf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:28:31 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-123308e5e6aso264048c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 02:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768300111; x=1768904911; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7BUyvgrV4V3hKosIFoCQ6qXoNT8ClbR3PlwnpOAdCuM=;
        b=NdS7Ywv1Lr71bYvKZUMoAmKmg5w4aUZe2PMAhuSeAOlsJ7hc2KF17CY/WkPVI1S7uq
         yAjlc0Jh6UPdbpxFeIm5+Fr4G/GP0dzLE3VWv3YTfOyytH54jkCGtnX/7pt8G6ic4HMD
         FzmClGkJ7YK6SAvKmh65BsTjGHDaZ0GHAfMnNPrUFtqaxtvUKNHCMQkEKLNEJCgUPQwO
         pyNqRT3/y21qIE/yhed2GmkGL/eo5RanVqRfp5mexQFtyOUdGoW1Lb4Dlrar+fMIuLW/
         Akd8QjcbWn7VfOzvuz/sHicrRdNoao1u21aDmMCwhtegC/JkRrUhUTo/6o9RUBjDlQUS
         /e8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300111; x=1768904911;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7BUyvgrV4V3hKosIFoCQ6qXoNT8ClbR3PlwnpOAdCuM=;
        b=Dr4qjZQcnzHcJWQxSCHrMOFYEcyOs2am4y9bFswzLA19dQOdt9tI9ddrd0BRKhDWPk
         ABYsqiAEY7UXjkzAuF22ejmdky4FqHqbtAaB2mO/zhYSQ/1ZPHKPAYftUo/nSREl4pfg
         fa4Qt1+XKhO2ON2Tle+ZDJtykXS5Q8W91sjwynEI8VM7AfY3QrvL8rS0TdqhHq4Zzsqi
         ScPJAQ/wATOhPtJXacMWqEREzEfixRjIXCOMtRTJ9Pe5+asJ891iWVXjMGUvs0FL0qmY
         3ktUborl4nbejdr4mt6F88z62Nvqu8io0V1xsd2SJHtTFc7mcIEey3EmnFqJ/+ZFgnvL
         drOQ==
X-Gm-Message-State: AOJu0YzXDTjwGH+04jhQmXDfPqah+dqtftmixV7CrI+FUUre/da1ndL8
	n9aC3xe7WbDzX5aMjwkKMAm4NQRIT9yrBB1Uz1lWnOqTyRJ+lHDCprqxNri96ZXzMv6IUBJZw3F
	Qz+/gvEsVwUmFcvG3jyzkD3z3srgy2GIJ49G8EAkw6bbm1kLUSe4HKe+mcYd4TjQXdzpQ
X-Gm-Gg: AY/fxX5HXU7ETAa0oP6gCqaD9DpqLMhmMZg5ArrFmjoLqfgRRB3cXwigPTUmgh196ZJ
	U8uX5KtRbkxZRqnmJbPvJIfdYzd/sM4uW/Zy4I8X2ZMv+we/Zxic5RqNUau3ruR0TND/vKWsQlJ
	vr3MH9dsxzKGSN3HdVXbykvBjNpmuQbTj/m8G3YjzIh/0UKZ4CVuR5crAtq7VBTQdRu67ebanTc
	9cvRo3NKuBUW3xAC+OtAZREsLQbJsSo2E8dmAV3C3vVDmIMmBvZp/TtvfKwZnb00u1V8p2LjEQ7
	mc3QnD/tvVHuOSkb4u98e5VOVVR5ieU1yWLj8HyQHyJELGCyAiFc3mQQwNLfZBVwZeOMCvNaB5s
	c1iGtpy85n6JVS+gt+vtC8mAIiayoEp1oD6ipOf5DNEPtuKSJAh4Obe5teR3idB4A
X-Received: by 2002:a05:7022:2388:b0:119:e56b:98a4 with SMTP id a92af1059eb24-121f8b0db72mr21536315c88.11.1768300110603;
        Tue, 13 Jan 2026 02:28:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkN4ZxHjG4pAZ/7ySTciuA5fQd+jr4olQGCAswoKp2mByn59qUz8OEQtB9UKRmf4hH2TCOpQ==
X-Received: by 2002:a05:7022:2388:b0:119:e56b:98a4 with SMTP id a92af1059eb24-121f8b0db72mr21536275c88.11.1768300109960;
        Tue, 13 Jan 2026 02:28:29 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f23b798asm21162429c88.0.2026.01.13.02.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:28:29 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v2 0/5] media: qcom: camss: Add SM8750 support
Date: Tue, 13 Jan 2026 02:28:26 -0800
Message-Id: <20260113-sm8750-camss-v2-0-e5487b98eada@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEoeZmkC/2WPwW7CMBBEfwX53I1sx3FITv2PioMTr8EqsYM3S
 UGIf68htFTqZaVZ7b6ZuTLC5JFYu7myhIsnH0MW8m3D+oMJewRvs2aSS82FKIGGbV1x6M1ABKX
 udMn7ruHCsvwyJnT+/MB97LI+eJpiujzoi7hv76BKCKnBWAs0j2NME7iYnsQYfhwWARy00g5RY
 ldL/h6JitNsjn0chiIPtrutnglPc04+rcav4LnHGlvCpzHBjObonz51WdfSKoXO1e0iJPtb+Pd
 PPK/xPGGwaKEnPx4uMJg+RVBb3TWu7JqKu3Z5IAYkMi9GbioU30qtmkJJxUHAF4YBw744+vl/o
 UzoDCHcF35qNyEbw5qFN7nu7RsDS4tOsAEAAA==
X-Change-ID: 20260113-sm8750-camss-36b630cb901d
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA4OCBTYWx0ZWRfX3g9uOmKmXzRG
 S9rjQY3/2jj5VkheCv5XezstKzJmVPxe6En8ayr5otGV5IZwRTv+1qgQP7GDebevGm4S3IplMYO
 VxZOuMTuKk3wPWJqSK5agyhxkF3ooSIKmuHHb4Iq8Nn7PlCCQCqxgcOnP0fZVo/abkvZN4NYoFU
 e2MRPlAlDfVnEfOn1T9dLyKpoQ0ZAB3dWMWO3Li52DXBgMpY8dAuDvmsbeVxo4tJpftlICisiAG
 qX5YIBuIveL0J4fJsAK5YIWiAhrrLliqY9K32yarB9frHNLDRfMtnTWWXPgji0jeQw1cznfAl2Y
 VvW7oMK48kY4iBW/IR0D/9tYSReiQtpBv+bpeoy6xUZb444/YbM3RIuTJyRgjYW9NGhda7W50ER
 G1F1v4cQV0X4aGDok4HDsSFhyuANjcLF+uGTFddItNWV34q9NucVzzcZta6UvQrV/mpNpsNdvIz
 K0NTqOoL6e9XZ7iDT7w==
X-Proofpoint-ORIG-GUID: V4Tmd6k7Tqc2tcVuZ9ntb9WH79uZXlXu
X-Authority-Analysis: v=2.4 cv=IOEPywvG c=1 sm=1 tr=0 ts=69661e4f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ZthKqu_aCWk3wB8NWGYA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: V4Tmd6k7Tqc2tcVuZ9ntb9WH79uZXlXu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130088

Add support for the RDI only CAMSS camera driver on SM8750. Enabling
RDI path involves adding the support for a set of CSIPHY, CSID and TFE
modules, with each TFE having multiple RDI ports. This hardware
architecture requires 'qdss_debug_xo' clock for CAMNOC to be functional.

SM8750 camera subsystem provides

- 3 x VFE (Video Front End), 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite
- 3 x CSID (CSI Decoder)
- 2 x CSID Lite
- 6 x CSIPHY (CSI Physical Layer)
- 2 x ICP (Image Control Processor)
- 1 x IPE (Image Processing Engine)
- 2 x JPEG DMA & Downscaler
- 2 x JPEG Encoder
- 1 x OFE (Offline Front End)
- 5 x RT CDM (Camera Data Mover)
- 3 x TPG (Test Pattern Generator)

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
- https://lore.kernel.org/all/20260112-camss-extended-csiphy-macro-v2-1-ee7342f2aaf5@oss.qualcomm.com/
- https://lore.kernel.org/linux-arm-msm/20251114082649.4240-1-wenmeng.liu@oss.qualcomm.com/
- https://lore.kernel.org/all/20260112-kaanapali-camss-v12-0-15b7af73401e@oss.qualcomm.com/

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
Changes in v2:
- Update binding commit message and its description. Meanwhile, modify some
  property names to align with previous generations. - Krzysztof
- Update the vdd supply names with 0p88 to 0p9 in binding to keep such name
  style consistency - Krzysztof/Vladimir
- Add missing Kaanapali dependency - Krzysztof
- Add csiphy macro and new regulator interface dependency - bod
- Add regulator current in csiphy resource due to interface changed - bod
- Make csid board level code style consistent and add comments to explain
  the differences between csid full and lite configurations. - bod
- Remove reduandant initialization for empty set in csid and vfe - bod
- Remove DTS patch due to conflict with camcc dependency. Will post it
  as an individual series.
- Update vfe commit message as rename work happens in Kaanapali series.
- Add module descriptions in binding commit message and cover letter.
- Link to v1: https://lore.kernel.org/r/20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com

---
Hangxiang Ma (5):
      media: dt-bindings: Add CAMSS device for SM8750
      media: qcom: camss: Add SM8750 compatible camss driver
      media: qcom: camss: csiphy: Add support for v2.3.0 two-phase CSIPHY
      media: qcom: camss: csid: Add support for CSID 980
      media: qcom: camss: vfe: Add support for VFE 980

 .../bindings/media/qcom,sm8750-camss.yaml          | 663 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   1 +
 drivers/media/platform/qcom/camss/camss-csid-980.c | 442 ++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   5 +-
 drivers/media/platform/qcom/camss/camss-vfe-gen4.c |  10 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 357 +++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 9 files changed, 1478 insertions(+), 4 deletions(-)
---
base-commit: 31d167f54de93f14fa8e4bc6cbc4adaf7019fd94
change-id: 20260113-sm8750-camss-36b630cb901d
prerequisite-change-id: 20260112-kaanapali-camss-73772d44eff7:v12
prerequisite-patch-id: c3758c408ebf6ab407b1977ccd51cd7179316c73
prerequisite-patch-id: 7bb9332e44b93bb9f063bfa0626dd38ff450aaa8
prerequisite-patch-id: eb308d8bf8e0f942d5a0dd1826cf3e1963b05378
prerequisite-patch-id: 8c62245a3b0a2527d4ddf47438926d3b1fe3ff41
prerequisite-patch-id: 36bed25998858225c8e1d6beeb977236cc1b76d6
prerequisite-change-id: 20260111-camss-extended-csiphy-macro-486b9f3b950f:v2
prerequisite-patch-id: 27c2ef96f0e747ec6b4bcf316d8802356e4cc3f4
prerequisite-message-id: 20251114082649.4240-1-wenmeng.liu@oss.qualcomm.com
prerequisite-patch-id: affdca1f0af770b95444f99c203d291bcc41ec9c

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>


