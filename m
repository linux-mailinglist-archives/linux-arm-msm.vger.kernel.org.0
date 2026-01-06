Return-Path: <linux-arm-msm+bounces-87654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A594CF767B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 10:08:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 228E8301CA3C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 09:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47A8311967;
	Tue,  6 Jan 2026 09:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZzBRRXCl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fGmbSx44"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3555230DEC6
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 09:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690479; cv=none; b=lBuyU/wYJ9VBW7XB0g0xmkYIWuYm5ySafgq84HeX9vXW09lnpo62g0XUB1g7uk4VA4UvjT9SAckX9pQAsMdB3Y452+zaCgsZqZoLYlNU2rJwkg+Ey/pCLjy8FafalcHIouFbRnuyAavXqhekAeWGVqvG5GcQfKDpi+iKf5pFsis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690479; c=relaxed/simple;
	bh=KfVEUPuhe/F4xQReLShCAqrNsPPHd3O41IpiZZl8JnE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ctuVpRfomCBOXuKnoe9oFPVbeNqJCrareTkgz3ihfm6I7J876aXf7SDJIUME3z8WCzPYG8/105hRRVH1XyQTSw7ccwtsmcx+5DzPrry3CvCRq3ju76AaqLgfavi4rN8GnidAHIR+iUyhJL4/cNEbJ7Op3ulPBA0sGusCSXYMvWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZzBRRXCl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fGmbSx44; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063Q8vr3300888
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 09:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rMVQ0wrZgfSmmWmnnU9RZzQRtKbqz/p3ccRfw5Q40SY=; b=ZzBRRXClND4oJKIo
	WTywjwKn7H8tzip3UNQVbBtVMnmHCVcRW8db525+vRkAWuokSHxMkqAQv/9+H2bz
	I0BXaPbik3sdx/H99d3nkORyEFvpB4phWsqWg+NdCMpHK4CuSscDOIiQL7HvcGIg
	olnZgmNebl6KNN3W6HhhZRyWBkgqmurAZ+AemNQAFPMNBEyv+eMGW4hsQXNZ94nZ
	O9FkU2pAdZhNKwuUsmO63qmMHqcYXyyeKXUlpX+aBUaFejC7xHZHlZZYbVJaTqUu
	8JHzGAI2PVmy8S5p6DXrF+iFyfpAmfOccxVObGaXIgGZxtL1o4QBZAVGuweGpke9
	uDsnQg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bggsvtj6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 09:07:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b17194d321so105891185a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 01:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690477; x=1768295277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rMVQ0wrZgfSmmWmnnU9RZzQRtKbqz/p3ccRfw5Q40SY=;
        b=fGmbSx44Zt3AZmEIporCsyMYWlKfzOtEj2G2Uhs//Cpvoq/4Quhk+Z0IZVV46zZUn4
         gUVOQJC+m1YKuUaczEL/g1juPEv2+W/QeMrdW+dCmIaZnpoEHnGvLYCS0Uh9aL1Oib+N
         1Dnptfx95PH30HS13P4nuyzlS+BCTpRaTz3MgEGrmWtLjr3pgQgzdQatid0Jzl7AvVmy
         Vsx4OlZfH78dL7BcWP+MlS0TtU1NcVfcRH8xyds9HQZC5ign41ZuEe//GlWxKJkY1sfT
         4WnHp8m5es05gEVF9Ngmyp6nZ/fcV8HZsMg5dIDRa9HUNj2p8UdpoGEjpgAKNPaeD0iK
         AytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690477; x=1768295277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rMVQ0wrZgfSmmWmnnU9RZzQRtKbqz/p3ccRfw5Q40SY=;
        b=CWcKyQrtHWX6NpEdX9ibvjGc5kb7WhiWHO6CWu4hUH+mNJyywu/4jJLEJSjMq1lngD
         EWcN0gG+LUVzqi7KX+tkVcMvQdQmoKMBH3SkUysctyqsWcmQR5f3OPMc1oscGapvQA3s
         yjDu9mc3GZ3iETjghcocILRYGYaYnrbutGQtVkOH2kx9F7NIUWjG3r6TxQGi1RINkG7d
         UwKymQHexXuY7iR6W4BARpCdEsGAClhTEczpJG3inIjheOYeQ2+7GLz/4/FLICR1bIZX
         ZYMZ/LQHOItBzlEQo3eAzrDVxKmtjP1aTVhThSvB/tslGWkw94MEi4d2vQFC6WRl+LHl
         0jFQ==
X-Gm-Message-State: AOJu0YwHD9VPk1xlkDlkAq74HI9111w48Fjrp/4yF0GYPfw7SkPzA04a
	ZxpuYObV8roOGZR0m8Zv1HcXrUv61yxTLXNmeqOzSVz5ZucT7DTnjgoUWKV5SPni33ZL0auA3FI
	yf0a6OX1Bp5gz/MQSjH0hw6RW5Hoth+UtRJER+JujMEQ9WxmIjML0vM/DgrKTx9Y4OvTz
X-Gm-Gg: AY/fxX755uZ50ftbdhadeht9obCvZFw3ujhv+Zj1eDFDNokxx52RnODh2ti3l5FO0rP
	eBlySazeeq6uWFIu+wXTE9Ng5PwxEukV8tN8xxRKOT9FQHM406pBpNxnBdqiDH6IwbwKVlIWAXg
	DQCcCK5P2JQB3RSKcNmQFr7PIzMGff0njfu3C6ZbmYNzlLHk2YczZ9bviE6PtD1AqG9kuUoe0Nt
	pww/Q5lOcpgKW1uFTwIx5wpgBH/nLtnuwIcw+MwMH60F1f7GcE2PhbFynsw376AWkuXZhx/2O64
	nnPyVyCzNSS0OhzFsNa6fIXChtfWEkS7gkszs3SUeXfSEDoe76vWj+rfvp9+XSRGh3YmtpSxE/a
	LjNFGWEv+KS7djhH4vOGNIXZ4DeDRtt9/Xg==
