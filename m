Return-Path: <linux-arm-msm+bounces-83292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D572C864A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 18:46:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2E963A8D37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 17:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3EB23D7F3;
	Tue, 25 Nov 2025 17:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OmejZUaH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="knbds86H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11F332BF5D
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 17:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764092745; cv=none; b=EsApMmT5hdXAqudXDIx4XEfLwSHp+d/sZid1QqamwqvhnbXR3mGIg9F+PsNLwyEhQy4VkWgvwhsNlWC3g8X4+AZZtQ2oDuJGB6VvI4AInU9mDwzAsqb2fzs9RXR6M6tzVWvKMynS7IGjOnfnZQBL44FHrcSWFnvLluKBsRKkaRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764092745; c=relaxed/simple;
	bh=U8poa0KaqrK9BEIbeOyVf6u7T99mbdOjXclQQRLj7ng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GwvY3gslQq+4lc+E/bgO6Ah8PQdxCbC5Awj+fSz/C3MuqLlGdo2AWPX2uAfWzvcgApx5SFcTR3Ak2tmohCJ4PXyXMle/BpewuS0MHdt95ag6CXBlygohX44BfwR+Xr/rpjC0r3g5hRf2XUduYzUnP2gLPir2693R465+P5VLpNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OmejZUaH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=knbds86H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP9wNNK2659063
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 17:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zs+wzUVsHrOACRE2ziRvoBtbc7mFezrDRI5e7QURVTc=; b=OmejZUaHSIegwbWP
	nYdDKnAN04CA26fyMpoDRm7bJr173/6TLRyaxlqh/LnBBE5MyYruowlXN2Cr8NXx
	6osWJAYb/UO7W7AHKOnEQrqjW+q5KYH2Gtyr05JqHckHhKxgnL+0CDpzgfGIOTID
	4WmrMrpECw5a0cIlDI8l7zNdqjzhmpWdfzDulpr3oju1OFw8agWBfSXxTUO1k/vt
	ADCd+b6OVehes1/cAPd7pFPT24iBtXn+HBLeEL3GisM/4Uth3Vb5buc+VeURhikg
	8CC50KF6SNHKW5yvE42yPoMqW906F7VvDgbvzT9RmQWjM3MaI45e9P6Sm0vecoHV
	oGSvgQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ana9x9c79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 17:45:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2958c80fcabso155080955ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 09:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764092743; x=1764697543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zs+wzUVsHrOACRE2ziRvoBtbc7mFezrDRI5e7QURVTc=;
        b=knbds86HCejK4QS8uR5GOLf1RpaI3D/EsgLUBw9GgDNxJmsIJlCfO6IUWKTvBHsIjl
         o8+pzG8W9JM749obfCkMwmnK8DF8OGtz8idNAG4rd7QZOkLSHF4Gdkqv3nci60AcqbKV
         cWjIACg9viBz1ddIFdTCCEnP7SgClG25Bwt6VeTnqbG8AiCrTNT5D9NUyl0p02mm3ZdG
         2Q2A2ePsqaA/Zm8wzZpz1Fk55zbFUOKr6EA0GFJpKPd8uncax/Zv2ohCfGaEbmYdF5TA
         MCJCXh4Ab4KLOzqtbMtOLnNP8a/D3RVeenDdROTGx+NowPUnwcb3HTW91j/c+IhrW8qz
         DVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764092743; x=1764697543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zs+wzUVsHrOACRE2ziRvoBtbc7mFezrDRI5e7QURVTc=;
        b=NjfjuhGrL9U1fKhOuNvMHMS5QFIGHsqGmH5n2O0jSOmbXq3n0pV59jCHYbpobracur
         5654vP3bQdjQcIw7DDHmt3c+4l8dASPaqI3HgSxuJbbs3C3Qhao2hxX/cFGanmr2cT3g
         FUzgQZvFBjBHcZaVbCJx4HfbaN/PV4ENfPVVNqdAmvKQ5RHbQlBP5Dda65Ht80/hjCsM
         GRZ8NsYnLYVmiPthVbnU7Up6m0tCbKWv0B/SIuH9tPyniSp2zZFJ7Fkd8O+SULloncCy
         KByefBd5idCJBhzKl6X8+aD8k4gsffmlsPtyGlMs1T0MvXpkZApf1V9Au+L5BZB2vRQp
         jxYw==
