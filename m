Return-Path: <linux-arm-msm+bounces-106377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCQjMx2Q/Gn3RQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:14:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB774E904B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:14:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CDCFC3062EA6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA44B3FB7D9;
	Thu,  7 May 2026 13:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P3yj3RP3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BW/8wuwS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ADB3F54D9
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159055; cv=none; b=cW1mx8NtW3yXEmJf75ooz5Q2Xn6GMjqDRu+YNXHVR7W+CHI0EKIwh5npyT1nAx/GWwcs5Jg7cr3WC3ZD/f6p5CMf0JR17JyTiLCu7qVXkvpwfOLLVrYgsT9U5qKMythZM99sEsscOlgN16IEB3zhsn1c7drzhYXsxhe1Tvh8doE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159055; c=relaxed/simple;
	bh=DoG4I3IZOv3niHJgYIouUp5Khp2qZBqtf+51O62ZQvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n3N5Qsib34/gjm4PDo7m8d3bZB2c4du0GioWIA1r6FU8GtBYWs56sPdhdbi4DvVPt09vu3+aD2niamDvkQNHEU3HPRgJPEpoux8zjR5PK4D19CbGm4UqQDieL0NbWywWw89azngNPZeucxsHqg7GZ/6sb72iJk+QS121L6Jba/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P3yj3RP3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BW/8wuwS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6479vQVA150875
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	65lXVsMjORBSo8yjl1njsl0vBunig5XThYQyN3YvEAg=; b=P3yj3RP34ynowjHc
	KH8tQ62u6AU6lrXx0CswJJpmBkwgPkj6ZCNxOzK13o9g3tetFB7qLoq5HGDKsUaf
	y+xFDsHnZ/bVJ8HRrHPqtVM1cksK4WYWOZsMxzd3JY+Ypx2jFzwwvAztVTlZplmT
	iVhH4vLTShxCaHoOE2c9u6enMAe6ZodTCJ09TEXMU6d/8SOOech0JI+9N/BtCmrK
	BIuriT0jfOhd6SQyaMJ8CPBfrkSur+wFMg4W4VHqzqeXMPJEXHvNVNLQ7rBO+AyD
	/GlTPK7zlQykc7ptTL1pNFmdH8hkskF0rITuwJO/YGnd03ON042gyb3K1nxdTJSd
	QYMLNw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctsw2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:04:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4678c6171so8285745ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159052; x=1778763852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=65lXVsMjORBSo8yjl1njsl0vBunig5XThYQyN3YvEAg=;
        b=BW/8wuwSQBBLfbptfacbAEkxqVwiIdDiYCywSsg+6urMeyY3zvPWVm5KH8PH74grq9
         GNLib2CQ3qwk9eAnrWWl/YYuzhQ+/cR5NRx1fLjlfpMBe6g+y+xu4soPPN3TqJLSB5K+
         iIfjtPCCshIuBYmZF1UhQ6LvPRoRoRDeI9Mm5ADxImEb7yHcptTsjG9Paa1UROzh0fGu
         2W+3x6Ok4wgw84YMNUS82d93/022S9n7X+MR5tk3GcKWmmJXTGKcBdl1YmkVyDgU0QI/
         fcvOJ7P30IZtKDj6YUoYPv8dP1U/MpiP7DGj7FWpfzyd+C69K7uQzkqYi3phw/VJOLxc
         y0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159052; x=1778763852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=65lXVsMjORBSo8yjl1njsl0vBunig5XThYQyN3YvEAg=;
        b=H4vjauwSUt+kPoQrhXYppgKAE2wIihYQ5TSSj+xfFfIXl5GasaOSTHcnmx/pob8AGv
         ExVdGFC9JoRcKciA2r/AisvWQp9FG91wnSJdZ+m6/GHdjTSo2pgX56FQlMpo+wYj1IoJ
         Ifr2yz22FwnZ4K9Zp7KWYVxCG/mzSWtj0EB1KDBvoKr4Vlfjq1c08cPjwRweaArSnmnN
         2xTGrYSX2qBJqvniV1cK3/rkFpujcMwhndubEZpy9rmkiAfxigo+/RBwQTJxswtbz8JV
         TVALQS28yGsJ1V4zZ+Z/muym7E9Ki8ya7rCbAhrqERBYToPRWMA+iKHiX0qT0XXnhTy9
         OeDg==
