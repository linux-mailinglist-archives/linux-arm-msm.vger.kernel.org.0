Return-Path: <linux-arm-msm+bounces-69126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E49ABB25D0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 09:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FB827BC0E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 07:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D78C26E153;
	Thu, 14 Aug 2025 07:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XeYe3BPg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B19726B2B0
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755156156; cv=none; b=C4i55zKMqnNZjk0GkttIeaN3N4clu2Wxs5dZtpqtO/smiHEoG75VUjS08o+PcfwLajY9P60lm9lN4uoFsue/uWvg7R5fNZyuDddl119EKd7rxP4iB5DdsnGk5jO8+EVEeuJQ/q/XY+2H9a6Dts4VWuJ6wCdT+bxLxCs+rvyshR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755156156; c=relaxed/simple;
	bh=TtT0Nf2zRlo5tUth7b9XaXrqg4IP4hWtUayIq6Mc8HI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iO5gsYTnKmB468/I9hfRZQkfOfurld3qerXicM+jf+/H2tKfMtkiNA2VRrJeeDayvdw51muTC5GLIjiSroK8v04uWFak6oaQjWZfCZjlfEqzvnZ6GPTRZrzLfLdRMBKxaisQ2qlqSbVNwYBQXCKFOQqCK2+voRj1zLzGdEdgC+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XeYe3BPg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DNQJHk021102
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iala9fw+bbdaJ5tA57DCC4sJNCfBziddLdxHkkyCCYQ=; b=XeYe3BPgqDtWOMj0
	4buMmIgjIar6qVZulmzVVU0bEWBQ05mkBL4EqOEWGinzSGoA4RJVlSbkMhRCc+vq
	lGPliE3mPeVz2r7dp3dtPzaiiVdk9NlWhH4X1vp/saJDo//bTZ/QngruIc3YGdgt
	opu00X318gfdsEeyeOKyWNvuYBQXunrplHKdBPQYd6MU0vIhaLHcNIHgRrMdW8vN
	RL6EiyB4XfMtoLEXsrLq5Vmx9lsNSeYiJ24LcsBTShYfuJ5hBmHk+hXsoujhX8QX
	kWOdjbQ60rolw+SS8zzTqBckpMrDpp3fqCOEANk1l0VczIPxV1fLZqr3YhYQOCwu
	cBWjag==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sxynn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:22:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b109acac47so18868561cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 00:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755156153; x=1755760953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iala9fw+bbdaJ5tA57DCC4sJNCfBziddLdxHkkyCCYQ=;
        b=uXBKffnuG6qUUd/E3t2ugTf0WxCN2SWENRURf5h4JS0WZpXavP2h10DfbdFVvJv89D
         D7GGevqCzbTsU0TZOKgSrV34HabYVqHa9Tq4qmP3p/JTeHwq59hNTxo6YdaphrLt3iMc
         Xe6DTJHCkWJc5E7ThQlQSTjVQtOUq83wiHM3sKjY0+1YaFJDBA4Edk7s8L72Hv12KVw3
         XuPJG0PVvBfPI3Nmfs5ZNbR2T6PTUGH4ipd144qOIXUOjZ45KlRsvgw8AIMW6H7a8GFi
         Sd2TXsyzpcdKis8LKHU1hcIhWzIgnCBMMmLABqEJPJZGk4uiZCcgrs8XeBumHUfjIcLA
         2a6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXARowB5A02k7Ka3d4JfN//ZMYyf1/fVrVaeluF6ZsR92kj9TrpXtBJ8G8Za7XF4XsdPbq48oQ9zS/LoGhC@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+uZaOpxvL24Jby/8Lj16r50p2HatP4wZBxxCEH4GqwFW4Le1d
	8rY3h27Qyf9NvOoZaVD1WmX7wkFPuX0uCkZtc05SEUNIh09CbvFaoC7jfBykCE67qrtD00fizN7
	X/ypbk9oQz15VOlzCu9sA35JnKAtGbuaLjxAaunbzYOmNl+fBLnFDU63DVF08dwx/n1FQtGAWgX
	Uwz9s=
X-Gm-Gg: ASbGncvBqm8BDzOgu0N+aBGv4GaY5EP+MANo0StRKK/o8uI5Kmx0+cUMkcHVPKF2+7C
	cPNI8EFdZRnqaonjhU8SyBK4M/DVOLHRWdyIxLSa6y6Wvb4ZytkmA0AxAL12Hme4Yqyhkv8KElz
	4wZxTnaogVG/i888Y82QwHXefI2PxF/udrVuNX3RH1iDS/9lSisfrA/V+zmceHu+AJwkR8GTFx2
	+D+q8jijgD+RHR6fRp050W6X9yCSx3dxDX2VD77xlMU76jl9NRdbTBUQnjyfhX1faNRuMVxHRH/
	SSnXSVUPRLJsPCCskYATdQ5rPeljNSl56sJVO4nwAkHl2C68CngX1UmHtdbTX532Frp+4oMyRVz
	+MxErWaeixkq6QN9YTJLKPbq3SMT34B593XdwrHPHbu0GCg4yBkPy
