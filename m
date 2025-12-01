Return-Path: <linux-arm-msm+bounces-83923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A0064C95D74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 07:32:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EA284343C65
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 06:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB0C286D7D;
	Mon,  1 Dec 2025 06:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YbeK0RPr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QtAf/IJI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AF527AC57
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 06:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764570649; cv=none; b=RdhUgf7e1ONRbnWLRvq8bewEV7uanELtCptzUgu7SBoxz5KqbazaCLCMDBVgMbW35uh24AZY0a4sw4zjsjrCi0AD6Lks5V9LXzmDW+VW6C6dCpM4tAweHnQyzTbicIwcJDj352hSsl/E+QcPHGa+VFYUumzwh3S8bBjhz48B0/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764570649; c=relaxed/simple;
	bh=pnSQRgTAcT4d/8xmiBgrRJu6er1Xy3AhKk+QhB5IefA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s0NC2L9K2e3HSjDyOy1BXYJeFwC/MVwXTZmwB55GwvATvh7CTusficab+ohGowr4+cXZqUR0Lig5vQGu53XJxysb4OaFnsZMgc9FvM51sep4LFbzWsTr/pyLheNDWYPJJzUy7S1lOFSKpWF1zNgX5S0XJymMhQ8FC6V3EOQn8i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YbeK0RPr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QtAf/IJI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AUMNeHw2563012
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 06:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iFkqrJMXLTrSpGrWLHnZ1o+c2GoxdqOgiKNQ4mPlB8M=; b=YbeK0RPrG8NLi6L7
	fF7Rr/PRlaYGWfZZM/+89EJ1Uj7mbsDQwsd4eRgnfdY+b8UGcvfin8YuCuAPXZAL
	+NCY0yGZMq7AQmngzu6uDlmbkVobWeXQrhy3F4Y4uA0mM7pIOgbkVDLD7mbRpyQI
	ddjP6mcnosx4MKLZ1OV4AltzhFm/1IcBXUtOSGxMkxt1s/iiCMc6XLLvTQl0CEN6
	NFuXjMdKZborZntN1UvYjVxKTnmUVMblnf5Fycg+JgH9+yHwZ1a2Bfxp3wnXaPZ4
	FdWZt76u60N7VfaXSXgnh1nqdej4YPrIKThH9I5mw+Z9safTYHAo3j3GnAdLGjY8
	eMOHzg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4arwnvrw56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 06:30:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b9ceccbd7e8so6822878a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 22:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764570646; x=1765175446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iFkqrJMXLTrSpGrWLHnZ1o+c2GoxdqOgiKNQ4mPlB8M=;
        b=QtAf/IJIBAU+4+2qinQvOiwhHy5IjF8YCvg11GU04QAxAM/NESQCZhT21ua4dSzsCS
         vnU6I87ZB1kqA+pnSWQbhNBBCA2PRKFAuUC6MIIkresDm6jmC6S+KYCTK0P3yqb1tNx1
         CTDFS3onuWcp4JKAL2DSQDwPoBS/sQ+KsHPftL7deoYsQdqZPxfPb9VmcEdjUMG9v2QW
         y3laZn3EqozIo5RTAJ9B6dklzXtbvR6kJCZf+gT4fYwF4BKyPwzD++qvaVdZS/9cOQKH
         4e0Vabzxp3NSopD/EYEfhtuCmBLl46xaxh68DHOHFVXlO5bsEdY+zUwWSOPB7HSOfMuN
         FgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764570646; x=1765175446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iFkqrJMXLTrSpGrWLHnZ1o+c2GoxdqOgiKNQ4mPlB8M=;
        b=RWTE1PT6DT/FDukdmxc9p0PgJN/wgOq1Ld+xbAEezVSG1UHIEYH54GgqA8oWFhic1Y
         U2i3yZ2apoOPh2FqaGuGNWthB3xma88ZPKF41KFEkk458Z3FvT1ptPzDECBRLNUJipFA
         JZ2X2EqOD6PgoRCIs/fH1y7qkf+FXGyMeTU104svtpslqbbc1KMt9lVXXh7OnsVXk0ok
         UMri0f4dLhzGFIhcnWsbpYu3gFIs1BwGgD2TnyJC4jDbosY8L29KBZZgTxj/BNYiOgJb
         59rYR1pLQnJi6QOxqKrByZLJP8EUPA+EXFXZbj+g0e/B1KsB8peg2emi4XtdwP58lqPF
         /nAQ==
