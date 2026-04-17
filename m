Return-Path: <linux-arm-msm+bounces-103483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KSIIPXi4WkKzgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 09:36:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26061417FC2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 09:36:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5D31A3037E3F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 07:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8971F37E2F7;
	Fri, 17 Apr 2026 07:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CI014Vvt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J3RsDGZP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC413793D5
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 07:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776411313; cv=none; b=XQt9aZ82uIs3np9qOcn2LG8d7+Q+vStrtyvffqFqlHLjEmDQmjwlQ7hcxG236yMaIjSm7CBEBNXXtJ/ufZVwFsXCfS5SFENVFjfN6Se5p/RfMgxD0/T9abRxl3tWzrgen7nMCKWHXWIgyk/uJL0/r3uixUgM+tER4/t/mVCZ7QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776411313; c=relaxed/simple;
	bh=cCGmNlhgmptqhQIVeOY33HwjFG+bSZo1sODRgqT6SZM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gns9RUJx5ik30qx7+w+CMF/DRwIM8YhleQYvuc5bozOEQVVjb5Aoai/6RTnTR6y0ElTP/83ZW0S1a0gd2+1jtJIcVoUr6FrLDkQoCa2KoeSjdmqbtGj40qUEWLuLRicjmzUVQkDTe5Nf5EQJ0uKH5QaQNdqYpBWkZXM2fNIHCGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CI014Vvt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J3RsDGZP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H0fToD065687
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 07:35:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5hAEvyDRzBM
	68/uIJNex8X2q/G8gy+MFr0oAB7pUsFU=; b=CI014VvtZlMWZP++pC5qlwiyuUF
	m2vo7jwweyJw2zc4XOWoW6ZTCdLzFHawL0NJzKCGTDCF+190sJTvoLv+IyOKffjl
	V4USowF/8+MhavNzWQUPz/58zckt+ELaJ+7dtFwCe+fCQ29Hz/Wqq2ZGZNgAl/Eo
	r84R+pjnKyQq9tlMKq3UHbjfYRB+d+RwGd9MIU1g6STRBmKWu+lDw7rjqEJV7GWp
	lS9DrqnyRgvY7JKw6rIf6wicBF9Ys+cDs1pwjyXMHASrk3wepy8HczeCHAspE3RP
	6k/yVYaVRpqcB9u776bre7oFFKOp2rxyPc+/YqDhbGL2PwmZ9lpuNJAkFIw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dk3af2kur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 07:35:10 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso498647eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 00:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776411247; x=1777016047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hAEvyDRzBM68/uIJNex8X2q/G8gy+MFr0oAB7pUsFU=;
        b=J3RsDGZPcCXzwxmIaJlnG1IMOkcXRimRtNYU7+eLcWNJGtMwfgmAQHH84TbjfvR4gt
         3cF+DT07Y+iFY0/QnXRsFx69b5UkKEmGdpzPTTLN8OT6LdMt31JRqvYDXuZl/LW/kkmo
         gfn0k9MD55Hj6EtZ4XNkxNfzrd9fWRw3Z26MtVvr3qUPRsi/jsJ1VUVWu91lLLpgRv/N
         qxMyhUNVGpA3LUV+P+OSjZvdmj5JuiuHzycJLhDhR7iZNlA1MtCBzXNhc1FROt6l0H5r
         IisUrSa+fq7yo7ftiYasysvlRSBjJj0hcbdqM99zcUjitTK+Mkhlc2WgK1BHQxm/K4AB
         rL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776411247; x=1777016047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5hAEvyDRzBM68/uIJNex8X2q/G8gy+MFr0oAB7pUsFU=;
        b=p94fwxnvmAD9PmmCDrHlCHnObL62Axv3FyHSDWuLlf0s63XG8zpuwW6z8jsJ0N34ya
         QLNGd2ff1YNnrkokTCVgeci9fuPlZyKM5Kx2y7IjCLwXyQc4GzkDLBrgh1DNpGPFlgiq
         jCo8EZ2mNuf1Kv564X6qUyUr7O7JbAQnb2X4F3IlRWnM0v+QZCmtl0a8KL9ieG1fETwz
         709p1yseAQ3G9yV9GX9kna+SJpAKXK7iUEEb1X5dXvModUeMKS+a6DLBGJfmDHtUwbgy
         YhpjudUEnqb/fbWuq0agsTPvauLMMMS+DXIQE18VW5W4FTiU4W6f9ZiiJyzqogzvl1nc
         S4vg==
