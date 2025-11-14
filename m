Return-Path: <linux-arm-msm+bounces-81756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A35C5B219
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 04:30:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 87B2F346FDE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 03:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2AA2263F4E;
	Fri, 14 Nov 2025 03:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ByKpZjts";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FTe/7zDC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267EB23EA87
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763091008; cv=none; b=onnNlKI80x9zrJ0kWhQkQs4gpiRvh/PfT2oUT8L+yD50By7863TBR+9xymoc37q5twhagc2CtWhaNFCNqpSFqJOD0AUH/iZYyWJw3wRCB1KqgrnRJE8iiP8t919DpJlm/bA4jX9Dophcz/Jn8604YnkaUWP+8j3jfL7TDGZmzOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763091008; c=relaxed/simple;
	bh=D1FTubn8zn/ISwZhvZltuSVtAxQZXI422WrxEw/o5ag=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HLo5cUdwoZlwPhGusFckj7aV4h6W/Bv52c1xtY5z/xie5DAZzlSnUOi66e3n7DqpEIX1+4q9Or2X5qnLjxwTHmzz/mM8rAuRBsHOAjBuhAY+YMbiXNaieqnoVbspmKpq3cFX0ptixIaZiQEDCwPK7tZqOExMra+tuZMca8IOaXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ByKpZjts; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FTe/7zDC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADManDF1699548
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QG3yb4cCXrpKVY/9okD8mW
	vorCK6PfJNnIXtzAbkBlE=; b=ByKpZjtsK6qtbvdQ4nr6n0qoFR/uDcw0C5udi3
	/UcC2hLatYwJXk0EJ216pBxYikhh3kP0nWJNiP9HDQOHEJmH/7tCyDE2O+vCAS4P
	gYMPxs+5DtdLoLGeCRA4j3i1K97JZam8PQcugaXcewrYrqS7rHIEW7TD/iGUVaeT
	POPWqy0xrI4McpFJ0W/0ZpLG1QO2NVexwmfAcPizwwQ7xUUjeHpGJtcoWSbWvMGH
	eUOm/i5dxsL35ULn0mG+Qu6RvAfDZCcneAhaHYO/HbE9dI2NKsZqeaoqjeDC5OhX
	ZW8PWpyLxjXNAD84vhIXlKZOK9ET/VTTD8eyIzN5Cu1NauBQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9e0pgr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:30:06 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-bc09a8454b9so3228667a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 19:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763091005; x=1763695805; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QG3yb4cCXrpKVY/9okD8mWvorCK6PfJNnIXtzAbkBlE=;
        b=FTe/7zDCsNZyuEqs3WKspd41P1Lg9Vzdgm1UjTvNHb+5r2gJ/kN6ugAs7WGVoB0e8F
         UG00vaTKVNPRYkwMOOIlTPVoYY8UtRPYz85r+Lzxwp4apqCmSfDxZmFWQn4nShywzFTs
         crtMiZ5IXDdxsBj495J/WX+TR9Lrl8ye4Czzp+whnzWK1/r32A0mW/iamLE5HxPv0nDs
         ylmYkB49oyP/PDCTeT7B3mC2YY/+2B3jMCUOb/AHvtDvX5I7u5AMoANSsx1nxgoBzF+y
         wJxie125+uK+uRjKRQYe08V8WpeR7NpKdmkyZYcjg7lmZoIS7R8h/ujfs3ZeQv7pC2zP
         uFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763091005; x=1763695805;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QG3yb4cCXrpKVY/9okD8mWvorCK6PfJNnIXtzAbkBlE=;
        b=V2F/1CJCw548RF73FH82UVmggCn8yeWqO4WSacANzA6T4+KglGLDNBqiyRF/m4PASQ
         NtkWug+mZnsO5vGNb/EqdvdWd7pE57LD/q32mWWcsGZQuAd+kZAyCHFWhkoM5zt6iNGX
         fMBS+U/kpWJzSfj/Opq5rWCyOI9S0Gu2Kkn+cy5TrFUZ2CmXsfzG3PU8deSOTGrp7lEG
         MNRS106g0ZmGgiLTp4Cl5NB8GPgl+aZa2MnKo37afe5pLZT1PzogfCSD9Z2Xh0VQjs/e
         IHl0hylhj9p42q5RVslNjwsm2ok5YxN0kMIc/a49g7HGUFGobkPRmuOoHjEQkiQohE+G
         uIfg==
