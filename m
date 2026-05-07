Return-Path: <linux-arm-msm+bounces-106463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADKSCf6u/GnlSgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 17:25:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6704EAF99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 17:25:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E625C30144CD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 15:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9950A45107A;
	Thu,  7 May 2026 15:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A2LhJinX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ww/ZppNl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D99F44DB68
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 15:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778167494; cv=none; b=oBumRsmPHC/bg8XQfzP8vdBtOPn5UYbg9p3hf+OPy3tm0goHOX0uxZZz/7N/DFddEiCjoIeEKHzI9TS1wtpGVu1DzOymAqiDmSQyVip0s8h9gQnan3JQ/NRGQXQWvYePuazg7387Z4cy1pZovtaJwsyyi8OcxG+Jmb0aHameD5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778167494; c=relaxed/simple;
	bh=aWIeQEdmSLhgx88ywuNXkmaIu8+4RM4LnE64b4MEZHg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ILl4i1aiK1W4cWwqKbkeKg/M3bibQuYeWyQ40BB5a+j3SBFWyERtxnfudJkOI/zQGge3VzAL9Wd7HQB5J6rARQXrdWb2XUwYcsVFkbyLBIy2AKyWb0Ft20swAgNd52cBBGd9eULDdTOgxNYomPI6A5I17hRqCh2+7pZqNfcy3J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A2LhJinX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ww/ZppNl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647AVY3K151029
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 15:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BmKkWNysoQOkzQVu0/HpO6GRxwgi9ndXDewfJyYIvjs=; b=A2LhJinXkxFI/S96
	9vte8eeCRxFZ/E3ZYfrJQhuW21ihoIaeeqWVGUT9ZnEWt1g9Nqjg0us2pQSDCU8o
	puKLgB8ksgjnhr+8qycY2wZEqtnKH/wo64eSLK/DgtapCF9gGyZr9Yhp3EEZqXFX
	AOFJ0tp4dfPdwVx6xtbBZfSxwIRsO9nzFdFO2ewf9zbsaanbhqgC8AM9eWRPGm2n
	4K4k+eogj+kc+t2F5nNkwR9xmaMXKzfNi2t0wdIAw6RVTViVO5T8DfxVaqIr9qWK
	na8BUQmp9zy6TMKuJ1pgBd2WFa3Q0sgXHSdsRyFv8baE99MiF4vyAAK78VuqhYAN
	Q5COHg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kcttg49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 15:24:51 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-61002acc895so948886137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 08:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778167490; x=1778772290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BmKkWNysoQOkzQVu0/HpO6GRxwgi9ndXDewfJyYIvjs=;
        b=Ww/ZppNlaLFL0EqBmpKzQputg8kT3OWojN7Uhvdi7r/V8ZJ8eiC7qfjreIC0wmNfdG
         tcpUMaMwDm0CeJOvWzXz9qTW1RA1Sk22grbaLzpEA/I6V27sm4qVQDph5MYITjF0fvLh
         QhF1cJ7oYjl1n6bIL2pOJ2SXC7lJUoNox9Gc6DoWeP2xTHqdWiRNG+STKERJMSlpHgqd
         WolNlsgfG91zjsj2M6S6pvT5b8wSGnl9UWpBPP+L+ll9SFoHIT4gIbxUqB2c+DjHT7kP
         ArqKwd52mPUb4Utufn8Jzw89fLUm02NFK9hN0Ro6a8mJZm3cjoopdhnvnq7c+Wt6rpd+
         VvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778167490; x=1778772290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BmKkWNysoQOkzQVu0/HpO6GRxwgi9ndXDewfJyYIvjs=;
        b=S337LVbDF7gkUe8BlT/GZ9Hf+UAIFcu3Gu4t7y6LCjDOuElbXKhgZxdNEcwEmNAsFl
         tQAzXM+2jp0IerOCn34OxkNvUfyopNh9DJus8M4VSsrF7AryecK8HYjJ1He4v60O+I7S
         sLe+JyvO7VrVziOXj5d5oilUWMZ7ri+CWkd758xIdlYxQLTJmKFuXXyJus7jqFmkUuRO
         3kj7raTDkwNT0fTxOLjR33CvnyJPoNvyxoy89WIAs8h1e5IEcDyO112yCGZ2OBCZkQ8I
         LT7Lw724svwYTFfDny+lLXuNNmFYC7jXx5OYo2nzm1w5IzqvsQ2tdQXWRmvgV/DKC65H
         D4dg==
