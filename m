Return-Path: <linux-arm-msm+bounces-83026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 865EDC7FB0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 10:45:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2EED24E024E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 09:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546062848A8;
	Mon, 24 Nov 2025 09:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IRopIsat";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ETrAJ7U2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E7536D50C
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763977536; cv=none; b=VTsyRg6RmWvaBxtkagvR2/dIgwl6oNdi3zJWgj68lxeSsp1jAu1ZwLcRYAHuaYbgcQaXeTfXl8QRcWtiY+Vy9mKfXE5wz/7B0NhvtSwM7zG3cD4S3mSbSXgBZMAEBy4eXxb4o0SIQ+AySDuyvCTJwvs67bOhXYnLsNy0+uxn43w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763977536; c=relaxed/simple;
	bh=DBfqRAqXKMUSzdYStAkNam3VSfsHB3Mc9yXhM1SxT4s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=upihxgjm7yKyrYwvoLPFYPoo81FxGz0UhRa3uBDxCETiFutHiwCq6oF5ZjSv4ielCjIA+jz9vjiPkOp7+2jgVyAR1fERDT64CgCCmgMwAhVl1N2Zv3TvxkgGKyL0YLwLo11bMr/UhO5eGMAza+U6d1S0WYiHXfcihlg5l5Sii0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IRopIsat; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ETrAJ7U2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO8avnv2406193
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dw3k8txBXeUsj5vSE8wOlc
	Pq5C0txa9kd2GvuA+trbM=; b=IRopIsat3TKfQAfV0qA8SNRn/PKZhXJIyLG62C
	0iAQzA2c+A/IK5ZJIPKFEhkDd3R9gbdjWz25FLAM9rCakBXmW6zMNa2IOzCKfubO
	JgV3Hy2EgzecFegIk1ibpjVNcw9LTcWpyV0XrnQy9M3ao1S/Jx0iR1WUSu1uH9Lx
	gj6fLschGdm3ilhNHvs9G6NsfvCzlHfK2KS4L7Kcw4/HGeoHSYxKWdpRU+oY9q16
	GWgluY/dv0McQuQpJVFnOgu5sxWEk1VDtsv2gu0Cyj4EYV60zehCYWPyhFMRPllM
	u28SrIt3SD5/lDi17ozur3OAClsJgWAdx8drJ6mJp0m5rQ5A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak685vk9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:45:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-340c0604e3dso4500061a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 01:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763977532; x=1764582332; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dw3k8txBXeUsj5vSE8wOlcPq5C0txa9kd2GvuA+trbM=;
        b=ETrAJ7U2+9m6iKCoPiTG1kC+oHJ2anHEvsrBFsDQ8g940yaK8uFfQwdls1hrPVUTcd
         /ADRz4fGaFhYPjg7ExOIEoNanFFvyszycm0oxV/0Ls88tG0JRtuwqDkFB5W+4LmJIb16
         tiFx0BIJRKclzBgmXV2Irlxk+GriMvLDsfZWBH8Iwn3ZkjimMLwSZntfTUh+Yr7nLTSR
         HsOjVm3/DgipAojyStu5PVZclA5lOLQYSoswwR/fslczFzTNNNlgOQaIy0bX89bCciJI
         DnFjLIxkdtq+Rzc726VIO+rGNENZl1MRG5375Ua75u0lTZbqhlqut9B/oVqAdY/o7N4m
         paKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763977532; x=1764582332;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dw3k8txBXeUsj5vSE8wOlcPq5C0txa9kd2GvuA+trbM=;
        b=iNSslxR3ibmUkV72jo1U0IJ13iccwgP2RWB59nyI1SHf3y4MX0/RBxnOWI9Bzc7mEA
         go8rOtrSk4Lb//0xob9cp/hr6YDUDjgaCyKLdl0Waj6t9Ies80nDsGbbGqKZ86Dcoh+c
         AcqYr5ZfLwiTthd7xFWp2TzgzUw5kKMkwxj8zQ+Rh7A14wfuwdPGHUReL6pDuTgXNSlP
         i7VNcoG1eoUr95LXSd7S4Osy8ClltiZYVgAJHEIE2m8IOJ3MZWo2fps7PlyNzVisAgnA
         KYbwBbl2ur7E1E/KR4diFW76f/QASNxWeg7NEiwdfUpYaA6xtySHBOAojrrbEm+Qz90v
         XQOA==
