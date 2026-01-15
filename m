Return-Path: <linux-arm-msm+bounces-89176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3B6D23967
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 10:35:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A02E131CB3B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 09:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1DB361646;
	Thu, 15 Jan 2026 09:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QcldLNJb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PqWbVObP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189BD35CBAE
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768469317; cv=none; b=QhEKqKvMZBy4WyPDwuYXE0a8C8F3Xdqo+J/i/Z1kMRIZF6g2zu5hFD6Acf2i6H0EnlMYq+T5kcqN3aRItukB/yy+mi4GR/H62EIoeFdJRjBcCkF63Bq++x9JbppbeiW+EdeIpKIVJatP/arEXqxcANSZ92LvXkXDhGd2Otxakxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768469317; c=relaxed/simple;
	bh=vBTkaY/Npgga42VfWKnIrCwOxlm4mmbuvmsSfmLrqoY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cPCLepi+9BtCYaH5IMeAO+GHe1b4r+UtnjIvh7vvgyeZjzQIZJ7WlW2i7qexsNe5vSnLN8dTM9rJ3MdWTS0lCnM/qHe1IiFYTiNXUU+ByxuwQ5VpFmpudDyL7ngVuWIu1N1sxYwBSSV76bcKDHNYBVcrF8qxZffZAeoHzETEfoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QcldLNJb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PqWbVObP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6ffvP1744856
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QjeuQhZUGHp
	7ssTy1dZfeQV909lxdktwUy+qtwp8b3M=; b=QcldLNJbcA3x8cKa9SwsoFvAmIb
	DURT6NGVh0J9YV8wyLaVuXsRfbv+uB9UhvDd5Jyj2sGv2IwirIO9Ya74shLMuqOY
	vpHLGgfWmRj2AAI9o4yjk7Hi872OUy5WlgaXmagW3BdCRa3FY7O90Uf71kxUhknG
	ey9xI/HGBZOQRXpiIGOz5ni6yP8lRG84Y6EeMJeHr9FLi5CTbp33kBzOkwNr4SFp
	sSFp2yrhFFi1SgbQb40StWo/9ktDf+XUVdGKC8KEwCu+ZnsGCN+koRV2xuc5FIvB
	mChvRL+BXDoxA/gZCrYNy51TBhfDW1RbpaL7DlkSfCFE/14oEuXQNs3bu3w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptu2gj4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:28:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a2cff375bso16200546d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 01:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768469313; x=1769074113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjeuQhZUGHp7ssTy1dZfeQV909lxdktwUy+qtwp8b3M=;
        b=PqWbVObP2YS8YUu2lYeNA+p25Aqa0p647zJi2LkK0pL6emqJPG6JH/ct3CQMVAvGOg
         M8toqkdqFRIb9xS3ZpmKFhqR8793B3fIPx3yV9bGfHPka3w6wp1PAhtN3aDeT9h9SSJK
         sFliaW0Bn2njnBIqEXKd5eIHUjTQF+ckQBm0JJYvGNYTERThxAxN5ydmtYVwl7p6P85d
         QUU0+IsSTFAZpjh7X59A65un20LOuE87IQPLPOFBzIAGFO3Mejk+/N1syuTiXpDqnZPH
         MiqojzdXJDxS7l+ddyO/IWbxTii17X2RlqNeXmghsu0dWVKyacgrKi20op0sEWYlEqb4
         Gcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768469313; x=1769074113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QjeuQhZUGHp7ssTy1dZfeQV909lxdktwUy+qtwp8b3M=;
        b=ji1mNiEOHv+GiVSgHh9a1WJmCH3N6a0AhT0lgV7NxDYH80Gv8HJ1n/yMbXyRO9MBmT
         n5v84/IF0X4n5b72ZzQtA+9Ik9dIK3FNZ2nZ0QvFfLtvrjbESNKMcJdBTaaxsDbvSqfq
         d1WeA3j1CujnajcwH6zBzYQX5SG0YQ0j+mgJK+0d4HYqR03h7KVxXnP7qnbnO5du40sb
         Il6n9tNvbZw16lxJq1ON9G2JundkkZ/XhIO0ZJcji6226XmB6nSbp4pwsi2GuyYgdFog
         LlXnG0AGM07Jh1IwwyeBsLkcot2lUAejtSuzAO2oM1bV4RfxF6Rim6yZWNvxgNgZ1MUx
         XCzw==