X-Forwarded-Encrypted: i=1; AFNElJ/ezsGWnMukayM+ig/xecskAukQAplqdWo1yD65YrZqV038XpVGbKkM39PPb8jXR1gJPyGdNl2TT2HrwUkq@vger.kernel.org
X-Gm-Message-State: AOJu0YzOtA2E0mSLV6vX7KaV7tK+hRPuz780Q4LIBanyAl2VbgDHiwtX
	obIfyE1cvT0PMl7q0VsMIBNYfSMyn7Kx91eLgBXIVyUP6Kdc0x3PWcpkm+aF9RF5bhnxboysj8i
	/pPcoIUBR4BfxfhDNFhe2MB2nf9TWU7/ioo/HEMOHEfGeD5TJXhp2ihTsJeZKjOOzeHmM
X-Gm-Gg: AeBDieuOMi8QddA9Pj4X6wXz9V1vKGqKDGj6PscoDeP+zVJUCyB/D157vJJvgZXCZi+
	09hI2iqdBWqwcS1CCadZtSmpRkOIQsOCJzuUp4VD23iPqbZMT8Ko8ZDq6LZ19moBGwH/bxVhgq4
	fquyr7UMpJN8IE3vCci5lWpaw68oWZUeOg6VEZEk5qDgqRo9BEzfEhVZfc8ldCitOlLOOstn7t9
	HU4uySKIwjkJiF6Tb2nrrd5z4uH1+D5q0ghW1KZskrUJkreBwqdtbN7iAbQ9/JiHsnukKTeYm0x
	cqEVKvwSXOth3c0gRB7P5Q7fNWP7T+kpH2KmInZAzmfC5cVvoPamrbY+9leMB4zPcOSrJy2aJMV
	Npr9BnXkc69Ku5xrjJF883J8CBEn3BXmQnRavHu/6eCbJUJNT0bFmJvv+qDRcazYo/vX3s8qWwT
	pM9CWr1Lr1ca6oS1iHdnvsay9bE6M=
X-Received: by 2002:a05:6122:3a06:b0:56b:8e1c:582d with SMTP id 71dfb90a1353d-5755974b78emr4681449e0c.14.1778167490359;
        Thu, 07 May 2026 08:24:50 -0700 (PDT)
X-Received: by 2002:a05:6122:3a06:b0:56b:8e1c:582d with SMTP id 71dfb90a1353d-5755974b78emr4681359e0c.14.1778167489785;
        Thu, 07 May 2026 08:24:49 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bca583dd7e4sm240966b.58.2026.05.07.08.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:24:49 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 07 May 2026 17:24:37 +0200
Subject: [PATCH v2 2/8] dt-bindings: net: wireless: qcom,ath10k: Add NVMEM
 MAC address cell
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-block-as-nvmem-v2-2-bf17edd5134e@oss.qualcomm.com>
References: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com>
In-Reply-To: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fcaec3 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: S1_cPgyUEQAU4bZ3Wp48b3lq2ijPY70T
X-Proofpoint-ORIG-GUID: S1_cPgyUEQAU4bZ3Wp48b3lq2ijPY70T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE1NCBTYWx0ZWRfX9EkOL881SlCk
 8vRtVWeXdEMkuxosTUx5FSSQCUN9USDjHDjwjkTh8HpHxBXF2fQO2zkkBYROy8J8Rv3k6dGa5OT
 RfV+P2IutH79qj1rpY8AQtAbnA010vIO9LomdNS4sfwbzkBNR9xNJMxV2ZCpw+eK3HjVXDa8vWJ
 Yx+4UYgmM77v5rtxTEidhsxmKkgNlrw+oEbKc+M461vOHi6CP0ibNWklkKi3Lm2BrWCYHHCV+Tb
 SMSdRQE+AdajR4N6Ox5Oi0t/D1bO9EmyH1LI0YK/eNTVNGK3d5kBlhGDeWRDzphUZUL8ujwyntG
 95hcUCfJ2cw44Qxkb8f35H2lGvTwrKQ+HLZA7X0JQu0W9hyByqoGnhMbd8eqbiya0M/499/w9UL
 vlzyg2Wr4ubVgGYuH3fQqg9Vzfr3762pVOwdFo5p9QihjL1nCtm1jFGqsNIcgfLwklUzFhujMGg
 RFGJ0IMeCHKhXaNYqdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070154
X-Rspamd-Queue-Id: BD6704EAF99
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106463-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for an NVMEM cell provider with the standard "mac-address"
cell name. This allows the ath10k device to retrieve its MAC address
from non-volatile storage such as an EEPROM or an eMMC partition.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index c21d66c7cd558ab792524be9afec8b79272d1c87..96e025cd1e3acacf3da270ed43955b0d6acdb7de 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -92,6 +92,15 @@ properties:
 
   ieee80211-freq-limit: true
 
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Nvmem data cell that contains a 6 byte MAC address with the most
+      significant byte first (big-endian).
+
+  nvmem-cell-names:
+    const: mac-address
+
   qcom,calibration-data:
     $ref: /schemas/types.yaml#/definitions/uint8-array
     description:

-- 
2.34.1


