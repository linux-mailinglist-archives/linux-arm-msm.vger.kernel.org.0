Return-Path: <linux-arm-msm+bounces-86206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8B2CD5992
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 11:31:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E99203011E87
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA12331A55;
	Mon, 22 Dec 2025 10:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pi+/en7J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CceqoYn5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373B73314CD
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766399084; cv=none; b=r8K2zG60kS8AQqeFS1qBDiqYBQKMT7P6moq7HmFZZLCBEjQWZW69lP6ar/ktC2/zN3aLKfKipfWvhO7w5BPCPJjFTeRvVDhT03vzA7byV9qYBbhIL4nfzJ50c/u5W+R6iBwrYIHdK8riUHeVbBTHVtPUf0JIlhssLZbdpKmvYBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766399084; c=relaxed/simple;
	bh=DFWgyPJMXnYq9tT2E5rWliTY17udrbfSo0iJAuFRiog=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kpPrs3O+4oiIoHvMFYCaWox9bM1gK15q2eCFiEZba+9Ii1Uznn2w1klvJgKndH7knlPS341/2jt225rHbiOnU2kovKt2MavsRKK6rky7InOG4vdd0ad5t9qaJS5URfgfudzwDqvDhwhKMPOhxtOWJuNA6kX2A1Vi86VQ8Wkxje0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pi+/en7J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CceqoYn5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM5gOtj2189859
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NRZ5PDF9RBE
	hUcKxfeiWyFu1TAhirkb+W51QleGLBP4=; b=Pi+/en7JmzqHEhtNNjN4BaO3fVI
	fe0veAIN+Mf3FEVvdd7rpOfCq/qVUbP3MdGY0b3Hyz3lqQ+ppELeEYScJ+N9Naem
	y8c035mmqrlzG0MO8q7aNze91Gdhl5USmnrENYJbtKMnGbzcXS7RvFJROYgIzLR5
	8+yKLZ/ddwBIaCjfaSTO7mkcCTqj1ol9UAozTCuJsGRsquJrTMjngJRHZ96udxwB
	zHk1GKiQk4xSBAi1EdPJtiwrugUI7V1sa7uFm//dFfkI0g5l8cyHmCpW19RI4JNr
	skhmE2l8ggVq4RLLJMCYQrXaBaYoWTwZm0FLU3rzz6/tmO4EBvTDdojdM/w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b702t8ubs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:24:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2ea3d12fcso945585485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 02:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766399081; x=1767003881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRZ5PDF9RBEhUcKxfeiWyFu1TAhirkb+W51QleGLBP4=;
        b=CceqoYn5fiG7mRCXw1WThtDJz3hqQjuOU/1BJ5fsnMnn9MeGS9ZFtgrZUoleHBDUhK
         C43XXzVVeBn8LbA7Swwj2O1WCkMLbyBZ4/QpeWfNQdvSL/Qq4bsEv3eMLnQVceQcxVU+
         NcZAGJ3Zs3wE3+Fjurki2bOViuGB3aZRQlYNWvtDhxpeO585iRNagtzrePGp6boCHFq8
         5y3cXMWkSPcjX6EGmSjmnzegp0rFzXacOZnQKEBclrXlrZHuL7ozwwq/OaFY2s+BR2Ps
         n70gPAnSuCi5BYPxsaSvcqWkGI7E+wwFPwaVrKLFob1kIlChUkKTUjh4qeJyzIZuzLkw
         IuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766399081; x=1767003881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NRZ5PDF9RBEhUcKxfeiWyFu1TAhirkb+W51QleGLBP4=;
        b=repEIi8z7OQ/0avGjAvjFxgWgT0Ou+Y4X4DUUiq9xgRhz7UNM/gHneVjn+KEn+1ccn
         Ca0qVLjBiKPiELgNENhL5UG4qhB+O3wBRXQqvbnH5G5scWEhi8WLMKqI/psQNFjcRF9M
         mdLtFTuFKMop2OGBhscsKXoXfKh10LLcwT8flDo0YvPWQblcpDXmNvh/LHtgfcskpd7Q
         IzbAexdoBH1fybHa1FMA66iLInf/t6E4kfGEHNOqfIose6opL3+kAzYIbdiPQj17gMIx
         hpnkbYo8WNAC7PwZ+df78ycMIhPva6MHe7i3po56PYrCQu5sXxOahNThAZ9AK0JU5REX
         PQOw==
