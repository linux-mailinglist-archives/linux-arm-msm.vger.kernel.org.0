Return-Path: <linux-arm-msm+bounces-85201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC473CBD009
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 09:42:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E8B53031CEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 08:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B1F5329C74;
	Mon, 15 Dec 2025 08:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e39neXgb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eBSuoKWf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA35D32860D
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765788018; cv=none; b=VUgko4Oq7ScaiXnbN5TMjCuqggF/jRTVUVP7icIA05naruuQbjNaO8b4G0Uw/KHsIB0iya6HijuKGDru8Njyt4pKhDAiRcL7PhgJVeZF5qpwp297/VXBzHNwDG3E407SEO+3hrsnuf07AiPl6zkIscst5+b4zVdUVT0RwZtz6Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765788018; c=relaxed/simple;
	bh=JaD7mb6XfRdztIfNyhkMYYOnCv9vI/fjXzhflA1DBYc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AjBv+uR/pV1hO2mLfw7ROWPp/ZGR7Df4FYBCupG0wFnBgK3PY/k+i3gA/N8ZCDxvJOGQfpsuL2tEdsysy/di3gzNQmCxWEhbvRboUcBZXQ40vamtfIMpMjE6HjgzKfXiXG2UP25gdiT9Ok6/AFc7o1dBaJk8Sc/WY+7xymRJogo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e39neXgb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eBSuoKWf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BF0CDPp2996649
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OqlJLDbVw4T
	n78JJhjxStsJzAZqGZdEBuegjg/h0GSI=; b=e39neXgbZS2rDcxHUr4/HLOsedp
	sIzFQ/+TleNw6ZWsGQjK0ZVvJhE+3G3cDIUQx2U+5Onx1lWTp7eSpzjLHa+pRyW6
	Qv7jlWcmV3unqe5f7NS/+GJG4tsTHLfBmm6cOAMnNLRtdBoGlhiKhe3pi2uiL+f6
	sB7G6q50FVntmVe0x7K1fZbHH+hA07q2eNtPEhthhkoC3dZUc3Ervh0NXMVoCmi6
	TEBgpuHhzjU0C00i7wI1PgfRGzGm8+K5FcsMdoZJ1/iNRujpRJb1mMXD5UhITFNR
	9VoAvune1NlQKT9UZ/xXt1fMJRNYAO3IE+99Pii274o9q8m6xmy2W8CZDDw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11c6ku30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:40:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b259f0da04so737689185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 00:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765788012; x=1766392812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqlJLDbVw4Tn78JJhjxStsJzAZqGZdEBuegjg/h0GSI=;
        b=eBSuoKWfeN43G8ZhA5MoM4/ZqRMUkOG8HK96I4sStsz2UnUeaALnTI6YXtTd6Hn2Hi
         oIVoIiTXzZdGV0zPP9n7ne3H85rXx8x6bwhsGtXalTqCXgazEJ/c9pTFhluIwGcEJRkf
         xzMrfrFFYZXtrnauOaIaMc2Mw9TQnzu5u5kWjeP57hZPRd/XaW7PwU1aL+eEBRnUv9rI
         NtQ/hpBYtf4v4/sHOXZAjZ257l4QiF8sVO3pYTiO1rHflx6WnjnG38MHB3191bH5OVp3
         T8W3sgoqEauhyf9miwy/+lCUaKLVMV9SvZ1tD+p/j8ibpDGdl9eZg48NUupccVbAXUUp
         hZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765788012; x=1766392812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OqlJLDbVw4Tn78JJhjxStsJzAZqGZdEBuegjg/h0GSI=;
        b=Z1iULXCs+HS6sADWwesALxyoCZV0IKL7i0bp8XxzgtKeG8Y6AppDHh50n2vWiKv4cG
         4WNEIHaHWxDIVjDtaohhiuSuL1GN7VkSJzoxxRKmTqTlK35ca6l1OiljM+DlvveMPTUv
         sM2sKN3DYWVmQ0b/s+hJPJBQP1DHnSjttgk35Z6xARyWvLTcwoToUFHkDs5zUFUIpwuL
         vtprbz2BC6ZloVBhxWOrMgy4BXAwk4qzOER35uQlXsma0DhpIVyFXC6BolybxJ0qzOVf
         JYoL5cSP7BqMo+Iw5gDKjQWTITdY2jtYSDlHn9Y725MhCrqMQJgOFm8I5fcJKNr/bQy9
         zZMA==
