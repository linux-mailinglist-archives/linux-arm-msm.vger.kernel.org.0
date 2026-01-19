Return-Path: <linux-arm-msm+bounces-89581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56682D3A13C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 09:18:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 995CA3062D7D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 08:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3543F33CEBB;
	Mon, 19 Jan 2026 08:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A42zWdUY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gc2xA/Gf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A642733CE8B
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768810644; cv=none; b=BJJDjLwbS/L+LWmL3RX2HYtygdsBTomE+gXleYSYENXG0XZF2Nyfrvrn5VGyzI+jigoLV1FOhJMqwwgFFXfr5DTHnpd0A5gIZEVeajS9Y62r+0I1hob+tqMu2YArTPqkm4/VLrDm/RSOdvhT1hcR2Xfe+bE4Ew/CneVMkz0E3rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768810644; c=relaxed/simple;
	bh=HWBT7H+ACSNaTYDAPUtOQBPmeUobbB01ZGnKJJ3+Wc8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LHkdxK348Ds4IQCTDIDMFS+0wKC4eXanpIHRHBT/SOKAkJVKl1Kpus1Or5bUTBn8YrfKrj3M5McocKcG/nKj1+gnjfIdXEjh2yUWbSP3gpkeTcS1gERqO/5VjYW/L5jBInm9IAapH2h44MEM8lGQjvP1V8xU/9Mv9TYdHTw8M9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A42zWdUY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gc2xA/Gf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J7sSmX1742535
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xMzeLdH4gkDYQXE3MEX/WwUYO0IiYwGQ9/Yw/tKZcNI=; b=A42zWdUYIYOrD0G+
	/o+bZvDph2WavJ8bAhIZL6ZX1FVFRPS0a3jaHqzOQfe4pUsOoawGVTqkQsk9w/60
	ExxdQNpkttSKJnFn/3vRFnCy12LbkPEvR3+GNITGU72xPwBi6UGtCG8/3bllcCgw
	mVcpF4pzQFGSpmSs8oroY/HmM2eoSzQG5w3GRNBvGT9Y08YKI527qj/8QLI2qK0I
	A+2316rAmX2mCAENp4x+TWitxl0y7j8p/f7xagPzhTVrsv2xuxrHZZTBMm18pAEv
	3YzeRG14qpS9E24mxZ90tea4/ahE+1VTpaLfL6Hvb7eRUqAMBAXcVQYWL6aSrVXY
	JqO/FA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgmu83xb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:17:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c5311864d9so878375685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 00:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768810641; x=1769415441; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xMzeLdH4gkDYQXE3MEX/WwUYO0IiYwGQ9/Yw/tKZcNI=;
        b=Gc2xA/GfWOyzDRI7AaP6FtVIErud6G3KvuGTIKASouSx5kazRRquJfrImOof99yu58
         1O/ArFeX/q3SI2H+bKSLlPekX9nRoXPxz3ll7a07daExU+To5KBy1sU3H8Mj5AZ5t8Qq
         eq74BX5picPejylFPkc7ukxC+Xi+aHfJROGtc+7GYynrX/LYTK4yC5DChSzdv1frD53j
         aeqf7UW93ypoCwYrtmnldC3mgf/Om7RiIQlXPhCEprWn4aiA7c1cj6OcjS1mtdNmKdAD
         vCrPWmGAvJGx0AwLkpApuHHiEWBBghVWNCgZSCZHlqUQxcHiqfwxCWhawzAj6JSd9w+u
         JbXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768810641; x=1769415441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xMzeLdH4gkDYQXE3MEX/WwUYO0IiYwGQ9/Yw/tKZcNI=;
        b=UlTdpJMYzVdqvrkE6TaKjwOId+GC770qUoFad9EU3T+zXKTBsPfK5hM5HvK1RQn4hd
         h/+Ms7HkIAHXqfBhhvMdc+x6cxLLVvdp8OpPbCVRlDxXcKTuzhw4CwFGJIOuqdeHHFve
         mfaaSp8iR4xjurvKZfNc8psoryPiIXLaYbPu5G9MUXh4yJR8sjsxS8HAU1jjn4oBInLN
         mS8JxVIK9K1AwSFM6secPQwfBzlgGW+7ZEFQQFrLsmzri44TaacXhuZAepd1MZG1FcHm
         pAeCzhV96ZBSe3ndLuMOFV2n+5rW/idV7xyCQbbBy+y4LokiPMS9bsjWJyBVE3nyzPZa
         kVSA==
X-Gm-Message-State: AOJu0YxpbsBQMFN1a7ISxVdwS6zSl6yzl2g8HnPE0g+JLelXHvapvCwr
	i/k662+JNnPKdGdCvTSxJKKE+W/u2idhX4P8LtV4V/F7P78TvhzSpkFgAmCYeuZgPEKt28R/uOJ
	Dy+OG05XUwviSzwvEtse9pFHdCQTk5Ca3dmsN6uwkfS0y3OkqbEirS297Qnw4QrgrYcQf
X-Gm-Gg: AY/fxX6Z8vWxFviEk9mvfx2+8ADasL+LpyuIV6eojUbZT9ytjiZGloxIE/XqIoBCBNB
	k9keSTMLVvLgMGKvrMag7zVAf2Zh8HW9LmhzTx+lmVkDLwMnfU1s9AMSuQX3w/j8M5g8e9aLKYO
	N/WW0iDzOrvJSAmgqu7+aPQCV3/O0rjKRJTIZhe+dfBPdzpvAMObWFkaLSGcASv4u6MzUq021zR
	TPjJ9QgeLne+TA1vbR4tbBZeA6P9RfvgbXXBBRUC9M9eKkd7nvGPmIAzD6BfjC74M3z4OOzQ/AU
	1FeRK9PP2uHTxm8+Ca6171T6NKJjs5YMcW94JKGf2ixHlxnUa40edjnmyc8joyu/3+MzPpgfEP/
	SClxuwRwuiCTxmcqNgEGxtzrXrK1rXasiNYjsUMYy3tnvPEe071sBCJNoo3ffvSWay4dpV40uff
	G/NldNdIDDWGVI4TBnyOIKo2I=
