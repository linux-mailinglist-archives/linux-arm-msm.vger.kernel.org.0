Return-Path: <linux-arm-msm+bounces-90227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIQ3LYQ/cmnpfAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:17:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D58688FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:17:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82BC6301B3F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 15:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD25352C3D;
	Thu, 22 Jan 2026 15:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QzDPhdyg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iDfSyZUq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2254634252B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 15:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769094627; cv=none; b=hU182SjolArOUHvQwvpr+lg3cCNExc6JM7KcuGcDDyMyp63M+H6FLMnwinjaO8c8DsBCEBIvOrCGFekFBJk5OA/8bbFdk/V+HKH+2bp+Pwcn5IFU4iBhALVHLmGVpBkC7Es5CppgsLLhwaCLKXVl3rV1E5CfvmDIOf6rF0LehFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769094627; c=relaxed/simple;
	bh=wRMlMUOjNaNt0fRe8bIGnbbQF2FAo1GXnXeodrX1dvI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jVQs3yyxBow4JARzR4a9csW9D5tu4XIIvPtOdOrXePo2i3wde2aaNL4SJnUP0A0ePaFvyTj4I0t4POWBIZ/AZ2Ze67ekpopd6niHIQq50A2r7m8L25s4wKXjFDv4q7FQ2VzrpU94VA1cdBRMtk6guyn/g37NdQJ1WAi/wvkaBVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QzDPhdyg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iDfSyZUq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MEeWHT725005
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 15:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xyqIphb3PH9
	WrLK8b/LVLC85X+KOkuonBJmPjmbkCOo=; b=QzDPhdygolWmuxVj6WLzmBK0XTD
	zE6RFeebgWQHlZ3BTAoIh3HIikDh9yFOrlxjoUgaxoW59BDSeW9oeqKxAhAENmlY
	WmWvjsuPd7H2o8xhz33VKZcJ1eUsBENfzmnWum4h9ewb49KojXCRIr99vR0L5/MZ
	EvI0S3rGu/4X+SOVD3V9fXD/PFsYIyFg7Rk9UYqZtkU5pQigj4iUxkRjFOsaA2E0
	zAGSmkfK+CVbeT4q1CUaZiL/8XDiv72tynnaB4uPJ76dgHPM2tknWh3yW/JkIPHj
	ij0tiykYYxaGOaIRxQlDXgt9rOYx7dcKmo9M6hno0ISaU4bozPu9cf/lmog==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buf1bhfff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 15:10:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82181fdf3d5so682251b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 07:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769094623; x=1769699423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xyqIphb3PH9WrLK8b/LVLC85X+KOkuonBJmPjmbkCOo=;
        b=iDfSyZUqb3Jc62ORRurQZDhusV2rNIIPSkS/yD6njb7oWWX+f+wuLlaAUc6CYuUn0C
         jCID6TYGM+bFX77rChJv0Q8mqIKmF1UZCipSI2XzSz4L4IJEruO7Kx6hvq2vkeTFJ1xJ
         r+c9tolqGJ0MGUot4am42NS2S4ZjCaeoTlmzMgVf18rl9RwKDPDZ1mbWKbzmS6msTa3d
         ciM5R0E9f1Zxy3jbD14DUtpWyPcG60X7+UYgO8dRFCEduZEbJifmLpnr5sLGe2OfSKxi
         EgO8ytzG+D0rJNmmYAvd8lL5TjzzOJq2hGlVRzXY1s3N9eK/c0Fz0gETac/9nfxujx8U
         ADqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769094623; x=1769699423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xyqIphb3PH9WrLK8b/LVLC85X+KOkuonBJmPjmbkCOo=;
        b=j/BTZamt9tcjeHhOdGNOg+u0vCSfNWvNzU2OSJuORFYsBUlv5oSCYswlgzBXqgCTrI
         Ws0oX0dWB1Rw8EfXzV7jxOsJLu34TNe+7a4bY9gWRgUB675xF8b1Y/aaa8GH1UAV/5wB
         FVis2kO5rLlELlsQnQwSiLYEiWzLAWIaWkt5iiyzIQQ2ZFVlMO1jLWHFH82gb1na100/
         4bMjpJesnvzNz+vjeOIPoB4uaqG0imzMM2ApbGFht4UcfTxTvg+54BbIWfuXj5s4yfjt
         rzsSNu+O65PJ/lsUg01dfj+XVsygVZO6m34ZCVWlwfpWvKMQdqPLXDe/MqqSIAmd+hsQ
         lZag==
X-Forwarded-Encrypted: i=1; AJvYcCU7mSKWUd0mwiUEL/A9CWm9RYgbzJZIabuSTG5RZrtPdxIYXKrzKgQ7KCpckYp8mq439wAQXHzxtbYGrnl2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5WjptLtpfI19W1KqXoX0KRigVKK6RB0pM/5nbx6hAShl1tpTh
	QfAW0AG4XqfAkd2P7yVL4jfR5a6IEpGwxhqnyvnq7H6pMqmNHUGg//tC0X8OFJ61Qjh8qTDK/wO
	guKINWQgxE97PSCIAdUrW13x0tZ8r6r6zzoU7JH3y0V9+mZZovLJxn9+wbZYOjcDseFRK
