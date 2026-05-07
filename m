Return-Path: <linux-arm-msm+bounces-106375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDEcOSeQ/Gn3RQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:14:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8814E9061
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E81CF3043445
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD3E410D04;
	Thu,  7 May 2026 13:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GClYmaxv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TuWp1Pob"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64865410D03
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159048; cv=none; b=lH/viaGRQMAOt3K71E0KKRP8CasSLd8nrzEECNQORvX/6nbPnladrwgJWahPoeqOzVOH3z7clW7uaDmh1X4Asa/yT74p1ZoZJC8Bn3BBqUkCL5fqeW7OWpOc0kMMVBRq3kDKZIPqdGddJL7PIcINdCS1xNJd/dvPJLHo5Emsy7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159048; c=relaxed/simple;
	bh=jfFUw3n+8zI8Hc5dMR/bUWCyARr7q9urbKP+Znc56fo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FhVNluJfjnhqpUM2L3Orzz3Nnn49GXbCPHMPgV75nukwj7I6NsUTQqrhv0c3xeDI0VCJyGFfMw15sShTavQeuLUQXgEsPBxgIvNzAldnxhOrydsKZeIV6py1VMW3T2Y8akp/dis2PrYxWiEUdYS6u7qR4fSqdo/Ngc7hCgW2Puw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GClYmaxv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TuWp1Pob; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647BxhKQ2734318
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f5dcXSbi9JJIK5ZZ3AWL3CvHDAq4EZmVMbYdJ9eR8Xw=; b=GClYmaxvB4n3Cc9M
	7PBRMQNPJ9uAe6+ZAP3+2zIBsVIp2hHhweod8Ham55regqQRwly/drh9VsvsVTy/
	4Q1gooVSf+IN6CgHq5yiSN/PpLN/V6F9yrkYaEmGZk4DLyCuP6xlBYFNsA5uglcg
	dTRNs7FSSrE84SWmWZeNy85s1/YUoeoXBwCvClSr9zvxMyzNkt9db/N8zK9kRTrq
	kKMV5JrF6MTAL7S+kODlEQDiGoKcop7K+PaMQ2iJpZP+UxVaweysgLDussI6sdw6
	30fMjyUo0YlHDxYXEspY8dEUpA8WkZvnJu9NTna1QPy3ogjmyB2mO9EDhviqiicy
	cHnfWA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tbqr732-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:04:06 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7985752be1so398706a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159046; x=1778763846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5dcXSbi9JJIK5ZZ3AWL3CvHDAq4EZmVMbYdJ9eR8Xw=;
        b=TuWp1Pobc+UOQdLEKKDa8ooZ6GMl1VyXAXKzSavvEMJSSzwXWPvDYljT478UiKZgrJ
         IjyMu1/40spdAEvr1jtw/DzjFDTT1YdtgD2KRMl3jdJ5vSMqqXHGjSmX+5H36X/HJL15
         U/kI0cMM6aYVt0I4DnbRPIKavnhSXwUgk0l1JU95TbmxDXKfbBuaRkic5alnyxoNdU/T
         2z02yQinnluXF1idq1FfkT9QvHQCZCzJqKa7YJehmm/j/YOrm+Z5D6Iqihftgy/l5ebZ
         7ZhsTEg1mtczJvzv2tJtApzydbsqT11aTZq6J/5VLOc7xak/XKLgDsCfytk13CMoF/18
         47Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159046; x=1778763846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f5dcXSbi9JJIK5ZZ3AWL3CvHDAq4EZmVMbYdJ9eR8Xw=;
        b=XLQIkbLRbjfrXo1eEDjnj4/aAYsEPJF959zgOcRttbEaE82GZ0bzKT0h3oKiETL16F
         0NR99KK5ImuevIgBFxSBakvMAsDqL8MZqHIBMHuImSaau7nSYLA1SuJY/HNLQ5xfh+LQ
         eu5t7gpifK/10qTQS70QTcyd4FGK8koTDSDzMSmbbBKAYiA1RosVsn9R3qzZF3eXUEsd
         uj/nNPNWE7GIwAlECIq/wOV8L8v3VGnGhgSKVL4fux3LHdVI4GBFHyXBahRPssTwKP/x
         P+0BnzoRvU3l0+i2CkxwzXld4ETi+AS1U0Nrrh3etuSenJWiuBUGaiKm3HvFKw75E/Pl
         cSbw==
X-Gm-Message-State: AOJu0YzLzfHp8x5KMZInHAE4EVbm/2wDAz/sOc0i/59U/2qgB7T4C+Iw
	kartQqJnWykqzZiaDJFgV0Navaau86jQ6cDkAvg4C9qu/f8H1Hv6yGMqRWIGVJzMOFZVf/hsYgV
	PGzyKJu6doYEAd84hPzC/rrCeMYjbRU9Y6Havi3ihBx37HPXrzj01jLqGuOZm1KqnyOpL
