Return-Path: <linux-arm-msm+bounces-101504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mI/zJa07zmmAmAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 11:49:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E29A3872CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 11:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 12D49308D18C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 09:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F594392C47;
	Thu,  2 Apr 2026 09:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X0gRTA2E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NJW+OV9c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1106538756F
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 09:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775122155; cv=none; b=NF05XK8/nA2T3BRiqk1YniozBFzz/yhz5TCLAFyJuZoZNHf9EG5W+zOOWTQCsa6RAv1tcPWj2YvxVZkgWBNj+IFmlOyu6P1hL8ZXlhJJwlc6tC2znwomRLn6q+dWlzVd2hrAhkMU8oar6WpL90sjROlor3gr+Ejh6Z2N5Y1ZPqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775122155; c=relaxed/simple;
	bh=6EUcjJijW8rc8wh1RTKjvOHrDb3PpQGNe3Cnrbfavd0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J++hxfvWOPqhTZMb6z7uivzVnQFRYZE4m57A9n4eLFAGyEptNOgcXfjz7FNN20R3RIclCZvN/cL0HHSNvvgQRPXOWl0HMpW/0M/4a/aZHCWIWTg3z5Vye45Rq5+oTyuV+3wFBBrk/686l1BAlL9Po8w8YXhEarfiLCvaG4RAc6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X0gRTA2E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NJW+OV9c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632768l93044195
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 09:28:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HtBjObk+MAy
	Dwr/W5dHYl19JESzJDJMYoBzqhZZrP2Q=; b=X0gRTA2ERU/ddRIYjf470RuYVdA
	dRIOP7djbhU20Ms29/1ievcf+OCVmJwUYHMPZ1G2ATphHZvL5lnFkWk2t6Nfsva7
	PMAITBBVMJSaaUZVk3fCOjE9YeBP1ZzjEuTaYYYcUC09xYboJs+k/JBq9G9GV05B
	ivhcxUiwSLBe+u1eeiRO3/pcH5XfMr+bwM+lZbnD+2tMiMfAiF8cfdiyRLXGV6kZ
	RqDJWoKHSu8v2rqV7mmIQGbNGwOp8xdQDwOQ5+7XQNNSHY06/mYYIqYBKrdKcVMp
	IgwANlBmd6HHI8PS+Hx4MhZJFwivQb0NH0grsQMH9Hngp4ej7rRIAxgTcFQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483v5qm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 09:28:59 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c18175fc54so3541942eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 02:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775122139; x=1775726939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HtBjObk+MAyDwr/W5dHYl19JESzJDJMYoBzqhZZrP2Q=;
        b=NJW+OV9c7l68vVXXw+Id4vyjywedHAG7EYYCr7LPAf9lHHwXi2tJeOgSq4p5U8TfM1
         sEFOU4bRamtFdHOx7M12a9HfqLKa7JQEMzv7i5pPJEbuqcvzKcPCWikebaxnNuqj74Kf
         WCx+Hpr7FBMT+RQ5exzS2pPW2TerbOnSn/VF5a/w4wssBC7YZ0/eZcHQyaI5CfwtZDml
         OZac8eoENtIhtTV9gRfv/S6SUrLA2PssvDseMgehJcX6XeicEZ48epnC8jRzC3pONBNJ
         9JcN+XyvM0nUdGlJ1/9LUfz4/sESFgI01O0sf8HuvCmInB4e+kOjYTVlXETXeYpdUWCi
         Hvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775122139; x=1775726939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HtBjObk+MAyDwr/W5dHYl19JESzJDJMYoBzqhZZrP2Q=;
        b=NuLdWA8FKA1UgycTHT08bItMy71vP32XVwelEXjUcgsy0yV6HBzVd9t4+9wuGrkyPb
         8aHXSXPo63G1VBNAsZ1fBvh6/GmSFTRucK4SqYNzc6kwDfVgqNUGbo314mw4s5suHUiQ
         X9wL0g1HdD8Oi1v1X0ieA/0z6G03OWml//oB5GxgDj8NZxB3vAh9iMFH/ITbHjF5WJ0Q
         o7GC2GBHjMEpfio81OoMH2qgNrPivA0S63ZmnKGlR1RYWill+M/rE1N2BwLkmblvMiCd
         UoYw18bZtIhof9yfBydSbYQdNoI60jANUyKlN/8euqBj2OWcboMYclURSYdTztkwD8cf
         uwOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMDrLtl8kvakFLV7RbaGGfDBsXwNFQ5Mh+wp6Dw5tWnPPd+4Er5vBpGCZsxQFZb7F2dxJ2kOVVUZcRxVOj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+TI3Hek/7zB11s7cl3GbufEZng1s2K37IDJLpilTwj2A320PM
	mO0svego5pjYryFE6NAF5Be3+e2/KAeFCprDL4264tQAbZ6pewLWRmyiZGMkzlgWQ9WfLLfK6zu
	tIYB1J7gyUIETtWnazIUeHUbhWfj3DOAJyyLDNgKSF7Obq7ZIMakqiFvOaLUtHVhiQrcu
