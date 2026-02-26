Return-Path: <linux-arm-msm+bounces-94200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOy4DXuqn2m1dAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 03:05:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD7B19FFFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 03:05:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1ABAB304467F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 02:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9BD726B764;
	Thu, 26 Feb 2026 02:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lOAU6/Zc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bYoPB9lP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FF4372B57
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 02:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772071528; cv=none; b=OZTz2t1VPxYaqnN4QfzErIncmO118dgYYu3EDOzww+Ar36zcIDun5an9YbKH/XV77naSuX3XYuO6+BURpa4gqnkndQs/J3uADKKisb4pAN/aCEIgMZIenrCONDlYPLV9C4pgknOGRBWBm8YZOZEiyJKkiy+FUBopGXS3XmRnOyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772071528; c=relaxed/simple;
	bh=FQ7+8UQrfazchx/xR38mGEbVPKuFWRswgYVgS6aEHrs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=csZSe6aSa1tHPc1zWtIrOya7AxR4UHny64tb2JQwFI3ro3kYl/OL2H9dYLbAWAbS79jxIjNGKu0BfYBJgNrQNgntct9YyWm2booKmCCxmWgnyQm219Oz7E35dr9auMGgg05yxiCVAUumdzeGHVFU/t6EGNmn8FbHQ8Udw29oa0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lOAU6/Zc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bYoPB9lP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PHa47h3056486
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 02:05:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z465nXzp8HC
	BbM4FmGtCUWDvb5Hdu3C6MJbefety11I=; b=lOAU6/ZcYPvVfNLJPEQq4gjH75H
	YxqUdBwVI6DuUK6KtgugySG/Vwi4exzQoyQ6Dnck/2gKv52xvfNzJylst84COvgM
	yyIvGcKKXaZC1PitLHKGT4/hQFrh/s/1NViUQTAn1kAOj2S8I3v/MbDULSY8cP2x
	s7rnkNih2eH4A0mMDrmTMLWU2stoWo/oRs6cQhZLJM9u5B349tnfey06d3p16IPC
	wvxCT7C6NBSiHtz+ccCUAfO835UOWQYIj7QgbnVDoGg0jU3InZaPu7u/TNNhxtWI
	6TtblXGpcS9osf/vEwKHymcN3js5QQlJhpHxKd6O1/7l2GTn/O6/GvT+rbw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chx39jv95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 02:05:26 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d4beca8c53so1319003a34.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 18:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772071526; x=1772676326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z465nXzp8HCBbM4FmGtCUWDvb5Hdu3C6MJbefety11I=;
        b=bYoPB9lPEte/vYuQkw76YQv4pbDZTfUDVY8sgcVYCz9UHMTQWWXyPNS4ctwmrHnlgH
         uwaWB2/Rq8Gjhr9ibd9eF/sL2EjOGyMrC0j+21GBfvOO893s7gTZ0CdzzetcRlkDEgvP
         jpRCdxrSqYONu8OZaJxMB5W5ysp0I8YOqDpNG45pbPsEETmudYE86VL6TWXrL/WmSmR2
         eCVojvu8+bc5ZcNF4EfoZC1sGv7e5SxXUGZklupl0EUZw0j95b3hQY3zcerI2YLgSpbW
         jLkQlZ2vAiv7KU+xr3vOGdM68EyUQEQdB/q8yVWEgVeHjJ/7w8LZ+/gon2yasAaZklvC
         EBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772071526; x=1772676326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z465nXzp8HCBbM4FmGtCUWDvb5Hdu3C6MJbefety11I=;
        b=CC1B6Q0EcHDHOvx/FbmnX/rKJvKGdBAxjipcX69jmVH8dOWlnClC+DaghoNcFPJw7M
         ZezETKO3+smkagGPOTv4W3AkrX0kLXh2wswwKi7k3js1xo8ErIquirjhlooFNTFelfKT
         uECIux6IkuZk9pF7aQlV1BDbSSFneKAYRR0ydojM2tNyg/znDFSA584eb0uGOBQ4eJWU
         g9pJYiKZdNryJiqWQSIntbhVwxmBFLQF3Fb7Q34/mZ82Fd5frtFRSOkYP7XVGiOlUxSc
         YeeopfZb/mV7EuDbD0vnQsPp2CjGONUqEMmpGxJbjMj2JEcFNDAZjjmJ2ORCTUhmSv07
         wGKA==