X-Forwarded-Encrypted: i=1; AFNElJ9h00M86zdOxDr7KFhMm55L0JZmWw7zQDWZs+0/CGafXBQjb5i26SrS2wTnFS7Y+c1FhK4tVma/bnBUFfC0@vger.kernel.org
X-Gm-Message-State: AOJu0YzegSn5Ca5MRwBjDQKEuaVo5Y0pSZraZ5DnCd7S9blf2zRbpCB3
	6FXN/XuSN/l/wAMcelX3KTWRlVFbY2zz7zN/i5yoIJS1ld0SwJoPFgMJ4EAh+Wx5muI5KUcw5fA
	GIXUSbRzwaZF14j8jQ/Qa7vMFlnOAxNhg+/ZtqsXCArlXVYuUphoPlN6icK/x/Oxj9qy7
X-Gm-Gg: AeBDies40JkySzEPmQ2O7aSdwUmNgZEejhk68hrp1M4imKFTJsyMIKQn4L6eqkFM0lz
	hKja1ep8MXglqqiyqAbpuLo3yYR2gD/dEKr4lo2ZPwXewl35ANQktN/ORaBHW5CoGuT9vgOWTvz
	N5XPxWITvUwkvuzNmv80oSPOAH/z12u7qxFFawbr0aeV7F1Q1WNtOIsbAJtB8k3KJqpstwOryFj
	NaU7S+FQHJ53FKjTF7p6IoWUQdLfwf7o+wLS3Ug01lAuR7qCvK2gEPHMoZt4CALFvzoL7/f6E7Z
	EWAq/yTVW0WQG/hsobvvH5N+EoQaCzWfiksqFEj4dE12C6Cvawtxjl4w+dIPsl9FmPJlVSDh/MT
	ImCid3uXnDFQWQJGv/LDIGHVD+ziHke5NGvxPhZrOs/yc4CLyUk7F3d4YOvvfZYOX+PGv6fesx5
	muW9XK89683pQ=
X-Received: by 2002:a05:7301:d17:b0:2c5:60d0:702e with SMTP id 5a478bee46e88-2e47873bcd5mr821986eec.18.1776411247281;
        Fri, 17 Apr 2026 00:34:07 -0700 (PDT)
X-Received: by 2002:a05:7301:d17:b0:2c5:60d0:702e with SMTP id 5a478bee46e88-2e47873bcd5mr821970eec.18.1776411246688;
        Fri, 17 Apr 2026 00:34:06 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccd2564sm1135168eec.18.2026.04.17.00.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:34:06 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v14 5/7] qcom-tgu: Add support to configure next action
Date: Fri, 17 Apr 2026 00:33:34 -0700
Message-Id: <20260417073336.2712426-6-songwei.chai@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA3NCBTYWx0ZWRfX17K/4FXdrH7N
 3I9tOGq+D0fGeSineZuH8vZke0tdY9yAyKYY+x87wC4BNYD3KVGojcpX8ubIn4GFgPUNZLa1F8f
 y/KXK2aMYFN52IR3vNrfSIVdAM4dGTMxwY4ZBjckMNCCPI9zqk+opFpnpWMph+QxJhdQR8e3xIq
 ZBCAjxrccBVBmhXdQTbKJEujRUlfxH+IWqM4C47WsqAVwP5n47ogP3dUtsGEuljwwHly5p4CHIK
 YkMrrCbUyvW7B2yUlSCjg/cl/WJ9zvy2Mg6rHsQxiM3iT86j65YX2T0RRaNXjgzCG1qzPb5Sj5e
 AAyeM430UVOiV+tXq4ISnFEUD7Y9nRCFymqsE37tNdJJG5RJ9PBv5bKrYSGZ1fjYwiCMSA2q/ry
 QGp7ERKWhKJJ4lJnwYK1f3tedBv1UNU3LSWWcjRqHcvqcuGcWb0I8ihFHzOeOAXTSUpCbihlgBI
 WnSjneDXYSrCCpKsyVA==
