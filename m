Return-Path: <linux-arm-msm+bounces-86936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63839CE9341
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 10:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DBCFA3019E1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 09:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935642DCBF8;
	Tue, 30 Dec 2025 09:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dYIdQQmm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J6XHg3xc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3107228725A
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 09:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767086235; cv=none; b=o69OhzqZwozloV+EEMiW10k3sUroa7XI/Q2SaLISmowbX2I5845vUF+BAhhtb/07EJlboRQvlW/xdZI8NJee2Lsxg0g7wrKYmpSRj/SHwO5WUEwAkSYkI/w1E3yY5RJ/EXWxjmBhFd0/HeFzYOsBQLBqXP1b4P05su69JGySpo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767086235; c=relaxed/simple;
	bh=OEFP+R5W0TdmFr38wbq8rdvuZ0rIdRq2p8OrrwrGuOc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IbQ66+sUgfrwDnTjqZgTgUQEi7XEnT1kZyCy/MLOpcFoBxLL6dEUZjBNdRpzdrkdYbf7lfCED1eDajKChlKMz4kAQ8VsDVjO1J2HCs6FtFeph5FKT55Vdrk/peXu4JIj1SOd1SUSYn1+BfQOkoHLBXAbGmgbwxlth6OC92ZCstk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dYIdQQmm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J6XHg3xc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU5RfJ7899362
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 09:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Y2H9HrTByKwVMEK6NHL3zd
	BV54N35hz6e6E0f8xL6x8=; b=dYIdQQmmcoLWFb1sLjtzdeDIrykgslgyLkNDZn
	Hx295L6i/hDvKqpK147JbGJtnmidHpJwkV0whUiL8z51n911JoRvKt0fLNg44h28
	JC3f+5su+uLVh55vOcKsUSUzKuO6YGu3VrT7W5qU9kXfaXXxRM+ee1rZYcsadzOM
	JJjdz+EcnjHH4rb4jmMdRyrlPiOM7umNY1KfgMuWBvHJywc8sqAP4OPC8Ivy/321
	rQY72810RkjGQvNk9YR+juSFlAzodf7QxLGAx1j6J2OuNW03swFi/NX4RanRm2J8
	vukQWAjW5AdO4zzhdU3LLqPn+/VSttFplB6iC1pG2C8yJYHw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc8ky0grr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 09:17:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0a4b748a0so228875285ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 01:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767086232; x=1767691032; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2H9HrTByKwVMEK6NHL3zdBV54N35hz6e6E0f8xL6x8=;
        b=J6XHg3xcylCxLUqqH5J8CXZQdI9hwVDOKrClxjuOMt3Fv1C9FmIT2g/e3LTTEYS/+Q
         mll5+/Q0Z8HG3wm9qYPz2RJu5yq9L7vANqPk/mWYa8Hi3T4H7O+9EDtfQC2cKocjrtZ9
         79dIJN52rpUyHb7mTDyBAvaQuVIMrjYFZrvhyVgH4BiQSxRRlT+/PjXxacuiCgH4LE0C
         2ld53Y/IVUv10Ymf4YQ4wg88otQZD84vqqAfu2V2YgOYfjYyPwVqj5p22PKFPsIKqKpb
         JZsxyKy21a/OElyw4+b+UCOpf+KJc0LEEYC4062wdaSxYNH/fe5mHpDNUpSHhMm692Sg
         aIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767086232; x=1767691032;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2H9HrTByKwVMEK6NHL3zdBV54N35hz6e6E0f8xL6x8=;
        b=WW58yk0IDxnJF5bw4BoODJHiCEIYzwUTC9RlkPyKh4ZAnCSApD8J969vE926TEkCZC
         alPCXVaHN7f7ZzhnJ53LUU0ANu+WyaPN4mMus2KY5cKBOobEslsdOmniqj+afaAakqSn
         ZRvSAc46xh87Cg4hT7/OBICS77NTUr0iO8bIdvx+rQQ1wGOSO/9AKDYCNn0BYDKuXE+9
         6k+I9cSBAvw+sE4oGgMxABe7FAwfNcG2cb9XedBvrNa+ORCG+fNy/FS+eL/nl/UzuDl3
         yj3TualnPcQoF4e31iqob692O3IM+Ce98I04mqgZnDRFQdqEaCEVloQsleQ02ltmbxnW
         x4+Q==
