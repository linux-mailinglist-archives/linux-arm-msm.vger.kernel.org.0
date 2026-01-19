Return-Path: <linux-arm-msm+bounces-89576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 250FED3A11B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 09:14:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ED0E130019CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 08:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893C133BBBD;
	Mon, 19 Jan 2026 08:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f/8ul0m/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KpXdETO+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FFC33B960
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768810487; cv=none; b=lPS6dd+0OqYb/eh2yhNJQwVDX2av299zaEyCqjDCyFJ9KEs566ln95yz66XghDAfsCtlldCpgVtqgGuIGLnwnmGPgdCO0GnGiCwxpg139jwLkwL62ZiNQWlHPAtvIwQRa9+UrFikERj5pCMtR7NDLYsXxfdcvN+7P1Av8fLCwEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768810487; c=relaxed/simple;
	bh=pAwvHUCEcXNpm+LDy8SETL5I47IZwg6IMDS0FVV1308=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g4hLfJ5kS+Id53IDhYg52PiI2MAd8Pn4r5q5LAoS8yl2SZlJuW+FOt2Lrm8h8k12BAzKPKg22wkubjcV7mY5T/D5vxwCtOpwShXnWLsvtYRpkzWu5dLEmbXvjBQ8bqqtoAUXrdd5oprtNbwirLHm/oloh9Nt4N44yYkoc9Bhvso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f/8ul0m/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KpXdETO+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J80KHH3749033
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q2s2/Y+rMi8EkXfWOzNwWPKg5Sl+rEgH1nG07NabTws=; b=f/8ul0m/k9Mtusu0
	O4fVRPgrk/fKyS0leQJqStHmbFxAVcFnRKSejveBzuAEhqyMDNKSvywms5UkpQ4x
	/+NWDGCkne5xd4gHH/fljmnmh0P6tIJhvk4r+UQ+rK6hB+ldU175HNUQGbsdDKgj
	50AA01vjl8UagFhuip9oLiQojsQfzt8An4iJA/Fgi/pR2qqx1R9A/pWcKKARKuDs
	OTaDHaRPd0yBfzpizFt/gal+HiY1F9zDOngL+IW2rzB9DteDl7n7gc7PpzTLYlEy
	/ku1xqkG+G/KYlmgPqqf/N9my6CPm1kewV/RUY8Sg+1UO3h6R0WZUzKyALYBTsYH
	4d7e2Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bs79eha09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:14:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8bc4493d315so1167406285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 00:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768810484; x=1769415284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q2s2/Y+rMi8EkXfWOzNwWPKg5Sl+rEgH1nG07NabTws=;
        b=KpXdETO+KFXkyuV68skJ4La/IsDVo8t938LPrsNlI4rTS55BbWU1+UqU2UibYY1JJf
         m8nS10bt1lvP2VrTb+p26fQNV2Jtl3al6K/mEjnify+xtjx8cVdMCE909jTXQGuGiulS
         uvnrqXco4pzgvjZ8+hzQf+GHOP9wVeOL9N7WyZmlPiqZqPEU3GtlffDPcm52WlxDXkyz
         /eXmCJoVlySbHJb9wN+HcNcZ8x9K6jVKbWTOf1umrYXwn/WKpMjuKsJ+G+GrIF+nPZii
         rJRrtsl+1flhAGEt/QGI/jfFka/dypyzFwbeF/7DzbxSpeV4yydTUx/WX+eQxowkn/tl
         ovsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768810484; x=1769415284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q2s2/Y+rMi8EkXfWOzNwWPKg5Sl+rEgH1nG07NabTws=;
        b=c06Q6sO2ezzl7PU9LbDAc7wQwjCmadpzmxyy4bfzfhXcvG1au5nUO1JU5kMAZUfgBK
         f/hdckSdRcNUInZWHPHm6mjZIZgKtwoADE5HB0tnyqi/N6Yjc4uiXVsJpd6q4qdXFxCq
         T03VUPsVm3IkMXciuKGI7srPO02mIvWpjKWUkC20KhB4flfkOpUYri3FCMrSMvR9m6+z
         Bp7hJXZyn3ELKUdyPTP+fMUF/9nLbqSZT38OX0n6d8kF2EifgfT76S5gRO/bHk2pbSdv
         AESPRB4jiBIcOmgZZwZetYOcI8Au62WPDd9zsXwQsztPzrOUdFjz1P1lOTANf3iPfIA/
         imuA==
X-Gm-Message-State: AOJu0Ywkp+A65BpoaQp0UA7lY27eUBQV+1Ct0cXm7GvUe/jtgdLt4YOV
	J+hosAZfT5dCOWVnxMz7gAj+NfdhffdYzKZpGqhgxaQNcPPwjtEMOqwAblsLJojEJRmaYKH8fnp
	/pSg0TbIF+9Y2xMhWBBmjj1E/SzjM6CTgDA+2m4WHe/7DETRJ+jFo1MWV/yQPVehHAc4v4Wh3L0
	66
