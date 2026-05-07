Return-Path: <linux-arm-msm+bounces-106382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKTSNX+Q/Gn3RQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:15:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD154E90D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 493FC306E516
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9054F426691;
	Thu,  7 May 2026 13:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KZnzAd7d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="geUepLkY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243D2425CCC
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159068; cv=none; b=BM9WUp6X7c6VnFXB2GpIpA9tHu+sOfnjTNsDdWdZAxSTyU9PJyzh+KVu6eFlZUeIMLdwCxAVmO1wvY4EsHcJng8xbd2GpBBOPp1bCnPizGJERwNLZw4aWNuFnRWSlst1xIfstr5NmZpFzHaFkvi+qF5pr2+XlZNtPJrYIZHmSoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159068; c=relaxed/simple;
	bh=/5g4ZeJetQrIZ/OLIdACHZoyX6KSJ172mYU4QYqK3To=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j97B1QPDQj6Dn7UV8OACXvuNtfXB5JR1TtMh8rsjHIvxn9E2ywV5bp0g7xBI01qpkZ6MRDpQq3yy3t1PD2pRo9M6FUAcP5OYIzE0SilvScxZLVXZE6/qiIIZwqlmKNM7Tw5GBeMH9RO1OpirCdybalAOf/+nAf+44S0ZFxMPI+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KZnzAd7d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=geUepLkY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647AjgXY682765
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y4Spcrvj56zhlbuoqjcYCgamAfaIhEXR+CzRTdPPVyQ=; b=KZnzAd7dboJyvw3b
	QEeY/og+Gq43AuAYkG4zoKG4udQJAW3jscRuhDLimAKL78JqMRABdTDBp7ndXx4E
	gaM4PBeKM3FEtoLaXHz951LYHPuH9nJGX1Qg3SLmdL9TU76SyChUJ8Tbf8hYFQ4G
	ie8waFEUtFKK46xsbnj6JzTTtsVvJcJ/9YO8ujjwmrMpsCReZ3Q4r5caYMuKHGri
	cOu8qtWft8JfYQKLgaoSI116939z2qlF/FW1HzrD6onpxCtEKPXKjK9ZLmwi4frr
	vfHVeIyzetf1HOCiAdvZLBR7HaIeP0kfj+Z53DKc6fNdAACPYfPVbsSnX6YFORsa
	IktPvw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhasn1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:04:26 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7dca6ecdd85so987917a34.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159065; x=1778763865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y4Spcrvj56zhlbuoqjcYCgamAfaIhEXR+CzRTdPPVyQ=;
        b=geUepLkY2GI1lEdgMTorX6as3tq4lPEJ8KfYfyEa/Ok+lJ/ziEPHBS/VwIio6XiRz8
         c+4mHQLTj3d77gtWGBusV9CeisrhESWSn6N+7Vvp5LisB+HwCRWcv56aEzv0Wn+eR4eG
         s/adj6L9KYVQvOdY46YbvWi7xUYhBrIt09fp4oVukvCLPgWtGkm85lTDTHP1hvEjFe8q
         VN1uTnLPjXWOTl0f+yUaQV7QupZmfJ5FnO4jDL/zroZYJwjv9y6g1m0A6PxFQmbVNKI1
         Z/0jlaGjIkrzqMObfgN7258Y0THFfgO06kAYj9Bb2XNtp2tS4SO/AcXW0cDkKD+AXU38
         R74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159065; x=1778763865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y4Spcrvj56zhlbuoqjcYCgamAfaIhEXR+CzRTdPPVyQ=;
        b=lO9x4VHL3F46zFM4Y7/ogCBmbdGcqf2/clcZJXU2gtLLazi7WylkPS6L5ccX4E8CN2
         DIT6zgYWp5CkPaeZuVtb4tP8Wim5b+qdNLaoT1zU22ejX8lf2X6cXe19uS4ukug8to/D
         LARhvTGPwLmWZurj7hA+6yswJFa51uvKtnvE9H4mi2fpGzJnGj7DhBCuvgT132d+1nK8
         cR43pLhDVk2DjsmB1lrzqw1vopg7FHHJZIk/IEJazSBZg+7H0lACwbDrsxduy6zZVRqE
         KHgYdz3rJqUADi3Aw6nIHN5T6bKdS94MSug32fyXzgdHApWdTNNfcIrVVLnDRXOL6f1w
         CEuA==
X-Gm-Message-State: AOJu0YxOHjpTsFjiYLdPmvmsX/pRoyRQF3z9rID2l1goCS1XyOpUfKlz
	jJwD7T8m/bL/GnLbYnbNEQGudgOUh7lsrgpxfBJoTlwOQITEUYLptvG2r7S5ITAThXWgKneUx71
	KJJOxZ9BgFwJ6zVtf96o3RAi1+E8hq5+sVQ1BrKxYok7LoyWeA9VvcpMuaKESXAewTREW
