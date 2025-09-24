Return-Path: <linux-arm-msm+bounces-74781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E0CB9CB08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73BAD1BC49FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0672C0283;
	Wed, 24 Sep 2025 23:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YhKY6jTw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C028C28E9
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758757448; cv=none; b=cOnITYQcaqXtjI9eoJilk7uXkUvVLDBEf2GPyMOEArcW0kO2HMOZ0w0WADsZWVzkiSSeow4mCLWjvKf8CF8TxTtryvw0GbkkxSiSxtuetuKWjd1PRhbAXEi6VQVLXlKJIr8nyMRMQCUSNlHt9LVWaoXXqW2Dhsu9aCj6AhZ2+HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758757448; c=relaxed/simple;
	bh=+PguNXnKz4shlGzI8jizbctu7QM/1nClTAgxolHd+Xk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q4khBp5eqkz5v1kW26nG2wI+bsrsVOHsNLCHlYG5G/FnvkSSgssl1TqIAvtb5vM0AwzSFtGU8rS5DRmbaw058tN8gKRRMF0yjv2j+C5njh/5jW1BbyPCOKeba9QsPOcB0HXFZAL0qVdC4UwIIAsFtPy3FZoMMSwCe5v74gvYwuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YhKY6jTw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONeKIx027919
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CSmqcMOdgm06/uXCrcq/BO6IeQZcYft2rlSV8w8pItw=; b=YhKY6jTw9TeZlutZ
	iR9yBjg2+XhWYOJ+6ogv8590TAxqEIlxuNKsmyRx0d8JnigOPGQIbntTcvaxPE4D
	OiqGOngCmLKTnrMPUTVYf8Im6IRKmqkfV30Hbh0fEhel/g7LvPbZ30Hg2dJTkZqV
	gQG5Af+BlWc5ZdutP3qujm6ifMd7ortPYmnE9iORa1u0jAuBl7+ZaWkKQqT6U++I
	t/8rTrAu2gce1/FhwgqdJLB/ti++V2+1gMu7ji+02Kz3wbIkCznThLgkrwdqGWCl
	N+zBydCgt61gMsswQ/DP91neaxo+13tyU18eud2x/ypKQW1jKk7FlVqX0rIXmX9p
	6IjLrg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnxdxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:44:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-329dca88b5aso1463108a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758757445; x=1759362245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSmqcMOdgm06/uXCrcq/BO6IeQZcYft2rlSV8w8pItw=;
        b=WkIIl3dHyT0NHS1WOZsjxeCsh/oth+jZeJJP8jSTF7KfbOcpqVTZpouSTs0VjhHfoq
         hltxOVHbZEffgkcAR2MIKP27eFL31LGKQ8JRKjfZ0WplpkLsP11syDfQsqmnsCO89m7t
         Z4BcijKHPx3AdC0lxAJBYq1PyJBaqri+IDG7nToCKhL9WGKpjsLV3YelUuXUAAUrZ9uo
         SgZaPw+mMvXboOcNZ4uTuRp7oavuFrml3y/aAaDa8YQVTeMEJP4ZitakAtrJdy4wiKCi
         QTwocxIyUhHCUVZawEkT+bFXSg/3kQtEFK8IFiRS9PZ6802i/Dhw1fBAf37mpgRfCcxF
         +1Bw==
X-Forwarded-Encrypted: i=1; AJvYcCUTJipJAIPXvMog0d6Ugn6BW+z+1wWVoV9Z1yHcO2nmBWJAH731XfY+k9Oc6FFrFTqW19DYG+PEjSVbt6F1@vger.kernel.org
X-Gm-Message-State: AOJu0YzsZg/1y9WgoK0XILEiwiD0E8xwLXPnVNUhWqOdj0G6LVyUKcBe
	pew9Q1nzGUSOm16I/DVPxq1kEE5mz4RBZT2PoeD8cHJr3tEnQA7bvS8lc0WKxN7LV5qJCxqc7l/
	eI+97MLAIhYq6iCzCNhT9Ilqt4Kx1jGznKAEJgbrEtecMNXxeqINoRQ2u9XToWkMf+FPT
