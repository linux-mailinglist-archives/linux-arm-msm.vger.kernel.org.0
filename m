Return-Path: <linux-arm-msm+bounces-110632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCf7GceqHWq+cwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 17:52:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEFF622148
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 17:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 349C93047BC8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 15:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58AA73D9DCE;
	Mon,  1 Jun 2026 15:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7c6qpj7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hEFPCjgL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FAF3BB105
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 15:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780328543; cv=none; b=q4Nu0o0SxLaKlRKcTtrX2gRQE9U6j8BWk/1fGm+IaG6hF6ecwEvgcZ0rhau0GbUjQv3vpTvcaoMsy35Hc57YuLt509MmNVXQNkA9KDEXKLyGfPQb5zANBQcy/PZOzYsVwSUvZWduTGaqK/Fc29UNghtWaesUdT3gwBkT51Ld/pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780328543; c=relaxed/simple;
	bh=Ozl5EeXxBuqxv3EqPkK5t0/LMK4hoJjLCYFpbaWf0HM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LZAODXwmMRUEsCZPCusJSeAEp2NjjPHlTLN6jMvowfzKFXIwWBuF0ROLQoLxkL+4ULwSMVo1J1BJT0CrOxS9Ppd5PQpGKaKuXlmEO5sgnydAYpn7sfBoNwGbgYTX52lqeCu7CmDMuyUTbxvdXrFmfBomxqTY6noanDhqBwW9Mgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C7c6qpj7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hEFPCjgL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651FeAAq3372586
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 15:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2TNzr3HoHbuhKfUhKh1x8ZLE6HzCcesuUXBRRI2rJng=; b=C7c6qpj71VmpKgQ6
	U3nhSN+W1y1rZLd8eSJLZjq2V/xyQxAB7/HW0+mTkZkpIKFiVWHhmyXRH+63GYyy
	tfZU1jQClJoCZDeoT3MBFjChcOFN9BHuOvJhqLsy1TWYNqArwSBSHFHHBn9W74la
	1G/rTaWL6+MYFpcDOMsUdI01K2YsKgsEZszImCxj6C9StQyhvXf2nAmqtXutrSAq
	WL5+f/iWwRRIEdDILlXoIOgAZ2ksuj3iBCm+jGRsBs7UNzYj4B6FZVyVyIv/C2oX
	6DWV5T1vufLe9HfvOXaCsV9Dw17KKYOeLdl5/xQ4pmsCJmhCfce8Ye0zJ5bWT2mB
	mOGf2A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh7jh9hwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 15:42:21 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304d0d0b28eso2372042eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 08:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780328541; x=1780933341; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2TNzr3HoHbuhKfUhKh1x8ZLE6HzCcesuUXBRRI2rJng=;
        b=hEFPCjgLU2/RjRVetslpadHRq32/a2c707SfSNNPpr6V0EEMfFh3xsf5cK9c2CPh3G
         iTRFy88PIjYN3QQmQ7UFAkedru1tklqM3VhvFHpysRvXJ7y8wpkd/7JETv6eSsM5jwMl
         SMYCGlBbF7gorKJ/MMDDM1YPxXMPsaw8aCuwRCZ/pABbDW4GteN4npXbR29Y7f7M/Low
         MdwalABR0tsId2jr4bly/4H/4udtG+ZJdNVMPPqWqvL/88UX0hw1cG7pKVKPNTvdwSj2
         /vJHww2dN5AHIdlkCe9iO9EpEjpeYnJP9VLuq2p7w2nbzsci/jK/PyF2/g5AZuJye478
         sECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780328541; x=1780933341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2TNzr3HoHbuhKfUhKh1x8ZLE6HzCcesuUXBRRI2rJng=;
        b=Vmhua8tlC8ev8TiB4zQ+ZQyqvCZCBFppZYqVnoguMmC+/dQkx4t01jEiKeOrj6Sw2/
         PsQKOfTl8k62D8n1XoEMzIkK4YTGSNmg/gOA0Q90hzKUdet/Ji1qs1NWFWJsRX1kv8LF
         t9oBokCzeoNjs4FUpXBmXF72gJxgORREaQnvRiJVOdf+vvC0Lhe/SrDoPiUvOxLmc0M5
         ru9a4f1mwKtG2JoMg7xMt/ptrknI8XSUkoblGeeBbrtllGWrJlPRNX+BkaxMkStlO/IJ
         ORVGafjL5kWNobKvpCyDV419kFxYvlxSUf/z5hidNouj24vxC2JQyvryMW8/2HwUQtMX
         D50A==