X-Forwarded-Encrypted: i=1; AJvYcCURPIOxKa/3Sl1neMHP/pdCNU99EnGBp/t58xXEikv9uWke7bqynNiYx+lO0FCtLZhe4get+8gPHPzeyfCt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8PR02z5kuuag9rv86HidQeS7/nFURyWn0UfdRuBajNSb1WYv3
	n1hgy2IVlUfHDiwH3IDS5b526sjjmdXoqhI/CIIRsrpDMMtY/M3akazka09Ov+5pZBfTs1tcZCx
	xl6U8T8cF1jfkA/u5nDbvZiLV3+vNk9u7KYNMDgsoQeNMbPe/ZWVd4DGVhKsI/ImTIbKJ
X-Gm-Gg: ASbGnctuRKcGa1yRqPdkhT3Wufe8NOcOkgp0WEsb0XTCc2s7QYy7zbct4zdJ0cCg19I
	E5Mz2LTH1q+HRWw8utqrssx6eAfn3o8790HzxILEBzBG/b7Dpu4+IDzYHnX44Ru8lFYxu0EQjFa
	Ytwq/lnnDOWAZO9AcBte3jsDOl396Mb1twsI9vyJToC8xCLDc7AbkZTx9KIFN1dtCcU+6hGRRj8
	qW3XeeI1WX+dSMlntD2X/nwKwJA4IdqzJOJm4KUONoQ0D5lF1eiTz2WzxWG4rN/vgiHOuzWH2Ku
	GQAUQ6vHu6fbg6jyiQVIzy7wVgXm7iW/qDDX0eEysWO6d2VCFRJ9ap0yjglCrsuU6AzHi4eYjib
	wO963kJHevD0b3PEsnZc=
X-Received: by 2002:a17:902:ef0f:b0:295:745a:8016 with SMTP id d9443c01a7336-29b6be8c765mr182969015ad.11.1764092742592;
        Tue, 25 Nov 2025 09:45:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWkvU7FtwVCjG3746418hQFphvRV7z9bBpLk0ElI56NuQn8FoZbZcci0AL6j/gHuF7bZXtmQ==
X-Received: by 2002:a17:902:ef0f:b0:295:745a:8016 with SMTP id d9443c01a7336-29b6be8c765mr182968755ad.11.1764092742112;
        Tue, 25 Nov 2025 09:45:42 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13964dsm174500785ad.38.2025.11.25.09.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 09:45:41 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 23:15:11 +0530
Subject: [PATCH v2 02/11] clk: qcom: clk-alpha-pll: Add support for
 controlling Pongo EKO_T PLL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-kaanapali-mmcc-v2-v2-2-fb44e78f300b@oss.qualcomm.com>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
In-Reply-To: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: Ti28ytGfXRFKxjv7Kfq18RtHgHTkt29E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE0NyBTYWx0ZWRfX1dZo51/kBrF4
 flkotd/4p7QDlDbBcJBI0ayIRYy1UJOfY9tFhPdYzKZnf3NYVRbQlBZeRoEVURnBnl15FxsU8Ez
 FeSQ4i/J/AybupI7YBcO3hzweYBhBMiPVj/vmj2yV31TP8qWZKhk29NhIIpvZ5XLR/81QWzRwyl
 JN6OStlEsjNJpxyZ08/N+9MMX04dJDMgoZKI6XmjBopNSjdDHqeuBJDCKj/wJA8lL4iA9QEejbN
 XJ7CPYajeD1z5d+R9byhvsYa093tC4o7jE1E92Qo7okOyCMPHJsEtTxY8Em3GBnbV6OxJfkNs/F
 6rN7J2Snts3vAvd9or0aYrVWEraqLdcVKhxBBUN0s1AaHHbxAbX/Q6ytb0Fqz+b/xScKrNW3SYJ
 dA4uB1EZlA24BlNpx3HD3/o4bxUCPQ==
X-Authority-Analysis: v=2.4 cv=Sfj6t/Ru c=1 sm=1 tr=0 ts=6925eb47 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rVs2PR1jS8wsPJa1_kIA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Ti28ytGfXRFKxjv7Kfq18RtHgHTkt29E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250147

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


