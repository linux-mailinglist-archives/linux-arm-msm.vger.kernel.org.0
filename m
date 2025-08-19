Return-Path: <linux-arm-msm+bounces-69658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1801AB2B99C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 08:38:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63AE71885B72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 06:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57FA426CE2E;
	Tue, 19 Aug 2025 06:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZW++GaR6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A4F26CE12
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 06:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755585405; cv=none; b=FXTGTNQ69SXTZhk/XT7Qjdaov0qHryECOxgd8pOodXnNRcJhqx/HDy9TxZe9Fqtyj69qfb5O3lqL/pFGSRay+f3xkhiWpxVcpWmC4dnyyd/YHdtuyPq7pU1ppglpd3LgvAboDg2lIR4r6ZuWSXV9Q+xQsOZNcLZLiRb/ufy6tvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755585405; c=relaxed/simple;
	bh=rgkE1DP1easYS6YslKYK9Bbq9OWK3nty3gdcQhkYooc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Intl1VaKdot90Jsy7BXW6PCRzIoROZ2Tp+mcXCl/Xvnn7hzwT7wbXrRjXab3zVNR0uwqAKWJS2fCxOn+qbkCKxtpI9FsA5Z+tqVQxlRl4uge6V+CZSo3N308ESecMrLKVbpkKRYwYt92l9uY7WbpfhwNAO/Jcrumd+iYNg4Gm6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZW++GaR6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J2RD3d025345
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 06:36:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWZPw+Dpps6jokruu2kK5mo0seIUmSLFHBR/QVxbsPI=; b=ZW++GaR6r2FuhTkw
	9b5wRt5o8NYv2lIEhyRloLp1OufW5ndt4sDKqW6IbiUGfuJghLP/y8yObQhdQ8BV
	JLidfzkhERA4FNb3mqGOzKEwnG2JacuY9azj6mMDlZrfyHn+5LXWcecpvhZw3CYf
	6Kejwh9NwHSRnLAcxlnFY2vedyVkCdvC4ZFkd2w+cX++mpSqJok9c0pZKqr8RKxy
	Jn6VM2NoDbkvOuHKM8hH7CAGA+QEF2AT7MKelyp8dRkZ0VYmlLcVYcKqxJgCsJVL
	ksmBWCgKDWd+uRZr75vwdgdbHX+B7i7M5oqIdALqfEZANG6g9ao/66Bal86onM5O
	DsGPYw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m71cj67a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 06:36:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2445820337cso53087095ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 23:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755585402; x=1756190202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jWZPw+Dpps6jokruu2kK5mo0seIUmSLFHBR/QVxbsPI=;
        b=BIdCrKG8Lh5U2BlUIHzBUEQDzQNEf8C8ZE0Kh3LebSVSd4f/APKW6EvnXG78Ik63t5
         CLDugdUZhVMzPY9X/4NNLobhXY3f9j+uCNtdFi3kjUhxdRq/wGQ3N6B692RN64o8MPw7
         6qsRPSTi2aXTTXmlWIfd8J5M/wOmecrlwKgVdMmNECLklvt964+4+OSn0bH584yMzaL5
         Z0BJO8s0ZgMng7Q60KktXnYfaqzBjohj0Y5an0DsJ7K5THvwVsd1P+vJ7y/q1WtRZI67
         foiSVu+3pBjlbeGjsbMjZ5P03eUM8jPIo7zqEHuys2Ajp8InFBEEBWUy1w3BbZXcOvoK
         B7yA==
X-Forwarded-Encrypted: i=1; AJvYcCXqnqzqAyGdJgRQhbI/+Mk9qqVn6+7sA6YIMb7ck/49t16zLB8WTP/0lzN+4zCeP3F0+2YW1En7CyhK1tde@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9lKVaUV4j1ZKH5vUPXmdDI73xQ2CFz/iByNNMCYdjWDt4MmPM
	Zdebc0xOZacq9TvoyherVzK8MDLT91FzneHPFKAcKyW+0UPSuGB19Elh9LeH8ZF04NH2tbBiVZX
	9LGxratas0OvjSSv9eKhgdznYCxtzNYGVb3cJVKq6RwagNtHLuydOr3rhtDwWB44v0mHj
X-Gm-Gg: ASbGncv03w8+ovlBCsb7BFf84OocBawB/eoMTQvVa5aOtfFTxVtseZBwRiKA3gZHnFz
	u2DjU9ZM8iKCn1poMTj2uCs+X3+MDQbgocwxIcfJ9Po2/J+fWJEmwOety24HflrQL/GDKExJBmi
	c4Ooas/lEXesZawhGFzmXj3kSWx/cJQvg8Hxwhjip9YY906rxpxwknKxfyim+45ZWmjVqnZR2AQ
	/b+crNGbTNQhfh/uBl0Y9wroiJP720Azz/kP9prBYQnfum+hOvO5u78RWjKGOTttD9aJjDKP3pC
	3PGdhSbnz4RWtFo+i9qRbBx9TjLtEN51xTJphX79NCaySh3Dd2I3jR3Azd5MzVJjrRnvYYTuXmV
	L8FT/Tb6KKGvTZNfB9UjpHziG4JRbpRvczw==
