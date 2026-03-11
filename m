Return-Path: <linux-arm-msm+bounces-96850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDlWBvDhsGkuoAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:30:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F44525B9FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:30:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9264A306F30E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88BB7379996;
	Wed, 11 Mar 2026 03:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b9sg6/ej";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HOBQajYt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D2D37CD5E
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773199465; cv=none; b=n3xAOljmZepv747/JurfhsGynQlF55kR+rNPySIPBcdT3OkXt0PkveeFBPip2QzxbbCOeK9KZQp74QgTwADCTVreCuMYT/EXCM75B03oDhdZLJCdim3NpxAU+WQbNrs7T37XNSYKjZRv/ZKDvYRcZYScLxHbgYsttjudc4xa9Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773199465; c=relaxed/simple;
	bh=rZmnsFdkocnUxt7VbPT73DnNFvP09IpO1PBS81ZmI4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lge00JLsYLriPbcsvL72mO8PeoEAz82ypBQm5fJFrUeHhjJfje2rUcVlj3oK8TAtdkTG/UxHL0vdHpjT9QaJSCY5303SQeOwN4M5cdmlqN9b3uBmZFoCe3bc5n/znBvU6BMkoAJiee5umAxMHDDq/ideJcgrdM387xR2AWbVrZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b9sg6/ej; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HOBQajYt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B2Kj9U248813
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qxOVi+p8tkfxl+UNAqXIN85eEkQSmSuaIBeAod9N/YM=; b=b9sg6/ejnYGlWitk
	ob0Q/k2XhaTUdTTvxmMnnq7enUKbS9zQbfYg2DQca01QrHbWuO7r/nGHq/yRKTiC
	eQxw/9r573yqZQ08dCxjH7ietigafP8tak7fb2APGzPgq4RCwf2a3l8mUYdtQwYi
	O4ek7xys+tLbPHuuyaWyDxEBGOiuBR4gbAfzsXq+kew/5JK9i0a99c4b9lQL8Ezp
	VubrtkE1oZyhnw/q6SOsAdIbzP5GNRVpcY2BqFG/kXUhzIKCtDkStsJqaNglCA1/
	0kLY/j1PS450W8EA4WzFajur/M3b7yFDbjjQhqb12IcFjqFEsY8xNhPy27btu3O1
	NJCVxQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqv11nxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:24:20 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ff9edc2158so8444348137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773199460; x=1773804260; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxOVi+p8tkfxl+UNAqXIN85eEkQSmSuaIBeAod9N/YM=;
        b=HOBQajYtE6mrqXp3/fabGEDrwWkvlhPp6AWGKijPzV6XYkKBiSInogk2APl00nzAbJ
         Q8sbJOttZE2C20k3hHMkkDcCOTmEpEslVL89BbFXuwawPnUuwmnFeJVKvIub42yN8+Yb
         XZ3AmT3/9KpFR3aRQFl6sAiJpmkWFcKp266evHskMPTE+vbHJuiHogguByibiRtNoDxX
         r7ruxvi0/fT/ddGoLdb1hPQipYdveTTAh9jISvNWg8aAcC+d3cAceeLOj5nZjGH1OCee
         rhiheXe/eWcoLXGkzT1XkuwC/Jx1O2Luvp5fT0STNFcmXfxB8blIeLAP1kjKoOu85TFK
         s/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773199460; x=1773804260;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qxOVi+p8tkfxl+UNAqXIN85eEkQSmSuaIBeAod9N/YM=;
        b=aXK9Pn7bB326u2ri+NFtqV3c35hT0zIlMJDJYySif3TNq23P1H2dLulNNdLq/ffEuY
         M8s7MlYXiMDQ1C/WH+Wn4fxCbChn07xy6TCNr3z+3fP4g471WrN0Cgqtg6LIONxYofe9
         3WqlOUG1J7XJaeWLTjha0+muiChGjd3bW7p7A4J7QI45+8cm0L+qsnNzr1ueTZKa2c9T
         uyDHfQEcN9P1Rd7Lg+wduqYVskmUHhcdZCojWu7tOgYWeY4bI3Y1sFcotWJu3wColArL
         D9rBzQFrFSWu3PfIMHCw+cuiTy9hxleDOF1f/KFNRvFWQeBIPrmsflJ3l7qqK++2nEAZ
         vqNg==
X-Gm-Message-State: AOJu0YwJvGdMsRrR7Ngzqk/AjyC2ywFUpZlul1mWCfP2T3bBC83Ta10U
	V7wRQdrZQoDh1n/lPjB6jEpqyQB2pwogi8h4Yo5AvoPWvFFqKsVOOuEZQtj5NdElbZ1RkuTqphx
	tMilemk+LMMlpwUIWGXMbQKwmGMSwLj1HNQqYkX7R/6CwSeVSHX2P9GEYyRbrI9Iv8V1r
