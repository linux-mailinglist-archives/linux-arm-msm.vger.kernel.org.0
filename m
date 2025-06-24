Return-Path: <linux-arm-msm+bounces-62159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAE0AE5C8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 08:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2D7B3BA7E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 06:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 419BF2566E9;
	Tue, 24 Jun 2025 06:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FdU6f3Gj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37892550C7
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750745131; cv=none; b=Hg2TjplEAWsw1P1w0M7+ql6gsCCVbqxyOiFu4HcGpku7uAuwKCTL5KV8sRJ81kEcvpokzJ5FkfQJd0WvVgqTzkc+5OxPmUKU91HknNvJsdQW3DJzn5nIudFA38y1Xf8tOPgJdcy0CjVQWKy9u0jUWYqes4C4CnwVGQW6I1C5zqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750745131; c=relaxed/simple;
	bh=d/N/TB61i7GeVIWGxfjbRQ9Z2F1vTqrm+bBemdmjw3Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HP9CFzuzFtIoRZkl5R2E+SIeuWe929dxFboO32yNxdNECqQSQvWHiq+LcE+O6I+zc5yC/jDgm8OjtymKgubwkyLbHt+8UaeyHpcqEqoJ1ZrILsM0ewzYZHLHf/2gb5aDNFuoDGUw5yGbYi16ULl1vRxOGBXocv7dqURcd38MVrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FdU6f3Gj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NKlpAA022985
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=x07SNj1YXpj
	6RfRQ48AeQgzrdGK/jYfZ/E/HEUOOxeI=; b=FdU6f3GjHRbFs8m3J6pr3YFOYam
	OchjWHIfYetew5iKxw86RrBnjvgD6LYTBIDRHxeMshXe3QX60V/KTOaxrJgMgwt4
	76SWEZHMC8sv5BUVcPjB8fx5mOx/UuSPiIdbQQc3dL43jPGJs0fnUXcfkuFOaFCY
	raV8CAqeq9Q1iCkhY45zclLyO++C9IcyE7+Dir3uW3Yy0nkfTp90/fQiTS3CJquA
	de38y0LS9NyUXrrP/fH+rqfZXQdcmmnoIev8Lyqr+yhsNFQ5nfV5KatUf0Svj30l
	CmU/Pjp3fMGUUL+OgFOFLA1JY/rgxbhFmu638RgMNLDvPwS241Jp5bNO11Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgb0em-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:05:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23689228a7fso847205ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 23:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745120; x=1751349920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x07SNj1YXpj6RfRQ48AeQgzrdGK/jYfZ/E/HEUOOxeI=;
        b=uMPn27GD9EoLcoAKkBFI8dqkhG8+i4+ewzABeKFMJz43qqSBBI0tBqQboM4y8y2gbP
         8j9z3hz6R11rlkeXehm/llyMmE3vzSPDRea+HpwZIwYvJSsMYK/JCX0j9Fy+Krcx105g
         oKwHDxdU4UV8HkJPrlySYssigJiX1hhYExr7+Y2GjLbmMKBpP16+K/lovH6EIUaWNncn
         h5qCgGwUbQsfoVsVqROqTCPqS4REKBO0ms7DPEZVd1bnnJqaHpl1ZCOa5+6vVUvl7l2j
         EWxgRr2pNx5AVV8a+3SDtKC0nLiJ5CuWqPbDRIXN1heW/0yk/NyizxfD45UIBmLSoaAw
         gDsA==
X-Forwarded-Encrypted: i=1; AJvYcCVuIt/PJzw4ns3WbnQY/skuJQwP8vMz580G7KNXbIejAx4nVaZRxGzsX0L5Cowxad/DDDOxyqQBOYnyQ91P@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8wBdLp067e5QlelP5BCB7mI2jnXo4AjOIlopxnQFEtvZjyi3U
	j0ImdsXaX15O/pXjwQ9t8L2lQDzk0jvlxeYzbvzAPyvsr6iNjAAMXZHJkqZH7MhuuPuSprc1m3+
	7TJJXOuTLzMyQDCqKvV7IiIr6lElNWxdytmOpVu7X+1vxr6Cgizk4VjXczUDFLzgO8DHi
X-Gm-Gg: ASbGncsKkPWgMefVVZBlCpm4onKMx6SCqlL5HUhlJddpXqDR3vbs7jC6j3ggwMUDMWo
	hgyZI/Q3GRFYH3zcJro1kw7U/JcRx1ewUByzOjHwOKMVsWSZfKUjuUV9w5IqGFDwtlMz5OAGuF3
	gbuqcjMA7oqfWwY9EBjyUZUrl33clKguIco8kfPt7RdjOtU3SKmgNatKD8cdf94Qswn/ThoTfL9
	7MrQdSPndv+4zHUOBeGgA5Besc/YIMbZg8SAX067miEqcSh2IMv2QNMwmL9NySL3aEzOaLiMxus
	WQdoyMmScbJtZVMejK979mdIrZRM9qM6kesS/fHdpH7Mhr6BvXBnLfK14iyIRAjTkXkEWnGUdGx
	J7w==
