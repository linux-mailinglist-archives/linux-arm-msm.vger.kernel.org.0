Return-Path: <linux-arm-msm+bounces-84041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B9EC9A5B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 07:43:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DF78A34487E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 06:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89D43301473;
	Tue,  2 Dec 2025 06:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PFzwFoIg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ajoJulAo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB6E2FF176
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 06:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764657799; cv=none; b=jOJ+wu/StvFkpxkZMl1RQQ8k25Kxcw4PJITmwKuo5tQxCH3+OaNF2NBh7p94QBFv+3opvOuk0pjuj6NK/uPugRtRYXz5G5pgGlKvhkKMxnky2kmK7rHDLLvP55p09ndcYpW0WaNnaa3HbuploaxqJTz2jZzj4MEMkKGESKStW2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764657799; c=relaxed/simple;
	bh=hg393qa4WowvY1wSgSubo4QC9Dr0Pfdv2DwRyxTPtgw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ddz8bfKYZBKyCGUAkLL7D8Inv2ir+ozWriL/d4QuHmfXyoumJE5D54dTp4MbeCTpPLsp+juVVnx/B/vvPIW2oxST+4xyviTttq4/d8oDC3/Ap/5BLT5Ofo01OlmvY32vCrRDOnp+jlj7CxC6vLh7Ta+BW3hRSoZ/uY7HyvRLHUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PFzwFoIg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ajoJulAo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B22kl271093016
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 06:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jF+dv23Egm8ORgXvS1vXPe
	fxbBKc8v5jVIo48yAirzE=; b=PFzwFoIgvqyTEi99DCD5HTXkTSlZF4GSdnLuv8
	fAhEfH97DdDDMHxV1HRIV/QdoU2/e5xOovl+D/yFTJHCvDCxVmlK8ZJGGDrLERk0
	PbXt63H+5HrXsftw/vMybeY3dHiZOGHWBR+0WwNFJ1l5iI4IEMDqgR8yjXOqtIEq
	3fJsGYqRbm9VsJzzrA4U1JrJFIfXg0LhbY71luwNEYp3G1gjyjiA4UYeyK/AGwuy
	d3v5Z7/xVpexlRrbdtZj7SRvuMlJWBgIQDPhfFj/i5y22MFWhQtkguZOfF70KQsZ
	mLKNYG5Iri0y6nFsKOw8rE73cVj+V28W28GOpqoElaJjhILQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asfu126mr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 06:43:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297dde580c8so133844315ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 22:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764657796; x=1765262596; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jF+dv23Egm8ORgXvS1vXPefxbBKc8v5jVIo48yAirzE=;
        b=ajoJulAo48+uI5xeAcGqyx1k/kjHf6vhuLlZcP/ISTG3IWx2FxJV52O9VEsdGtIrMz
         7x7MfdtqKFDsYLWzGiXZr/+8vkWO1k9vl6FJT3Xjr/Lmu/83qqLCnivCJgYYIAxOGJMt
         L4C/Ht477kmYP4AWCEbACH2kry2geGgBuZjIA1WYXuVA0dkYdCkj6i8iZoqFZkIDCOmM
         VeLhry/rOXjruC2gc34tncDrgF1QeNyl7LWhD7UZRSfHvNJ4Xx+m9/s1SmS9AqLSSIe3
         R1FLLITkB64j/aLtLKxADodtBYXQuDnqq8bR2KGgtpYWEhtMlByqyaeDArd1eTJaTKoq
         UzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764657796; x=1765262596;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jF+dv23Egm8ORgXvS1vXPefxbBKc8v5jVIo48yAirzE=;
        b=rbBya8AGh44qfVYAqRetcivM+UlPeZtpyEELiQYSORvGCWfSQPbEw9shF8OXXLypVn
         DbWYmNgbxxgPu4ZZjyOxpOPf/Us2hZVwf3MGk3cHQIjn41ptbxr1wB/mzgHYDs7qSjN9
         K+T1KnvSZ1w0TxpH7LCXJNQW7uuxcxNU9IF1M1dFJG7irHFF14T40KohGOTMVtXfbVaq
         Wt3anrbQAkZKTwMvPFHCf05hqyG2XXwuknpEpT09ok/tW5wx9EgKz+ricxDWmrt1zknZ
         0weWiWoPBPoM77MFpv9gB8zG9NCIc2zV5hvReCBS2oeFw92WeIF6wZE0MzP7+qz1FByi
         5FYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKhNRbR+DZcFxOrWRZ5ZgZ4kyyGzgbnQ6EIlij5AVWPncxW8KfT8lklTjijGR53lSyDyj7PotX+zT+jj45@vger.kernel.org
