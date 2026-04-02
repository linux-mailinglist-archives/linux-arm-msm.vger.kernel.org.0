Return-Path: <linux-arm-msm+bounces-101536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHcdKZhYzmkxnAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 13:52:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F34F3889AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 13:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB74630B1580
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 11:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522AA3DF002;
	Thu,  2 Apr 2026 11:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1/5sBr6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kEpsS+7B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86193DCDA9
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 11:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775130339; cv=none; b=HQOk5hreuj6A8ynFXoBEBj/p6KWaCRIEEIgWdBLko+1GR0t8jLi6kGyEZ9bq7/XbgUp0f5iSSmAWx7B5TeHDCwf/iil/59JReNwewxNZJYU6iB7+3fHMQs5y2LiwUipIIsB+nyHgggxgLApJ2OhGy5GlaPmyopjcOUHOY4bVtpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775130339; c=relaxed/simple;
	bh=yFoXFf2bQiJ8Irz9zLQs16efGTfbjry6Zus7oX6VYmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HS5crnL6BteZ2gySKwF2PLVscNxjXqX/lwqcM3+5290w6hAknMACY4d2G4DN+bSfmz34GFhCWtlFA7oBQU0GhbTl/iA1pDsLRew4+kiO1Xz1g2NCAvf6Z+azBpZrKE0v42u0Mi41jJJz5c0B0y+m+8i65j8iruP+uf1NOjrbF34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1/5sBr6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kEpsS+7B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6328RpNu351761
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 11:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tIG2xvgV6IOKPVH2TH1vWUTW9m8rqa2zF9dGwt1d/yA=; b=J1/5sBr6sjQAQF1X
	a74cXMFfGzuJXqIcuemsfPTNjbaEwTExshOiHrevNl+epT++eRB9XzYP2Pd2AzGW
	7uZefAHjQ8VXwOXH+4Lk367UUI1J2XccH4TVoeaDLRlX/7bhczEYqhYKdEfr/g0q
	f2fEdqPVMidG7B+qPBprWzApv6vuJU2g59X3yO49wFLIssDZp6VHjH/ZV8sxm2YV
	Hem+4GxmUHGPd7YdnJo6hmdudA6eH6Vk4S7woTWCk5MZ8Lo57MBq77jIEsaPJnDe
	k3uJHr7rjQx4nmQjlYPmsbWwCO1M7wkecOgMjmoyUZWhAi6PC0qHa35tLa1CtEz4
	3jk/fQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9myh8s3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 11:45:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4031b86dso26152281cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 04:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775130328; x=1775735128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tIG2xvgV6IOKPVH2TH1vWUTW9m8rqa2zF9dGwt1d/yA=;
        b=kEpsS+7ByvfqsnLt9gJHeVmUUZ9p96eeWBqnng+pw5w1G4AZdfvIyKLGHHSiT0Fyah
         OsUj2uB1WPIopmGUF9UAejYsA33jUFB4NVna32+cHkOoTtt+RCpwe1up27j85eI7/aU0
         pg6Q1bqd0ADcCC8ZRqjvt05eGpXRK0mEpur/mTDf8C4DHxKBs+kWuNYf4mzKSp50+wKD
         h3cBJVlpCpB4Hw+w3n/lFqnnflezqbytWKP4b66Ip6eL2BsgRrJFWlQ7F+rES8Oi8Xka
         MbTv6rwKPKyb+PIsGBUgBUJGCgQ3L/NpHvWVFDbinzVaW4X1x4nXta/Akz/JC2RBS9C9
         SuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775130328; x=1775735128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tIG2xvgV6IOKPVH2TH1vWUTW9m8rqa2zF9dGwt1d/yA=;
        b=SNCCaUTuJ7nMgMxyaHd9RpZYPatjlo4wKOS+s44GXxJWecEXiISNL6JK9mJQWe7BS5
         QhbEh4ORgwUi1WVhGUDiSneCfa90jMIF/O6dOzrST6ktdNSwLqclaF8ZVsRoWxhorTUz
         oVftBZB34XdFFc1Hy4dXsYFdDeUKoJA8ghDYh83Mw8OOkk5dWZ3jLL1OwNE18U2YyTj8
         4UiDe8+hvicgMmoSivpsEgTx66pNjcYVyk84oLTcHKQNX0ULNwe+7Q3PPf+W1s5mpIEl
         aE1cY7ve4X1MUwz/a2pGIgEv0Ow+4DNGAi+GOZ5R+GYlr/BryXedNKKCQJabKzvrrPF6
         +khw==
X-Gm-Message-State: AOJu0YxxM3qydml69ZZ9iHu9Er7RTifNE7u1vy6k4vrYWI7lYFUa3UOk
	t7ERtq2BHeCfAi7i9lSTm44tqdWsp20k3gbP37QGhCdOt1L4GkUmiHrCTSK0X5y0GGM+gIZASNT
	EnsYpamSLo6uTUGrWr06trGYGXAmUqL37PmqHROEPScqFxhopOQHDABO5Y3rF8zSw99wL
X-Gm-Gg: ATEYQzxIj2Q/sNpJa/TEJ6IPWMevtuwON6q+Sq0pQjWlDFrWcubhn7LsHjRpOlAMNF1
	9ZICyF4sorZi4DLQyrWBfZvl8Y3aF9Vk/ci8Qx8FX9Kno1XSv1PEk5hmD7PO1lIxvF772kBRgtI
	uHsilZOzsmN9EnvjyVdlMC/RUfaJgfwCkgiHBvr8oTjZqxScnpIpXXzXAKpwswkeMjCxLsEBasI
	EfH1Upi8Nu99yzu1pT2k5vOT8m29iz74HfpnN+ZiDXgP3plyjkJQwUa+vpZ6FE821jkwqfpKZ2p
	Kjp+/ftlx66mPDFpD59flko+zRM+Clf2FjiM+g+5OaT+49dZpKuai9W2wWo+VARQO5j2N7gPe6k
	1cDZqgKySLWwcUu4iHpy9ZRro6hXAQRWDA5O8yv/onWzq