X-Gm-Message-State: AOJu0YyFmSfLZQPEpDGBkL7Tw046IPf6AkG69JQ7IBk07YSE+a7uCWd7
	4HA9u1UHmokqs/5/e6zH5j+0VzHtURTHxmb8/hzeRttgiTBqsMmvnBaV6ellMihigeuH5Z/Bn9q
	tDyj85nOZIF73+lA/CGqvte+F7ER5ZZXaXCvxzhDqVtQuftYEkk5RG0SsfA9aZAJ+J9HM
X-Gm-Gg: AY/fxX6DR2Ip8ZdncCo4IkjNQvae1rRomm6NKZuBh9Sfj9WILc+LT2fBlzFBfrWL1i/
	PI3YZwllhFg0eR0jwg8G9dkauSkxhi6TVEDOjW/A5JRalcd8yukfkZsY8Z5ldfpPqUdU6+Saqow
	jOcKdUuppIe3uQckILtpbGWhC7kOWeNSIGKs9yRPa1hUoUXSZdOW1FkF99LmogqUYK5192M2u6U
	3+JS6Pv3jfGMUgDjLAEoEF1f1CCwY/oGRj1U1WddsTrFc+iq3lLeUN8N2gYxDY7HnZ/f/BKQjEs
	0EvlAycVR+C+31lW1oJurTuvmlieMzVy6LlcbL4quUyCV7iVsYUdLA4JjyTZMx37ReH+jBP8TaG
	lvXymvJ9dLukD8yuV/hPM/LWp2UpG7zf3Yx/Xx0UbFR/DlmNGlhcZp5PK2Lis3Y3NFLs=
X-Received: by 2002:a05:6214:f62:b0:87d:fc3e:6d9b with SMTP id 6a1803df08f44-8927439bc0fmr83782886d6.42.1768469313234;
        Thu, 15 Jan 2026 01:28:33 -0800 (PST)
X-Received: by 2002:a05:6214:f62:b0:87d:fc3e:6d9b with SMTP id 6a1803df08f44-8927439bc0fmr83782616d6.42.1768469312829;
        Thu, 15 Jan 2026 01:28:32 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-892668a2419sm64388416d6.30.2026.01.15.01.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 01:28:32 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 03/12] dt-bindings: display/msm: dsi-controller-main: Add Kaanapali
Date: Thu, 15 Jan 2026 17:27:40 +0800
Message-Id: <20260115092749.533-4-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
References: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NSBTYWx0ZWRfX/HYYIkvdCKRF
 x3+2uZMbHN3YzBESR1rBDXJVpO34WGHj0W8dp6IHrsbM0sK5xALgvNIXhdZwsXM9ADipUgqz83F
 MBBxj/Ru4HoV03cK7hxJJY4htjfljOkMjF5gpSahwzy8G2uR00FOc3bqmYpondbI89KDJbyXofC
 sCy8tZvjj2p/0HGUh2a9Pldp+kkdBJ8Rqg4fP7wPdXzow3JysdH9QHhyz9Aej5HeeZP4lXmxBFI
 6ervOSdB9XHLN/bMOs7o4ChJsBX2m6BMHu/wiwpveEwZax2v8/VVL4tJBqTRqQlXYh/t368kSsY
 /qxpIDJ5rdnjQSmfbyTmrsZyQOKvizLxWYFy1KIaFA+X3sO0IJufZC5P6IHBKteeg2r6ZUxRD0Y
 mM6ZVDjvLIiZf6prYP/XrqDAcTIcjew6Ii/nJYcdjUzoLoYJM9Vc5P4Wk2tgExH+oLwOuYdTj3V
 qCNR+fYYVY/Nuh2T63Q==
X-Proofpoint-ORIG-GUID: 7Z0EUZuaDmPRmYaYBug8l7ViSm6d8Bu9
X-Authority-Analysis: v=2.4 cv=W6Y1lBWk c=1 sm=1 tr=0 ts=6968b341 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NRHHWUy0EX9jfUzwrTwA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 7Z0EUZuaDmPRmYaYBug8l7ViSm6d8Bu9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150065

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

The DSI registers on the Kaanapali platform differ from those on SM8750.
So add DSI for Kaanapali to compatible these changes.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 6276350e582f..eb6d38dabb08 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -15,6 +15,7 @@ properties:
       - items:
           - enum:
               - qcom,apq8064-dsi-ctrl
+              - qcom,kaanapali-dsi-ctrl
               - qcom,msm8226-dsi-ctrl
               - qcom,msm8916-dsi-ctrl
               - qcom,msm8953-dsi-ctrl
@@ -374,6 +375,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-dsi-ctrl
               - qcom,sm8750-dsi-ctrl
     then:
       properties:
-- 
2.34.1


