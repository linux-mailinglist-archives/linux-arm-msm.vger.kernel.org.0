Return-Path: <linux-arm-msm+bounces-79391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 665B7C194C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 10:08:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 82CE7586206
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 08:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D30832A3FB;
	Wed, 29 Oct 2025 08:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pm4Jitwx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FcINmRe+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF6F32A3C1
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761727954; cv=none; b=OVYFWx23QI06Q6jNlUT9Nip897V4NmdPq8r2KxSV+U4r2dqMEdleE0SxytWZidjqywo5Z/JeO56TMp4YEpVKFUaKcsQbP3kD63OtU14ZaZu6R7j1Le0VCrFeFk9SPUcrIIGMeUa1lPB1gQCojR2w+bGHzmQocUdNVUI+tOmahak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761727954; c=relaxed/simple;
	bh=f/HHi/48hqff50ItUhEpqZ+zfupVghiSAFK6cNZOm8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nkC0GM1CDuOTpnUxmoRzO2d3ZYpkC7x4/vg8geSH2cILt8k99QTewpvDhAl4lycojgvE29LwMtU+ofFWC6nAzplAQOO3YxP1VJsic/iIBSnlWpOiu69idM0ldkHcalDIaPljukVhPn4tD/Z1YT143wKgA6AoVLPBStA6G/nayw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pm4Jitwx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FcINmRe+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4usDm3642892
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PqVjiwHHM6HMBkqOPTdcX/9mwjZ2lFutTM2OIer6Fqg=; b=pm4Jitwxgmbfq5Yk
	AasOjN7q/v2x+NXM69VAfxotSlzOJ3yPVR3gMAh/qwfwVS4ONfe+XFPkobkocvBL
	wa2sssWwW/XSozkqOKE0n0BYdvQ5FfFEHFddKkG6FX8O1ZNebjghUqNIiyp9VGBC
	FqFoh/U0LPvJH1sVd59EctQ1PlDjjsFXlF6lMbdXadktEDb1l+2JLCe98UYl/k9h
	LV7i4HhlFVuCVE+1vEqBILYqd1olR4sq6JzI9fMPnmypikSMSffrkrQ1HBrig1Cv
	eSh4fPnszeyGdrOG6n0kqKdCUyckTVgnufhniuORGJ4hCtCmWtwLB4L5nPtK9q49
	f3EgSw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1hvnr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:52:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ecfa212e61so23052721cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 01:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761727951; x=1762332751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PqVjiwHHM6HMBkqOPTdcX/9mwjZ2lFutTM2OIer6Fqg=;
        b=FcINmRe+H745y0ks6kldw20tXfN+GcWVtaZZXd6NyJkoNS7chtbYWp6/Pv3EbsokWf
         /rS9AKUeJOsGAOBOdLNvCshKjyYfq0u3lL2wiidn1CRqqujPFNsBM9FoneP/Odejs/vt
         vT+BH+Co4LmYBmfdPm1YF2V6QcJ/C930qzEQVzxrR0uYTDoRO2mx4GNtUrJ9ipQzN9gh
         L9KikoSsvZCA97D8fblpT6jsPEwPXDN+qcoMx46sLfWRarwkcHKo12bwoSJbdMY9+f9o
         JdTfQvRVWlMCj77/uFnluu8R4xF+/4+P6ay7kGvKfvjwELhVEGa/3EcJyd3QwghqUmFw
         9YhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761727951; x=1762332751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PqVjiwHHM6HMBkqOPTdcX/9mwjZ2lFutTM2OIer6Fqg=;
        b=REl2OtHvPPskkXw175Q4QtMWzOKkHuzxuzGFF4O5E4QvVS4Po3gL5xECcuFojXmpvM
         vkKbUUl7kZgDwlfCtJwmtsb/6MAr+zdgR/kH3fMOmmiaqmasigqGO/wFU+nYgGx2YDNt
         y4x+bLOPrmdaNlo1q32XpKW9vv+38wZSUeWO0y+M7n32PXcSoJlZTuvU2+bCExcm1GNM
         EmWqy7KuLTV47F8aX+QBT/IphheXXbXh6XIXEMu4FRJlZt6F1IjnPw0Ae3+Qow2sLDFN
         NiNpOSn0bN+PYwNC0gYfYAYLL5jBSopfEhAH+6+/syh79XZa/Ax/Tm8mCZJ4UYUAM2KU
         rruQ==
