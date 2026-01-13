Return-Path: <linux-arm-msm+bounces-88851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB02D1A7D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 18:01:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DCA7C308F586
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 16:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D694639341E;
	Tue, 13 Jan 2026 16:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GRm+XX8N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KfpPnPpH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B51934EEE9
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323469; cv=none; b=KE3a9aqWfYdNmEtOatsZ/LTE9ltwHJmtCXeO8kokuuUyoo0fBnpHbgfX6FemJX72RX2Tc5DOpIj5G2kOJ+R2VHTMhHDNma7RJc4cWH96yHtLRmP0vuYDPNbYDYxKnaX9X1YVTjqKqLvIW6tjK3lClN6JNIUPsaIaqMmS6nVu6V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323469; c=relaxed/simple;
	bh=YJ8s7rg/pBWknDYmw6HVFvWkyXVJR/oPr1GbWJ+pCG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=blHhrAJUNvX95WP0R+2UDl5zZ56freXJghv5mjPCYN6J8BTRu2cbOAhDC31M03s/jhIeyUwmJkH+dz4tAv6UBqrJXpdR/7TN0HtRotfy1xvQl3S4cEl0MndX//qrsYFbH8nI/LsmsODqIaG0e5nDBFy2fw1rF6CYc0uQBknBwRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GRm+XX8N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KfpPnPpH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DFjsn43727167
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zoh4+RntaZANZMlo0wGX4a/MmqOhckBF1Mck4hRE40U=; b=GRm+XX8NnW6VT/PC
	MTrlKH/VukDNzJkRFkNP8rxJlNAB656Yk04f30c1VUuXbLrcoUGYpFjU/4P7upuA
	Px0U0ZfUWXCD73S0hRvSqAUJMuGyLxDQjOh4O8GjieEafsCO+qjY6aMVxTRwSV5B
	kC14w6cHJgsl94PPTruQNl1WSBKAYLHfQ4SoCMIcfXRRpNL+wDKLQPdoS9rDuOyn
	rTowQr+xe2Rf/eiU25eXzhZfro3p8v9egJ11RMjP3PeRgZaf9TUKS/Vof5tO06RA
	+S8busvJi5ybrDjvOa4z2kTxZCCp1RqfFftm+dY3cR/0ua1z64+Oo9iNH2o0DIvo
	SjCEhA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnjnu1ph1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:57:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8ba026720eeso656267085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768323461; x=1768928261; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zoh4+RntaZANZMlo0wGX4a/MmqOhckBF1Mck4hRE40U=;
        b=KfpPnPpHXxdToaaVcgvKgMRruXhRwBgtca2TucAlLeAzlQCHwBApx1wC+wMN6lfBbS
         NF84KV7vXo8LWATxV7bIJj9Ij4UzhVjmOPo6gPFOxmL/LO8L6YLG3sEco9JLZ2Uxh3lS
         LBS0bKI59mo5QXwgWEUcB1+7ikhYVsOGRuRnahPdcPSK+zBP0W6xftcR4YtjHeg6QfK4
         xo5ZmshB2jEBk8AEXXFPIhJiWI2vj16JsQOWpTGj6eT3NxyBYevGP+TaXGm+5Y8xGTGM
         HC2fIQd1hrQdvmAhOCQXa7qU/WoD3+SPM0lVLID4tUCiP+wNg2nY4P09DRWhfez4vfBN
         BKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768323461; x=1768928261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zoh4+RntaZANZMlo0wGX4a/MmqOhckBF1Mck4hRE40U=;
        b=GbHwhNCvnC7IwlV8A6hb1Q4LKh9zEAqk5ygQgQaXVBh5temY0+gO/Bq3qpYgg2t6kw
         i+FVQ2KBReCi+jeQWwqs4rBH+Helwhm7cxej4kn+a9fHur5nzpMYYtzdR1XRYgvlBBU5
         E9536es5ecblV4PR3X4HPAZN0QI1aZ7CFEtvz+ffm93rQUQ+MIjYTfc88uEBVUTV6+io
         spTtk+ioCqsOefk+6Aa0PkUTgcrUFVwNnfFtupAUTrF1ivrCwtoh/bRRJGLRYnfLzczM
         ALeXKFw0+ccCRfxl52IJ8vaEri8XRn/uPJe3ddb6ozezdBWZHBo1HHqsmsi0NYIlBX8V
         Fmyw==
X-Forwarded-Encrypted: i=1; AJvYcCXGMdCIxo56HhNTYyMx0cw/LfgcnxOPGejKAr2phvMqaQU9ZGJjV4oQBG8gYPd5/HUG5Sijw65FxcS9N0Xf@vger.kernel.org
X-Gm-Message-State: AOJu0YwkkUhi7McyPb+OaEdSsFnEr3VVUqtEDDU+YaOAMNKkE/IUcfs9
	TRgnnE3xIpxVx/Kyg8hPh9tAAZR9NZLz3m0r2VNfGeKm4cJs4c8tcbz2/SNVcU/NYRCeMBMk6EY
	2Cb1th4R9mcP0/M7SElWQVx2+D8VqOuqsZnWBUGox4H4MdSL/ce5rNf/UzRjOkO6T4Jky