X-Gm-Gg: ATEYQzxcsVGilOfVhr0KZYCK62S6FiHF2nDAQuTFvpoI6t6O5LvP0IONpStsfKSd7Bx
	tQeu933281KsrmOj2BXnhrTUAeAJsz69amhhvpE7REaAAaiL1kvdO2exNCxXo0+qDEZn4WulbGr
	SvObzA2KNKyRhGGjWmQOwl8+zmpt0lcBMU7Bk4MnPbC+d13FMlONdWQcMHQwYFbA2isr7dOgC6v
	z8XirR1xpQfmIa7saEPX4zr8GEI/exnDjjR2d0t37iBX5PFFDWoEXi33y2h3Fp70VQ3OPu82Zy+
	JLzjVTeTxhpSPVv0RlMEQh7lktkci5c0HTsGjC38TM5nzXGq942fs5Q8FBTMjfpyb3ekyV42dSI
	4DXzjQDub+DevpNzk3l3VqgOZPfxIuu7LuIYiQ7sw/NDqNAsGo8ZehtyNFQLDFDL6i8MRMZkL4P
	x/
X-Received: by 2002:a05:7300:d50c:b0:2c7:e3a8:2562 with SMTP id 5a478bee46e88-2c930c7640cmr3756945eec.4.1775122138841;
        Thu, 02 Apr 2026 02:28:58 -0700 (PDT)
X-Received: by 2002:a05:7300:d50c:b0:2c7:e3a8:2562 with SMTP id 5a478bee46e88-2c930c7640cmr3756931eec.4.1775122138233;
        Thu, 02 Apr 2026 02:28:58 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cafd073194sm951094eec.28.2026.04.02.02.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 02:28:57 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v13 4/7] qcom-tgu: Add TGU decode support
Date: Thu,  2 Apr 2026 02:28:35 -0700
Message-Id: <20260402092838.341295-5-songwei.chai@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69ce36db cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=p0PFFVR7nGJo5X-0Br8A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4NCBTYWx0ZWRfX8xa0SsnK5gYG
 yu1hguzby6GdYk3uECf9YfyHHaeWsZ32niUfEUcGtPdhWaUV55Y/ezpVukFbFCZAx55JT1uTQSs
 Vo3Q/YOZKcLikBkH7Ccaj7/LRHh5+fZZGDvP4QIZi7l+P0E5mojOAfVFlsYTJ7tk2fj4WVfeM63
 5KDTHsQXi0To9SqRetyK1p67UWfpubhbz5l82wXcxzIJXAzi92KRxMoSruSDTLxnID+NpT8psbq
 L0O/DWUHQnp0MWi17LnAOShyro+9I7mbssxHV25VDj4fOt14GAGabwn6hmn8oij/P7LufxnkYgi
 ocOuoQe2iVBdx6UqoqQJI5LtRUPfvxB+B+rZT6VFS9UZCkFJkpEMyd/T9OEUVcCYZqADmG8k2H9
 8260QY5Jc0fgER7Ne2n+Vmr9WzWmyhSvmCakdYJSQzEZAOQBY3e8Ui56z7iKUdLLds8jPhGp3q4
 YEFBPqW+Gwa7fnqWD0Q==
