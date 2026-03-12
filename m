Return-Path: <linux-arm-msm+bounces-97227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAJNDgzAsmmvPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:30:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CC139272A0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:30:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3F804303DDE4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F26933C944D;
	Thu, 12 Mar 2026 13:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NK9vMxAX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LLaryOIm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8EC3C9435
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322187; cv=none; b=DxcrcsgRR8q2NYvApam498WeQuC0QljxAWY4BnkYVipG2tholP4iWpMkgkQ0N7HYgrPPJ5z7Az43NUk8YQ8EnHGJWlSt8jL2zDPWv8EK59xHEdmUnsjWfFCD7osurnzJyuNm5QXIUB8oh8G+xh6ctiNGlZkISZeAR85bxEs/qCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322187; c=relaxed/simple;
	bh=xO+dmVKeAgw+NPDr2h9siH1EsNMcwlIuWzCr5f2QIyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GEhOW0DQC18uZ0BEdX39NpTQQhYu07pwRfTrP0N4ekbclj9Ap3PkFgDqqEwK4w86LPS97g2HWnAmqRTGY3j9xKevZb3mUBqgZAjZFnIFZcPijZjlmYcgO7wbo28c/4MKErk2qvsT0UDOkISqmMx2lRADOlmY+egdxGnthhsiSE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NK9vMxAX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LLaryOIm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9ANVT3666499
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IE7+voqoAHNNKrIs7WzVDBWghsRgS97+vaqd0IwCOgE=; b=NK9vMxAXLa+1OCQ4
	/RNDXVlHxuqQ7vlDp6mpnN2BZqNsfMjUy/P12K0O0EmB+hLGVZ9VUt9UOYHxNra0
	DwJkI3CnW+e6XOLsc5VBNv2EK2wf7jAPtZLyjr5BbPNwLfAS9/rx8jDt+yY1CgrE
	JBN66tsYUTlxI8CBbsdrUbfockLi4vESGpNkmn5szRSIJv35cnSaxvl5aZhIqUce
	5vmMYV2uUvfp0oZbH4f087OzMrCpDXFdAqEHQOULmmhEUGgnsFluO4ldo1c6ooi3
	LOCQA750ZcnQ15hAMllFf1V6UyavnHuRNkwbEv1Ui2+L/qX8YhPhyz1xheUzGDTt
	3ClSFw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh60j7sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd77502295so644449585a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773322185; x=1773926985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IE7+voqoAHNNKrIs7WzVDBWghsRgS97+vaqd0IwCOgE=;
        b=LLaryOImPSeR5CrIZnalCYA3cz57I3UvzuZI0gXeZtavr3WwzqYNAddyEksBNCWVAZ
         NzLd5enmqfWOFPxyKYLlwN26lRynO937xPW75IUJ6oXscQda3UBrmLDsrl4HP4Fh1I8T
         8qQj8o0sKBHlgK6lNZAeMb4MJtK1bjoczj65+mIaKHryGzrNTmYt+o8Q0ZCGbBGATOOh
         Rc9Z3h36udg/1BnmOigaO4sqr51SAtGtkqhWumPs1VdCPeimestAVyjfHxObP2SFNDff
         WX6Az2sluf4CJWcI2EnsufsdIc58OHcCJ7JW1KqKvvExjI1h7bA6m7fY2gZjfz60Vdyp
         VJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322185; x=1773926985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IE7+voqoAHNNKrIs7WzVDBWghsRgS97+vaqd0IwCOgE=;
        b=xHatKjgzl4JlBT93LjHxpW94TXjIYLk8jm/dN8XBjBZJVPLHVQNaohn0GKdcUiJN+p
         kDedDSNFdDPm+3043IbjfWRuULZU9otrDvSQRc5COoIcEnyr1DPsxKirJ2tggqgj1G1D
         Lr9vG/YCpTYqigVSKVLyIoWFYmP1yO3wU4DpMtBYPnv92cQG16wMrmuZSKfvtYvwfcEq
         nZhHGF+Q1DTnAlL5S+a4SZCWyfzp4qCwhHfBUsscxrSiT45hkF8h77nFgREozoEniswv
         LhbK0TIJudUEB+7fDSalA0uZDpHmXQ/UtLi9PnyABmgxMUKmEKcjlgJGU0qt4au3o352
         0jDw==
X-Gm-Message-State: AOJu0YyiyltZW4dB7iJG3SRm/eTDdvatwNae5e6jq+0jl4wwhxUw41Iq
	+6V1hzVowuPZjpGnx6O0r43CMaxYNgpvZMqkKmA+wQXcXfstedK+FlVEWmlyKxBiqW5MrPyX9eC
	TsRvv3zSqG/6UvfbCqsgSDCM2PH3PCnhZtkTJIkBnz7fjvf1RkZFy9S2uoLIlr8DLh7Fi
