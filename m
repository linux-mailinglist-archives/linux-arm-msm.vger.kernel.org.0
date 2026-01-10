Return-Path: <linux-arm-msm+bounces-88362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C96DD0DB81
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 20:38:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 940613008725
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 19:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B500924A07C;
	Sat, 10 Jan 2026 19:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LX9KQVa/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kg9kV4Rh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B491DF97C
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 19:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768073882; cv=none; b=paRKHOBVi64RzgzrXaNhppmpI1PUAsHVUeLDrDWu1vrAvAcZqr24ez12W7jICJOARR62+FxWcdua4pwJmI+n/qDdxES1qynkTvB3jtj1H6PQCsD5vfFpGpSHGkfjAfYF4+fujRu/cy/OdTi8RUfGwgMuP9Lh7TQAwjGoi0O4EIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768073882; c=relaxed/simple;
	bh=Pev46xI2YfYCEJWpoooLY3aM1pLiw3PESsmECFYvSaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EhJ03wt7PZwyjS6sKUsTn4HAXszG6GEw/1hSRYjiVLwR6wvR5h4kdNdtZJoZc/Cq0IRKKTx3mGiGMadmvaHmF6/sx6jh6tl5Gg6lxF5oqSPMF1qsWoCq1XEc9Fo9LX4EssAA/03Y1PIHTpX/6PBC9z1MQwqislChM9gBV6DSWxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LX9KQVa/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kg9kV4Rh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60AIkcRP871611
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 19:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jf2DMqzpH2JNy8Ab3F/hxDhzYlf86bFDL8kNrSEC6cU=; b=LX9KQVa/Z4wfQlyb
	Gnk652sr1zmAP0AftssihFWn38yvYultqDsukCSI36Pia3/M0AD8DJRd9QDpijIv
	TU+uGP6j9l0eEa3JvXrwMWiK/cMwsbsVRKwhMksW0FDgFqX9wBc25gRC0A8YL4zV
	4Pj0u5R5UYneTAO99aiUPwp82KYAQLz9MCqWkOZBXFymkim/f7HjhJHxi3Llz0J/
	w7uzdXLIxaWHjT5r/3To6nCoeYGFafXuj8DKMtsP/WJi+5W3dtSsVvZNQuFjLTij
	Nh0QORW8Gg63s0AHiW+vSCiTzoZXFYQwOA/SBsGoNbwNJvOVq/1dzsc97zB441Ub
	rWxXBQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkebu17kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 19:38:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ba026720eeso1406846885a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 11:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768073879; x=1768678679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jf2DMqzpH2JNy8Ab3F/hxDhzYlf86bFDL8kNrSEC6cU=;
        b=Kg9kV4RhdXaJZort/9dRsNoJt8ECtk611Hv9WCtRdmsmWjsvKVu+T8UEzlQxaopdZA
         eEIDK0d+/aH4cmCgz/1EZaJjMenzhI9b9yT7oKKboHsLhdGdNY6jVprz8SBodPcMBAKS
         EP9LeLGpvMR2u2uxV7jTmEPjHJ7piPh5yt9rNPnfYwZCe0gV2vsehEyyno/MRGH1DxuA
         2UCV8xa47opjFxYQfCVtQOhXzbmKN+mquFToE1EEII/EIBcySLTlYXjpwZIts8wdttFh
         Gy6qoC/2N5yrm2ZRdqXNeXnE2XmTL5mWWNdFCq6gsECAzB+fnE3lwvWCIBrB5/2FIdpV
         KNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768073879; x=1768678679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jf2DMqzpH2JNy8Ab3F/hxDhzYlf86bFDL8kNrSEC6cU=;
        b=Pa6EYCAMI+NulTIMPpkoeKjpxVRA8oGnm6AIQE/wYyCRhCqX/RXPr5aCAjWp4VmMA1
         h4S/KPoEVU47/efvG6C+uB+IPv4lVSU5mtzCu81TndDuqHwU9rhzT/jGjy27V/v/YabH
         qOnfb2RRkkOy7/Gt8B68M0WDXBbJThaOc53MagKY1ogKW/VSM12+VeY02njJvF1sLhAY
         Wkjhm1nAn4O1wov1QXPiim6Rqu/Ngev2Y3B8pRfBLS9DbZ+NvpElIELne0TZqv0K8a/B
         eaav8ZtAVyZ4UZ3jGRNJX/88Lcgkm5pqSPp0cwR/OzjmMmb+I920MW2jGKFxZ3vOijPF
         PYZw==
X-Forwarded-Encrypted: i=1; AJvYcCWhpy2AECghgwPjnjbdtMKr2ZKHsJuExbIgGdD76h2jyBblv0jahzziNkQeFyJRKoSHe/LMqxrocrqCMAz3@vger.kernel.org
X-Gm-Message-State: AOJu0Yyauh9RKJykC8o09l7bYUr7AwJ0EBRpNciYB+ZGVWgaPQwyqcM7
	jAAYw3fuGQw+A87wqoQEeRuxzBLiVmUDXUGsUH6F+gFI/5rBiB/dE/IfMKt1dM23zc/3TUJn63u
	25e6kc4JZO1RveVQMtVDgHscvoIudBe34bdYB/KZBbNF0NSetTiwtrKsoFNZCh8eqIv24