X-Forwarded-Encrypted: i=1; AJvYcCWtcCv9jyNK0QQNaJFR9PtUece9HHR45idofjLKtXGgzgcKiiS5/zX2QvV8VUzj78QR0AIf88280PuqAVuE@vger.kernel.org
X-Gm-Message-State: AOJu0YyKi9qtipj1ekIxV5GWb0XjOH2bX9Kge3b6x7a3NIro4dgCVxk/
	0tUgBiIJo6C/xq6NsEYKy9KXxeq/tpauJoDoAdMvGElEAwsehQiiHXQinKy9bx1dK6zz2lxQI1D
	x2xGsHmc0BAyl3h+klEzx/l03fvkMDW/dUe419vJEqlClRLgJQzHzj4Z5AKAkKCc3ZxWI
X-Gm-Gg: ATEYQzzXJ7x6i3J/36TNybxMB/KZrqy5SaS9KFTx3xZDV3KO7bWfeswlDbWd4+L0VvM
	tSDn5rhU4zdwuC2i1nRm7NRUKniVs0EZ/k4zHXE83+pHJspUoQDLp+4tKtNJnOJevj42YVR6SxS
	KsgtNhCuMrADHFzTxVzNl8CPvFwrOFLS7VnNFNvWr9aEBjsjzIpZJytE9PGmfHzcH6tmjnsvzkx
	eB4aBNtHN7ZW2HTh0LiFRXd1j9diqgtDaqVCar2l7SAwyiOGFhO2kplonhEwPjNlnQCa90vsvqA
	Y6ohVRWq0xGvnZvUYrIGyHY2zSZSP3ZSrH2Mz6ZQ66IqkMM8EZLH6/YJSPg+je9xFFoElksaVLK
	DqTmgqCt5LNKJO2ryuxzd/RRWHuEOAn2KMu379/p9V6CWIn2zjwrQHTCgJ7TqjaGD/JrOfDqx/K
	Sl
X-Received: by 2002:a05:6820:308e:b0:672:8d08:af5a with SMTP id 006d021491bc7-679f3dc2fdamr267195eaf.66.1772071525783;
        Wed, 25 Feb 2026 18:05:25 -0800 (PST)
X-Received: by 2002:a05:6820:308e:b0:672:8d08:af5a with SMTP id 006d021491bc7-679f3dc2fdamr267180eaf.66.1772071525405;
        Wed, 25 Feb 2026 18:05:25 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679f2d9e8d6sm549939eaf.13.2026.02.25.18.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 18:05:24 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v11 5/7] qcom-tgu: Add support to configure next action
Date: Wed, 25 Feb 2026 18:04:52 -0800
Message-Id: <20260226020454.3210149-6-songwei.chai@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAxNiBTYWx0ZWRfXzqmIxUM58jyV
 ian5GbIt4moXuQIlzI0/cieN5uElKl9tHobWD7qSLii5kTBu6uoUSACA7BPW+oqcXHyRg/F5rXB
 lXEvxoZhWjyG0McrCFeHRU0yH56f6uxFEjJwandBHB8g1CM5rb1W7jbtKYrSmXA7hySNVs0ivgx
 sh3BJIcZl9di17IidMJFRP/BEzA53qdWCN/0j84VayYccrUobTQHzY6HRIwDSwk39BbHmrLek5A
 3bTUHD4xBWRYSKOFnG1Eca8PuCRqi3z8t+qiCKjQL/+grZf9GQSQYspv6j2lnhCuaLH1HXizZsG
 /e3rzANJXQodCO4IMmUr5dvxeymPay9Lf+3Fdslqv1CLnNXyi7Nt+fvqdJCtAqwfK2zraztDJWd
 klEt66hLFaPlp7xcrufmKYZ4xpfRpYvDZBXs1FmgUoRRp6NIRPm0R6wGnddujn3otVbgbpkfM/v
 ii1qFGD+a0oN616+a+Q==