X-Gm-Gg: ATEYQzyYlhP3Y/jyFj9uDZgyGOJa1R92+mSqVMirh5VJjcabQ0fBx3Tw/iHckzAz/nP
	Q2AK9xwcpcZj//sC/WxJT0OPq/5k5ozB3VGjBFbixBCgSpBqUD2F/N38B5PWot9MBqYQ8Lm66sA
	mXGvH1yKMHHyd68nPoAM+mMzE5HcNNkouSQhIFBLC+et49I/3hiSwXd41k2Il5HI49tiP8muTKG
	eqHeDXwhx/S5wSHmfrHFpWhlcsOorx9NKPVmZnLFR1rWCg5ur8gwYKdBV4tQ4vzayGmwQU0MJSN
	/D4g5xn/e3ZYNXJb88lCdyBaTXDll483IXK7Mcy1aD/lGMxlKYmp7niTa52k6t+w/d1Cl03EN8f
	+40GtgRTDFuUFGo3fRBihIU8b35neD7f0ddxy3MOLgl5BW0R13rJjlbiRmzskDOgIEQLHUzAo0O
	MsmdIUF1Poobyp3IdbGgOJC2ahSr+2I/T9tXE=
X-Received: by 2002:a05:6102:3053:b0:5ff:2391:45c0 with SMTP id ada2fe7eead31-601deffccb1mr474915137.31.1773199460126;
        Tue, 10 Mar 2026 20:24:20 -0700 (PDT)
X-Received: by 2002:a05:6102:3053:b0:5ff:2391:45c0 with SMTP id ada2fe7eead31-601deffccb1mr474903137.31.1773199459716;
        Tue, 10 Mar 2026 20:24:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed41sm1422721fa.25.2026.03.10.20.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:24:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 05:23:18 +0200
Subject: [PATCH v2 24/25] soc: qcom: ubwc: sort out the rest of the UBWC
 swizzle settings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ubwc-rework-v2-24-69f718f2a1c9@oss.qualcomm.com>
References: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
In-Reply-To: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4171;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rZmnsFdkocnUxt7VbPT73DnNFvP09IpO1PBS81ZmI4A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsOAgCp5vPo5lPfgY/a+NRe9fCRVoydL1AAgKW
 nhmt/UqKmGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabDgIAAKCRCLPIo+Aiko
 1QMpCACJIqjA9rqNRCAygAgbljoGTNrWeFT9pT53UF/x4UqPf8c6nTaNfKnBttzdt0aGxxXvqnX
 I+W5ih3r0P/E1MyVg4btzJbKMAcSRje0pff9egrm44STJPmpZxog9V2AklT5QCEMWoTnwLJydFa
 Cu3KwqH+ybQHbKVIUvCIZnvMsrdTtVofugnBTY6lRjjYEFScc1ie2PPQYPXeFqmKPLUzRg8q213
 xddPtDiBb2bhY6KSwiYX6DoSYRCcCR5fXQ4NscR4n7THC+sND3eAnCNGyhI4YD1eJankuQ6pqr9
 x95NOGZNwg2anaC58R7eSStkhJnJ7EjP6Ptzkcx1jloQaZ6B
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyNiBTYWx0ZWRfXyl/bjlDgKWMT
 lgyeYaw4JaIoEOhQTKOW94Te+2zOck6hWA5+ubUmSJhW0z2q1QKjN5DkZFvyxc4UBW4J115E20Z
 EyeD7PMtmhFOYxZg/K1cOIzm97u5EXfWq+I0q8yQH7IHOFypOKRs5z38GHJjDOoBbEI0/p3nwmC
 9d66LrwZD5pyf5awijZTtADAIlRaYDFOqaGEjTzkFUxAy3MsOU3omw6CXHeF89MWLCM25OQ97/S
 B7LE9z6bjajUSPbe4i0vkmyOom85c+dGhIDBFCAocbCGIoG7LuRFnkaJ4GoKOGHBASVRKavAlvA
 XxP/bVw/JZ6rlGJaGfP0kTlC3RLAT1VCEkeezNkt2m3JXzHvLx21LiUOxRsMKMIonhhUhtlMya9
 y+XwlkCZQjniIagliwJz7pxMf4crgvvofONxUxvW4vGB4tNILoZ8cYE3c8e4e4btmU+nHvc4hGE
 ifXb+/XrMsX1iFNsEnA==
