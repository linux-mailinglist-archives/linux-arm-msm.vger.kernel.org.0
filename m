Return-Path: <linux-arm-msm+bounces-94202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Ap9JlGrn2m1dAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 03:09:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F15D21A0085
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 03:09:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 383F23103B9B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 02:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12FF537475E;
	Thu, 26 Feb 2026 02:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l3E2GLb2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H29zBOhr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9EA37419F
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 02:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772071535; cv=none; b=pOlgvbgn7q2g9rYHOhaB5FZvr7VImKRGjabjzItnavFCHq7fsagC0zYW3XdApNWQECtYOYEvINnhDbl5mP9tnVXdaZeDoAV5AQNycJl+ehmweq8tcbcAV3ndKhnBrnHOrcz6txe3L2cX53YarRFHFVp3HUBy1Q1a/Hor+TrLxs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772071535; c=relaxed/simple;
	bh=UrpgWf+xJx6aMMqxAJ6EHYzF2xVosrLWfQsXPJkdtCw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j5ysjKwLuT8Rds0+gRsP2t+FUlQ42rMzoDeq75Vxh4jFyPsWzJxyVF/8IO8lXtriWguu/datwCsa8euMONsMB3HMyG+dEWKjJ6lUTIJjj24kvUwUVJToy5Lzibe0tVe63ViyFhfo4Fx3DvbxhsWE/EKy6U45bPuFC9D7yB5ZS2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l3E2GLb2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H29zBOhr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PN3ZDN3094995
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 02:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Oc6efl1YSvC
	J4xlvycJVJOfJR851o7jM97hjpoKPK5A=; b=l3E2GLb2z5RVcsdEyc5BnEHDdw1
	75My7oqor1O9wESi9ZIn2/iQitX98Q3rxhWhMD0J3IxLOX7HFNSTK4cGNgUgPz3V
	mkPpjLcggTD0UnCb42bOQzPv1bixc12461pczcNvsab1mbaiGJfMpbJ9B75IIeD/
	21V1eOoMYiK1ao1qYk/03/+aOlJVjMzvAtLyKLD38o1uY91nD5+6PVwC92iutd5P
	VVMLMCaPyv40gjv7uoVBwcZBfkyWLAmA1jDYkt3PzQjicXsBGilTJRmdh06TbSKo
	DDzppvtLEbEB6b6bQE3kaRZpQ9dhN7sgwLZr1Odz4RoOG5qs3xm+a4VU4Tg==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjae0rdcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 02:05:32 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-679c448d15cso3584740eaf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 18:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772071531; x=1772676331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oc6efl1YSvCJ4xlvycJVJOfJR851o7jM97hjpoKPK5A=;
        b=H29zBOhrTKm2WP6g+jNu61coMMptTaT6QCKkSeuUhoLMnq+i5mpsMVIpEP2nFPZHxm
         BA9Q26jCTeOzrO+eg0BpQnU/JhCNDJCpS8lyEUxjzTNOmBK62MTK7kiSk6VC+C1R9+JT
         DXZucXaI8/N6Ozlu0oJt1OvDBdBjQ+zPE0tKIdk/P49BR2XveQ2BEN0s+Qclq2zbfGyh
         3SeYxSPloURnU7neBf8Xdrz/HcpiJOooDBDVmFzEpMhbzH9is88veKFgHuZo6WZSK0m7
         ooEXiQyQk1uolROx0AL+BzBaMHalTDustCU2On25RQlundb24p2Wy98hABehD3WSLejM
         rHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772071531; x=1772676331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oc6efl1YSvCJ4xlvycJVJOfJR851o7jM97hjpoKPK5A=;
        b=nK1nHUZUljvx6obtFGdHC/TqNRFxsFyanU4xEUtKQct6duSGk18N+2GjAuwC8D3IBh
         XGNxJQ8dF6xrTm5O6BQJHqXTS6y2pLuN71rJ+M2r+zrNLOCuTaNrUA6H8NkzBTu3vawN
         p9lIwAxj9j1nz8WfSwrbsxij4Ih2te+wXgWL4ZLtSHffGsHmR109MYHhfNBnsh7J0mmx
         RhHk3inUHUC7ACyb4AQ35jMKnOXmexe5Qrl2Ndu8dMC+ZVHWM+UicBGc8wLYHxtjD9mm
         BcrA3cGrbcNopSWJOl6aXhrBxppv1cI8k41f0Y5EtuD15v+o4FDgbmpDKeEEGHnJo5/c
         YWhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVm7JTZBuvHUXAywK0pFx/dssDd89dokLZCH5Pvvt2rZUlEnXBI4M4YFG+g3siPl7rql4U+jXXBqI1UjpY@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy5uui0ksbRceHPrcryTYyocMAkjhvtjJnz/WZvhhT0q3AfED8
	x0+gN/phTxbhkUlaxA/9SBdvFim/vuYYHc9cpGd6LBHoKJT74QpqYK0BnrFFAsdASXPqslmVW7p
	MTvJr1Sx0Ld110lhcLDina4ORcV13cQPDP0sH0ihQl0878QrCa3CP8THczCsdz6sDf1wb
