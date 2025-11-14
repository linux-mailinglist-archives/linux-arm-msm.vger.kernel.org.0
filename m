Return-Path: <linux-arm-msm+bounces-81764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FF7C5B300
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 04:44:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5ACEF3B71B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 03:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C652727E7;
	Fri, 14 Nov 2025 03:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D0FqKBvM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IzA1fkne"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C280E26ED5F
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763091824; cv=none; b=f/4OKSRRnsqTwjO7ySVoGDwze6FcqCdGZ9BuZ0E4EsfVZA+OcZV6rfU7Q38PzBHYyYphsz5L19iNeUY7pu3YSyQ5p9AotAGLE6qbZbZ9gKU50fo++6HzNT4Gp1zMt/+LEKmo3mst4wkpubHHLBmohuXvpfCLPOl7rOWdb0xgkCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763091824; c=relaxed/simple;
	bh=Kg6ZgzT0hlwWlWupJv9iz+ZS8koIsZ11L+KUs3ZMWyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CbyQVSW/HFfV4aOoKQVh5xe4/dKOtIkn3AwFr3mKV95kTyYSsnAcZjC6qh8us8lqcJPce4RYI6HlAsFX7nla8a4aHccoZtxYLtC5UOicGRw9yurHCNfiXso/XCDybSj1egLSf90WJEgchUaundISxVT+vGaWUu908g8eGBt/m/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D0FqKBvM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IzA1fkne; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMarpH1685314
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sybVXgpP0xgwK0gFVwiFyD1rwurwukp6TOQLmHVXzOc=; b=D0FqKBvMlp6q0wcM
	xFwMxTyxv7m2iTTVVNL9BDnlG2L3+iFb3AdPG4GccUpFWG4Qv1CLXnndnA31mL51
	QLW5+3JAqt2lDGDT+gXQ44FwtXsPfQlz8TE5fmxFLmHY06nm/m5IPLnnZV/GJfWI
	9bJFAeFTfEkEqcRoT0qa0mNDv0RWUA2874Lvawv+eHB6S27EoFm2c7dRkmXffAe6
	vN1wYrGlSW+sjd/0fceAOS8v23IHMwws3LHja2CGnltydQhCGmIF8u7zaVYKKNgS
	1VCCaFD0bOqjBd1BFN87ayVy0OsLQW0iNFe4OTCnmoC0lLp7dcb9XZy6Jc/edzm9
	ti66IQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g0ph8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:43:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed6855557aso73579871cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 19:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763091820; x=1763696620; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sybVXgpP0xgwK0gFVwiFyD1rwurwukp6TOQLmHVXzOc=;
        b=IzA1fknerg4SakTFL38gMwQkzqUr1iT9+74PFGYDHev8RtPmZoS1DTBftIkdzEwDTj
         UWQf4FR4Zj8nG/9hQ1ogvpU6BH9fu0Z6wFi8kzc8Cov6eH3ngT816/KyPcU4R8pjnVkr
         31HGmCurDIEWxjeq9DKmj/0q2li5DQvScMHcZUxDIeg13gadt9E0uguwsIwS362PxdgI
         Nk0/MFkx5jBjLhlEJyS6QKjqfnI1STJZM73kjJn4xREqs5sLuJKF6BFSORlny221JKnr
         K/pyc+bNpJj1JrE1kGchNEGb5kSWwZ2oaxJFyBLtD81rxj9DRbNgFof94gCrGF9gVhuy
         L0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763091820; x=1763696620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sybVXgpP0xgwK0gFVwiFyD1rwurwukp6TOQLmHVXzOc=;
        b=vnTcXL+Frpnqffr3mm00Dw847vB7k+7hcOLXkyqnq/7ivWJRjjeO7wC5mfktS25Ld2
         v8wvTrji/ZThGOYFvMhxLInB/aMUNFPRI8PickEhOIEK/KcwqFN2f3pItJ/WZ/zL13eT
         hKwbwac7T1NYAJkjGQ7xcnSuRoCjfsJsH5UmVG2TjKN/9e3Vv1r7kB4fuWNLvc0t3i40
         ScvB2KbjJfFz4JI4M0WjafLZv3R7G0l8rCFyix3e689NhGB4Ho3EZZA9yV9Sb+woX9Lv
         peLzZaV6rSMSTGqhI2o1uEgTHuJKsQugaHCtb5TNotnIKP55YBWUnAB34JIEBqXtnNxD
         LyOA==
X-Gm-Message-State: AOJu0YwHUE6JOpN3xrULO1KHH42/zZ8XGElAY/JDhRGf6M1qRyYasyZ3
	ZaLSAWdTLXBH89uLoKW0TTT8shkgIBbJlBDFYQEDLBAeqQLZjRGjXb85sQuyGAFki0nCWMADkHx
	NN2ESpNYsnviAFbXQDdWwyS0IAHyizVmNDV52MNp8mZbpU5YXQwmaNj/agESVbWuZPYAW