X-Proofpoint-GUID: VzP2UD1B8Na2tGbUEzSsZ0xidu_dRf2v
X-Authority-Analysis: v=2.4 cv=S5vUAYsP c=1 sm=1 tr=0 ts=69b0e064 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=3htL6sknLGLhwEng4zIA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: VzP2UD1B8Na2tGbUEzSsZ0xidu_dRf2v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110026
X-Rspamd-Queue-Id: 1F44525B9FF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96850-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Sort out the remaining UBWC swizzle values, using flags to control
whether level 2 and level 3 swizzling are enabled or not.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 14 +++-----------
 include/linux/soc/qcom/ubwc.h  | 26 +++++++++++++-------------
 2 files changed, 16 insertions(+), 24 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 49edfabb5e18..ccee20913115 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -18,8 +18,6 @@ static const struct qcom_ubwc_cfg_data no_ubwc_data = {
 
 static const struct qcom_ubwc_cfg_data kaanapali_data = {
 	.ubwc_enc_version = UBWC_6_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
 };
 
@@ -40,7 +38,7 @@ static const struct qcom_ubwc_cfg_data qcm2290_data = {
 
 static const struct qcom_ubwc_cfg_data sa8775p_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL3,
+	.flags = UBWC_FLAG_DISABLE_SWIZZLE_LVL2,
 	.highest_bank_bit = 13,
 };
 
@@ -111,38 +109,32 @@ static const struct qcom_ubwc_cfg_data sm8150_data = {
 
 static const struct qcom_ubwc_cfg_data sm8250_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 };
 
 static const struct qcom_ubwc_cfg_data sm8350_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 };
 
 static const struct qcom_ubwc_cfg_data sm8550_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 };
 
 static const struct qcom_ubwc_cfg_data sm8750_data = {
 	.ubwc_enc_version = UBWC_5_0,
-	.ubwc_swizzle = 6,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 };
 
 static const struct qcom_ubwc_cfg_data glymur_data = {
 	.ubwc_enc_version = UBWC_5_0,
-	.ubwc_swizzle = 0,
+	.flags = UBWC_FLAG_DISABLE_SWIZZLE_LVL2 |
+		 UBWC_FLAG_DISABLE_SWIZZLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 };
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 0cbd20078ada..953094b73459 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -14,15 +14,6 @@
 struct qcom_ubwc_cfg_data {
 	u32 ubwc_enc_version;
 
-	/**
-	 * @ubwc_swizzle: Whether to enable level 1, 2 & 3 bank swizzling.
-	 *
-	 * UBWC 1.0 always enables all three levels.
-	 * UBWC 2.0 removes level 1 bank swizzling, leaving levels 2 & 3.
-	 * UBWC 4.0 adds the optional ability to disable levels 2 & 3.
-	 */
-	u32 ubwc_swizzle;
-
 	/**
 	 * @highest_bank_bit: Highest Bank Bit
 	 *
@@ -30,6 +21,10 @@ struct qcom_ubwc_cfg_data {
 	 * DDR bank.  This should ideally use DRAM type detection.
 	 */
 	int highest_bank_bit;
+
+	unsigned int flags;
+#define UBWC_FLAG_DISABLE_SWIZZLE_LVL2	BIT(0)
+#define UBWC_FLAG_DISABLE_SWIZZLE_LVL3	BIT(1)
 };
 
 #define UBWC_1_0 0x10000000
@@ -101,11 +96,16 @@ static inline u32 qcom_ubwc_swizzle(const struct qcom_ubwc_cfg_data *cfg)
 		       UBWC_SWIZZLE_ENABLE_LVL2 |
 		       UBWC_SWIZZLE_ENABLE_LVL3;
 
-	if (cfg->ubwc_enc_version < UBWC_4_0)
-		return UBWC_SWIZZLE_ENABLE_LVL2 |
-		       UBWC_SWIZZLE_ENABLE_LVL3;
+	u32 ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			   UBWC_SWIZZLE_ENABLE_LVL3;
+
+	if (cfg->flags & UBWC_FLAG_DISABLE_SWIZZLE_LVL2)
+		ubwc_swizzle &= ~UBWC_SWIZZLE_ENABLE_LVL2;
+
+	if (cfg->flags & UBWC_FLAG_DISABLE_SWIZZLE_LVL3)
+		ubwc_swizzle &= ~UBWC_SWIZZLE_ENABLE_LVL3;
 
-	return cfg->ubwc_swizzle;
+	return ubwc_swizzle;
 }
 
 static inline u32 qcom_ubwc_version_tag(const struct qcom_ubwc_cfg_data *cfg)

-- 
2.47.3


