Return-Path: <linux-arm-msm+bounces-79373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F368C1916E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 09:37:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CB051C874B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 08:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F259F328639;
	Wed, 29 Oct 2025 08:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pqPYPJAi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xz98l66P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9643203A3
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761726341; cv=none; b=ljBFtWMXvuPtJ26vzYh43QJGUk/JMU/W6djlhs2xWN7OtChZOj4nQ2tfWjMGLr+LIQVBAc7/lnsbllQU58S9RfzZbIPglAw9Gy5i9I7EsCv99v99/Gl3yZS+ueoi6qXcX4LG9YjtnEjYA8rZsRSPG6HPKP2sp/vp3BpUOx4xO9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761726341; c=relaxed/simple;
	bh=w43bHQGv/zAaKHwokTSoj0q1EvK3cCGUoMxNLVzLHPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m3Qhu6q7h50nEcyPcQPbZDTE876Wd+prEengALjmuNndmOa/jB3txtSY0sunf54czjaD/8uCHLUAXJ5n+Z5zKP4TKkpYV11s2miq9Q6QXA6ysm+51dzjlordhq2F2EV4hRc80f1nExUfrwT3jcmsKTZuV3xzHB/4kqtPKJ36y6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pqPYPJAi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xz98l66P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4usYQ3692101
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	50Cp3I5mBMY7GPkVlH2aGvh/9PRy+BGUwsmDasOX5G0=; b=pqPYPJAiNMOoiw9G
	1rPqYQ1PkKiDKu6cjLY+e2QQeI2dRgXksuFKkHIgGb5bH5mpoWSWwOfNcdvyi5OS
	3tJoDUH9qwLdguGsvAg9U/BEFA8/J6FBz3ZgdqPzbXHcUu6QRh1mwXkI0s3JU88a
	KbZguItQZixrFRI72sERi7T2V9Q04CeXnxhIfDbkOXcO85KGZU4/jaPUjpe/sVkK
	0CkYXjzbW3ziNW+KpC3oerNJJuZb0BiwsXbyiKzTJlAsuxUYa3fHe184eYbzbSK4
	59mtEXDFW5ec07H82x6dxl8Ol1vog6DSyI17aE88pO7uocQpsR9ab2HeQVhYlcrb
	APh+xg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a2hsap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:25:38 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7a27ade1e73so4997764b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 01:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761726338; x=1762331138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=50Cp3I5mBMY7GPkVlH2aGvh/9PRy+BGUwsmDasOX5G0=;
        b=Xz98l66PXmW/vTQ5kCjCR1fSShVZy0Zp5YrWXGEIdEZ4Zy1OttFeKni3KFy1y0Od4w
         EM/5AfJF/uCcKpSmkomhVD/0sC21C/geZ5Vti4OATn4KqxELM+BMsakBKeVn0ymY5nuJ
         u4OTSFjXns9tP5JT8gBGywrwJJG1+/tdwM/10iO+I9HVIFSeuEE1osXe6q9m5ZSgDZ5H
         govVDr9ASx8NkiqCSgYkjjiRWCigY/5A+Z12lU0vtZ8gs3lVHqJxMUi+jtSg3EFR9dCj
         OohfN8RpqwVOsaKK2tM6iGZh4PyALtmyVNWtSms+6gtjcWI/ee75C5T4NkRy/lqYhDOF
         1c4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761726338; x=1762331138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=50Cp3I5mBMY7GPkVlH2aGvh/9PRy+BGUwsmDasOX5G0=;
        b=VY2a+L5oISl3TwPBE3aIed1vWRXp/vlkpmfD9scD8dNzjeeK22SESlDOY9lRXGI21P
         zb8TegTf6JvJtsnRASd8qjPm2d7P/Wf+o7LqswEKKB0MWjWMB6EqGxb/Ppk12y5zXYlR
         CermCkZ/X3Gn6CMJTKcVGoNLt7HV2gGHXebjNq4++WWN/3/q7M+K2aWmGhFQ+mYgfW8F
         /iFJKOxJOcQERGcm5FNi+lbF9ZsI7UnFBNcImWy50K1q2CcaJ/2tR1Y3+TRRHVKFYfNK
         pvJWUYLjDODOTd4k7UZJQdjMw41hd+u5F8I0yjjr4MPof7yrAVoERwM1j5/3b4+O9fvL
         gv3A==
X-Forwarded-Encrypted: i=1; AJvYcCXMiy61vFZQKyagQLXJxKsHmqgWhfM52LiXkZAzj+X2lGshVTU7JdJS8DcLJwkslbfp4LdfD5TqS0zFb0qa@vger.kernel.org
X-Gm-Message-State: AOJu0YyAxtvkv4F+3EMH5mzTRKlDhgeuLWCJgAjSTrLerwEkM4yyLU+S
	YVajeW0TTSBJInWF2xxh5YGzueJV14WGl6RgipLAovE5iLpbY4LF2GusWQnQ2c/vaFZOgOIC9+R
	DzHkZFJpKMe/uIVQKfJRm21EYJYj9X4uQxRQHY/CcAJUyai0zqdJDMUSaiZdHrUBrQNkP