X-Proofpoint-ORIG-GUID: oZnZKYA4h25vnKZK-c6c4LeZsStLa-t8
X-Proofpoint-GUID: oZnZKYA4h25vnKZK-c6c4LeZsStLa-t8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020084
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101504-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[songwei.chai@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9E29A3872CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Decoding is when all the potential pieces for creating a trigger
are brought together for a given step. Example - there may be a
counter keeping track of some occurrences and a priority-group that
is being used to detect a pattern on the sense inputs. These 2
inputs to condition_decode must be programmed, for a given step,
to establish the condition for the trigger, or movement to another
steps.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
 drivers/hwtracing/qcom/tgu.c                  | 157 +++++++++++++++---
 drivers/hwtracing/qcom/tgu.h                  |  27 +++
 3 files changed, 170 insertions(+), 21 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 223873789ca6..4ef0d696d3d0 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -14,3 +14,10 @@ KernelVersion:	7.1
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the sensed signal with specific step and priority for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_decode/reg[0:3]
+Date:		April 2026
+KernelVersion:	7.1
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the decode mode with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 7d69986c3e3d..5b37eb10f863 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -18,8 +18,33 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
 				    int step_index, int operation_index,
 				    int reg_index)
 {
-	return operation_index * (drvdata->num_step) * (drvdata->num_reg) +
-		step_index * (drvdata->num_reg) + reg_index;
+	switch (operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		return operation_index * (drvdata->num_step) *
+			(drvdata->num_reg) +
+			step_index * (drvdata->num_reg) + reg_index;
+	case TGU_CONDITION_DECODE:
+		return step_index * (drvdata->num_condition_decode) +
+			reg_index;
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static int check_array_location(struct tgu_drvdata *drvdata, int step,
+				int ops, int reg)
+{
+	int result = calculate_array_location(drvdata, step, ops, reg);
+
+	if (result == -EINVAL)
+		dev_err(drvdata->dev, "check arrary location - Fail\n");
+
+	return result;
 }
 
 static ssize_t tgu_dataset_show(struct device *dev,
@@ -30,12 +55,26 @@ static ssize_t tgu_dataset_show(struct device *dev,
 			container_of(attr, struct tgu_attribute, attr);
 	int index;
 
-	index = calculate_array_location(drvdata, tgu_attr->step_index,
-					 tgu_attr->operation_index,
-					 tgu_attr->reg_num);
-
-	return sysfs_emit(buf, "0x%x\n",
-			  drvdata->value_table->priority[index]);
+	index = check_array_location(drvdata, tgu_attr->step_index,
+			tgu_attr->operation_index, tgu_attr->reg_num);
+
+	if (index == -EINVAL)
+		return index;
+
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->value_table->priority[index]);
+	case TGU_CONDITION_DECODE:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->value_table->condition_decode[index]);
+	default:
+		break;
+	}
+	return -EINVAL;
 }
 
 static ssize_t tgu_dataset_store(struct device *dev,
@@ -54,13 +93,31 @@ static ssize_t tgu_dataset_store(struct device *dev,
 		return ret;
 
 	guard(spinlock)(&tgu_drvdata->lock);
-	index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
+	index = check_array_location(tgu_drvdata, tgu_attr->step_index,
 					 tgu_attr->operation_index,
 					 tgu_attr->reg_num);
 
-	tgu_drvdata->value_table->priority[index] = val;
+	if (index == -EINVAL)
+		return index;
+
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		tgu_drvdata->value_table->priority[index] = val;
+		ret = size;
+		break;
+	case TGU_CONDITION_DECODE:
+		tgu_drvdata->value_table->condition_decode[index] = val;
+		ret = size;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
 
-	return size;
+	return ret;
 }
 
 static umode_t tgu_node_visible(struct kobject *kobject,
@@ -77,13 +134,26 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 	if (tgu_attr->step_index >= drvdata->num_step)
 		return SYSFS_GROUP_INVISIBLE;
 
-	if (tgu_attr->reg_num >= drvdata->num_reg)
-		return 0;
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		if (tgu_attr->reg_num < drvdata->num_reg)
+			return attr->mode;
+		break;
+	case TGU_CONDITION_DECODE:
+		if (tgu_attr->reg_num < drvdata->num_condition_decode)
+			return attr->mode;
+		break;
+	default:
+		break;
+	}
 
-	return attr->mode;
+	return 0;
 }
 
-static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
+static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 {
 	int i, j, k, index;
 
@@ -91,8 +161,10 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 	for (i = 0; i < drvdata->num_step; i++) {
 		for (j = 0; j < MAX_PRIORITY; j++) {
 			for (k = 0; k < drvdata->num_reg; k++) {
-				index = calculate_array_location(
+				index = check_array_location(
 							drvdata, i, j, k);
+				if (index == -EINVAL)
+					goto exit;
 
 				writel(drvdata->value_table->priority[index],
 					drvdata->base +
@@ -100,9 +172,23 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 			}
 		}
 	}
+
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_condition_decode; j++) {
+			index = check_array_location(drvdata, i,
+						TGU_CONDITION_DECODE, j);
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->value_table->condition_decode[index],
+				drvdata->base + CONDITION_DECODE_STEP(i, j));
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
+exit:
 	TGU_LOCK(drvdata->base);
+	return index >= 0 ? 0 : -EINVAL;
 }
 
 static void tgu_set_reg_number(struct tgu_drvdata *drvdata)
@@ -131,16 +217,26 @@ static void tgu_set_steps(struct tgu_drvdata *drvdata)
 	drvdata->num_step = TGU_DEVID_STEPS(devid);
 }
 
+static void tgu_set_conditions(struct tgu_drvdata *drvdata)
+{
+	u32 devid;
+
+	devid = readl(drvdata->base + TGU_DEVID);
+	drvdata->num_condition_decode = TGU_DEVID_CONDITIONS(devid);
+}
+
 static int tgu_enable(struct device *dev)
 {
 	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	int ret;
 
 	guard(spinlock)(&drvdata->lock);
-	drvdata->enabled = true;
 
-	tgu_write_all_hw_regs(drvdata);
+	ret = tgu_write_all_hw_regs(drvdata);
+	if (!ret)
+		drvdata->enabled = true;
 
-	return 0;
+	return ret;
 }
 
 static void tgu_do_disable(struct tgu_drvdata *drvdata)
