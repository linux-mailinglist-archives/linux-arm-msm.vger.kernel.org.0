Return-Path: <linux-arm-msm+bounces-92957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNtECzkik2kX1wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 14:57:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 538B01444A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 14:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 079583006807
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 13:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DDF330F7FA;
	Mon, 16 Feb 2026 13:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B9woD6cE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RA0F5tHW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA891313546
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 13:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771249412; cv=none; b=tDiHZ3ZAB3rP2hOsQa1/1cIRKRIYX7LKGT/goKboj9lKJ+lo+k56BrSEl7os9dTFO21Gx/rK119or2NGehbp4Tq8XJUp6i94/Uo/v1hISJia41VXI+8jgtf/oXA/W3tNIG6McTIITJHGYrvPPfrkw9j+29dAu73Nz56bIve4Pd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771249412; c=relaxed/simple;
	bh=/8RhR7OV6oXxghCBO+QdQd4Etv2A/gx8ZJlBU0UKrQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D82V0kkIe8zlzzpuBp2eRYB2MlJ2DZjYyGDUeOxlhngpU5WzblmspgsbOnYfxuij3VZKJgfwYX44JWJLGNG7+Shzc68nmn+ogtQy0Mhjc+MAOyij6ZBIp4CGg9Xs2TY2DWvqZ9Z4nPqSvYz5ch0VBzF9QtkTswhQWlF6obl+syE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B9woD6cE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RA0F5tHW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GCnwmQ2178782
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 13:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6rdTp+xDJxOCtPl8bGoK3viPV3DndufBZd+L3532s2I=; b=B9woD6cEAZ2KTJeL
	e9jY47a6/MY+R1UwDTNonB6BSOlnssvO6Gd6ZJZ90Me4alAeH8ixHgvFeOXCntdY
	cDY/GDKIHElMQPpcMSf1bcBKHEre0KsXzF6gkqAvltFKSnxOSMhBJmfRghZZQo+h
	KxVuWwVX5MhYfQeo01oXHioNQMkf5oJf0xcnNQaSwso9pR65tZoV95/Wppv0VQFS
	SCv9BgOChiwJF8fr9DB4e6UXmY/mIbIVNZ7kwu7w970keKsSQll3/927849wyPF1
	7rQwnpZfaCGgIJYId5nySoPCkmZiIxF5vFKz6nVCrywYODGDwGhSjVKqqcuGKEzp
	lV7hfQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbnv9hrm4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 13:43:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70e610242so1974732285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 05:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771249409; x=1771854209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6rdTp+xDJxOCtPl8bGoK3viPV3DndufBZd+L3532s2I=;
        b=RA0F5tHW5fa5SmBYdSNhauUZLAhsnWnHflPxBmpU+P6feoQ6OaOmLZxyq5TI4iMydf
         Cg8JrFZ98LFS91bmnFq+HB52BwPX5/4T4pwdljjHeekoKGe2U3uyUki36zZKdtucvJMb
         YpK5kxW+ZQFU0Acd5B2KRLDaZDRlqgcSoURLqrUh1XFrxE6ugnqFuE6WHk1ywvmAi4Dx
         DLhl31TbY8Qf41JYg2s/MvWcBnbazptsbAj1AJ9gJ6Ou4k7NVWf487gfZmaNZfnDQK9P
         QT4b7iHdibnzchr6HfuHUwCwaAr9IyUgb10ZGMNe7xHzgrA05Fjp6vY63YUd1BP8+MZY
         VujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771249409; x=1771854209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6rdTp+xDJxOCtPl8bGoK3viPV3DndufBZd+L3532s2I=;
        b=wzYc4m5gfMM4cOWuC1RPTequRbUswrJPqWH4wB8VzdntILpcwcXnjVndPouT2noB/B
         vyQmX614LGzReap+cglPFde4sXoeNqPoFFHivwVNv10c2BpRbLWWqz1UDnYzW7frVRek
         oIxFLNzkOqvSvtf5pTWsVA+5ZSNBf2Y/E+LOCiuSOX+2wkK0U5hZqidnZnVlw6iDexR3
         rBWIxxivxxlbsR6L4og6+Lh/PQTnbyc7gho2By63NnPqApjp2E4xPa7wXDwChhkmt08M
         qmG51T8FB6yWq7WlI8dvwdJbkQGul5GaTJMs36hnLINrMp9Yv7iysBubMinhAdZlzGn6
         xM+g==
X-Gm-Message-State: AOJu0YxzeqXP7EEGcmGXJhgQTE2ghMWjrGakgHlnIwe3Bar8r8Fd08rZ
	5TPPZ/3IZTcY3sAeaMRULFuPZeweSGtSC3eVbRFxJ2f/0z8TbWSTD8Krba7uVWplvMxQITaGfos
	30eFruN1cgJajDVY8f9VAE712y3hYy8I+1eW1HztY4nP9nqNYm8nuNEl+wK7D9mk5ffOD
