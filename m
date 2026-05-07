Return-Path: <linux-arm-msm+bounces-106356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KP4wJgSO/GmIRQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:05:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D13E4E8DE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 270833028568
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65FC53F54A0;
	Thu,  7 May 2026 13:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gPADgdc2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K/lsWI9z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94934388E49
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778158999; cv=none; b=PIDvvPbYv02KKw4eVS9f7HCtCtOEU4QlRZwwUZaGf7AehexGbrmGt9Rq0SqpiAM/U69tfXdUnWhgizH/qp2oZkRFQJ0zbB6Zw/ubAOmfm36tA0xC9+zylxzBxSntQPGYQm0SDMp8b26YXNQmkRhWQ4C5M99aayWT8KXixy0vmgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778158999; c=relaxed/simple;
	bh=NJiVsMMKzJws+Cks3lRdvlT1mL0gwv+c/6r+WaGQjLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bdhBWndw86fIrWLuuELUu+cGQhENet+z214/CZ9YZ3zC/gqvvsmVvlP5MQWjEWA4IaBtP3GsYr6ZltV8DyLjIe065yFQua958pLxDRup4STWkp8Q7JYe3sJ3PtGFQOJeENim22AJbvWv68vuz1mrx6XQPfIUn3kfOBjpsoJuwy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gPADgdc2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K/lsWI9z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6479mK83026622
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jnv3IJHVveO9Wr2l9i2vrKyKNiwoqkqE7X6w0Obsuxs=; b=gPADgdc2GN4ODD2S
	8381BlK7gBkFVvMWEq/3/bPMJpe0CImOdd326DS23RObjVb/DVr4nxobiI3QdtN7
	SfPVeDbc9IOyaGj5CMll/snKoE3Kl9F7muRknQ67dGhwhQDvRP02bwHYkYlqUK+G
	CntKtL659EtMQ7LUNSlU4p8ILfXSwT7vpb7fU4lBjAeTNYTjdUxQHXlUa+qGxnjl
	1DVj7/OGBrtdWrQ1xFx5CmKHNTCa+G/mrc8bJgBO0jBRZHmiUpNvqzyJy/WMeO/l
	rzT/qHPJC0/BBE1bjL2YgOo52IGztoSNXdkti9lBVabf6DZ1eq+lsshl7yf+huMH
	CL4xBQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1t1yq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:03:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba15e384c7so6376645ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778158995; x=1778763795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jnv3IJHVveO9Wr2l9i2vrKyKNiwoqkqE7X6w0Obsuxs=;
        b=K/lsWI9zcI0V9NzBDXf8dMRW/nyUvASuXD3JqSWOMtEHQlO763mBrNp0yXkb/jD8FS
         WfMjWA7xQNpztdHbraj5EmAMPKSnOXk6UmYzCsdFd8jRv3mjHFueRmO2yXpzvzqaXwsx
         ZSwZ+fILIaBgAusoAtCEYRtTGnLYcZdN4d+l+qYl3Au4Wyto3IVG+EgTck09ecWlkiXP
         KiAYYoeWofc1TYCPthDtokpNsPY/iIFIk4XBV9X4Gex0luqbDAdJJDCqYiKtt/qtLAgr
         S1nM8RsJ93HtELXilaaulvv8f863ve80ij2UJw1ldxiyQk5A/ne4YosP1QBKdGF+Vts6
         v1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778158995; x=1778763795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jnv3IJHVveO9Wr2l9i2vrKyKNiwoqkqE7X6w0Obsuxs=;
        b=DC657YB7IvrmbshI9JuMPdyer8GqWwybwW8zm7WisZXgnVCV54boKDpWvx3lH+QrDN
         8rLNVRYnMO4ot1JDWJdRWa5DmVh2YD41wO3yXlA6vUshhqdCrwU2vQCi8qR93+jbxmiG
         X8T/OvXxTKU+3ci+J+jOWS3T2nv1seUdCDF/P8U7puAwJhSTujxOtyFNKumdSN7eTokm
         oz1lNxQQ8AA5gNNUZZkR82hSUv3DWWbQ78RSIFkJh1ceVvLmlTlZlRMS95FQXAux/01G
         Z3H/cdCdTYDbOvVor9R8V/ZdHxUKaHYuxlNQymbWkgToR6m065tX8s7uLCQzuBXaOwG1
         ZDKQ==
X-Gm-Message-State: AOJu0YwJUn+NBgHf0+vIXaJxYmAS7xWMQre7KkbJ2ZBOwKT7cHqztZIR
	rVGFHfOxeR1lxJlF/kiBVNDxQRtZs3gr+oiSkPtEqAuojMoZMjsiCOTT6Fao+H1qKcuOLnkl5ir
	9djUrpGszwR9YvL4aSDRpRamJORys0VvETODdg/PL85Bb2XLso1Tq9aN2aBlQaAK7Z0OU