X-Gm-Message-State: AOJu0YzRU+ooKMB/5/pnXUiq5+jg/Y8ExMQfN4tmgrR2IrXBaCyKBF1r
	+C+Xhf+GoWybiGqbpsWsaZmuIjytf64bxTx6LC1P3IkX7pRK1yUMBKonrLx+DY7+ojCKq18u0k1
	YT7u91IEQKfttnN7EKTGtQrvwXNQ1SdvMOVDOVr++gzzJUOUfj6fEzwHXIJDrP0ZTl60G
X-Gm-Gg: ASbGncswBGloKvhVzSYkiBfpa9yeqFvrPDvXdR6lEqY/rz0uwEjE6Sj+BZtIgryLsm1
	3hTtZLIr9CTZhiR9qSjeSiN0DI3PiatKn72M/Pd1qtdf2PRCj/dWkDo7vlqAr3FlHjCS63HnhIb
	Iq5Jq1RyKcwlD1ApVgzKDBiVpo9r6PSntRvbipNgfaYJxKo2pKQ4fDBCUMVamjb2yvnjyXQAYCw
	9h1m1k9j6EGQAgfS2KgV+jOoWsdxqgRZKGs/j5DBt75jGX7QgtZmfADt4KuZdMmMUQ8aQYO36Kk
	8Sq/2Y5s6BdLHnZpRK8Jw4kfkU+WrVBXqt2VEqyUIJveXjbxSYO4Y0/LWbpN365rtYkZuqcNOZz
	85A9ZLAAHEAVnLeXtMdamZNI0K9H+veggU1vTWaOV/zHnKRK9Nx7ely+bI4NFnZcGkdVub3pQCQ
	LGvQ==
X-Received: by 2002:a17:903:360c:b0:298:450d:6926 with SMTP id d9443c01a7336-29bab148b39mr315620905ad.34.1764657795590;
        Mon, 01 Dec 2025 22:43:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvYeVsKcBWthLpi0x84eJ6/7UrtySaWZso/bO4ItERgBVQlT0J5xWM+Qr4OQyyW0znGxoyBw==
X-Received: by 2002:a17:903:360c:b0:298:450d:6926 with SMTP id d9443c01a7336-29bab148b39mr315620635ad.34.1764657795027;
        Mon, 01 Dec 2025 22:43:15 -0800 (PST)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb450cfsm141821675ad.74.2025.12.01.22.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 22:43:14 -0800 (PST)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Subject: [PATCH v6 0/2] Add Qualcomm extended CTI support
Date: Tue, 02 Dec 2025 14:42:19 +0800
Message-Id: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEuKLmkC/3WMyw6CMBBFf4XM2hJoZXis/A9DTGkHmUSotkgwh
 H+3sndzk3OTczYI5JkCNMkGnhYO7KYIeErADHq6k2AbGWQmizyXlaB1psmSvZmZhep0VZSIsu5
 LiMrTU8/rkbu2kQcOs/Ofo77g7/0TWlBkouzUuVakUKO8uBDS11s/jBvHNA60+75/AVpRW/GvA
 AAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, quic_yingdeng@quicinc.com,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764657791; l=2923;
 i=yingchao.deng@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=hg393qa4WowvY1wSgSubo4QC9Dr0Pfdv2DwRyxTPtgw=;
 b=wcqDUIuOlcN48PcoSh60fElR7YS7cSyZhiM3/r0gz9KDcL13hQ9qp6k3EK9VM94mhsjTiij2b
 ijP3HAfbUxwChP0W3ah7NbP9SXH1thi/0mqe+v/3l/Dg7+daVew61RF
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=QWvd9DuX5YKvc7/VfWGCElGNr3HbCyig5bEb+lUUohg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA1MSBTYWx0ZWRfX/bV4V0NPyKsL
 70FtZFl/4GVsSGm5KBVk/jgPEgzhVXDfjSFBxT/csksZi1G34g/w+Ltu04oZJV48Rnpv/9q3ckD
 ED58o/l3xLkL61mPQL/THyChF4XCuSm7cZAt8X22sNODkfNHSn11EAeiUeDpGa3gSzP+DsZrusP
 fzUoBKfNhjpQfq9OcbR7V7AUGGjNM7EK49BGWvBiddVvFnxYP/u4lUAsKWW1Ia1c6LNAfZfsVkr
 ibToTRT9mCxgBd7ErmWewuzCu/w5JGd80JClSo/Z0252yeJFs1T4364x5eo2m6lJfwlexJprjcb
 1FwUcanzfvq3rQ0aGw0B1VKdxrilUvUcAK5Y55Azr6Rs1zP0jhKfkSqE8GsuFIZiUZHOC19hVnx
 6MIB6OIdxbYf49g1HYgfan4peA12Qw==
