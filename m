Return-Path: <linux-arm-msm+bounces-96841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qL5vH43hsGkuoAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:29:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D080E25B994
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:29:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4521F30C0FC7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB09E373BEC;
	Wed, 11 Mar 2026 03:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OGt+OAA+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQRg+cVh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633C7363095
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773199439; cv=none; b=Fl51AkU2CFkOReut5Rf4vXWzSqYMRxBdc3DSzk1pixgprF8A69gAiBJIE88HV6hT2EbhsOq2WmAuw1sIJb2VVutGYvUDE0zNzz2peqcg/YE/5CSYFhc9PHqcBqw3ECZje3CDpahGuOWmQNtOsOEkU0ZocB9PmotLaCc7XJRQC/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773199439; c=relaxed/simple;
	bh=hheiMl8VJ8rTRpyUKrTSw/T/7nX7ElA8etZcspaY4GU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YPkffFzcRFkLxiVZUFPYcrDeFEhiw616AER2aZ8tFwNzm8uH5O7NFXKP76A/NRQDR9rpuFBvG1r9ki/TziKA616pAOrinxifc1jZsGJcmQ1nXyym+Lq9pAdRupDn5IE7prD7xECn9N9JkNLNpEDIptJayctfdy7osir1vkZUcDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OGt+OAA+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQRg+cVh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B2ADGH1573154
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h4ycaMV7nlSUQ5du4YcIwqCqGJ98D+lbtRqht+ED2K0=; b=OGt+OAA+AGTk+EKV
	GI0IuGn7jdbhfL5NeLBjnpVDWqUyUPaZ8WcsPvhFQzNndY9IcvjDp1YOt74+V3RT
	LMuEKizgzMTCmErIN8297nEHbx3dL4Zaq94PQunvGWtmhCqfco8ThFciCf830qmS
	XMIdYUadDJZfObSilubYRVZEhfrbtMHpl6SNmaDNl8hfDMB4GTdP5Odc2QDxol9A
	XtYEGhcytGlDvALk9j2KjodrwXgB556P8XW2n9edEKjERx7aOc/w28ANWfHEa796
	vi79IlgAhXsZPKfaQtHAXZv0VfbyFJtYtUXjPinpCT9l/0MZDhNvR2KHxyYo3DnA
	Hwqb/Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqgk9rb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:57 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94e99ef0150so5048124241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773199437; x=1773804237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h4ycaMV7nlSUQ5du4YcIwqCqGJ98D+lbtRqht+ED2K0=;
        b=GQRg+cVha/ynVEAcqCxFx0HmuSwSwv6b6JEWVB+OfQrcR4IiM71NAWvBHLxbk4043l
         z8ukYnQg/jQxIs6Hz9+sGykQZKAHMhbY+cPNVbQ+sUOe29FM0J79F/McQSBVDRogvqCQ
         EQ+b/fHK2LfN6u2WzTbJhMnh0X7P/z8yQuRI9eIBvDZRpjdCXArGMydmi5CysbbRSq7I
         q8DjhytdUXFtqTyK04ra+ZsYbqhkL+iD8FUaLZHvYgtqDXujtYsVLbHlmxEByUV06JKU
         aInrdc9iBCLykKgm/RFAz6tKhm1iz9z/IJUEaYEZmgnSqCj3VxtGuRwTJMdrJQZDN/1y
         Z4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773199437; x=1773804237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h4ycaMV7nlSUQ5du4YcIwqCqGJ98D+lbtRqht+ED2K0=;
        b=lKuY+RMEIrUfbk20eJlRgLWzM4hZrci9fySiICkk+iBsKAjq1bnkMZFn3eHMgfWi+N
         dL8m6T6O6TJGDzhVglatHTHnrWXwtYniyqdTQOE+OBhy9pKgvbOCmVzvq485v7a7e+hs
         LIFbDoGcvzh4Gj0mkP9317M+77PSWSbo+3L6d8r98MU2/TZrahOxm0uia85OigDtOO6w
         0zao0ZBdP7yixwfhAZb91e+tL9Tj++9Pjl4TPTCxxirVcHzvzBaiNTJNO/SJ3EFVJRuz
         WuPvRyyxY7/leFZiqkEJkNLrC+3mFJD1QaFZLKjcmgKZHAkl5Pti4eghR/nYnSjHIoyF
         PJfQ==
X-Gm-Message-State: AOJu0YwuNFSXJ3mWJCq1z9ChBphnWzGwj2ICCucMyoE7rFLakAE9MQ3X
	C9Fu22NVggjHDlOklPpi7AjPYLaO6sy8TIQO5dmZz4krF5ZdboDTveqs76TO/trvAjXHfMm7knL
	tKMH6TmFGIJKukDXxdsyGXxieSvkKpnzvxJT/adru6L1ONJxsF1J55sx4u+KbaMslW5fH
