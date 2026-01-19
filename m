Return-Path: <linux-arm-msm+bounces-89646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAA6D3A87A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 13:19:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 87219303B15D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB99D32142A;
	Mon, 19 Jan 2026 12:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fe/Zr1x3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lab8NwCW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613C22512E6
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768825042; cv=none; b=ZYj8RB8vz6qJ60QRSjhly6FrtOY/FG6V64ZGZVP/1SMNlmxLeN6g/KFVVMfplicnUs68coLGGWgRgM14hA+1Kd6uV7vXQxXO17CymCboius624YXRsss6N9aYC6XWO83aMF+h8lVfIGP3uIKXrejsXaVSGlVKwWOdn8dxiD+ZR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768825042; c=relaxed/simple;
	bh=PZQ/HyJUBzLI4q25Cr4PA1zrRatPlEyyxDNqfDEZSTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uSfCdD851nZy0VgzmqsxYgolzt5BH1qvJGKbJyR6dMMK6zlcOXpfuI9+iuQvdasHiXAD0Pa/tpKOVu3rNHXssNCrR1t9998MJV4Uwcc9cS8Fpi9fEZoo72fEPjaTyG4tyWl1vRLbt9FWk7yqQcGFc6v3E0W/HNJ0fVvsMT0BmqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fe/Zr1x3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lab8NwCW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90wfJ1044118
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6qC/9vKSzQzUUoZh2ZSv3mwkxmrw/IyTUO/hV1ChtFs=; b=fe/Zr1x3pNkHSHYw
	CLzWIFNmqZkyHn3sHTZV7hpcppDAM0emR/uMPBk256pr2HOWjLLn98BqQPwUaWb9
	AdctIhHq1JAhtsecMqtxt1SpLUHBnJt7qF7nCPoWfrGQAZtH5wMaQbIxn/z/vjqv
	XLRKg3xkQaSBMwQQOrOBsUQIoqk6HhmPt2epxquU+N7xAxiJBfrG07ZkFVmdWXQR
	cWyhp/kqMrYFyyX00aXtq1J1/FtSI76vhOHRiYICwFOMC11lDopEBehcf6mvzdSW
	6bZFaXxCbiIHTdn0bmDvMm6dEalE6DsvhrLcnXfvO27/pNMlsfxlXjIDdz6ZwqId
	y4q00g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bs79ej2k0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:17:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50142190becso124466561cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 04:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768825040; x=1769429840; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6qC/9vKSzQzUUoZh2ZSv3mwkxmrw/IyTUO/hV1ChtFs=;
        b=Lab8NwCW5XeF2R5xT1bdGvTFgnlcD2Dpd5Zs1TyDeFmBuMZEw5usZ5zBqvMc9FLGAh
         DvFaPwcULpm7bOzi8q8mCBnQEsuUi/BXPEJpkE/4UtdaQl+7PQroj35W5gzLy681Mlmi
         IiSgrKU9b8L8s2F+oetrgZx24d8Ow8tKJiVbcb5r36W+HzDlkUVDO/rvpsqFoXYHTg3G
         Hye26eD6LyThvMkdbbjXLPBAVWNDdSLu4dz/SWC7twSntTXG+pIR+cUsHli5mCAfbCGR
         YyxOBxiNSOO91Cnahv3wRJblJEzdnzyXTaR8DsaBr8cEcS4K0/cd7R4Fp2csjYuSd16p
         BY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768825040; x=1769429840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6qC/9vKSzQzUUoZh2ZSv3mwkxmrw/IyTUO/hV1ChtFs=;
        b=T4eSWw4yMXtLMYbcQQOyJ5NPBCROuRzAcBKFD3kX844ChbNoeKXAnungrg8y+HNotY
         XeW/WnmszCRf6aWsYTuuXrbZpu3usPVxmeTFWEbCJk+sS/2mrnS1jqlUER/5+pArkbQ/
         7EY+eTdLqFcXr9Zf+8TKM7G2DRK1DBSgztf0JiL1u6wTAqKVH64OyOYkX1O9LCUGcakO
         wJtr/Yf3thAbDV9hYb4ou3s+psMliAEviugxrA4EgPUbg224edBbKR5kBQWhrAFQCabH
         Xodn/jV639l/X4IywCYcjtWZOC3hvaSy5C8dfiZBNnh1OBF4fG1tgaTtRo48CDWis10f
         2+IQ==
X-Gm-Message-State: AOJu0YzwF5ULO0Vibu3ALnLzPX1aUXY9xXH2byg792JPkLTHe6HpXTU1
	r7HzOwD2syUVlpDiY57gswLldzYtrVNk0vbw/DugaKbg/3divZT0VGld02LsZNQI4K/9BKQo810
	OCU6MAY/Kwir9KK3wGu6r803C+gTyVsBkhs5mKcaUWWLljp1FwuZv/y2i/YnNaDa9BYLp
