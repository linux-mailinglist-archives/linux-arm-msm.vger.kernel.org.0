Return-Path: <linux-arm-msm+bounces-109893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKPPGNLUFWrRcgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 19:13:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8875DA6EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 19:13:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2BE64301F803
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83241405872;
	Tue, 26 May 2026 17:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JPII2p9y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eg7Z6HOL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C673FFAA2
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815587; cv=none; b=j6bNFzVx6lPmbuORQY/gRs0zixjXRiPLGiFXGjxfqWC5/MYFlBzfp3Qt1z3efa7ZlW7oA4bNacb8SwvD9EgWnW8D+wSL705NEjlgDz1i4Lh6bPnaf6B803fxM/hgcfAWNQ3Ig7e/x70FQODZc6mXIXyM50Rj+EKGcI2damfdrTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815587; c=relaxed/simple;
	bh=dcopeyyySnOd9fL3v2swYiTB5ACAPgg1PSgm14bzBCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tWNMtQ8Vrr5PEw+36LIduVA8O0ihteFH8KvM0BAZ/GwXNgK86uf778Bw75SWbiIi6vcUEkPIxOQ+7vmLoahollG5ak0loHu5LeByTSXTCa3H/meuDRMLLAAf1Us17STNzUEOk6l5MAXIdae5YTidufETZ99vn3msh/BzMVyah4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JPII2p9y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eg7Z6HOL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH12nV1752103
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6gMLM31lPewnCBaPI066p1pgy4In0RFum6QqFLaJ934=; b=JPII2p9yDr0AgFhE
	gBA7YeCXlr5AHJCIhlRaxmhzdJnXkug+hm7a7F9h/Tf+lgA8VF/w3obLVxis9HGY
	0P4pbPDPFA/Tx8G6yojWiFBpoKeGvduw/2WyjQw1/NMjq9dQGReyssObJwHfpcyE
	a1CxhObFWf9SYjmpKamTyOaKdCSzz5a5XjHDz4Oiz7ftccM+SuKrVWOHRMpPJMNt
	iIkO9Mi9KVhGOlMPjsWnL0R9ByMb9m6zSJ7gRM3Wrt/RfIBReADm4HnKQdrnwq5B
	lMmxAc8hPgh0PXlJtN2I0OsrpQuQ0W0knSD5VbJ6Huw357w0GaGAUpLMd2KKUauO
	N6yvRA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edd5ngu7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:13:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c827bda3052so14774870a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815584; x=1780420384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6gMLM31lPewnCBaPI066p1pgy4In0RFum6QqFLaJ934=;
        b=eg7Z6HOL/ZnsnLocQDsUOwFDxh6IoYGNWBcOnOq3piu6jPnrmvXoabamfyL4olXagi
         7sEXIqObYpbFujC/UWpXRexFbG6GscHNk6t+ZjtrdSIgDg6MZTQfsl4NJ/YLE13IG9Ry
         HtfvrOsRXGyrosOxhJJqV8Hl0F0irr8QFAvQGBAsRkS2nqimzmCDiP9PRTsy/2upbnjn
         m3o1sjx5d5mU+ibwkf801p+6o+vl3olDu4rS2kHl2FTMx4z2kcDnfkVbZrur9C+H7e4/
         Vk70sVlLUNaWWpnaW88GPsgFH8aS+in7Fy3balf757PzaYzB+gAuhiPfNIyqEpNHsZ4U
         J+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815584; x=1780420384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6gMLM31lPewnCBaPI066p1pgy4In0RFum6QqFLaJ934=;
        b=Svd658l45HkfvW2l2xVkrjzKm85pSt7Va+A9KfGqBZewM9AnBsUbdLV5OAIZ/0qr+r
         A6Tw9hgIQdfh7TZ6wiQa5LFbllktS8BdDz/AUnB/PQ0+AQ/V/yiSzihB7UIO7x1rzBL2
         6e8OPv+F2g8eaPfDP6/XsOAbJ+sj1f/JfPMVfV5pgN762Wk0aa7YNEn+zeQIPqMEO2Bc
         Ev8FKNvUu3GR7iHIAQGHoJMLvi0bSFJLLbqFqAtpa/0psj51B/imESacvxXglhgGKSRa
         +E2czqw2ym1BEXfAi7+It3nYvu9M9Ja/ZRKn3GH9o1vzWfD1Y6n2ZkhmdpoanQjm88J/
         7B7Q==
