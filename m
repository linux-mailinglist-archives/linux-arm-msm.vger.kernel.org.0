Return-Path: <linux-arm-msm+bounces-66961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EB9B147CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 07:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A666543B42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 05:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A6E248F4A;
	Tue, 29 Jul 2025 05:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W6Br+ww4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F88C24A043
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 05:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753767790; cv=none; b=VjmuqTwZ71D7OWNUiaCwfOiFQhsqMOLWmJ1uZ/Gf4YOhMkUllgSDgOiMPLaXltqM60r5+fWM4pJIv4DDD1AxXjmeOUtGdhHRPq8hsHLju63x8jspjrVUNc+TRCxpDXgo9AT9JO2+mpd3WVCP2ipHCCrewl/2iXrZ31e9WaYh1g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753767790; c=relaxed/simple;
	bh=OVzfN9tJRZeAyNzaEdIDWsZzTKb6T58kkVqG+1MZGb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SXewm5CMzD3O4qRKpI7hq/da5RLKoh3l/Rn5Z77sJ3soNA8S+wFHrgYpSHS3HETu5TLkaMecnUSnovRTnNZ8jU1TQFKwAaYF2XwnjwtwYGIzLfqQGcNzn9yH7YHtWcy6E+78aj7wU7cLNfNS5oSJgFeZOlxeKyUsPdSgs9nZ5FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W6Br+ww4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SMg8XK023477
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 05:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0C9v0FM3TOSssawkz7WpmBOyhmNGfMtoTBWUwe0aU6A=; b=W6Br+ww4Za2nRGeO
	IhXMIeYu2y8us06J/PRc2keNsVRAui3G2VwwC7jWBSSvrpHqpdKwEqL62sN6q8qe
	NPorCNMEMwJJ8LNQwbXXR9LM9cKRsTEnLBVodP9ZDcm4zk2G8/eut+W3fuk7OzT9
	uh+KXNu8DBNGJqxzUcycgpaXHAEZ2Sk/DxME92X01k7zE5iICQ3BSDesBM+4jyEf
	qdWT3umx6DuKUBx3uiCS7GDVqZGSbAIJPXO+L94fR1q5fXbTNC52+1jQnkrG0yj8
	3EnoXI5orCNxrUXZ0bjVDi8NId3NWphujhsWasWbxeyuYfdReC3F4PJJSw9qim3d
	V8CzAA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qpuyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 05:43:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2400b28296fso28114555ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 22:43:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753767786; x=1754372586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0C9v0FM3TOSssawkz7WpmBOyhmNGfMtoTBWUwe0aU6A=;
        b=i/ZqqWKZxPqXRa3+6XUOpJdCQ99HQt52YjPXEqrAfY9FPGHQNibfuIcGTjunSpLc9k
         0J1eeXWrmV4XKI/1ieAS91LnZ7a54ZpsoyDOFi/9blwVxF8KoHab5Mj7IUKVz576pma8
         k44IBWHH/QC4KITes+ExVr7ujdgQpSP26whCXYn2cS15rS2o71QoHTgv3eJ52RuT+Gb8
         b6s3bFfUMGnpm65XWmj+SDaXEvi7kYKsGjL7L1kukxMuYwF/lfFBZJ3xrAQh6xkICAt3
         wSquk4IMoxb6ZRaC+C5fUSs5ZaFcBNK1EsJcVEAJCGXcr3f0l4p4FvjWmYOCz+xB2jkf
         F/QQ==
X-Gm-Message-State: AOJu0YxEhyeWyaMzLla40LXpWSeBjMUhahWW3Eq/T+pMbHWimNNXFQdC
	ouQ9aRaKHP941a0PR0cnCLZZEiB6/cDlDmw+RHvSYAmFMGQBr08EyWHCaZLoQqsPT8NSX1+NBnv
	bRtbIHCOPKGY501b06c/hOrmHpGL+1s0FwXMW3h0sqHGUQrghdvZd2xsITizjzcrxmmaP
X-Gm-Gg: ASbGnctDtYxfJ3m5IOFnzxS0Ey6kgKmI0ESOarlQ940vUoNb1Z7L6T3vuA4zk3aV1mx
	wROveyIqa0PyYaHHzV4F1/sh3Xo7Tttx5kxDblxMyAVzWSDjZqOc2lXsxdPy+eyKiWee5MRLehX
	VFA8gASk1rGddYBq5nKBF3c7s/RCy4LJmnas84yXeJZx/NITPuK82+cbxrH8uDmnHHFbujnU6ms
	ZnwgRNSI5aM1mxkPkBIWsjOpN5IEBuDxXlEst+y7R9keZHSGrNfuNTSHQBdXY3TFg0sGeBRVaxj
	BgT4IgPCVEmr8nX1JOvrHczEwDW7nfJxqsFKEfmZ/cL15dxz7OxtkNJHdusjxnDG