X-Gm-Gg: ATEYQzwsRYF4iwnd4DZQem2gqsMXvrAxOdb8UCxCorW9Q7AhvqmwFtqqgCNkBNXFfsk
	kVDFo2q8Q5vjGfw4wD81sUM5y2nvy8Poe2VjWamtKnQ3EmspFza/9XVySzmuCxpbFCNLJp6Uefb
	FJYaLff2SJCzF6NbfV4eS+rJ376wMRa9LwKlXmOQMDDZZ5VnZijy+wytqwZXIFu9XiN8MOYA0B7
	1UeS4/SjMHuJR2Sfizx9eHr9Yuu8Qsfnn8+oZbQ5wvahXHXYXq8JGM6w9KKGEdtoGyzDnQOt1Xn
	g1FHdwdO2TmGfz46uvTMGKFsVFmOPN/pCbq+T6hkrhm0OAj5llDYd5QrWS7dBrx96l31YHZZTo4
	UjCOikIQ/VMOKlHnqNaeHOWYPJas6kOQae0HlyMji0i0ICmLaunNWGFKL8b6QdGusKK2XTf6r9R
	ChT2X3zFEbvGSSEBAFStTE6shEEbDUC36tG8s=
X-Received: by 2002:a05:6102:512b:b0:5ff:22f5:e37e with SMTP id ada2fe7eead31-601deb4d089mr414184137.10.1773199436817;
        Tue, 10 Mar 2026 20:23:56 -0700 (PDT)
X-Received: by 2002:a05:6102:512b:b0:5ff:22f5:e37e with SMTP id ada2fe7eead31-601deb4d089mr414172137.10.1773199436417;
        Tue, 10 Mar 2026 20:23:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed41sm1422721fa.25.2026.03.10.20.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:23:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 05:23:09 +0200
Subject: [PATCH v2 15/25] drm/msm/dpu: drop ubwc_dec_version
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ubwc-rework-v2-15-69f718f2a1c9@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1070;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hheiMl8VJ8rTRpyUKrTSw/T/7nX7ElA8etZcspaY4GU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsOAf6Zw99zPfcAxdo0QZI7EPBM1yeKycqZW6F
 GRQ7TppzGaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabDgHwAKCRCLPIo+Aiko
 1aTSCACXi8i9dYm12XNBHO6u0UAwCu7XTpH0EPFyGKnFKKB8x9QjnH8zwayGCWiViXeFYgiR5mH
 gZRkHpsstV5HwYvFVs43M4DJRrzZct+aDZcqgNU5QKrN4IuYm8NbpcVlcSRp+Gu5555/GwxGcq+
 TTVxxyKqyZ03hZShpcRz59o7GCAlkzieHrqht1ra7/8VDUGXP0ZaC/BZNyl+A8uSd+U49zbVZZO
 g8FEqyWXnPOqaZCcS520e7KNP8IaRjLjKkzgmWX+xDvBf/ARCHL7LYR5fv1qxpPtjsW7bQ7a9VS
 DXPan3AOjWZLkqs8AQigUCMw3zP3eqYQC08pVYyCp2o00qmd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: _5FDy1YqIPPnrp3lvwbSIIZ-nhAUPYRW
X-Proofpoint-ORIG-GUID: _5FDy1YqIPPnrp3lvwbSIIZ-nhAUPYRW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyNiBTYWx0ZWRfXwVfz2Jn6xYWO
 Kp4qzqfjovcDkNRRAhjKXgJW/0UG/io5ImjuW5iW3PhUhztvplISV9p890dbxhyaO9qMBc4e1Ep
 5Th/X1ntb/i2Sv8UPDvc+L52kzLjmGt5Ee3fIwzGvhIVgmg/5wdWH2bBAqtshlWCnZGZ0HHSwZS
 45qRTGpa5bG+gkLsT+99AyIJ7PzO+T3QoeyNqkxiFGNG/FNNJsUtgEo6s/fxBH5dHmBb8csoRD5
 GQExVnbEzXaBIn1u6h1o/MWL1HIS+Ao+X1NEPMNC750sQVdzabTh06f7fK+8scsQakbPEDSzcBH
 RALm2/CNt0PwLDfS1Cbcea1Xg7B+7YUqx33fIjDJp3Qs6/rydIJTR+dGfhTYs1rcvkPjzi7s2gf
 VhiJp76z4uWoa0kcnCewKuevyS2e60BPO7H5YP0YCiHlWDPgZV0BuUax9G5YASycVS4fIvZ2wqU
 kxvjuAnQH9pb7qiVrfQ==
X-Authority-Analysis: v=2.4 cv=M4JA6iws c=1 sm=1 tr=0 ts=69b0e04d cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=OFVxzADIxEWc22agC70A:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110026
X-Rspamd-Queue-Id: D080E25B994
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96841-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
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

Stop using ubwc_dec_version (the version of the UBWC block in the
display subsystem) for detecting the enablement of the UBWC. Use only
ubwc_enc_version, the version of the UBWC which we are setting up for.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 547d084f2944..f424be5ad82b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1718,8 +1718,7 @@ static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
 		uint32_t format, uint64_t modifier)
 {
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
-	bool has_no_ubwc = (dpu_kms->mdss->ubwc_enc_version == 0) &&
-			   (dpu_kms->mdss->ubwc_dec_version == 0);
+	bool has_no_ubwc = (dpu_kms->mdss->ubwc_enc_version == 0);
 
 	if (modifier == DRM_FORMAT_MOD_LINEAR)
 		return true;

-- 
2.47.3


