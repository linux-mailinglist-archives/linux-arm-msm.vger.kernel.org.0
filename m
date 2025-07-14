Return-Path: <linux-arm-msm+bounces-64760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FC3B0372F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 08:33:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A256C7A84BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 06:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6DC2233739;
	Mon, 14 Jul 2025 06:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p0Ml7n0v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B84723371F
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 06:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752474721; cv=none; b=iFmQOkvnDnn7np7XlLayK9AidgF2sD1uMBtxL+FFwr8Zq8l0lyZAUnPrfREqIKd9YAoBb9HjhxtZAaNwF45L3BZy7tCs8zruRZ79ZsyqjJ831Gha+KIOtMpztfVHRC6qHk/l4p3zMp31eM0+KCf+TQmNeuBhTRgRD22XKieG5RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752474721; c=relaxed/simple;
	bh=d/N/TB61i7GeVIWGxfjbRQ9Z2F1vTqrm+bBemdmjw3Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uorHGxhJkJccB7vZQfUlMRy10Dd6p4flKuK+SkCTE8cyu/V10jsloj/mSkB3oEd6LNCx/qX5qIuD7jWisEnn9hjM9+9FPG/qxLx0wYHPHXcc3TqJPmtJByyDn4n918jXrc2oZwufUZq9ijSZ1AQbku6Rs/B9nKxfX6heNGfV54o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p0Ml7n0v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DMm0L8022925
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 06:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=x07SNj1YXpj
	6RfRQ48AeQgzrdGK/jYfZ/E/HEUOOxeI=; b=p0Ml7n0vTDmc1YlunS231ZIeuoW
	jT/NRHdzV5N7ud9iV/wl48L1N+pjnhRWvIP/vBZun14m4tVkFSRo7zzpYRpAEifv
	VwhE21dCrtAgQESi6Nc5dIQK0YS08/ZUTGzeNXQRoez7mPHx3JmsTdDy7xfK/Q5g
	ujl7LdCj5g7TbHHFnYzNhLs+zoJYhwCkjcDob2Ocr8m55rVgd94vpZfAYbFpalPw
	GLfXp14uEOL/Z4IRfIyEOBHLmf9HvLIkJOguk2beaSPK7nIphx0hKoUMPTtsjPUt
	x/TCH3EQVZ/Zj0aEbBb9+Aons+aN0mx+488hXaUh37kUP3gZeIuk1zWsfVQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxauh7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 06:31:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235eefe6a8fso31166965ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 23:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752474718; x=1753079518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x07SNj1YXpj6RfRQ48AeQgzrdGK/jYfZ/E/HEUOOxeI=;
        b=lEKFp+6UOA8bhOrDKd39W2gkKlyQ9bodTUNncoC2fLYv0pwvXoUo227zoLUiObRM+/
         KJtuE308gwMjQfEWk+5DLXL2zu03FaOyeJZJSeDbmbx+k4Zx2LdiYOdPoCYvMXBG6MTf
         KKlPvi/EZPq2LLqP69YUXWmTXCscPGpN3l5ZVQfb8S3L1DBzUBaHtU6pKJHDZK1CYfer
         gyASh2n5zplOYs4wCrR1pdfy4awdA0gZBfpGToEwVa8MZufrt0aqa1XRHgjO6dBQCCJM
         nz9a3bS93Wy5SIftR/71plovFs3TWsKxrkkhp/b9RP+AhrhRUeRDGGsNXVtsyJaGfpVs
         suag==
X-Forwarded-Encrypted: i=1; AJvYcCVXpYOHOtbHU+rhVE75K/CXFcOmjbrhkA89Co9XH7Cy2ig0v0MPPUQw/e7U6aU8VWYYzQusDOmLQ/PNMoul@vger.kernel.org
X-Gm-Message-State: AOJu0YzwIAmd4rshZnkwTNQ3rPtAMQ0u0ywCOhZFaQ4EYthAG5GK9Ep1
	mfKjJyqqsf4Q60ug19dGym/a6oeg9EGZ+JdTaQ97DAyy0X4fv2XjJP9heD0BWawNxLigtJvhIaP
	wpTfRN0GVa42qnQY8AHHdzeKHdY770PO1FiGbwAUctptOOQJOjaaOf6R9vRevQPsdIou5
X-Gm-Gg: ASbGncsGiBiByEBNNUAXjfTDzpiQMDNKwTc9wzWFWtOOfhHpY/lu3LlT41AcsUBYM73
	u+sgxa+is9iJQx7wyafUQHi5yqKxWfKcqUZVTKHMzc1MLvHGu9VDo8Q4HqpFEdgyIjM/RcMV0st
	s1udCKbZV01hHIbRLCf1IHc+4LBNvZT/s4nprXh1fQC45sIJ/pVU8B/B+we/Q9sK2hjTEZZhhYu
	RDFiEFvuFcumVsUDUJLBhAQPO6CN4epYatH9n+5EnwThgGrFSLpdQNRlCqB6K1Rbg9I/whq3S0s
	XXCmmMh3zGFjjNL3PhNNZMyqKTJrLEQHhn0HfLX8vCZFiSqirfRmYNVydxM1ovdRAD60ENyxU+1
	k6lAdZhx/d/qvU/IrJdky
X-Received: by 2002:a17:903:1ae7:b0:238:121:b841 with SMTP id d9443c01a7336-23dede4611bmr207184745ad.17.1752474717711;
        Sun, 13 Jul 2025 23:31:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfgAAT9PdM9bRbi+at0lzqsfYnbzx5YAban5kucbRgbI52/04jPmJtMd8Ou3a8XsGgoWkAiQ==
X-Received: by 2002:a17:903:1ae7:b0:238:121:b841 with SMTP id d9443c01a7336-23dede4611bmr207184305ad.17.1752474717246;
        Sun, 13 Jul 2025 23:31:57 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4334005sm86138255ad.158.2025.07.13.23.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 23:31:56 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Jie Gan <quic_jiegan@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 RESEND 08/10] coresight: tmc: add a switch buffer function for byte-cntr
Date: Mon, 14 Jul 2025 14:31:07 +0800
Message-Id: <20250714063109.591-9-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NH78INHhMx2Ddhq8usDUVkf0KwPT9CY7
X-Proofpoint-ORIG-GUID: NH78INHhMx2Ddhq8usDUVkf0KwPT9CY7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAzNyBTYWx0ZWRfX/inicsX1pk03
 tr1ccQFRiPWr0oH2qj/A4tNoX6YK0okJSsxlWs1PSzgKJNa5JqM6ddimEEIivo8NYdQeUzjjAQh
 V5qJfUJap3k2FIh9HyjjYVEwQdL4vAuek5QepwEJf8tA9LpVV4vfjXkwsdham56YGJTc1DCTi+E
 ivg2Nmom3OWmTWv28JMNALFWhkmUZhbJJR9mZgMdSe/gNQEc/I+tSklowwPSmf49QGxXcbC8+fj
 lUZs3/ytgXpGsq6Yh8IGIrKQYS7PvdT/yiBrT9iYNdQZ8XFmtiv+aKQKBFxoA3Bd1mgPyK3THDr
 SvFEBDv7tfeZBYFwSngjxA52ezoU6VmQsF8CzQ4RXMde06gnb7ZPbjpiJIQjaJWKN9K5vd1NNDv
 +OIVsJCW+zQ9uCeEhbaOenZOG8CzcWbJezLXVgVdgiu+qlt62gl6n49ULPwPVTfBagcd9+0V
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=6874a45e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=wDWrKlMOwBuH9W2KgGoA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140037

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


