Return-Path: <linux-arm-msm+bounces-69125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0727CB25D1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 09:25:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE07C621D79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 07:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C558526CE23;
	Thu, 14 Aug 2025 07:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UkL0JQ7w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1AD26B75B
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755156154; cv=none; b=sbhHjf/6HdJ2jpsv7YTUYI51Aj2O0eUgDliDb1bzJHfvphsCxHshcREXpM+kC0ihFZs5owoWNCPeGSuBq7r2cq5maM8YbD4BNozyXgT81ghsHZZvVe7PaD1dI7n+ncudqW9RE1RCoHgDPAhPCmCzYPTMOB56x/bVOZd1PZK7l+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755156154; c=relaxed/simple;
	bh=E3/N/WjQbiDmz0VMGmvjPdpgGB25WtC6B8H1wIC+vFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BdF+sJa64Jm8eF3rPk10mvxeKgPe1Mb6EeIzn9dDmXNjw83mb54K285dLUpkqK9EQ57GaLA8HlY4/DoK8gVZ15Xv224w9EK2lEuuS5vYfNWhYkrwEJpPt7fmy8xCGzsSBEVmMVgZU5pl20F7/6lSqLwe7tmG9Fgadg6/mB3UMps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UkL0JQ7w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DLX6IE020590
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CB8bmGdBNhI4UMshHOPhj6IVXl4P+wbGWYKdpfCUS4s=; b=UkL0JQ7wDH8XQSOj
	CfCEzweC3qyDsfuRDe7pI+FC4oNkRwIkj2Y65mz+guCTujlIHtb49rU4x8s94GGM
	WsoRwr8azWxCQSrGqzR4eJ3fEpvYoo2cbxrwNpGJZGuQE8nfP7CSohQjl6KYKWCb
	iKIex7tn67kWqWXKBxwH69nvQ7Iy8tJxN4J99CBcvYyXjv/X16Fk9WrZjDo6Z+F9
	awC3C8Z7H4O9ye8MBK501k5tMaQFh8arQzw1IZeeUMa8JJa94+NxEo2KsBSPsKNN
	IDwIPRnrT2oArO+cqDN3bDa7NdJBTJkO7A8FQyVgU2G4bervBGK6qhCGGg6Lld8M
	nZ1hhg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hmeq7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:22:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b109ad4998so29554561cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 00:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755156151; x=1755760951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CB8bmGdBNhI4UMshHOPhj6IVXl4P+wbGWYKdpfCUS4s=;
        b=R1f0eKF0Yzi2s3V2uL1Vy98ljKc+xmXKDHHarbXFlfa7u8E7JJG6deHqQmtg+k2gJ9
         e4QoS83O7QSyi/p3nILoOuHKerzXW9p68lhuyQt7lwAUHVhJsCuSJSYLq5p4hX9OarxI
         wDNBVcTKuNylYJJencICKgkadw15hSB9yvwktHLMwWsp5DdKR4Sm0tU5r0yrIPeKRnxJ
         iGKg+/GXiP0Dzw2oZbZOgTd5DWpKz8vcj3M4zq/9bDC909XoTjuabVSBHkkud1SrtQIy
         YwrjQLpPWYqgUIQ3//ShFc51Zkf8xvmEACkWy4iEPO55TicIKaat2P6X5qmGsT2d8RWf
         ivkg==
X-Forwarded-Encrypted: i=1; AJvYcCWn+Oz6HUGuyLMJ3Yiyy00mdO8hSfrgy2D21Bx1QZ/Rt/bpMtx+yFR8R1aJvvLByFcXj4UImmUMzH5NNVSw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw05LzWNOQTlx1o2CJM1+37Re8fSb5dFrDq4/lSIpASd+tE3PEt
	1Vg/W8UVNqKewXnkhOT7PwkDlpjQqmWfeNqKPJeFJcWk8wcthta1UNklTF6xRWJNXGDkz6D8DP7
	rxF9kuDn36FMqzVhrJCAL4+gu6QhDmd7pe+B9xGtA1kqVHKZ5bKajhBq8BI3KWj79Sau0Cqzdn/
	hs02g=
X-Gm-Gg: ASbGnctCQSHyJ0hptU83sdEvnQh9Ur8tpdoFNYuTBqklkYMyubpjSDJzYhJlqz++w/d
	Wq5igaSxD8rqgvZDr1thOn35q1L+lmxfM/y/Otvq5Uo30dnD6Pyz2cuhj6cgqlxV9AAQ6+vQDQv
	rOglKZlcmX1W03bh24knSYFz0wXhyHlSE4y7doM0+JuuknsTQK9TCUJ5d7CLxltpNK05CZ3awu4
	tf0sRMbP+diXbtuprW++7j0KBhhz7G6Md8hNycad2Of+aRM1/hM0KZZiSxzdA5JLXwgTJBaXi7D
	5+/pLUdeJZPf/MpM7fUDmrQ5LaZuIMYs8aIXbTFnw8Tkm7KmmyxiQ2FLwVg/P22JI9xc/7FIn0e
	9FqHaFyR6T4QxKaJaNeZb3BGYoenW+dVib1PYyfUwbmqXAS7RHBBK