X-Received: by 2002:a05:622a:134e:b0:506:a289:fd3c with SMTP id d75a77b69052e-50d3bba7d2cmr94103071cf.17.1775130327592;
        Thu, 02 Apr 2026 04:45:27 -0700 (PDT)
X-Received: by 2002:a05:622a:134e:b0:506:a289:fd3c with SMTP id d75a77b69052e-50d3bba7d2cmr94102661cf.17.1775130327185;
        Thu, 02 Apr 2026 04:45:27 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a567bfasm141614635e9.0.2026.04.02.04.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 04:45:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 13:45:12 +0200
Subject: [PATCH 1/7] dt-bindings: display/msm: dp-controller: Correct
 SM8650 IO range
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-dts-qcom-display-regs-v1-1-daa54ab448a3@oss.qualcomm.com>
References: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
In-Reply-To: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yFoXFf2bQiJ8Irz9zLQs16efGTfbjry6Zus7oX6VYmk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpzlbMhaJlM5JSVwMAALvqVmHKm9lLQ7xjs1HiS
 iEBdOIN3+WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCac5WzAAKCRDBN2bmhouD
 1zPED/9uDSc7TddNfSBSa5SWFEv/4EVT6Qmk3soyDZgCj6SzW/PH7ZIfz+9wOXzTvM9FhVf1ldI
 D94hrE1cMkDDPMS+wezFoGs8zkRtjW1eVjTafmWZqAepC4s7tEyG/cHDX3hQkB/yBqtl7SiBCPi
 3tHpZfK3T6LmZdF6sgiEnF8aROykBqJT7yn8dCz9uxl2oFjsT0YLu7dpc8B1uzPXmvnp/0YChxm
 zs9p5cHFj9g6FiOK68HbbZcECHWqSyRa4zfankyNOLiA7G80PoSEW+lGRCOEL5DonyvndapfTuC
 p/TUUsoxvNOE7pjVPQobYRY32aI2Vh8Agq1uF7QzoEic8hN+2J/gj7//dN29ilh7oagIms2zMNo
 Z0bkqJWwlN1ftBk/vB02aQJGPNZlXg+RQ1pBmbMq/8n7wL04Xt3Bhob2xgU/zCNLAVEIACYV5hN
 c6XDSCH+v93rmL4NgOZVqyOMiFfRxTKaUrXUOuH2vwzgxgUfHPqki8uW86ZuBc/XX/73ZBXuY7l
 j1rRXwIgWTwtrXcmc8zqOlq4F9Xys5AbXmUN3VjdXzUw6NDSTFy7kJ78IBO1sSqKGksZEgq60Ta
 nVqCTZDsVNAdh0DSTp0gNbgmF2HT0FoSqUhqZ+jbi+dg8VvnQjcC8szOYr9lXc97QTpdR6KOL/c
 d5OT0KoOM2N4xTQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 0sfESX_YDOCokC5ZYYs_TaAlIf5rgmn4
X-Proofpoint-ORIG-GUID: 0sfESX_YDOCokC5ZYYs_TaAlIf5rgmn4
X-Authority-Analysis: v=2.4 cv=JII2csKb c=1 sm=1 tr=0 ts=69ce56d8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=LQzgrBLVQjxtG0neiToA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEwNSBTYWx0ZWRfX8W9fUhJyUyIR
 C3v/imhm8MZfx9gzKkq9QKyT6vExPHG323Bzyj5IXI5vgUMp8/FaEd/kt6XRSGAykJbvGRun1bc
 Vksmo/yzbeug+V3+cFL1v1dQpKe+8/Cq5CdT+yy679G7iLbSIubW4yW/Mrwzm8QWHYiesVPRNgm
 SjYd3V2Cy6KoWVCjlIJNoNGTQPGjMJyguk1wbdo+vcgDa9FC+YGBcb9/w//jDq5GZ56qOReAjYL
 MmmNlAlczItggX5AjsetHkvxNHfHEWnawwc/4X6lCAYNtTHl6UCOcXx+0kv0hKQyJTKzyyaDhjh
 KSfQCeqU0SkBKK/YYjSOh4lo5m+kOndMHf7hiJcObzOd3EqLmR7HDL/94hiFJlLn72LmOeWLTJU
 CNqHkAawP3a5j1vuAZEAR9tG6J2VFTlxAAfy1xXhPlNP8QiY55b83riMzlZiQjwJ4pTVF/7eF8I
 mzIo0mBMtKU/DQdkSSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020105
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101536-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1F34F3889AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DP on Qualcomm SM8650 come with nine address ranges, so describe the
remaining ones as optional to keep ABI backwards compatible.  Driver
also does not need them to operate correctly.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/display/msm/dp-controller.yaml           | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 8239adb7f7d3..e4f17d29343b 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -277,7 +277,6 @@ allOf:
               - qcom,sc8180x-dp
               - qcom,sdm845-dp
               - qcom,sm8350-dp
-              - qcom,sm8650-dp
     then:
       properties:
         reg:
@@ -290,6 +289,24 @@ allOf:
           minItems: 6
           maxItems: 6
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8650-dp
+    then:
+      properties:
+        reg:
+          minItems: 5
+          maxItems: 9
+        clocks:
+          minItems: 6
+          maxItems: 6
+        clocks-names:
+          minItems: 6
+          maxItems: 6
+
   - if:
       properties:
         compatible:

-- 
2.51.0