X-Gm-Message-State: AOJu0Yw1V4i9gHb3Oa1IQt9SJSZ8Ox4yM2rnbvcsqEzzfCtnZ9M/7Bj+
	o5ESuYo/Bvubf8YRfhSxzAzaUxhf9YUBcDdRKBZzQ3dxwcpbJBQmq2+jpaemonUBPvD9QXAsdND
	Iq/1/KpyEOzllm1qE0JH24gPe8haGDG5vpYeuhFcTTB/43zyC+2KQheWtA2j68nGfxmWR
X-Gm-Gg: AeBDietRhUfVw4l8a6s1MySrCdqO1ayrE3Ois2uGnw0pC6s/YLkVEYEMmJAz8TS0pFW
	+ltSNnUoFDU6m0T28KHTU4UajPuOlrdhnnTkvnZdhooB4/Sk5kpLIu1WGbN5Y3OMtoOtkSBd1zv
	emYR9T/TH/p8EM0IyAGgzbN85fqndFpJhU/4tWEpF39sM2lGVMbn9GkPpUTB/gXGZv4mOgWKVHj
	l0+StCmzT/oDqfCWQ6CYjg1fHn/qE5zp7GzOBa6qtLbVG14dmnm/Ar4sInQNXBEPXn4jRK8zdyP
	UtYRFsgslg5A7kLVipV3m12XOjLAE+FxJ7K9d9t8lqtoKAFh5OfdutxyVyZkRa4EGj9CXiAjdVP
	nl/8ngaNhuhGnq815Kw2cAErRDH6IPQQdEV0pWTh/wMFa2jwGGwo1MppnS+BbZtRcBYH/cVGqcf
	FozrBNFC9zHKMgn/IE/5ExaN8j2wOlyfYCSOh9r2+topa7BA==
X-Received: by 2002:a17:903:4b2b:b0:2b7:aa20:3c61 with SMTP id d9443c01a7336-2ba798bb914mr91530695ad.33.1778159051774;
        Thu, 07 May 2026 06:04:11 -0700 (PDT)
X-Received: by 2002:a17:903:4b2b:b0:2b7:aa20:3c61 with SMTP id d9443c01a7336-2ba798bb914mr91529775ad.33.1778159051156;
        Thu, 07 May 2026 06:04:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230c68sm5595959e87.19.2026.05.07.06.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:04:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 16:03:18 +0300
Subject: [PATCH v4 22/29] drm/msm/dpu: invert the order of UBWC checks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ubwc-rework-v4-22-c19593d20c1d@oss.qualcomm.com>
References: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
In-Reply-To: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3192;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DoG4I3IZOv3niHJgYIouUp5Khp2qZBqtf+51O62ZQvs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/I2HUEraf80SK8FcVrFsUgTTsbMX6pEtcrmT6
 84e8ALkn/qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafyNhwAKCRCLPIo+Aiko
 1T19B/9uakUauWGXv/L+z92aCcBh59+PkV7ZXbHO7mA2eOI2XrPKOIgYB5DmL+phKbxUDbcmFjv
 yesFNpJGkO+31N3Zee9gWy1GYKnAUIu7rg44/flECZjoWZaYDZLnT6W21fe1qgNmIUg37XhjIoB
 hBgGXgP5ReYxCdaHyWBFLVQd5bLS6A6EI6TuiOh8t3OtbIApjjJMdFKwYlGubAA4WGLJegis+58
 ga5YeKmLVJ01/9fZQtMfgJOoIW04Hc2GqxVtOQzHZqduHDy1viyFHgsgn0KAVGVR+ySuhoyo/Z6
 cxHJ76qcjN05aXbVN7+hLlK5bwdRtvJN8RzyZTnPMaMwRhu5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc8dcd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=l4KHnsLLE-ungWRp-RkA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 7mh5RHYu9nIDUmxHN3YWNU0_WVXN3BSf
X-Proofpoint-ORIG-GUID: 7mh5RHYu9nIDUmxHN3YWNU0_WVXN3BSf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfX6XrV5CuXBZVL
 wye9DX5HbYNI05eCoPk+yVY7+sJGkPs/GbTFNpwyqd+vyroAWnruvTAdaZSPAd3PLnfHTMGhU7x
 yGuAXwWK/mumLBlzI04WOhmRftYXjlCZIP74Aj8s1mce/bMj5gi6LyVsvB6cmXCA+2WDTtREDF2
 zvzPuqMewBCCHwK5ml9GMjCoHefuWVFAAMpt+KYJk/FLTNCOPXQN0afekJLtdKyGJi0ZWpDMeqO
 wI7JPvj8cXIax0aIMcuzB4ZhtgEqUgNezJI/3sTazqTc+7lLBnhibiWenBlVHgmmMy7owK4CtOW
 PzYhM4lgRMTmdPlzKWS72be2ZEKTaiPtgUzXQmn+dwrJ2TQddkkw//roIS+KiIlpEWdVG/5zYEU
 bndNqG3NW4+/nq4okTKrQKLm826fo7aNuiJErHBNoXchJJxAec7/Sepxgwx/wwYZitPIAz5VRG4
 OojpfmZ1r7R/xDMdGtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070130
