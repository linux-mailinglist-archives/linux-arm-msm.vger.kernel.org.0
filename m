Return-Path: <linux-arm-msm+bounces-80220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB72C2F631
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 06:39:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CB57C4E5D9B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 05:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94ACE29C327;
	Tue,  4 Nov 2025 05:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eUSIZmJV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W2hMSq7b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DBA2D061A
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 05:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762234756; cv=none; b=i33ztRBHqefK3123bmAiI0ioOWBNtbHzHpQDUWzOcvmdehOV4efyyuiyA1/U4eYtGu4Zhb2yxLGym5m2AeDmU3FQEyY/d9ukgoNSx1A5hrFN+IQXD0BYX3ZQgNIYahexRmjXV64a7wIrA2l3QtPLLECTRn8nzGmA5iz3GZNFVWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762234756; c=relaxed/simple;
	bh=4wypx3hFOMJo7ulJl2NyPqUYO+r2VbZcHKF5EpBIwik=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Io0XYfVSHmnexOz8vWK1xTKtLgYWKWzFW2N5WOudRuK4lkxdtXOeClJuCIPYYln3138X5D5jEg+drmJlNbb8KA5XNkKDpJJqDQVGEwITMk+f/Y/fID3dK7l4etFLvk0M0Ti0384E1Evrwi4HZaycnTLKyH7G3No8MLA2NiPYXN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eUSIZmJV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W2hMSq7b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A42lWcV3659464
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 05:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TRds64AGy6m3cdwYYylG2Z
	LbGaOlzu+CE5MUJYzis1U=; b=eUSIZmJVDAAim3CkAqWXx4Fnp7FyJ8GSYfrx2t
	C+pW3c4RVkXxmuYk+jr4vQo6HlAtTMcF/gr2L5xvIyYlaBxJoLtXU42jNtaUp5AI
	WHUIJWhk+0Ak/uGqwA0/vUMOhqVcjEsT17Lg/p0L3h+c8hOetFVxS2RYpIZkJsot
	oTjSq6ls4l+wnMO3OaYy7JQp4972NCLcPA3kg2sf7YwI24ZCvKNi4q/3xr3M0CeQ
	BoJLxhD6B9lChLMnLfL0W1oh/JtLZ/bvBLmIQ4rH8/O0Pd/CpznLcV7RKXwew9bQ
	FXbZfXjOzX14DTx8UmmknweMYwM740geHja0aOyvreJoAPtQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70ge9rk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 05:39:14 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7900f597d08so5009714b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 21:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762234753; x=1762839553; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TRds64AGy6m3cdwYYylG2ZLbGaOlzu+CE5MUJYzis1U=;
        b=W2hMSq7bcfm+1ysY+PGIUp4i9oJ6dtvW1iOh4s3/y6jwoon9C/DXqTLTRcx7xLoqZB
         hUt8HPi8qm+bPQP2zgzBvk6+zN8dgkqVjWkGw8qGEPEQGgBrq2Aaa0uORHM59KMyOFpk
         YGrEWNKum8n1GFt/lTe8boBJEK/ASYwckWPUaTewfH1+IfJqSJVZJ/zB1AP9kFBwWgWi
         WESsfdWTcNrdHRbSuWH0kcp7NNw7OsDa77qAP42uY7korvzqVb4bc2hOtZ/64KHrCJPi
         gYPkFqeBsAfqd7h1RWPIE3YdkoagUhaJ/TXJnbOCjgmIF3oQr/YpvuhPTNlwQNvnWPQd
         dBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762234753; x=1762839553;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRds64AGy6m3cdwYYylG2ZLbGaOlzu+CE5MUJYzis1U=;
        b=B6Kqo8QN+G3jhBxfJgTdd2K0HM3ng7twX+NSqAfbNVxG4laSuh5TU9MQJ8wGRD/kWH
         wcO5fJliwV48yTgyYHMU3YgTiz+ipwstPv50fPKEpN0FbFPx7HQ621xJ0xSfFkrASLuJ
         qFpv+a6utiY3KYEvGUdAic2bsO8bVSNKVkXrDqenxLtH2Uf2eDT6+2DsP/iE7uTpeY8E
         fBBdK6mfRXWF7siuidDQlxeKHhlXkqWhu0G3KkN3J3mi+3Ik46zy7APWMoj7oVoiAXbQ
         XcZh0oaNCtuUa794ItxhmVkN7z3hQmUdtRr22lGhEma6HZakGM9IF5uEsgGd8laVRama
         iNSg==
