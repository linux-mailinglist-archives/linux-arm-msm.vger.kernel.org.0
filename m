Return-Path: <linux-arm-msm+bounces-97229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBIWB3jAsmmvPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:32:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F84C272A81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:32:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC960302B234
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7323C9EF8;
	Thu, 12 Mar 2026 13:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zz/zUjYw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RsqDf7hG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA733C9EEA
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322190; cv=none; b=DtaS/3rwBjQM6408SCuE8SpykNpLyjlxLPR7/O2man3oNTmG3+xF40P2j2gpz9D5mGi/eTA1Qb0TVZDSP/vzbr/YiSxzWJjLegGQ9FwerNuI4CJJok+s221l4MvAcZz9MjhsRDCqc2d6GJ+JdLAgAkUW/2j7mZv+Fhdz1D1xJVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322190; c=relaxed/simple;
	bh=f+xu0X2Dvffg/en/Ri5kZ4UL9cHuySjQYKW8TgamZik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ji52BplncdSgA10E7eGKeHJ86japw0cPR+rnj7E97BQksNoXkmuQyu4OUe9nIxM5YlIAkL0bRpDDxdgHjYgmoJCBpIotLtrrRutzoi4zXYnxMpsk4VrcwLWExw+JXZ2i7CKX2lfMNr25pzpkRkLi/p1HCfWkVN0Ha//aJxZOJxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zz/zUjYw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RsqDf7hG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9vLoa3668464
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JSQrds/2TP9Ues0FjNkY9V1Kd4kRgiqfrKRrWp2sgaA=; b=Zz/zUjYwUoaf5Xpk
	Xy8d2SdjHkMv2MT4ohrq9AiBk8apgsgrWJAdthKILsQZJSUk9vGXVVyy9zJzMTb5
	aKfTT8gfWYamRRGp6hSgFtfAbUFuJ+t4uESjiHHb1KMPh85NUegARZ8XeRVOdRQz
	QkvZAth2r1toGRes5YvaJ1KkjSzJzoBeJWWBAKDOJZuSiGi1mZ5XF6JCEt//ru87
	2T0vQzeQ7jOXoWH7zjoSkXN4l1bkCG7Y9oHFYZEYVgP3wm3WA6uCJn+JWFM51tFE
	S1gB+FNKixldkQFCL+1DQstXRoAXEaaO4Luz0mzKOXg6PlO022C4j9bbPAVn+Fmk
	Hd1FzQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh60j7tg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7a25c5a9so561255885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773322188; x=1773926988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSQrds/2TP9Ues0FjNkY9V1Kd4kRgiqfrKRrWp2sgaA=;
        b=RsqDf7hGt6q4s6KS6Kw7qZwU9oobA4fUe7ptWVWfyhJh4wICmK9o9xRKoIGvy58fON
         9lrMZOi9cyWdxb2dzJj+14X0VqLKx7oayvu1uLtn/zXVsSkOkW7fAzzPBsSSo3zSEeqo
         bmKBQotQi3/AaEIVPs9c2DBfZrRu0po4QiXu3eGV0ylcbbT+rtfQNmck7M32v71XzGPj
         NtdbWNeXTf0a27qV3UF1jikZRP0ZbwUmdae/lIQj4TRFODIe9nsTIiWHgXFBm6G8BKFn
         AWrOCve6/wUytycoNWEZxdvMmyEjJSqS7enOUpbIzCtwq6CbWoPDmZtRVpkE09+IaHs6
         LFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322188; x=1773926988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JSQrds/2TP9Ues0FjNkY9V1Kd4kRgiqfrKRrWp2sgaA=;
        b=EPSi87wHkBNZQ9mw/0g1hu8eHvRt+y26g++4MoA373fT2mspwLlW/z1PwY0hMXfOBc
         yAuAxqJoXkruqVc3f2pAzGy8DmLhnxD8SmtdzYw7pIrV50x0PcnhlLJGnR+QtwfcaT8k
         grUR5SaQd7VUTxbZsKm8IAbQQB2kB6Hnzo3tUVvWgkOkA2H5jirQzm4SCkNXPHQSvg1o
         XocDgd9I//7Rnc/iK5PKpvv6uBk9ivBYRBlQ99MjmgzelcxqQhUs73MiPhXBLPPvsEnB
         Gyb+X7qO2IJ0JzA+dp9pduIY//vXyhcO48EIJ262Lz51O8cR90ZwpbmJMygKbhxbtlRb
         F0vQ==
X-Gm-Message-State: AOJu0YybkwOA6pmVs0tit9AgfX5L7HpL/Z82l+J/CXgIKtRCViM98Zfb
	EPxr0ezFHLb/6YxkInWccn2peYpVSnIzO8+BeKS2vJcI2vsD4ytyaN9egpDwDKH0QJUzhM6uImI
	dE6h7+02fk3rQa8+L1poTVihR842kOwNa5l+h002nwKA1+czj2WISPcGOPHc0sn6Rrmbc