X-Received: by 2002:a17:903:2d0:b0:234:8a16:d62b with SMTP id d9443c01a7336-237d970f9bamr253276015ad.12.1750745120412;
        Mon, 23 Jun 2025 23:05:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE97aOL/swaHhYhRTiIKSN86TTBXV1K7HhrE7lHhuqfmi5WW9OInNk27uiW+r30tmlu+zChDA==
X-Received: by 2002:a17:903:2d0:b0:234:8a16:d62b with SMTP id d9443c01a7336-237d970f9bamr253275655ad.12.1750745120065;
        Mon, 23 Jun 2025 23:05:20 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83937b1sm101371455ad.52.2025.06.23.23.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:05:19 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jie.gan@oss.qualcomm.com
Subject: [PATCH v3 08/10] coresight: tmc: add a switch buffer function for byte-cntr
Date: Tue, 24 Jun 2025 14:04:36 +0800
Message-Id: <20250624060438.7469-9-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
References: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PJ2R9jT8GqeiW6gyJ3RRNRFP9OwONfr9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1MSBTYWx0ZWRfX19CPq0cOsY9p
 gU2+hkG1JI78Uxi+jadFT+m0BUcz5us9fNFQ5ZKYLR3ZLNwDrF4GJ8ZuaFpBpfCYFoooFjIZnl5
 XfPqkGHx9Bk0g1yJuMcuCTgBc3jwkYHkibb3HUCwuz/kavFVn8DvWZxK1i6mOOScD2aY76MXBRL
 QAxXULuDgh0pVw6ZD+VLbnrxCoZINv03gWv9OK5Lk1WajRT6Qqj03aYMZH8FYpTKrzRv36ZZzqE
 psTN+nPChblxNUbIo7BcOuqQGSvzDCJ79BztOESX6x1zknccLGP7J6XaigWOvpOUD6MEcLFGIHD
 JVyDf2BcyrEEPcjm0MIOsmW8Ldj1Mmw+4BaAbX99lAF3vU3NvOutwlaKCkszs62xleqc3EE2/K6
 RmGnSCVgAs/RXkzMXmzzIhUt4ZVFvpAh+fbAZKOBa4Ec3HHU0YVsNbtmEG7xrMiLdLWRLaKx
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685a4027 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=wDWrKlMOwBuH9W2KgGoA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: PJ2R9jT8GqeiW6gyJ3RRNRFP9OwONfr9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240051

Switching the sysfs_buf when current buffer is full or the timeout is
triggered and resets rrp and rwp registers after switched the buffer.
Disable the ETR device if it cannot find an available buffer to switch.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-tmc-etr.c   | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 2b73bd8074bb..3e3e1b5e78ca 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1287,6 +1287,58 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 	return ret ? ERR_PTR(ret) : drvdata->sysfs_buf;
 }
 
+static bool tmc_byte_cntr_switch_buffer(struct tmc_drvdata *drvdata,
+					struct ctcu_byte_cntr *byte_cntr_data)
+{
+	struct etr_buf_node *nd, *next, *curr_node, *picked_node;
+	struct etr_buf *curr_buf = drvdata->sysfs_buf;
+	bool found_free_buf = false;
+
+	if (WARN_ON(!drvdata || !byte_cntr_data))
+		return found_free_buf;
+
+	/* Stop the ETR before we start the switching process */
+	if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
+		__tmc_etr_disable_hw(drvdata);
+
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, node) {
+		/* curr_buf is free for next round */
+		if (nd->sysfs_buf == curr_buf) {
+			nd->is_free = true;
+			curr_node = nd;
+		}
+
+		if (!found_free_buf && nd->is_free && nd->sysfs_buf != curr_buf) {
+			if (nd->reading)
+				continue;
+
+			picked_node = nd;
+			found_free_buf = true;
+		}
+	}
+
+	if (found_free_buf) {
+		curr_node->reading = true;
+		curr_node->pos = 0;
+		drvdata->reading_node = curr_node;
+		drvdata->sysfs_buf = picked_node->sysfs_buf;
+		drvdata->etr_buf = picked_node->sysfs_buf;
+		picked_node->is_free = false;
+		/* Reset irq_cnt for next etr_buf */
+		atomic_set(&byte_cntr_data->irq_cnt, 0);
+		/* Reset rrp and rwp when the system has switched the buffer*/
+		CS_UNLOCK(drvdata->base);
+		tmc_write_rrp(drvdata, 0);
+		tmc_write_rwp(drvdata, 0);
+		CS_LOCK(drvdata->base);
+		/* Restart the ETR when we find a free buffer */
+		if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
+			__tmc_etr_enable_hw(drvdata);
+	}
+
+	return found_free_buf;
+}
+
 static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
 {
 	int ret = 0;
-- 
2.34.1