X-Received: by 2002:a05:622a:180e:b0:4b0:a07f:c1d0 with SMTP id d75a77b69052e-4b10a9df06fmr25849321cf.5.1755156151129;
        Thu, 14 Aug 2025 00:22:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtOIqJE9d/sTcrcmqc3jqwvz5pGujMrFYQObf4gagrdYXX4fx4Q28OrN/xl0L4v9Zx2CcFEw==
X-Received: by 2002:a05:622a:180e:b0:4b0:a07f:c1d0 with SMTP id d75a77b69052e-4b10a9df06fmr25849081cf.5.1755156150671;
        Thu, 14 Aug 2025 00:22:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898bde5sm5648258e87.3.2025.08.14.00.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 00:22:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 10:22:22 +0300
Subject: [PATCH 3/4] soc: qcom: add configuration for MSM8929
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-more-ubwc-v1-3-d520f298220d@oss.qualcomm.com>
References: <20250814-more-ubwc-v1-0-d520f298220d@oss.qualcomm.com>
In-Reply-To: <20250814-more-ubwc-v1-0-d520f298220d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1100;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=E3/N/WjQbiDmz0VMGmvjPdpgGB25WtC6B8H1wIC+vFs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBonY6uy+vSA/X4Kgke/NFHP7uLX88/xECGSb/oe
 5294f4V376JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJ2OrgAKCRCLPIo+Aiko
 1apsB/9wSFENpXzI06HmIYvImbE8JcKi94PgOm0vB8p2X3CkXAr20neQwNHpq++EUtd3lW876d3
 vbADkOzr2s7S5epizeNWWm9KHeC59XGcDuJwBauSlg23Dc9Ec6dNaAs5c3+pl9WOY68l4H201yK
 +Hmf/tzCvy+bXBXCqMqqlufGt81LcJPpsIkf4N/lw0uxvwZX23YWFOXJBxb0piOMRBiLMW5jNMU
 nPMcEDq6zrdbo8T+bYLuSDo4LwBzVfBm4PMUIOxZVu8qXDCg3EcxhxmSn5JodzQcqX5Xg0eYJrl
 GlrJslQMU2XCMRoRDhyhGqY0ohk5LyoJV9D+GTaDr148tMR0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfX8bSy/62P6oun
 nK1M5YZRZ1FlDdabW8AqtlkPs06R8jT64ysRXonLlagMZsbmDcAkICOOkmPEVXASubHcvuNhe8d
 vU6o6iGiEHKnFMsAHSTUq5it6JNZy5odeLd/4lXIZui/LFX6vWVRZC6bECJZbCZs7MpOc0WeYCt
 R7dADEv3/xP+/VR8dmxRK+K4lxMiGYc0SWouS+9Jwc9VYzZ6ccYo64Jwa041yBAmSauLbI2DBYX
 TDlOs1BF7tTz6kebgTB+EuhzQVMXCyzxu20QuHq+H17lJdzP2k7JrLD5WWIIA2hV1eCywNfDdwz
 /2gNIJrLJT33r+one0Q++RP6zGh6rS6ZiJzpZkATHYpgoCfl5gXOtvv87yMGKNXehOGYtBzFCcA
 kLLtwOSM
X-Proofpoint-GUID: DCT42zCH5jKpyGIK_8hJoCOGDVAOEiMJ
X-Proofpoint-ORIG-GUID: DCT42zCH5jKpyGIK_8hJoCOGDVAOEiMJ
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689d8eb8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=TTbi-_CV09467DSuNksA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119

MSM8929 is similar to MSM8939, it doesn't support UBWC. Provide no-UBWC
config for the platform.

Fixes: 197713d0cf01 ("soc: qcom: ubwc: provide no-UBWC configuration")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 8b23b4d4e3989a7170a9f44f3a5e466cffd70157..689e333ae44308cec178ff343bf09cc89bf9fce4 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -227,6 +227,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8917", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8937", .data = &msm8937_data },
+	{ .compatible = "qcom,msm8929", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8939", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8953", .data = &msm8937_data },
 	{ .compatible = "qcom,msm8956", .data = &msm8937_data },

-- 
2.47.2