X-Gm-Gg: ASbGncuaXNpxe4V7Glg2fmy/dFsBU0hX9J6GbdNzsl3F7bjkffYOgjWww98g1zm2FpU
	HnMjSTYYAz4G134v2+s/88VJN/wrumc+idHZAi9ZJ54pO+lWa+P6t3BpRXszVqnB1bMvYSKZrm/
	abvJFtMYmIJlFI+TQFDgxsCY8/6wVi1zAhdF7n0NpQt2QWQ3d7aRf+9bgQD9OTIkiGhbqhfG9G1
	aTVA17gJWnK2xehe4CCk4NbZmIh6VuAgA7gmnUDmRwDG3Z56x4xZyoQA/lg3juD9pDNR03Tnul9
	W3U6poRtJB/54+iMj1cd/IobS2oCimUEyqNEiOvLiyaD1L22Tkp0XCnPNEQhamjF7PRNBAFcohA
	vIGb7+bxavTUvE3iMGiyvRNr7a7NL6V3bSO1hwVDrHIS4m7qJYA==
X-Received: by 2002:a05:6a00:3e04:b0:7a2:76a9:9bf0 with SMTP id d2e1a72fcca58-7a4e53f47eamr2802481b3a.31.1761726337873;
        Wed, 29 Oct 2025 01:25:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnkr279komHitpMFYSLX57z9xYrZhE70hIU2j2mahLHGOiFc3l7/MU04d5SWTk1X9QMqcI2g==
X-Received: by 2002:a05:6a00:3e04:b0:7a2:76a9:9bf0 with SMTP id d2e1a72fcca58-7a4e53f47eamr2802417b3a.31.1761726337088;
        Wed, 29 Oct 2025 01:25:37 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414049a44sm14158850b3a.35.2025.10.29.01.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:25:36 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 01:25:29 -0700
Subject: [PATCH v2 1/3] dt-bindings: crypto: qcom,prng: Document kaanapali
 RNG
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-knp-crypto-v2-1-b109a22da4f7@oss.qualcomm.com>
References: <20251029-knp-crypto-v2-0-b109a22da4f7@oss.qualcomm.com>
In-Reply-To: <20251029-knp-crypto-v2-0-b109a22da4f7@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761726334; l=960;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=SWFaejhCBdbBAfLWu5s/QWExunI5LAeom61uGwA2pZI=;
 b=/AvSxPMJLFyU/Dzv85BBKtBK8RgdwXpFW/pU71hx+9yFVaibNBVFOyIdTecVihUljGcx0SRv2
 KEfTegPnQopCHsl6gZ8N6fZo9GB4b9HTRGOaWh4bmEpL8/msqsHxGhx
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: S3BTGM5j2FsNRCwXrilgkQaiwF4vt9G6
X-Proofpoint-ORIG-GUID: S3BTGM5j2FsNRCwXrilgkQaiwF4vt9G6
X-Authority-Analysis: v=2.4 cv=PcvyRyhd c=1 sm=1 tr=0 ts=6901cf82 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=ou92kEv10uOBaGRFQZkA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA2MSBTYWx0ZWRfXyjRNZuSKEJBb
 3Idnloc8hFj5LOzgrZwLsVlZGS07yT17bDOPL4roWU7uTsGgQumgf1yZgBeWfn0YmARJcbVCxjO
 JXALkkA83ilk3FsVreFAnbjWlYriQ5wvRveN8BqRwpt4JiehWYH47/0aBYDhoXd/v6Ej2X3DXhu
 0JTtmnPf8dr6PjIl15agvioa9A6GOtUS1JAckCeVxLuWhH1AemFwG6IOEZ72IFLDBiLcSzfJMM2
 agX1YeUurfYjU8QzMuZHG6HWV7gbgOIzDyb+66wLcL/bf6GhoXeg2YCD82SBc0qYpC3NAjAwchM
 BvGhfUIya/xjhuaeR2RSo9/9Mh1Yu2CaXoh6wDHS2r9YfQBW/FoxK5x5Nn9JmQ867Ym42rnvMe6
 z1lBnn80ZcqJoMCnhUHG93RkjXkhnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290061

From: Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>

Document kaanapali compatible for the True Random Number Generator.

Signed-off-by: Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index ed7e16bd11d3..597441d94cf1 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -20,6 +20,7 @@ properties:
               - qcom,ipq5332-trng
               - qcom,ipq5424-trng
               - qcom,ipq9574-trng
+              - qcom,kaanapali-trng
               - qcom,qcs615-trng
               - qcom,qcs8300-trng
               - qcom,sa8255p-trng

-- 
2.25.1