X-Authority-Analysis: v=2.4 cv=FvoIPmrq c=1 sm=1 tr=0 ts=699faa66 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=s623Ih-0px1LxcEVn60A:9 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: KNnPvu4VBe3xdA-U36yQDdYJy1tDtJdU
X-Proofpoint-ORIG-GUID: KNnPvu4VBe3xdA-U36yQDdYJy1tDtJdU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260016
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94200-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[songwei.chai@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1BD7B19FFFA
X-Rspamd-Action: no action

Add "select" node for each step to determine if another step is taken,
trigger(s) are generated, counters/timers incremented/decremented, etc.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 +++
 drivers/hwtracing/qcom/tgu.c                  | 53 ++++++++++++++++++-
 drivers/hwtracing/qcom/tgu.h                  | 27 ++++++++++
 3 files changed, 85 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index a18f6e4c797d..fbe8efe470d1 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -21,3 +21,10 @@ KernelVersion	6.20
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the decode mode with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_select/reg[0:3]
+Date:		February 2026
+KernelVersion	6.20
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the next action with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 85fe1140eab5..1d996b9e303a 100644
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
@@ -356,6 +387,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
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
 
@@ -363,8 +402,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
 	struct tgu_drvdata *drvdata;
-	unsigned int *priority, *condition;
-	size_t priority_size, condition_size;
+	unsigned int *priority, *condition, *select;
+	size_t priority_size, condition_size, select_size;
 	int ret;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -415,6 +454,16 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
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
index ca8dfbef0cd2..5beaf82b4b8c 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -53,6 +53,7 @@
 #define STEP_OFFSET			0x1D8
 #define PRIORITY_START_OFFSET		0x0074
 #define CONDITION_DECODE_OFFSET	0x0050
+#define CONDITION_SELECT_OFFSET	0x0060
 #define PRIORITY_OFFSET		0x60
 #define REG_OFFSET			0x4
 
@@ -64,6 +65,9 @@
 #define CONDITION_DECODE_STEP(step, decode) \
 	(CONDITION_DECODE_OFFSET + REG_OFFSET * decode + STEP_OFFSET * step)
 
+#define CONDITION_SELECT_STEP(step, select) \
+	(CONDITION_SELECT_OFFSET + REG_OFFSET * select + STEP_OFFSET * step)
+
 #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
 	(&((struct tgu_attribute[]){ {                                   \
 		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
@@ -77,6 +81,8 @@
 			reg_num)
 #define STEP_DECODE(step_index, reg_num) \
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
+#define STEP_SELECT(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_SELECT, reg_num)
 
 #define STEP_PRIORITY_LIST(step_index, priority) \
 	{STEP_PRIORITY(step_index, 0, priority), \
@@ -108,6 +114,15 @@
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
@@ -122,12 +137,21 @@
 		.name = "step" #step "_condition_decode" \
 	})
 
+#define CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_SELECT_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_condition_select" \
+	})
+
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
@@ -143,6 +167,7 @@ struct tgu_attribute {
 struct value_table {
 	unsigned int *priority;
 	unsigned int *condition_decode;
+	unsigned int *condition_select;
 };
 
 static inline void TGU_LOCK(void __iomem *addr)
@@ -173,6 +198,7 @@ static inline void TGU_UNLOCK(void __iomem *addr)
  * @num_reg: Maximum number of registers
  * @num_step: Maximum step size
  * @num_condition_decode: Maximum number of condition_decode
+ * @num_condition_select: Maximum number of condition_select
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -188,6 +214,7 @@ struct tgu_drvdata {
 	int num_reg;
 	int num_step;
 	int num_condition_decode;
+	int num_condition_select;
 };
 
 #endif
-- 
2.34.1


