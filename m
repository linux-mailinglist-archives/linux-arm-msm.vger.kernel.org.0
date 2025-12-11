Return-Path: <linux-arm-msm+bounces-84994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A8136CB50B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 09:08:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA95730111A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 08:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A92B32BD582;
	Thu, 11 Dec 2025 08:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hQ0Y4RTg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cwD/ZVUt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2002D5C68
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765440468; cv=none; b=T2p7GVfGi0FIRKgLtiDGuFvAj9CYRGcfKP+05fmZZGdkqSpYTPiHrc4D3YsPXMHQzNqiliWDSVunlHxZc4JpP0VLxWRcxkbY0fA7Iq2HaDWK2rctWEhGyztxUDXNTONnwFhPNtZ9hxLhMJPZpHpjDTt6tJdrXpTx33rDUtufWjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765440468; c=relaxed/simple;
	bh=GqfZdjbwpNzNGRV3mhFb3wWXJrvsykaJ5+F9liByRQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q9CrLLhjH8axtTTr1ypQxooq6BqgNBarMUj2tjNsh6+aSthboSK1BjLe8Hk4v+TdDriyDK6P9LhJf8xdhI8AjIxIHXc0uXJrAWMi0RORytEhdWKg2wJlI8A1at08FVYBReboLuckzxeanLxsueXyW2YVoFBM2KQeJ3FYrOzFfQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hQ0Y4RTg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cwD/ZVUt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALSa7i3563582
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hYdwtSJsLajlgT8w9wckrh9edcTWvrsOaCQa9xUTBWY=; b=hQ0Y4RTgNCINKhYb
	y/koxeQJA8oaeA1cJiBxVu8HmBhHxtt/pzTCpddOCcF2UR4Y0se0ryu9bmdGd/NR
	N1mrg7BFtyKhmGu3gpDzwRv78jVOqyNkclETu2pk3EgZBLx4Mt6KGabT+eo3GS83
	FLvEOOy0JFuK5F2jrdVW8Kp/WAonhaLK3I1y4wRSwWST6GvQn+WNdOT0o91KLuo7
	iBbXaRc6afFYNKgFNjO3A8I2cAwHVvhWFkpmyWvcZt6ftM5mbqJxtRkbd0eD69nT
	uV+hEvKS7xH8Dy3dGxlQeFI49A8QLt7IU25CfMi+357cdD8EvAPJ9jRgk6mj60WH
	4YOo4w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygtfhgqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:07:46 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b4933bc4aeso783992b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 00:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765440465; x=1766045265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hYdwtSJsLajlgT8w9wckrh9edcTWvrsOaCQa9xUTBWY=;
        b=cwD/ZVUt8Zu8tqufCKNV0S8KAQDBwYofi4d3+KR0AwyafGMOdD2IlLR1e7QKr1QqDZ
         Cit3dCRKH+uW+nBbiUg/XDZC0w86cMtGzWqPYZU9hJD4GS+MZS0RyoUeMPB840z/T8YJ
         s87swTv0rqiyQKY8lftsYdhdiLMLj9LRUyy7R2tx76Uz9ql6mJfXOOwxGdSc80qo0wDH
         8YzG5Xaj+1TdEmmZNHX2b+UINYBz9Ex8IIjQ2uxMgrxRhwabwkeEiOLkJG2DFHgJG3Wx
         7+pCkd34NDv0jq30TFUaVQ2iVGbOfP32k2Cfnv1MwjguAStjpuzWrEhjju/wE1dHmTMJ
         NuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765440465; x=1766045265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hYdwtSJsLajlgT8w9wckrh9edcTWvrsOaCQa9xUTBWY=;
        b=prnf/0/pQUlX7Kp/EzcOsYE0Zb1SuQEuOwRPFDhX2sibdhLJy1bRMzPObuqd/X0R6T
         zmtDqIXWtAwQueeXsSR/Ne6uJKWPv0j8Ih8kS0gJTH+l76Gfz5PvzsMYQHJyMab0n8a+
         fcydM6PWxKjsE4utaGgAezC3OMzJSFu+UlYllxAr1X5AiyUIlKpCOXgPZM1lKefTeNeU
         8lhGOEL2xtWRDiTpBflv7IKe5HWTSEqubUuJ0Rl4AgY82sEvn6euRl30ZFp/TGn0tlpJ
         +0jy1VJ+URyXvebvRvuBDfCnZLNeAtDWpzVSnFqUtTf5XTog1Bw1ugAXm7eApiF2Oxsj
         tgDA==
