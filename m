Return-Path: <linux-arm-msm+bounces-89645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B409D3A877
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 13:18:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0D8FD30389A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8CDB21420B;
	Mon, 19 Jan 2026 12:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="obq7xxVR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XI7eqUBN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609EC23AB87
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768825041; cv=none; b=QeOJR5kQ7uPK0fn4EOqTeuFlN+E9KIMqkogVMzZs2DV8HKkm0Uo24t7Ps16Wca0YxDvMcBuaXX/+Ry622Z/XJQX5QDwsS1VoHE56w75qFZY6m6PrbKQSMxRDa5U5vWt+L4JMDv7/sK7YMWo8ktGfLaC6XVoweZfOcHrdExJiYPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768825041; c=relaxed/simple;
	bh=sKKQwB/Ww13iy8a902V0LopTAE5vZckjzbE46YxMyPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u89XrpJYmT3OA+YNAGIQrYDL/kUkgwnC8URxavU5k7YxlgAvKoI3RKnDYEPuGWm7HqslOB6vrDMi5z9f7MgBSLnF0ra/NBrrldh0qayoOVSKQ1ww6iwpQw3lLV16EsZLI7oOyJKmPDX5kJHXejtra+vLCFznwPSTKW5Qr3EdFqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=obq7xxVR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XI7eqUBN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JB7GXY1839156
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K2DDNEPkGNzO2qo7B7YRZVVJuY+Bv0xW+0S4R/akcpE=; b=obq7xxVRcZHxETmd
	VDdDOoGStwDh+fET4bxhqYkdON65QHKWHeWeTm4BB5W6EVTvS0EIih2cMEDyTLvV
	bsU6Eiz8nkfjsVUGymdOTGm1DlBSVPwO/aTSh7PWJE8aso06SnD4utZWVcVCryUP
	8rKeysVHJOdVl51eEte5pALwYaSxrVxLkWw4nQuTQhb1P456qMX25yw7NRTyzxsv
	TCjaRHu36k+6fUCdN949TCXXYZenDWvDOWgF19DYHVe4RAQHpJFBHNDVWMFLsGhE
	lAV0PSHlcW2aaWizNbeI3h1oh1vwhQRV7dMDAvZs3SCGNkkCU0ewdueismQoaZkW
	8QKXGQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bskf885vv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:17:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a360b8086so105568376d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 04:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768825038; x=1769429838; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K2DDNEPkGNzO2qo7B7YRZVVJuY+Bv0xW+0S4R/akcpE=;
        b=XI7eqUBNZJRPomG0o6bvC+34aW/d5zMoxHdpSK3nnksfxbNUoxDzDl3h/d9NY7BOpi
         63pYhHu6b84XzIQRIFE+nejjAafYuxvI7vm1VOZqwXwnQ3H0IhO+RjB0s74l2AUV1boE
         SG8YJUedooDFO562xXyFucpQdSgJXAlB1a7CsqUHMjVrgTKTy7qyv6KR1tBF+l73qLup
         SIhUjBKwc9we8jqqOrI1Nho7tDucKkiRHSUmiu3hs+VjnVvVEx++5Pjc9+BrAiRkGOrc
         IQMpNakfIe1o6oDqiK1SFHx6pHqT1Z+T7a1eJWtMdkqWBFsbJTMHRmAsEFP2RXynTx2W
         7Wlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768825038; x=1769429838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K2DDNEPkGNzO2qo7B7YRZVVJuY+Bv0xW+0S4R/akcpE=;
        b=XpXTw8YWguQw9gYD2XUApEIlfORjewtvnzUZahxUoCIy6OLMsgoD8auOTsW2Y9hw/T
         yFYiO7Z6yJbMDSUVn2Mlb5hx4fQJmtW/SWGsW7oF4JNZ3mM2Lx+N7zPpNjplfvIjRKfV
         TignTDDHZg3OwtEVTTXuEilD4sQN5kcecrQNZ6+TJPx5Xhj0tLCt4okZU8pxqm/eq+XO
         muhXuTyrg9ijG32ovTDYkiDJWIUJZuX9cnoekB4cI5K4/m82QIa0lyQDdXV1lzUUguPC
         6Yj5hajJsSSnwqaIbtBpx3igrgjGpwoNwdYtM3hZ5xzHm+wqBV7iNDt64CE/tg2kS0Gq
         9HUw==
X-Gm-Message-State: AOJu0YxMk4pWEHCt1LMMgAcEwxzE3lKpZbPyEeZTswTaObuhkaGoQ/rl
	BUr/5nmyaiz2E+tVpJrRS95OmsZTCZWSzT4kq3T6Pzb8hJuzne+xC8bbJGEj491FNFnxZ25NgDD
	JA8gXMUFMRPkkZH+e0aR6Rz/dRSTk4tNxcxzbhKodTkQ3t6ZoVMGY0wY8CVqNULjV2jGy
