Return-Path: <linux-arm-msm+bounces-86295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D17ECD88B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 10:16:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE3AD3018D50
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 09:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C3D31BC85;
	Tue, 23 Dec 2025 09:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IMiX9cOA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fr6tb58J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3041FC8
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766481263; cv=none; b=Ij8R/sUWCHI4gHNkqPwRhjEMJ2aIOoqs5eT6SKYrsDME7QoWfzSZs2PahzJiFJL59R50AORaQFbMYkqUlBFvqjXrupt+AK8tlAgB93B6EJH+Ub2TaVJYIUkm+P6ViIl25Q4T8jdQGc2bcHORnXwT35vCZ4koejnbuXhFwpzLIls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766481263; c=relaxed/simple;
	bh=l0prRypGfOLngy3f8Ji1cHlq2eAPEXkQ+7O94syJxxQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SxYIPAy5WGHVJofveRZa0/2aa9MC/hLhBcNefHcxfK0VC3ZyZLDKmvi7cZzyK85U9TTZHZjNB9U5pxkmw0bKe+SFP5A92eK28HHhDSRYJmJOoCo3JahoA/XnSIgP6PVXhseev5Zk7xiaqlw2qWqeLVz40vpfP4yuMc11ve6KakQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IMiX9cOA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fr6tb58J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN7QulV1630700
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2Ip1/prO6zRTqnoDW6JM8I
	QS6nA32OGWDdc4HypKQE8=; b=IMiX9cOAhr122E0ucUJCFyw/047LIGZHZFqHPq
	MJr4ccZ8RbLd0tPMrMl4/X4EYe+jS1chcyDho5hwbTbrYOKHDrgO5zMRvTwVAh0t
	+xQw/4qkfvL7spxlXbbw/+rpn4Y6bQzshnGcX7btL05yfTZ+L2O5Hloo+igxaoVN
	L8Ele2LFEsoV2yF023A7KoDs+T/mYEIn614x/9UR4rWb8kbJrmZF/dVzbCJryFSH
	R5+ECgyRAF42fduVQK70AkViLMslUdNJHqdOMd4RkNeDF04s9IUxfnW76DRtq6Ug
	ol039A/aLmCddD+xb807GKP9nlQk6YlREs8HBVMRfarw3tDA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7ck8j3vd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:14:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a31087af17so71736085ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 01:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766481259; x=1767086059; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ip1/prO6zRTqnoDW6JM8IQS6nA32OGWDdc4HypKQE8=;
        b=fr6tb58JIdMaFUx3jlQwcXRy+jalysHi4HHlBHHA/mMvpLyEseGqOOp5of3MHor8o3
         bs713PkX8NAD/B2xIpudf8XEEKxUloBWlR35QAkTEybeVei9QzQfrdrfMRXltVbaj4ie
         68DDAlmyAYIjf5mWPtneOpMpbN9TYVe/d/Bf3tRYS7/DWJJFrUG7MlO4HYFA9TjSF4kf
         TNTwyJ0fbhPBlQuZNteurXtpH4/BCHh9SqiLze4taEYlmwcE49qiSaPKqJSRRWs0vYzw
         9cG7JgWhMqv8SgDmiFlJuZcRJgEXPk1xUSUgmNG4yKxdX3n3tzA1DVDt1MVP1/55r1VP
         wcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766481259; x=1767086059;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Ip1/prO6zRTqnoDW6JM8IQS6nA32OGWDdc4HypKQE8=;
        b=Fc+TE9gT5DEVTQvdb5DOAegrz+6YWqSkijgxOjW2oT9VxlADZ7LLXczeTRYRJuYhsU
         b/Wyr5ynKhXqWfN7Mr0IJKaPynPiTIfPcwZGS7vjJIQppO9jcR3cwNBt8xJPIT5Gf7AM
         c1p0rSZYuBLAiydxch3YDv1qUOh/ikGdmoKFlO5TdvvHu6Gz9u3txpI0S/XNtllKNYHl
         MgC7WvA+Swp3MRZ/tySgGI72VdpdAejCXGAfAnq6XGblspiJqOJ/q6tAUsUach0IpheP
         VOcklqnl2kbUaWRvy/M3cBSdLsJFHbUBqLI9QFQ6jnRLSmJjP9OwU8Ok1jBq/YNvZrWN
         ONZA==
