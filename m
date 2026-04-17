Return-Path: <linux-arm-msm+bounces-103479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPnSGuLi4WkKzgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 09:36:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D00DA417FBB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 09:36:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F746300E17A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 07:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB1A9377543;
	Fri, 17 Apr 2026 07:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UkaTCHx0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HRJZFq0u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366BB37883D
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 07:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776411255; cv=none; b=OoaG5Z1QW56MWnBljaEP+mQ3M0xRz0eFjrDbdSpvjiLAGJTaxLJTCRtuzigU4CV0t9QMHv9DK8O/TSVrMtBr1LyJF93y2+P7xt9S3NG3/vyOU2q0tUep04gdve60aR9I8IdNHnlKEnIHM74UNVEKOnGDAiHoTBEae0LDQCfcMTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776411255; c=relaxed/simple;
	bh=/GxrqyShWZhhCu9NPNw1MksJCRtI3frvzN1IvUNV9Xo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dYwjjnXjS84+/EF8HgUaoKgIQNVtJdmKI+bo+VwDSJ7LMkIEkbJdSWVVRq6D1NwTnZS+ZBrZOcdya/gTTbO1BdWBAcKjoIADVRPCcOCQomKrA/1Kzj1wRRJhgHAoVJaNODfSm3rGgdiNoIaw0dq5pR+FUWDHih3UsiC4pbHXtVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UkaTCHx0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HRJZFq0u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H79TFL3942119
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 07:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mzlwHG7jhot
	LNRO30L9UEJODwYWeGVbGNVOxC1oDuvc=; b=UkaTCHx0RtCDf+fkEkOhUHMBWjg
	3J83PH9M0UvtNbr8tdG2ZT4RkRPt2ImAaEUFe9m+SWSTi7yIlAqeDtVFX0KO5aG8
	n5DXxjvEUaP7jPIv770RNiG/b1GopU4phME+XUfS47P1A6NOWt79RHzKi3qF80Zs
	DDbun5ElxRMAE12FkSuDsUIDvb19D4oqavvMliOf95HPKU9FfstAOwJasf4kZ9p1
	oBgw8VzPCRnhE8d6IqzGL/hgFzOXudszMFP4Ng6nw9vXvSVpihQMagBcsrpsSr5u
	+cUZOBCR1dWPz538Y+qBZQH8Q7/5YzIGucncFytmdym8jlrC5jLAGLWHgEw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkg7rr4hx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 07:34:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso479013eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 00:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776411251; x=1777016051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzlwHG7jhotLNRO30L9UEJODwYWeGVbGNVOxC1oDuvc=;
        b=HRJZFq0uohC3deWbtU1KyDi/Bubn6Zsv35BbPOtevoJ4ZeaMjRjNA9PTSA4BdAInd5
         H2TucjhruyC5+/NF++Pdq0od+YrZFxSiD+JRBrjkYQFPvXGGliXMJTaToo/gGaH+KjKk
         mesQbs7dsUvfq3kZS4inzyDWaSF1CAav8/WYUtd+SrjXrIF3MBOBiHqQeuxHHz6vxULr
         aH/hvnBsg2PMMWm8WbtcuCDi80ULCnJcAzQqYNOIpZIgnOIRZkbKj65E828ILcReMkwW
         s3fXVPzahN+krNx2qUjhog37T9Vc4WERhicC2WQqc0j1HdGjYoV4lxykmqbZFztosdJ5
         noKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776411251; x=1777016051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mzlwHG7jhotLNRO30L9UEJODwYWeGVbGNVOxC1oDuvc=;
        b=fRYD2RJxyzH5zrXNuZR+ARDvrR+5li7mNmuwJ/+lbg0IoHUeWeEA5wgQnb5VGltz2y
         d1gUFY7PwDCC7HfH/stUXu7+Ea+K8kWc+WyeEZthC/yf5eWZr/t+6dGYmxMuc90GLDj0
         Ai37YqLjFhcVREY2G1YJY7vU0m8OduIPJJDV9g2Vk3Ptcsrf6IfKVsHxxhknGxnumuN7
         TY2lOtxK8vePx9+9Fi5kXEZFL1BH6bBKVPtSss1ETNwt4i8c3LXmaj0UymPtS7hEcMjS
         /G/mzLdzClF84cyPviqQbIDMkGWUD5VJ79wB25ENvE21XcHQRUmeAUOP68dWd4sb/N1t
         Nu9g==
