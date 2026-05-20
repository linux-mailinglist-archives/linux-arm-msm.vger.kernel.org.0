Return-Path: <linux-arm-msm+bounces-108787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DEOOwLMDWqq3QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:58:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 518A55904FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:58:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 20E6A30774C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78ABF3EE1EC;
	Wed, 20 May 2026 14:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A3oGLcOg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i0EFTc5G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303E53EE1D5
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288690; cv=none; b=ktOFvXSuQdp/3suNT5bA8z+4SFox0BQZtEPEc5aSxOhO/ppyNGBcmnbagqpf2zuRkAft9Yit83G0pqYv9dHQ3IT+BtezD2iW+2cxipTZu2JPAVVMX0zucDm4pcA3kdC7PCk4J21u+eRqF+D5Ub9Ovx7OAE3bfE7gGQUVURi2YX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288690; c=relaxed/simple;
	bh=NJiVsMMKzJws+Cks3lRdvlT1mL0gwv+c/6r+WaGQjLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u1hRxyUz1xHD/0GuLMEcf2sDIcoHtNi5nl7bpnaLmfdGtYsmpVLqVEEe8A88YvqkqikrUBP2yOyWve1f1ztsGOia6XAjsnE2TrBQY4cHKBiid3OXriQ1NOU2uVaPs9V+p37jneEhiVc2Z1IJN3LweL19cFo6Lf70RrYyp1VGVJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A3oGLcOg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i0EFTc5G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KD0Gdm1725496
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jnv3IJHVveO9Wr2l9i2vrKyKNiwoqkqE7X6w0Obsuxs=; b=A3oGLcOgFF1lDnCL
	pTtPs00VgH8TCriDXW1SOGfOpuZ4EtAwE1wL1q0nCKImvfS+DmjcbyfRjzhuElKI
	NHaQHOm4y+kSG6ODc2+Vpu+Y+BngCkyPQ3OEZHq3rfapNdo3gT3dx7ymqZq/j/xa
	uWcCZ53KKk8yQhfJjuhlQ9gaZ7/I7bdvhDX09hHd98Qfef3TAEcXIEFN9nglKLvX
	dV8fe41F52LT+jFnNyZRPTSeDNX3fd7YtOsuBWQ5mNoWpmQzNBFthNOAjpEGjVzZ
	4Tge3U17OKPrh4OIkiN1491spQwJdpkCHj4d8KB5yLUxIvqbn/a19SL+hh8PMsoD
	2ANB4w==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qn8u4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:28 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-57584c23424so13263341e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288687; x=1779893487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jnv3IJHVveO9Wr2l9i2vrKyKNiwoqkqE7X6w0Obsuxs=;
        b=i0EFTc5GmbTkRhrSMkJXI9QZafskPRxWRXTWIEAxgwkRDscvaXUPkSWBEE3bbmzhlF
         gBjpMXHpGAOSdHGVHPyN9jvVtEsTIrwwciiOpHiPsXiQMDsPwk5SpG/nmMTTKg1bIb5B
         KBa3Sn1VOSGesOkwNPWeQ0HfG8VfKIT6zcZpxk4IbmwF+k77uRETX/FE0QXAxLPLvQDE
         t3vj7+mIUcBMODQdNSiHoz5Xbm1YJI1a5nKVns+S1CvUfqKscjzINW+0+0jKNLj6r6c1
         UJPTMAg1E4Lk7CQNQaf2CYakMP6XN5MhyHxRKN7LKyomd63C74j3vTxaqzZVeoj6C7zE
         dG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288687; x=1779893487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jnv3IJHVveO9Wr2l9i2vrKyKNiwoqkqE7X6w0Obsuxs=;
        b=BSElccDd9/jwYKIT8eWLev8YKmqFz9BBdKv6LIfFjhVvUI7TDu6o5GGkbG92ztWLDe
         90MymeC/uruRgq4eSbylgaOCZZqvqdjAVxjtDJpqXrJqcT8s6CDr0RjGAPy1JzWhQq9A
         TkU+ZylilXHnZndHoUkC2qTGYTJ641XQOS+Z/37QbcLKvNZ+U7t3YRRbBt3wUQZWDqRk
         LN9AcYbzj7Gjz1gR0oAD8gqJJ5iZeQdRjs2L0XSH3Dl5I18OPwQoUBeHbpR4O2w894kT
         8zSKXQRTRZzwzcMGqFuV5WaQIMFuDxI24R4JW0ygeqfHg7XoPGobWSJ2OgDTr3oCj1G3
         8X7Q==
X-Gm-Message-State: AOJu0YxszQV/RBNWXThzhWu0Gajcdw8IEScf9hf+Lt0o8F05xzxl1aLi
	t8OwgYAfabAZp0/4SnNAL6SBExX36H9U9rWaeXtLjDEaBnEH8uC2/PqKnt9BBvVArLbD8IuyW20
	Yrc8GK4SMSar63ub5dTdJ0WYbC5fIAwbgmm5IiH+mdzdNIMJkM2Cm0FHoRKMa0YB/+GBZ
