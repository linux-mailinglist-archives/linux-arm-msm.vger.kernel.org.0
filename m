Return-Path: <linux-arm-msm+bounces-61343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA44ADA4EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 02:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69D443AFCC5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 00:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0869A126C17;
	Mon, 16 Jun 2025 00:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nscwT137"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8614017A2E3
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 00:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750033713; cv=none; b=bOl7Cq96nYho62z6pAZ75GMw3/gE868t32uvB04XfF/I/S/2wKZk/ShMSpnDV2K8f7QAiaBtkQDNp9I4GFllner05UXNWVBHuRFvQzjNXA5d027r2ma3XHWKygUiN4M9DAAR65bS+G6XF7tUF4AAVWHkgEU1Wu4l5/HzS3/UY8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750033713; c=relaxed/simple;
	bh=gfgsNf97a4gh+Kj/WAFR7Au3voGVBKemXRNGvFV/pQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sPidVf85SpjFrk+cE1I3CfQ7kJYNIphVom5kPAumOXXT5I2roPBZvyfW2cB8Nye+WmZY6ObJMwSqaqlzgBakqImbAjNFgj+aBIvuda1GkAznq3SSsFTGMfPNkJ4o3GP7yVMBqosD0eoCFYtNlTiDfsc0uFT6cTXPh0e1gCj77Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nscwT137; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FLsvHI010074
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 00:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FfzLENn8AreWFlLbfZZwByLrmHBduXBntme3gzzOYSg=; b=nscwT137R3EabhxY
	VVgxbAw18G+WKtWy/IOoz2MJx4UJd2ab3zeKvYXiGGczRKKA4dxLFUWT+jGzvDwX
	EtOx0ElGWf9Iux9/PvxC49QFAZQbgl6RxAJMSBf/QlxnoWbL2dwiyIIEHHzayZpE
	v4rTGgr8KkDhQxHGkz19YULnsFvL/8ngewNl+MwWkuwsIq6Gx2EA7m2J24DgwWn+
	k+uhZFSAKwFMKMgiwFhwNzdqtj1a8Z13jpf2Pqp3Z9E99InEpaA9QnN3v1yRRY5i
	Abs2MDWtswDLLhhkkn5iQuY14axX1kJyH0j+NKmUTGHxU7ySG5L9U8QaKNwjizew
	0jsEeA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hfam6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 00:28:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d099c1779dso715308485a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jun 2025 17:28:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750033710; x=1750638510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FfzLENn8AreWFlLbfZZwByLrmHBduXBntme3gzzOYSg=;
        b=DXwmiZ8qhf8q7WFR2ct5qDA8fpaOwxc5TtiWz1zGOaro48nXYvwFQTv1UvwJrQfpWt
         BYS/X9B4Q4G/8Is4xyCHJ9bpFcNIRMxZhUhKFMCrLYnw0hakZV1hSCyvzK1q7oC7DC1o
         X2uiEFXhEWTrLvj8EIGYhwyG10WAuGkb9tTAlSj1upj/cGYFgcLJk3iTiIubiscROHBt
         sntfuy5oLXjT6fJdM947ZHaVlQp1sTphzMFWHcnDFmQ0FCrysUFSisjCnqj7KSYgtEJH
         4B6l1DIRQmkMxf95oab/99a9T41fgySEwIee4hu6OR+TMJV89J1TqdLKdxtT6gTiOS+o
         +0wQ==
X-Gm-Message-State: AOJu0YzUtCXCzOwx+x/dF8QRLDaNgnRgfB4Ny7pUNQAeDuQ2Q7dx7jUb
	+0PjICKuryQ3aFZUHyVmodWqjkrA9baPMvk9NdPr78kCdfwiE1auSqMHfFg1y2FT1KcU2hBIUuC
	sGTpmOHiKnOMIVmvhHKTR3NHcmGdsvu/skLlX0TpFIYWFh1EYmGMEf5TkVD6oxYpwMQac
X-Gm-Gg: ASbGncssWpLI++QtvbIf0XO50PJb1+uAlCPB/fnNSKqwjj/FlflVP5SRy27KomDR2AG
	NtsumzWstnSPUKWd+x7GVRRzlB00hjAtAgMkaelsrqC0WW4xhO/6Egs8N0GMLTLfayfb33Em1JN
	t0FmVAHBCZruYXYg/iNF3OE9apGynocKiNxZymtzXpahCEcQ6MEto6D7SVbdg5+GZQGu+p8zlV9
	GGxvacE7iTbj4vuQidXK9DhDgcgkf2lj/d1XA5U4cnPTkdBomR59BYMX5/VzPjudEK+BYgbcv+y
	IRjw5PvdrY0ZwrV57OZuYAvt7W3Bcy1gWYAu/8TntIgazIclFgmqX++znGqnnLotES8InuW1iwg
	YSzQI++iM+0/hLHV128BKbl5V/2bpZbHlRa4=
X-Received: by 2002:a05:620a:44d0:b0:7d0:a309:b1a0 with SMTP id af79cd13be357-7d3c6c0c751mr1110730685a.1.1750033710498;
        Sun, 15 Jun 2025 17:28:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGk/yIzuRZZqMQ3LhoDyERqVvcf5MD4vzKio/gwar+uk6piJ5F4dlFaXrkh0qfchEHb4lRJgA==