X-Gm-Gg: ASbGncvY64aaPEHJ/ZTlJT4XQuZlkD8NdwpvqqJtXxr/JPTBYxRljwamBgeBoNQ8GRS
	Tt2vePvMFziToLy4JvlaQZUTegxwCn0dqrsYO/aLZOfGGdDaSvNh139CHjssLBaa7UtkTG95k1C
	UwxX8PtGvt3Uu6AWuIl/lPuDl5y+h68jGGcDS+oNu6IQDd9qg91ZO2NWjh8RN2YcRixZ59k7+Rv
	rLopk+fOgc51L/P8YKj31le0mIoQpvCN6Fsi36pcrq2S9rScvI91tfrviTGYh0vGl2PxEPWvLUG
	OiAtgYwjYUfwQHdhQIX3TRAOYEI2rsDy4FqWVQxTc5TUwXUVyOwE+FlNjXD4Kv3Jr3Jz3YLXUTg
	b2wHvcOv3yi/Rj9OWxzKPQyuW6SiTexL1VPbBfjriPbZo93k1tt3GMlYzrp2UskV5Qbx1mrfWb4
	JmbS9o7j/Dh//q
X-Received: by 2002:a05:622a:1a0e:b0:4ed:9a2b:a906 with SMTP id d75a77b69052e-4ede6fa96bdmr67943501cf.5.1763091820016;
        Thu, 13 Nov 2025 19:43:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwF718hmTMotBQ0AAu6G10L2telBfH4RNG+l+ASha+DbrSIb8DzyqDzAQHoCEuZwXoRWZlPg==
X-Received: by 2002:a05:622a:1a0e:b0:4ed:9a2b:a906 with SMTP id d75a77b69052e-4ede6fa96bdmr67943321cf.5.1763091819450;
        Thu, 13 Nov 2025 19:43:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040575fsm800713e87.84.2025.11.13.19.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:43:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 05:43:28 +0200
Subject: [PATCH v3 01/12] drm/msm/disp: set num_planes to 1 for interleaved
 YUV formats
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-dpu-formats-v3-1-cae312379d49@oss.qualcomm.com>
References: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
In-Reply-To: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1685;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Kg6ZgzT0hlwWlWupJv9iz+ZS8koIsZ11L+KUs3ZMWyk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpFqVkm1hatXLE3E1Z6sn9t7C1RLJuKNM5z0fBO
 SSwOmzGLEaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRalZAAKCRCLPIo+Aiko
 1aH7B/9HMrkK3oPMs1TRbKq0LG8kaNHUS/SGqVhZ0qTQwUFwh0/DSW3SDDrhamIONkuERpJHQsM
 iQZs76Ao0FVDkDY4yTRV3AKESnW2CFPqZH2gp1GhbkR/KOUS99SLI++Y5VRA5coa6E67SFP0zE1
 94Akz+QMs4+8zptF4iOYePvrMzLqxrqS5uWCZF/rplucL2mldcfGd1WMXs8LBf96dyyaz2QIW5r
 MiAA/Dg9jMQNe4TKUWonszVp3YLINZwXj0LPwNPWUcPm80EYkEfCOIL5Tmsze2EMifUBN7s875g
 HXl2P4rKkORTBfnE2G/SyOpddp7REMXcsYvPSTpF26eEqZ6I
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: _Bf8WPh6wFK_hE62NYenRRYRgnCoqMfx
X-Proofpoint-ORIG-GUID: _Bf8WPh6wFK_hE62NYenRRYRgnCoqMfx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfXy5+Jeqo7PLuP
 3KIF5uy1a9jMYSdUtv7SMqinyjqTHnpukbzoh1TnqR8ly/BWLQsqO+TpPqAwbF39DRE+4dpzt5V
 5N6KS8Z9Y626ShsQfpTN/7ZSQTAPh3uU3QxgNILhShykcGcCxQu7RQnFtsMQMgXsUnxBfTsqm+z
 WrLfNZK+0B/mY6Dq7epOEaai4DBe4FfqpcMOc3Yi+J/yRcoiv0/ljsc3mltn8iC2YfBLgI0bLIn
 j12syKqZqFia4Y13WZxviayp7doXMdktJz5/Tmx5dX6st3x5fHuuBDM2TzCEXa/o9FMhgcsItsC
 2/NHfUW4VUoQAhm7Lql1CRRpuR2x9cSQeRbImLJpGl1flK5IPeUvsxBvF3XBgmuGyfB+mY3mupQ
 Hq80Le2eFfxtVFdq7A2drhIjbvCE7g==
X-Authority-Analysis: v=2.4 cv=IM8PywvG c=1 sm=1 tr=0 ts=6916a56c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DB8TyEHaRv6uusbT9jkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140027

Interleaved YUV formats use only one plane for all pixel data. Specify
num_planes = 1 for those formats. This was left unnoticed since
_dpu_format_populate_plane_sizes_linear() overrides layout->num_planes.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 426782d50cb49d57a0db0cff3a4bb50c5a0b3d1a..eebedb1a2636e76996cf82847b7d391cb67b0941 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -479,25 +479,25 @@ static const struct msm_format mdp_formats[] = {
 		0, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C0_G_Y,
 		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_YUV_FMT(UYVY,
 		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C0_G_Y,
 		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_YUV_FMT(YUYV,
 		0, BPC8, BPC8, BPC8,
 		C0_G_Y, C1_B_Cb, C0_G_Y, C2_R_Cr,
 		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_YUV_FMT(YVYU,
 		0, BPC8, BPC8, BPC8,
 		C0_G_Y, C2_R_Cr, C0_G_Y, C1_B_Cb,
 		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		MDP_FETCH_LINEAR, 1),
 
 	/* 3 plane YUV */
 	PLANAR_YUV_FMT(YUV420,

-- 
2.47.3


