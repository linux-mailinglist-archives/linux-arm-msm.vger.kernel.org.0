Return-Path: <linux-arm-msm+bounces-97237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEd/KA7BsmmvPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:35:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD44272AFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:35:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 328E1302F930
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB273CCFA3;
	Thu, 12 Mar 2026 13:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q4vC7xBD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b44JqLSK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955443CC9F8
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322202; cv=none; b=Gm85c5o8WpnfMaYR2PiAOeu3ipAcBNbru4fHmkPZ0cwLhUEBqHww+RlmhFDlgMJWHiuIWN3DjXgWHO9yfOd3T5zmqFDKjH214x2mXLH87VWDfv4zOw0kM8cfLciLZWnxS3mISywAYfQ5+FYjjtp0WZ9Hu/u8VCKIl9teAxBeeW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322202; c=relaxed/simple;
	bh=oMEm/PoPGJyi64CJ7YjawXSAAJStb9rr/IdLW4TZb/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SXxUEmgRPBt/iB0lsc/Jpfu2RbotYQ/5qm4xqJ0NXFLOTKX3nn84XHJSTid50OUMReWVDPmhGp6W4ycfC5RC8oTv+6lQvIxQsxZQuMSrg3KE8z8WcL2nf0nGWC1jfTx1jwpkoiFw/lnA6rUpAloLGTCedCWwRKxcdOq8/SwCjm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q4vC7xBD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b44JqLSK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9GUgg1756606
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r0tY90zt+EixmK5rB9xhMfhGNKcOPEXVA78lLnDAFnI=; b=Q4vC7xBDMf+2S+JS
	TmKZ6K7sZpPgKC9IPuWhdFGygcRWVRsuUDiG03VV6dQILGn2B+Qs3yHJ2CpWO2Pu
	BsqvaEau9jf4rCdY0XFam/jKf7165jUENI4Fn+JZiWADlg7GCLz7ZpHH3efieZLB
	eh/i7VY1rLwbYLU/Gsa1SuvSFqjyvRdhesl/bBxl1A38Eq1oiHBnqKvWPRewX2qJ
	xuSH4vTI62tjl6E5Wl/uKClvk7gZaVY1/5wg/Ao+rENKvwXyZ0PqFCj4qJTdVpVZ
	STUYsJRvstO5ahgnVGtqtBbIhbeKbURG07tFlhIWOn06dYdlUhtTARDDjQqV+9JJ
	ZHWIwA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh53j6v7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:30:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd81ce6fdcso978729385a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773322200; x=1773927000; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r0tY90zt+EixmK5rB9xhMfhGNKcOPEXVA78lLnDAFnI=;
        b=b44JqLSKFYOVW+pRlXrKQ6ohsnsT//eYzG/Gh0h6SPsoi5RU2w9CeDPk9Jf68WYgiv
         Q8FbDRAV6UDevIZySN2e6ysU92/pjVMTQyjLwWk+hbcE15k2pY6Oiu1Bk+bFNPqgn7/Y
         P9/Bpmki4BSUlSc335esto9/xHWFL8D4ETpc5VQXlaQg3EROQG/9pUjHZgIbcENn7X5c
         xAUyLNbU0FzzOTHXfaFWVkAlkcewmhRoFlG38BaWm/S3McGDZAkOpv1h+jV5nTPR75cH
         H6HSZb8cme2GANBvnMAJ0IuatZ47gWw7D+CgydWGZrHJbylzki74Ff8HYKJDfl5koEZR
         qEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322200; x=1773927000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r0tY90zt+EixmK5rB9xhMfhGNKcOPEXVA78lLnDAFnI=;
        b=qgsY7dFQ63lg8yn746tPUU0fKg2c5tJaQzgFMTkJyKqQqSIdSWJZz+w8+Xb1Gz1VjT
         7+XvXx5/PkcGXkE7Bgg7LMBlZmELg4/zYQQjmgvP7uA/ogEIxh3hJM+LsNMv75FuOyB3
         PYydwXc7Zo5LHl5clRKnPGjeHiXpuFs6xs+kl7Ja3+QDB71ERy3uRIjnreRRoP07VlFc
         I2i43ZKHNDex9gcYccTPVo9vjMM2guYSl4V3sH+PMhJaabfBydInxb8Bx0XHVDfIJ+5j
         P513bg1XV1TQgpA8ppmab2oeU1BKapTcwFy5KPSjKIVWkPW344wmNktfmjOPvEw7xKNC
         knaA==
X-Gm-Message-State: AOJu0Yy32cA8cU5S9HR0uQhrZrxp+12sBCIAoOxfy56mRfYUUY/rsRaV
	aDRbE2w0f7/mfGJUVxDCeI8wQjiYbaMQEzyoRZ4mKuzQW9vQSwUbG5fWRQdk/DZV4hE7/xUPIDj
	Fq2Ltr9+N/SCztuL4DWgNP3bCWeTSkFP11eU3KP89YdJqdM2E6uMacHyitnrsrqkrNZm/
