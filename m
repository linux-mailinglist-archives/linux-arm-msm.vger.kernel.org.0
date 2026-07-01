Return-Path: <linux-arm-msm+bounces-115575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kovsNC+sRGpAywoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 07:57:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 505BE6EA08F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 07:57:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YoBIfGIT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ikfbktQM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115575-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115575-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B5A05305E6DF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 05:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA6F3947B5;
	Wed,  1 Jul 2026 05:56:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B525F39479B
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 05:56:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782885382; cv=none; b=hM/4ylh8KGSmWrNdCq7HoR8lrn6GQStNackfe2Zj3dNIaLt2u5+g7z4FOLiNBcESNDnqPVgUHq8J/bfVtYpZHpRsoFDVXQO3sTto3Ql8CxcwSwbTz7k2atvHomeiLTJmW2KYDbj1tMKrSAUEMPJIzoRWLwzadkT7F5NVNKjzyyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782885382; c=relaxed/simple;
	bh=Mepz/qB7MeVxFZF0ivRbD1eey9INlVFJoInFyuAp/xI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fcw/1y5CWvnVHIOe7D86QbSw+ljSU7dkAFNflWlo2SXBNXY7x+fDz1h56Mq7bp7NArHbNh8ylx+xQUJHmGKPv9dIVQDfGAKRylPC31r6Pr9YMFcl4AQSKcgI9K7EYPsyoStK190M4SUDLGF4edrXb/8dqsszQaHN7WWnArYle2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YoBIfGIT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ikfbktQM; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lPuX133276
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 05:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g78us6s87bg
	ETErPwAMlIT5CZOZ9CsSfglFtXPl5hhY=; b=YoBIfGITWKlpeMgSPf4k+KCH4Zq
	jaggw4JG+jh7R5r6EecPI1oRmG3MVw5UDpbuA/L9vRMDNsFduY6b/qFlmgFBJ3pd
	xi4GG3hmH0boFZnfOIbYoEl9rVfQDlaH1llPyWecjoStA8vBM4koQZX5HZ4q/QKk
	KCagVmhVWytvvMEQ7JYp+r4lFq7pq+7sILiSceBrCxA901mTYOZFsBYt5WmEeSZ6
	L+3kRvw2CLcY7inkosoEo3XPl66zTdS2ZadUmSU/9PMOYQDvjMlzJTbAqviUnSUO
	ALhQwGDehHQeiRs8t9ZWTfXt52TUtRGwrpYiK0yUwyLef0colYRYJhVf35A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4rsy0x73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 05:56:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf55c3f44aso10550505ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 22:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782885376; x=1783490176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g78us6s87bgETErPwAMlIT5CZOZ9CsSfglFtXPl5hhY=;
        b=ikfbktQM6qYY7Han9/wzItcIuUlBrNgLKq3WduVzR81LGgyEVGmqJpNmFiQqDTw+YD
         6Eapzpl0iErJAyZUOIJCwhJeZdgpil68FyYEHyLqS1ba3S4m+p0g3w5snVJVxUNvmS5M
         0UH5XsdPc0MsylkCDZt1Iwrcn5GImpYzh2AmGFAbu/1MIVlnaf5e6uUT+4anDFUq3nbV
         4gPAfk+4rCcPnGFb5qCQSnmWHb9U7o2p09YM+MF3NjaRyBYaKbXglpgWSfR80jIv0gqT
         1NMNYJr0Wd2e/cPT4w69D3zFGnWG7xNU0+7DO5VHhVB5I20xyElw47AqS3Em8STLT3FS
         czFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782885376; x=1783490176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g78us6s87bgETErPwAMlIT5CZOZ9CsSfglFtXPl5hhY=;
        b=lPYz8YCunIZJI0K4/73l5m3zll1jqHU23FyGbfwa5QAURYuSttRsVCS98o2gzUBSMA
         Y4RL0uB1gHDZhYp7qccT+5InV5fMqbhte6fZGSBONv/+HsDRcXBo25SRyVnP1bUX/QpF
         Ejdu4O9A81drQVbS0lGKsgFOLsszd9M8251pGhAI36bSXPPwjaLFvL1Ayo6qqTJqDq8d
         XpunP2vZ1IcHOzDnS5Csu+P9SSCgrsT4wwqVuSChCRmOeKg8SxJEBlZQ/0aPycNPM3VS
         4dD0AMAC+elEw5VFQZghB6hkjCzBgl6RB+CjIaPFF5Jr6tOO+r251/N9/RY5OvG/2MLn
         WQ9Q==