X-Received: by 2002:a05:620a:44d0:b0:7d0:a309:b1a0 with SMTP id af79cd13be357-7d3c6c0c751mr1110728485a.1.1750033710115;
        Sun, 15 Jun 2025 17:28:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac136104sm1334990e87.77.2025.06.15.17.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 17:28:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 03:28:14 +0300
Subject: [PATCH 02/28] interconnect: qcom: sc8180x: specify num_nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-rework-icc-v1-2-bc1326294d71@oss.qualcomm.com>
References: <20250616-rework-icc-v1-0-bc1326294d71@oss.qualcomm.com>
In-Reply-To: <20250616-rework-icc-v1-0-bc1326294d71@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1448;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gfgsNf97a4gh+Kj/WAFR7Au3voGVBKemXRNGvFV/pQo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoT2UhCwSIZoeznObh5E5DDpjjQHwCl8X37gjwA
 rGvZJybsM6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaE9lIQAKCRCLPIo+Aiko
 1bv6B/4kC5faMWFiz744jY1UFxso0LnlWVgZjY27ELM2XZmV41yZaF6n6LY3n6EIVP3CWq2PJf/
 FeOCF/Ikpndorq3NZJ67FR8E0RW4JGaxD/DvKRAmfMzX3mGxq3QCmdUBgkZ28CVYVRcmb3NWXWK
 SOWkdGALsa/agjjQfQxLgy5VqGbMjCNQ4FxUvKaVsIQZg1K6/bDGtFLozifwcjItxbuwGJJEBlD
 cLI15YMYr9Nq7QSNzyakYu9nSizz07fVvlhjeL0IGYgraaotNjVHsg6DOMJRGSeKUBtJtTegpu9
 MdDqr5a30V9JA0rtcuG51WXhjCcqFDPTItYmlWbIaKG7dQ4e
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAwMSBTYWx0ZWRfX+mAIc1ggrF9v
 PSgZEYsgFSYJ4C/AzXQyPHssnED/dWtnhkv4RmBtH6ErLiYTE7nka7idv4AjxLKthRYlJdmT3I/
 F1bHzvhWVt1l5E8jsqxlW3ivtZ8O8emILuthBYVupz3WQZVdlaIf96PdrGmn4bga3H15h0/kPTh
 9LtcwUL3rcxLDWKi2VA0GauwrBI7ED7HcNRfFYiNfekNZC4Ke1wXkOpCrj21SHL4lKYpnMigHwp
 15xe2d5CYknzGYZl/8O6F5S+IHAhPIw3tfSSz5XfA4vbGyFFoZz/rJ1fnyZuTzA9u2UQzcM9UI9
 XclJI/1Eoc/hRdPghSKfZVeIbGtzo4PDzwbyluHUL9RI4Lf9YIcLV3mtE6J4K5QlUckQG14s/Kq
 RueIDAFQN4431BOusZ4TxN6ZoQ/eprgJvOLVwEzR9QUuCwB4e3SvTKXlDspBn5aShw1Z8tgf
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=684f652f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=vjf1cmd32cIfnlU9i4cA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: ClyfFSpjrMIYeJGeEKHX7dMpFoN5_FP9
X-Proofpoint-ORIG-GUID: ClyfFSpjrMIYeJGeEKHX7dMpFoN5_FP9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_10,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=871
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160001

Specify .num_nodes for several BCMs which missed this declaration.

Fixes: 04548d4e2798 ("interconnect: qcom: sc8180x: Reformat node and bcm definitions")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/interconnect/qcom/sc8180x.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/interconnect/qcom/sc8180x.c b/drivers/interconnect/qcom/sc8180x.c
index a741badaa966e0b1d0e0117f73f5d37c6ef9f19d..4dd1d2f2e8216271c15b91b726d4f0c46994ae78 100644
--- a/drivers/interconnect/qcom/sc8180x.c
+++ b/drivers/interconnect/qcom/sc8180x.c
@@ -1492,34 +1492,40 @@ static struct qcom_icc_bcm bcm_sh3 = {
 
 static struct qcom_icc_bcm bcm_sn0 = {
 	.name = "SN0",
+	.num_nodes = 1,
 	.nodes = { &slv_qns_gemnoc_sf }
 };
 
 static struct qcom_icc_bcm bcm_sn1 = {
 	.name = "SN1",
+	.num_nodes = 1,
 	.nodes = { &slv_qxs_imem }
 };
 
 static struct qcom_icc_bcm bcm_sn2 = {
 	.name = "SN2",
 	.keepalive = true,
+	.num_nodes = 1,
 	.nodes = { &slv_qns_gemnoc_gc }
 };
 
 static struct qcom_icc_bcm bcm_co2 = {
 	.name = "CO2",
+	.num_nodes = 1,
 	.nodes = { &mas_qnm_npu }
 };
 
 static struct qcom_icc_bcm bcm_sn3 = {
 	.name = "SN3",
 	.keepalive = true,
+	.num_nodes = 2,
 	.nodes = { &slv_srvc_aggre1_noc,
 		  &slv_qns_cnoc }
 };
 
 static struct qcom_icc_bcm bcm_sn4 = {
 	.name = "SN4",
+	.num_nodes = 1,
 	.nodes = { &slv_qxs_pimem }
 };
 

-- 
2.39.5


