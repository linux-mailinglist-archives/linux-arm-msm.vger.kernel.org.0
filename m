Return-Path: <linux-arm-msm+bounces-115576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DETcKSKtRGp6ywoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 08:01:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F32F86EA113
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 08:01:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Up4mXx6v;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KRW8ARC+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115576-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115576-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0C723115003
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 05:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F345395ACE;
	Wed,  1 Jul 2026 05:56:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9343E3947A4
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 05:56:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782885383; cv=none; b=tkaCULJKdOH9eWFtUo68ebczrs+yBYWo+NJrIufGzxNe7OHGC3Ih8PNIectd/dQ8s4YfkqjvsfxSMzRD85dbu6AZBvBEOw73+Ji2hb5HLNTfcf9uNsgpFsz4kW9SpY5gv6SjcwbJVXEt9+/qGBoJb7yICjhh7VLZF/qEHReMsCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782885383; c=relaxed/simple;
	bh=ncoQ2cfYtWnzIY8gFtSR8fGUuzOhKe8thmsWYryWtaM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p3j0XZ6dUT7DaZh3ucDAHkvFaOT0jPDhVITk+XzdRzbQmEntyzFK/k/oPgKmsAisUGeZDdA9kTui5WCSbXMj1qQLzcT8yBLKZABxNJLa6+DQVDA2UV1d3+ifGKkUMzbg8SzL+N/TOzPzQKaUblGYzI3Jl5IkKTmeHk2O5aKNw/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Up4mXx6v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KRW8ARC+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lkAi145255
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 05:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NjlH2n0Y7dL
	EZ/GZ6FO/PlPMn7f9rV+JPlftsjUFv94=; b=Up4mXx6vU5m7peDfWMiHM7UgayS
	VIDNPj/TywOf3r832SWR7boTbFnWkDyFI2jtfcxeqPBIjXHyNY1HuyFe4XIyg8xX
	rLEaUhWnc6xgonZpvV/0moMOV2HMarF1Z0OUqYuyAikgJPVLaf7JOgXzn+1eX016
	OOsdC2qP8V8XP+EJJy5aS21YDhXMhwSFaAoL7Hl78fPFnwqKpyFpBAc8njeVtfaE
	3HTPKCMOpghBagtPvTborTJPnETgl5TNbLglQNC7nnrkI1Ok0zCGcOlEmXc699GX
	I5pqO9Ltl+/cBT9yhX5BuWRikM8HOaeSorrtCKgzPBU2Xx8RB9YxzfKc+zQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jktad4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 05:56:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c825562f8bso3517795ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 22:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782885379; x=1783490179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjlH2n0Y7dLEZ/GZ6FO/PlPMn7f9rV+JPlftsjUFv94=;
        b=KRW8ARC+j+3WktrpDJDhzMfOZ+nIHiKQWZxdZU6yf7JBjoiuOXYM59n8VsL1Zurog9
         8TOVvl//NGRJjVgfrS2sn92jPMrLf/f1kqacsgMcOtHMq/95vb4dgZtJNqRhWs/Bh5d1
         ajJiEby7MywtIw6CnK8cy80lvXuyGjRv5sbKqXWdBOejN5XZIrF8Gs34jhUNT8EpwQY8
         cuHsoCG5HR3JyMgkNJk1ofjP8zCAJh5ho+TGEkT4TZk4Z/ctiHNZcmabc5jQQ5suyRLw
         7QT/Ndv8lFDwOc9kLPMwK1Jds207/FOvmSJ5BumcPaQdZ+GoRvQwlpOPv97Bu0ZMcU9/
         KuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782885379; x=1783490179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NjlH2n0Y7dLEZ/GZ6FO/PlPMn7f9rV+JPlftsjUFv94=;
        b=RcicfpVMX8IdaRzMclNoN3aRnQtgaWgXEFckuxq3zaq2ssE7K8fnwHTpoAY02oOSHP
         UvkEW6NFLBcQYBSjdz5wR/UvoWfADiihah2WJevtDSLPmepuLifm7wM6oV47/famaySC
         Q9uliWW9GKemPSJmBUzW1o/VAqZmI7/+Cih0Iw2SHoSa60yVE6W7Q4y3aOD/TswOvjOP
         d/hsLilqnShQ8ynfIHQMOnBO/t4B5Ov6MiVqHHAb6msyWozP3eGhbBJLe7kKZBR/YxC5
         yztC1SZWPSi8yzYWWeEUq1WBY09kuw5sqanDb0w4VqS1XRco1FNJ30jZYd12XrbRZnIR
         9cvg==
X-Forwarded-Encrypted: i=1; AHgh+RpquBMhB+IyhUmaFmB9oNRqzForRdGRxPID2YVG9nswvMIDt7cqAwwyk142iYXxq5VoDUedSXtrr1j6He3N@vger.kernel.org
X-Gm-Message-State: AOJu0YyPXzuqpDNh9Ruq57UIktHIuoi1I9j1HsBRvntRJy4tR0hV7J01
	wj6SdETbexKZBrPt1k/DaRThTpS3smZQpT14n3vVjg1D6Z+GPboldHf3HWUR7ypAVSwQCZ8MK9v
	xXLo8rxMnvVrn65OoNd90u8s6TYrJQZbyT+0z1MuUnbiT7ViUmEFQeiJi/FiVWEUnqQjP