X-Received: by 2002:a17:903:234c:b0:234:cf24:3be8 with SMTP id d9443c01a7336-245e0541d6dmr14369055ad.28.1755585402147;
        Mon, 18 Aug 2025 23:36:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl/lNABQK/kpg0X2OhEKp4HNBmGeNVvVA1WkA/paFD5ccWwopJ2tFxVPde1x3VdbYJUHJCYg==
X-Received: by 2002:a17:903:234c:b0:234:cf24:3be8 with SMTP id d9443c01a7336-245e0541d6dmr14368825ad.28.1755585401656;
        Mon, 18 Aug 2025 23:36:41 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d54fe38sm98120455ad.135.2025.08.18.23.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 23:36:41 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 14:35:56 +0800
Subject: [PATCH v4 1/6] net: stmmac: Add support for 10 Mbps and 100 Mbps
 Ethernet speeds
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-qcs615_eth-v4-1-5050ed3402cb@oss.qualcomm.com>
References: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
In-Reply-To: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable+noautosel@kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-5bbf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755585388; l=1721;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=rgkE1DP1easYS6YslKYK9Bbq9OWK3nty3gdcQhkYooc=;
 b=lAzLbqBZgwScoYObFRiDqWfMrCAW8S5NgGjq7r08AjwHO1jUwef1A+841LP3ckCJ1R1EY5YEH
 4cuvivCRLNeDSw954otmMxHK0W9KcjsGR/NaRz4uxt+wTDkP5NVaIVl
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-ORIG-GUID: QYy2ADS_QmHxPLtpX-aL-CGoFb7TfbNm
X-Proofpoint-GUID: QYy2ADS_QmHxPLtpX-aL-CGoFb7TfbNm
X-Authority-Analysis: v=2.4 cv=IvQecK/g c=1 sm=1 tr=0 ts=68a41b7b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=VHUZ9mhHZOqmV8q2ncwA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDE0NyBTYWx0ZWRfXzudp9Jpsvpho
 b+Eaj2FpDZOt3x+rFYDKXggtPGddN2ygg9PrrIk2dhzLLjWN5b2U10n7NSm7/vX1HSpsYlReKpR
 XktjDWkQgN4lGqi5dJgDTiFAswtiPwZd4S6iZhEfmxrD+wr9xc50+qyvHewtr9PVVwI23Avdo8R
 UD9kAGxtiIqY+CFMEN1ZyDrQv0B/8f2pq9qHCWuHAeTCWOne4by8rDVpLbZKzoG98ykEbj9eR48
 NCccuP7o7evDimlAtYTkrrde93iIi5L4aLblY1QBzALNC7kdGtIexMfWUANoYb8Jy6z72Pnp36b
 l/BrOWy3Dnixxz5qTyc0CRyyFr6ns7IAcbL14p0IhdlZ05i9eGYLQhXGy6VKHIakPC1jzD5y195
 V4jLv5q9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508180147

The DLL is a Qualcomm-specific hardware component integrated within the
MAC and should be configured in bypass mode for 10 Mbps and 100 Mbps
speeds. If not bypassed, the timing delay will be incorrectly applied,
which will disrupt signal sampling.

Fixes: a7c30e62d4b8 ("net: stmmac: Add driver for Qualcomm ethqos")
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index d8fd4d8f6ced..a4ea72f86ca8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -64,6 +64,9 @@
 #define SDCC_DLL_CONFIG2_DDR_TRAFFIC_INIT_SW	BIT(1)
 #define SDCC_DLL_CONFIG2_DDR_CAL_EN		BIT(0)
 
+/* SDCC_USR_CTL fields */
+#define SDCC_USR_CTL_DLL_BYPASS			BIT(30)
+
 /* SDC4_STATUS bits */
 #define SDC4_STATUS_DLL_LOCK			BIT(7)
 
@@ -609,6 +612,17 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 	if (speed == SPEED_1000)
 		ethqos_dll_configure(ethqos);
 
+	/* The DLL (Delay Locked Loop) aligns the clock and samples data
+	 * in RGMII interfaces. It should be bypassed for 10 Mbps and
+	 * 100 Mbps speeds.
+	 */
+	if (speed == SPEED_10 || speed == SPEED_100) {
+		rgmii_updatel(ethqos, SDCC_DLL_CONFIG_PDN, SDCC_DLL_CONFIG_PDN,
+			      SDCC_HC_REG_DLL_CONFIG);
+		rgmii_updatel(ethqos, SDCC_USR_CTL_DLL_BYPASS,
+			      SDCC_USR_CTL_DLL_BYPASS, SDCC_USR_CTL);
+	}
+
 	ethqos_rgmii_macro_init(ethqos, speed);
 
 	return 0;

-- 
2.34.1