X-Forwarded-Encrypted: i=1; AHgh+RqzAK2IeXJZ9lZ5jMzTiApE05HdftghDTbW5fHsh4l05IL6PL7nb4ai55SYHNLRKWKdMj0Qd4OHl4wTSLQ1@vger.kernel.org
X-Gm-Message-State: AOJu0YyxNeIGZebZjhYLGrTa72zmYFxX+aAWGXRtYav1Lj0lAUlLq47V
	OwDLBjldHiD6RKH9DZUShuJVPgBP4TxiwvJ1xLjdsmm5JcPyAir87X6C8Gcqe+wZ2y0STAObSF7
	N+15biqJPscpniSqTCZP+Z+DsXmH3XQAXiGRMs/ogBlDorGDtOQtv6ckh9LN9hSuY8sVw
X-Gm-Gg: AfdE7ckIlkmBKOt7NUmUMN+AF/qoeoJhpwYwYxAQz2xCNJ/dBzIjije3oFs9SeUXGwg
	c0FENB/o51vDDUjrv8VWrNVPncg0RmKaHdLHU1qmF0Ax6zSEh1sQSfbFUTOqyWtzkClb8Z9Tn2R
	pzjMbZurxMUwrCkKP7zX1VzNBFakQzm7UWZpMismARL6hfHE4ll8V41sec81UNsicHx8iHRO+rr
	C0csia0/uZxs/IqAF4ZytKa7OJRb0A/5qKiCH8NzL+9BJSRQPhCL03kx/hWuzD2Ur33w8O6dbYO
	bkng4Z4mZwXPOPDkYKuuM6Dbj8fS4R8lmJNgwOhLIrppmAg0QmRBVYR+CSTg6mGb09GTx7k2I5P
	foPYEdCyWKLYMEHN3NvC25dz+chSEVajkhn7UYiZZ5ijj5Odj972AKxP0NJyV8rbr+Q==
X-Received: by 2002:a17:902:ce83:b0:2ca:783d:c5dd with SMTP id d9443c01a7336-2ca783dc6cfmr7048625ad.8.1782885376414;
        Tue, 30 Jun 2026 22:56:16 -0700 (PDT)
X-Received: by 2002:a17:902:ce83:b0:2ca:783d:c5dd with SMTP id d9443c01a7336-2ca783dc6cfmr7048395ad.8.1782885375798;
        Tue, 30 Jun 2026 22:56:15 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382b5175sm25451645ad.63.2026.06.30.22.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 22:56:14 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v15 6/7] qcom-tgu: Add timer/counter functionality for TGU
Date: Tue, 30 Jun 2026 22:55:28 -0700
Message-Id: <20260701055529.445819-7-songwei.chai@oss.qualcomm.com>
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
X-Proofpoint-GUID: awcFK7ZcvdOE9fkdsn1BXRAUtcxs-u8M
X-Authority-Analysis: v=2.4 cv=fLgJG5ae c=1 sm=1 tr=0 ts=6a44ac01 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=eGDQztGCVwpQsGOtWZEA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA1OCBTYWx0ZWRfXysyv0qGP+nvY
 T9VVgxE3Wc4HI2QAzjQrg5SkTOsFfZfC8byMI6YTJfc26mA/dv7iv9K0kkFCa3u8yN53jOPCUFB
 Ttm1azfr+9xy5+uZEsGaKaRfYSLUb1ufl2R0AVXajkr14AwATfnMB2uJ/2DERi5WkfhqQ2vMRAP
 SQpqpQsTFnVDXePaS7gJJhBXpSd8CbzdCUp75W/gQcpfod3W9zPwlaIF2IbxOaWL8PlioFvHSay
 WZHYi3X+X/tpl7VwPFrGsHRWMSeQpSv3sbMphLJTp5bNeq35H8nQdfCbOlJld3uP2KHSyD9n8Md
 OM8r/OmqawlKZVkGoWjCL7s+xlg5bR07rBGR1RG6D1teUhQPz42xnsU7p7OPwOoLMUqEjeQD8T5
 6EyF5CS9ETeTE2b9UnnOXnhG3tBkSMf/SvtPVmnTntokw4ZHjobJ3f+l7gvxTI4Y3TH7jbPUjiH
 j0rI097SOtfG7NIUifg==