X-Received: by 2002:a05:622a:1f9b:b0:4b0:743a:b4f0 with SMTP id d75a77b69052e-4b10c594815mr16459241cf.41.1755156152722;
        Thu, 14 Aug 2025 00:22:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1sl7ib4c5kKM6P/fyARJ7qBtEqOl5rM55p7yXhUuPoBHjBKCXG45d3uCaonUJQ6Db5KP+Hg==
X-Received: by 2002:a05:622a:1f9b:b0:4b0:743a:b4f0 with SMTP id d75a77b69052e-4b10c594815mr16459021cf.41.1755156152190;
        Thu, 14 Aug 2025 00:22:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898bde5sm5648258e87.3.2025.08.14.00.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 00:22:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 10:22:23 +0300
Subject: [PATCH 4/4] soc: qcom: use no-UBWC config for MSM8956/76
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-more-ubwc-v1-4-d520f298220d@oss.qualcomm.com>
References: <20250814-more-ubwc-v1-0-d520f298220d@oss.qualcomm.com>
In-Reply-To: <20250814-more-ubwc-v1-0-d520f298220d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1427;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TtT0Nf2zRlo5tUth7b9XaXrqg4IP4hWtUayIq6Mc8HI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBonY6uR3H78dQvhyGcDcCaUJ7qPD3Xru3SjfvV3
 tXRN/z8wTaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJ2OrgAKCRCLPIo+Aiko
 1cphB/9smaFAM7NADBVO6fZa++P8hH9+w0gPru+ONWB4peljrSZiX8CnO8npayp6z8RsETV8MGH
 Jyt5LAbeveLTgKKeSLa0k+MX8AuKWdWLXtA4ipvNyVyw4Pes05Gw0jXFDxrH8zuCHDNKHPnqEbl
 eH/XQ5hczMUwFVs70fgh8WQxc7+frMb6BJtMdRpwufyWM1AKvj1MwfVg3oY8vI9CxqlTjCkS01q
 07hegfbemKwn60pS5LcdBcnlf8dlelBoZHJkHFKlNI4prJ0KAUJAkySizsEqe77WazXqvwuVQ+n
 2HAMoZqv8COj0JM58vEulTArngfbn5ylZ4wXmKFBdCJDzXZX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689d8eba cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=XT48RGDP_DIob0G9p0AA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: bto4IStLpAbvOuOr4MrKqrCQkilEWbod
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX9w/vm+oQ9W5E
 8S8Lk9WQPV0BIzPZLhGzYFvrC9jO8ki3u7+KJtj28KpYUrNHitweL3YiK8Db+C9Bx23hpmKXCuK
 yUQh6T9vcadwmBptWfzuNxVcJFuY9x3dr9tuJRtMobHj+ZJ8BfA6um773tooipMhLZnOPDayAnY
 E18iLpyyReAzbKxtY4WHiB7IS5HYOemErQEnqR2a7vWgQX5+YkailcVix9AQblZrvGmfXtTGEMX
 4HIiJGwZYspOPwTkt6R7HWrLOvQf+axAIHB5UWzgvergPQAwT1f3OzqYm+f+uQag1PbdrUnwLeE
 yMhCbpK79qIRLJlelaq2fHEapC/YjgYtvpDmuBHb7MypmwNi4xUE182jGb+r9QM1jKheGnEQ0vs
 O7RqFmDs
X-Proofpoint-GUID: bto4IStLpAbvOuOr4MrKqrCQkilEWbod
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

Both MSM8956 and MSM8976 have MDSS 1.11 which doesn't support UBWC
(although they also have Adreno 510, which might support UBWC). Disable
UBWC support for those platforms.

Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 689e333ae44308cec178ff343bf09cc89bf9fce4..15d373bff231d770e00fe0aee1b5a95c7b8a6305 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -230,9 +230,9 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,msm8929", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8939", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8953", .data = &msm8937_data },
-	{ .compatible = "qcom,msm8956", .data = &msm8937_data },
+	{ .compatible = "qcom,msm8956", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8974", .data = &no_ubwc_data },
-	{ .compatible = "qcom,msm8976", .data = &msm8937_data },
+	{ .compatible = "qcom,msm8976", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8996", .data = &msm8998_data },
 	{ .compatible = "qcom,msm8998", .data = &msm8998_data },
 	{ .compatible = "qcom,qcm2290", .data = &qcm2290_data, },

-- 
2.47.2