X-Gm-Message-State: AOJu0Yxe8eaUhNiVcpHdj2ygWoYy9drHiZp79K0iI/878JM9un688kAY
	2KR1Y6FlYsOaPrdkyyoJyraY9hvF18W2Wiv7n0DSo7HVQ340yFdhPZd3MMWy9EaePD14PKQyAPB
	MYSdrAJS9YjnD8MkLzHIhjAmCzOnk3f0RGzB7RHM9YDKdwTTcMZ4WLwfkFdqgQdkEwTu2
X-Gm-Gg: AY/fxX5R7NkqXo9FvfLUit9vd9RUFMfRZzFgdJfCmaP6d8LP4cDjYn9CI/7ecvX4qwA
	0u99/LRg+qqN7ygtvGPCbmd+6CR572jVGoRKsSReODcdo5atAIAST0cRDF3WJ7VP7nWilIP2OHl
	O8Zv+E3AreiPQTvJBX1WQetVOOe8obzp9eFBqjB1iGn8cfPtx6lqWBdJTEVPwU7ZiCrp7AyD2LH
	Z1AyRSMzQ9RdOQffa4skzM2SZ/Nx27M2raX/VdJvi4tlWQUxhwzDDMolZ5vASQ5l5dhbsMaUFw6
	PHXqDfN9mYz2Hh9b8zM8FdDWZ5VeKP9sSlvRjC0DEFz4MgYOgKGUBG67gJnHOvVIyj949Y0PP9y
	t70mNtYfkAXKz0gSU/GsuwuGhjaK500UJoKhkHMRtTLF2cDTFipkumU5BPGcv5RaipvI=
X-Received: by 2002:ac8:6a0c:0:b0:4f1:df6f:6399 with SMTP id d75a77b69052e-4f1df6f6fa6mr64921291cf.14.1765788012004;
        Mon, 15 Dec 2025 00:40:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjq6cUNKx8n0oIPZ+dTibjwjdoBvKbVns0jWdiwucSy+EN2FmAkVrey2CIl/19EhkHEWqZXA==
X-Received: by 2002:ac8:6a0c:0:b0:4f1:df6f:6399 with SMTP id d75a77b69052e-4f1df6f6fa6mr64921031cf.14.1765788011576;
        Mon, 15 Dec 2025 00:40:11 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f1bd6b50afsm90557971cf.21.2025.12.15.00.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 00:40:11 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com
Subject: [PATCH v3 03/11] dt-bindings: display/msm: dsi-controller-main: Add Kaanapali
Date: Mon, 15 Dec 2025 16:38:46 +0800
Message-Id: <20251215083854.577-4-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=actsXBot c=1 sm=1 tr=0 ts=693fc96d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NRHHWUy0EX9jfUzwrTwA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 6VYDj3w2aa2iSvIsGaJKaBwTcWiorwtZ
X-Proofpoint-GUID: 6VYDj3w2aa2iSvIsGaJKaBwTcWiorwtZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MSBTYWx0ZWRfX6Jv+je9YFt7F
 LECwVcAX/pID09b6cel7poSMvwk0RlQEDNWx1l2ro/a1WGhZNEHe8l1HxVSpOPee668Ek3B7i8Z
 UHO61hurUx7xlh05wiAQpyvXZyp6//qkwuOmII2ZFxbmGZgEMcVOFQzrkOx9uO81siBA1xAuRyx
 YNz8t+tGa3+jv2CslAyzxfT32koqtGuHR1klmNVzg40A0pWGobDGLryNEQJZtAunQMIei170+Bp
 0Byq1Sup96bqDJuO5vnjuBzYql9xe1I0HuktiuEHw8nLjxIUkbPakHPrp4z25YDcX/zYch+bCss
 kK6FACl16rGG44nkFOwEhAvl3/LnuEwGPXIhxqUH0+Oe2VGO38imuD9eEOkr+/XCdYFjxpk9LzK
 uwxYqeYjFnV+T+qybwBItr/TVR3L7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150071

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

The DSI registers on the Kaanapali platform differ from those on SM8750.
So add DSI for Kaanapali to compatible these changes.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 4400d4cce072..536ebf331828 100644
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
@@ -369,6 +370,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-dsi-ctrl
               - qcom,sm8750-dsi-ctrl
     then:
       properties:
-- 
2.34.1