X-Gm-Message-State: AOJu0YyRY4gt63vIamlTmcauQWHUWNQUWnMO2Dumsv9OwfED5CA/xV7A
	xtN8L1K3otOOa4El0+tud5zie5+lTdbLMUUE0ufTvicaCuu5E/PphUy+Yfxa/8Y/Olu8NMGJzty
	61JcPNX5q5uMbJPh7U3vqV7GKbPRr3rDEM8qliI5e31xsVBs5Fx0+UIXhW3hd6A0dDYxI
X-Gm-Gg: ASbGnctJmYhLbwjrfQULmADb5pUwVlRbYcCzNxoQWv2y1Z5ygrxP1j6vLZYQvilBJEs
	Gi6NZUEUAONJrC15gDIrBdKtd1sZ/WUhYKlf3nA8U11R7vMba2GBiHMbOBTb7xOXef/JVOQ0wjE
	1JDtkwv54f44AZygvyUujXieVNZ++y3YaLZSNuInUfSZmHASfAsMGFjWzlrpqUcCV0ONL6d48H6
	Sx4Ottb5w3/+1w+XC2l9ixAlwRWOUjZwsYOlIP6rfZ+bOadXPo0qTxgt/Bfjf3m3em3N3rqMsmg
	OZjI9G9wMCzp4WimKG1aqRjLzVmCbyEDCeqbp3Wn0yV5fTjrUda366STByLqr2jNr19+rHwPPUV
	7BXrWhIWcdnaEarWg7aF9hgB5Eu7QOJ+Qwgq2Kz5d3K9ul0s0whHw9b1z6BndmklR
X-Received: by 2002:a05:7301:b0d:b0:2a4:4bb4:4712 with SMTP id 5a478bee46e88-2a7192e5b06mr19529460eec.39.1764570646178;
        Sun, 30 Nov 2025 22:30:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEx1fUJZGXaIarHvZTR3R5yIcNzvCtthUbDp8Di8f/VfT6HfotkU4+aCfr43rruVLASXRK+pw==
X-Received: by 2002:a05:7301:b0d:b0:2a4:4bb4:4712 with SMTP id 5a478bee46e88-2a7192e5b06mr19529424eec.39.1764570645588;
        Sun, 30 Nov 2025 22:30:45 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a96560986csm62713689eec.2.2025.11.30.22.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 22:30:45 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sun, 30 Nov 2025 22:30:41 -0800
Subject: [PATCH v8 2/5] media: qcom: camss: Add Kaanapali compatible camss
 driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251130-add-support-for-camss-on-kaanapali-v8-2-143a8265e6e8@oss.qualcomm.com>
References: <20251130-add-support-for-camss-on-kaanapali-v8-0-143a8265e6e8@oss.qualcomm.com>
In-Reply-To: <20251130-add-support-for-camss-on-kaanapali-v8-0-143a8265e6e8@oss.qualcomm.com>
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
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: fVq7wdfvfdHkuNobrsmD0ZLMLB3Dtv7e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA1MSBTYWx0ZWRfX21u8aX1/qhVQ
 VGX4uTrM7RwNT6BD5VdHjWdTZ0JgHIfnC0lXejIFGsy2tbeIHtA18vu5/BREXRe2wrv4oygOhIF
 4iQsWplVVOFxSRrmQFlgq9LSYd0N/r2AGHsmYiB2xE39zBQlWKVLrvxBzccM9o9ooVTKQGCq6bG
 Z6Y+XRUh9trWEkH65ZOLqNRJVsFOWnZSYxTdfk/OcUUX3OJ0ClaR/oeM9Bih96uRnAhln7T7u03
 AWIcWl+nbDyPQwaGMQ6rSiwKs+CRhYue2ktih2btidj5Qkn+iUq52I+diZZOG4opx9d9flyjePr
 h42cmA9RjAa94WCgH5KfwDljZy0Ggwngil5LD1usC949LOwtWQvaV9lKFOvV5DksBFyEsZceq5D
 2D7dyJ3/NpdIxd9jUleZkHDk9GYW5A==
X-Authority-Analysis: v=2.4 cv=Urxu9uwB c=1 sm=1 tr=0 ts=692d3616 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: fVq7wdfvfdHkuNobrsmD0ZLMLB3Dtv7e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010051

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