X-Gm-Gg: AeBDiesLbxExV94mzRsJhCQwywPHMNjhqG8j/Q+3knQP2GI1ENT+eHhtvsN8MEcX3/n
	Az55ewwtjslw+WLOKOTMdafqQFTaBSaAW3hGfnMPdLDUaV2BCLIHHMwEp90Z3KH2rnjdZX0HBXG
	zHuaYkzdKO7jTmxDX3YUimpKnm3lCX3gmVRPF5Yb26CY7Hq0u8ixQVbsXGa2h+lMtGyI/6+PaKW
	o3fVv4pJKNEJCsFYtEnGL4ItRt912R7ZjbxpjRBlPUaBq/n1enVObJ4Fg/6dqpl8WolFKD/ERbe
	GkSdb3X+s4X4HSrKvu7JX6e5KCZAv8h0UH/Wk9lsgP2fZXPHL31MTrHOGhmXMsl2Le8JL1Q4zy8
	Z1feDhwkoPOGe/X4QUhREGb1dadas5c6iuoZQTtdbnnmT2r1ITDv8FnFXdvXYkVmGdBfiT+HcAx
	/v/XPETxyiA3e0vwAyofK5dfERyH5h/cED0citAjuzz+Uk3A==
X-Received: by 2002:a05:6830:6d15:b0:7d9:71e7:abe5 with SMTP id 46e09a7af769-7e1dee9096amr4806016a34.10.1778159065543;
        Thu, 07 May 2026 06:04:25 -0700 (PDT)
X-Received: by 2002:a05:6830:6d15:b0:7d9:71e7:abe5 with SMTP id 46e09a7af769-7e1dee9096amr4805946a34.10.1778159064857;
        Thu, 07 May 2026 06:04:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230c68sm5595959e87.19.2026.05.07.06.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:04:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 16:03:23 +0300
Subject: [PATCH v4 27/29] soc: qcom: ubwc: use fixed values for UBWC
 swizzle for UBWC < 4.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ubwc-rework-v4-27-c19593d20c1d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6082;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/5g4ZeJetQrIZ/OLIdACHZoyX6KSJ172mYU4QYqK3To=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBp/I2I84EjPL05HMIn4nKfUOTI20skhdFu77lwU
 7T0ZHaspyCJATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafyNiAAKCRCLPIo+Aiko
 1feVB/daTkBr9fSmmy0neS1IRKcDx1F+/xbzR35fHVHKFWq5T3vh19Dk+kqbBA6iYl3IhPXzDd4
 KTvnvnWdUo3Ef+fqn2MhAk14ZMijGADt9os+idQYt85gPrZ2s5vkJtB09cyoDLruXMwfO03jHEM
 dDvETQ062Uywo7vKbgCeUz3QSxj3K1SmkmYHBOgtkKFmZasCL9RuQdxea9rDrwOi5Ymb9SLCV/J
 p0/9xZK0Mub/d9ZeJl4M62f8yG3RuOXhWuoXjaNxHsv4qHYu6fPP42N31sevhYIX6uuYW8B6dOK
 Olix2Cx9iNR3oBicygeHAvQxKnNmPk+CIjncnaVI3HN5vvI=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfX2s0yvFb12DD+
 rLNvsqtYT3zUOiGvl+6u52dP+f76+1VE4XvRWzd/qbuHKutCMZfNSOs3LWrObPVgEEgl5Dt1f73
 kSzcNIvevvtCAPPszdiYElqfbn40uryWyYxKfwXE/M5t+3D1W7bBtMsXDKAXxKaRqU6+aqw/OyR
 9vWjcVaGFatkWIMM107fGPFE93iwMUTVg70QhqJpF/8D5KFVDxuJgZRZv/4Gb1k8Xxzt5RQ626z
 xqfWMOyyDcooZ1Y8TtuYxuXaQxsOC4mgWSbeTwkmf7DVo5nTgRMxGB2arbLpmISHLBUALVeejQT
 P2UYbjh28JyNWLIBrGaDJESbXoWC9XzrrITlORImi+dV3WyvAUTS/g/rXc890fR5pXCu/QqhIYg
 MqidSH3MHqZ9RbUJEP2wnuQjeeHJDl3HzPGaiycdnkg47svkP7I2v8UwY5q1ZXUtA50XyNERJdu
 mqdNFqr9Vtq5MlGnCsw==