X-Gm-Gg: AZuq6aIMYdAPwzY+IkDWyr8+LVu6ZOI/OTtL/rkPyQRuNc1cScLtr0lCjpU5y+YEkMn
	CHEAqcGViaS78rCyK+CJrAW7HULsm6cm1qCH8tc4gEShUAJbI4zoXuUAlEuNa4Whqmbaoo/Ag/m
	nhnh+CvxGwrJOg7gJCQsNERHTpL0IQhi+jp8SFZJWZLuHFgXd0a/CxT1frhXimiGNXiDPaxy2FK
	rI7cFXwDpOHF9IhYYFrxNXfGiP4I8ee3OcaaIpR7SWrQSWXkgqQzu7ix0DD6dy4N8PVFlfIrKc+
	X5xPbrEjGQeVPBVk11fLbqxxPPClQNNKgc4jcBtqTdqSYDN/UCpWQmakFfSKkOchFJZeZrhXS4m
	iKwAEmtEISYhj5alUapZdV5H4tA2RQg==
X-Received: by 2002:a05:620a:454b:b0:8ca:41af:32c5 with SMTP id af79cd13be357-8cb42489e01mr1314139985a.69.1771249409136;
        Mon, 16 Feb 2026 05:43:29 -0800 (PST)
X-Received: by 2002:a05:620a:454b:b0:8ca:41af:32c5 with SMTP id af79cd13be357-8cb42489e01mr1314135985a.69.1771249408488;
        Mon, 16 Feb 2026 05:43:28 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6c1bfsm28883025f8f.13.2026.02.16.05.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 05:43:27 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 15:43:08 +0200
Subject: [PATCH v3 6/6] clk: qcom: Add TCSR clock driver for Eliza
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-eliza-clocks-v3-6-8afc5a7e3a98@oss.qualcomm.com>
References: <20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com>
In-Reply-To: <20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=6716;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=/8RhR7OV6oXxghCBO+QdQd4Etv2A/gx8ZJlBU0UKrQ4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpkx7yIH6wAkf7Ly9xwz7r/vJgAhIf+2n0m8hzm
 3rs52+f7jaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZMe8gAKCRAbX0TJAJUV
 Vh3MEACLYx/HLYjVo35oIft9THVNDKL50gkAsjufhgrKovPvstX93o9T3l04FSwTrKM+fvUYvls
 nsl1sB/OxuD45cbB3rt/0KsBLAPfcERTLRpKTgSLEDF7BYJgAfj/ijpxkg4BzFnbrZURRAZHOkY
 7YsD4ZLQaDHBkEPNTB6CcEjVfRNW+aGEZQlUH350AD+pTWiZ0BNjuEcT+GWgkrsOHTswdSaH+j+
 D5xi2/+UvYZ7BG2aOXGkshZyUZ/90VHo09AKVDFSeUpnEsMSl9qqWw2thjHvj2BMvNfwXJlo6dv
 WbsaCU9+BWxcbm98sotQYqXpNXMM2qh4TfXBJwFmGA26HaD9bwiKXhww1UGNbdGiQbpy0M5Pi4u
 cF7WqAD99te62WGNbUZURSMDHDvxDHPEPLGTUH8dagXNxIDlkljFohv74hiEhI0Bj8f5UhLB7I2
 bCea2Z3WrLhs4n1XhqeGNTfM5/LMBGXFODrpYFiHzMN3DTIbG2JTyKTreTGTutCcpDG66CkqVN/
 kakxR8haFQHiPTZPExuHG/eXYuHpEP8z7rO2nZmXRnh8Gq/C7ZnBGj7wAN47PiRKozRj+GpB5jO
 BtNkSAUC23SVUkIe8gffC3THWi8z8kzAcCiBWCT+UTHFnlqlTGUy9nuT0wA822YtxxBdLrYOBnu
 ozQzNkUrVe07QfQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: 0OIh5jmAqJ3QijGGLDxwez-3eQMWo9dx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDExNiBTYWx0ZWRfX8FlCX19FCSXg
 WTMXhzApRR8K0VQjOuZ67Xm7sBSTsoYvtohieGzUZp2qbmrX17HMb4xi6YQ6y2tcOFE7RJKvYNz
 owXO51DAUDlKc9t3qOUadGfUmTTvZHLBctSgLVAyFnAh/6mgHqEGoM/vuHZGYTH6/q9/MK2dNR1
 LDQ3teZ7VD3zG/rzvKbdgBBgCitq+WFOFiNWoKzADqGucMEvbw2fgb5V4dHOdNRsbCQQqDRZXh8
 sai83zzHwfkK87ng/FHb3+gOySm9XHw1qAHjitr6Ec7dL9vC2NDOdGpQc/aYHfrFbsj7tGwmMSr
 nnez4YGOuyzmOK+G3LWwvXzGJNw5SMLYfO2mvkm1MwQzjAQIoS00XLqHBMkWoKg7pLMQYpqoiQv
 5M2ZgcS7tzS2DFvRTuMVNva+jREjTDavGR3lHZhc/uOA3uUJx2wQpCuCIvUZq/iwWrH/lRrukRg
 ACMfq6ddQJO5AJkw4Qg==
