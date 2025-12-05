Return-Path: <linux-arm-msm+bounces-84418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EE9CA63B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 07:33:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7FF83124574
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 06:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E87E2F361B;
	Fri,  5 Dec 2025 06:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ECUyuHV5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hgHpz9IS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81662E62A4
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 06:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764916313; cv=none; b=T5UzmAMpoqLaX4ZIfEH0bhy3qyWfjBd4HAmI8O6LEth4Lu5uMjjFoWyyOpBbugK921kwM+Im/Kal+COPtWZx7Ecg8pLC1n2In9TeZcsBjPGYysRNiiPJhiv5k+BfojSVkqyv+MpB2tphFt6BXG0NO/DmNuc4jrvM8cY8IVRZ92c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764916313; c=relaxed/simple;
	bh=UraQRW0HxMz552nMZZUEOzDqeHa7MsNxPseKkAxEQ1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UerxabkDHi5yxJAHqveCU0/5gbVZBbDkIKYxSgL3xJ2usqmWEHoN+gkrhzSi8/X07iErdurPTHI8p+BmVIpMLpYUIJIXjgC6ESDk7tRHiCKu2zQFnPz5FpmCVzMLbgJZnPp2fN9kBlmSoyeGSSe7ukst6D6OuzZYRCFDvOnqsMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ECUyuHV5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hgHpz9IS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4N5dKV2299106
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 06:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v5IfNS+DNYTu2kOs5OLgHjhbpAMzsb8tTPKNH84lgX0=; b=ECUyuHV5VdPy3ey6
	FnXiiuuVY0ufFjH6tHVDxgD1M9Q6zxyZN5QeJIyoC+rA1ivNwXEduelkaSOT0zT1
	XfCb1MDSDVbjxnWS+ipRlPPOQ62Fd7dOaDkuD+ZK/REBZpCMNmELXbDKLSu4cygQ
	oxeezjO+wU7dLrKy0sbLbNC1I4iKm756qdgTQqfGSmnEVeS2JAFbZhBDY0DqIMqN
	RgvXMMkZe8ClLB6/Re2I944dF6AUrO+ovZOnrAiFGsIGO4u416LHxBYSFd7b1K1R
	JaGdiitnTMMHroMv7ZTwAkRCKfzONiacSpZFrAFYNAG0DeDmAXlEMbgoezehTspX
	qLcIqw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auknf8y6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 06:31:50 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7c7599be25cso3280368a34.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 22:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764916310; x=1765521110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v5IfNS+DNYTu2kOs5OLgHjhbpAMzsb8tTPKNH84lgX0=;
        b=hgHpz9ISZPwQ4x7pD2R4BcHY0jwnPfWJ4+aZSdhQnNRnCDErAi891+wfU+an+j1xkv
         VxzYXEWoHzScn2jOp4lhdaa2Vkv7yBXvbgeuy1MpDOSwoia62G7BUcDeUzwvv3YwJI3H
         wEqn/IXISe2YhQ3CN7uIa+1CrlmuBYMAa/OvSZ+yXwwx6uZxHYl3m/99HKW67GOKuPrH
         gFj8Mp5nFOl2/NTN70ChPGYgA13mvn8r6QoYqj8pB3nB/8xLQq99oHQzBj2hukwohoGE
         d+gOmO/PqqxITEpBgxasWgCZ+YLRxQNW8eK0DbtAQjTL/tIFOPmMN8B1WzSlXUB5NLHn
         /5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764916310; x=1765521110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v5IfNS+DNYTu2kOs5OLgHjhbpAMzsb8tTPKNH84lgX0=;
        b=dizWja8kFgOJvrDdmQJHL5TqZ0sX69rn0LeF36CfLM85A0QfsbbQ0hDt4hgVXAIk+a
         pHKbrjmIuptnUwPAqfWUC/yOwTZqVVx25Bo0vIsTEC0XLkFPC18qkTN7vYxfUcpBo2+W
         U9ozGX/GszG7StfHlXcxi4apONRSAPsMef75Sq5JHGQI58u2yIkN+99HokThiEccY3GZ
         TlTIwX29rijOtFfHDdQ4fDyWRMoNPtHeeJBQ6Iew3PF7HooSHtBTUZxNpdq0YR+ZM6I1
         FD8w5eMTWJPH/jQGk90GuV5TCr78FKrnimpBEWsAUWWMfGo/JLreBBTARGiRQgJAxTbr
         29ww==
X-Forwarded-Encrypted: i=1; AJvYcCXNSJXWqGzz6vTNwMXHb0m6m65rbaBNtVXRe3Ih34ET1n2avemT4ah/PNM6B2uvf1NOPB3dZk9n53Jv8gBS@vger.kernel.org
X-Gm-Message-State: AOJu0YyADwCWmkRHmXq5e871vPPkJ8CqRPgSean6mh0Bdmw+xPK9bhPu
	2FKHTTL3a6MQ10tVVrzojabPqNFrQ+Nn1pdBfERokAVsZ152MsCrz/oqg9ZdNf/GYlnEFarXIiC
	mGpPQnuWR28tTjefVlj5rsXpLNE92h9ty0+yrOZRj/EXrYJRK6qMYyzyr5i4IYtEqtIN5
