Return-Path: <linux-arm-msm+bounces-108809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDBNGWHVDWrW3wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:38:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6712C5910EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 183FD304222F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E65693FB05D;
	Wed, 20 May 2026 14:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eeWI98GI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NhkE5sCJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EBA3F9294
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288724; cv=none; b=tFzUko7IiOurch7Q5VoyrCh7qC005uwqr7ajenoJyrWEtDI32LjFqzg2ch5isL3MUEtFGvMjPwdiPyYiceljgqe5AIhDwkrCUKwSsTwKu2F4iAw181qmITLYBA86JJHIGaWm6CrOz5rLfEwYAo5UidduF8p/O7zlsdX6XYmepxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288724; c=relaxed/simple;
	bh=GaD3OADWseoOG5QeHpQmN/nkA6MzTACq4ooKbr03Zf4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R9BTjb7p2ex3TFJmcNNS2ir/JKD+o0djoCUlvGLbCm6f2n6rXvHjuhthBqBx1db5I1uPlTY393BAh2BElmukdKKV6o1fhkEu4tYG4/m/Y4VYXefw6HbxcHIjQX3OZEIOs79Rv/r+hoWiZbhZEEFvCc010yKqf60xgGc0zVFZL4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eeWI98GI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NhkE5sCJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KE2K3k826528
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VGf89U6GYhkUCRMDjtnMSMgOlYsB5OBRKvGiOBHGpas=; b=eeWI98GIgwnCxGvY
	I6JQkkEoPMLkCWm/7UShBuPtK36ii08I+qJl8UzNJGl96RW/R3usc4pZ88MMcSp3
	9j02mJKN6BhWU5ERZ3qGNSuM2vLW45TXZa/qm2FB9fDLGA8g0TFedb4tMDM+w8C2
	2DqWANcAVc7SOSty46Amuvr9r3no58Pugkvuwbg7cDmRL+7DApdGlfczjl/5N5DS
	MAsPczOw8Qu1kXDVF9Rj+NUOoWV7ZKj9HHTiIe4zUc+wQPRxLbllrj2rKzCTyHVi
	Pv71bRXHyCkpx0yUuCX9MSESFSaWniDz3Ze9fi5XJHOhKkEvt7M7IYG87XBCyYDg
	VswmYQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ecag6hb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:52:02 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-63cbb164b37so11339432137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288721; x=1779893521; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VGf89U6GYhkUCRMDjtnMSMgOlYsB5OBRKvGiOBHGpas=;
        b=NhkE5sCJvce04CcjGm8qcXiVjrMhqy5kPHct45ulqfZmHJy0HrBMeSu0jmhAzJpeZ6
         NQEWPeUN5urnKFfHfqHWZE3E1Py8NKzVpTzh2MammpuT5kZpQe4fVhoT+6QEA5VX3fnD
         km2I9ckEtyggR9i7nvdE39J0hZL6ZDxr5Qw5DrEcasjdXmh/CtwDSFCQO5XCpFtS6JCV
         Rt9oaTdRQEdGGB7Q8vs/UFhr5Aa+HM3khFDdQIm/8Mzjn6JuBf4hoJKE2MUXVEkF4G0e
         8p6wd5baaAcqRU9Phre+uV8/zBFXh6BUKraH2TuNbZO7VJBNyaNiz+lAUePHfPJ50Dm9
         MXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288721; x=1779893521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VGf89U6GYhkUCRMDjtnMSMgOlYsB5OBRKvGiOBHGpas=;
        b=d/hLNy06cBk7wfY/c9HDRToJkJNEF/9oiZQuoVIuIKvhvyDcQcumVrZPREZ2LnfW+b
         w0eeoTXKVev41k5+lpM5uDb1M7sDxHdkksFEMytzoBhiqUR4JrSfblk2Rhp2Xv08lI4Z
         +c5SCzbdNzK2JVVXaubd6C0SI6GSpqOnxJ4/EV0MTydZEgEJHOy501B/W2o22EPDkQak
         HxgBI6bQlVWXpTLOgx1LYUN6zVGZf97bNpv/y6UnrgXdxHY0DTdse3Y3ZIC2xdsNgCK4
         jg5PNtCl3I0wkhXkeEncL8IVkqSIVlAgbRc6a7qAtZ3lZ0pQWbkb8hAQunwkUReLde6J
         ZkKg==