X-Gm-Message-State: AOJu0Yz6EbeLjtj/AmHtufCvGr1pEk1am9bfLTts52nZGr7QX2gh2Dec
	nlcU3C1ipuflWT1wlX6X2kgVaQw+BXLOHtZ5xAF3lkrMjJRixt9D4h3NUi0+FUY9nmOETARF1Ds
	4mmbdMB3Bpbe0oAzOj9NYlTDiryyYheJ8VldqQaToGEP+MK7p9ulcH6o3/+5q9tDvZTKtA4HmR8
	Kr
X-Gm-Gg: ASbGncvwgpqL5oQUI47jUqOnISlUeUjA1PoevitfJae1GGxZvHPpSFFs3Lafw8Glnuq
	/dQKaRVCaaewGad/3kVh3RXUIgUQxNzf9QvAVCYMBlQ+bkRZCAIzxPSqj7nPWyj8IATtRK45iNY
	WX2xEVl/zWOUBDnQL6zF0EYMh8XpPstljeCxhK1U6ryj4DP9aN2WZsJrJfODliHylyalAzUm2Ps
	O8z6AtqvGjwkxeBonv4HidCWcg7xzKFunraNeKOH1PKo/KDBbYiUgPE1dIraFvPQzxI89YNB8oJ
	LxN3Rx5uFhdrrpyyZxN1sifwAR2nsr4R5/un4is2epUfeUkwx0qOS12e2C4a7o/sos0bNTomQpg
	GpyB2kv5QwMWRZClfp4u+Gn7k3IkoAX/c4kY3c8z6R/eUc12iu3vhgA==
X-Received: by 2002:a05:7301:5f17:b0:2a4:3592:cf62 with SMTP id 5a478bee46e88-2a4ab8635d0mr474907eec.6.1763091005240;
        Thu, 13 Nov 2025 19:30:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFu3U2hyC+nNF4ju1H86N6KLUuoagJGQQx2m79/H1a+sBmnUlalVM18cW7lSKu04eCvzBCPvw==
X-Received: by 2002:a05:7301:5f17:b0:2a4:3592:cf62 with SMTP id 5a478bee46e88-2a4ab8635d0mr474891eec.6.1763091004550;
        Thu, 13 Nov 2025 19:30:04 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49db4a36asm4104108eec.5.2025.11.13.19.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:30:04 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v6 0/5] media: qcom: camss: Add Kaanapali support
Date: Thu, 13 Nov 2025 19:29:17 -0800
Message-Id: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA2iFmkC/43SzW7jIBAH8FeJfO5UgCG2c+p7VD3wMTQoNriAv
 a2qvvuO02rXh0bKwbZA8Bv8Zz6bgjlgaU6HzybjGkpIkQbHh0Njzzq+IgRH40YwoThjPWjnoCz
 znHIFnzJYPZUCKcJF66hnPQZAZY7OOCXYgA1Bc0Yf3q9Fnl9ofA6lpvxxrbnybfbKs0FIuMR5I
 2HlwMB0wh0domZKPqVSHt8WPdo0TY/0ajZqFf+2c8blPadbBcledVIZLZz3ww253cmivUtuSWZ
 CGztozjrjb8hyL9+V6CpJ7tDIXtp+UL26Iaud3LK7ZLWl0SMXBnXrmPhF/vq+w4xvC/VH/b7I/
 +1xOvzEL2ApCJPONkFN4DCmSgsmTcvM4j1miMtk6GMNWtZx08v2eKIW2HfbjtvOH/EP2DHZC4Q
 Iq9/8as8hvsJIbQRCecOx7Xorh1uS4LTpgmBLmM8fUKquS6EpmxPQQ5HMo64U0ASqHZizXPQa8
 Yczmn5qCyPU0yHiO9W8NivvKJmvvwpZEBpBAwAA
X-Change-ID: 20251008-add-support-for-camss-on-kaanapali-e5b6dbd5209e
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: GvzerlRIZk42HR4mnT8GXPFVvCMt1CGn
X-Authority-Analysis: v=2.4 cv=SvidKfO0 c=1 sm=1 tr=0 ts=6916a23e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yQDS3Gn8WMEx0jDyfooA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: GvzerlRIZk42HR4mnT8GXPFVvCMt1CGn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNSBTYWx0ZWRfX+cw3Sn/OcMFG
 qVeBdcc9axTZzo5ykzoGrh1TmNt3SUzVe77aXehgUumfx0h+I+KGdl/42D8WFYKxaY7lNBa1Fs5
 aBQC1+LySFhOXN9blYzbrOC7XePuLCo3keqC1kOElSkARA8ZWQIRK/TkR4L76m7wCPF2B4n8zDB
 /52hufZM1emariY6MzQ/9y/BTQKUiaoAmu8fFDncUB++dhEVZ53chJUKIm9KrtHXs2iiQaDvDXz
 Lc4coMz91o+QcaJmeFmEW+fOexvWRJQEXHk5hK7FFXEO/kjx7l2FggQlBMK5sld3Yo0GggmkYG7
 agkAHDeayShd8o0UzrA16GSbtNl3G6A2s/1aL8vbR6zHviFoXcKZ1kLcYdjIWeVXCaaUoWgpL3X
 mKh8jJrdgSiXb3D+vQwaVkB/XO1BCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140025

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
- https://lore.kernel.org/all/20251023-make-csiphy-status-macro-cross-platform-v1-1-5746446dfdc6@oss.qualcomm.com/

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
Changes in v6:
- Modified the bindings to represent the whole of the camera hardware on
  KNP than just what is exercised by the CAMSS driver by extending the
  descriptions and the properties, the regs, clocks, interrupts, power
  domains, iommus etc. In addition, use the word 'vfe' everywhere in the
  bindings to be clear that all of those resources are referring to the
  same front end modules. - Krzysztof/bod