X-Gm-Gg: ATEYQzxUOYm1er4sQjuOlnlq9SPeZwYTL4y8FTAtPlJ7TXGchnY8w7Xnow6y8DaBGXL
	8N4YVhM/PUOvTbuZ9+0Y0eubfrvpNbvA9QH8wD0yPK5QdGF15lFRMqjDvgaXZj9lw77dTaIdoZT
	IGma/wByu+28D7Lfotwy38SMeYnFN71CcS+7P0N+pObjOBR5J9M1jrsyGU/DjONMx2RaqJkYyqC
	PoZRJTdQWny7mr5x4CgoxrmIGYx7Y+fEgb0ELb+0TEa6jF3C/iBlRFkeSZiGEFul3+okJMm9y3A
	euLic5CzGhhCFm083EshDLtNpznCexuezRD/gmj9GT+SPxt6wFuquJCfkUydHRSGexbOPSG2P28
	HENjzxjoKGCm+hUOmZD+e179OUXWT66yMvjNobVd2axlLFoLvn8pzxNA9QKI/aDd0KO/gRa1Rxo
	/Jy147QBPfKjcRWG/CGKKyRWO7JqtcM7BuN5k=
X-Received: by 2002:a05:620a:2a06:b0:8cd:97a7:a334 with SMTP id af79cd13be357-8cda19bb33fmr749043685a.4.1773322185003;
        Thu, 12 Mar 2026 06:29:45 -0700 (PDT)
X-Received: by 2002:a05:620a:2a06:b0:8cd:97a7:a334 with SMTP id af79cd13be357-8cda19bb33fmr749039085a.4.1773322184565;
        Thu, 12 Mar 2026 06:29:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm8646671fa.9.2026.03.12.06.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:29:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 15:29:28 +0200
Subject: [PATCH v3 07/27] drm/msm/mdss: use qcom_ubwc_version_tag() helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-ubwc-rework-v3-7-b7e8f800176a@oss.qualcomm.com>
References: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
In-Reply-To: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1662;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xO+dmVKeAgw+NPDr2h9siH1EsNMcwlIuWzCr5f2QIyw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsr+1jVZdIm4Z5c9SotutkxEHFGXzgCmOArpB8
 PqwvUHddbyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabK/tQAKCRCLPIo+Aiko
 1aqdCACzDFSUZDp9hHVRuPmRYu0zC16Brt8euwkDH2Sl1Y9E0w8FpOJTHSXVaJFuoE+BmChs6ao
 UGCBQ3NL87uHHw3x+8JCMXbaIRuo/4HrR9maQ93bdxtGRZiHrTN/sr/LR5JcgOxsbsTjKoW1euQ
 FO6gVqu+ArbG3jxLUonRzhBk2E2PwSaC8v39zYBnhNs+S6Z3vXrFo5wKf4OdlWOuijXHI60wFeE
 Bwpoyk9m94uTpd1mZr/WjTc2Ult0FANct/wvS1WxEf6BhNGgEpziUpe3P90k3FuDaFreSPva46V
 rO+JFmwrOvnIKRju0rm5E0jU3lEWww+jzGi90OUGq7EnLt/X
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: loLzHDM4q4ol0vb2fkEdVS-Zim7fkv_M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNyBTYWx0ZWRfX8MsauJhKlgWj
 qAwOoWj0qUyVHX914k1AibAmkkePxfXTXx5lYObqu9/S3sF2ts7tYrE972g5OID85iwGnJgY+DC
 rvvs2pEUtG3wGTYuT8kPwfdVX3l0649TJqv0pUIq5B6UaYJSTAmd69DXAlB53ckALd8JbgdWTPb
 Rbgkv/1oVQbWpWn24VbkcoHOINVsxT9yYLEemVMLqkIaU38kE/LiXwcQ2cyuXtK0UR2ePgfflRp
 /9CZG2xClOKIFqORpk+0ElEt16ONo0ay1PLs5TVevb2a9h5gNpbSvDnSpyVDRb1APZScQ2HmPDP
 39HLdYKosqPGyrSPPE06bM+OxVj4VlVLKqhCd4Jb7ZR7cVXD5l8HnGFUoI3BL70K/OW0p5NGrUS
 ouuAcrsoOwoOR1l5vmMe8HwyrWOUZXJ673D8qDsGp3GesXVBqcKlIrp8VOb7iebbZAMHILJJPur
 O7hvwwDUsa5i0NQkscw==
X-Authority-Analysis: v=2.4 cv=DsRbOW/+ c=1 sm=1 tr=0 ts=69b2bfc9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=qBJULKV797PGQuHHbA8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: loLzHDM4q4ol0vb2fkEdVS-Zim7fkv_M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97227-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CC139272A0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use new helper defined to program UBWC version to the hardware.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 7cb8aeaa7ecf..e2ec1ee590e7 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -201,7 +201,7 @@ static void msm_mdss_6x_setup_ubwc(struct msm_mdss *msm_mdss)
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
-	u32 ver, prediction_mode;
+	u32 prediction_mode;
 
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
@@ -219,20 +219,8 @@ static void msm_mdss_6x_setup_ubwc(struct msm_mdss *msm_mdss)
 	else
 		prediction_mode = 1;
 
-	if (data->ubwc_enc_version >= UBWC_6_0)
-		ver = 5;
-	else if (data->ubwc_enc_version >= UBWC_5_0)
-		ver = 4;
-	else if (data->ubwc_enc_version >= UBWC_4_3)
-		ver = 3;
-	else if (data->ubwc_enc_version >= UBWC_4_0)
-		ver = 2;
-	else if (data->ubwc_enc_version >= UBWC_3_0)
-		ver = 1;
-	else /* UBWC 1.0 and 2.0 */
-		ver = 0;
-
-	writel_relaxed(ver, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	writel_relaxed(qcom_ubwc_version_tag(data),
+		       msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
 	writel_relaxed(prediction_mode, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
 }
 

-- 
2.47.3