X-Forwarded-Encrypted: i=1; AJvYcCXXf5dHdCMcmTvzj1sCXsR9yiDW1/ZRy8YZzRLWc0pMsWK8hBNN1OwASm99H+j64wYsbNF3s7p9GnbSCJHr@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc1MSB/uHV6KLUmXb7SjMHAttzX9oCEs8fVkkleK2wfuA0bI3f
	8FFmdBirlwWftsLoohhUKyqVW9a6ltLsw6oEFTYtptr2kE+HvBHV06YCa/HbtRgTfxAv4OrdCed
	NnqRosPtFivZgjo+pwXSrKoNIRdWr8xiBxGRYcq+JekohUZ7NXIfY8IZll3Dzf4QvG6UQSHmZpn
	Eh
X-Gm-Gg: ASbGncu6c/P3zP+q5+gioMKCO3aOZ8A2TSyvojHXA7e9SPhpFPGlZltlSctYyUPj7VI
	2fyNb68uvTByYbnBz5uuSbu/GgL7kyE+EmtYVTkO2SATqFbLX1crPTOPlf6W+xkCx3ACbN8WuzD
	oxogJXr1/rWEsKYp7Iet+uSrlWR6lioE5M8fojWP4wEZcZHug+OMAlXeaSsN3cIE8IQ0kIzUhNc
	Yn686QYOw5CtzpWT8P4NhZi7LHsbmD5T6Du5TOp7/v8Z4S/CEzGAUwcZEIr3YA32UK4C2X8kY86
	u7/AoTBLbWfvqpPXoVB/pZIJmmrYuEOQp/4fc5zj0WUxTGQc3xMgIi89rJhVop66ofIXJtjl+Uo
	rpb5JVSFSOVUBtfOG5BQdGUqw
X-Received: by 2002:a05:6a00:189c:b0:7a2:7c48:e394 with SMTP id d2e1a72fcca58-7a77474c916mr20027904b3a.0.1762234753241;
        Mon, 03 Nov 2025 21:39:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyPkuj55Yb9/jYE/3bTW2iGIwFodzrtCBKrGVxOUSEsI1GcmfNr96R/gHVfwD51Hgach8Htg==
X-Received: by 2002:a05:6a00:189c:b0:7a2:7c48:e394 with SMTP id d2e1a72fcca58-7a77474c916mr20027866b3a.0.1762234752604;
        Mon, 03 Nov 2025 21:39:12 -0800 (PST)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd3150f0asm1462402b3a.2.2025.11.03.21.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 21:39:12 -0800 (PST)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: [PATCH v2 0/3] bus: mhi: Add loopback driver
Date: Tue, 04 Nov 2025 11:09:04 +0530
Message-Id: <20251104-loopback_mhi-v2-0-727a3fd9aa74@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHiRCWkC/33M0Q6CIBTG8VdxXIcDBMOueo/mGsEhWSom5WrOd
 w9tXbRcN2f7zvb7jyhA7yCgXTKiHgYXnG/jYJsE6Uq1Z8DOxI0YYYIUJMO1991J6cuxqRw2AEJ
 YSwzPGYqk68G6x5I7lHFXLtx8/1zqA52/nxD/Dg0UE5xzo7Xk0tJM7H0I6fWuau2bJo1nzr8tZ
 StW51DIKEGp7R/LshUrcyptRi3nSv3acpqmFx/+Or4nAQAA