X-Forwarded-Encrypted: i=1; AJvYcCU9aAWSbhS+GuB4b9tRfsqHcjttByYuj7gFjaeWODOzHOZ2Glzzv387wHgseaVQc1TQn/S7GsMi6J0FtcaK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4Ym+uD6RriTUAZFGTxim0yG4Tu0dE5+FbV/TTXoI4XpFRVnV4
	IaARbhWIYH8JB26tOYZtYiKNcmxFeP+z1OVRelWh5aZKB0+Z8cuogSHiQlnxhqy1H+Ih/ATuaEf
	OPiwNysezFMgwTt+lKdsKrC9oIYJzEx8Z+xxChUz1kGwrZb562vEJv/174wBk2vWQkZbm
X-Gm-Gg: AY/fxX6HFKDYVRu4kuo/YQT2uqKntONVkE8S9L0KFKXDCgalaUCyUPLy0kUJIxWYY5B
	s9IJzZx+tpU+tVSK0z2DYwcMfyATDuOqdWUvYutzAimOoAnZjlikmtXnWnjXRPg8nbIzArw/ckT
	Ar2lyZZA+a7G/u3yDPbR8RdRRxyaYiY/m5tPA6t6xIe3J16kMTUS9jw/BEnD/YRucVrFV32jZF9
	QmrcO7bMOfhwkXr6ZgOaqCJEuaV9W9EQk1uNFDZoPP1z/MuvQJhi5DeSc+qHqEAtRU8D7faGn2/
	jSmOxUcRpl2j6+CfZrIEc1rgUXzKv/WA072bZiVPPvXLw8Yu2TOBt67AjigBfPypSatJeCsycYi
	HDX+Iw10dQPwSjCzrDbzd1/tE1987rTg3ERPtFMW7h+Xtuhpq+4t0iqJNgtM6
X-Received: by 2002:a05:7022:699d:b0:11f:3483:bbb0 with SMTP id a92af1059eb24-121722c2521mr11800924c88.19.1766481258760;
        Tue, 23 Dec 2025 01:14:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOCB2lEpxvhz6bp/aNU/0EztiBxpdm053ysqbPX/iDe0GvH0kLl2VsvFu2b2ki3dZkYKrggA==
X-Received: by 2002:a05:7022:699d:b0:11f:3483:bbb0 with SMTP id a92af1059eb24-121722c2521mr11800893c88.19.1766481258160;
        Tue, 23 Dec 2025 01:14:18 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254cd77sm56931833c88.14.2025.12.23.01.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:14:17 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v3 0/5] Add initial remoteproc support for Kaanapali SoC
Date: Tue, 23 Dec 2025 01:13:46 -0800
Message-Id: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEpdSmkC/12NQQ6CMBREr0K6tqT9DcS68h6GxW/5SKO00CLRE
 O5uwZ2bSV4yM29liaKjxC7FyiItLrngM6hTwWyP/k7ctZkZCKgkgOIPP/JIQ5hpjMHyrjaohEE
 UdcvyaIzUufdxeGsyG0zETURv+/1GgtR7rXdpDvFzaBe5l38GAfrfsAAXvLZnqbUyFRBeQ0rl9
 MKnDcNQ5mDNtm1fQHif+MoAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Gokul krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766481257; l=2915;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=l0prRypGfOLngy3f8Ji1cHlq2eAPEXkQ+7O94syJxxQ=;
 b=njAdJt3QUyPKJoKTJ+acPVyO/W2ze2TT47VrZDwqxNgrt/WEfa9YKXzgU3raGckHJ0FDJEdx0
 S+IYKUJYp5LD+Dun4PhJUWfzODq9KA+71pZzPKjvV/P6+++c7aTYtn0
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: VGlrWZlNv28ZLDDu3p6cVbzcAba-6AdT
X-Proofpoint-GUID: VGlrWZlNv28ZLDDu3p6cVbzcAba-6AdT
X-Authority-Analysis: v=2.4 cv=asi/yCZV c=1 sm=1 tr=0 ts=694a5d6b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=jlxKODRQ_LuX4D-yXW4A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3NCBTYWx0ZWRfX9lSE838dVZuC
 FUMLGrhStmrYTdAAx7HQrMXTkfNMRwU+0qUOzYtHm1i4ng+1IdJw0p2zr29vsRUcLhy8eHyd87V
 cqVnEgXKTwCIlfv6IVhalBt4B5lA3XjroiJNyPgCAytwFgLea95gwBO8c+abm5GhfFrRj13khbP
 tXpoIuxItm172evv6P5YcgNdz5G+Se4pVZgoCl1BBj3UrKadfCCGBFLWXDvd6IMEZgMQ/s+An70
 Qw1VrT6RlorDiTbd1nkqc11bsNgqlpwpo41bpQYmS7/ZBrgQUQApCfLugHeQpXfp2ChN5CytjYk
 /ZT54JiXsQnbGcQbuDWAtAtBWBBYfcvUGdVZvNSExVm998gVRJGxgmPrmx2QKVKGMPyT5FjC87r
 k1bdVzM+8PH0HONg6Z1a3C8ZQcOU+9zKN1Ho7aXXkRus9OABzSbMe04LDiuIWIdhc4bGRoHZArX
 BJqRiwfmUNlj/DjJw4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230074

