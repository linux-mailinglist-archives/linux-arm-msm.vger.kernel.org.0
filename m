Return-Path: <linux-arm-msm+bounces-87503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 571EBCF4465
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 16:02:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8283C3050CD3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F7B72D97B5;
	Mon,  5 Jan 2026 14:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ehNTYIkH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BPXpuxrL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC6A137932
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 14:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767623830; cv=none; b=gZHdS4oBLvcc/KmM6DlOnedGGddcRjwJWr0ILghO7AO8cd1yz+NrgvjIafcJDVQq6ey/G0Lig803jwqyzWXSOPHIwcJupeASg5AimQeYqBaAZNQ87bnmcsYyDenZgPjC1oxq2zDGPW149RCOnOGsOODUqrk48McyITr/+EkZSh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767623830; c=relaxed/simple;
	bh=i65eVLxpMZsyFdDY2lrflFwXpIkctLvow8AmMXbS6yY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iUnNRFozBDqSk1FobGFQW7yZfZnwkAVfsBqD30CcZbskSNKzaEbGS8CIX1+a2/WZonc0irF7CbUnVwcG3SDmpvsxNM6mQP/dMKZJWC7J2tVjS8vKR3PWJQ54+gAj4NyOsMY16wbMR2aAEdZxZDkGFB/Q1Zsdt8iGuXzLBag0H1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ehNTYIkH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BPXpuxrL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058Iasc3627123
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 14:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KZioLkpanDZcBH1dgKOEf56mBqkNVVvEtci
	ludwtIUw=; b=ehNTYIkHAHXAHppeWDGRPgWTfA+ycLAEc2nK9K9HaDbIZZDK+vw
	jJeOxl+RVw2khR8ZrwyDWHIhPR4/lJ4Bckq1rrcCcNO6N8mTB3wBqjHO0E9GQWj1
	ukwXd/nRmrcDFaxN3hU4hHGkN9QndQ+CL6b5kype4UZ36zhZPT9lzbdEV0hRtWav
	K1jTULQE4L+i0CpUcRt42UhAJvv4fNMrLg00qJNV5anqYt8kVic29V7hEkNhzdPp
	uiiYHzLwX3QiKFNscPZO1k2N4prHDU/8aHlYqaZMOcs/kAFfEelg3otIU5Tpix/E
	WMEko5+9m8fi1CnZ2sSi4QYMeHxoXGGm1Cw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beuvd4rqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 14:37:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee09693109so301317531cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 06:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767623827; x=1768228627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KZioLkpanDZcBH1dgKOEf56mBqkNVVvEtciludwtIUw=;
        b=BPXpuxrL5OoalD3aefmL9yjcyZ6SxUteTgdCQRF8OCcIbfNQh2n1oarbU8QddQQE1e
         2Ikc7WephNOy/DorPVVm2H1J57UkkR5ye0QTFXDeS0l4eHGpVckPHYM7BVHIUWovKHgk
         34QrTND2lwrS7Nobp9/zH063/3XlBaw4Ab0c0rgVntt2Ql/Bu5usl2V8HOSlwdYUqcT6
         AHhpu4IUIV9MghOE6NgE4CDBBgGp+sCPW/Pya68n6e3YYqq4eouKuxzqLJEhmJtIs1SR
         pmqcSmgPmA1zw3rKYFfqlmIwo0Fgf1o4YPST6y9zBDvC9LeVwmVh1FjQb/00Sb3kIKLq
         GC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767623827; x=1768228627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZioLkpanDZcBH1dgKOEf56mBqkNVVvEtciludwtIUw=;
        b=fJXtwxjuQaAv/pWi5vIEMI0KLjAHO4aqUw811WpIg5FUVqTf2UKNb6Hk7gOZRhIWlZ
         cWSYUkd4rXilvkDUSsSwMYy0HZMF8ulECg8id9WPyxtgEW03RLfc3oLc+PjvvhwZWNQv
         LuhL/J4JfjjMGMnYjJOgd9xrrJT/mxYkkSnV1rXj2k4k6UXg6Kf+Buua44+z89H8j06g
         WArW6zfpJVbDHm0PrTq3fswRxRkdOCxEoGmB48PxHUx7dXUE6xnqlnYy1JQkqvawVkWq
         lf3va2KyUDIs95KR7kk0bBwFJ0qW3BPbZb5fLGHrGWej6rAGQDymindPpZWi9MiNpQnu
         uQuw==