- Change camss vfe power domain names to align with the binding file
- Link to v5: https://lore.kernel.org/r/20251030-add-support-for-camss-on-kaanapali-v5-0-f8e12bea3d02@oss.qualcomm.com

Changes in v5:
- Refine v4 change log - Krzysztof
- Fix typo by removing redundant numerical version in kaanapali camss binding
  comment description - Krzysztof
- Add missing tags that should be posted with v4 revision - Krzysztof/Andi
- Link to v4: https://lore.kernel.org/r/20251028-add-support-for-camss-on-kaanapali-v4-0-7eb484c89585@oss.qualcomm.com

Changes in v4:
- Add detailed hardware descriptions and revise message title to follow the
  standard comment format for kaanapali camss binding file - Krzysztof
- Format kaanapali camss binding file to keep style consistency, by reverting
  power domain name from TFE to IFE and keeping clocks name order as last
  generation - Krzysztof
- Separate the 1.2 and 0.9 voltage supply DT flags for each CSIPHY to allow
  for arbitrary board design with common or unique supplies to each of the PHYs
  in kaanapali camss binding example, based on v2 comments - bod/Vladimir
- Link to v3: https://lore.kernel.org/r/20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com

Changes in v3:
- Use the name 'ahb' for 'cam_top_ahb' clock in cci binding file - Vladimir
- Reduce and simplify CSIPHY supply, port properties in camss bindings - Vladimir
- Resolve the dependency issues in the camss bindings file using ephemeral
  DT nodes - Vladimir/Dmitry
- Update hf mnoc name and bandwidth values for icc module - bod
- Split CSIPHY status macro changes into a separate patch series - bod
- Add clear functions for AUP/RUP update in csid and vfe for consistency - bod
- Clarify why the RUP and AUP register update process is deferred - bod
- Clarify the necessity to keep NRT clocks for vfe - Vijay
- Link to v2: https://lore.kernel.org/r/20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com

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
Hangxiang Ma (5):
      media: dt-bindings: Add CAMSS device for Kaanapali
      media: qcom: camss: Add Kaanapali compatible camss driver
      media: qcom: camss: csiphy: Add support for v2.4.0 two-phase CSIPHY
      media: qcom: camss: csid: Add support for CSID 1080
      media: qcom: camss: vfe: Add support for VFE 1080

 .../bindings/media/qcom,kaanapali-camss.yaml       | 639 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-1080.c    | 382 ++++++++++++
 drivers/media/platform/qcom/camss/camss-csid-680.c |   1 -
 .../media/platform/qcom/camss/camss-csid-gen3.c    |   1 -
 drivers/media/platform/qcom/camss/camss-csid.h     |  11 +-
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 124 ++++
 drivers/media/platform/qcom/camss/camss-vfe-1080.c | 197 +++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |  10 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 352 ++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 12 files changed, 1717 insertions(+), 5 deletions(-)
---
base-commit: b09b832c719df5e10f2560771fd38146f2b3fd7c
change-id: 20251008-add-support-for-camss-on-kaanapali-e5b6dbd5209e
prerequisite-change-id: 20251012-use-marco-to-denote-image-buffer-number-cbec071b8436:v1
prerequisite-patch-id: 3ac5d6703a9530eda884720c146b9444f90cf56b
prerequisite-change-id: 20251012-add-new-clock-in-vfe-matching-list-25fb1e378c49:v1
prerequisite-patch-id: aacb03b359fdf95977805f42918c0b6c39889e32
prerequisite-change-id: 20251021-make-csiphy-status-macro-cross-platform-5390dc128aee:v1
prerequisite-patch-id: 27c2ef96f0e747ec6b4bcf316d8802356e4cc3f4

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>