X-Gm-Message-State: AOJu0YwjSO4X7S7xAW4LovDfXSak+VpedYCAWUH/LxG9D0y1JhPgEaUU
	Ry9pYRCUA5NMjuQuoPhb4lBbajW7RbmTmI5QRfPW/ErZHBaiRpmaispGL80FfIhQx3355RJJcqr
	J+OFdxckhiNv1j2FGC3nxtGcC8gB8wji957/UC0+C+0V1OVsKZWZVN4dQRn6QoipoCYWt2OU/bX
	53
X-Gm-Gg: AY/fxX6LEk78/obCOY7IOnNF7pdlJcMBqcNKDkU1qTVQgjooprwQYcHve2HMFemARcE
	ZAZZS6YzLzHa/6U6Oi+etFl1G7Eep0KbxzP/wx3oVgGfTVUDjzLpMOwKu/n8dKEq5NI6bx6QdLI
	fsNIgRIrPmbzFiBHATCC1Hlr4FvGwO4OozUPW6d93D16HDSBylhfGTp4CjObVioKQElwK6Hn2A/
	7FQpyKW3wAqAKqqPeW7ISJf33Bu1Fqc2TyjJWcJIpxr1KUnn/ZGo96G3ZU3rfnUyDpMApgECL3C
	AgNxDZj8ysue3mJdltWMoaRwvX7NFFmoWG0KiIfGeyCII0YAfQjao51ytvb1ptrM8j7Mzk1yDNY
	HzcTddk43ZcZBoIfl9FZOAF75XiqEcXcjjr+KL8rBjPoo2sjqr0ax5RIi/xSkkb+gBMM=
X-Received: by 2002:a05:622a:652:b0:4ed:b94c:774a with SMTP id d75a77b69052e-4f4abcd2a19mr170343681cf.5.1766399081236;
        Mon, 22 Dec 2025 02:24:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElR4leQwKpUsE2f94dJm6zAV38uLrNz/vxGBS2C6iTgg7iedIsxM/lTMmm2L260FRmeEi26Q==
X-Received: by 2002:a05:622a:652:b0:4ed:b94c:774a with SMTP id d75a77b69052e-4f4abcd2a19mr170343561cf.5.1766399080783;
        Mon, 22 Dec 2025 02:24:40 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac66a1aasm72500001cf.33.2025.12.22.02.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 02:24:40 -0800 (PST)
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
Subject: [PATCH v4 03/11] dt-bindings: display/msm: dsi-controller-main: Add Kaanapali
Date: Mon, 22 Dec 2025 18:23:52 +0800
Message-Id: <20251222102400.1109-4-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SIhPlevH c=1 sm=1 tr=0 ts=69491c6a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NRHHWUy0EX9jfUzwrTwA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: j8fh_dxlM0bjmYrwz_GuX92-g5s4PjnZ
X-Proofpoint-GUID: j8fh_dxlM0bjmYrwz_GuX92-g5s4PjnZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5NCBTYWx0ZWRfX8yWKmjty11vO
 +kTpyduI7kFXRGLbT4sSXa++sSo0bHWbP3sHoAszvf8zx6emN2No4vobsaoTeyyEZtC6r+sCvIX
 HfW+PfbwtCCAz3euFxvlrwZIQYu6jrTWiyZePw/JtIUHaEjQAtN3hi1b3SXHLiNe/MrJ3qPCXD+
 Jzizn5TTI5Yq+r+2ztY3RMjPQsEGbg0s/e5bh9ZtOwXD3grAFdPBxqMXuPJpjFjqMreHH6RsAom
 L1mWA5Ymg926jZwFy3Vy4O0rOrY6E34FE7g/JcaNk16EPumK8/zaGPb0br6shMX2sY+vrBvxGpv
 IgIZRbciWb6nhdWdpEQqayi6euBLTppg95uxidK2Xgd+9gqi9LfkjcXutUOjHV14bQar03PCbVL
 b5WamKz+CWU1O+f/+Q/QEX1fwFzGqR65G7tqMDmlnjqJ1GyY8ef4M20Qm758nVbLJDGbHdm7EL2
 XmYLBhw7zC6Aq+81vRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220094

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

The DSI registers on the Kaanapali platform differ from those on SM8750.
So add DSI for Kaanapali to compatible these changes.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