X-Gm-Gg: AeBDietG6ybS6MKFeOy1dE4WnrK7TV8i9DPdU4Q+R65TWLFOEfywlyem1M9X6Bz6oUc
	+4EIkGNPOBljR79vsB5DWP+mF3IN86JjMGk0Hg4tMCoI7y19HaWjhmJt62T8Ko84Ug+wVfu0BYR
	Nk/yHZRvLmSbV/nxA9q2j2DTJbq9pYsxyOe9n/kWa+KaAbudB9c3J95UixH2glj0b0+69Txcsdv
	qgNcRP3NeaSNspZHBmOE3HUcYzvWermfY5oa1zLR7DQKdBkiEAoMOzZxTMhB6DM7UoIf5koCd+j
	YwzYvIQPtyc2tQaPbkA++HWcwUmU44Xn9mID4c4tnwv8Yod0NmehY4pdrJkqgUi6hcQ69LDJyUg
	E9Xt3eu/negwpdXvMXM07meCdKk7IwZWKGo2qTqdidilqpp1v2zI9dsGML1rJaY1CTpLriV+Pgu
	mNaJyP0TpKsFTAHi1pQy/ePR/6eauVdE296+y68UdvbZx5WA==
X-Received: by 2002:a17:903:1c8:b0:2b4:65d8:6a20 with SMTP id d9443c01a7336-2ba78f50177mr85900465ad.2.1778159045765;
        Thu, 07 May 2026 06:04:05 -0700 (PDT)
X-Received: by 2002:a17:903:1c8:b0:2b4:65d8:6a20 with SMTP id d9443c01a7336-2ba78f50177mr85899735ad.2.1778159045163;
        Thu, 07 May 2026 06:04:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230c68sm5595959e87.19.2026.05.07.06.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:04:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 16:03:16 +0300
Subject: [PATCH v4 20/29] drm/msm/mdss: use new helper to set amsbc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ubwc-rework-v4-20-c19593d20c1d@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=831;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jfFUw3n+8zI8Hc5dMR/bUWCyARr7q9urbKP+Znc56fo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/I2H23kJy7WAVP5J8TYyfq/seV09GYmAtHwLB
 TfF7tgvuiGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafyNhwAKCRCLPIo+Aiko
 1Z+/B/9YnnwfpTigLvDcMWqXAicQLyW8JNZL3jAPE38t8gxHTptbUXSyn1EruOdI26Oumc0FaKz
 OmG5G3g441XroiM0xzBL9ikRilCBz7p2FrzDzoOfaTfiyQcoJS2+SVqK27zYFtT8/cwcDHvvFYo
 OHqrr7zv8aLh70PdDsmKCCfGisvU/3AHDDa/ALduhg8VvkyemtpZMx30FD9wM7TTBmqsqXUhU4j
 1cug+tEOBk830LRoaPdGXtDG9HPQQ+7sC3/d3Voulv2OH+5BhW+GplNPc8xjYS/AY2WgQT7YUGN
 pqbqHfYD1ReeCwpq6Qj1s7olxq5cgBQsgQPJpGYuDxExVF2e
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: tvBhWOC8sqFvE9yVmYXoaAF30b9VBNkY
X-Authority-Analysis: v=2.4 cv=SJVykuvH c=1 sm=1 tr=0 ts=69fc8dc6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=o_KNKqYLTMeQBHdYLnoA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: tvBhWOC8sqFvE9yVmYXoaAF30b9VBNkY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfXzetOExW9NP3P
 A5fU8pK1flsY+fPNwsM2mPKutxGTO4wDvcE3JwZ1qhuVy1e6Fpn+vUfHwhFWZmHZwGQIiinPHxF
 HT41SGhMOs6Mw6zOiRHZC7wZ6GdpwLcrH6ui/3cMrvb5bm4u9VwwEldnIcX73cEyywPDimxU3I0
 M5r4b+i4ZTZnRpXG8SFD92GzlIlUcxcXp+e7S63tqb/28uu7kZpBZRzu0xit0ed4pROj73g9NVE
 fU+KYvEZtRsDG5Hgx8DTrT8oGAYA0xZmcx24qQSCdhSygEp//R9FBCGWMAHLmJOSxYk5mM6CByI
 ea7Y77/MqFe7PeIqXhnKCxnFhBCHQwhdIUXzU0hm1G8VL3qge92OoLTHWhR+mq3qquz+6x1c11F
 C76N7NrPXmF42KkAdoIobpSzu5MBOSYNmz4I5kI7VYM1qj1qUciopUqvbk6+ZhQ8HETAl+gUWKT
 46VaM9E1lCXC/GZlOYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070130
X-Rspamd-Queue-Id: 4A8814E9061
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106375-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Use freshly defined helper instead of checking the UBWC version
directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 3c1f04f12c3d..4b230868ed90 100644
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