X-Gm-Gg: AZuq6aLUznYK3cHsx7tCIgwYRwbR/KbuDYXub2toNqCiJgS4gBt2cg4hYcaSVzN2UFh
	OoyXGBDk0zrZfC0s+T2iQ85jA2+Wh1S9+LxRB8u+CmifdnM5/wJpatRmhNeeC6hWRRDD9KRnUsC
	urWfq8MJpL9EAlqBhrBQd0s2D1WdWqhxjtaxXV8yjaLoxTmwHBpkt8uxGQKc2Oewp81HT4Ycz/g
	Rn4AFLozxx8VgChRzHcEMmKQyaamM2+sxn0lJOzXM+FKklgU/VBs/cbDj9D6+yUMKcIp/k+zsIN
	YLagqkvGdh88AL39rHWOuCBBVXKEcV/yvE96JyrWUVxrhZV/kVVgIzNeq1s6MwwYth8oh42nT+Y
	B1kqKVwCftDePaZ2FIZlwzWIaj1rkBuZd8EuaSCNJv10=
X-Received: by 2002:a05:6a00:10c4:b0:81f:42b7:e589 with SMTP id d2e1a72fcca58-81fa0354717mr18941126b3a.45.1769094622647;
        Thu, 22 Jan 2026 07:10:22 -0800 (PST)
X-Received: by 2002:a05:6a00:10c4:b0:81f:42b7:e589 with SMTP id d2e1a72fcca58-81fa0354717mr18941090b3a.45.1769094622030;
        Thu, 22 Jan 2026 07:10:22 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8217c258fa7sm4328182b3a.17.2026.01.22.07.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:10:21 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        quic_vtanuku@quicinc.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v1 1/3] spi: geni-qcom: Improve target mode allocation by using proper allocation functions
Date: Thu, 22 Jan 2026 20:40:06 +0530
Message-Id: <20260122151008.2149252-2-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260122151008.2149252-1-praveen.talari@oss.qualcomm.com>
References: <20260122151008.2149252-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: SxTjTAvcdfh6lEKz4783fu1NCK_SSHns
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDExNSBTYWx0ZWRfXxxLN8+ltHz83
 OmPOvrtDI0PhKnyblwhlSKKTwLw1E0i6FZ2CEyt29Ue/nYu99ALBiSUsv4pFYpZuPYS2Bhe5S/j
 pqlVLFT1UnV8iOZRNRjZB8/vOUlyyLNdUWvzcVC2O4KboGgKg8pCdiE26H4LqKt89vib2jrNfTx
 G5knT6NHPrFU+qOBQHItwRx43SpU7MQX6/U6nPerveTdS7Z4EkCv6FJQqGzQ86fuXfN/IZjlK6n
 Y4FxPrCXe02l248JPk4neN6rA0YLN8B6ijQkAzYX8OY3HGMPyHOc0/Z9Mu9uVoO2Gedn3nxYXgI
 O6jeGpysInhb+NSlpaWRZe1UKnqdf3tk0H8ZtNOfEMXl8809jty7qr8D2FKRBIbRqvWt36WHPDQ
 /bm7Vho9K3XhBcluWMZUpQACgai30UdZW1D+VVL+te6+RvYeociXgvr0XC+QI/Jjk7LQll7v/43
 iJxqYO917VZZCGxWGZQ==
X-Authority-Analysis: v=2.4 cv=G+0R0tk5 c=1 sm=1 tr=0 ts=69723ddf cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Bup7t0bCmiTjNce0pOAA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: SxTjTAvcdfh6lEKz4783fu1NCK_SSHns
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220115
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-90227-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 55D58688FC
X-Rspamd-Action: no action

The current implementation always allocates a host controller and sets the
target flag later when the "spi-slave" device tree property is present.
This approach is suboptimal as it doesn't utilize the dedicated allocation
functions designed for target mode.

Use devm_spi_alloc_target() when "spi-slave" device tree property is
present, otherwise use devm_spi_alloc_host(). This replaces the previous
approach of always allocating a host controller and setting target flag
later.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 0e5fd9df1a8f..f5d05025b196 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -1017,6 +1017,14 @@ static int spi_geni_probe(struct platform_device *pdev)
 	struct clk *clk;
 	struct device *dev = &pdev->dev;
 
+	if (device_property_read_bool(dev, "spi-slave"))
+		spi = devm_spi_alloc_target(dev, sizeof(*mas));
+	else
+		spi = devm_spi_alloc_host(dev, sizeof(*mas));
+
+	if (!spi)
+		return -ENOMEM;
+
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
@@ -1033,10 +1041,6 @@ static int spi_geni_probe(struct platform_device *pdev)
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
-	spi = devm_spi_alloc_host(dev, sizeof(*mas));
-	if (!spi)
-		return -ENOMEM;
-
 	platform_set_drvdata(pdev, spi);
 	mas = spi_controller_get_devdata(spi);
 	mas->irq = irq;
@@ -1087,9 +1091,6 @@ static int spi_geni_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	if (device_property_read_bool(&pdev->dev, "spi-slave"))
-		spi->target = true;
-
 	/* Set the bus quota to a reasonable value for register access */
 	mas->se.icc_paths[GENI_TO_CORE].avg_bw = Bps_to_icc(CORE_2X_50_MHZ);
 	mas->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
-- 
2.34.1


