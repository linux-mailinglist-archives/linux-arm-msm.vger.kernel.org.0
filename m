Return-Path: <linux-arm-msm+bounces-83646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF536C8FD2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 18:58:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4C223ACBC8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 17:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A762F60A4;
	Thu, 27 Nov 2025 17:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMHTOial";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yqj3/IiH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E51F2F4A0E
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 17:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764266306; cv=none; b=WsQ0fJOeS82/bvOUVnTtoEbMu4RyeGm1XUxGpC0bAe2l1TcJDvEIzOHuTQqclJDhOBWNKdz4wJPv0Ck//+hdlGuYFvRGhAQhnCPDYvv5NETS3MFP9MLssxN1dWqirXViMEhuOqtjEM3VLxYnFZUaGNt5XTeuwl5eaKH9b3BTsgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764266306; c=relaxed/simple;
	bh=Ma1zyF0y9sO0pbk/wqdo1cN2hv9xdsiDz12axnbyqT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GL4Kc+lSKWWZqheH01EHmEwJ14kCefp5QEOZXubTpUCScE25yHIkbiwTr6bQ7zPRwEesmhkl6TLj0zOjeL8kDKZI/TgeDY1L5GqtfUkzo2VndzhPHrmLarX2AfPrDohAu/FdVTjigTtm7hhgsc3vw53rA8F2cgei8yjeTSqs3qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fMHTOial; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yqj3/IiH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARBVXJN721976
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 17:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yI+14vZRRmYO9F3gF+G1B1tK11+LDgYgnXZsHLb8Ud0=; b=fMHTOialqhsYY1sm
	KgB3LBbPM0BGgw1lv/cgkFIcb+vZr/YkEyrsmO9lWKbXFuuBrsZh6mitWXBSxduP
	uv2NttAmlrGpUZ02MHFmYlEbbslAL7K/1bZ0I6eVJzzanIJbk8mgzPMH/JURFnnj
	qf9XW+s+HJFeHXF4/7+QZATMdyymkVIwoIADOQ3pJ62F+Z1YJ5hA8J6x5s97uQYL
	Ml438Z4JRNioR6z0klpNdZ+lZBcP/OzoIcS4+QfkBiw1wJ3KjOF9tPi4Z9ZlA97K
	ugm+e7Y7jc8hpoyE3+7GFEwqBQAAaXgJA+U098MFkB1MhHS/JO8F5r038KlyYW/4
	SP/shQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apnud8vc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 17:58:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297fbfb4e53so16508665ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 09:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764266301; x=1764871101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yI+14vZRRmYO9F3gF+G1B1tK11+LDgYgnXZsHLb8Ud0=;
        b=Yqj3/IiHldGJ7HnUDUUpkIp1Z7J8avsBaEVShgDtFjwee/i/h7csjtOdNphOIvk5Y6
         OYnhCCNV6ZWK84OW9n3r9DB+CmAKxEDB82mQsZ4KcWk9JwU0Qdn9chfjk97XdzkaOpu5
         j73KIDVnFm7lJHJN/j+3JGb30THoBsXyh342gliy8HNP5WzMOJ2bwaG2r99kYU2MMqPE
         wM5UaHX3heYdASJ50sRGzzG8Olcmgiw0sbQeER5iqTlBA0cWvMtX0bVfPPkSvHjFhsLQ
         wfCkrkm0OvwpNvvCCeFcpaFQQTuMIuJcA8umiaPHZDTrZpoYsMcQpswKjBrjSFHVN1wX
         ns8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764266301; x=1764871101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yI+14vZRRmYO9F3gF+G1B1tK11+LDgYgnXZsHLb8Ud0=;
        b=liN81K4t8ZEjbzVTGLz2H7qr303mhcajce5ZOspgFF7IRu2uVzz4PI5cEnltwE69Mg
         vmd6NsrnwgfHYD7bUzjqmdP2EjKSadpaXYh++IjIoMeX0UlAtgHy5Ds5xaS7SoTqre0q
         dY5ov+Fn825/Xw+rzCF/NdDk4NmlVebsHkSI0Qn4/bQ+tMC42fRNhSzUCCbopCcqJlmq
         tMx67RsMMjpDPZfrq7CdECvTq4P4I1UOrmEpJ91xwSi3TLU82TMp43fTI2hUnf+zgDrK
         VLDI9n1Islrp1xcOtERiruodfL/hboVZe6rqaRDhOSLRKDk9JZiYBe8joqIHTJ4zktSt
         Kw6w==
