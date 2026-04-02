Return-Path: <linux-arm-msm+bounces-101506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NodJyk7zmmAmAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 11:47:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9846138727B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 11:47:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 91BEA304F85B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 09:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DAF738C41B;
	Thu,  2 Apr 2026 09:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BLfps5bP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IgdCm6Jl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30C63AEF3D
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 09:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775122160; cv=none; b=UKWFX9aCAGF6ZKlR0Qtcg55dympU2hGCWw2B6TYuPiQDOAQpwtYIq2KWxcyD1hwCSfq4KwgXtpqN0AJc3Vm8ap358lYnHrozqUXxGJZuTeWlrthPnehPHVS3m6ixx36arqAa8qMY3wMfq0FHOk2P4xwUy94SYSS0xoz1badkMsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775122160; c=relaxed/simple;
	bh=u0RTqoRtgeoqSCDkkz0FRCIn6kIQxtQe29l0ZLG4Yrg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i/1IHzPUwz4iweT/nz+9l/JYs0Gw7o0qxsqmzFbMG0Ow2YXPVtFrR4lOtgAmFqAUe6pLvgH5THA4HvvB3DnvzBPXiYbg1F9O9AvPUJBU0l63dWn3WYMYQFF6qm4hcQNo4bHwQes2iAsqL8rgOcslRQOhdEZTrU3u6rYgWo2L7BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BLfps5bP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IgdCm6Jl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6328S2PP353259
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 09:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4N7tIyw5iZL
	vzZnTOYoRHg1O5/XCBmsdPAKZlPxWO8A=; b=BLfps5bPumsutZTffiFBEqxm7TM
	UUcYeFGb/mzApNeLNCxDFtFi92twZx5gtyZ94VRfxwI5NFcORfdDvuf814YwUrgU
	v3DaVxR/6fORK7k8sr1lDYtXFI9F1o7knrLB8IaEL7Tv8gAZF6Cl12f1u1+vsSnX
	M+uDsQJIr8nWYN1RoJzgXrs78QIL/TiQKrjza+VEtQir9rSk0GljwgsxyqoYH5y1
	gbaZNbcAvtm4odW4glYdMRjP4hGxQDhY83/jkN+J6B/nwLdX3eX9duEIAn8AB/MQ
	GTcbFwLPOH6DeTSb6kSAkZLGS/4z3yHDmoTbZTm9iRavS/+dr/y6ijvz6XQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9myh87ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 09:29:06 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdd327d970so417041eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 02:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775122145; x=1775726945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4N7tIyw5iZLvzZnTOYoRHg1O5/XCBmsdPAKZlPxWO8A=;
        b=IgdCm6Jl9ULhsxXvn+cn3l6Yt1t2nrCfFVvAxxkKPHobh0Z7j34WiFh8PbBgWKdVrx
         +pQzGZAwFJ6vCeNbQnjBXQkiyem6/pEvuthoUS95WVuf1SQ3uoFLmt3AqaWQri72JBJk
         H0bqKF2C0OId/Ccu9gmmARh73p+1ygH8rtcqYFr/2/iLOce9he1LxAI+UJWYC8eJlyCb
         7fZCZsmv9YVBWObsr8v3bHF4Q9KME5dwspkvqlxxTFzzhBD0C63dMLzU97Qg+c53hgfw
         UxZVshYRaTtESHRb4bee4TOdpGZ2a4YL+r5nR16I9CzS2EbwJ9KYwHnQRqT/wYPhUYVm
         FlHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775122145; x=1775726945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4N7tIyw5iZLvzZnTOYoRHg1O5/XCBmsdPAKZlPxWO8A=;
        b=K0j8r0xj+5Py5llt7sOi/wFmn5RkyeQscno9VoJgcWQ95f1dMoiXkxUPn6QfKwEUqK
         BlSgHlaPVfZBVMTXOT2QNMTUQUOLYhaBHl+LbEz9FEPPlE2iFL8a9yT22kirrsXNt4H7
         oJINPsj6qC4A7X1/O22mBxvJthYh7vPvXjYskB2hhv7/Sm7qJVOAffCBrZKEfPftGppP
         e1n7oOcWrMPE2NAgvFtOsrxt1p3l4wxj00NKoW3UEybaXiIcEePMPNg1289Sh7yOnrAY
         MS+2coq6e8wa3U2c9qVCQnebESqtVqX8lz2iiPsyno8FeR0Xj1/t9g6Teo/BmxS+k7QL
         8tOw==