X-Gm-Message-State: AOJu0Yy/TbbrvNZ/0SD5JhkUalh1qWxac57wEfTSCXBqvEsIznnPsunS
	KW7ow1ExbHaM3B7Wc46svKtttrcBFtBPDPJtUS5CB8jRReQybuvEgVJbCPrHRhXBzoEadGyNlMi
	Qk4ulHG5muwW5GU/cqIubkeGC79UcG/3eqfj5HOsd319YuO4ZzumyBM8GPiBBI5myhUEb
X-Gm-Gg: ASbGncv365AtyeLR3XnRNRRADTE0v/NJSEJ2DKa58ZBd7RO1QBkJgksL0fwwGEXxeym
	jzIzj8Bdx5F8CHtAMQQISDYzYWasAO6TTy+B9U9eWR0LW3TePcm9wrm3ZAJG9zpdMxTQrkD516U
	a2ae3suQu4IOT5+dYcF0pmp6JNU4YvNu3zpzRI6hqvv+nirw6LaxqmAqDZRPaAtPnbbq1/yK+NA
	BT8e9mbmnVWSROINVvPvvHtRiw1NWKSvH2FNjpcXKG/chsTUa4GraPk5ENvA67IQIa4U3Xu25NW
	uv0v0/LV/EhpUNMoj0PIv/0W99wPxvtCHFnl8z46Nlfsl3C3BnuFNAV3CMT6os1wABxHZbp24F/
	HUSdMrDKxBPZKhUhEKHD5AOxFY4dcLWMx+8Ph/SJ/cJ4Y
X-Received: by 2002:a05:6a20:7d9d:b0:34e:4352:6c65 with SMTP id adf61e73a8af0-36150efa2f1mr11452437637.38.1763977532375;
        Mon, 24 Nov 2025 01:45:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHydF8yK65KpEqG74MQ8inowM3+9+4a9hPb2OgvyUdCJXxjZo+DVPelrOMPA5VAxjEAA8Vk9A==
X-Received: by 2002:a05:6a20:7d9d:b0:34e:4352:6c65 with SMTP id adf61e73a8af0-36150efa2f1mr11452419637.38.1763977531855;
        Mon, 24 Nov 2025 01:45:31 -0800 (PST)
Received: from hu-jprakash-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75dfed99esm12668291a12.1.2025.11.24.01.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 01:45:31 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v4 0/3] spmi-pmic-arb: Add support for PMIC arbiter v8 for
 Glymur and Kaanapali
Date: Mon, 24 Nov 2025 15:15:09 +0530
Message-Id: <20251124-pmic_arb_v8-v4-0-d91dcbf097c7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACUpJGkC/1XMTQ6CMBCG4auQWVvSHwrIynsYQkpbZRKh2GqjI
 b27FVduJnkn+Z4NgvVoA3TFBt5GDOiWHNWhAD2p5WoJmtzAKZeMcUHWGfWg/DjEltT10TQNk0Y
 oCXmxenvB166d+9wThofz7x2P7Pv9OZRXf04UhBKtTGtqxfWo6cmFUN6f6qbdPJf5QJ9S+gD6A
 rlZrQAAAA==
X-Change-ID: 20251123-pmic_arb_v8-669d7715d3a5
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        kamal.wadhwa@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763977527; l=3364;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=DBfqRAqXKMUSzdYStAkNam3VSfsHB3Mc9yXhM1SxT4s=;
 b=PaHhBt3CLZ2JN9xsC36QHFOkJgbyJoIfmn+N5JBIL3ih/3++OSlk0SWL7vH/3PPbrzYo5HHYy
 JNSNvcNIQA4CHDSbHB8EYRVVKhhUxIGMnaM2Ljq3o1kL6pFxgfhlwyO
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=Woom8Nfv c=1 sm=1 tr=0 ts=6924293d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=OUK7M_EUaPGKAuIlalkA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: e_iwzrbVErS8FiTh_qUy4DMGLBBG_iuF
X-Proofpoint-ORIG-GUID: e_iwzrbVErS8FiTh_qUy4DMGLBBG_iuF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDA4NiBTYWx0ZWRfXxFrlt8JDlfdH
 06+1exLzG2JBzp5V3dRUNC+q+fptnvbP8DICkjm2ag9V1w6VjGK0Aqozp+ErssYVZwzwR0uR70s
 IcyiGGgRPKBWBqObJcIFIHqzFJKWc5sEV2CkGIhH9lFlriA98jfaYpnkdcCKmpF1g/yTQ4xaESu
 V7QGSgJudBG5meR6VyGsvZ1NUUlmbDj6FtB2o/SwnzmvsFbLblaOH4P7jdq3a9TYlUsHn2oB/o9
 /VLG/LsB3rSra2a+Vucx7/yLA8/439gudE/1Yw4a/a5bBke0rzFhBVniQARKHQjDAoOUZlespA0
 NtDpXCA1rOp4WpAE+te+2BB3t+Kb58MzViIKWLzrD+lXPwdMLvTIK/R8B5Dg5DcJYlW1ezHS82K
 eGhD49L0TEC3jwOAM5iiXw4c4Kqo4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240086