X-Forwarded-Encrypted: i=1; AJvYcCV75pz5qc9R3tXdtJXRvslS4wRo1Dbvd2DqtEYx4F5niV0RXqIKiXP8491R8zP2wZJUu+fryFruX1XFWtZq@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Va0fyhsnmx49YuXgL/DubesjQH7GqnSSS1SbJOzHm4fdtz7R
	UDRaQja7gkzezjwlu1BZO2cOLehdshBw4ZM7hV4AuNE1Z6nFo7eOub+Lh2p28DW8ATJBy7sat/h
	VF0q+pKmqp9XL/serO1SqN9QgqXZcUTdHDMpVK4T81JNbpJiECDPO7CJBcTIfoANcNdBL
X-Gm-Gg: AY/fxX4gpcfheUz+yDdBTy0YN204W9xISf3maynjSHzLw4E0UZnwpTK1+SUd0g56alJ
	Ql2hZasimp9L+yAP3mdwUveFgQWFd22cRB/j6Z/rCcyRgWtOI0OoCZ4yGUMOlR+0IxRGNpcMom/
	hddNSX0liC2Va6WTElKRh01/x8DTZWZfB9h4KLA8zguN2c3jdqJNdjVRsXH5McP5JRxgtpEKiEq
	qi4ePGv4wHzUthlE3MwORTJOgyOUFcIKHKkSJJjBnSq0hbCkBbbhD9xr6JJ5mbmOwttun5gotuN
	vy98fBfHlLD84Tr7RjAiLFS0GOjZpA025xsLabnPMOWKNah0WmIr0bQc4snU1ZbmEIZmkwqLhdr
	pCD4xrF8PGHrxztTw0qpjkGdjcQ==
X-Received: by 2002:a05:622a:a90b:b0:4ff:8da6:2289 with SMTP id d75a77b69052e-4ff8da62a41mr50044701cf.27.1767623827225;
        Mon, 05 Jan 2026 06:37:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETqa4wUKKN9lw1LQlEMOdwGiXBqLZKSYc2WvZI5mrVl4L0Pw9h0qnI9s0mw79oaM7Cdgi0Bw==
X-Received: by 2002:a05:622a:a90b:b0:4ff:8da6:2289 with SMTP id d75a77b69052e-4ff8da62a41mr50044161cf.27.1767623826703;
        Mon, 05 Jan 2026 06:37:06 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b84267ba062sm2914066b.71.2026.01.05.06.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:37:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 1/3] bus: qcom-ebi2: Simplify with scoped for each OF child loop