X-Proofpoint-ORIG-GUID: PpKp_-kLXZA2u5Vou3nIs5QZYnpchH7J
X-Proofpoint-GUID: PpKp_-kLXZA2u5Vou3nIs5QZYnpchH7J
X-Authority-Analysis: v=2.4 cv=DfInbPtW c=1 sm=1 tr=0 ts=69e1e2ae cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=s623Ih-0px1LxcEVn60A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170074
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
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-103483-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[songwei.chai@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 26061417FC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add "select" node for each step to determine if another step is taken,
trigger(s) are generated, counters/timers incremented/decremented, etc.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 +++
 drivers/hwtracing/qcom/tgu.c                  | 53 ++++++++++++++++++-
 drivers/hwtracing/qcom/tgu.h                  | 26 +++++++++
 3 files changed, 84 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 4ef0d696d3d0..786cb852bbe5 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -21,3 +21,10 @@ KernelVersion:	7.1
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the decode mode with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_select/reg[0:3]
+Date:		April 2026
+KernelVersion:	7.1
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the next action with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 937211923d93..fefe932059cb 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -29,6 +29,9 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
 	case TGU_CONDITION_DECODE:
 		return step_index * (drvdata->num_condition_decode) +
 			reg_index;
+	case TGU_CONDITION_SELECT:
+		return step_index * (drvdata->num_condition_select) +
+			reg_index;
 	default:
 		break;
 	}
@@ -71,6 +74,9 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	case TGU_CONDITION_DECODE:
 		return sysfs_emit(buf, "0x%x\n",
 				drvdata->value_table->condition_decode[index]);
+	case TGU_CONDITION_SELECT:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->value_table->condition_select[index]);
 	default:
 		break;
 	}
@@ -112,6 +118,10 @@ static ssize_t tgu_dataset_store(struct device *dev,
 		tgu_drvdata->value_table->condition_decode[index] = val;
 		ret = size;
 		break;
+	case TGU_CONDITION_SELECT:
+		tgu_drvdata->value_table->condition_select[index] = val;
+		ret = size;
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -146,6 +156,13 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 		if (tgu_attr->reg_num < drvdata->num_condition_decode)
 			return attr->mode;
 		break;
+	case TGU_CONDITION_SELECT:
+		/* 'default' register is at the end of 'select' region */
+		if (tgu_attr->reg_num == drvdata->num_condition_select - 1)
+			attr->name = "default";
+		if (tgu_attr->reg_num < drvdata->num_condition_select)
+			return attr->mode;
+		break;
 	default:
 		break;
 	}
@@ -184,6 +201,18 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 				drvdata->base + CONDITION_DECODE_STEP(i, j));
 		}
 	}
+
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_condition_select; j++) {
+			index = check_array_location(drvdata, i,
+						TGU_CONDITION_SELECT, j);
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->value_table->condition_select[index],
+				drvdata->base + CONDITION_SELECT_STEP(i, j));
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
 exit:
@@ -223,6 +252,8 @@ static void tgu_set_conditions(struct tgu_drvdata *drvdata)
 
 	devid = readl(drvdata->base + TGU_DEVID);
 	drvdata->num_condition_decode = TGU_DEVID_CONDITIONS(devid);
+	/* select region has an additional 'default' register */
+	drvdata->num_condition_select = TGU_DEVID_CONDITIONS(devid) + 1;
 }
 
 static int tgu_enable(struct device *dev)
