Return-Path: <linux-arm-msm+bounces-61843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 362EBAE104C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 02:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6E0317F538
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 00:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C3E730E84C;
	Fri, 20 Jun 2025 00:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VkSEFdfb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68001EBE
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 00:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750378765; cv=none; b=jknf+aDKq0YDIm2acAdUO20D86/r3YjA/0JHvi1O0ENIyJQbDjhJpfnZxiPHJOMGJi2/n7EmS0D2JBxJWFVgsJt+ggdSaE1+ZIutXVDGAnzflYf4u2qYU4v63BXrJTg86nghpjTzxLNjWSWYIOpYkMi9DWV3IXfDvG3FqzI3g7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750378765; c=relaxed/simple;
	bh=oly6xKQCtLgn6WK/bKqCbtoEQhZbg2smDHGYPGGVBf0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kpQxZye5sFUgQdszlnJ+rDFZ8brI56kOP9hNR/KlLq2MDhwVqh0Em5+ycLqMcbZvrmYkdVgFDOWyL48UVGQGjUfD+5H6cBiTkkHtnU42zHs4m149N7p+6hIum3Gb8pEgBN4K9qrwwsJ16jgxRAM//Ft19B0Q6toboa1XlE3Cydc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VkSEFdfb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JE9rrU019970
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 00:19:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pko1fJ5f913jrRVn+s2gvRxSCELMjEDtrtO
	I2RO3+4w=; b=VkSEFdfbvoMtdA640yXVvvKzCACRk7O+RcNXs/B9tEvbMx/Bdti
	8ha7rZvckxV1orN0G0V9dLwX4MDPtVm6XTF2Og6V1l9T4yYYqW2EQK4DMxsKtQpA
	+f81fgBF5RtToZK36GM0BHJko0M1ZFEqug0FMfwqdjPwE6YvhaYfrOfqDiuhMHEM
	zIfooPr4Go6dT7ECsZjRlKj9NBtsnt6CaRoJrqmGoFl187gfoJSRrzxB+dV6dzjb
	YXS6sq10p7OLbqhpq1v561Ya5pmWQWxT5N+Sn4Aw/cQAR0s1DnIkujLxmBkMTrGd
	qOR3TN5oaIG3t0KBE4OKOTgkPr+ip5iob6A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792ca9nt7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 00:19:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b1fa2cad5c9so805858a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 17:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750378760; x=1750983560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pko1fJ5f913jrRVn+s2gvRxSCELMjEDtrtOI2RO3+4w=;
        b=bdb4H3ZPJr0XYBqfo2E6pDYsK/+QkMWNBwp9W5ZICg1Cr4ZP0kfi0E2Z94ZP/6jxDp
         9TZXGvvwtw8SD5Nt5xzuVQ0kVS7TeK6ljo87H96noOuCyRtawM6bg1ZDKn5MhGpUiaVE
         tEQLOyBaer/1UC9i84fbrwhXKn1pDP66zSFGMfiyW5L1CT8JqYZ3moBkrjYoVEwC+lwC
         VhPpk6xlzqmu3kVHGF9uHKhBZw88BxIwiF3smCHJk5BcTyeoiYkdAzk41w7uTJNTqlak
         DojSn/t7OFhcrhbztn0PRZNLxLAPWza9QjlZl0GrRKv3yM79cm3xJG2tW9lekybU1EeV
         NxWg==
X-Forwarded-Encrypted: i=1; AJvYcCVh9yX/gkztY0tQJISdHeAmBXnqmrDsJekF2j81vaC4tahie2B4RbwRDu26Ds/j8C7rwgIEBnnBfeChW39B@vger.kernel.org
X-Gm-Message-State: AOJu0YznDuVwvsBQW6q/qxDlh2Tb3FJPwaK+xhgzABg1z3knx5A5YrdU
	PJYRT5CZyuVRd8jgAWvoi/htadHN8xNiaNHr6VxxQD+vkD56dxUfnuXpDcrWrxYNoigz8HuFK8p
	e/5r+22WJV+Qkj1EoC3vhD6lFJhOKE1tiIDiKRK/SMoFKoXVAkr+79OWK0yZdFvt8cdCF
X-Gm-Gg: ASbGncs+wMw0zMObhdV3Rcr3jX+6a3dIXQr/NlN1JBNb9qBUu9/jf1hdQb92HdAhn1B
	A4Buyz9R+Ks9gPU9N0Qp551uXSX/Ziqutu4eGKZI3SHgCaJZ/hSbgf+Y/XBao0FOqgpBOPGSoDx
	tbYlOXumS+8gpCa8tmw8quVzNKE2hC3xqM+Mtd6ZMgbsadNxkRxg5bGg/4t4kOzKZh7mHqDzzPI
	Qlv1T0eZGM5s9abs9Xhlc/zQH5klKDHQ+uXhJNE1KfIVDp5/GFv2/tfhnPCl67uCBPh0kl9qbO0
	HvYLTkvuV2rKo+Gzv64jMobsASlpbd4VdAu+jDysCvUl59kcsGqEtJ+5s6USzcPg4N9Ik/JVcE2
	hQBG3+Y8r2A==
X-Received: by 2002:a17:90b:3f8c:b0:313:2adc:b4c4 with SMTP id 98e67ed59e1d1-3159d8ded87mr1783499a91.24.1750378760357;
        Thu, 19 Jun 2025 17:19:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS/bNyMmpqZhoJ8zKSQMa17rVXP9ofotHQAiaMpr7KV+H2FeaMMCcNL2skFmms3dBEQH8uvg==