X-Forwarded-Encrypted: i=1; AJvYcCUyMkv73RIM8SMCtPTVSNMWNGqAjxufuLZ0PTPOfWopxMMw6S5cZFGOLPy7F+koW+TJqibZ18fUiaAIqA5F@vger.kernel.org
X-Gm-Message-State: AOJu0YzbP3BlNNjLMQooFBWZC0Ar/Sj0K17WLNfDmGlE4Qj/x2oOXat2
	hF/i0vu3OAIejMygY+lG47tUcXfTKawCNu1/29/iTInaBh5GAnvSlJi+bqONJ39W3TDjnVdgTjx
	scgx/bs248pS3eJKzG6Iuh9GSLQMNJZPbhJUXmTjkuE6w4BU9Q9MM8cCM2pYKSNY9vB28
X-Gm-Gg: ATEYQzwpkxR9ouYl1cQRHstLAGunWSbbZ9embH4i3len/8oKdsk4YT8YOwdT4GsaBbn
	QrC38cZkCtGD6reBO3ZSWuMU7IB0EqtTCSDsXU2Gw3KJ1pXs7SnRfxvpZs8MEg8JeIACBuO9U3j
	+yXjka5ofkMuZdluRvJCdRmiKoaOXvd1VDvIpJRyincK5TyvjgofL1T/AVOKTTFzhW7ZuZJrSzd
	IXwLc2ehytqsKNVfkFJUccVI8+1K4ZHtcsR0+2MXnO9vwPgqmjyIkktmSmWs6QbJsuCHNbPWgQc
	vPZIf5liRkZlqonGWcvs+z2U9+F+cvTJvQAhjVTe2/Lzw01eBmZdZMNsc9zbzqEtpU1wYaw+a2T
	fhkpma5WbrwleD3M4+wSyj5Gf39ezM7q2vdZtkR/ETTURrobdamnlJfjxpauYKuI+O8Cm+91d8Z
	bg
X-Received: by 2002:a05:7301:1007:b0:2be:9c19:b34b with SMTP id 5a478bee46e88-2cad64be0femr685513eec.4.1775122145380;
        Thu, 02 Apr 2026 02:29:05 -0700 (PDT)
X-Received: by 2002:a05:7301:1007:b0:2be:9c19:b34b with SMTP id 5a478bee46e88-2cad64be0femr685492eec.4.1775122144851;
        Thu, 02 Apr 2026 02:29:04 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cafd073194sm951094eec.28.2026.04.02.02.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 02:29:04 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v13 7/7] qcom-tgu: Add reset node to initialize
Date: Thu,  2 Apr 2026 02:28:38 -0700
Message-Id: <20260402092838.341295-8-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402092838.341295-1-songwei.chai@oss.qualcomm.com>
References: <20260402092838.341295-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NwQ1g7mml5hEpOWjHOLmnzh-jOioPvMj
X-Proofpoint-ORIG-GUID: NwQ1g7mml5hEpOWjHOLmnzh-jOioPvMj
X-Authority-Analysis: v=2.4 cv=JII2csKb c=1 sm=1 tr=0 ts=69ce36e2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=IgPCHI2mAnvcCQI4J_AA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4NCBTYWx0ZWRfX6Ns9kOJbG2Qx
 rqCvLSA41g+zFreQlYW+5Bv3CyNVO+IPetqDkrpBqJE2XXLYiIE65AkW5n3hw4BO9bw6sikdrT6
 Mbpwb7Hy8RvWI/NM89tqZyMhguLRrygs/641ajHbH4PYpRdVDND7OPfwNwgpxYFGT01RefpYzPd
 Mftejym/H8U6SeHOAb5YA7cZkfxjzHwovy1d8uBQT3qZuPl3wXHia33wBssDIvHbowcnt30yfMX
 xgnzSLm5zy9vYhCAOXb59kNOg9keKvQvSs4dcJcn4qLJKQ1ATHmHwPy6Fnc3mWwPrkQDrFe6CJa
 UE5u/cyhfo1+5v+iy+VLDUP+4DmE9cVSuAOnce0LdZRH0VoxUmkuizjnfVVJvoE5bZzsugnl3Nb
 O6YFdc+0MDPMesOffMBLlR3xTSTcrxVsKUIOhCnnCnhuGO5Xm/JnSdVAN5wd6ApDG0ra1OVefei
 K42FsJ/vLAOb3bh794w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020084
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101506-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[songwei.chai@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9846138727B
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
index 4a529520b428..752fcd2963e1 100644
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