X-Gm-Gg: ASbGnctQL7cjn6UTE1hJVaAC5LGvyMbf20BZa3kjt3ilwADD7yEGBVM6w490HRNm1kH
	THKpPjJcSYR9dzj09augHjloSpJplF497emIhlJH2yxIeKIj67FQgfkYDZ4rATMoZ7HWr9KysMK
	3EHtpHDi2BZv4qW5co8heA1/D+dWYQpaUu3cR7MmEj/PwzNDBAUHw3bfoSu/aI+i7zLsD59pOAh
	u5fmVbrq5+5bib3bEj1dlZJQ/InIzoapC7mHeuAQUuyqNkcCMsY2nqrUTu7Cc2czmHEeUoU1LE6
	qXmaYuMVCoSwidLL/rC2KKntgC9gylbiAL4RpQ/jj3U/IbrimaE29llEffT0HBCaE51QVDvFFbx
	qvHiTd0EFt3K+6c8=
X-Received: by 2002:a17:90b:3911:b0:32b:7d35:a7e6 with SMTP id 98e67ed59e1d1-33456c715d0mr526454a91.18.1758757444486;
        Wed, 24 Sep 2025 16:44:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnbw/R/ieUMgffqkQ9oegzvq9+haEnU55ylejKV2ZmhkVF/1e0/sfHGVVDCgw9SQDnekgoCw==
X-Received: by 2002:a17:90b:3911:b0:32b:7d35:a7e6 with SMTP id 98e67ed59e1d1-33456c715d0mr526428a91.18.1758757444026;
        Wed, 24 Sep 2025 16:44:04 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3347453dc35sm206983a91.16.2025.09.24.16.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:44:03 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:43:53 -0700
Subject: [PATCH v2 1/2] dt-bindings: leds: leds-qcom-lpg: Add support for
 PMH0101 PWM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-pmic-peri-v2-1-32316039db2f@oss.qualcomm.com>
References: <20250924-knp-pmic-peri-v2-0-32316039db2f@oss.qualcomm.com>
In-Reply-To: <20250924-knp-pmic-peri-v2-0-32316039db2f@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757441; l=851;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=QTBiSyI3nJAg71OzCZCRGKakt5nc3BD7jBRfC3qPe0o=;
 b=UbnSeZlbwRc86lY5l6M0xtgXmffAuI7ZX0Bfwmk6rotsBBFqtWTyHuumX2J8C0u0UPn8OdBVN
 eq1+Q8xGDKMBSIM7kbMRSfJcBFUanW8HFHCLLohNvu2m4YTTcdUaouO
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d48245 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=5jWUu6Y50JxcgPCnrowA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: GNi4V_31lPk9i7qa6-_uhd1rqiFIALaT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX3iknD61SK6rQ
 iRdaw0ngwp3a/c05VYN3foBRME2RsYrhdwi6vlDM1dgG8soT+p+UNK+VRrxEJa/QWl/QPwbUkre
 alL4z7KadmhDltuSFo2B+zqgrtwmA7F0Et7YJBXI6S67RhgMsOu5Fk20fwp61lxdPqJziALnhsp
 M+HkiYqLQRnwpVsLoAFqgrWf9K7o8uUIDT8suDVqnbX4rP6GH8IjQ1pIiNpkoN/bi2NSMPP8IfH
 9LvC0REKDgSrZ8tlnsQ/gviWfnhLPz9d/2zBTJZ5fpeqLhcj0530uE5eGKHDxg4An2+/A/mGQr5
 FVsx5ivU8ir0UBxhVH5C7B5YqyJUd9BXKqXK3bJidOicRkKuaG9dLkP1W7muj42N7q+lvGfCyGG
 FNKpWWIb
X-Proofpoint-GUID: GNi4V_31lPk9i7qa6-_uhd1rqiFIALaT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Add support for PMH0101 PWM modules which are compatible with the PM8350c
PWM modules.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
index 841a0229c472..1278152e8eed 100644
--- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
@@ -38,6 +38,7 @@ properties:
       - items:
           - enum:
               - qcom,pm8550-pwm
+              - qcom,pmh0101-pwm
           - const: qcom,pm8350c-pwm
       - items:
           - enum:

-- 
2.25.1