X-Received: by 2002:a17:90b:3f8c:b0:313:2adc:b4c4 with SMTP id 98e67ed59e1d1-3159d8ded87mr1783462a91.24.1750378759808;
        Thu, 19 Jun 2025 17:19:19 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f1258932sm410011a12.64.2025.06.19.17.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 17:19:19 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v5 0/5] thermal: qcom-spmi-temp-alarm: Add support for new TEMP_ALARM subtypes
Date: Thu, 19 Jun 2025 17:19:13 -0700
Message-Id: <20250620001918.4090853-1-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OL2N1OgjggRqdMf7zFS2LtFjjh2Khbd-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDAwMCBTYWx0ZWRfX1cVjuozW2f+p
 M057VRk1pnAWOTGldBjz+5AcL7dTKUV1kowcaWuNUK+n/QdUGLxyYDD4MYc3drsTLBi6G9ryn1x
 t8SSXtExfkyZ7rRFNWA8uKP7FMiP38AcKEIuhB6BvkXOPVhzIZmmq9ZFNFiS4Q9rc/tJOs4AqC9
 eIuKHxJkLpmuV0ISyrhlnXmiLSVBSV2qODuO77XeieWMGK/QuhbbIKSI6lsGwzh9Rwlqgan4CPL
 7T9JXn9y80PmeeCjez8rFA1rQqBF68HoywKUSwBd4LI7yB0gxBt/ze4UvE02CDvsJK7UWTITzp3
 6nqssHn8oBIZDQajtuj369lPn6GrCKL5zHLsEeg9W085uC5yvly2lU70oCETJuv32ncrSX8BqZX
 SqiQutGWrBTOQaoVjhSN7zrwna4z/Bm8Jm1yOES1u8lQxThTXnl27L5b2iFSdlkeitl3DBRL
X-Proofpoint-ORIG-GUID: OL2N1OgjggRqdMf7zFS2LtFjjh2Khbd-
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=6854a909 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=p-nOP-kxAAAA:8
 a=EUspDBNiAAAA:8 a=R1SgPpZEabuFLtygwqQA:9 a=3WC7DwWrALyhR5TkjVHa:22
 a=TjNXssC_j7lpFel5tvFf:22 a=XN2wCei03jY4uMu7D0Wg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_08,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200000

Add support in the qcom-spmi-temp-alarm driver for the new PMIC
TEMP_ALARM peripheral subtypes: GEN2 rev 2 and LITE. The GEN2 rev 2
subtype provides greater flexibility in temperature threshold
specification by using an independent register value to configure
each of the three thresholds. The LITE subtype utilizes a simplified
set of control registers to configure two thresholds: warning and
shutdown. While at it refactor the qcom-spmi-temp-alarm driver to limit
code reuse and if/else statements when deciphering between TEMP_ALARM 
peripheral subtypes. 

Also add support to avoid a potential issue on certain versions of
the TEMP_ALARM GEN2 subtype when automatic stage 2 partial shutdown
is disabled.

This patch series is a continuation of older series from 7/2024
(https://lore.kernel.org/all/20240729231259.2122976-1-quic_amelende@quicinc.com/)
but current series has been reworked to address the change in thermal framework to
update .set_trip_temp() callback function variables
(https://lore.kernel.org/all/8392906.T7Z3S40VBb@rjwysocki.net/)

Changes since v4:
  - Removed the unnecessary thresh member of the qpnp_tm_chip struct in patch 2/5
  - Updated order of logic to limit acquiring and releasing lock within
    qpnp_tm_init() in patch 3/5
  - Fixed misuse of signed vs unsigned integers in patches 4/5 and 5/5
  - Added Dmitry's reviewed-by tag in patch 5/5
  - link: https://lore.kernel.org/all/20250528235026.4171109-1-anjelique.melendez@oss.qualcomm.com/
Changes since v3:
  - Updated order of logic and made dig revision a local variable in patch 1/5
  - Updated Locking Logic in patches 3/5, 4/5, 5/5
  - link: https://lore.kernel.org/all/20250320202408.3940777-1-anjelique.melendez@oss.qualcomm.com/
Changes since v2:
  - Updated function name to include "gen1" in patch 2/5
  - Added Dmitry's reviewed-by tag in patch 2/5
  - link: https://lore.kernel.org/all/20250225192429.2328092-1-anjelique.melendez@oss.qualcomm.com/
Changes since v1:
  - Remove unnecessary moving of code
  - Added new v2 patch 3/5 add a preparation patch to v1 patch 2/5
  - Updated temp alarm data function names to be consistently named
  - link: https://lore.kernel.org/all/20250213210403.3396392-1-anjelique.melendez@oss.qualcomm.com/

Anjelique Melendez (4):
  thermal: qcom-spmi-temp-alarm: Add temp alarm data struct based on HW
    subtype
  thermal: qcom-spmi-temp-alarm: Prepare to support additional Temp
    Alarm subtypes
  thermal: qcom-spmi-temp-alarm: add support for GEN2 rev 2 PMIC
    peripherals
  thermal: qcom-spmi-temp-alarm: add support for LITE PMIC peripherals

David Collins (1):
  thermal: qcom-spmi-temp-alarm: enable stage 2 shutdown when required

 drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 579 +++++++++++++++++---
 1 file changed, 510 insertions(+), 69 deletions(-)

-- 
2.34.1