X-Gm-Message-State: AOJu0Yx1VAi7pMurPW6Lcx0NekzmqrEETL1TkMeCKzKfqW8Np4AsS2kF
	OQ5WkAkuKt1hJPaHttTXzBTV+6xRxZZUDa/w9nzAiyg7XlUM29a1RF16wiw9ZVkU9e7/TwAHVEg
	cUFcriaSc79QybS5yYMrw7dfOLXkXszPeMXAUojNwi1d/IDEqltewhXp/E8AxwSAKi3Mp
X-Gm-Gg: Acq92OFSMGSvdlidsRGt1y0UErlWg/hF/NJTC3TlvR50Kzum7ZsSFNyF2uzI08+237g
	+1i2AhEQtJrXUeHyHDLpqLl7RJVzESLHse7+6+a2iOIudw4IMcRMLh22Ve7flYQrSEQnzomYIxa
	YFDmMHH5zgX3eXL5F2L+kjzFjfdhJ+KoCHMppa9CnnVJJuqmP1H6ABJlp3Fm2WIDO6qMqcohujS
	uflh95ejTObFj9I5ufPUb2hzqGr44+UiniMDIsmC5DY4f1wNqgozwgpUT2+LPN/DlFdWItJi1RJ
	JdXFftLbB3wKPRWX3yksoOLEMMWlnqPeVrFu69BFRLUWJR4C5cNWTPxwdb1iGQ69K4Jb1507zha
	nE8hC+QGghsu/+KBjb9b6JrgpzGrf2evsKCFKW2dAQilDPVew7vC8MM1pH5QzVpmVX9FNiG8TWq
	GEmcspyMy2NL5WAkoGbC4As+Fya0HBwsxhw4e87XFCwKbKBw==
X-Received: by 2002:a05:6102:2ad5:b0:631:31cc:e3ef with SMTP id ada2fe7eead31-638b7bce28emr10836761137.17.1779288720942;
        Wed, 20 May 2026 07:52:00 -0700 (PDT)
X-Received: by 2002:a05:6102:2ad5:b0:631:31cc:e3ef with SMTP id ada2fe7eead31-638b7bce28emr10836726137.17.1779288720423;
        Wed, 20 May 2026 07:52:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c78csm5128907e87.14.2026.05.20.07.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:51:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:51:30 +0300
Subject: [PATCH v5 23/28] soc: qcom: ubwc: drop ubwc_dec_version
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ubwc-rework-v5-23-72f2749bc807@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8355;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=GaD3OADWseoOG5QeHpQmN/nkA6MzTACq4ooKbr03Zf4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDcppazzmFMZGx4Xv1t+eKUZjtt90xnyHtodIg
 DntymwMSQmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCag3KaQAKCRCLPIo+Aiko
 1YO3B/9PA2rwOTvV4BBcAi/pXbQ3DpD3NoXApZ+T0/yYtpyyujBJH+9/SDOjHhk8uHMXhb3C634
 S1MQHalBlNevPcSDjGMuBA4uvF7y8qUKhHvO+M5XACGHYdHHZPjZTxJhJb9I53UpUY3pzyek3GL
 /3awgs/l3FrX+nImCwBRK2Nh8ylaYMGLMNscHR3lDHa6IGrz9twNRR9XhiJlLazgosF7jf12zhI
 DYr+P4Fq34PPy8JOjDPon4+ZdKIeWYtt0S8LdKGDzbu8BJ7nfjnv4QYjz+mNM2Skdul41TtC7Jz
 fzj1vMSl44qb7txXgD9R6NKEwyZataIpM9ScFz43euQpWGKA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: cGb9Nt3XwljH96NGu48VurwPr1QCdVde