X-Proofpoint-ORIG-GUID: 6wiYmagPolbpBkL9bRg6pbP4RumA6vK1
X-Proofpoint-GUID: 6wiYmagPolbpBkL9bRg6pbP4RumA6vK1
X-Authority-Analysis: v=2.4 cv=ReWgzVtv c=1 sm=1 tr=0 ts=69fc8dda cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=vmkA5Hdfq4WBgaw8N_IA:9 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070130
X-Rspamd-Queue-Id: DAD154E90D9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106382-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
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

UBWC devices before 4.0 use standard UBWC swizzle levels. As all the
drivers now use the qcom_ubwc_swizzle() helper, move those values to the
helper, leaving UBWC 4.0+ intact for now.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 34 ----------------------------------
 include/linux/soc/qcom/ubwc.h  | 33 ++++++++++++++++++++++++---------
 2 files changed, 24 insertions(+), 43 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index b880f77f448c..2509aed0e743 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -33,17 +33,11 @@ static const struct qcom_ubwc_cfg_data kaanapali_data = {
 
 static const struct qcom_ubwc_cfg_data msm8937_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
-			UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data msm8998_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
-			UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 15,
 };
 
@@ -60,94 +54,66 @@ static const struct qcom_ubwc_cfg_data sa8775p_data = {
 
 static const struct qcom_ubwc_cfg_data sar2130p_data = {
 	.ubwc_enc_version = UBWC_3_1,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 13,
 };
 
 static const struct qcom_ubwc_cfg_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sc7280_data = {
 	.ubwc_enc_version = UBWC_3_1,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sc8180x_data = {
 	.ubwc_enc_version = UBWC_3_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
 };
 
 static const struct qcom_ubwc_cfg_data sc8280xp_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
 };
 
 static const struct qcom_ubwc_cfg_data sdm670_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sdm845_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 15,
 };
 
 static const struct qcom_ubwc_cfg_data sm6115_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
-			UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sm6125_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
-			UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sm6150_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sm6350_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sm7150_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sm8150_data = {
 	.ubwc_enc_version = UBWC_3_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 15,
 };
 
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index fee778360ac2..7c9506741001 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -22,9 +22,6 @@ struct qcom_ubwc_cfg_data {
 	 * UBWC 4.0 adds the optional ability to disable levels 2 & 3.
 	 */
 	u32 ubwc_swizzle;
-#define UBWC_SWIZZLE_ENABLE_LVL1	BIT(0)
-#define UBWC_SWIZZLE_ENABLE_LVL2	BIT(1)
-#define UBWC_SWIZZLE_ENABLE_LVL3	BIT(2)
 
 	/**
 	 * @highest_bank_bit: Highest Bank Bit
@@ -55,12 +52,7 @@ static inline const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
 
 static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
 {
-	bool ret = cfg->ubwc_enc_version == UBWC_1_0;
-
-	if (ret && !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL1))
-		pr_err("UBWC config discrepancy - level 1 swizzling disabled on UBWC 1.0\n");
-
-	return ret;
+	return cfg->ubwc_enc_version == UBWC_1_0;
 }
 
 static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
@@ -85,8 +77,31 @@ static inline bool qcom_ubwc_bank_spread(const struct qcom_ubwc_cfg_data *cfg)
 	return true;
 }
 
+#define UBWC_SWIZZLE_ENABLE_LVL1	BIT(0)
+#define UBWC_SWIZZLE_ENABLE_LVL2	BIT(1)
+#define UBWC_SWIZZLE_ENABLE_LVL3	BIT(2)
+
+/**
+ * @qcom_ubwc_swizzle: Whether to enable level 1, 2 & 3 bank swizzling.
+ *
+ * UBWC 1.0 always enables all three levels.
+ * UBWC 2.0 removes level 1 bank swizzling, leaving levels 2 & 3.
+ * UBWC 4.0 adds the optional ability to disable levels 2 & 3.
+ */
 static inline u32 qcom_ubwc_swizzle(const struct qcom_ubwc_cfg_data *cfg)
 {
+	if (cfg->ubwc_enc_version == 0)
+		return 0;
+
+	if (cfg->ubwc_enc_version == UBWC_1_0)
+		return UBWC_SWIZZLE_ENABLE_LVL1 |
+		       UBWC_SWIZZLE_ENABLE_LVL2 |
+		       UBWC_SWIZZLE_ENABLE_LVL3;
+
+	if (cfg->ubwc_enc_version < UBWC_4_0)
+		return UBWC_SWIZZLE_ENABLE_LVL2 |
+		       UBWC_SWIZZLE_ENABLE_LVL3;
+
 	return cfg->ubwc_swizzle;
 }
 

-- 
2.47.3