X-Authority-Analysis: v=2.4 cv=BJW+bVQG c=1 sm=1 tr=0 ts=692e8a84 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=qu_5hfJKU6GsaiMghqAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: c-xvVkejFbj1n5GoyRl__9BP19xKRR6a
X-Proofpoint-ORIG-GUID: c-xvVkejFbj1n5GoyRl__9BP19xKRR6a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020051

The QCOM extended CTI is a heavily parameterized version of ARM’s CSCTI.
It allows a debugger to send to trigger events to a processor or to send
a trigger event to one or more processors when a trigger event occurs on
another processor on the same SoC, or even between SoCs.

QCOM extended CTI supports up to 128 triggers. And some of the register
offsets are changed.

The commands to configure CTI triggers are the same as ARM's CTI.

Changes in v6:
1. Rename regs_idx to ext_reg_sel and add information in documentation
   file.
2. Reset CLAIMSET to zero for qcom-cti during probe.
3. Retrieve idx value under spinlock.
4. Use yearless copyright for qcom-cti.h.
Link to v5 - https://lore.kernel.org/all/20251020-extended_cti-v5-0-6f193da2d467@oss.qualcomm.com/

Changes in v5:
1. Move common part in qcom-cti.h to coresight-cti.h.
2. Convert trigger usage fields to dynamic bitmaps and arrays.
3. Fix holes in struct cti_config to save some space.
4. Revert the previous changes related to the claim tag in
   cti_enable/disable_hw.
Link to v4 - https://lore.kernel.org/linux-arm-msm/20250902-extended_cti-v4-1-7677de04b416@oss.qualcomm.com/

Changes in v4:
1. Read the DEVARCH registers to identify Qualcomm CTI.
2. Add a reg_idx node, and refactor the coresight_cti_reg_show() and
coresight_cti_reg_store() functions accordingly.
3. The register offsets specific to Qualcomm CTI are moved to qcom_cti.h.
Link to v3 - https://lore.kernel.org/linux-arm-msm/20250722081405.2947294-1-quic_jinlmao@quicinc.com/

Changes in v3:
1. Rename is_extended_cti() to of_is_extended_cti().
2. Add the missing 'i' when write the CTI trigger registers.
3. Convert the multi-line output in sysfs to single line.
4. Initialize offset arrays using designated initializer.
Link to V2 - https://lore.kernel.org/all/20250429071841.1158315-3-quic_jinlmao@quicinc.com/

Changes in V2:
1. Add enum for compatible items.
2. Move offset arrays to coresight-cti-core

Signed-off-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
Yingchao Deng (2):
      coresight: cti: Convert trigger usage fields to dynamic bitmaps and arrays
      coresight: cti: Add Qualcomm extended CTI support

 .../ABI/testing/sysfs-bus-coresight-devices-cti    |  11 ++
 drivers/hwtracing/coresight/coresight-cti-core.c   | 153 ++++++++++++++---
 .../hwtracing/coresight/coresight-cti-platform.c   |  16 +-
 drivers/hwtracing/coresight/coresight-cti-sysfs.c  | 187 ++++++++++++++++-----
 drivers/hwtracing/coresight/coresight-cti.h        |  60 ++++++-
 drivers/hwtracing/coresight/qcom-cti.h             |  29 ++++
 6 files changed, 369 insertions(+), 87 deletions(-)
---
base-commit: 7d31f578f3230f3b7b33b0930b08f9afd8429817
change-id: 20251128-extended_cti-3ba8576629f7

Best regards,
-- 
Yingchao Deng <yingchao.deng@oss.qualcomm.com>