X-Gm-Message-State: AOJu0YwyHdjTDWR5qsALRRR4mtfng5oTdCD5gqzfw42vLkdxHVKHIqGk
	mZHe2G/BIOGYSuDeZPmV7E+BOI/URoQiSMpyU/AIkY50ZhAnZ7xuS+l60+m+xtcai1U9KmqP5tA
	KzVh8+liO5BLnJF9d5V12BLMulzN1qGcj/3bCo4Dw5OiMYkfSLujaNQrIbhoH/ILAowt66l+tJN
	77
X-Gm-Gg: AY/fxX7gG7zKr/++tqEjpFh5Jv8idT4dpQjZl1+1zuSv68aA73L4DViRvHRhrKZXnU3
	BvN0AzLbxjFmY6MmRQwSe/O/xYJ4ptWEVGM3ILxQ/XGhb05lqcCHgtRmG4fZqIZl1vaDi5BvImV
	bvPBnmqm4/N09h+19Y21zThs8KhGh5OPwVOm/TI7MqxPfcEN4PsaaynjTvuVTF7jgUut4NXsy0G
	a6moKC3XVrn8KlIxZTx0/SlxcUpojZhY8oi9STPKa4QrXqxBUJQWlK0dY8UFkF5DlsMfC7vFemX
	zhMS5Xq5HEf07Ad8pLekQBnQu8jcFjKUWvC+jWPyA2b5H9HWTG+8bInMsSFtd4mDWMZ9eJFf4ql
	zhjmRp40eVlBUEjdYoBihcT+j3Gx1/+W6qTGnIHmikmpfzcqNO4TE3YFqBLTPzqWxtnK/vd3vow
	R6OE+2MpU=
X-Received: by 2002:a17:902:e74c:b0:298:5fde:5a93 with SMTP id d9443c01a7336-2a2f2a354c9mr339312415ad.32.1767086232424;
        Tue, 30 Dec 2025 01:17:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFu0YURIBL2I5NuLZPSURk18DQXRfkY6JIrOopCNmJ9kAdUTUUIYFgMkA3tVNzOdopoingwyQ==
X-Received: by 2002:a17:902:e74c:b0:298:5fde:5a93 with SMTP id d9443c01a7336-2a2f2a354c9mr339312115ad.32.1767086231852;
        Tue, 30 Dec 2025 01:17:11 -0800 (PST)
Received: from congzhan02.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c6661esm289208185ad.2.2025.12.30.01.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 01:17:11 -0800 (PST)
From: Cong Zhang <cong.zhang@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 17:17:05 +0800
Subject: [PATCH] blk-mq: skip CPU offline notify on unmapped hctx
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-blk_mq_no_ctx_checking-v1-1-2168131383e6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJCYU2kC/x3MQQqAIBBA0avErBNUMKqrREjaVIOlpRFBdPek5
 Vv8/0DCSJigLR6IeFGi4DNEWYBdBj8jozEbJJdKSFkxszq9HdoHbc9b2wWtIz8zrkxVT8rUphk
 hx3vEie5/3PXv+wHGx2XWaAAAAA==