X-Gm-Gg: AfdE7cmpbs7l22nrgqi5gIVDwhwtqLNzSmm+DCUO9aKh2KnsNTiLa2azAaXlD+Guz1+
	2Y4ccSIcfDxoCne7hyF606gywvPfhQb9d/r6ISSQyMnyTblh0uixcM2JYy2+IGzXzcbHd9loFL9
	pIXYvQB2PAgRvyTN1vOcW1OpEkRvtTIyHAjECMJyvPamPO7sEfY+EhmcEt8K9SBI03lvuhE9yH8
	pVgJvjhWExe5sqG1N24mtrMhuW+K6RbiMENgAfaXlA/dxLozUtGdTF6d+Zxd1Tbg9jATr7JKysO
	is4G8tbjM9Al/k22/eAp1fy/w1e4UL998rjtcWA6rH2/3EMxoTSsLfI7UUv50eJSeCZ4ebWFoZ6
	2dkP4qx1Jx8wRzrUDgs7Ds/BDgKrq0+j+upBt0MwRAO6Z9TPMkzq8EqETFTBXf7MZ3g==
X-Received: by 2002:a17:902:f685:b0:2c9:d88e:f996 with SMTP id d9443c01a7336-2ca7e65408cmr4282065ad.9.1782885379509;
        Tue, 30 Jun 2026 22:56:19 -0700 (PDT)
X-Received: by 2002:a17:902:f685:b0:2c9:d88e:f996 with SMTP id d9443c01a7336-2ca7e65408cmr4281675ad.9.1782885379038;
        Tue, 30 Jun 2026 22:56:19 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382b5175sm25451645ad.63.2026.06.30.22.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 22:56:18 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v15 7/7] qcom-tgu: Add reset node to initialize
Date: Tue, 30 Jun 2026 22:55:29 -0700
Message-Id: <20260701055529.445819-8-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701055529.445819-1-songwei.chai@oss.qualcomm.com>
References: <20260701055529.445819-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA1OCBTYWx0ZWRfX+AYPKUI6C3IE
 URxB5YPHTTGG6EOb87ngC0pEojgwcm3VDGLwkbhB/BHfhwNo8AhDDI5wanTENMHrG30QMOSTQGH
 eASZVb+cVGQCM4gqznJ/gvnbMn7Rf3M=
X-Proofpoint-GUID: ly9cvy-GNFJPlCUlUs-yq5X5A4QFCJuQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA1OCBTYWx0ZWRfXwng1/nZWs9XT
 drV+8X+VwC5/o97MtzORbCAOdTPdZzEiOmAGMv8Lh6jDi5a3NmHZP7mHOf+J3GW5NEQuanWDv+w
 vz5L3PT5rC6whuTpKLtQlKfCDbO/y4T+o9X+RSp3/kGvTvhwMQ/8j0pjv00sXXzaPkvHxEK5BFj
 gedf2Gf171ml4gj8uvUtOUyEs6MrCRAtkyfYR8z0nEJlp6Z7Eq0Lxaa0CpIxBur+21nEAD0oHq4
 u1YMZ4fGNHgaKCt/eKsg9s61G4fAERUXKwRm0+QhVZ6ZJtCTCOL7xYnH2D+t+BdHa0s4ROrapXY
 udZGdNWao58Tk237NDQYKj6S+G5G4GTeWA/6O5ACC0nVfXiAoGbn6wUAwRwFxC2QK9szNdUs1fX
 naygjkxwUbU6hDV66Nl5e8Ni2hqssraewFTCjeNSA0QT2SO44mE5uljLZyZORT8LKr1/26mEb1e
 BURXh4EKXvlKfXzeIdw==
X-Authority-Analysis: v=2.4 cv=R+wz39RX c=1 sm=1 tr=0 ts=6a44ac04 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=IgPCHI2mAnvcCQI4J_AA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: ly9cvy-GNFJPlCUlUs-yq5X5A4QFCJuQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010058
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[songwei.chai@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-115576-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:alexander.shishkin@linux.intel.com,m:mike.leach@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:james.clark@arm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:songwei.chai@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:coresight@lists.linaro.org,m:devicetree@vger.kernel.org,m:gregkh@linuxfoundation.org,m:jie.gan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[songwei.chai@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F32F86EA113

Add reset node to initialize the value of
priority/condition_decode/condition_select/timer/counter nodes.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
 drivers/hwtracing/qcom/tgu.c                  | 74 +++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 7fad11eb759c..cb0710fea9c7 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -42,3 +42,10 @@ KernelVersion:	7.2
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the counter value with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/reset_tgu
+Date:		July 2026
+KernelVersion:	7.2
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(Write) Write 1 to reset the dataset for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 6d5bf2621cb0..9fb51f2a912f 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -420,8 +420,82 @@ static ssize_t enable_tgu_store(struct device *dev,
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
+	pm_runtime_put(drvdata->dev);
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


