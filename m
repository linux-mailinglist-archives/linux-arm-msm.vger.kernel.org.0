Return-Path: <linux-arm-msm+bounces-86488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4BFCDB7F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 07:30:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 606EB30A8176
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 06:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389312DC763;
	Wed, 24 Dec 2025 06:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+gxEcXW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JDGApIDc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DB930B529
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766557687; cv=none; b=PL8tPR5m+XGkaoMQoI4BIjo5hGYCaSPPX5g1cn8bWgM9Ops0tSbjcP+2lVrFf79HZpTa/djAsG5SZfniZSPaCLySnOxcn/IZCg/wXgLV4Hq/GHVlucwPZY1A9Vor9MYe4S92VaJE4N9E33bxbDcjtAr2PX2siUHbC10QYpH5X2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766557687; c=relaxed/simple;
	bh=uFNt44v16+VNSladcy20KcC0FS/WVmmz9c1Lp4p1lEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hFYmfQKc8MObuL04IBrgzxdTfpl27SWaPEBjB8fw5M6R62CmyAYDnlZEYW3yv4yGDUyygF7UGx2a6xgqhtDe62NPc8+7jngU9wCfK++xRhUVYMO493niVcwtyqE5lD7Vah1s5epRVXJjeO1YaZFlVJZ/QKyFBLVxnYqDcCMn0zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c+gxEcXW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JDGApIDc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNJCr481056218
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VUTT93LKzs62jsIB8hKM06ywx/M5I0v8a0LHmaZ71W4=; b=c+gxEcXW19+c/P7i
	C6Uf4EMG+kSeHQwilmC6r1Eet9jBq3stn78T8HLAkJZAVSUZSZaSdsrL8xYMdYhC
	t84BldxVJ+Zvi7T1xWzvmgn1XYWCpsf1hYAKFrGFDI0e6dwzsTPBfkvQAntKO8uG
	95GXJZrFBghg6WFOz21Tb7AzvPqFeNZXKTmrQdG5khH9bkKNSKYIYNa2dQRmHS/Z
	bZygtwZrp9ttNp/Xqtrdi594lTmBCHww07LYGYs8qkXfahh/3P1kr0FG2cmY4Eyf
	vCNzbyTmdnYmGtvL6kEELs0iIImySpGudogYVuzHuac48+2eK/EBe3WrOlu3nWiA
	paIK9w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b811v1j73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:28:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7a99a5f77e0so9176784b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 22:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766557684; x=1767162484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VUTT93LKzs62jsIB8hKM06ywx/M5I0v8a0LHmaZ71W4=;
        b=JDGApIDcERTlTD+etEB449ySkxfUlFY5w6FujGMyKzpg3l/mdJvPEh8pdU1ZzN1ZOs
         yyALYdKh+VqVOPb8YQMTmDd8Duo1+zx1Pwp13JkAMeoGANYyUNMn+pQTwcu633mysiym
         YkFpGr5WNUzOWTH5c4Szf4GsDiFNEeWOOdqDJnv+qIOI8HknvRvm8OjEGYr7wFyTR1/V
         EsUjnT7MMEaNFXWyJqrtTxfUg32RK3X0b/38Mn7g1a+U7fn/qNoThGU3kHFGJnhvg6Sw
         wl8HRMgFxYWG2C3Drr+TWW6LJoVW5ENQ9VJPo3+xFIhVHg0S5/CpGV0/ovyUdnhiCVTF
         yRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766557684; x=1767162484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VUTT93LKzs62jsIB8hKM06ywx/M5I0v8a0LHmaZ71W4=;
        b=Zr1t4P1C8XRP4ueRgSBadqlBVLo1bBlKe4DcAUDCgeqb+HJ0O2u8QnT03MsH6LcgDV
         T3axs9Ai2p4kbPHWR1fq7S1fEUFkdtB/uvVPddO4Im5FIzqvbSt+W4KOUOFkffvTGb9h
         SRsQvBuhwEkENmawBX5vSl77wF3M7zhu3Fuh3DhUtQA2Tt/GPA2nQU90f/KUL0kVypI6
         MfggneLmQjaOdtA4pRgOKSDIoFqw4finHnSfN6ESpN7gyGqpm3RkfsrL5swxMSTgnVH5
         EBzuc2rDcvupkuaKyaMPGrIU5yiP9sB0Skm0/jlIyCKVXxvFwiDbgpQmZpiDx/SY7waH
         tKtQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5EnPcTNb8SbXpsEUat63Q4GuUnflXTVJeqDsXOB08JlJemkmTkgXEswWkX+buNJ+ktivhV2jpFRCjLSg/@vger.kernel.org
X-Gm-Message-State: AOJu0YypOT9YitiBa03cAk29ZbNQGW6puNQbwqVqqymn87/V9SERFDEg
	Zl1WDSNAiWQ7N5A46vdsHWOSaXXw788Y1m1qg5wBxUfpWVvTtVkg8F7VbfvmHwNC7GM5+xShlCA
	g+gL5J/c3WHWeqf+ooN+hx5QKVsTNKfZoumRw5Vk40g1Kq7GmZp0myHExri50eXhLkNg0