X-Received: by 2002:a05:620a:4043:b0:8c6:b14e:655d with SMTP id af79cd13be357-8c6b14e660fmr970510585a.74.1768810640894;
        Mon, 19 Jan 2026 00:17:20 -0800 (PST)
X-Received: by 2002:a05:620a:4043:b0:8c6:b14e:655d with SMTP id af79cd13be357-8c6b14e660fmr970508285a.74.1768810640371;
        Mon, 19 Jan 2026 00:17:20 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384dbec4dsm29636391fa.20.2026.01.19.00.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:17:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 10:17:15 +0200
Subject: [PATCH v3 2/4] drm/msm/dpu: offset HBB values written to DPU by
 -13
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-msm-ubwc-fixes-v3-2-34aaa672c829@oss.qualcomm.com>
References: <20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Val Packett <val@packett.cool>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2055;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HWBT7H+ACSNaTYDAPUtOQBPmeUobbB01ZGnKJJ3+Wc8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbeiL3Nd+yf7puUGMY7KuxkWqmbU6DWV2RZ773
 F67oFji852JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW3oiwAKCRCLPIo+Aiko
 1SRyB/wKRd14DtwJro7LaLDkuj2jMns/ytO0vlhsDsFlv+Q/Fqae9x88klP0cZGKJ8lo8VuVhBx
 1aZbO/P1jnM15YO1zOpdxhPSIFdSvm2jNocHZw/cD9jQNX7j8TboVeyikDRGRlHz6kyrVLAG94j
 JT97VDxWjGhJXEsMb9VX71mmJ/wKPSwEhLcwvt0UYOXxk5b+OdzCN1Wzgt3xtjc01CDv4uH2spX
 ZnDAX2JIrywtMjgNJBgDKIMWEp5asWACxVF2TAClZJ+jM6z55sC+as3fARVyYl7H7UnGuV0BE4J
 jsEAzASMscpw0+tuedB8HbdmUQYyhY/6oJfB2BqY3YTTPrTW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2NyBTYWx0ZWRfX74rpub97XVzS
 3DF+79b63Ic9BHVjI2gTiQ/D1RD7sDB6AqCtT2nNm61tN8XgtNPtDIBC8uNBsGrEx+GQRxX1OMN
 1mhf9fFQn77Phy8vufOFGweUkzzLvG4P/n+BJGEtPZDxHL3DVbC7IsISivo7RkUitb5nMHNQtFv
 xGjwiuRSxGCT46KCgelat0QY2QwWol6oVWpe/CmTMbWgEcYrp+J+aK8pt4NnNw/SuxLQ2aEY8te
 /wzM3uaDkTyK8d7mnR5uSYydxY1T/AyWACekOtXxeXNUu6LDzQrSiGEQ4cg+9Q7IopJN0akD6we
 A7eyFPks5wGl0gHWl++3nZMUwdhdocBC25WK5vnlgqnR9GugYpgrLcHSVBe+MYV+OQ4zNXAM+8B
 gGUm/KOYZvr9jEPRSyulujJuYfoST5fBn8PoiZc+gSRKMFA9ExCMK4qz8e7idhA1Z3xT7AXFuKH
 CUcWOugGSWY5y1tht/A==
X-Authority-Analysis: v=2.4 cv=Is4Tsb/g c=1 sm=1 tr=0 ts=696de891 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VBuLEOLxEfejlaYavu0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: CNKTcAQTHWSgUQ3vGXkwoZelo34Sezs2
X-Proofpoint-GUID: CNKTcAQTHWSgUQ3vGXkwoZelo34Sezs2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190067

As in all other places, the Highest Bank Bit value should be programmed
into the hardware with the offset of -13.  Correct the value written
into the register to prevent unpredictable results.

Fixes: 227d4ce0b09e ("drm/msm: Offset MDSS HBB value by 13")
Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 6f1fc790ad6d..b66c4cb5760c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -270,30 +270,32 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		((fmt->bpp - 1) << 9);
 
 	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
+		u32 hbb = ctx->ubwc->highest_bank_bit - 13;
+
 		if (MSM_FORMAT_IS_UBWC(fmt))
 			opmode |= MDSS_MDP_OP_BWC_EN;
 		src_format |= (fmt->fetch_mode & 3) << 30; /*FRAME_FORMAT */
 		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
 			DPU_FETCH_CONFIG_RESET_VALUE |
-			ctx->ubwc->highest_bank_bit << 18);
+			hbb << 18);
 		switch (ctx->ubwc->ubwc_enc_version) {
 		case UBWC_1_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
 					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
 					BIT(8) |
-					(ctx->ubwc->highest_bank_bit << 4));
+					(hbb << 4));
 			break;
 		case UBWC_2_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
 					fast_clear | (ctx->ubwc->ubwc_swizzle) |
-					(ctx->ubwc->highest_bank_bit << 4));
+					(hbb << 4));
 			break;
 		case UBWC_3_0:
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
 					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
-					(ctx->ubwc->highest_bank_bit << 4));
+					(hbb << 4));
 			break;
 		case UBWC_4_0:
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,

-- 
2.47.3