X-Forwarded-Encrypted: i=1; AFNElJ/DYUvnVyGLtqIXC6PALkYZKkohehZlb7wrqBOfHXoWXyc70Gl2cOR+6D/DevCIxVz8kwSBA0CAv8SC/U8N@vger.kernel.org
X-Gm-Message-State: AOJu0YzSyRVTn7k6E09Mbj4N5Plowd4K48YTDYH1hoakrhZvnyekHxy3
	Ta5nV+XF/djynLmuMdB+zaaR7FbaL1L33yurbU+2LfyrYtrz7skBVGeMcjtdmNwBIk6F9LgyPJi
	L0Ttpnfak58RDDRybbqc2VD6kom1BlG7evf3htvbMotW5v1ms/QxIqPl3JL5WOTT1YoSG
X-Gm-Gg: Acq92OEzrVh663xpxUjc3RCPwdobtZAhKAB+vHzSb2b9TdYSO/KoSOZMRscniB8uEUw
	RWsWJLu1xMvfCWnI8dlkQxeikDpsJDpGVLF1XP7bRGZLyKXb60npPZX7E9GX3TFu1OOTA/uAmwY
	zS0KaqbQW4cGQLkjeiIZTDJ/uP7qCHfUogo2gXwhKEQQohGEeKqf8ftd27OY2vVJxWmlNgimQGu
	cDgCUqpWuNitzMkgTqo3jQu/vBUzPWJfLAO/dm6598UHPPpQA7qnIWt/efdIKcdTPriOTnM7H81
	3wAamj22mcDyldLIxzUWwczKN3UfJgWtsln46CWgDxQYJ1MFE0OvA0ZoQJEDieH85Zkt4CNu9Zi
	/jtXe98pJkIdI1PbB7C8PH1X3rpkZe2UAXfClYPncQSggbG4B07Qbe573SYpfQRNUnGlw8f6r59
	2V5NjhRABu0hk=
X-Received: by 2002:a05:7301:1e92:b0:304:8364:e95f with SMTP id 5a478bee46e88-304fa64b8efmr4589947eec.27.1780328540473;
        Mon, 01 Jun 2026 08:42:20 -0700 (PDT)
X-Received: by 2002:a05:7301:1e92:b0:304:8364:e95f with SMTP id 5a478bee46e88-304fa64b8efmr4589920eec.27.1780328539931;
        Mon, 01 Jun 2026 08:42:19 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed53f002sm9430371eec.18.2026.06.01.08.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:42:19 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 08:42:15 -0700
Subject: [PATCH v4 2/5] media: qcom: camss: Add SM8750 compatible camss
 driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-add-support-for-camss-on-sm8750-v4-2-1eb6f432cfd1@oss.qualcomm.com>
References: <20260601-add-support-for-camss-on-sm8750-v4-0-1eb6f432cfd1@oss.qualcomm.com>
In-Reply-To: <20260601-add-support-for-camss-on-sm8750-v4-0-1eb6f432cfd1@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: NHwR-vdru9mXwgbVXRla74sXyIwinnIh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE1NyBTYWx0ZWRfX68uKA6vppo7C
 CagxM/sDGC6Lg9ayld041tcSamUUUrqVdZ+WSO7IrJWjkUvMqaKKP6agmYf9oK/o/G6moBygAt4
 QVVaXixOjOhJrL5FCM8y9O4YMuVN2lWtpIRHT/WDwrNkHelXyloNbEKBs/t8xgVSl7A8qC+1cLT
 2qJl+CMHoNQEHV7I4v26sWlPxfRnF3dZnNhTivHwYCGR5j/0Mrw3XlU4qRJuuEM5FeO/oZOQ7e4
 2LNzI466w5o+iOGZ7+gMVyV3wl6eogASjfqHIPrud6xMzGngp7IYVkZrHMVKwUcskW83GDl0DUl
 p04fDw2Apt/ExQpXEiK8s0eeLuXGWYp1pIwj8Ehma/KcOKy0mI/mEyBZF35VzARcnckfqLsVfZN
 +YtaXDr5zhMAiAN21ZW5abPCPNIRpIfU7Oayjiob304fEMbq/o8DWKi0RRbgHuYsoqhMud187vo
 j26YE3JafPLhFzDHyqQ==
X-Authority-Analysis: v=2.4 cv=YuY/gYYX c=1 sm=1 tr=0 ts=6a1da85d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gE60Ov1lhapgyOv8Ur0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: NHwR-vdru9mXwgbVXRla74sXyIwinnIh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010157
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110632-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:email];
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
X-Rspamd-Queue-Id: DDEFF622148
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 8fed46868d62..834f6c1a2519 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4533,6 +4533,20 @@ static const struct resources_icc icc_res_sa8775p[] = {
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
@@ -6082,6 +6096,13 @@ static const struct camss_resources sm8650_resources = {
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
@@ -6117,6 +6138,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
+	{ .compatible = "qcom,sm8750-camss", .data = &sm8750_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
 	{ }
 };
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 2c7a0218a82b..314bd794033b 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -95,6 +95,7 @@ enum camss_version {
 	CAMSS_845,
 	CAMSS_8550,
 	CAMSS_8650,
+	CAMSS_8750,
 	CAMSS_8775P,
 	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,

-- 
2.34.1