@@ -366,6 +397,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
 	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(5),
 	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(6),
 	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(7),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(0),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(1),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(2),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(3),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(4),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(5),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(6),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(7),
 	NULL,
 };
 
@@ -373,8 +412,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
 	struct tgu_drvdata *drvdata;
-	unsigned int *priority, *condition;
-	size_t priority_size, condition_size;
+	unsigned int *priority, *condition, *select;
+	size_t priority_size, condition_size, select_size;
 	int ret;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -425,6 +464,16 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
 	drvdata->value_table->condition_decode = condition;
 
+	select_size = drvdata->num_condition_select * drvdata->num_step;
+
+	select = devm_kcalloc(dev, select_size,
+			     sizeof(*(drvdata->value_table->condition_select)),
+			     GFP_KERNEL);
+	if (!select)
+		return -ENOMEM;
+
+	drvdata->value_table->condition_select = select;
+
 	drvdata->enabled = false;
 
 	pm_runtime_put(&adev->dev);
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index 56e4161a8bc2..c61aa8dc51b0 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -52,6 +52,7 @@
 #define STEP_OFFSET 0x1D8
 #define PRIORITY_START_OFFSET 0x0074
 #define CONDITION_DECODE_OFFSET 0x0050
+#define CONDITION_SELECT_OFFSET 0x0060
 #define PRIORITY_OFFSET 0x60
 #define REG_OFFSET 0x4
 
@@ -63,6 +64,9 @@
 #define CONDITION_DECODE_STEP(step, decode) \
 	(CONDITION_DECODE_OFFSET + REG_OFFSET * decode + STEP_OFFSET * step)
 
+#define CONDITION_SELECT_STEP(step, select) \
+	(CONDITION_SELECT_OFFSET + REG_OFFSET * select + STEP_OFFSET * step)
+
 #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
 	(&((struct tgu_attribute[]){ {                                   \
 		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
@@ -76,6 +80,8 @@
 			reg_num)
 #define STEP_DECODE(step_index, reg_num) \
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
+#define STEP_SELECT(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_SELECT, reg_num)
 
 #define STEP_PRIORITY_LIST(step_index, priority) \
 	{STEP_PRIORITY(step_index, 0, priority), \
@@ -107,6 +113,15 @@
 	 NULL               \
 	}
 
+#define STEP_SELECT_LIST(n) \
+	{STEP_SELECT(n, 0), \
+	 STEP_SELECT(n, 1), \
+	 STEP_SELECT(n, 2), \
+	 STEP_SELECT(n, 3), \
+	 STEP_SELECT(n, 4), \
+	 NULL               \
+	}
+
 #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
 	(&(const struct attribute_group){\
 		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
@@ -121,12 +136,20 @@
 		.name = "step" #step "_condition_decode" \
 	})
 
+#define CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_SELECT_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_condition_select" \
+	})
+
 enum operation_index {
 	TGU_PRIORITY0,
 	TGU_PRIORITY1,
 	TGU_PRIORITY2,
 	TGU_PRIORITY3,
 	TGU_CONDITION_DECODE,
+	TGU_CONDITION_SELECT,
 };
 
 /* Maximum priority that TGU supports */
@@ -142,6 +165,7 @@ struct tgu_attribute {
 struct value_table {
 	unsigned int *priority;
 	unsigned int *condition_decode;
+	unsigned int *condition_select;
 };
 
 static inline void TGU_LOCK(void __iomem *addr)
@@ -172,6 +196,7 @@ static inline void TGU_UNLOCK(void __iomem *addr)
  * @num_reg: Maximum number of registers
  * @num_step: Maximum step size
  * @num_condition_decode: Maximum number of condition_decode
+ * @num_condition_select: Maximum number of condition_select
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -187,6 +212,7 @@ struct tgu_drvdata {
 	int num_reg;
 	int num_step;
 	int num_condition_decode;
+	int num_condition_select;
 };
 
 #endif
-- 
2.34.1