X-Gm-Message-State: AOJu0YxVtZTnixg3vfBYIDOIeGvRY5T9i4s+MMlGrLi/7GxLX/Vi0RDt
	DDMd/jjuChh1yPbMgI5/RUAekH1uaRmb3Q+LPt0JwocdrS63IAqSq8RO79NLDNKhQvqM54YcwyG
	48k+qLBC8hUph1q5gN8/uvyMGpJS9HIehbh37Qq3JM6OX63lakEEVay7M2ddu24R4kg/1
X-Gm-Gg: Acq92OHiEJU8ZYK0HFHA2+5NQ3ErfHClTAl+SQiU5OoTwdJBv7Hc/GJu4WGIvb1gtek
	VeCZ1YTREVDkvkxqMPMuW1IFeej17UIwEV0X3L/ifOv3bIVkaapWo0yOh+l7x1VVI02kG8EVI8W
	/yV5tkVZKd5Ul0PXw/0I6zoPJsLwodQ3MNhAjUknSy4YBBTtw+oDksJkEn4t6IhRlH1J3YPmJag
	xsK+mesisnnjYA7YMASACCh4GbGuv3rOizA4o3d1s+XqXomlYEgsGl739KQkS4GUlB6ULQCAkef
	gNgP4FcRco8tGatPGGLE3B22syObJe1gz9Oyavxuo/xB09n+bMfbD0voZsX4vd2Xl67biaznvr0
	rOKZNNO9R505EeCVmvDqDbcH/Kp3Z1DYLlYBFHOZNtOrB1l1uDo86
X-Received: by 2002:a05:6a00:3010:b0:82f:355a:857e with SMTP id d2e1a72fcca58-8415f68c23bmr19307741b3a.47.1779815583684;
        Tue, 26 May 2026 10:13:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:3010:b0:82f:355a:857e with SMTP id d2e1a72fcca58-8415f68c23bmr19307714b3a.47.1779815583182;
        Tue, 26 May 2026 10:13:03 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm15736235b3a.60.2026.05.26.10.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:13:02 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 26 May 2026 22:42:45 +0530
Subject: [PATCH 1/8] dt-bindings: media: qcom: Add Shikra CAMSS compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-camss-review-v1-1-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: Ar6-BBQi82ivb0bnQGaxmd_I_GoQdMle
X-Authority-Analysis: v=2.4 cv=TZ+mcxQh c=1 sm=1 tr=0 ts=6a15d4a0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=TW5Qit177qQvJ9gbTQAA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Ar6-BBQi82ivb0bnQGaxmd_I_GoQdMle
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfXxihcxxd6+FPW
 lBDXhAMX3jW4qdGObr1XWdgCsi1gfsJolV2AyDE1ZBVDXAt/LlX65seXdaQlnknh86+sMslEl/X
 /M1YlClyrPG/acQ1NA8LZhWfeL3AKfy/mkrvg8G7z2vHXNO9VYJHY0t4kXqEFzIOC8Rc2dZOtoL
 iF39IJy0NjwdhIjAsN9+sdV1JBdYbA3ToXFcMCXb44izPZjzfgzSB3FQ5XNqKQSJF1ShCJ1nt/N
 AE/lOrCpncTUK8iMROJ6V/98e5R6iVhj17xUN0uXEd4IQ5Gwk9gQE6mxlvtrE+Qs2Oa1GatKA9o
 duLJBm35m/1sQxjbBcvTZhLjf5xwmuOgPTsm4n75Kfv0yIFAPXBzuzmYFFQzA4HPE9LJtj8ph0U
 McZFmMQizREMqm0NLrJC7mPlYLYPQLm8U/4+dStLEzevllQ8ex1pQZNcuS2kRp3XSzFmB/nIk+Y
 albI4ovrTG+kTqnRRcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260149
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109893-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qti.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4E8875DA6EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Shikra uses the same CAMSS IP as QCM2290. Extend the existing
qcom,qcm2290-camss binding to add the qcom,shikra-camss compatible
string.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
index 391d0f6f67ef5fdfea31dd3683477561516b1556..7b1469d6a1601413a1a32dc452d7d1fc85aa9eb8 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
@@ -8,13 +8,16 @@ title: Qualcomm QCM2290 Camera Subsystem (CAMSS)
 
 maintainers:
   - Loic Poulain <loic.poulain@oss.qualcomm.com>
+  - Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
 
 description:
   The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss
+    enum:
+      - qcom,qcm2290-camss
+      - qcom,shikra-camss
 
   reg:
     maxItems: 9
@@ -76,6 +79,7 @@ properties:
       - const: sf_mnoc
 
   iommus:
+    minItems: 1
     maxItems: 4
 
   power-domains:

-- 
2.34.1


