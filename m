Return-Path: <linux-arm-msm+bounces-106616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJGuGh+y/WmlhgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 11:51:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC614F47A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 11:51:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F514304CFF0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 09:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7CB3CBE9A;
	Fri,  8 May 2026 09:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="auGDeqFD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H3fFwgy0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C238F3A6418
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 09:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778233878; cv=none; b=gFl2AAf/iK215jFueciWPmwRRM0Gy0Dmenn5O61ZuABD6NJrPJy89zg3COnUYXFKbg5QiOwp/EF9GdY6eEHJIcGiYxnjAXExYRz+s6JoueSmwVrLNZ8FjS6V1skAzhAu2eqz8ybCnsCpyVEbCYkgAV2FcptqZ7T52grA8eP1/JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778233878; c=relaxed/simple;
	bh=A9+mTcBSQybwQWajAHQd2dDBgtkeNZu/YRICsAQUe1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jgQ9NbpjL3V4dBh6AvW+GW7Gi1IkcSfNxtHi9n5KoEH8yFAOO6dYzGRz7rBrhLKzRpy7q7OJlYG9DpUDtrftyI6umxsXQ9RBXxVfCHAggXa1G2AemFwMCHIRD5pL/b7BpgztO8HGZU0RyMbb7ivw+ZI4z+w/AjkYMKSm9zPGtPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=auGDeqFD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H3fFwgy0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6485VTu42199486
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 09:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TtN2Hj23wPRHyv2TVHUkVRACaL0lMfhM10EaRoSVv4M=; b=auGDeqFDFu9eM7Kt
	4qiovqKhg+NZglPDjTnQs6xCz4akTnzidSOj5QdtJIq3RlTvwveUV8sas69segEn
	bRR+yBXgDm26U2kJ2k3El6ovDIAyTN5CFYn+tDmQ4EAG+PmgClay125cEGZ9i6SR
	ILw7gN6utoTbsMbcDX3Li00EHPUz9MsLQ/3zb1pNOsWO9ZMxsXhqjhClqg+iJa7L
	qScB4aLKL0/dzNpGRpFz2bJ6h1x+QqBwL6HxX18t4imrSuNN6+h8mogfGs2h5EHH
	SXDuxpWknzGe24WUHWzK6BIP3VBYzH+9Lgoa3Jdqp/674u+jsfuLkP9UCDBq6V4r
	KM86lA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e119sjqdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 09:51:14 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2cc75e79b97so6690635eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 02:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778233874; x=1778838674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TtN2Hj23wPRHyv2TVHUkVRACaL0lMfhM10EaRoSVv4M=;
        b=H3fFwgy0GL9paj0M5QB9oGGHCapaJABYRPEQxRxWuT642N94xGlkFL3nhUTQkfdy+q
         /CpueaW+Mo1ZdV5rYtthHS4M+J4YqoGSINnsSnUtiu5vj1zNEnmBLHR36tCVffT0fJQH
         yCWnBh9E6n+E6NwJXoy73hPc8D8/QdImAHYxvrL0eh8Ns6UlrwNUnCZTrn6jQw0Li6Eb
         wd/jQb9RKs1loZHdqOfXqzvZYfWtJsQ4GoIrLIxrmpvpMZlyzWuITcwfUqnYRhxvzH0e
         6rcy3oebqm9mM/kYpRZV3gn8VhHwwFYiWGNRz5qq+ovJeYwyGsnMnMUUpmRDKqRv4GsV
         CudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778233874; x=1778838674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TtN2Hj23wPRHyv2TVHUkVRACaL0lMfhM10EaRoSVv4M=;
        b=kfltSzA5sOyvDFJ88X4uM4djFgnjm6V02tR1iHa0/2uCAaEbsraSWXr5x3v+dGr1+T
         0ccGxzVAfjzhBpjjuifUT3n8B6nIpyQRvp8QbDUa1BKE6e66fAvCOH7A6OAJoqaMqElQ
         0xU0ZiKAizcnPC4AhlYuLoUo8petQA82Lhc864ujGQNHrmGlK0RNHChtOijRAAS+OsVi
         TQbW9MobMFrGXlScQwAmGYBg68LwzJNkr1BVpVRAabyoCNi6HaZQF5AzN6o7mtWWKXmC
         JbWn+EnpgpyFaYp2n9k+4jicPXiICByWf/HrR3NDAQXAcIL5fBlrqv+yvtPvyMA4sJjp
         Jp0w==
X-Forwarded-Encrypted: i=1; AFNElJ+oX2Ga/Z4VN6QYjzfYs5bLfkGXMtvskP9qeUNKgwHJVsVZ64gizv7rrabzR4kKB31wwFk1qjOYdQf8G7Qk@vger.kernel.org
X-Gm-Message-State: AOJu0YylsgcFuradtEO+eBIzx5FC9gVASSrJELU1Rr0nwYnonZzvt5W1
	qFGAKmSxGs23spDuwuy3E5/xkCNkyuraKcgGo/67nUT/iDhLRDo11M5m49f8yuEjl3DRUDWBQsG
	nV5tX6SMuNJR/G5NAd5LK3Jm2nPnC9pkIB4dhwg9npgsgG9m4O3nEcczGRHfAnLRdhWT4
