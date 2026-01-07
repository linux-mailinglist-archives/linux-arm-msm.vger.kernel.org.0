Return-Path: <linux-arm-msm+bounces-87826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A3ECFCF48
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 10:45:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A931C303BAAF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 09:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0903242AB;
	Wed,  7 Jan 2026 09:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eWCp5y3Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mx1jWaGX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFD8322C60
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 09:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767779019; cv=none; b=Yasu/IFLbh6LwYrUazfa5sVw61gILPkAvd0CaZcFxmYlqpjroD9ydCRFNAaZBLiWCNYfWRnlbhbmmrestAd9IyiIUZ3eovrFbYeW+mYVovsKYHw0LeUef8iypgXctMAh3ixDel6ph25gT2CDULg+M1XvfBxnoJgdS1x9yN1Nims=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767779019; c=relaxed/simple;
	bh=U8poa0KaqrK9BEIbeOyVf6u7T99mbdOjXclQQRLj7ng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f8aVYJMscoMRfmMeq5xVMc2OYe2w7JLN55aCSi0Sb3cJec8uw9EluzwKYlpHmjWKjN3yysMePV98D3S5DJIN9ifCRO90Jdbnu7VJUWkyr/Tp7JxWtNDG9fHgzx+FBs17w6gLQX7TosDPzix35mORuplKcYN6rkO8Vtu9r1aKUMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eWCp5y3Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mx1jWaGX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6074mWjS1462299
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 09:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zs+wzUVsHrOACRE2ziRvoBtbc7mFezrDRI5e7QURVTc=; b=eWCp5y3QiYa/iNJs
	Xuco9jDBKf78KOPp57OjunFmWI2m2ZSuPAGlwDhEuqL8qo4k+zb4Z5TXkRUOllSa
	BigaLHXPvqnKwMmb2KrJMPT0wWSgsMBCVBCBk436eAuvRCmRNwn4bn40iEE1biE+
	sPyHVfFVTb70fq4LJi7MU9oZBeTVL+ekh+tqLUqRREqijoAgzhOfe345gBXPKMNe
	4j8ucnbwTSYW3GuQDSVi0yumCnICsOMl88TqSJKc26NeVNzmWVAKQy/QHZq64bPw
	FODULmhOgcxzSRwEyTGgxO0t72W7Kv1jkyhhnJJOIRh657hL5kRVTVVH+20iaCu9
	swI8Vg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh0vm3t64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 09:43:37 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7dd05696910so2038413b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 01:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767779017; x=1768383817; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zs+wzUVsHrOACRE2ziRvoBtbc7mFezrDRI5e7QURVTc=;
        b=Mx1jWaGX1uQpBGPi9il81+s/gRekG8o9XURlng5DJWbU4MQyfC/9/N7HfU6BLaUNp/
         x5ise2AYcd0mhqkmNjGTsda73ULBmK6I+WBCAXAVwonWJbZmvuZ+ri11oCLWUCPuCH1j
         B1sPrgZ/ZKiybDAfyHgPBhATVdDPjHjhj5qXii7S2t2uwawIKYH6NsgagqQkMg9i8NhI
         fTPa628tGIPF5giYCWng+t9qHxmNwdfWHa9fmi+ODRtO9mTna/Qv+H+Ju7dqvvmAKB2T
         pZt7b237C8z7vS6tLu03mSKf0zPngT717zImiVE3FB1B9iIdmSq8OtubIAPF5l87gyfS
         eXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767779017; x=1768383817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zs+wzUVsHrOACRE2ziRvoBtbc7mFezrDRI5e7QURVTc=;
        b=GbsLlJaR4VbcfU9h4ZT8SYs/r3qLWsaWK3Atx61wzqlakThKnMbJNTZOXUQO5bOckH
         wUhqwmTOsjTuHOR53WtJjZwx87x+hQcFXWBI2q0pCO2cyQnG7qqAhdSOvs7ypH3vi4re
         gbd9r8J+TZxlq19NX0A+ajhCBkemNO+Oppvekc68+awuarH3DzOXYEeB8Cf0bpU9WOSm
         xNWBhvF3tYCjHAy7WWtEW18+PtiB8Q1/QRlkxwhXxKvHXQ+eHH4c1qVAoIFQDvmoXFgJ
         gxiNDaj0baWyxDvPxJpPNaYBcRFz/mOh9HlZCCc9+mbV60XDCPyHgqDzdgguwh9HmIMl
         yR3g==
X-Forwarded-Encrypted: i=1; AJvYcCVaIqua6S70slX0wIMWEeVV+ob2gRbak0p9fsgKrQPK5y5cLIjMOPMRK8fQwqM+FJ8v3tjSfC8ubNU/HKVY@vger.kernel.org
X-Gm-Message-State: AOJu0YzJrcmmPOKWvTGIXMBwaTKnkkQuzUUOTHuc/dHYAmsbbS2jQmMf
	tdqziQh8+HnGqruBTqDIW8N99mvkWlN1f2dHn7QjGyO/lCIt2BzB/F9lsBn8s3aZXNvXsU84Czk
	ehZAklEAwmh5lU013fSUMfS0xOhd6sWbQ1DWrH0/kDd4l868XN1XlNL3UozrbcZ+BiAVp