X-Gm-Gg: ATEYQzyOqkiyCyF+BEd4xQp7Gp8KpBmhh2TM03LeE+Ooeouu+5iHf1sBk1qGGQd/aIw
	hyGNGQyIz+uOzk3/KGuti7Ruq2gm5JQMd+8FaFLhVuOF68dSoGt4kofOUd5LZ4rtmWoqyho2NAM
	2fhWbJM4Ck2z3RZIk7ZM9kNdTaZ+WNg2uebse0G3HKBqyRkVFLpL/9+TGT9OCVY9eEMkbV5gjEN
	xMEeOyLlXc63rSpmgIdD+yQNM48L5dXIOKmUDtD7XaD8xaxRBDmfa40HPX8OlxMhbF8JwS+oVBn
	r6slQFXzTqvJ1CSgfURUZrVsA5UkX4qjfu0LWCYeqQV1mBfqtmlEMF6kcZtx0Q6gdMKjXmHpBAP
	VXGOk0OI3YacWnyrVxFfpY6rEfDw4lJ0k9DdGGzxohPefse9PiZejrXdc+swe1M02zjJ+cCvMEW
	40
X-Received: by 2002:a05:6820:1c92:b0:662:f660:5a1b with SMTP id 006d021491bc7-679f3c0761emr294778eaf.0.1772071531475;
        Wed, 25 Feb 2026 18:05:31 -0800 (PST)
X-Received: by 2002:a05:6820:1c92:b0:662:f660:5a1b with SMTP id 006d021491bc7-679f3c0761emr294769eaf.0.1772071530953;
        Wed, 25 Feb 2026 18:05:30 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679f2d9e8d6sm549939eaf.13.2026.02.25.18.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 18:05:30 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v11 7/7] qcom-tgu: Add reset node to initialize
Date: Wed, 25 Feb 2026 18:04:54 -0800
Message-Id: <20260226020454.3210149-8-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260226020454.3210149-1-songwei.chai@oss.qualcomm.com>
References: <20260226020454.3210149-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAxNiBTYWx0ZWRfX/Idsz986lNf1
 RKHj8/tzxawT1u4zAp+z26VfpGEWvVKj04h/rb6Y9CWEY3ZavPUDeKmCgY5s4v4XUvVBOrLrIk0
 dT8hh2ty+aTXzbYSw573yL3RSHXoZRkXJbR4K8QymcXjho8oaIVpGDgMfxMRQMlRIMObqO67qjT
 w0duUQL/YHns8PXQUym4RrLs09iPSX+0jAPIWl/31ssE2P951VTwVoCWPsCWO9Qi+eOB1UX4nyJ
 RKpMYVZi71VIl+YnuA/0GvImqWbTd6hEf+CsPC9/Nry3e9yZqLqFI53JHKNnFIbenYi9bRiFohX
 tBVRu0p4rApTafJmSRWVs3OmJBGmBU+Q0loU3Ke/G0OKFUqEnhrfGzOCF7GxsczrTpH53+QK6ss
 70piOdm6iBy1oncNPyF1GH8RXwyFNGW5FSyTOEcQi5y+/Zf2Z/H/Dwj7hQeCyLRzdMgllrK3EWg
 r1YnFwDupBdgk0ikd1w==