X-Gm-Gg: ATEYQzxvUzwmPpeVz0kx0vjy0B4GNWatq02KMEycmA7YLSOq+3LyWF079f7ndHiQN+y
	mpnqclUqhHZuqIMSK163ZV9eqASocB4+cnFwSQoG2LIUCBqxWVZvZ+EVJreIJ9P43KtPp5f8IZs
	V1SbqjzIoq1zNbX2rDfIoxX11rU27MZh/ryO9DoigNCk+7jUGVWrpztM0JPztpCFgvJZEr+NfHo
	167h4LZQ+Bg2fWDzTvLZoFJzuoOoxJ/F++VVIRswFB77GUq8Z8Dogy+zNPMWHL9+xa+LD7bxDNg
	oMJFpX7HldCWxDKb2ZzF8HMhfDe8SmOetDB6+oECtHiz73eDPJtmMaxYykJc6bTSMAW8c9t3Xlx
	PkUJ4cNGsrQZByKr9sHQItfPGKfSAYCvjRhKEK93o4/tvcU9iXu+gMzM2mWvVZeOiCv0dTDH7tP
	xte/tF9DaPB/DA+LUwxb9QYOdUsh9G6/sERCY=
X-Received: by 2002:a05:620a:d8c:b0:8cd:79f2:dc3d with SMTP id af79cd13be357-8cda19f812bmr830432685a.26.1773322187928;
        Thu, 12 Mar 2026 06:29:47 -0700 (PDT)
X-Received: by 2002:a05:620a:d8c:b0:8cd:79f2:dc3d with SMTP id af79cd13be357-8cda19f812bmr830426785a.26.1773322187398;
        Thu, 12 Mar 2026 06:29:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm8646671fa.9.2026.03.12.06.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:29:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 15:29:30 +0200
Subject: [PATCH v3 09/27] drm/msm/mdss: use new helper to set min_acc
 length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-ubwc-rework-v3-9-b7e8f800176a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1832;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=f+xu0X2Dvffg/en/Ri5kZ4UL9cHuySjQYKW8TgamZik=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsr+1jHsb426zm4uBrGigV+rm0TCVg4UZFxS4n
 iCmaHB12Q2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabK/tQAKCRCLPIo+Aiko
 1a+EB/9I+Mufht0YPVIuz1//POLvhN2ER/ApEdvJrcFQQ9P/xjK9eewewKpmFQWZ31l5lnmdj+B
 WDjRexmqPBJ89caruMpnFqK6O8DifeAq5T2YtPGtS64X2XXIXIEGSNqX/wRegJtKAhzxL9x8DCq
 jMeXyG75jz2ezsqphslt3BdjTGb+cWhnatfCUFihx+Z37Z6KC1zf/hFtlBYA6AH8yvcYhjoOboU
 7rf2G5eyvk1R/0UV1alrzhdfUWqzv+Qu3Uh2JLNN9RwfinudH4dmtbh8OTQqEIDFHYsSKXzQsaq
 wea1b1Yx4MLs906RQZO1iy5MvwOI9QSVmZoMYbFQyPvh4h7L
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 968QevWFBm8VSzsXh3I_lZxtFJ-shDq0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNyBTYWx0ZWRfX1syILfq1dJdR
 QjZxHdqiZAXHUFuZUgbzMrCzqAD9kWcfwXuFkNklf9XuKVOOAQP9yqf9pNKDfIvrL4Yvq4o91qD
 r/bXos3L73xQUZilzto6xTQwcQBWqBwNb7z0uMl8A2jGNclSELZ7YcFmglXYL2wBcJ4RgAsd8VP
 GQrpyBeSzxNEJ2kKnqaSxnkeVsNn8m2VrEjcSZ9LDZMVhTQVZXpRN2aTWLQGC4udP3IuBqKTxW2
 iZCeGVbfYOrnbLvr1hyoSHLvtFp+Sv7Jqem3fvxrRdQJXzwVhSjTTM32lSEOtIwvk7A9vglh8ER
 QnDaPUvc9iVOPkyIgBDiZ0Td7BvfjxmnUffl5A4suU++NOn1XzqaVXo1Vf3JgWzrRScZmjLNZu9
 X3SPgw8MBaLqt8i7/ckFRiTYOnBNaPD+Zv/DXG2RuwE2pLWK3yP6FMsghPVCLafasCK7gWZbNRS
 Kj7cvzZ628y9OyIFBhA==
X-Authority-Analysis: v=2.4 cv=DsRbOW/+ c=1 sm=1 tr=0 ts=69b2bfcc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=X-e67srwgh_QgMMAbO4A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 968QevWFBm8VSzsXh3I_lZxtFJ-shDq0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97229-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9F84C272A81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use freshly defined helper instead of hardcoding the checks in the
driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index e2ec1ee590e7..565e671ee402 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -172,8 +172,7 @@ static void msm_mdss_4x_setup_ubwc(struct msm_mdss *msm_mdss)
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
-	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
+	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
@@ -190,8 +189,7 @@ static void msm_mdss_5x_setup_ubwc(struct msm_mdss *msm_mdss)
 	if (data->ubwc_enc_version == UBWC_3_0)
 		value |= MDSS_UBWC_STATIC_UBWC_AMSBC;
 
-	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
+	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
@@ -209,8 +207,7 @@ static void msm_mdss_6x_setup_ubwc(struct msm_mdss *msm_mdss)
 	if (data->macrotile_mode)
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
-	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
+	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 

-- 
2.47.3