X-Proofpoint-ORIG-GUID: awcFK7ZcvdOE9fkdsn1BXRAUtcxs-u8M
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA1OCBTYWx0ZWRfXwuuFagccIQKe
 +OR6g1vFYz0b8dNTU/0ttZdBb/1SJuIGrkGqrt9cc1UsdelFAb8sSr9tsrxSLIfe52WD4FPosCw
 l7TRTky1mIKeYVQcXGsZC7xS+vf14uk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[songwei.chai@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-115575-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:alexander.shishkin@linux.intel.com,m:mike.leach@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:james.clark@arm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:songwei.chai@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:coresight@lists.linaro.org,m:devicetree@vger.kernel.org,m:gregkh@linuxfoundation.org,m:jie.gan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[songwei.chai@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 505BE6EA08F

Add counter and timer node for each step which could be
programed if they are to be utilized in trigger event/sequence.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  14 +++
 drivers/hwtracing/qcom/tgu.c                  | 116 +++++++++++++++++-
 drivers/hwtracing/qcom/tgu.h                  |  57 +++++++++
 3 files changed, 185 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index f8b4ea199faf..7fad11eb759c 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -28,3 +28,17 @@ KernelVersion:	7.2
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the next action with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_timer/reg[0:1]
+Date:		July 2026
+KernelVersion:	7.2
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the timer value with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_counter/reg[0:1]
+Date:		July 2026
+KernelVersion:	7.2
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the counter value with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index fefe932059cb..6d5bf2621cb0 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -32,6 +32,10 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
 	case TGU_CONDITION_SELECT:
 		return step_index * (drvdata->num_condition_select) +
 			reg_index;
+	case TGU_COUNTER:
+		return step_index * (drvdata->num_counter) + reg_index;
+	case TGU_TIMER:
+		return step_index * (drvdata->num_timer) + reg_index;
 	default:
 		break;
 	}
@@ -77,6 +81,12 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	case TGU_CONDITION_SELECT:
 		return sysfs_emit(buf, "0x%x\n",
 				drvdata->value_table->condition_select[index]);
+	case TGU_TIMER:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->value_table->timer[index]);
+	case TGU_COUNTER:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->value_table->counter[index]);
 	default:
 		break;
 	}
@@ -122,6 +132,14 @@ static ssize_t tgu_dataset_store(struct device *dev,
 		tgu_drvdata->value_table->condition_select[index] = val;
 		ret = size;
 		break;
+	case TGU_TIMER:
+		tgu_drvdata->value_table->timer[index] = val;
+		ret = size;
+		break;
+	case TGU_COUNTER:
+		tgu_drvdata->value_table->counter[index] = val;
+		ret = size;
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -163,6 +181,18 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 		if (tgu_attr->reg_num < drvdata->num_condition_select)
 			return attr->mode;
 		break;
+	case TGU_COUNTER:
+		if (!drvdata->num_counter)
+			break;
+		if (tgu_attr->reg_num < drvdata->num_counter)
+			return attr->mode;
+		break;
+	case TGU_TIMER:
+		if (!drvdata->num_timer)
+			break;
+		if (tgu_attr->reg_num < drvdata->num_timer)
+			return attr->mode;
+		break;
 	default:
 		break;
 	}
@@ -213,6 +243,30 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 				drvdata->base + CONDITION_SELECT_STEP(i, j));
 		}
 	}
+
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_timer; j++) {
+			index = check_array_location(drvdata, i, TGU_TIMER, j);
+
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->value_table->timer[index],
+				drvdata->base + TIMER_COMPARE_STEP(i, j));
+		}
+	}
+
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_counter; j++) {
+			index = check_array_location(drvdata, i, TGU_COUNTER, j);
+
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->value_table->counter[index],
+				drvdata->base + COUNTER_COMPARE_STEP(i, j));
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
 exit:
@@ -256,6 +310,27 @@ static void tgu_set_conditions(struct tgu_drvdata *drvdata)
 	drvdata->num_condition_select = TGU_DEVID_CONDITIONS(devid) + 1;
 }
 
