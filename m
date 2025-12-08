Return-Path: <linux-arm-msm+bounces-84670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33163CAD2CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 13:40:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A12B305FA83
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 12:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 968112F28FB;
	Mon,  8 Dec 2025 12:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V4A/s84Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VjMQ1uhg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6558E2E7F1D
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 12:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765197604; cv=none; b=g8d3FUvj5OF9jzzmFnVZhMVoAi1ZUXjunxMxwT1gdKcva10r6orWsH8DjL4qUb1/M/VxcJ+gK/n/mmnHe+yv5FnkEU8momD9sOcg7p27NmF0jXvwRlq3eXFEKSwT5v13pZfz7UR72zyX52kSDLTkLga94o2hSnf+ov9yv+uVPT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765197604; c=relaxed/simple;
	bh=pnSQRgTAcT4d/8xmiBgrRJu6er1Xy3AhKk+QhB5IefA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iWEaB+dUSEs5LowoGx5HJ9FBHQg0TAvNWZETlwPHnVyWVeENHNPIzCGmCFkQH4JFoJ6DEMFegSMtGQibd6dr4CI4/hKFj0Oo9uG4EriRP8L203+8lpaf8CR8FvLspFP5YfOwPFIZC8HSHH5WtRvbEaWXeUS8FPPC4dW98ck2hVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V4A/s84Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VjMQ1uhg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8A3wOk008957
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 12:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iFkqrJMXLTrSpGrWLHnZ1o+c2GoxdqOgiKNQ4mPlB8M=; b=V4A/s84ZR3oboi87
	r6kOZAL7wusLzU054YSRbfV7P/TuEbEfTArncTdlxgzI9Sbrn+wMhA2HUfhP+Fai
	2dJh2U77w7kPx0YK4Vjai7F7Yd98nF75S2fgmCDx3nEs2nOZrMSMJB8Sy3/IUXX1
	aumCgoDzLnzisTCuYKXPzbW/sgPEUGFY6G3MwFWU2AYHRJtfvC7rwMsr2Pvn90nM
	hqHsoAhg1xIUYpbopH1hNOx2zPJszas0FTGuA92haMZYiDED52ySwvD/L9NcypIR
	ZyoT9Ies/mgEGeIHKqOwkTwxGcKYXwwy/q6xmnKPlt22vt1NfikfUh1GDIjcPmK3
	ysnJlg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awvke0e40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 12:40:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-bc240cdb249so4331664a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 04:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765197600; x=1765802400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iFkqrJMXLTrSpGrWLHnZ1o+c2GoxdqOgiKNQ4mPlB8M=;
        b=VjMQ1uhgSXX6SPZYpJgo8gQs4dBiNF0mAgD5r55AFjWRJzTowhGmKZnXR5ctdNYK9z
         xYBU0tgxdknn5byhX/vDu+xGTejwl4X1Zgy9Sl4DhjUlAH4bYfs8SVz4Dy3RVHVx+bY0
         JwIrO6Sax+r8ED5Gyc6NhS7iAz3iP3LQl0wtpOFhqwNi4Obi3t4mlcOFCW9rMVfqjbjw
         XUt9GuIPFw+Vz4naku9D9i5MfuovjbZC/HbSHqGl0rq2aAzDHt3SgOtvEdItNiXx6uOq
         RfrQ30cB8sd15J2m+cx7sY7otiI95mMdi1S3ycgXnYF5yx0EwFgZBa4qlXOX/11mlUIt
         cB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765197600; x=1765802400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iFkqrJMXLTrSpGrWLHnZ1o+c2GoxdqOgiKNQ4mPlB8M=;
        b=ancmXfiBPExt1MtFxOHAp92wpR5wwPsFI0GwVF12L8L4fdI0Vjmf6rTYrc4nqtYJov
         vpzC/oKB036UeELhFWtfLOYANDAhWgwFGhnfOWCnY552zHGa7bUGtgA4WQbiKCmXgd+l
         E8kyRXo1diH7wiCKdoxHiaE2wnbXXFs2qsYDkZxEuX9NEPjYefCxkVrV89pOWJsuryuZ
         DGRVAFmOiKgm+oFZJM4+JtGzxPTqL1b4SQspw0H3JP4YrHzagBTfdHJX7VUgoi5wr+k9
         y4W2mElW8SebD9p+wjR6wfeC1zDeYSK7FNiqvjLn8AOMrtVtDLYWtnlZvgRc8qoBz+oq
         mpow==