X-Gm-Message-State: AOJu0YxVI8iOpczkNZA6jwgppAldmRgeBweAqwAo3C7ZoZnsGMHIAT7k
	iS77I2CFJfhDsCG7GHxCnK1zAFrqvDAc/OAhx10ZtDeX0uVZaN7roBDziR0RUV6sLwoP8knmQx8
	3SFsIbJsdd6+JaiiFcrVau0rrD1pu08e1wTVoPyeTgRRCMbjRQrNcl80zs42Zfer1Mcuv
X-Gm-Gg: ASbGncvQWbbimkqxwf2voo9OUyn3xWLXePTWis9+LnTXHh/LmkzxMEEnNJhZo1vjafP
	iz3rJRg1CntpFTrZxssyE3b1TooAtPis6Z89RV7F1uL+LC0bw4BBydAstk+xD57KJoAf0NG5Exo
	L/NheU63iS71xK/eBgYxIPKNtDhxeCFXHAp0vSySmsIEN1sfmfDVwfmQUSGY92d8ivLY1PDUyel
	q8foU2Zl+IH9Ns0nPhht5PW0JhYYNot1sZhOlPv6O+I1vrY3NqcYIuBiUUD5mSnCaleeSoit3c4
	ehbEVKkhB7b0iynM4g/MuhOLWlrBg2EGD/ohuuhrf0ZDRdcQraK7vTxKo+IHDd+PuCUhO5cN48H
	9parPWWOpnZ/6SOAMkxCH4Vc=
X-Received: by 2002:a05:622a:1191:b0:4e7:24df:920f with SMTP id d75a77b69052e-4ed15a6ab64mr21703131cf.27.1761727951009;
        Wed, 29 Oct 2025 01:52:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOvmSdC4HmFMkbpQe3HllOymugFZ7rqxM8+XOIFsKpoDo9fMiPWIgDHanhaRSDOhK6KmtM4g==
X-Received: by 2002:a05:622a:1191:b0:4e7:24df:920f with SMTP id d75a77b69052e-4ed15a6ab64mr21702871cf.27.1761727950466;
        Wed, 29 Oct 2025 01:52:30 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ed0817602dsm36760171cf.18.2025.10.29.01.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:52:30 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 16:51:38 +0800
Subject: [PATCH v13 5/5] drm/msm: mdss: Add QCS8300 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-qcs8300_mdss-v13-5-e8c8c4f82da2@oss.qualcomm.com>
References: <20251029-qcs8300_mdss-v13-0-e8c8c4f82da2@oss.qualcomm.com>
In-Reply-To: <20251029-qcs8300_mdss-v13-0-e8c8c4f82da2@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761727898; l=988;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=f/HHi/48hqff50ItUhEpqZ+zfupVghiSAFK6cNZOm8A=;
 b=lXTiSppnVE0dqE0qrye4mItP4ncDSpxVMjr9mzUdFBaJRn4RRa6nlFtZAt7flu3pDhV3mLlIC
 GN4wyHDVhcaBZ/+BRwAn+FIKgQypRdAFQgzGBpZhYNA20nxPT5XkuoF
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=6901d5cf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=w6jnlB3v2fMHmChJ9ZgA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: ZdtC9KJkKAGMOpNjJ07FrD8l0MFY3l5B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA2NSBTYWx0ZWRfX7u14bq8iicNr
 oRbpR1agd/OgswSsc+KvSSVu1/cwhrveOSEbDmymjQ8Ff1EF3A+2rVMpHkdYhho17qgVdtggtid
 jUDH73bFr8clz5yvi8uCKAndvRzxMftQD3XnINhHDkl6X9i2sfSgpsHP73yEfqupptPoA4vkjeN
 dj1b6ftHX7KdLBiOr8ag6wpBUFuITlalWlgkPEpLlLxNV1nCioJQ49yE8+mmsGH7YIYJeVGpLCO
 vsbUME+kE+Jv/T52pGf3i+VnySYM8YKOylPGYdQ1Gk/FKmd4qY0D+m/mZ+O7KcqwMvxCVdxaMR3
 tJzm1PhAfnafsstp1MbkiwFGbksIH4TGf4JCjO4Ce/FBDx8l/CGsK0HNGdXq+xjtO0Gy/Wwa4Va
 2KMIfsF+WqptiSkx38PL+eIG4JWcZQ==
X-Proofpoint-GUID: ZdtC9KJkKAGMOpNjJ07FrD8l0MFY3l5B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290065

Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2d0e3e784c04..db2f0064eb72 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -555,6 +555,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,qcs8300-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sar2130p-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sdm670-mdss", .data = &data_76k8 },

-- 
2.43.0