X-Gm-Gg: ATEYQzx2OgWXmmsorNdlBYsV4i9+dnftc4Mpuuo89GC07BGefJiWwU2IPl7AhsWPFA2
	4ElGiwnu6X7enbeKVzBrG7OFe3UZ7StmxO+PWo+liu2dWX0dP/r1mAm6EiIkJnAhwLG/aPjt2+R
	xsCPuP9S8AjQdT9qR4ucNS+6U32YGVqC4v6KElHJIgqSIL+GH8bKiarC2jB+Mqk0qD2XBdm2Fe3
	lI/CSD7SpuKPUmx1jyI5B6vY/SSKs1qjMKADyJQD4bVQzE5r6+WJgudIYFNf/j3CnuiXADHRxuY
	A6oORvfvG9n6GykyFYXk80vgpHcR6jS3SzIhlLELvOjtUFR1+boW1QVYBeA4wWPucsn+uHsWHNg
	Lvpo4vzA1iW1Fjnl/1C0Q8td9xapUSvopkj7eVj0PnFg4IPGX5bkXpW6AWwhq62Ow01zE0eeV2d
	MPKL/HKYmiBPap0TXYzwWLIa970YD/6HLNyr8=
X-Received: by 2002:a05:620a:4103:b0:8b2:e058:de83 with SMTP id af79cd13be357-8cda1936221mr790907985a.15.1773322200192;
        Thu, 12 Mar 2026 06:30:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4103:b0:8b2:e058:de83 with SMTP id af79cd13be357-8cda1936221mr790904985a.15.1773322199750;
        Thu, 12 Mar 2026 06:29:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm8646671fa.9.2026.03.12.06.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:29:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 15:29:38 +0200
Subject: [PATCH v3 17/27] drm/msm/mdss: use new helper to set amsbc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-ubwc-rework-v3-17-b7e8f800176a@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=831;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oMEm/PoPGJyi64CJ7YjawXSAAJStb9rr/IdLW4TZb/4=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGmyv7eh2xlijC2Ywmck0cgwp9QDCHWz8Sq+EvSTEgjQfnPKZ
 IkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJpsr+3AAoJEIs8ij4CKSjVHswH/31K
 5W5vwlr/H6zY33xEcSjGjJbEvrK9D8tDi+Bf96GfGW6+bWkwluQBb5k67TrleO32wcamXAt10Fq
 FcB9zTNOLr85T9gkukmWTWKDtqRegSefoRAAy1gsFFDhasMacPoRIFo7PADuLQZGIYsTUW09ys2
 97ID3UvT/YKgXz+IdlnbqNdUUEoXU9H9dpdEh2eOp+iXr9sDuBZ9/a2bXXmYLvGA9y9DilBTLdl
 weGaLGfv2OO+Hz7BZDjpDA9PHdE00wOJg0z4poF69JPHOX/su4ilWepPoBUY3tmhn2HhOwTd7Wa
 NNWWNK6vITAr+krTbmzY7FHVZpuRHZPHA8plyUs=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ZN/aWH7b c=1 sm=1 tr=0 ts=69b2bfd8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=rfiAuV1fBCuPYiFmeCQA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNyBTYWx0ZWRfXycmgOF8F0Agi
 K/YLvGgMNHSEkm8ZJhEqkxTWgutRZn1fSuA5s/dYTapKRRIkJLX6vCPO/JqMidgxhosd0poMAms
 mY/BvPw0rvYfqYF4QDRtJoxmLinBUgK824z2vu54wPep7xb1p2ofm4/nsrPkwFO2LIOT6k20gZs
 rB6HSzTFNmDjt5XiHbqwG4hccLg7SoN3y7miRPIR1BKW+VEQ4tvypj6J4YFhVfiPF0Ec6wLIETH
 NtOD9ORKqsM5yIxoJMer6XbLn264odxPQy8WwJd8SloRUMUXSnguAGyokztS96c7H8tPoeOZz1r
 MtPVLEdze1FZjW3MS+65JT4QlFHDjF38lgbab8wbpcv/H4OS9Ny1Yi6TPerpuKsHSMdqelY4QDK
 oB+gEPMeiL/56boi3rjy0ASWd4+AaEwPIq/HpFEIxmJUgio1Ptn1vKHZyDNW/7xW9nbhB0NDWob
 cZs1IgKT6cZpkJUcf8w==
X-Proofpoint-GUID: sBdeH32GQtp9zq3omKyEQjvBmDEoKzB4
X-Proofpoint-ORIG-GUID: sBdeH32GQtp9zq3omKyEQjvBmDEoKzB4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97237-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: AAD44272AFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use freshly defined helper instead of checking the UBWC version
directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index ca59bcdde7b2..04efc29f38cd 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -188,7 +188,7 @@ static void msm_mdss_5x_setup_ubwc(struct msm_mdss *msm_mdss)
 	if (qcom_ubwc_macrotile_mode(data))
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
-	if (data->ubwc_enc_version == UBWC_3_0)
+	if (qcom_ubwc_enable_amsbc(data))
 		value |= MDSS_UBWC_STATIC_UBWC_AMSBC;
 
 	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));

-- 
2.47.3


