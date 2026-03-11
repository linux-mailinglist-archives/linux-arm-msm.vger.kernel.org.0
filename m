Return-Path: <linux-arm-msm+bounces-96845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8G5dFqnhsGkuoAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:29:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B0625B9BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:29:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2037C3040ACE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 110E23783AC;
	Wed, 11 Mar 2026 03:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kmN/Ff8E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EZB0yePS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2443750AA
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773199449; cv=none; b=njMmzQgoZ21XylRiiLw7jAZiFDlhBEcziVXPQ/uiil3gUa29xPi7omBNTo/BiY1oFcaiNEFCJIDzEUm1/KmLmtADWijlCIq+9VuRk77PmntrNNps5dGwb63o8M7JJppw7r1clKRyxySV8nyW3eOU59lZE0BaMTI8Pp1rob2xusQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773199449; c=relaxed/simple;
	bh=2LnoPNi3lG29ZP56cipc86DccHTmRuMtPFNBgsiCAGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uG7lGQU+iobamyMUY7IOhXGu9Eu6rEcUYtZLCibWSseTz45/zMrkg3olqZQZjStAF61uew1qeiOY3YUlzKrjRqVhsnpc3EAN+E1obGVGkPs9fwjDqpAKpCDo3iCizUqyi8nueCgcc9fQNCxWWnXoHoDeLi8tgfo4gGgwJPhaI54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kmN/Ff8E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EZB0yePS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B3JpZ2248352
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nBxlchdjbjF0eiY4KPqTod21EA8PMrHUqOAvrBh9nVA=; b=kmN/Ff8EdVMHnIPB
	0p3G0bbz1BO1wg4uHDoDAGsebhfv2bO5dATQZ37aUt71Gjlja644yOObHO/JDQgo
	fSUIhoukfUU13WYvMqNbhidNXHUmFscol2fFy/wnrdLQtNAp1Gb1gle2+eL08sec
	1hYO7bIG2RAreFFaLMzW3uRLxVjiH/LP390frhzqNr+H50UGRfsBbORCsWKNtn5v
	sj4TJ+vahI6/yLvfOFJUWWEWMI6lXGsNxrXSzhaJouLu+ijT5nX9J7JmV9XBnPHh
	2Uy8T3h4z83sf0da2BL+8Fh1iLk512Fjnd2xPyVkeZ5MS7ZhmVCwbpGTRewqKUty
	sXPNow==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqv11nx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:24:07 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-94df16a0801so21941749241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773199447; x=1773804247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nBxlchdjbjF0eiY4KPqTod21EA8PMrHUqOAvrBh9nVA=;
        b=EZB0yePS+wiYnVeZnpoa8qyOvboS/V2DXJ2BA4JvLt9bb2ihvLx6+G+/STj0gUyFtt
         hft69pqVGbXXnWSxHa6i5iWE11rV+eYK5Aukulwa88GO8KxahRejrPczl5Bq3L4joTRN
         X90nBh/WHYi6Yn/FvzKtrIvQohTKYAV0iiinCJ5tYHy4sEM+K46Lq8J6zeE2gctM+Tay
         EyFZCzuCHmYzRFdkbgM+N8WlEgoAk9jCip7k4UpcgEe5BTPMrBXJyv7ziBGaWUwMGGCm
         PxHUzNusutQn6U4c6Ueox6SC5QsHHeRWILUJYkD52giZIwEz+3qBx0mQ3umotUPkhbTU
         eJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773199447; x=1773804247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nBxlchdjbjF0eiY4KPqTod21EA8PMrHUqOAvrBh9nVA=;
        b=PXv13lXqdJ1RBqXWRYIG6Qm5hN7HMHRkhxqQTWJOMlAQbPb0yFGhN3o6yr1RNgsksy
         Se2scb3h5YNgmsg4Ku05N5f5jK+QbFBkZAlMf4O9/7SmaITyTgAk9b0SH0fL73Cz/RPx
         SSGZg9B/kLVQ71yHaZKHFjlJsVFH1nFkaDEolRSNfy9KOZm6ZdZ+XxetDd+ddDlggHfe
         6hZ1GyC59Eo0jkbx3OHFMPtAdlN9PRqfxt+67e4NWbey0aBtwQcIearTd7zE+lF1QPAn
         46jwox+w+fZaqP8aZRCFYGpg/BCR+BAHDGpgHteSfk/O3yVlmN+IQCykhdStHOzktUgW
         nTdA==
X-Gm-Message-State: AOJu0YyWc7IMeqxF9hsCQ5P2fAo1GRhWVf++dufPgeyGq/NbZkJelarI
	jQHBlJoL/mgBoMZVeLvqGGNVu/pByL0O65fg86ZV3qDMwSzfgUnf8cufhQ0d16WmCb5m35jh7lG
	rmYrNbGp3W4F8lh/mXzqH7SZlGu5rsV1BV58ZkiY5w9uBs1b9iDpDkCJ3oBIS9utlgAkC