X-Gm-Gg: AY/fxX7ehXEsL4ptvMQdYT1apg4VXihmK7qYU75KQ6xrMvzQiRhpeSZSLrPmuZVWlCJ
	DTylvYCUedaiG1t1LDOyTJVhwXRXdB7KVKebmws3FcOd0EFpWi7MWc+erWU64InaSDosVRvfFC8
	ZUg4dMyEhaPI+vtTDVfjHnCfwkhTXcD/9ZuPsg6cvCeshsAMMlIYbXyLZzjRJldXdcdkEqmKIab
	oQgX0ykVA2RuuuMUPWpB8Tdid6QlisInrXWXtWfjd9nwOWIli4sQrjVjwxHBO//A+3w5Abe1KPF
	s/NW6Uxc3WN0I0KShn7ocXSw2eNGSwNu4VjpiH66w6MecDJT3eXK5XLaevXsOgN/rLrXD2uARWX
	CAxhuiNLzH+jGpUrms5urP/JfCGl7ribLGv9FxJsHMmBX7q4P7r+Z+r1byTrHzpjKCEUIBjud37
	SfBqdN9Er1uCu1AlaG9OAvJkY=
X-Received: by 2002:a05:620a:44ca:b0:8b2:de6a:ca with SMTP id af79cd13be357-8c3893f51b3mr1951173785a.52.1768073879570;
        Sat, 10 Jan 2026 11:37:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGYu67S8+CPprNVyWfVMgX0OZCAew+jbVfBF0vtbN3BVGruygTn82tAUaHZh9q2joA/HE7yA==
X-Received: by 2002:a05:620a:44ca:b0:8b2:de6a:ca with SMTP id af79cd13be357-8c3893f51b3mr1951171285a.52.1768073879121;
        Sat, 10 Jan 2026 11:37:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 11:37:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:37:53 +0200
Subject: [PATCH 01/11] soc: qcom: ubwc: add missing include
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-1-dd70494dcd7b@oss.qualcomm.com>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=720;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Pev46xI2YfYCEJWpoooLY3aM1pLiw3PESsmECFYvSaI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqSTlADnmSJixHP1i4iUNQp2Ni2QraKzhFRg
 de9h9q5MmyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqkgAKCRCLPIo+Aiko
 1ao3B/9bRdX/gIVDx8irfCSbubecqdZX2hosHW8QH6AQ263XimJTNOzZLckyYqiqjEPTywu+00K
 baULI1Geph6PkbOa2tSonjMdaVTdoqpySuYs6gW6lQHkhxSzAh//IYw5ciXiGI3AI/MyoXPifFy
 lJfhXeDiD1o2rjl66XJlvF/RH0QEHiBcgYVYRzN6jrI87MhX9fyzacBCXYR5K/40UpPwxt5kgvN
 zLp+r2GGp2KcSS/bQ5u9H/3BcjUJ4mpi1j9Y0WB5sMlMkvbWxHYHdTzd7hjCXlcTq8F21KvcbE6
 pPbB+FYyohLnIjzqpQXxYvXbmLlD742an+iRMvpo18QOZe60
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Wj7Tow5RsoomIuucRa3OF3WmoYIBiaPG
X-Proofpoint-ORIG-GUID: Wj7Tow5RsoomIuucRa3OF3WmoYIBiaPG
X-Authority-Analysis: v=2.4 cv=LeYxKzfi c=1 sm=1 tr=0 ts=6962aa98 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ALiPkwqszP5KJWpCD6MA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX04OPRWLdo3BO
 ZzEdxvg+Zx6dOm7lFjgYX1xN0APnDiH2nMz2WDWXCTCqNBWUG+PQneC441en+qUcuCxPedJBztx
 z5+AnO9MUg2UKJ/MxXU6srlWZ4NJHtTHOPQ4jSm2fzEdKeVnjHKwyLV1ifXdBaalWyqev2k1urf
 srDuT3aoiiVTzPE81wc9XGa6pTYQcngi9TpVvRevx0dOeB8ip4kRd2Me4ELfjNDJlLU90MJunHL
 DnbuLnWdWSZP+4C+0ui7Uca9uy+Jo8yd602gVa5ccGZbH1Sc15kv7s1iXoGQzsdVRk10uoK0TVR
 zJoOzmyd9MWiCisCNm5hoPVT9dGP1eU3oGBIWLLpWBeDmjhSCv4NDiDv1CXsGDfot1pKpzpO3hc
 pbvT8B6URDdT6KU3E0zV4HQUh78INuqVpd+LDSvh0LE6iuJMyc3C85ajpQBVS0bj0PH6lyTQGIh
 0mrfGG8BVHCfLNPMrPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100173

The header has a function which calls pr_err(). Don't require users of
the header to include <linux/printk.h> and include it here.

Fixes: 87cfc79dcd60 ("drm/msm/a6xx: Resolve the meaning of UBWC_MODE")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 0a4edfe3d96d..f052e241736c 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -8,6 +8,7 @@
 #define __QCOM_UBWC_H__
 
 #include <linux/bits.h>
+#include <linux/printk.h>
 #include <linux/types.h>
 
 struct qcom_ubwc_cfg_data {

-- 
2.47.3