Date: Mon,  5 Jan 2026 15:36:58 +0100
Message-ID: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1368; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=i65eVLxpMZsyFdDY2lrflFwXpIkctLvow8AmMXbS6yY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW8yJE93S4+M3e+01WVQV077ZGMVXwUKYuZDCy
 eXZDeO2BhOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVvMiQAKCRDBN2bmhouD
 18jQD/9QM/XaR01VMbGWrly6e4KidWj6Gt/bN6D014S4O9L5GkLa7tZ5FN3sINq5Rpnu3e8+Q0Z
 /W9VfJJKNsf7JvBOZn27KCvjH1dQisLMT6aAuS40QQVeHaTawiSZRPZPwe4/S5duNsFZvsLcje/
 3lj9SAVMjbONDK7fznomplvZdjJvyS3KBtCHWZ0hqcXWySEzSmWx5Kp4n+1U7xlytPwOqbyKsEH
 gmU554TqKuWZEWTQx11+GcX+40kaex+OWBBVy5wKbdCPcxjZpZWEZYNby21cpOHlbqCI60glMb/
 akb+QI0sZgvyyy77Ek4u5DuDMXFttmVrDzN2Cd25k3c2+SKgbGHcqvMcxwQmlSdcxTAPo+Ko1u3
 OOsOFvsUC2SqsQvFqhbJ62QYz5hVnwH9r7dF8p9XPZuwYdRn9ZFMDnZRP+Oy9g29+anCoiCO5MN
 L4UNOyGYoP9+0nw/HjY2WndtUL5M2YKyEqPKg46n/OQkYbcf1Yy+zUtN4fert4tdLW16SHbzVZy
 ZnZW4kgzLY7dwShPLlK+G5S6ToTRRO2fvvPB+49mW4IVgVfRfx4Pq+cti1JmVgoBRQpxFwh8Nvp
 eNb/a0ziPUnka4ivNd2MOIwDHfMmGQ2lGPQMs+2ESgKeb6Bcfvyw1P91rHT1NDv7Lg8hr1vqazn xbp1u9v0RS24Pkw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zF5F5CDGMJ8uIRaakd1OYPtgK7xHntlH
X-Proofpoint-GUID: zF5F5CDGMJ8uIRaakd1OYPtgK7xHntlH
X-Authority-Analysis: v=2.4 cv=OuhCCi/t c=1 sm=1 tr=0 ts=695bcc94 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=mc1TC-L5zOEaToRhIlkA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEyOCBTYWx0ZWRfX6noYbajsx4Rd
 BINB/upxxEZj+88/nzyWkY16mrm0BhepZw3oYWjHt55zdK3bxkFoo4QP4LVo3SkD8YjYRcROe5W
 d3aAhfulLXAU1c9Lpn31/1qBA/YOtGrrAC0bzRegPpIoujB0BcY/bu3TXDJY7o/eBSBcakZ+2dx
 HckZDRejqAgQoWAJ2W4TaIZwQBQI8BDlN/ihT/4jImlYQ2U6vFyZ2QxreFL0DGopz7KeivPDn/n
 3iL4Eg6rTwh2pzmcE4pNZ3twNChhGC+wCtWR9ksuIgifYrEw+IjSVOhJrhN2+wZ2KRIqYnlBUra
 aM6tF9h41ZWKGyGgf42A5qjRWmLmicJdwqUtzSSwrMydbV7ZPUOk0aR2aX7SctX9SY7owMOwJ7B
 UGwG7SyXmvQrmHz6dhBAu4pIWfSnIMUkY8wVCgGh1jJ1+2qpzkIuxzd2XC8jsHNikRE3Pp0NBC7
 z1BfCMiuOAjXOKZcHxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050128

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Add Rb tag
---
 drivers/bus/qcom-ebi2.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/qcom-ebi2.c b/drivers/bus/qcom-ebi2.c
index c1fef1b4bd89..be8166565e7c 100644
--- a/drivers/bus/qcom-ebi2.c
+++ b/drivers/bus/qcom-ebi2.c
@@ -292,7 +292,6 @@ static void qcom_ebi2_setup_chipselect(struct device_node *np,
 static int qcom_ebi2_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	struct device_node *child;
 	struct device *dev = &pdev->dev;
 	struct resource *res;
 	void __iomem *ebi2_base;
@@ -348,15 +347,13 @@ static int qcom_ebi2_probe(struct platform_device *pdev)
 	writel(val, ebi2_base);
 
 	/* Walk over the child nodes and see what chipselects we use */
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		u32 csindex;
 
 		/* Figure out the chipselect */
 		ret = of_property_read_u32(child, "reg", &csindex);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			return ret;
-		}
 
 		if (csindex > 5) {
 			dev_err(dev,
-- 
2.51.0