X-Gm-Gg: AY/fxX5GZa0ceF02c6wt2wpUY2vsJwr437ryA72tgRQmZ7I/4vGKEx+k92nsZtp4DQG
	q/RmiNDeNq8nTjga0kunQUwFhFOiJEiyDcn6bBzK1ysD2Ny/BmMxQ957+MQcmNMRG04PGQZ0xb8
	nnua5vZ2+20FUIz1VxFcdFcUG5B/JTlYqQwfVHCSITFgBtbO2Oc64gvmReXgWB6mbb6SB33okyq
	cWkG+yuaZM6k7tI6oHUgOY/8vekVnjGnT7RT4IXU9JsATcxXbCRIN1Dt6afeIBvOpxQ5FW6mveE
	9lNEWQ01+8yLvYr0U0isf2scKrWBdEunbY1f1817ejJKyIJmH4tqOc+3SJYgFQDa9/eMSYPUaye
	lpMwi1smYNW5b0MihrPlfMriKc+VT7eTPD0yDiLpzLb0vlYUY/j064N31Gw/bYOpRvlP+F4NdwI
	7VTpj2XnUa90kzJvrIja7wkys=
X-Received: by 2002:a05:620a:8186:b0:8c5:4e48:c908 with SMTP id af79cd13be357-8c6a68d9cf6mr1151899585a.27.1768810484200;
        Mon, 19 Jan 2026 00:14:44 -0800 (PST)
X-Received: by 2002:a05:620a:8186:b0:8c5:4e48:c908 with SMTP id af79cd13be357-8c6a68d9cf6mr1151898085a.27.1768810483806;
        Mon, 19 Jan 2026 00:14:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf34d572sm3063845e87.24.2026.01.19.00.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:14:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 10:14:38 +0200
Subject: [PATCH v2 2/4] drm/msm/dpu: offset HBB values written to DPU by
 -13
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-msm-ubwc-fixes-v2-2-e0c8c630fdd3@oss.qualcomm.com>
References: <20260119-msm-ubwc-fixes-v2-0-e0c8c630fdd3@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v2-0-e0c8c630fdd3@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1982;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pAwvHUCEcXNpm+LDy8SETL5I47IZwg6IMDS0FVV1308=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbefulaU81WiHXID2ucRCwgIoY/i44V65kXGZq
 PlYEDN++fWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW3n7gAKCRCLPIo+Aiko
 1RgJB/9wF+X3VBdjncUszdIcvNEvKE56cWE58F1+MNVBscWHvaZpjbqub1DQ93KaB24e/cKF3MP
 ow8jjcMzlCQQDgVQ6wJrrDZrNQ+pquybiDnRhZznfMMZggxJkULXNIer+RVanIPnaNOyz7ZZRIN
 4au+ggELHPCNXRMTHUIiwzRSl1pkh4C594S4fTiGuZvx0QECDApHBWAhWG8qkGzOy1Zco1r0qaj
 8BBFBAuzQO9JJ9x3W/0GVZkAepKsvt6MytM74UPJQrfYa1DW0DuAQKbMbZLZlYylPoIRdTZSTDR
 Vzkjtq8W/gxNR7sKhhrY5E+y9ENQNAZwEOyIMlXfzDv9BIzX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2NiBTYWx0ZWRfX2K+tDvt2qrIQ
 /OlQSIbaq57k7jaOUdLWvTCo01W/KC0bvlX5+JMM92QMRcOFnJmEtQLPlmIDDL+BIrTlNhNkWri
 rOTc1HBVwHVIl8XsxFdgxLrXHVjz3FyGDN2wGuIdC7WhqauPXedOtaXaIqOa/g3Pv4Q0z/uY4pU
 xpGVQLkENeccM9fUc5/D3yBVctpNWYVuVeUo4iDSArdxEWv9Asn0ybE9Z4w4SjQIX9sy2e3PT7+
 GvDsVdtGF/iZT7WUsu8IuQvQtoKYhOnpLJ9AVgd2+V4CNjYGY18sNAGAa2bcACccPEP74TyRF3g
 i1/0B62kCSvjSepDF0s3sO87AhnzegEYmDV9RTF8TqiCUYTBnYWQSoSkwedyAU2DcUfYlXGQtbn
 +4ttT7f5m8pcCoMslGufWOMnrNZMVTjEf2nKguN5kgnQf5u/0228kY3GKds3Hmp3ii1ypdm7N/6
 QtRGb8HLrSixAvG2dWA==
X-Authority-Analysis: v=2.4 cv=NY3rFmD4 c=1 sm=1 tr=0 ts=696de7f5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=iGWu5DhtBPyiFZBs7r8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: YEyaEDTN-On2R346XXo4tVlKxzFLpqDb
X-Proofpoint-GUID: YEyaEDTN-On2R346XXo4tVlKxzFLpqDb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190066

As in all other places, the Highest Bank Bit value should be programmed
into the hardware with the offset of -13.  Correct the value written
into the register to prevent unpredictable results.

Fixes: 227d4ce0b09e ("drm/msm: Offset MDSS HBB value by 13")
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