X-Authority-Analysis: v=2.4 cv=O7Q0fR9W c=1 sm=1 tr=0 ts=699faa6c cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=IgPCHI2mAnvcCQI4J_AA:9 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: r8Zhp__3CwvnFb-d0ficyaXdpo715Xwj
X-Proofpoint-GUID: r8Zhp__3CwvnFb-d0ficyaXdpo715Xwj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260016
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94202-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[songwei.chai@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F15D21A0085
X-Rspamd-Action: no action

Add reset node to initialize the value of
priority/condition_decode/condition_select/timer/counter nodes.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
 drivers/hwtracing/qcom/tgu.c                  | 77 +++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 9daacd68eed0..3ff34a769d94 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -42,3 +42,10 @@ KernelVersion	6.20
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the counter value with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/reset_tgu
+Date:		February 2026
+KernelVersion	6.20
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(Write) Write 1 to reset the dataset for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 4539415571f6..e28e6d27cf56 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -410,8 +410,85 @@ static ssize_t enable_tgu_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(enable_tgu);
 
+/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
+static ssize_t reset_tgu_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t size)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	struct value_table *vt = drvdata->value_table;
+	u32 *cond_decode = drvdata->value_table->condition_decode;
+	bool need_pm_put = false;
+	unsigned long value;
+	int i, j, ret;
+
+	if (kstrtoul(buf, 0, &value) || value != 1)
+		return -EINVAL;
+
+	spin_lock(&drvdata->lock);
+	if (!drvdata->enabled) {
+		spin_unlock(&drvdata->lock);
+		ret = pm_runtime_resume_and_get(drvdata->dev);
+		if (ret)
+			return ret;
+		need_pm_put = true;
+		spin_lock(&drvdata->lock);
+	}
+
+	tgu_do_disable(drvdata);
+
+	if (vt->priority) {
+		size_t size = MAX_PRIORITY * drvdata->num_step *
+				drvdata->num_reg * sizeof(unsigned int);
+		memset(vt->priority, 0, size);
+	}
+
+	if (vt->condition_decode) {
+		size_t size = drvdata->num_condition_decode *
+			      drvdata->num_step * sizeof(unsigned int);
+		memset(vt->condition_decode, 0, size);
+	}
+
+	/* Initialize all condition registers to NOT(value=0x1000000) */
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_condition_decode; j++) {
+			cond_decode[calculate_array_location(drvdata, i,
+			TGU_CONDITION_DECODE, j)] = 0x1000000;
+		}
+	}
+
+	if (vt->condition_select) {
+		size_t size = drvdata->num_condition_select *
+			      drvdata->num_step * sizeof(unsigned int);
+		memset(vt->condition_select, 0, size);
+	}
+
+	if (vt->timer) {
+		size_t size = (drvdata->num_step) * (drvdata->num_timer) *
+				sizeof(unsigned int);
+		memset(vt->timer, 0, size);
+	}
+
+	if (vt->counter) {
+		size_t size = (drvdata->num_step) * (drvdata->num_counter) *
+			      sizeof(unsigned int);
+		memset(vt->counter, 0, size);
+	}
+
+	spin_unlock(&drvdata->lock);
+
+	dev_dbg(dev, "Qualcomm-TGU reset complete\n");
+
+	if (need_pm_put)
+		pm_runtime_put(drvdata->dev);
+
+	return size;
+}
+static DEVICE_ATTR_WO(reset_tgu);
+
 static struct attribute *tgu_common_attrs[] = {
 	&dev_attr_enable_tgu.attr,
+	&dev_attr_reset_tgu.attr,
 	NULL,
 };
 
-- 
2.34.1