X-Gm-Message-State: AOJu0YyEkJXkBrUZaGd5mGSBT/x4YmrR625vo7WWk4m+hNxrYpiFOJUR
	QZDX4rLPMlwqF+36Ug6sYYPUB1VE17Twh6TIMFgfEMi4oMarw8oSpmk0sn0R9P84X8wWieVAh6j
	qZClQwdeabpfe3z8WwzzIWC1P1f2tKs7GrF8nutP7yFcG77AYzjx5yHvUYX91huvNOYND
X-Gm-Gg: ASbGncuDcHNOQh4cQVN34oAyUgOSCDrbVPQKrtkDsIpneZLQaUfQv3aY11JKnlu49bY
	jGp2FlfjX2NCeKCpnMY3hsYZp0BVg88WksXXCGi8kB6Rg7BaEkJWOHKhIBo1Uy3WKOvZgZCtcp0
	Igrl3S04OuIYicOfSn00bd12xXGo1vyysplLa0dxGuU5R1TOFfyYMlnoAVhzHbFpCMsVN34M4c/
	rMr6EGtk/VQsjArt5b9ixGE4h1eJxmSO5G/LcqvNaWiYmR9R4T4cV0jypaPFRlZjKGYSYYpH4oH
	7QlusVMsyjb6fryyk4hLEEhtrXbSBgR2rVldcJp6JqlRraQCA8GlioGMN7j/wgOzOodINDq1g9E
	oi0RAK5pb4yoYRLJLo4D8UnTCOL4Oml1Auf53bHDEY3TiQdA+1h2cKtf8+YTzfN9c
X-Received: by 2002:a05:7301:102:b0:2a9:57de:470 with SMTP id 5a478bee46e88-2abc7201563mr4388779eec.21.1765197600295;
        Mon, 08 Dec 2025 04:40:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvmNrQXX6VRSMaeX1On+C79jMjmemS4vskTQBrH59goO6z5OaZonuQa2ECuqgTDql7IRvaag==
X-Received: by 2002:a05:7301:102:b0:2a9:57de:470 with SMTP id 5a478bee46e88-2abc7201563mr4388770eec.21.1765197599751;
        Mon, 08 Dec 2025 04:39:59 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba87aa5fcsm34902515eec.3.2025.12.08.04.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 04:39:59 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 08 Dec 2025 04:39:48 -0800
Subject: [PATCH v9 2/5] media: qcom: camss: Add Kaanapali compatible camss
 driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-add-support-for-camss-on-kaanapali-v9-2-3fcd31258415@oss.qualcomm.com>
References: <20251208-add-support-for-camss-on-kaanapali-v9-0-3fcd31258415@oss.qualcomm.com>
In-Reply-To: <20251208-add-support-for-camss-on-kaanapali-v9-0-3fcd31258415@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: dtfvRagtpMpdzVyulemjyc7bK-PyCmgG
X-Proofpoint-ORIG-GUID: dtfvRagtpMpdzVyulemjyc7bK-PyCmgG
X-Authority-Analysis: v=2.4 cv=UvBu9uwB c=1 sm=1 tr=0 ts=6936c721 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDEwNiBTYWx0ZWRfX+jiBjrB9GdWz
 GDrd4cl5E7fusQt0LgYxo8iA0qrphlNuqGYAu2IWWW9Nq+i6n2Sr+GdM4fqQX3CyW4f9JoCNKbA
 cui5p1g18m7u8EKnR0zMQkDmCbXddE6jD9Vs16CEyHkKjV595X57eMtfONqBSZvHKl5OoIyH/kT
 iv8+rVQ0SElvhmYG7YE0Sq9ARNg2cjzCo7EteF5z7kx2jI8zEin7vkD+O6pJUk5c+Wg2XoHjuN8
 Y3tUxXIzAdxkdbZfyyqfq0X9ihD6nO98kDm6TLvxK/XT5JrXAufGhVIPJNpg7HpzCUR7njubcIA
 NFJq63Q9VLNdworrkihiul+5RRt/uCvR9j2HLJnc7nrwuDQ3kEIFpmxDc6DcFVWH65BPfJOxLHa
 GbqnPA/Hd838V4o2+OcB6GfnlSb1fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080106

Add support for Kaanapali in the camss driver. Add high level resource
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
index 2fbcd0e343aa..658d9c9183d4 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -34,6 +34,20 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct resources_icc icc_res_kaanapali[] = {
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
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
 	{
@@ -4291,6 +4305,13 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -4467,6 +4488,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 901f84efaf7d..876cd2a64cbe 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -90,6 +90,7 @@ enum camss_version {
 	CAMSS_845,
 	CAMSS_8550,
 	CAMSS_8775P,
+	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };
 

-- 
2.34.1