X-Authority-Analysis: v=2.4 cv=b7K/I9Gx c=1 sm=1 tr=0 ts=69931f01 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=xMpycIIAKlYumkEOWPcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 0OIh5jmAqJ3QijGGLDxwez-3eQMWo9dx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160116
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92957-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 538B01444A6
X-Rspamd-Action: no action

Add the TCSR clock controller that provides the refclks on Eliza
platform for PCIe, USB and UFS subsystems.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig        |   8 ++
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/tcsrcc-eliza.c | 180 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 189 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index edac919d3aa2..dce21e33e366 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -28,6 +28,14 @@ config CLK_ELIZA_GCC
 	  Say Y if you want to use peripheral devices such as UART, SPI,
 	  I2C, USB, UFS, SDCC, etc.
 
+config CLK_ELIZA_TCSRCC
+	tristate "Eliza TCSR Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select QCOM_GDSC
+	help
+	  Support for the TCSR clock controller on Eliza devices.
+	  Say Y if you want to use peripheral devices such as USB/PCIe/UFS.
+
 config CLK_GLYMUR_DISPCC
 	tristate "GLYMUR Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 6ec63a5d4363..d2bbaaada826 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_APQ_GCC_8084) += gcc-apq8084.o
 obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
 obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
 obj-$(CONFIG_CLK_ELIZA_GCC) += gcc-eliza.o
+obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
 obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
diff --git a/drivers/clk/qcom/tcsrcc-eliza.c b/drivers/clk/qcom/tcsrcc-eliza.c
new file mode 100644
index 000000000000..ef9b6393f57e
--- /dev/null
+++ b/drivers/clk/qcom/tcsrcc-eliza.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,eliza-tcsr.h>
+
+#include "clk-branch.h"
+#include "clk-regmap.h"
+#include "common.h"
+
+enum {
+	DT_BI_TCXO_PAD,
+};
+
+static struct clk_branch tcsr_hdmi_clkref_en = {
+	.halt_reg = 0x14,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x14,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_hdmi_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_pcie_0_clkref_en = {
+	.halt_reg = 0x0,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_pcie_0_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_pcie_1_clkref_en = {
+	.halt_reg = 0x1c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_pcie_1_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_ufs_clkref_en = {
+	.halt_reg = 0x8,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_ufs_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb2_clkref_en = {
+	.halt_reg = 0x4,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb2_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb3_clkref_en = {
+	.halt_reg = 0x10,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x10,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb3_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *tcsr_cc_eliza_clocks[] = {
+	[TCSR_HDMI_CLKREF_EN] = &tcsr_hdmi_clkref_en.clkr,
+	[TCSR_PCIE_0_CLKREF_EN] = &tcsr_pcie_0_clkref_en.clkr,
+	[TCSR_PCIE_1_CLKREF_EN] = &tcsr_pcie_1_clkref_en.clkr,
+	[TCSR_UFS_CLKREF_EN] = &tcsr_ufs_clkref_en.clkr,
+	[TCSR_USB2_CLKREF_EN] = &tcsr_usb2_clkref_en.clkr,
+	[TCSR_USB3_CLKREF_EN] = &tcsr_usb3_clkref_en.clkr,
+};
+
+static const struct regmap_config tcsr_cc_eliza_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1c,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc tcsr_cc_eliza_desc = {
+	.config = &tcsr_cc_eliza_regmap_config,
+	.clks = tcsr_cc_eliza_clocks,
+	.num_clks = ARRAY_SIZE(tcsr_cc_eliza_clocks),
+};
+
+static const struct of_device_id tcsr_cc_eliza_match_table[] = {
+	{ .compatible = "qcom,eliza-tcsr" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tcsr_cc_eliza_match_table);
+
+static int tcsr_cc_eliza_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &tcsr_cc_eliza_desc);
+}
+
+static struct platform_driver tcsr_cc_eliza_driver = {
+	.probe = tcsr_cc_eliza_probe,
+	.driver = {
+		.name = "tcsr_cc-eliza",
+		.of_match_table = tcsr_cc_eliza_match_table,
+	},
+};
+
+static int __init tcsr_cc_eliza_init(void)
+{
+	return platform_driver_register(&tcsr_cc_eliza_driver);
+}
+subsys_initcall(tcsr_cc_eliza_init);
+
+static void __exit tcsr_cc_eliza_exit(void)
+{
+	platform_driver_unregister(&tcsr_cc_eliza_driver);
+}
+module_exit(tcsr_cc_eliza_exit);
+
+MODULE_DESCRIPTION("QTI TCSR_CC Eliza Driver");
+MODULE_LICENSE("GPL");

-- 
2.48.1