X-Received: by 2002:a17:903:2f0d:b0:23c:863d:2989 with SMTP id d9443c01a7336-23fb3065e41mr207263085ad.3.1753767785768;
        Mon, 28 Jul 2025 22:43:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuKC49VBkZiHECTi9KBlMSNGzNAEaEP1WPkKqf/bdqrLtemg0XBkfBmt7Og8liW4pqUPQvvw==
X-Received: by 2002:a17:903:2f0d:b0:23c:863d:2989 with SMTP id d9443c01a7336-23fb3065e41mr207262815ad.3.1753767785306;
        Mon, 28 Jul 2025 22:43:05 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fe9b67485sm54505235ad.47.2025.07.28.22.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 22:43:04 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 11:12:39 +0530
Subject: [PATCH v3 5/7] clk: qcom: clk-alpha-pll: Add support for Taycan
 EKO_T PLL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-5-227cfe5c8ef4@oss.qualcomm.com>
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
In-Reply-To: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
To: kernel@oss.qualcomm.com, Pankaj Patil <quic_pankpati@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA0MSBTYWx0ZWRfX+LHjeYps35SY
 ZYvbi1KG9N1Q4jXwimewmGZl53BTPbQHTW9Nie96dIOKEg794eFOcLyRsLF50v9mUPzKlln+O5T
 FCs0cxB+nPuDLUONWz0tpsCMFx4dpR3CQaqr47IX3s/RHSKG7PPrhC1YjuuTpEU/W9AXMCgNnQx
 emnXJKRAL8mE3xkbqDic8f+AYmiouo8ot1aR1EBoRziEeo6dXuIiWyut0J33UU1Cpjer+50GkKa
 VO2qKL0/63ImlE4SQMsAya9t69mLtifR9JaddVHQb85xh7wRiZ2srFs8Tjz91LR48/KFprq/4Ls
 cLWoX44JdG8SS/CxuEdpJ8CTwG1N14Qmgz1TQ10TsVw0fhbpjkGFDVDGIuB4NSfGgZ7vTkUXydf
 Z/4pg/E5Rv/oGkudmXvRLtJmCS53w4RRu8QSxp+o0NpChjKxSG7cXo9dwaJAm8ekpq9LaJgt
X-Proofpoint-ORIG-GUID: onLd3DCiNZZsaixkma6Di1G71PBcDpcm
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=68885f6a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=9yNAuCQw4ehsCnPPvT8A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: onLd3DCiNZZsaixkma6Di1G71PBcDpcm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_01,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290041

Add clock operations and register offsets to enable control of the Taycan
EKO_T PLL, allowing for proper configuration and management of the PLL.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 7f35aaa7a35d88411beb11fd2be5d5dd5bfbe066..2294ae99cff3253ac54d916ad0bd1d7e4146f2a8 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -29,6 +29,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_LUCID_OLE,
 	CLK_ALPHA_PLL_TYPE_PONGO_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
+	CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
 	CLK_ALPHA_PLL_TYPE_DEFAULT_EVO,
 	CLK_ALPHA_PLL_TYPE_BRAMMO_EVO,
@@ -192,14 +193,17 @@ extern const struct clk_ops clk_alpha_pll_zonda_ops;
 
 extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
 #define clk_alpha_pll_taycan_elu_ops clk_alpha_pll_lucid_evo_ops
+#define clk_alpha_pll_taycan_eko_t_ops clk_alpha_pll_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops;
 #define clk_alpha_pll_reset_lucid_ole_ops clk_alpha_pll_reset_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops;
 #define clk_alpha_pll_fixed_lucid_ole_ops clk_alpha_pll_fixed_lucid_evo_ops
 #define clk_alpha_pll_fixed_taycan_elu_ops clk_alpha_pll_fixed_lucid_evo_ops
+#define clk_alpha_pll_fixed_taycan_eko_t_ops clk_alpha_pll_fixed_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 #define clk_alpha_pll_postdiv_lucid_ole_ops clk_alpha_pll_postdiv_lucid_evo_ops
 #define clk_alpha_pll_postdiv_taycan_elu_ops clk_alpha_pll_postdiv_lucid_evo_ops
+#define clk_alpha_pll_postdiv_taycan_eko_t_ops clk_alpha_pll_postdiv_lucid_evo_ops
 
 extern const struct clk_ops clk_alpha_pll_pongo_elu_ops;
 extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
@@ -232,6 +236,8 @@ void clk_pongo_elu_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
 				 const struct alpha_pll_config *config);
 #define clk_taycan_elu_pll_configure(pll, regmap, config) \
 	clk_lucid_evo_pll_configure(pll, regmap, config)
+#define clk_taycan_eko_t_pll_configure(pll, regmap, config) \
+	clk_lucid_evo_pll_configure(pll, regmap, config)
 
 void clk_rivian_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				  const struct alpha_pll_config *config);

-- 
2.34.1


