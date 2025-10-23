Return-Path: <linux-arm-msm+bounces-78450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 459FCBFF313
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 06:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E049D4F8531
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 04:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8A3261388;
	Thu, 23 Oct 2025 04:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VqlljeAx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377EC25A350
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761195476; cv=none; b=PClRht1ws2wWg1kMpYFG4X9THNom9EPOACkLz3/GoT5aUB5gzwp58iT0bxnE4/rQEQzJVeUlL8kUATXJgGVYa/KafINRhCvjOe+mpKHSGAjiD031nn8UboJtLL7ofQslSabjBzDoaTVEg2uj77hhWvCEb2rN45XkqzCz5xzieL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761195476; c=relaxed/simple;
	bh=nP3MmgM3OO/owQxwBNTpJAqNRSLheBdloe3A2buJFiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G3nWl7NwQPCgc74R0vBO2GaJSahn/GsW795F3Si1uNKspIzgbM+oUcoSC/ST6QapNl0AKa9U3EeqJyJSDANKcAdckhqO1W/WFSr0qoGRh0QLd0ByNNwWnj64Gths+ua8GbBJrtjkrY8WpXNg7mOqZCn28CKcwoGHlQoOhVRBiVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VqlljeAx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MIf7ig018119
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eP3LilVKt+lFbxAHwFZtoyMgNlR79PwYtVYBu29OAPk=; b=VqlljeAxZ9/ZLdqY
	ul/IJSz9CO4Uqc9PWrO6LfTJEXWH8XIevDs8Ap03pxFaQ/0h4X3at2Q11HAxVCQ4
	NbzZVY28AlM2aoUnHgn0LGx4Kh2ZMecd1tztRUHtkdiSpj1zQUFtgHjD21dat0Ua
	8QyusXlkD7f98stBui3vJBsD3PiDAcO7dwMVcGi/a4sjiEabqfsJz670O5EZcSmW
	5+YCPbyqZBC5Y3mZh4oHmlLYAt/1fZS5JeR066m4UkJZ88Kny+y8aOeFBjIGJwcn
	L7KwCSUtGlNdK0WGztRqJukBPKuVxj+z/+qZgOJLh4lAruoMWLxUusQWsHdtvfSI
	MKxvwg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0mxcd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:57:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2924b3b9d47so3925065ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 21:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761195472; x=1761800272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eP3LilVKt+lFbxAHwFZtoyMgNlR79PwYtVYBu29OAPk=;
        b=tY8DXQKVmKZnMAXLluCrvVWltFe+1eB0PXJUZ2imYyKmV8bQOy2+pNOppPQYGUAine
         UYfTSX9dVtNVKc90u05XjtErqJjap3TkGFZPI07ORA7UFxplVW5SZmOx1G9OxAtRfO69
         RsdgXF3laF/H3bXxRJyTvbZR9bqdTyuVanyZPNIVsgdHW+PCS/8WfPo25aINgJKH2ONh
         vb9PIQqjLZQoS2UeNGdIFRk8V2ynVzhM3wZ8GhDkpAZnTYKHn3LIW1mrP3h2PKxcQSP1
         ViphvXDfH5kbOuyTfIMXa4w3cd0RpncGwP3YCpt/dhNU9s9DunyJjRlu0qixXh3KpYWV
         1bpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxX5OVl6FNR9OSWXMNtcjglQtoS3tJInWrOzOeNkmPHsDmnvXMBfr7R1wQk4nD+5/dIZ6IuwqoXoNOw5a1@vger.kernel.org
X-Gm-Message-State: AOJu0YwoD+jA3nlFv2+xcKaxrsma6FGJq4PFMxl5xgApAb9up/NI45DB
	ST+n0JWNbPDTsxvs0InCaAq0BKKIMDAbnksGOop9ISXcNgLTToS1HlB71mrkU12v3ViMfrdBSLQ
	2cco2YPblCvBNLZl2annW5rjuy1xOhdMJcrq112BZKtAJ+IevBfq01tIOatOgdKqotfpd