X-Gm-Gg: AeBDieteIJRyhV34P6zOh74Y/M1DiQrtdmHT+ro+MtoH4Eqp0zVlny8OtbD7DpIT/BX
	HJYyCuZDNgYieYZyt0izT/A3ey5/GMXSnchX2DMX84T4iS/e/Y26+aS11dK/qU/6YcsOq05qa26
	kRIAvfWfhmimzno9m7vKMvrqT6Q6N3ITOk4diP81bSKpUtns7GmDAFmM+mZMB1ISG01N+Rf8UGy
	mrNd2TsVVLPdKyEjMsWgBASAXvRdOnHbfiyDp7wioLUvGmuEz2+/os3nWPfwpNJnmmel1ysnF8d
	4lqEdoZ5dX81GllI8a2Tk2GAMr/B148IX2XM8q6DpJYxdMvCKc2HQ4oFKj5yP96/Wak4SgdchEv
	DOu1GQrHH4fE5QcqmGgBhVxF+vArJ6DKx28oDU9IuTg9i71LxTMFwyZTkK4nwoKjVXW9P/2YGBX
	ZRfNesgZvEED8V0yURrAn+cS3ctVGVGP9SH53roUlVYJ3H0w==
X-Received: by 2002:a17:902:db04:b0:2ae:cb0e:fd59 with SMTP id d9443c01a7336-2ba78b30aaamr81120705ad.8.1778158995381;
        Thu, 07 May 2026 06:03:15 -0700 (PDT)
X-Received: by 2002:a17:902:db04:b0:2ae:cb0e:fd59 with SMTP id d9443c01a7336-2ba78b30aaamr81119995ad.8.1778158994785;
        Thu, 07 May 2026 06:03:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230c68sm5595959e87.19.2026.05.07.06.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:03:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 16:02:59 +0300
Subject: [PATCH v4 03/29] soc: qcom: ubwc: define helper for MDSS and
 Adreno drivers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ubwc-rework-v4-3-c19593d20c1d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1061;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NJiVsMMKzJws+Cks3lRdvlT1mL0gwv+c/6r+WaGQjLw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/I2EJ+8pOGUuuyBu0o3d2qvdC5hAWHh0TuDb8
 WyeNkc7lx2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafyNhAAKCRCLPIo+Aiko
 1R8lB/4uHk56IVUJ/QuYvoKuKjNL+ak7J6dJHZKiFN8JN1hLoBndS8JqNZOmU3587DTMScfG+pC
 6vURC07s5Xwy3SlbakACSDvXGN7fqw7iE0CKwknZArh/qSOa53WZh5DBzwz70aVX9QaYz8Mlf8J
 Abzsnm4vFGBmnDj+xxtBEN9VdW2qaNDPqDzxyEjtp9JdX24AGk8s6AwhWgg/eL440WFM9ZUWnV5
 Qt76sg8u5vuvf65Ld+VLGRJRifa9FDIoPyNgA+aCYrcKu1HO1dAXIhtimmFk3cMPY2O1YWOC5R/
 X0+RGieOanVvF+uMil3Eo7SKo+jGxFoYF4EW/LERe2G1QVTc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=EoPiaycA c=1 sm=1 tr=0 ts=69fc8d94 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=TXJx5zmxIxDbTTGRO54A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: guX-H5Zz-9Exqg-Ebe7r0H1UuejFhi5s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfX0ShQn7OEemho
 a6aBjXla4nJ2/ckNRnFyNwdb1gg0WFaZw1Vrdbin54GZ+Oqmfkki8dExRPtGUlgGpOfD0ltPjMw
 pAUzBK2MC1+e/bTcwRzwkPATIhpiD4He+DjyaUOjxC8BBriiLq0ag1BGxnmyIzmoNwU3tkH8KJ0
 V9TjdrtuNK3NMzB5xSzj89tDlOwjcCMLrHhHJcft4SQCEFRSQUUQ+DhL0t3YHu3NvkZY7kku1hD
 trFNa41BtcBnkN6FY9JagSqZI8CXYqMAGnH1Vh/MEkGBLrbh92kXuF2rRKnKPJC0lumivSIuOHm
 INZBCo42Fu24GbRvY9yXJvsVk7ZQwri4UFl/6RILOCN/CmCosuDv7rqY39UkuoZEAWzijKrsOkt
 s9WvuxBuPsvVBVHgsgWK+B1dTt459RlD83y/3j+fVuLeb/aX2onGN3cR6UNM+fqmq1hsHX8scpx
 FVRQPbVKeolDeIQwe7g==
X-Proofpoint-GUID: guX-H5Zz-9Exqg-Ebe7r0H1UuejFhi5s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070130
X-Rspamd-Queue-Id: 9D13E4E8DE6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106356-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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