X-Forwarded-Encrypted: i=1; AFNElJ8tz7KHBA5VCDjgvZP24qn9pcHb7kOwgJGyr+eL6XmSFpmq2+MmdfJ8KK20QtiZdoVAt5ZCJhVstT6iLz1k@vger.kernel.org
X-Gm-Message-State: AOJu0YxC1p4kWrxfWGMiwFUPEGUscFrVLm57R+vK7+4AmuFSelOScslz
	oMbRc0y1DTvnIBr9goy3Dc/fSHaXzToyE9Xc9Xvw+SjkNQB9duYoNTvcal9nfdezZlG5AaFBrWd
	KhgkZUBhvBeZuDgwLOsvlDXnkdFTr6J9enbjUt9/G1kfdE17JwIPELv/BQcHLz+bjiRUd
X-Gm-Gg: AeBDiesmS8/jbEXCrl8hoEg+Wx0Fo/+pPRAgdn7aoPsf+QTLYD1PaVHjqVnn66EKZkC
	geP4lrLviVNYGDLKEC/KqbreNG0XgKMV1Trw/a5N4eZkZsBsucN/FAbWF/RdgjgeS9hdWsavDBR
	SwTg47Fm9qSo1XVValzqzfxzEOen6xc1Jwo5eFIuOS4AHEWtNzlB4E5YTlZhHWORaVOnX3Klmpz
	TngcTNpdGeerJmjz+ewV6S3MgnFMN+B6PRLuqcwrw1EJE8iu0iq7TmyvpxyW82UeR7lV+Qo/0AO
	yTre0b6crBCQdSfhojEoUC7yVotKad1bXLY4CjvmSUINmIi3IQaDhIVRnUd8mdJ9o3aIK69DXBr
	KP+W5/S4HP9MAOJl51I56/k6WV7D9FwkHsjWf0LtljJokWRPpakr4fUAqqrCTPs0LPxZiNKA9Ev
	sS4pgiSV4ibvU=
X-Received: by 2002:a05:7301:4591:b0:2d9:6373:ad24 with SMTP id 5a478bee46e88-2e479214a0emr691213eec.26.1776411250717;
        Fri, 17 Apr 2026 00:34:10 -0700 (PDT)
X-Received: by 2002:a05:7301:4591:b0:2d9:6373:ad24 with SMTP id 5a478bee46e88-2e479214a0emr691194eec.26.1776411250104;
        Fri, 17 Apr 2026 00:34:10 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccd2564sm1135168eec.18.2026.04.17.00.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:34:09 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v14 7/7] qcom-tgu: Add reset node to initialize
Date: Fri, 17 Apr 2026 00:33:36 -0700
Message-Id: <20260417073336.2712426-8-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
References: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Ojf_NyTnB449lateILu0os4gRZ8TsfLR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA3NCBTYWx0ZWRfX/IcyBNOwixha
 z15a3E/oOtkIYv4VziUoybykbjN48zYKMNtwrjvz4erfEX0QCRvK78Xt352pYeqcZwUqXwuSlrE
 Ze5d5sf3A4h2cUV7ZpBpiBMXEhJz0h/9EBXgGMJqBa+7X+p1e1mJqLPUUHBzVVZoBfKIwVMYltO
 qIYEMmt8ySeEMiX4keVKxkRBAYNo1Km0apciW9mo/E9QjZlAPov2qZYnCZoW8rpjluBQnjvs8ZN
 JJfMX/zCcBQ7qjW0ssW73ZCMyS4u2nk0etBM2/9xxZAc0YuTiXYTQEs6WCNLA3RkC5u9VnObJhV
 seh7o15YNE23UjQOBXAUxFEE8Ti2Gm6zFC16fMvV1r7tva2voHIaIFKvriHryUYpCRodXlsfKUT
 JDjb9j7bmPlG98lCu3qyCzgToZ1VtzKSrLpvMR+/G8qrSL8mavEG1kmdvwWf3VzqexsIUsuwABi
 qwUc7L3pjJKmG5SfL+Q==
X-Authority-Analysis: v=2.4 cv=b4mCJNGx c=1 sm=1 tr=0 ts=69e1e275 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=IgPCHI2mAnvcCQI4J_AA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: Ojf_NyTnB449lateILu0os4gRZ8TsfLR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170074
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[tor.lore.kernel.org:server fail,oss.qualcomm.com:server fail,qualcomm.com:server fail];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-103479-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[songwei.chai@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D00DA417FBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add reset node to initialize the value of
priority/condition_decode/condition_select/timer/counter nodes.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
 drivers/hwtracing/qcom/tgu.c                  | 74 +++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 7a3573e03e27..a6b6019c8ef1 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -42,3 +42,10 @@ KernelVersion:	7.1
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the counter value with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/reset_tgu
+Date:		April 2026
+KernelVersion:	7.1
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