X-Forwarded-Encrypted: i=1; AJvYcCUYiSCYuHv9PFAmuz+iINg/blhFgAjk3yPaUDUkN3lCTw3dW2Q6QYN6h6Ooj8Kd61jnhb+BtNKN20HteoWD@vger.kernel.org
X-Gm-Message-State: AOJu0YzNaZb4kjFa/l5YTDa6l4MoHKrx7kMBsrt4qUkhPnghMMN6LQsI
	fMQrKMwjeUo2Zi7GRAVi28UfVqrZ01BWR0Ha4LkuSJ75fIK1sn430QAbNdZiKVKAu0Z0o0KiQ7V
	juTkGD4e47dVoxXW1WHaZxKdMeKCH5pKQjaAayseBOzPKyv55KsrQsGLZ8EnzBZaiQqIo
X-Gm-Gg: ASbGnctiMtqSDL21Er2i+cRsp0EFsA8DI/Dvg0DfZ4I1tRY4iEyH2LQVffGrb85wdx3
	q2gdHrvwm/jOEjUWA1/rFVNO/eLd+3i70jeYYgurn2Jlv+fLOD3uc6oiIvcCKpqznNqp3XD2/Qk
	SB8jWjlLOiixFXTiTwQxSlJ22ZKkkF6tQr7YOerEuQraXERUruNyiW+L+Mi+iAFp8P9pIuA1JWk
	T0tF5mzyaiwmPWj6sUIY/U7qF8d+BRwkvjiqFqK/idCmnfK7T5dzIz3aTTGrpxwjPaJjelYbneC
	Qyeg8gHUhBCnsCsMWr0V6/i/I8VOP1JTIJJ05shJD1cKPBMhTjvwOnLb6Y9uArR7S3HSKmj5jla
	tPacbJv0G9pPq/2BPUxGlk4YBJgOZGMHZh3HPoo2q
X-Received: by 2002:a17:903:234e:b0:295:6d30:e25f with SMTP id d9443c01a7336-29bab1d7372mr120476335ad.53.1764266301150;
        Thu, 27 Nov 2025 09:58:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2sQXAvMubQrkqMte3dBAeP9ijBPMa74tIjYtcPN5YusFXFTo5IO4aAr+rikKw8I3LkgtF8g==
X-Received: by 2002:a17:903:234e:b0:295:6d30:e25f with SMTP id d9443c01a7336-29bab1d7372mr120476115ad.53.1764266300642;
        Thu, 27 Nov 2025 09:58:20 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce445927sm23785535ad.37.2025.11.27.09.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 09:58:20 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 23:27:37 +0530
Subject: [PATCH v2 2/8] clk: qcom: gcc-sm8750: Update the SDCC RCGs to use
 shared_floor_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-sdcc_shared_floor_ops-v2-2-473afc86589c@oss.qualcomm.com>
References: <20251127-sdcc_shared_floor_ops-v2-0-473afc86589c@oss.qualcomm.com>
In-Reply-To: <20251127-sdcc_shared_floor_ops-v2-0-473afc86589c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: p0GFQZBHo24tJFGyunAXTyXqCuOSuoMz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEzNCBTYWx0ZWRfXxhjDC77Ic07M
 j+EfivFgp9rah1Csqh1rtjETOYTwwS5iCBgchelnxt8cpm6dra2H0WXEKQ1lVocaoYcBxXaUqC3
 mX3uMsiIoo/EfTk49MU8/7xui4jxQ9eRYPOwqVN5c8uXmKL6Y8mXwQZehXWhjybkmGfkcfesN74
 guEq/dZrboXAorKqszRFxJfsSFDg9GluIrTAR4ApI8gWEtTyJplOJwnVOYEUJzgw8WOKaaqPP3v
 GGm4qZO2zTIcwsvqwWG29TI8jzbgZU1abinp1TCKFRG3RgyxjmrEr5wtjJyFSy+8Y76FuATVNQb
 +woZUHxpiQIYZildJKMWa4nVHvCJzVXC/LQCU/8K2jWsBSQVIhDYo0PPgbn+WkOCPbKR8t+jcmB
 v0oDbhEvef1cDicoRpdGmG0rIGrqJA==
X-Proofpoint-ORIG-GUID: p0GFQZBHo24tJFGyunAXTyXqCuOSuoMz
X-Authority-Analysis: v=2.4 cv=MKNtWcZl c=1 sm=1 tr=0 ts=6928913e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270134

Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
during disable and the new parent configuration is programmed in
hardware only when the new parent is enabled, avoiding cases where
the RCG configuration fails to update.

Fixes: 3267c774f3ff ("clk: qcom: Add support for GCC on SM8750")
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8750.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
index def86b71a3da534f07844f01ecb73b424db3bddc..db81569dd4b17de1c70ab5058d4ea186e08ce09e 100644
--- a/drivers/clk/qcom/gcc-sm8750.c
+++ b/drivers/clk/qcom/gcc-sm8750.c
@@ -1030,7 +1030,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.parent_data = gcc_parent_data_8,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_8),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -1052,7 +1052,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 

-- 
2.34.1