@@ -262,6 +358,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
 	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
 	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
 	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(0),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(1),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(2),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(3),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(4),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(5),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(6),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(7),
 	NULL,
 };
 
@@ -269,8 +373,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
 	struct tgu_drvdata *drvdata;
-	unsigned int *priority;
-	size_t priority_size;
+	unsigned int *priority, *condition;
+	size_t priority_size, condition_size;
 	int ret;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -288,6 +392,7 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
 	tgu_set_reg_number(drvdata);
 	tgu_set_steps(drvdata);
+	tgu_set_conditions(drvdata);
 
 	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
 	if (ret) {
@@ -310,6 +415,16 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
 	drvdata->value_table->priority = priority;
 
+	condition_size = drvdata->num_condition_decode * drvdata->num_step;
+
+	condition = devm_kcalloc(dev, condition_size,
+				sizeof(*(drvdata->value_table->condition_decode)),
+				GFP_KERNEL);
+	if (!condition)
+		return -ENOMEM;
+
+	drvdata->value_table->condition_decode = condition;
+
 	drvdata->enabled = false;
 
 	pm_runtime_put(&adev->dev);
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index df570c89ffd7..987ea07bd618 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -16,6 +16,8 @@
 	((int)FIELD_GET(GENMASK(17, 10), devid_val))
 #define TGU_DEVID_STEPS(devid_val) \
 	((int)FIELD_GET(GENMASK(6, 3), devid_val))
+#define TGU_DEVID_CONDITIONS(devid_val) \
+	((int)FIELD_GET(GENMASK(2, 0), devid_val))
 #define TGU_BITS_PER_SIGNAL 4
 #define LENGTH_REGISTER 32
 
@@ -49,6 +51,7 @@
  */
 #define STEP_OFFSET 0x1D8
 #define PRIORITY_START_OFFSET 0x0074
+#define CONDITION_DECODE_OFFSET 0x0050
 #define PRIORITY_OFFSET 0x60
 #define REG_OFFSET 0x4
 
@@ -57,6 +60,9 @@
 	(PRIORITY_START_OFFSET + PRIORITY_OFFSET * priority +\
 	 REG_OFFSET * reg + STEP_OFFSET * step)
 
+#define CONDITION_DECODE_STEP(step, decode) \
+	(CONDITION_DECODE_OFFSET + REG_OFFSET * decode + STEP_OFFSET * step)
+
 #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
 	(&((struct tgu_attribute[]){ {                                   \
 		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
@@ -68,6 +74,8 @@
 #define STEP_PRIORITY(step_index, reg_num, priority)                     \
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_PRIORITY##priority, \
 			reg_num)
+#define STEP_DECODE(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
 
 #define STEP_PRIORITY_LIST(step_index, priority) \
 	{STEP_PRIORITY(step_index, 0, priority), \
@@ -91,6 +99,14 @@
 	 NULL                   \
 	}
 
+#define STEP_DECODE_LIST(n) \
+	{STEP_DECODE(n, 0), \
+	 STEP_DECODE(n, 1), \
+	 STEP_DECODE(n, 2), \
+	 STEP_DECODE(n, 3), \
+	 NULL               \
+	}
+
 #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
 	(&(const struct attribute_group){\
 		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
@@ -98,11 +114,19 @@
 		.name = "step" #step "_priority" #priority \
 	})
 
+#define CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_DECODE_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_condition_decode" \
+	})
+
 enum operation_index {
 	TGU_PRIORITY0,
 	TGU_PRIORITY1,
 	TGU_PRIORITY2,
 	TGU_PRIORITY3,
+	TGU_CONDITION_DECODE,
 };
 
 /* Maximum priority that TGU supports */
@@ -117,6 +141,7 @@ struct tgu_attribute {
 
 struct value_table {
 	unsigned int *priority;
+	unsigned int *condition_decode;
 };
 
 static inline void TGU_LOCK(void __iomem *addr)
@@ -146,6 +171,7 @@ static inline void TGU_UNLOCK(void __iomem *addr)
  * @value_table: Store given value based on relevant parameters
  * @num_reg: Maximum number of registers
  * @num_step: Maximum step size
+ * @num_condition_decode: Maximum number of condition_decode
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -160,6 +186,7 @@ struct tgu_drvdata {
 	struct value_table *value_table;
 	int num_reg;
 	int num_step;
+	int num_condition_decode;
 };
 
 #endif
-- 
2.34.1