X-Change-ID: 20251226-blk_mq_no_ctx_checking-05b68f5b8b9d
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, Cong Zhang <cong.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767086230; l=1670;
 i=cong.zhang@oss.qualcomm.com; s=20250926; h=from:subject:message-id;
 bh=OEFP+R5W0TdmFr38wbq8rdvuZ0rIdRq2p8OrrwrGuOc=;
 b=ttI4m9W/1jpUSabnmV7CDfIDqysMDbcEQyd1gfWm3Pe7Irj/LaC+uu7KBnnn27xVW4TUQdKPc
 fTB6oMnCLMRCR6ZmX0AoPW63DNW4QRRF7aw80K8IP9Poo4djahtorV5
X-Developer-Key: i=cong.zhang@oss.qualcomm.com; a=ed25519;
 pk=8SBh3ey5igz2nlW+UFC6khFvaNPgG7MmbWtAeO2s6n8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA4MyBTYWx0ZWRfXwn9mk+p85lfd
 WtYNLJUJhJ/SHBD5/1KQULOApehoog0zXIuRPMQDQ62J3b6whJvGj5TEJTvc0ArAMHvdQrYYPoP
 4g+bNL9bB1ECmXSdrMoNAz0R6RjJHex0vaiLEVk+F4Dzy8cxztJiSbjhj/+wxTze5h9rDYh491q
 GAIPoHdWlM4ODAsvxqs+gDniT4HzIQnGgGeWQ8C491B/blEKNd3Rk0RNsrYUiHt8LA70slFzeKj
 MZXOwVHfT4kHyNqKAu9VqdsVKsbyP+Y9IUlIam+15OVfHkbcEXhee2kb0XPYj08t2eqIablGNQ4
 iafxmMMziSyTTgsaSe2lnfbpzSVFLZ4RCVaplWshRC3B1J9X4VMzUc34VDfLtAJRomSu45vmSV5
 3MhVT4SLYF+SlvY71RoJMmBWXtPZvSo+qGUWJF94seZkZffJRUrIwMubrordZpU4/Zaizs1gnqP
 V5nVNsy0nk0hvgzSxlw==
X-Proofpoint-ORIG-GUID: 9427DrtFDZFf38c2WZz94x0RXrWFYXdK
X-Authority-Analysis: v=2.4 cv=BuuQAIX5 c=1 sm=1 tr=0 ts=69539899 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=X6FGcEPeVORPTCNb1acA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 9427DrtFDZFf38c2WZz94x0RXrWFYXdK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300083

If an hctx has no software ctx mapped, blk_mq_map_swqueue() never
allocates tags and leaves hctx->tags NULL. The CPU hotplug offline
notifier can still run for that hctx, return early since hctx cannot
hold any requests.

Signed-off-by: Cong Zhang <cong.zhang@oss.qualcomm.com>
---
This issue was observed during CPU hotplug. If an hctx is not mapped,
offlining a CPU can trigger a kernel crash.
When a block device does not map all hctx, some hctx instances may remain
unused. These unused hctx can still receive CPU offline notifications and
enter blk_mq_hctx_notify_offline().
blk_mq_hctx_notify_offline() calls blk_mq_hctx_has_requests() to check
whether there are pending requests on the hctx. However, unused hctx do
not have tags allocated, which leads to a crash.
Since an unused hctx cannot have any requests, fix this by returning
early when nr_ctx is zero, skipping blk_mq_hctx_notify_offline().
---
 block/blk-mq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index 1978eef95dca3fb332a73aeff7b9613ee770a8a3..eff4f72ce83be80aac9da86aab35079be7d2b5e4 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -3721,7 +3721,7 @@ static int blk_mq_hctx_notify_offline(unsigned int cpu, struct hlist_node *node)
 			struct blk_mq_hw_ctx, cpuhp_online);
 	int ret = 0;
 
-	if (blk_mq_hctx_has_online_cpu(hctx, cpu))
+	if (!hctx->nr_ctx || blk_mq_hctx_has_online_cpu(hctx, cpu))
 		return 0;
 
 	/*

---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251226-blk_mq_no_ctx_checking-05b68f5b8b9d

Best regards,
-- 
Cong Zhang <cong.zhang@oss.qualcomm.com>