X-Gm-Gg: Acq92OHSOKl4skY8pbu9TMhTu1Eeihf5hvF0rT6zGf9JJAjFaZrngRBix+KbOsvf5B8
	MelzMqX7s+Mj1c/6fQriqKhPF4psxjlAvrOW+u0wm9Eg6XTuMvYDzfoZwOxuTL5iqo7uPkHOfK7
	ExzlscHlwVdzfM+UFQBuPQm/apJAeIylpXZKRru/jHAaaQ06ddPTSNftWL29U9zSU/v75q1Ji0v
	6ItmlCHxCY2f4dWNa9QE9VhrTwax8hGbN7zLzxhDUbcNCcNHulyBJCHT3IvnrT68M4HSb73Y7HS
	0t+epGWjizv8alWa0JmDxj35TJmarUaherH7daJi8ulnlKPK2cxoLQY3v6jIlfdX8WvzABHSKv9
	MYOeyv//QwKZApIl1R52ABp8C+Fp2V3ubDSUtHKaQyPaHaXwMW7XkrRshK6dk2XfdVoT2uSkfl+
	PQKM1o1njhipE=
X-Received: by 2002:a05:7300:5727:b0:2f4:3a9c:818c with SMTP id 5a478bee46e88-2f54d678d74mr5935421eec.29.1778233873593;
        Fri, 08 May 2026 02:51:13 -0700 (PDT)
X-Received: by 2002:a05:7300:5727:b0:2f4:3a9c:818c with SMTP id 5a478bee46e88-2f54d678d74mr5935394eec.29.1778233873070;
        Fri, 08 May 2026 02:51:13 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88847502fsm1739323eec.14.2026.05.08.02.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 02:51:12 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Fri, 08 May 2026 02:51:04 -0700
Subject: [PATCH v3 2/5] media: qcom: camss: Add SM8750 compatible camss
 driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-add-support-for-camss-on-sm8750-v3-2-fc6861a65c67@oss.qualcomm.com>
References: <20260508-add-support-for-camss-on-sm8750-v3-0-fc6861a65c67@oss.qualcomm.com>
In-Reply-To: <20260508-add-support-for-camss-on-sm8750-v3-0-fc6861a65c67@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEwMSBTYWx0ZWRfX76QjAVcpc9Ov
 PHlauTM1loW4NzrAWR+YoScx+OLRVgGoKt/gUN5bsRlPW8y7np2fjjYBT+/HmtSp5wYL9Tl15Rb
 9eUZwlHh8ZkIxm2l8rsyJ6oiYVoT/JOfklfy61XPMeqGpWwbIi+PQES0NsehsgU+EHRZizBIabU
 s9mHkD5MVBv5UtvfjagMfMY2zewoeo828U7sgZ/BeuZB0/kDs3LMjsY4PufuYoVnt2tCf7U0Fec
 XbvOn6vh61U2xo/hZMKzSo+6l2Gq1BiKRa4DC+taxMrAdt0AGoh1wgJoVYFN8N0nYalgJ4OHihn
 j5v8mNsNyLt23Myn+agVYkm+GzrNhwTfmgqt6WPVY91mmUlUG1ZNQknuCIp3xKzh+JtpcGCIQMk
 flyA2xe4EFwkzWJzixBMqdpUY8O4e7TId5PPEdGmXbMM6Qy36VuizegdxtukDUjZATQrQBYiIEK
 nIKbKYU4hBYD+nfKXUw==
X-Proofpoint-ORIG-GUID: MJp160Ry8cPN3XkHgHOUGQVNDrAFdtnC
X-Proofpoint-GUID: MJp160Ry8cPN3XkHgHOUGQVNDrAFdtnC
X-Authority-Analysis: v=2.4 cv=Dd4nbPtW c=1 sm=1 tr=0 ts=69fdb212 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gE60Ov1lhapgyOv8Ur0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080101
X-Rspamd-Queue-Id: 2DC614F47A1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106616-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hangxiang.ma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for SM8750 in the camss driver. Add high level resource
information along with the bus bandwidth votes. Module level detailed
resource information will be enumerated in the following patches of the
series.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 04f04d0c2fc7..3cebce812c58 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4238,6 +4238,20 @@ static const struct resources_icc icc_res_sa8775p[] = {
 	},
 };
 
+static const struct resources_icc icc_res_sm8750[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
@@ -5660,6 +5674,13 @@ static const struct camss_resources sm8650_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_sm8650),
 };
 
+static const struct camss_resources sm8750_resources = {
+	.version = CAMSS_8750,
+	.pd_name = "top",
+	.icc_res = icc_res_sm8750,
+	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
+};
+
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
@@ -5692,6 +5713,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
+	{ .compatible = "qcom,sm8750-camss", .data = &sm8750_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
 	{ }
 };
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 2820c687e066..dafdfe1d3a4a 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -92,6 +92,7 @@ enum camss_version {
 	CAMSS_845,
 	CAMSS_8550,
 	CAMSS_8650,
+	CAMSS_8750,
 	CAMSS_8775P,
 	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,

-- 
2.34.1