X-Gm-Gg: ASbGncuW5wYYppM8lfGiOUAyYI1FJ7EB+OIuKX0y1lDCinYXA8Gi784KSURfeQLgQdh
	iZ23pw8ZOL+OiGpMn6jJ+8wO5WZCZrzldSZHSasSsvaS55Lev2KA5JfB64E7nIBXGM1dv6qPnKq
	4+yu1NNAeqbFV2N/mRsZ4QBhoVlkxmZmcKLmiKpCpI6luH6tpW/XWhuBaGjI2/E18WUibxupXcq
	S2v1M/G03PHeZrisn9bQO5Z5Ah3srVwDps4uRPKhOWqhOz6+5Kj/POmN2m4dDK3HqE3qgf8t1I9
	TEZCbuRzFQfk9YH0E2ccBzdBfAy2db/4V/sPMmKfhIbQkOnhhgKe2aTKkFddWah5q/B0zluS5WF
	OGmL5ALQo0OZ8jf0KD6EkFPOYpFT4SbbfwR6rZTmaaHTWE2V9Gw==
X-Received: by 2002:a17:902:e5cc:b0:267:95ad:8cb8 with SMTP id d9443c01a7336-290cb079f2dmr335533375ad.44.1761195471564;
        Wed, 22 Oct 2025 21:57:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+qpSBs+V8iCRJV2Qk2k/Fcf8PfbvACLZjNtJduMEIfCiFUZfla2Qz8/Nn5Aq+sQw8fr1wFQ==
X-Received: by 2002:a17:902:e5cc:b0:267:95ad:8cb8 with SMTP id d9443c01a7336-290cb079f2dmr335533135ad.44.1761195471072;
        Wed, 22 Oct 2025 21:57:51 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4bb86cbsm814289a12.7.2025.10.22.21.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 21:57:50 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 21:57:36 -0700
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SM8850
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-knp-socid-v2-1-d147eadd09ee@oss.qualcomm.com>
References: <20251022-knp-socid-v2-0-d147eadd09ee@oss.qualcomm.com>
In-Reply-To: <20251022-knp-socid-v2-0-d147eadd09ee@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761195468; l=696;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=nP3MmgM3OO/owQxwBNTpJAqNRSLheBdloe3A2buJFiE=;
 b=aOQgNkbU+JOoRlizxASsWjq+JPXFnkbM+kN4iMrgdpoa65lEsGUtqKm+f9Ngn3FnMaEKnEHTJ
 2lz1XEza6ajCGR0tmL6lULyKTEFU0WtDaOlsbiOn/8AaOW4wd3ckHo1
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX5VkljQLAVl4h
 U2uDaTtbUaJujO/JQfUgiz9w41OWyYjT/KGEpATNG1zE5KYylDw2MJqwAm7eq9otVqZHBIQ/Ja/
 Lj8KcngsbOksgZnBlBRwbxXk05e2cgMMFbKIhNx2jw44TSwf5vH+BM/iR1fsozPK5Jgw1UhWmiZ
 2XBam69ReKh3JeX8H8HALcNvxk5sSO0fYHQSE4Qrwu7VaZvpvlNV5mD4H/blGpWB4lx1dQdWpTm
 tSevGEFgwD79paD93//fUnoS2Fbm6vH3nmfgXBEpKyXd7Zlvfd0q9ldRJyW7iqvd8Ga6SDC/ib/
 RVFOZHRE/fZOAjLy800MfsfSlTCZXsko6PQstCu5kZSZozlLiLcotdy1jrDRVbzPzX4eFYA+4sv
 7lPb4q3gZcMrbcnMNX4hGlZO7lC4rA==
X-Proofpoint-ORIG-GUID: HJDNuGnjxXJsLbtlyIQGdAcNGVXFZpdj
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68f9b5d0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-GldTGkhEULYXnHVInEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: HJDNuGnjxXJsLbtlyIQGdAcNGVXFZpdj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167

Add the ID for the Qualcomm SM8850 SoC which represents the Kaanapali
platform.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index cb8ce53146f0..19598ed4679e 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -286,6 +286,7 @@
 #define QCOM_ID_IPQ5424			651
 #define QCOM_ID_QCM6690			657
 #define QCOM_ID_QCS6690			658
+#define QCOM_ID_SM8850			660
 #define QCOM_ID_IPQ5404			671
 #define QCOM_ID_QCS9100			667
 #define QCOM_ID_QCS8300			674

-- 
2.25.1