X-Gm-Gg: AY/fxX7nr81ZXw+4hzWnOQg9ryL3s923ibXzX0bO/ANMCcpbAWW9XidPC/ZiZDdow6D
	2oQElbh3BLQhOXSgj2TigawOodZ+k6vscfzQw5OLA4hU3J5ncfUY2kiFyRNMThR6WnuWWWR4vhO
	c6zUFE8cKKhdaU77bfxg5pNkDxShcolr4kvmXBLGDgxAXBBjKjcKyO5EJPTUhneG7ji9DAOKT8I
	JCRhYq0wJXrHzFb6OdttDthKs8oAIU6u/Uc2rfDxrJGC4sLMSeO8IxiNV9h8Obd/fnWe+T0CPoF
	jgpIBh6qohgX1W2Kcjo1OJV8+4n04NLGSQw/vtchYkcWHHUfQXz62i1WS7AtEBhOeQJKzpMQafI
	dBBuoMAOQV60jW2HAdXqiALjhfjB2cdeAjtWV9oaAsutN4Ts=
X-Received: by 2002:a05:6a00:ad08:b0:807:3ce8:58bb with SMTP id d2e1a72fcca58-8073ce85e26mr2495923b3a.12.1766557684298;
        Tue, 23 Dec 2025 22:28:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEetZusp4r/t67X4n+UM25nReI7/guSHCsVpzSsGU3LKTeAF+acxysyBkAwTm9CwntmMO1VYQ==
X-Received: by 2002:a05:6a00:ad08:b0:807:3ce8:58bb with SMTP id d2e1a72fcca58-8073ce85e26mr2495907b3a.12.1766557683834;
        Tue, 23 Dec 2025 22:28:03 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7eb85f15sm15618908b3a.68.2025.12.23.22.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 22:28:03 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 11:57:14 +0530
Subject: [PATCH 5/6] media: iris: gen2: Add sanity check for session stop
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-iris-fixes-v1-5-5f79861700ec@oss.qualcomm.com>
References: <20251224-iris-fixes-v1-0-5f79861700ec@oss.qualcomm.com>
In-Reply-To: <20251224-iris-fixes-v1-0-5f79861700ec@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766557663; l=1178;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=uFNt44v16+VNSladcy20KcC0FS/WVmmz9c1Lp4p1lEw=;
 b=9TGR5Pw1RDMwFvktNoiXTDKVAFp1rPowhOUSpIlVuAfAa22mlq46+3ngJw747/AmbbewAmpj9
 s6Xu/6ilbKgDxdQEPRQzy3DDnCyiT8qb9Rah1eZmnPB4j79Cwwui1fx
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA1MyBTYWx0ZWRfX8uMRmksraDLs
 eVZc4sj45R81QRxhi6FmXnqRwhF2zl4k5oswZOL+8y2YXvU0E1dikEl8VhEo2dnhG8dBl1QELkB
 16OSAGEiFDIJfKvsrxxdguHEzMgSEML051RosevXLLLrnD+mnZnHvndq2grJSaXPBKU5LtJ65Xb
 dErshRcKcSzBLPVO9OPI0xSza+A56i5YroGGTmz3Y+b7BOiGyh88Pk3WLALWV2JkjO09w7BUFlD
 RrYiz8fy/hdkCgQNlOep50u8ZR0UbJ77jFwSeNQkhiDfWVsNTFsAX7gTlVw1IKMjUMP8d8OIeLB
 TTWkH/WHW5qRleJD0tE7eSdc6jT6+qFszfq92v+SLz7xcob+T3i8FtDOkGVB+GOTzR65cIaKcXi
 BPDwRnEatitDcN8iQd2fr31X9n4jay8H/z/L9lvxB5pvIxbtOvL9E/BcDOwy97FA2M549TE4MAD
 XfZXMKIlPfD5K7nkq8w==
X-Proofpoint-ORIG-GUID: tPFEJfZGG_kRgkl6SG_Q7yDoz7ceYvvW
X-Authority-Analysis: v=2.4 cv=WegBqkhX c=1 sm=1 tr=0 ts=694b87f4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hJpQIKcYsydMz8RtK9gA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: tPFEJfZGG_kRgkl6SG_Q7yDoz7ceYvvW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240053

In iris_kill_session, inst->state is set to IRIS_INST_ERROR and
session_close is executed, which will kfree(inst_hfi_gen2->packet).
If stop_streaming is called afterward, it will cause a crash.

Add a NULL check for inst_hfi_gen2->packet before sendling STOP packet
to firmware to fix that.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 6a772db2ec33fb002d8884753a41dc98b3a8439d..59e41adcce9aadd7c60bb1d369d68a4954f62aef 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -963,6 +963,9 @@ static int iris_hfi_gen2_session_stop(struct iris_inst *inst, u32 plane)
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	int ret = 0;
 
+	if (!inst_hfi_gen2->packet)
+		return -EINVAL;
+
 	reinit_completion(&inst->completion);
 
 	iris_hfi_gen2_packet_session_command(inst,

-- 
2.34.1