X-Forwarded-Encrypted: i=1; AJvYcCVfE67RR631wZ1z5kw7cLpITe3OPvG59mSWqlosboUMGxYLtXIPGPToy7T/VA8j3UN0C5S0p9RALqGcdmbs@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg/WA93JWIN8Of3vSGs26UJoFaMColBGh1pARj2jwZnRnv9/W6
	WJ2LxjatHV3meoBX7jpZ4jSfA9VIYX4J0jRm2jwBjuHA8EolnVe2A7mZ+6Zc9vRwLylPBvZENC+
	qaVazjb1Kr667mZ8do5+Tutag44bFhgxtBYda1QQdMHZ5YtA7vP0M22Vr4QvNA+nHmo9P
X-Gm-Gg: AY/fxX6xikATupuwRquKtP2uAwTRaeZKgE/lI4BCIsgeFJLmoj2sR5a1ST8G72fB+L+
	bawkyy009KYt82taUUQSMsSY80CQ3SAVcjSX3fTYu6y9LBc8TB40d56svwg0wan5uPm5VBJNAcO
	HvtznucdhWx32R46yJMWx89I++EgBW6H7uEdUJJgREtu7UbnMW7+KPXzWdrIqRyD9D9FDFYLUhR
	akLAoz8HJuX8eyRjkIDJqjc5PQNYlmc8ZP5Qv/HVf+gpHqb1zh5Eh5Z7CQEdnzWzbcduCb1QHZ8
	uv/nwAIHXRRJuWAkDEZn7b+yBJCfXAV2lKFexMrxoJS7+CdaiL8CUoKvHnfqL2num3+n5DLGDw5
	EUxgcOQdSmAg5q5siG8Tc72tCrntoQG75nA==
X-Received: by 2002:a05:6a00:1391:b0:7e8:43f5:bd39 with SMTP id d2e1a72fcca58-7f22f236e84mr4701376b3a.37.1765440465383;
        Thu, 11 Dec 2025 00:07:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiTPe9eNOqsIwtPu44NeulbOOyB5EgtrGuYKIDWhYFxKIFac9QywQXMIgc0bG//C3XgZqGOw==
X-Received: by 2002:a05:6a00:1391:b0:7e8:43f5:bd39 with SMTP id d2e1a72fcca58-7f22f236e84mr4701353b3a.37.1765440464875;
        Thu, 11 Dec 2025 00:07:44 -0800 (PST)
Received: from [10.213.102.126] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c22848a7sm1706651b3a.3.2025.12.11.00.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 00:07:44 -0800 (PST)
From: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 13:37:33 +0530
Subject: [PATCH 01/11] bus: mhi: host: Add support to read MHI capabilities
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-siva_mhi_dp2-v1-1-d2895c4ec73a@oss.qualcomm.com>
References: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
In-Reply-To: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Upal Kumar Saha <upal.saha@oss.qualcomm.com>,
        Himanshu Shukla <quic_himashuk@quicinc.com>,
        Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Authority-Analysis: v=2.4 cv=At7jHe9P c=1 sm=1 tr=0 ts=693a7bd2 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8H38-GfiV2s7wLOohYcA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: VVdhSp-ArvRadUK2J4ngm3ZDidMRbZH1