X-Change-ID: 20250903-loopback_mhi-dee55ff0d462
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Akhil Vinod <akhil.vinod@oss.qualcomm.com>,
        Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, quic_vpernami@quicinc.com,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762234749; l=1702;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=4wypx3hFOMJo7ulJl2NyPqUYO+r2VbZcHKF5EpBIwik=;
 b=UIEZW5wivpSBIqHH3pF2Tllc7B4the977GG8y1cyzVSg0ZzPZtlS0aBpyAPZiHPo2EjH0vXuE
 1HqYq3m0ng+DysFVkWBa4OmkF6N1M5h9zBA4089Kh/XEz4v4J/EBGgI
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-ORIG-GUID: erAIQZPmhILoFmCTyAbvAIYiEkHT2ljQ
X-Authority-Analysis: v=2.4 cv=bqBBxUai c=1 sm=1 tr=0 ts=69099182 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Kxh_h3bSnmR7gis_oVoA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA0NCBTYWx0ZWRfX5CO2Ddji2kaE
 XnJ3StRt2CRsWqR14Q7Q00rjNUjnvzwPJiwlQqNYd6tVqd1t5Qt9XQcmrZzpXOswv+5pLCkpjrr
 CMlZHpQihL4j2KP2C+GQYr4vHL4nROOi+T7f1sZIH2Jj/upIAuodIdMF4nPkI6wCZOfSgccgCtC
 PkP4nzBahvwHvH1c413tb6yUCCKaEjbiJMXVKMbYGZY3NhJuHwWcmWBqkSL6SGRTt8Oy1/XHT2Z
 bTuWQ4CRZ/C3QQYdEsHyaGeLWOH1RD4NDbYHqORE+xoo4wV4zN7b4xeLhEJEw2GN2XsB5edTkEx
 tPUOWTgvyG/PhMlbuOLyE3P1t/OXJy6oymClAWHHCnlbmiCrdo1pTPUgEcczkRs1o/eMqTURoO4
 b4xdamr/vt/9dN4ccgzwdQQ1Jni7Mg==
X-Proofpoint-GUID: erAIQZPmhILoFmCTyAbvAIYiEkHT2ljQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040044

This series adds MHI loopback drivers to enable comprehensive testing and
validation of MHI data path functionality between host controllers and
endpoint devices. The drivers support configurable transfer sizes, TRE
chaining, and provide real-time status reporting for thorough testing.

Testing is initiated with sysfs entries from the host side and results are
reflected back in the sysfs entry.
The device side driver echoes back the data recieved.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
Changes in v2:
- Use __free(kfree) macro for buffers
- Removed NET layer socket buffer dependency, now using buffer and len
- Created a New Api for queuing buffers for clients which do not use skb
- Link to v1: https://lore.kernel.org/r/20250923-loopback_mhi-v1-0-8618f31f44aa@oss.qualcomm.com

---
Sumit Kumar (3):
      bus: mhi: host: Add loopback driver with sysfs interface
      bus: mhi: ep: Create mhi_ep_queue_buf API for raw buffer queuing
      bus: mhi: ep: Add loopback driver for data path testing

 drivers/bus/mhi/ep/Kconfig           |   8 +
 drivers/bus/mhi/ep/Makefile          |   1 +
 drivers/bus/mhi/ep/main.c            |  23 ++-
 drivers/bus/mhi/ep/mhi_ep_loopback.c | 134 ++++++++++++++
 drivers/bus/mhi/host/Kconfig         |   7 +
 drivers/bus/mhi/host/Makefile        |   1 +
 drivers/bus/mhi/host/mhi_loopback.c  | 347 +++++++++++++++++++++++++++++++++++
 include/linux/mhi_ep.h               |  10 +
 8 files changed, 525 insertions(+), 6 deletions(-)
---
base-commit: e6b9dce0aeeb91dfc0974ab87f02454e24566182
change-id: 20250903-loopback_mhi-dee55ff0d462

Best regards,
-- 
Sumit Kumar <sumit.kumar@oss.qualcomm.com>