X-Gm-Gg: AY/fxX4rKyhDKziiV93nQ7nErj/q86VR9Vk1nmGK1SWS+tBqRLqpDmOiJxAwDZTRCd5
	/LlN2j9T/sp9A6LE97vVFVLuOMruxGyC9W3AFPUfWbWs5T0anV15nWgEZJ1VkJ64dWH+sscKzLq
	cbYvvSq+J2xz0Z9N6N8x1AHWCz6Y/pHgj1BaWRlLjfJZ8FZwJdq9O9aNjtQoKLCVEV0tvyPNads
	NePuupVvfhhB0L/J3zBZR61ZQM6tfGeW9pgChHJC4IHyaXq6IjA40Y7cOFveM0Mpg0+58TG32bg
	UR9nzqNqQwU9QzV9AA0whU0TRw8UM0mtEJuAP8rpO87wZUDjRqY9Gc0Yw/YIYQDBXhiQUzGvo38
	ugtGcW7UKrinLu7hjPbBX8Y5TakW3ta8P2g+3vzOJRZhbfK+gxKcHjQRKAZE5/heu941hFPeMGh
	kOwfBbY8zPg9vI9Xc7vtQpCkY=
X-Received: by 2002:a05:620a:bd3:b0:8a2:6690:2417 with SMTP id af79cd13be357-8c38940bc02mr3196929185a.67.1768323460598;
        Tue, 13 Jan 2026 08:57:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7GjNkqy3WqZzA/o83vsr0LsFzAsfde4eD5c3ZdYChDFJVIr0SZbRBaTUWOIPjQYDWaKV2Ww==
X-Received: by 2002:a05:620a:bd3:b0:8a2:6690:2417 with SMTP id af79cd13be357-8c38940bc02mr3196922585a.67.1768323459955;
        Tue, 13 Jan 2026 08:57:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:57:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:23 +0200
Subject: [PATCH v2 08/11] media: iris: don't specify max_channels in the
 source code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-8-4346a6ef07a9@oss.qualcomm.com>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2276;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=YJ8s7rg/pBWknDYmw6HVFvWkyXVJR/oPr1GbWJ+pCG0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnlzjwtS96w3QMPnMqqSb4hwiMO6ihseVVRgG
 gz5MShkrOWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5cwAKCRCLPIo+Aiko
 1Rt0B/4+AcoK1NyIJhrsMtFwfpPsWlMI0gIUHpGK1s3Wj5+53t5W0iNpXpmv+eUJS8cGOUUK4SC
 rhiCXbQ8k4R6/RbFWWm2m2KDc1FjYd3UEetJYSkqSh/+qmChTmHTPmBsG3sx/myNr8RNdlWwR8C
 ZMJmL/yfDMYzzMr1D7mwdaRWM9qYMoOF/R27WV+abv6wT9O4oPqNAnMqRZXabVXQijQyFtGpfP3
 NhJ98Vax+ZRtnaRALQHXCXVSJRzxZWbFQFrjcXa3N8DLW276AlmxrIBe+K9x8T95Lks5xRHLT4L
 vUUQu5tUBlGBYXsgbmJksrOM+3waBqAW0W7MuAdK8MIPJ7GX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: ECGkD7jxfIL-8N8amJ6zKDZupJTsdMBK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX8g7HnVOMR457
 6kw0RZ65R3YI8dhVpH8jRSq2t/zIdXHqYB0WVy0RMIXWs45T8jli1/dbzJGwtJQGUkmMYzy73O+
 xHpD7TxevJDdzT1pQ+MHGsVHPK6qUYklPPFeqxRZXZ5Aa2U8sUfcfXwueaNO0HSq+g3Lhi0uGpy
 2YA03Dsl8Zp96WiJ+NyXOVSfbYOGNiZEA89hvhHNPDalULC4uT1yvzve1c+0LaNGmjGmWiTDfKQ
 sWYEAZoujc6rJ8iABwbpUWK6o/AcUcc3JF19j+WXeyLsrUqaaSrQZ+WLlN+I9DptDNSb8V+J5PQ
 PDDrQSQ0MoUgosN83dlFOT9GRrRzL4azCwgRoFhizqf0jwyqe/b8MCrhpACfG7KGoAH0tq6F83J
 RQS+c54SlSu+4qSNoL3vrT++mK9i2Lzc3VlXvdrMO6EWklHwFz3AHOCNwOzLlKKnJbCznELoDQb
 arDVjIcDAQ6/SnMY8KA==
X-Authority-Analysis: v=2.4 cv=RMu+3oi+ c=1 sm=1 tr=0 ts=69667985 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=rTy9geyXzX0TkIcb0cAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ECGkD7jxfIL-8N8amJ6zKDZupJTsdMBK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130140

The UBWC max_channels spreading is specified in the Iris driver, but it
also can be calculated from the platform UBWC config. Use the platform
UBWC configuration instead of specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 9945c939cd29..91dbea4c6664 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -139,7 +139,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->max_channels;
+	payload = ubwc->macrotile_mode ? 8 : 4;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAX_CHANNELS,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index f99fcbb8fced..4abaf4615cea 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -72,7 +72,6 @@ struct tz_cp_config {
 };
 
 struct ubwc_config_data {
-	u32	max_channels;
 };
 
 struct platform_inst_caps {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index c967db452dec..e78cda7e307d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -632,7 +632,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 };
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
-	.max_channels = 8,
 };
 
 static struct tz_cp_config tz_cp_config_sm8550 = {

-- 
2.47.3