X-Authority-Analysis: v=2.4 cv=WqMb99fv c=1 sm=1 tr=0 ts=6a0dca92 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=BpkRCZfudPv80oEIFw4A:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NSBTYWx0ZWRfX4cWcwC3PWrxJ
 IjyjdSLD1BRUU6ZXNFIWx9kVKD+h2HcyC3hCzK43D5175pU1wEHYjCEuNREzqtvOMoBXMdlQIyO
 aJ7llBEOj7pYV5ri/pIRUi1t+YIxVdaNxegf2TrgZ+evYn+gkuFp7l48Ihe8D43e2R5eqrFfkgv
 DlfPkgxN2Bxwytp+NncadT8ycatKPcE5pYvpi1HdUYm9XiUBHyCOoMDVhsN12J3+xDNBSMKhT8e
 7faUeGHJTtQDNs53lWKwZiC4gp2L11GCzJQzL2MKbIMjbctJBH85ioAvdxnFyBE4eNXUuqoSK42
 R1uCjvqJbkw6U9jYCEdl/1bvQbM6UNaKXRZ/t5HUZqsrXq3UtczPCRJMSlJc6WFGpN8TLJNfXFC
 RiW0jwAa0CgmP7c5iQ0w1odfLG2a0thE3h8VuR4CADCU4+R4OJR8rZCYQACkgrrnclvzs3xA0Li
 qZBZ43tp9EFAUhpCpAg==
X-Proofpoint-ORIG-GUID: cGb9Nt3XwljH96NGu48VurwPr1QCdVde
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200145
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108809-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 6712C5910EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The ubwc_dec_version field has been inherited from the MDSS driver and
it is equal to the version of the UBWC decoder in the display block
only. Other IP Cores can have different UBWC decoders and so the version
would vary between blocks.