X-Gm-Gg: ASbGncuKcNlfs1jqugePbiLn3LYIPE0p+oA45Gyv3zpSsOYhgED7f35vtxlApJd0CkX
	0kKMK4zpGUMl6TVYYqFkaSnzHAJTzXxBgQvumZkQIFy2gjxuVYV4X2ae/Q4ffy4m0QWepMYC7sm
	Fp7qBV2fdmcM4MzK35YHjVRnZcPT08e4rnf2MoMHJyP1E5uHpvi3icECVXKjhnwSjGKCXMTfJtG
	MXpoNRGGxtb01avDGMkoASoLuuaz5YcVbzewiHLfnKpnQZ/DQ6hlTTb1m761JgtBYsfterfH3n1
	UhUBqArs6UVOFVQjXJ/yVnsQ0BFwz39FydOZ8b4P3Sk35X2Tx7pFKGRA7uMg8lAqdNqRWoSapKX
	LIjc8FYBXdf965nidLG8/t4ODkuWK2XhLKo6O2R2+8LEsabMjXOaEyvumahci
X-Received: by 2002:a05:6830:4121:b0:7c7:69d9:d8d3 with SMTP id 46e09a7af769-7c958b14598mr3621427a34.12.1764916310223;
        Thu, 04 Dec 2025 22:31:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmcoFse4hqn7sciuWhsZTMSS0ff1gERNKC989dNHJAgTQduOQUG2UOm0Wwy+zIzf23XkmdmQ==
X-Received: by 2002:a05:6830:4121:b0:7c7:69d9:d8d3 with SMTP id 46e09a7af769-7c958b14598mr3621410a34.12.1764916309854;
        Thu, 04 Dec 2025 22:31:49 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c95a8f85e7sm3223326a34.4.2025.12.04.22.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 22:31:49 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 04 Dec 2025 22:31:19 -0800
Subject: [PATCH v2 1/5] dt-bindings: arm: qcom: Document Kaanapali SoC and
 its reference boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-knp-dts-v2-1-596d8398c6d3@oss.qualcomm.com>
References: <20251204-knp-dts-v2-0-596d8398c6d3@oss.qualcomm.com>
In-Reply-To: <20251204-knp-dts-v2-0-596d8398c6d3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764916306; l=903;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=UraQRW0HxMz552nMZZUEOzDqeHa7MsNxPseKkAxEQ1E=;
 b=ZK8qvLLUrljEKOqNUSG/MHlaBHc2LNKUPtJKSnruONL790Y+44rc6hFkZ3yOEelNXnOE44tJy
 7qbgbliPoaNApOB4FznF1k22EII5ye6ET7jXOpaES4Bw0uLoa1I14Io
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA0MyBTYWx0ZWRfX5GzFvXvo2Jbz
 RL3EWMDfo2cmQqWWqqjENEv+99cj6EyNajYC8X2KUmu/P6ekbCu0E53sTJXaHe2C4cG3RjbhSXF
 f0mV6j584Ekb6W5fxWWAwWRehVSxEQz4yK+GqH8y7YyUOB5iPsMN/X0BQy3bEbL7T9bbt4HIP4o
 4osbzXlLHyunM+rhEg0cIBdn4Bl3l1P9XRNy1/wNVsSu+owp+sxJNIMoxNXyk/nuDFRhAokYAXt
 mkczJtNQW7vdgIrl2OU85B5MokiHMdUTEVe24k8kWAdJMYph29gmEUEJtOobahmIdsxz3dhLfxq
 nrxizxsHPZSlcPxPBYU97p4oyjBfcxbrnl1Wc92V6i3nmFXAXeLQkR4qwq2UUP4QXAo0uc3XrIU
 y0AtVeOOTSNum0RHFxZ3tRfykLrLLg==
X-Authority-Analysis: v=2.4 cv=P/Y3RyAu c=1 sm=1 tr=0 ts=69327c56 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8VIqy9Yext5eKz7IjugA:9
 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: qfNqaSHePZRznY-fiz6OXXPfKDljG7Yk
X-Proofpoint-ORIG-GUID: qfNqaSHePZRznY-fiz6OXXPfKDljG7Yk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050043

Document the Kaanapali SoC binding and the boards which use it.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..da287cc9119b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -327,6 +327,12 @@ properties:
               - qcom,ipq9574-ap-al02-c9
           - const: qcom,ipq9574
 
+      - items:
+          - enum:
+              - qcom,kaanapali-mtp
+              - qcom,kaanapali-qrd
+          - const: qcom,kaanapali
+
       - description: Sierra Wireless MangOH Green with WP8548 Module
         items:
           - const: swir,mangoh-green-wp8548

-- 
2.25.1