X-Gm-Gg: AZuq6aJs/3rfNkntL0LLMUFI4iKIp0w2dZkJ5XNKlNifF723pRUuh4ljbp+PUx+WTQl
	X5zvB6EIYatWLqJ96lydCxJHIivfxJd7xqFJQNPag+YBI4n1vBaZJnAW4MOyKD5yXpYBti+Oy0+
	sZDtuZRdHawHuDM0xU3cmSM9j4A0+EWxSd4xNGPNkVTfJlvQtFMGYKf0M4+dkgHNZWLOl9NdgMz
	MzA3Kt24Td88P3ldOjTd9HJBl7Twt7VFdfcsNAV7Nis1+HXL5hxq6UkMu5dbkt903cNVGVLCaxj
	WlOHJFY7ODq/2L2VGNoJRHhIpGtSAXikh9SiW8ZHoFWmYYni6ZhIlcF3Y7zr5tmywwx4rlZ/lZD
	KoF87GDUJ+1XWSAFX+ZNeD2+z9ql3tFlVVcPb+dCeOtCyEQ0GwrNgQzfIOafKbzxchW4oWoC7MX
	MHW1VEZPVVrpQsDEMcTQhW2Uc=
X-Received: by 2002:ad4:4ee1:0:b0:888:8804:50f4 with SMTP id 6a1803df08f44-8942dd2bbefmr164876056d6.20.1768825038376;
        Mon, 19 Jan 2026 04:17:18 -0800 (PST)
X-Received: by 2002:ad4:4ee1:0:b0:888:8804:50f4 with SMTP id 6a1803df08f44-8942dd2bbefmr164875746d6.20.1768825037967;
        Mon, 19 Jan 2026 04:17:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3a17b9sm3274641e87.92.2026.01.19.04.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 04:17:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 14:16:37 +0200
Subject: [PATCH v4 1/4] drm/msm/mdss: correct HBB programmed on UBWC 5.x
 and 6.x devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-msm-ubwc-fixes-v4-1-0987acc0427f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1248;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sKKQwB/Ww13iy8a902V0LopTAE5vZckjzbE46YxMyPE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbiDL4X+M6uTUV039bM0Krcqx4R4SL7dj+wjPm
 +9j3R+CGuCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW4gywAKCRCLPIo+Aiko
 1eUvB/wPKGLVePsM+jG46z8z8T+4NRTsQp6ZWb3KQgnHMdv7R2g9hGINKNTRd4SZmcpW+pnhiqr
 MHfy6JhzVE1CUOkt/zYlREuteQomH2O4/ZSIeuWDyQA0qbIy7QHGmll7eHGT53ryqMLQy0V5fKJ
 DiCAqYIrazrWIJ97wVg886OloVJaOV7FTc05DTSmP1Fe0AvA5QpUQH26XQaXQs2YxjhQomca2tl
 KF6/SzOGhUllXGYHzrgfdvmmlg47LTbtPTchGwFdFWPnc6bGOoeUH3uuIeE1OaJ1b1mY/UPd6vi
 440j+aJWPsEEZ/NLAREbFswRkbbTTk/bNEDQWEXJ/5bFkFIg
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwMiBTYWx0ZWRfX/MeYTHVG2q5r
 CRlJpzS2rFIeB+ubJuY3ZeYx45DHXxG9SYz5QnF+9/GAWRtuQnRKW3XxcU3MJTzEyYlsKFalo24
 JTgEvRV0P4l0sovDJYwtGcGY9SAQV16XsaDbsFVWWxbxnyiSC+qHs97uw96qLHfn2spaXkfZsea
 l36gCOJxy9DDU0F9t85VXP2rk2dv0Rzp0EAWNKnbrNEgWnKQIi7Mjw/NBnd+pnWETwMW4PAu4Bo
 +5/kz3K81w5VHrIUgqitzh5OgY5Y7v4AWn8nl38oA6AIRwgtzOFKJ+lCrgrP+Jnl9zDwlTjnhQA
 6BzirIS+UOpupJKmoOtgl3rq11TNXw3wUTiFOPHD1Z/zU5TsOPuBRFGGXZl6STjYIl8TZ5SZphe
 SjXA7jLdBtZpICBLVact50vvmEkr+sKqHTrFLonBnnuT65usrWyy0SKYQEqPT+raSQLNN6yZgfe
 g2DD/UHz2q/j6HQrRoQ==
X-Authority-Analysis: v=2.4 cv=H97WAuYi c=1 sm=1 tr=0 ts=696e20cf cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VBuLEOLxEfejlaYavu0A:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: AZL9dtXiMJuuP6wfljZbF94sLHgQB46r
X-Proofpoint-GUID: AZL9dtXiMJuuP6wfljZbF94sLHgQB46r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190102

As in the previous generations, on UBWC 5.x and 6.x devices the Highest
Bank Bit value should be programmed into the hardware with the offset of
-13.  Correct the value written into the register to prevent
unpredictable results.

Fixes: 227d4ce0b09e ("drm/msm: Offset MDSS HBB value by 13")
Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index bf9a33e925ac..910242f5a71f 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -229,7 +229,7 @@ static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
-		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;

-- 
2.47.3