Add initial support for remoteprocs including ADSP and CDSP on Qualcomm
Kaanapali platform which are compatible with ealier Platforms with minor
difference. And add initial support for SoC Control Processor (SoCCP)
which is loaded by bootloader. PAS loader will check the state of the
subsystem, and set the status "attached" if ping the subsystem
successfully.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

---
Changes in v3:
- Drop Glymur ADSP/CDSP binding 
- Extend the "interrupts" and "interrupt-names" properties in the pas-common
- add missing IPCC_MPROC_SOCCP definition
- fix complie err caused by qcom_q6v5_wcss.c
- code clean up for late attach feature
- call rproc_report_crash() instead of set RPROC_CRASHED state
- fix q6v5.running and q6v5.handover_issued state handling
- if wait_for_completion_timeout return 0, set RPROC_OFFLINE for PAS loader
- Only ping the subsystem if ready_state is set
- Link to v1: https://lore.kernel.org/r/20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com

Changes in v2:
- Drop MPSS change
- pick Glymur changes from https://lore.kernel.org/linux-arm-msm/20250924183726.509202-1-sibi.sankar@oss.qualcomm.com
- Drop redundant adsp bindings - Dmitry
- Clarify Kaanapali CDSP compatible in commit msg - Krzysztof
- include pas-common.yaml in soccp yaml and extend the common part - Krzysztof
- Clear early_boot flag in the adsp stop callback - Dmitry
- Use .mbn in soccp driver node - Konrad
- Link to v1: https://lore.kernel.org/r/20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com

---
Gokul krishna Krishnakumar (1):
      remoteproc: qcom: pas: Add late attach support for subsystems

Jingyi Wang (4):
      dt-bindings: remoteproc: qcom,sm8550-pas: Add Kaanapali ADSP
      dt-bindings: remoteproc: qcom,sm8550-pas: Add Kaanapali CDSP
      dt-bindings: remoteproc: qcom,pas: Document pas for SoCCP on Kaanapali and Glymur platforms
      remoteproc: qcom_q6v5_pas: Add SoCCP node on Kaanapali

 .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 134 +++++++++++++++++++++
 .../bindings/remoteproc/qcom,pas-common.yaml       |  28 +++--
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       |  10 +-
 drivers/remoteproc/qcom_q6v5.c                     |  87 ++++++++++++-
 drivers/remoteproc/qcom_q6v5.h                     |  11 +-
 drivers/remoteproc/qcom_q6v5_adsp.c                |   2 +-
 drivers/remoteproc/qcom_q6v5_mss.c                 |   2 +-
 drivers/remoteproc/qcom_q6v5_pas.c                 | 115 +++++++++++++++++-
 drivers/remoteproc/qcom_q6v5_wcss.c                |   2 +-
 9 files changed, 377 insertions(+), 14 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251223-knp-remoteproc-f6ba30baa06d

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