X-Gm-Gg: AY/fxX7zDopeCyqQwH63Rye1NM+YLz5VrMNJK+xTmJO3RJ55CkWQTnxbxxNuHTYn7Zf
	yMtECDu80k7locWeS64HlXfLq6aXG+RWny+QUkca6hVXWTAqND/GHNZC8Os8UqBtuEkw3UyEhnQ
	110Ih7XGXlSp5GDYb+JGD/awaEx0usduxqX9IVWc+QHQuVB7AVsg4mC5pYCW4EQylH882pJQHOW
	m8CbR0arvc2h8Rq4pW4dXB4pgfSoPDD+viY21M/uw1AdkrIdQDgJh1zOER435gPi5l5ELYcQRGI
	LWNPnK6zEBUw9F0PAY/B9m9yihazfFXYX1EESN0CivZyNqB5KgEylk7uRpqJDGDCs/bcsx8xQdE
	5v084w2PtPCGEkV+C5seJOtSnKiiJiGluDg==
X-Received: by 2002:a05:6a00:908b:b0:7e8:450c:61b9 with SMTP id d2e1a72fcca58-81b806c99f9mr1789474b3a.41.1767779016698;
        Wed, 07 Jan 2026 01:43:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOWDHAkqPtCZbyeZOE5BJsu/fKSrpRyXFy9kFumozQWK84Dh8TlS6n/YwBzyrzffHXHc0jGQ==
X-Received: by 2002:a05:6a00:908b:b0:7e8:450c:61b9 with SMTP id d2e1a72fcca58-81b806c99f9mr1789452b3a.41.1767779016235;
        Wed, 07 Jan 2026 01:43:36 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9568sm4472944b3a.15.2026.01.07.01.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:43:35 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 15:13:05 +0530
Subject: [PATCH v3 02/11] clk: qcom: clk-alpha-pll: Add support for
 controlling Pongo EKO_T PLL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-kaanapali-mmcc-v3-v3-2-8e10adc236a8@oss.qualcomm.com>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=Pa3yRyhd c=1 sm=1 tr=0 ts=695e2ac9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rVs2PR1jS8wsPJa1_kIA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: o1nXcl_WNZOjVTDNvPPEzWd8zdznbUXJ
X-Proofpoint-ORIG-GUID: o1nXcl_WNZOjVTDNvPPEzWd8zdznbUXJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3OCBTYWx0ZWRfX6Otdj63xEUX+
 I7wAYem53HKOEk+pFFRkRlofND6RahpA1k4TUoklsu19ruRylsjLbUXbY7z4sx6ga7EsYmgZq4y
 Y8geVWFu6+XCqf4Zz0RxdhS1yJaGqw9gnTPXIyYTJ4TinQosHa7qd46OrxeupIl3ue5sg9RbTlD
 gKezwdy9K4mftUg/u0D0jFy7W5tWkZcWK6BZrLqZkDXampwDO6OEvgbzlxum7z/0PMQaNsS6fWV
 XpJdqhLL/KqkOItOX3B+3F1+wpjYC0DTkuDQfyAlqMAWOHYfymjMDmNWes1gJw54KnBdGGP/L1r
 vDmFAj6J4mtlMyLXezOb3oK2Gt9elvI5Hqtz2NZC4Ep+pQZjzA+mx4RGC7lsc85GX+izY8fnQaq
 MfoTnoWI2Rn407NoK89UkrWwMLaQSpG7NMqsl9jHrw+AUNHU4I0n5sdCyqOjRmjFi4E2Mu5W730
 UYt6AniVKNNks5mSjig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070078

Add clock ops for Pongo EKO_T PLL, add the pll ops for supporting
the PLL.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index ec5b4e4810300fa787420356bb073c24bb05da62..fc55a42fac2ffe589ba270010eb47c0816832ca7 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -28,6 +28,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_LUCID_EVO,
 	CLK_ALPHA_PLL_TYPE_LUCID_OLE,
 	CLK_ALPHA_PLL_TYPE_PONGO_ELU,
+	CLK_ALPHA_PLL_TYPE_PONGO_EKO_T = CLK_ALPHA_PLL_TYPE_PONGO_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
@@ -207,6 +208,7 @@ extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 #define clk_alpha_pll_postdiv_taycan_eko_t_ops clk_alpha_pll_postdiv_lucid_evo_ops
 
 extern const struct clk_ops clk_alpha_pll_pongo_elu_ops;
+#define clk_alpha_pll_pongo_eko_t_ops clk_alpha_pll_pongo_elu_ops
 extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
 #define clk_alpha_pll_postdiv_rivian_evo_ops clk_alpha_pll_postdiv_fabia_ops
 

-- 
2.34.1