X-Gm-Gg: Acq92OFMZEO2PKg23KlmPQNk5KBBKsoD4OLZomEZN71CLVaDI9ggQArLJlq3cSJJJiT
	X5+D/xgH2NHHjNQFAzxzjMTW6BMiYg6Mav22Bi9+g9n4YhK1vcFo0XqlsFqzvbzPccxzoFbZIO4
	A/G7iZ1IYTof9Tgf1o8XIAM+tl+LtDXSLuzsX3bzEe/x2d3+AICcSRph9ZfCERnsmfptch6Guc0
	kQ3zNDyfJGjELdjfYjXkcgwjCK1eFuv09Pv1MQk/1np/QIwQT6UeBTWCheRTQb7CSwsnQj3W2qv
	T0/vvFaHa8MKeDjW6o/LgVhdlChE95ypStbcAe8Kez+5YXpCO0rc0pONv9+1+2RpC1pXmsT54sC
	dnXuvuDvVtbGoWUjn+n8THSFM4m/60sS4wdwDURjbxiff6hVNH4NUKI7nUwL1nMbXzvxezjSHvR
	tt1ipUTDFpDaXA9Htix3VHYRUl7yxpItI5Jnk=
X-Received: by 2002:a05:6122:30c4:b0:56d:451b:e4dd with SMTP id 71dfb90a1353d-5760c1c8c1bmr13737868e0c.12.1779288687425;
        Wed, 20 May 2026 07:51:27 -0700 (PDT)
X-Received: by 2002:a05:6122:30c4:b0:56d:451b:e4dd with SMTP id 71dfb90a1353d-5760c1c8c1bmr13737803e0c.12.1779288686682;
        Wed, 20 May 2026 07:51:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c78csm5128907e87.14.2026.05.20.07.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:51:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:51:09 +0300
Subject: [PATCH v5 02/28] soc: qcom: ubwc: define helper for MDSS and
 Adreno drivers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ubwc-rework-v5-2-72f2749bc807@oss.qualcomm.com>
References: <20260520-ubwc-rework-v5-0-72f2749bc807@oss.qualcomm.com>
In-Reply-To: <20260520-ubwc-rework-v5-0-72f2749bc807@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1061;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NJiVsMMKzJws+Cks3lRdvlT1mL0gwv+c/6r+WaGQjLw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDcpm80cDP5L52G3Lw0/8I+QpNhHqbG0OnWv2Y
 CS1v/Lono6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCag3KZgAKCRCLPIo+Aiko
 1R0/B/4wJHR93HM0x2ZMQYcL1jqZ9gJ1ccKOlBjmw+4s2qEGoANYjZ6aU5+QpnzKKfmyAmwCmdu
 jFtFii/XfvruQbGABUsPVE62vw/eLlactl5vWdsHLv38kO84S/daBvc2O6t4lz39eO+C9pY3geF
 bCH85Xq1B1/KxGysYvR4YKKFF94quMjxFMRaoEaMiLDPDjuv6RhN0bjZ/OIrHzGJzthMr9DAYOr
 nbyJyMuk+TJO4oFm36GT0/z2I1PE66tyBrrgPichLyMI5sR0wIAtqd0xmvy2yb3+YgLQJqWH9ok
 jydOHrQh3pY56EQuOJ1ucA5K9kPgky7Oyq5IGvgSfV/GBlgh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NCBTYWx0ZWRfXwOc/mBbzQzVr
 ktNoV9NghYX4SGJh8d4KRmgAvB3N8BvI5NHHbtkCK4bcjVQSmuepbZyY6P+3lZoLrWXdkNGGcfq
 SPYpuZG/Auih4RhiuKoGWOhk0xuP5HqszHy+bov1TLGbxBs7/ISt0o6wO+zFmKqJvAFEEd34pM8
 Bw0p5y7NqMJ61G7E2XoYJPBFQWNzahtO2NvchNw1NaVPGwPItWygSbb75jYLweINzNmnYBAPss/
 HPpok1unCxIeh498Oe9qj2f1FkX4TwIgbuezQ3VvTVYbUpZKDh1gyJ8ZG9Fj45PPj/Tvm6tOM4A
 N+F/JALpU6FV30skcD8dS7WnG69dQucuY+7V4CZJJKdgVWdaizr+h2P810xiSg6c4E8qYZC2q4D
 N5rGxUoXiVOElofzNqmYFG6qf1wv2l1wjKbdl5vM7Wc0bvflLPzzlA2bL85yZWV/bgz0hhyr37L
 XzPSiS8vik9xXnEQ98w==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0dca70 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=TXJx5zmxIxDbTTGRO54A:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: 2mFpop49LNayheFrwGjzV29NZxHRlTMI
X-Proofpoint-ORIG-GUID: 2mFpop49LNayheFrwGjzV29NZxHRlTMI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200144
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108787-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 518A55904FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Define special helper returning version setting for MDSS and A8xx
drivers.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 319caed88775..8355ffe40f88 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -100,4 +100,20 @@ static inline u32 qcom_ubwc_swizzle(const struct qcom_ubwc_cfg_data *cfg)
 	return cfg->ubwc_swizzle;
 }
 
+static inline u32 qcom_ubwc_version_tag(const struct qcom_ubwc_cfg_data *cfg)
+{
+	if (cfg->ubwc_enc_version >= UBWC_6_0)
+		return 5;
+	if (cfg->ubwc_enc_version >= UBWC_5_0)
+		return 4;
+	if (cfg->ubwc_enc_version >= UBWC_4_3)
+		return 3;
+	if (cfg->ubwc_enc_version >= UBWC_4_0)
+		return 2;
+	if (cfg->ubwc_enc_version >= UBWC_3_0)
+		return 1;
+
+	return 0;
+}
+
 #endif /* __QCOM_UBWC_H__ */

-- 
2.47.3