+static void tgu_set_timer_counter(struct tgu_drvdata *drvdata)
+{
+	int num_timers = 0, num_counters = 0;
+	u32 devid2;
+
+	devid2 = readl(drvdata->base + CORESIGHT_DEVID2);
+
+	if (TGU_DEVID2_TIMER0(devid2))
+		num_timers++;
+	if (TGU_DEVID2_TIMER1(devid2))
+		num_timers++;
+
+	if (TGU_DEVID2_COUNTER0(devid2))
+		num_counters++;
+	if (TGU_DEVID2_COUNTER1(devid2))
+		num_counters++;
+
+	drvdata->num_timer = num_timers;
+	drvdata->num_counter = num_counters;
+}
+
 static int tgu_enable(struct device *dev)
 {
 	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
@@ -405,6 +480,22 @@ static const struct attribute_group *tgu_attr_groups[] = {
 	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(5),
 	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(6),
 	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(7),
+	TIMER_ATTRIBUTE_GROUP_INIT(0),
+	TIMER_ATTRIBUTE_GROUP_INIT(1),
+	TIMER_ATTRIBUTE_GROUP_INIT(2),
+	TIMER_ATTRIBUTE_GROUP_INIT(3),
+	TIMER_ATTRIBUTE_GROUP_INIT(4),
+	TIMER_ATTRIBUTE_GROUP_INIT(5),
+	TIMER_ATTRIBUTE_GROUP_INIT(6),
+	TIMER_ATTRIBUTE_GROUP_INIT(7),
+	COUNTER_ATTRIBUTE_GROUP_INIT(0),
+	COUNTER_ATTRIBUTE_GROUP_INIT(1),
+	COUNTER_ATTRIBUTE_GROUP_INIT(2),
+	COUNTER_ATTRIBUTE_GROUP_INIT(3),
+	COUNTER_ATTRIBUTE_GROUP_INIT(4),
+	COUNTER_ATTRIBUTE_GROUP_INIT(5),
+	COUNTER_ATTRIBUTE_GROUP_INIT(6),
+	COUNTER_ATTRIBUTE_GROUP_INIT(7),
 	NULL,
 };
 
@@ -412,8 +503,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
 	struct tgu_drvdata *drvdata;
-	unsigned int *priority, *condition, *select;
-	size_t priority_size, condition_size, select_size;
+	unsigned int *priority, *condition, *select, *timer, *counter;
+	size_t priority_size, condition_size, select_size, timer_size, counter_size;
 	int ret;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -432,6 +523,7 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 	tgu_set_reg_number(drvdata);
 	tgu_set_steps(drvdata);
 	tgu_set_conditions(drvdata);
+	tgu_set_timer_counter(drvdata);
 
 	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
 	if (ret) {
@@ -474,6 +566,26 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
 	drvdata->value_table->condition_select = select;
 
+	timer_size = drvdata->num_step * drvdata->num_timer;
+
+	timer = devm_kcalloc(dev, timer_size,
+			    sizeof(*(drvdata->value_table->timer)),
+			    GFP_KERNEL);
+	if (!timer)
+		return -ENOMEM;
+
+	drvdata->value_table->timer = timer;
+
+	counter_size = drvdata->num_step * drvdata->num_counter;
+
+	counter = devm_kcalloc(dev, counter_size,
+			      sizeof(*(drvdata->value_table->counter)),
+			      GFP_KERNEL);
+	if (!counter)
+		return -ENOMEM;
+
+	drvdata->value_table->counter = counter;
+
 	drvdata->enabled = false;
 
 	pm_runtime_put(&adev->dev);
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index c61aa8dc51b0..1bcbc99169de 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -11,6 +11,7 @@
 #define TGU_LAR		0xfb0
 #define TGU_UNLOCK_OFFSET	0xc5acce55
 #define TGU_DEVID		0xfc8
+#define CORESIGHT_DEVID2	0xfc0
 
 #define TGU_DEVID_SENSE_INPUT(devid_val) \
 	((int)FIELD_GET(GENMASK(17, 10), devid_val))
@@ -18,6 +19,16 @@
 	((int)FIELD_GET(GENMASK(6, 3), devid_val))
 #define TGU_DEVID_CONDITIONS(devid_val) \
 	((int)FIELD_GET(GENMASK(2, 0), devid_val))
+#define TGU_DEVID2_TIMER0(devid_val)	\
+	((int)FIELD_GET(GENMASK(23, 18), devid_val))
+#define TGU_DEVID2_TIMER1(devid_val)	\
+	((int)FIELD_GET(GENMASK(17, 13), devid_val))
+#define TGU_DEVID2_COUNTER0(devid_val)	\
+	((int)FIELD_GET(GENMASK(11, 6), devid_val))
+#define TGU_DEVID2_COUNTER1(devid_val)	\
+	((int)FIELD_GET(GENMASK(5, 0), devid_val))
+
+
 #define TGU_BITS_PER_SIGNAL 4
 #define LENGTH_REGISTER 32
 
@@ -53,6 +64,8 @@
 #define PRIORITY_START_OFFSET 0x0074
 #define CONDITION_DECODE_OFFSET 0x0050
 #define CONDITION_SELECT_OFFSET 0x0060
+#define TIMER_START_OFFSET 0x0040
+#define COUNTER_START_OFFSET 0x0048
 #define PRIORITY_OFFSET 0x60
 #define REG_OFFSET 0x4
 
@@ -67,6 +80,12 @@
 #define CONDITION_SELECT_STEP(step, select) \
 	(CONDITION_SELECT_OFFSET + REG_OFFSET * select + STEP_OFFSET * step)
 
+#define TIMER_COMPARE_STEP(step, timer) \
+	(TIMER_START_OFFSET + REG_OFFSET * timer + STEP_OFFSET * step)
+
+#define COUNTER_COMPARE_STEP(step, counter) \
+	(COUNTER_START_OFFSET + REG_OFFSET * counter + STEP_OFFSET * step)
+
 #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
 	(&((struct tgu_attribute[]){ {                                   \
 		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
@@ -82,6 +101,10 @@
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
 #define STEP_SELECT(step_index, reg_num) \
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_SELECT, reg_num)
+#define STEP_TIMER(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_TIMER, reg_num)
+#define STEP_COUNTER(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_COUNTER, reg_num)
 
 #define STEP_PRIORITY_LIST(step_index, priority) \
 	{STEP_PRIORITY(step_index, 0, priority), \
@@ -122,6 +145,18 @@
 	 NULL               \
 	}
 
+#define STEP_TIMER_LIST(n) \
+	{STEP_TIMER(n, 0), \
+	 STEP_TIMER(n, 1), \
+	 NULL              \
+	}
+
+#define STEP_COUNTER_LIST(n) \
+	{STEP_COUNTER(n, 0), \
+	 STEP_COUNTER(n, 1), \
+	 NULL                \
+	}
+
 #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
 	(&(const struct attribute_group){\
 		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
@@ -143,6 +178,20 @@
 		.name = "step" #step "_condition_select" \
 	})
 
+#define TIMER_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_TIMER_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_timer" \
+	})
+
+#define COUNTER_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_COUNTER_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_counter" \
+	})
+
 enum operation_index {
 	TGU_PRIORITY0,
 	TGU_PRIORITY1,
@@ -150,6 +199,8 @@ enum operation_index {
 	TGU_PRIORITY3,
 	TGU_CONDITION_DECODE,
 	TGU_CONDITION_SELECT,
+	TGU_TIMER,
+	TGU_COUNTER,
 };
 
 /* Maximum priority that TGU supports */
@@ -166,6 +217,8 @@ struct value_table {
 	unsigned int *priority;
 	unsigned int *condition_decode;
 	unsigned int *condition_select;
+	unsigned int *timer;
+	unsigned int *counter;
 };
 
 static inline void TGU_LOCK(void __iomem *addr)
@@ -197,6 +250,8 @@ static inline void TGU_UNLOCK(void __iomem *addr)
  * @num_step: Maximum step size
  * @num_condition_decode: Maximum number of condition_decode
  * @num_condition_select: Maximum number of condition_select
+ * @num_timer: Maximum number of timers
+ * @num_counter: Maximum number of counters
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -213,6 +268,8 @@ struct tgu_drvdata {
 	int num_step;
 	int num_condition_decode;
 	int num_condition_select;
+	int num_timer;
+	int num_counter;
 };
 
 #endif
-- 
2.34.1