X-Gm-Gg: AY/fxX4ELQmw1Oo+grw2bEI7J072f1mMdI37t8I3L7qw5E+g2lMMdx/ykkFcZGCljFs
	Eeg92/PtJJf644gJDprAakODCFqULdLalFdVsVjVbK+2gHE5rCFTROoN3HbPuaIWlkY2Qvbp7Yj
	th1o7Ic4KLhG8U2pcVGHz9W1Ad3yLxdGwQqNNqQi25k9DFPCpa1TCOszVGEEOewPDIaXrz/+pfM
	R6F/0twpNjVP8XQM+X8BRSCzuW2lJls0OIMKklbWz+kBea3R9C3Fj8+LNJIca5Uae+OQ9fH/aE4
	su6Ur3tND4Tfes0l+BxQ7fCssX27G8947xmq4ZgHciShgwFCPGqQdiBI0W1/ZuEfKscTyPZtvci
	lwle4VdYM0FMFSyiIrDxlZjy8+FIDQCijL8VC57AHwUapBQlXS2OfeNPl4ykw5rN+1QCJP59vxO
	UCkf7ajzFJssXLKzEqmkdxeTc=
X-Received: by 2002:a05:620a:258c:b0:8a0:fb41:7f3c with SMTP id af79cd13be357-8c6a66f8dd9mr1536272285a.27.1768825039605;
        Mon, 19 Jan 2026 04:17:19 -0800 (PST)
X-Received: by 2002:a05:620a:258c:b0:8a0:fb41:7f3c with SMTP id af79cd13be357-8c6a66f8dd9mr1536268385a.27.1768825039101;
        Mon, 19 Jan 2026 04:17:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3a17b9sm3274641e87.92.2026.01.19.04.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 04:17:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 14:16:38 +0200
Subject: [PATCH v4 2/4] drm/msm/dpu: offset HBB values written to DPU by
 -13
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-msm-ubwc-fixes-v4-2-0987acc0427f@oss.qualcomm.com>
References: <20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2116;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PZQ/HyJUBzLI4q25Cr4PA1zrRatPlEyyxDNqfDEZSTM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbiDLFZ6M1k9Dzt0HQxU81lGHZ4S1WCvcUQ6j1
 i3M8BIIrfWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW4gywAKCRCLPIo+Aiko
 1cxpB/91qJ3F2Z6sVCwbnkATmecyx5/y180v0zAcduBX+E2Kd2Iox9l0bwlm7oingvUb/gMg6Vu
 i2Ft6jpcsEfxJP8LNm+ejWozDd2PUvErw06rAdh+MGdtindnXY8Bfhw9aI/ewgkNKFbK7daxaGu
 njAUPDg1TVFw4FTnWsZwd+DduBpK0ESNBKp/ER05/Lif+vyelQb/cS4XirEm2/zmnQslYYz9S0W
 M0kIi9vykXTmOvvFOY2t9NAbIpgBhKMXyyKWfkSLahLQqQkdH1b6DLZ/9luezikfV+Lbey88ugi
 zf3MqRbicIbWStMiKxerkCna3iTtmZforsH3q8yW9V/A+sPZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwMiBTYWx0ZWRfX22VYh+yHYFnU
 XVW13ZyfHaKPoglbh9sMijmAjzmgkaAuLTeZ6IxIDRCRbgSe1PWorWLWcMkUUybjbtJ9wBxFQKy
 GFopgWtJ7wcX61P3fWZA1kkbnW99XRj2nZXMfnVQjngVH623L1BpyP4VRQhFGkCbf7Epat7+vpE
 HWPXqRRsHT67iFfQgzkG5fmflVDgKlGp1JTp9X0JqVPR3m7kMkr/Fv0MYVjGTnQNRjC5ZevI2R4
 FhNxAIF1vZb9xxT76XIyMptr5UD2thnf8F98mxeJXlq0Ce/Mo0p+eKopFYGtDgyDjuiK0u4CSQV
 WN1DT0sIWBSoIoOfy/+NOdfOya1MSioYxTRwED4ZrPZ85Fmw7TDjcGBTuuW9ngRgPozlQhOIJtz
 NXKIQbPSmiDxXcjhNZ0JPOiPo8dnHCrRhBk4pFoRYw/iwUanJya5A67ioo1ghArh/ilUF5qPsDR
 gU+qPQ6WzRYs3Ksq3fA==
X-Authority-Analysis: v=2.4 cv=NY3rFmD4 c=1 sm=1 tr=0 ts=696e20d0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1unLKcHO38ebvhyrShMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: mw5H1IlMnpbGDx1zLq2JpUzMqb8xygmS
X-Proofpoint-GUID: mw5H1IlMnpbGDx1zLq2JpUzMqb8xygmS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190102

As in all other places, the Highest Bank Bit value should be programmed
into the hardware with the offset of -13.  Correct the value written
into the register to prevent unpredictable results.

Fixes: 227d4ce0b09e ("drm/msm: Offset MDSS HBB value by 13")
Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