X-Proofpoint-GUID: VVdhSp-ArvRadUK2J4ngm3ZDidMRbZH1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA1OSBTYWx0ZWRfX54FMhM4FkVeh
 8ATFhBNFX5vr+OUx+3kAQvlYJmgoTS1BrWVt6scYXy3cws0fTRMaVvWy6GSqmi/AUUF8teTS/h8
 +fjAs4HBntCHppLcanYsN3pPQddViMBVeAHc/ljZpC2OJUtbpLlITRcsxZ7p6ZxW1f2eIBnSDaQ
 RsZIeVR9NwM0T2DBwFBTULzU9j9FEhsX/uRHywTohBmSz4ZeTNA9uBALlTYtpz+BqwITL2XD3we
 KAaT9H6nCNW3YiMjoc4oljFmfeG9TqF4FNOSbGUg7bV1pNCsFNSkAJEfZcFflbZTaUGzY5CtUs3
 QrM1LGy7T4PdmoO7hrXU+KaJypJ4/KWNrZ0cL4ymypexieY5EYghfl31L9jUv6U0VmMbSZYp62X
 H/iE4qes/NXjZ5zyltb61Y6VqHSFdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1011 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110059

From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

As per MHI spec v1.2,sec 6.6, MHI has capability registers which are
located after the ERDB array. The location of this group of registers is
indicated by the MISCOFF register. Each capability has a capability ID to
determine which functionality is supported and each capability will point
to the next capability supported.

Add a basic function to read those capabilities offsets.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
---
 drivers/bus/mhi/common.h    | 13 +++++++++++++
 drivers/bus/mhi/host/init.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
index dda340aaed95..58f27c6ba63e 100644
--- a/drivers/bus/mhi/common.h
+++ b/drivers/bus/mhi/common.h
@@ -16,6 +16,7 @@
 #define MHICFG				0x10
 #define CHDBOFF				0x18
 #define ERDBOFF				0x20
+#define MISCOFF				0x24
 #define BHIOFF				0x28
 #define BHIEOFF				0x2c
 #define DEBUGOFF			0x30
@@ -113,6 +114,9 @@
 #define MHISTATUS_MHISTATE_MASK		GENMASK(15, 8)
 #define MHISTATUS_SYSERR_MASK		BIT(2)
 #define MHISTATUS_READY_MASK		BIT(0)
+#define MISC_CAP_MASK			GENMASK(31, 0)
+#define CAP_CAPID_MASK			GENMASK(31, 24)
+#define CAP_NEXT_CAP_MASK		GENMASK(23, 12)
 
 /* Command Ring Element macros */
 /* No operation command */
@@ -204,6 +208,15 @@
 #define MHI_RSCTRE_DATA_DWORD1		cpu_to_le32(FIELD_PREP(GENMASK(23, 16), \
 							       MHI_PKT_TYPE_COALESCING))
 
+enum mhi_capability_type {
+	MHI_CAP_ID_INTX = 0x1,
+	MHI_CAP_ID_TIME_SYNC = 0x2,
+	MHI_CAP_ID_BW_SCALE = 0x3,
+	MHI_CAP_ID_TSC_TIME_SYNC = 0x4,
+	MHI_CAP_ID_MAX_TRB_LEN = 0x5,
+	MHI_CAP_ID_MAX,
+};
+
 enum mhi_pkt_type {
 	MHI_PKT_TYPE_INVALID = 0x0,
 	MHI_PKT_TYPE_NOOP_CMD = 0x1,
diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 099be8dd1900..4c092490c9fd 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -466,6 +466,38 @@ static int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 	return ret;
 }
 
+static int mhi_find_capability(struct mhi_controller *mhi_cntrl, u32 capability, u32 *offset)
+{
+	u32 val, cur_cap, next_offset;
+	int ret;
+
+	/* Get the first supported capability offset */
+	ret = mhi_read_reg_field(mhi_cntrl, mhi_cntrl->regs, MISCOFF, MISC_CAP_MASK, offset);
+	if (ret)
+		return ret;
+
+	do {
+		if (*offset >= mhi_cntrl->reg_len)
+			return -ENXIO;
+
+		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, *offset, &val);
+		if (ret)
+			return ret;
+
+		cur_cap = FIELD_GET(CAP_CAPID_MASK, val);
+		next_offset = FIELD_GET(CAP_NEXT_CAP_MASK, val);
+		if (cur_cap >= MHI_CAP_ID_MAX)
+			return -ENXIO;
+
+		if (cur_cap == capability)
+			return 0;
+
+		*offset = next_offset;
+	} while (next_offset);
+
+	return -ENXIO;
+}
+
 int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 {
 	u32 val;

-- 
2.34.1