X-Rspamd-Queue-Id: CEB774E904B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106377-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Unlike other drivers, the DPU driver checks for exact UBWC version,
making it hard to add minor versions if necessary. Invert the order of
UBWC checks, letting the DPU driver handle new minors transparently.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 36 ++++++++++++++---------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 6089a58074ac..b5e50fc1916f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -310,35 +310,35 @@ void dpu_hw_setup_format_impl(struct dpu_sw_pipe *pipe, const struct msm_format
 
 	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
 		u32 hbb = ctx->ubwc->highest_bank_bit - 13;
-		u32 ctrl_val;
+		u32 ctrl_val = 0;
 
 		if (MSM_FORMAT_IS_UBWC(fmt))
 			opmode |= MDSS_MDP_OP_BWC_EN;
 		src_format |= (fmt->fetch_mode & 3) << 30; /*FRAME_FORMAT */
 
-		if (ctx->ubwc->ubwc_enc_version == UBWC_1_0) {
+		if (ctx->ubwc->ubwc_enc_version > UBWC_6_0) {
+			DRM_WARN_ONCE("Unsupported UBWC version %x\n", ctx->ubwc->ubwc_enc_version);
+		} else if (ctx->ubwc->ubwc_enc_version >= UBWC_5_0) {
+			if (!MSM_FORMAT_IS_YUV(fmt)) {
+				ctrl_val = BIT(30);
+				if (!MSM_FORMAT_IS_DX(fmt)) /* and not FP16, but it's unsupported */
+					ctrl_val |= BIT(31);
+			}
+			/* SDE also sets bits for lossy formats, but we don't support them yet */
+		} else if (ctx->ubwc->ubwc_enc_version >= UBWC_4_0) {
+			ctrl_val = MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30);
+		} else if (ctx->ubwc->ubwc_enc_version >= UBWC_3_0) {
+			ctrl_val = BIT(30) | qcom_ubwc_swizzle(ctx->ubwc) | (hbb << 4);
+		} else if (ctx->ubwc->ubwc_enc_version >= UBWC_2_0) {
+			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
+			ctrl_val = fast_clear | qcom_ubwc_swizzle(ctx->ubwc) | (hbb << 4);
+		} else if (ctx->ubwc->ubwc_enc_version >= UBWC_1_0) {
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
 			ctrl_val = fast_clear |
 				(qcom_ubwc_swizzle(ctx->ubwc) & UBWC_SWIZZLE_ENABLE_LVL1) |
 				BIT(8) | (hbb << 4);
-		} else if (ctx->ubwc->ubwc_enc_version == UBWC_2_0) {
-			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			ctrl_val = fast_clear | qcom_ubwc_swizzle(ctx->ubwc) | (hbb << 4);
-		} else if (ctx->ubwc->ubwc_enc_version == UBWC_3_0) {
-			ctrl_val = BIT(30) | qcom_ubwc_swizzle(ctx->ubwc) | (hbb << 4);
-		} else if (ctx->ubwc->ubwc_enc_version == UBWC_4_0) {
-			ctrl_val = MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30);
-		} else if (ctx->ubwc->ubwc_enc_version <= UBWC_6_0) {
-			if (MSM_FORMAT_IS_YUV(fmt))
-				ctrl_val = 0;
-			else if (MSM_FORMAT_IS_DX(fmt)) /* or FP16, but it's unsupported */
-				ctrl_val = BIT(30);
-			else
-				ctrl_val = BIT(30) | BIT(31);
-			/* SDE also sets bits for lossy formats, but we don't support them yet */
 		} else {
 			DRM_WARN_ONCE("Unsupported UBWC version %x\n", ctx->ubwc->ubwc_enc_version);
-			ctrl_val = 0;
 		}
 
 		DPU_REG_WRITE(c, ubwc_ctrl_off, ctrl_val);

-- 
2.47.3