X-Received: by 2002:ac8:5a95:0:b0:4ed:2fde:d0b3 with SMTP id d75a77b69052e-4ffa76a10f4mr29735151cf.6.1767690476497;
        Tue, 06 Jan 2026 01:07:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEy6o6EhCJKmN9y2MDbj2LHw+yDhBdJjoIJgba0PuZgI9QZgw2azK1MCwGbMFR5WCfnP8qq1A==
X-Received: by 2002:ac8:5a95:0:b0:4ed:2fde:d0b3 with SMTP id d75a77b69052e-4ffa76a10f4mr29734891cf.6.1767690475981;
        Tue, 06 Jan 2026 01:07:55 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a2bcd30sm176270166b.28.2026.01.06.01.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:07:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:07:40 +0100
Subject: [PATCH v4 2/3] arm64: dts: qcom: sm8750-mtp: Enable Iris codec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-b4-sm8750-iris-dts-v4-2-97db1d1df3dd@oss.qualcomm.com>
References: <20260106-b4-sm8750-iris-dts-v4-0-97db1d1df3dd@oss.qualcomm.com>
In-Reply-To: <20260106-b4-sm8750-iris-dts-v4-0-97db1d1df3dd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=697;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KfVEUPuhe/F4xQReLShCAqrNsPPHd3O41IpiZZl8JnE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNDmMGM4+K3cws/axv0ULMXEgjAJEAMt7Imyd
 DT/JKQA3MaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzQ5gAKCRDBN2bmhouD
 18vjD/4vWcLYn7g/ZitVd8cFfwKQd12XVPlSBfmNx7Hd8KzAk1hVtBR41M8K6AUwnVbIEDwzcW3
 oyzRxkz8EsZ77wrrNEZDe5kgDbSd7SOrQX+ovZ3/LvP8JeqtACwE3w8h/WURppAj3HTp6DwHjRn
 6SYUau5sW593Hv5nHLjvdFggvP/8w9iDdtMHIIaJEhMNDtWfrilS2TvpULu6+MUo0GWzrowTlmL
 v7JiDEtFT/9eIIQBQl9TQAnr258AXPNuclqZ4TIFktrbs4AjqnsmBA6m5iy++L5UbFjkjkL3C3h
 3/Eq4+utQNbI8vK+2jgd5iQX3vTsxK6HzvZHGcKjWnfW8xeSud4Z4k39GYDT5qNyGR9WHL5ARor
 GB2QpdnwbBq2XoGZLECFowIuR0RcBdeAmHn2K27sA9txwl0H5rFj8VJKEtQ+8utlAoUJAgz1YFT
 fevlI0N7FfjhMuVRxiR/wUJHHPCH8yYOP27L+soPYUGAnz4DkAcd7vs+Kfund5yztFJfKDFMNIU
 tR20bVr2DNl+/jOzxfXbsZ1wDVUe6vRdIRDJ7C3vD/+jyILfV1W48482UpHAN0grBv0Pu++GZqI
 lN+LldpiEQ7CluYL7mNkGuWUXhc3Z/cQiONli12h3QjZogf128DsrAOX/nHTL/tXrcXenRGSo4c
 SQhrahTq9weu1fQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: hRD9bZUoncVAD2ZTzMQ8I_4QgP2KV472
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NiBTYWx0ZWRfX1M3B0Su9qW6B
 i2hn7qoGVRl2I8xI5yXD7D4b21vPvJ4VEnY85PlPPY5f43Rzpo4x0cxN03ZOlaqJGeIwOC7468v
 znEunK/HrLNTKUuhd9P7xpJkichBmEDJ604UmEJLdg3iBiK+/agUPbrn4cVL9risz0VAwIdGKQA
 wlkEpHtl9mE3LXuHiICa9s45AGfcZY//hstr0LFqwbN6qFpRlkldBgvtNbbta/9j/zu7ZD+32r1
 pY6uvfSsB+gmg/g3vfmUcInZMJW44iF653FGkCwfoJFOWI8AMR5RZtKVeDL7C02lPwKiC0IKEBr
 5w5fyZQe8cCByUL2x7kZ7Wjzb4wGB+WACg1KqR/qYkwLktcyeBN6P+H+SVWulGnQXVLxV/1Ml/5
 h3laTaew/sKDOAvj4KlVFAyd7RwWJGfBqyO0Plaryl1mtinao3a1/xR6b6Yjezyv08wO5A2+7GT
 q4l8s/xHPcnxapet8fA==
X-Proofpoint-ORIG-GUID: hRD9bZUoncVAD2ZTzMQ8I_4QgP2KV472
X-Authority-Analysis: v=2.4 cv=Yv4ChoYX c=1 sm=1 tr=0 ts=695cd0ed cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=khVYVHlWj4OykvzjE4wA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060076

Enable on SM8750 MTP the Iris video codec for accelerated video
encoding/decoding.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index e77fe0ce91ca..cb718331496e 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -925,6 +925,10 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&iris {
+	status = "okay";
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";

-- 
2.51.0