X-Gm-Gg: ATEYQzxNCi2micBRmJaNLrr8XEv+8+H6xrLZLecfmK3lPnWYx7nEGktVXzQs7RewsIz
	uqHwhjGQP3udQdGjM1m7GT5bHv1vgn/7D1f605JG5zCXW7TpJIUC/wQx3wSW90hYLVntnDBHSeD
	rSB8vws/mWhqgVVdf3EtThAdSjUSYU+OlLpQOcdavdJ345XHNi84oXsQA1tvcu0bKKJ88QbbL9C
	EBebdgG1rpU/O3Bxoceq1SvMRFHnW7I1nOFH/DHPdU3WcP0ELTH/UYRlfR1a3IBOL+SooD2vQiG
	AHGaVH2xRNHBEtTE+DQXVyapDrbvKzrOyOx0sXvgGmBNRXKsn6ALGUqwuWNQUiCP6x77kQtTx8p
	2SN7lY1er4NDkcM0L78ombB31Kn9VqKLueMYW5SrYNy2AxuDJ6B6pdZeBtrX8gWs6PzIOHStD6/
	l+mg3FtCWLf3CT3Bf31cqMK3lTgiAQ1ZPJtbI=
X-Received: by 2002:a05:6102:a48:b0:5ed:928:59a4 with SMTP id ada2fe7eead31-601defd5769mr323859137.39.1773199446755;
        Tue, 10 Mar 2026 20:24:06 -0700 (PDT)
X-Received: by 2002:a05:6102:a48:b0:5ed:928:59a4 with SMTP id ada2fe7eead31-601defd5769mr323844137.39.1773199446320;
        Tue, 10 Mar 2026 20:24:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed41sm1422721fa.25.2026.03.10.20.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:24:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 05:23:13 +0200
Subject: [PATCH v2 19/25] soc: qcom: ubwc: set min_acc length to 64 for all
 UBWC 1.0 targets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ubwc-rework-v2-19-69f718f2a1c9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1362;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2LnoPNi3lG29ZP56cipc86DccHTmRuMtPFNBgsiCAGI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsOAg+HPtHKiwg4W6l6e9Z3wiYDXUmHOTOqpeL
 B9H1xlvsQmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabDgIAAKCRCLPIo+Aiko
 1fe7B/9cV8MvGdvikrcJHRlobcP0BA9wxL53s+ZEa06ubZtuGZlaKgby2sYolzRusTC8Y/XGeWM
 LnT0ihHJkzXpQukspHnkRtiKyjnmdubZGewnk9zXDcfAHJCR51RmneNLGpn1imE8Z/SZRPXfm27
 19hwRxWuPYxnGELhDt4iDy3EJFoyfxhunAswYVAw9ZapA30MMetM3XGN+N6i/K0yHgeKTueacwb
 b4/vVK3FwLfAsz6NkXji3cmLx3P5n8D9P3XIrdjWzN2goBG1t0PMLFk9z6hbCBVca4DLMuQeGNH
 oOsRtfFaIEVrp7vnnxmRiE+pR6juZwGUEpcle/tHkXDIOeq3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyNiBTYWx0ZWRfXyBZ7AuoqM27e
 Q3xBVzzqOQnWZ8P7YC8HXvuAdDgr2QLJjHHPWr8a0Lt3fs0SGBuAsxVxt84cQW2V8NbP++C8BX2
 5IRhXeAj6XO6uQPA+OE/u3Vi752jghEe3T4zVqXMUAyKHguBOHtJBjSfFOO7VBGLmy++SDFAn4F
 KDfzS2hp1EYWLo2yuvim0SSMTO0Z0U489F7nwfkhtqdeUzsHB0V+pnrdXXAslLUHodZxocYUNnp
 mb8TNEfcdcjzOSXrI9D8kDuDUnoI2WiQqZKRY3nFVirseHGvJNdwo2qa+NHefVH7If5sri5Nqey
 8gJBmwiHezmy9T7yNpnI5bFW/AvZkYZ/99REm5izos7CYPch9RGX+H3weXL79Lb270IGHo0ICFK
 fWmA799QDi3KtMi3+W8ityU7PXU/11fAROya30/lzeVEjhnHbk0HwioTFVdo3ra8wHHFVX/Hrgo
 BlKdCuJcwo06b3513hw==
X-Proofpoint-GUID: rKzzlclMd-aP_L0YTEQCfV4OTQzHlVyB
X-Authority-Analysis: v=2.4 cv=S5vUAYsP c=1 sm=1 tr=0 ts=69b0e057 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=5ZsywSmvcCt_NWGkcqUA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: rKzzlclMd-aP_L0YTEQCfV4OTQzHlVyB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110026
X-Rspamd-Queue-Id: 55B0625B9BE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96845-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

According to the documentation, the MAL should be set for all UBWC 1.0
targets, no matter what is the version of the UBWC decoders are present
on the device. The helper comes from DPU / GPU world, where there was no
separate bit to control MAL before UBWC 2.0. As the helper is now being
used by other drivers too, correct the helper to return the correct MAL
value (Iris doesn't support UBWC 1.0 devices for now, so there is no
changes of the behaviour).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 8355ffe40f88..ddd7b15d9ff1 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -80,9 +80,7 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
  */
 static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
 {
-	return cfg->ubwc_enc_version == UBWC_1_0 &&
-		(cfg->ubwc_dec_version == UBWC_2_0 ||
-		 cfg->ubwc_dec_version == UBWC_3_0);
+	return cfg->ubwc_enc_version == UBWC_1_0;
 }
 
 static inline bool qcom_ubwc_macrotile_mode(const struct qcom_ubwc_cfg_data *cfg)

-- 
2.47.3