This patch series updates the SPMI dt-bindings and driver to add
support for PMIC arbiter v8, targeting Qualcomm SoCs Glymur and
Kaanapali.

SPMI PMIC Arbiter version 8 builds upon version 7 with support for
up to four SPMI buses.  To achieve this, the register map was
slightly rearranged.

Device tree changes are not included in this series and will be
posted separately.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Changes in v4:
- Collected Reviewed-by tags from Rob Herring on patches 1 and 2.
- Made following changes to address Konrad's comments on patch 3:
  - Moved bitfield.h inclusion for alphabetical order.
  - Added mask macros for use in spec_to_hwirq and hwirq_to_* macro
    definitions and updated their definitions.
  - Updated if() check in qpnpint_irq_domain_translate() to use FIELD_MAX().
  - Added helper functions _pmic_arb_read_apid_map() and 
    _pmic_arb_init_apid_v7() for common use between versions 7 and 8
    in .init_apid callbacks, to reduce code duplication.
- Removed pmic_arb_dump_apid_map() as logic for dumping mapping table is
  now kept in a single place, in helper function _pmic_arb_read_apid_map().
- Link to v3: https://lore.kernel.org/all/20251024-pmic_arb_v8-v3-0-cad8d6a2cbc0@oss.qualcomm.com/

Changes in v3:
- Split out some common DT properties into separate binding file and updated
  existing files to reference the common file for properties moved out.
- Also updated Glymur binding file to reference above common properties.
- Kept David Collins alone as maintainer for new binding files added.
- Squashed kaanapali compatible change shared as separate patch earlier:
  (https://lore.kernel.org/all/20250924-knp-spmi-binding-v1-1-b4ace3f7a838@oss.qualcomm.com/)
  into Glymur binding patch.
- Corrected comment formatting in drivers/spmi/spmi-pmic-arb.c to fix a
  kernel bot warning.
- Updated definitions of spec_to_hwirq() and hwirq_to_*() macros in same file
  to fix other build errors reported by kernel test bot and removed a comment
  made irrelevant by this change.
- Link to v2: https://lore.kernel.org/all/20250924-glymur-spmi-v8-v2-0-202fc7a66a97@oss.qualcomm.com/

Changes in v2:
- Split into two series: SPMI (this series) and PINCTRL.
- Included the DT bindings in this series, previously posted separately.
- Fixed kernel robot reported issue by including bitfields.h.
- Link to v1: https://lore.kernel.org/all/20250920-glymur-spmi-v8-gpio-driver-v1-0-23df93b7818a@oss.qualcomm.com/

---
David Collins (1):
      spmi: spmi-pmic-arb: add support for PMIC arbiter v8

Jishnu Prakash (2):
      dt-bindings: spmi: split out common QCOM SPMI PMIC arbiter properties
      dt-bindings: spmi: add support for glymur-spmi-pmic-arb (arbiter v8)

 .../bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml   | 150 ++++++++++
 .../bindings/spmi/qcom,spmi-pmic-arb-common.yaml   |  35 +++
 .../bindings/spmi/qcom,spmi-pmic-arb.yaml          |  17 +-
 .../bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml |  21 +-
 drivers/spmi/spmi-pmic-arb.c                       | 304 +++++++++++++++++----
 5 files changed, 445 insertions(+), 82 deletions(-)
---
base-commit: 6a23ae0a96a600d1d12557add110e0bb6e32730c
change-id: 20251123-pmic_arb_v8-669d7715d3a5

Best regards,
-- 
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>