As the value is no longer used as is not relevant to other UBWC database
consumers, drop it from the UBWC database.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 23 -----------------------
 include/linux/soc/qcom/ubwc.h  |  2 --
 2 files changed, 25 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 3fe47d8f0f63..1344cda0fb75 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -18,7 +18,6 @@ static const struct qcom_ubwc_cfg_data no_ubwc_data = {
 
 static const struct qcom_ubwc_cfg_data eliza_data = {
 	.ubwc_enc_version = UBWC_5_0,
-	.ubwc_dec_version = UBWC_5_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -29,7 +28,6 @@ static const struct qcom_ubwc_cfg_data eliza_data = {
 
 static const struct qcom_ubwc_cfg_data kaanapali_data = {
 	.ubwc_enc_version = UBWC_6_0,
-	.ubwc_dec_version = UBWC_6_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -39,7 +37,6 @@ static const struct qcom_ubwc_cfg_data kaanapali_data = {
 
 static const struct qcom_ubwc_cfg_data msm8937_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_dec_version = UBWC_1_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
 			UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
@@ -48,7 +45,6 @@ static const struct qcom_ubwc_cfg_data msm8937_data = {
 
 static const struct qcom_ubwc_cfg_data msm8998_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_dec_version = UBWC_1_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
 			UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
@@ -62,7 +58,6 @@ static const struct qcom_ubwc_cfg_data qcm2290_data = {
 
 static const struct qcom_ubwc_cfg_data sa8775p_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
 	.highest_bank_bit = 13,
@@ -71,7 +66,6 @@ static const struct qcom_ubwc_cfg_data sa8775p_data = {
 
 static const struct qcom_ubwc_cfg_data sar2130p_data = {
 	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
-	.ubwc_dec_version = UBWC_4_3,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -81,7 +75,6 @@ static const struct qcom_ubwc_cfg_data sar2130p_data = {
 
 static const struct qcom_ubwc_cfg_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -90,7 +83,6 @@ static const struct qcom_ubwc_cfg_data sc7180_data = {
 
 static const struct qcom_ubwc_cfg_data sc7280_data = {
 	.ubwc_enc_version = UBWC_3_0,
-	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -100,7 +92,6 @@ static const struct qcom_ubwc_cfg_data sc7280_data = {
 
 static const struct qcom_ubwc_cfg_data sc8180x_data = {
 	.ubwc_enc_version = UBWC_3_0,
-	.ubwc_dec_version = UBWC_3_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
@@ -109,7 +100,6 @@ static const struct qcom_ubwc_cfg_data sc8180x_data = {
 
 static const struct qcom_ubwc_cfg_data sc8280xp_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -119,7 +109,6 @@ static const struct qcom_ubwc_cfg_data sc8280xp_data = {
 
 static const struct qcom_ubwc_cfg_data sdm670_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
@@ -127,7 +116,6 @@ static const struct qcom_ubwc_cfg_data sdm670_data = {
 
 static const struct qcom_ubwc_cfg_data sdm845_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 15,
@@ -135,7 +123,6 @@ static const struct qcom_ubwc_cfg_data sdm845_data = {
 
 static const struct qcom_ubwc_cfg_data sm6115_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
 			UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
@@ -145,7 +132,6 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
 
 static const struct qcom_ubwc_cfg_data sm6125_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_dec_version = UBWC_3_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
 			UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
@@ -154,7 +140,6 @@ static const struct qcom_ubwc_cfg_data sm6125_data = {
 
 static const struct qcom_ubwc_cfg_data sm6150_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
@@ -162,7 +147,6 @@ static const struct qcom_ubwc_cfg_data sm6150_data = {
 
 static const struct qcom_ubwc_cfg_data sm6350_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -171,7 +155,6 @@ static const struct qcom_ubwc_cfg_data sm6350_data = {
 
 static const struct qcom_ubwc_cfg_data sm7150_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
@@ -179,7 +162,6 @@ static const struct qcom_ubwc_cfg_data sm7150_data = {
 
 static const struct qcom_ubwc_cfg_data sm8150_data = {
 	.ubwc_enc_version = UBWC_3_0,
-	.ubwc_dec_version = UBWC_3_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 15,
@@ -187,7 +169,6 @@ static const struct qcom_ubwc_cfg_data sm8150_data = {
 
 static const struct qcom_ubwc_cfg_data sm8250_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -198,7 +179,6 @@ static const struct qcom_ubwc_cfg_data sm8250_data = {
 
 static const struct qcom_ubwc_cfg_data sm8350_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -209,7 +189,6 @@ static const struct qcom_ubwc_cfg_data sm8350_data = {
 
 static const struct qcom_ubwc_cfg_data sm8550_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_3,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -220,7 +199,6 @@ static const struct qcom_ubwc_cfg_data sm8550_data = {
 
 static const struct qcom_ubwc_cfg_data sm8750_data = {
 	.ubwc_enc_version = UBWC_5_0,
-	.ubwc_dec_version = UBWC_5_0,
 	.ubwc_swizzle = 6,
 	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
@@ -230,7 +208,6 @@ static const struct qcom_ubwc_cfg_data sm8750_data = {
 
 static const struct qcom_ubwc_cfg_data glymur_data = {
 	.ubwc_enc_version = UBWC_5_0,
-	.ubwc_dec_version = UBWC_5_0,
 	.ubwc_swizzle = 0,
 	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 0b5aa9d0343b..c3f9efae5db8 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -13,8 +13,6 @@
 
 struct qcom_ubwc_cfg_data {
 	u32 ubwc_enc_version;
-	/* Can be read from MDSS_BASE + 0x58 */
-	u32 ubwc_dec_version;
 
 	/**
 	 * @ubwc_swizzle: Whether to enable level 1, 2 & 3 bank swizzling.

-- 
2.47.3


