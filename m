Return-Path: <linux-arm-msm+bounces-97231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GF2HDaLAsmmvPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:33:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A54CF272A91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:33:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 232593028358
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C68343CAE73;
	Thu, 12 Mar 2026 13:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U3xsOWpx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fWFqRmMM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3913CA4AF
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322193; cv=none; b=oXxa3JmEM9DBS5JJlIgR71RypPtCr82mbOX1zwcgtoi3GI/sREnUZ5IzcUo7guhS17LTqMD44bpeImFmFn/PF0hKAEG8TaAZU2mDN4v2XutJ2nBQKqg2iLvRJPf6c1c3j2co0kbyqP5SlB523V36QNrNnr7AmAkPywwmNt/EVMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322193; c=relaxed/simple;
	bh=fgMYnVyPuAQnxDWOJRtoRoZ5nPUFMHGHRdMlLxdeUlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IuYcl6dKS2JXBzRqWWuFp7dYAuDe09RjkF6xGCEFIhOuc/CDVmiJI4tAmofvto/UTPVqsmsiTy6Ql9RKCzNsa0T3aU0+p1zKC0M7MjyTGuoxg/TeOf1MmDRtKphuOHGHT15d7aW9mN0wPXnjyyUxjx+D0hEetmCaL0bYsEj8oGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U3xsOWpx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fWFqRmMM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CAK2Yp264731
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c9EFvSk5+mUnrmi/1uJHFkMUvy6FeW+DFTari/Y3gp0=; b=U3xsOWpxjwoNJe0R
	SeMn8NPzXjf4TS1vUSDqNI3TJ1mWYqnB64o91CV92bL6r8gIqyuiOUlGVvt9luFf
	ZxoH6NSRWeXgQiGLa4p0+49httBQlXHY0FBGVtRYAPG9iIz0ERYAeI7mQirG+/5d
	UwTzs86IElL5BiTTp9fM6mM0MBslmwTm3af8hzdPfpRYtgyz9yT/78J+fl4kiuD4
	9wC3w1UzFGC3V6+YCTSdM+Kb8yCHHFD+RLEFXk60mETParEw6ha/vCMaoHB0q+QM
	Cx1IxMP29PALvRmvTqs2REtTUE42aL9B/8649BBcaQ3bXoyXlN7YTz15Q/Tw2+w6
	lp3GEQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4yj657-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd76ff19d5so587238985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773322191; x=1773926991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c9EFvSk5+mUnrmi/1uJHFkMUvy6FeW+DFTari/Y3gp0=;
        b=fWFqRmMMYBrx2FvMS1bYUHPI8Z14pkJhwM1cxLGdNUH4hB5vOOqXoaETD9/gysNUbJ
         /YwnBWypv+sumofLwfTnC1nYSN1DFJEe/EjDec0O1VgoucQI3bSXWJkgYqrvvyve5hdA
         b9OE1USwh2ZfOTAFccUc50J7MaQH/bq/INEI6fTTdYNyQaMHn99OfW/UmdS7iZjJ9/+S
         qIugOP/E4RL7rdS8hA2a3z0u9/+Sjg9UQrbHq2p68a0QXBnqauGkNFeJS94BU8qNCx2V
         UXy5iJPhOIAnpjZ+U/7WKgPfC+KCzTk0CF8SBGpYF03hfKYEMfbEA9TL5iVPmRbAf2cp
         OnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322191; x=1773926991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c9EFvSk5+mUnrmi/1uJHFkMUvy6FeW+DFTari/Y3gp0=;
        b=IHfXxAhxoKJ/V6Hb8PMKCqB/31T+RnzQSjHuCSM0JaPnw+m7LNlz33hHyiu6DskFne
         cJtLTJiHvTnksiwO1wGfa98O8unoWVoClfLz1BFvEyKyxf2YVqa8AxnPULtOlBjPkUtp
         mjfkdW5TCZIxfFSz/Eci4PSEz9DdwzsX6VjQLd7U+Ht6Exa2vTbI5rCJc8Ktf3fCtJfe
         8C+5F5I0n11PnkzbgNnC4s8pVOae9hCIgMptEuFZiHMwXJtCnvzjIulynDwBeW3oZibq
         SW/kcCvgcjQ7A0dOIGwtLItAmG5pwaxegAnPwXIOyajYnf06D2FPpeyihX2SWCbzxGXy
         aO1w==
X-Gm-Message-State: AOJu0YwcWPdkc3+qQKI9WStwuQSTwZw3EX7ra/ymL4gA/xMFFyjaGrQ4
	RZtBD4MZK22fVi0WZGFjsGxVwf33zNbznOHtlo4IdlWv6UhxmLx4Vn2LYoDpEqpKfJjwVHfx8Kw
	RxXbIjBw//nyheYvW93HXwhwx7IlWu6ZiZXthVSKaCf0L9LklNzQGkzi9haGLJXgjnpuA
X-Gm-Gg: ATEYQzx/B/KYQFBvYDcG7cdkR01d5zg/yNLUfmV8DVXjBcvJFEG47PeDSVYz6Im+Ja/
	L0jz9ZSaMLzJNg8pSG2GAzsCGNzOSHWhGDdAX0yfy+a7a/DhCGbiVDL0Jj0vZMeSjMMUslCYR2M
	+ZqcjuzLW07uy7nqIgANy2C+Wk8wlJQV04g7olMa4Pax5SxlSpPozm0AdHgdkZLKGtKDYoq9N5y
	IpcOGEf3Kuz9qv+dkqvwuCsqrttqxGgfY0UWtvDAcfq72K/6xVbfUv0FM8kUikfYJIJdd6Y4dve
	ejddIr0XnhoAVfQoJJ31e32MsQXtrUGnYYyDtzNwPqML51uQHmmlR9agjmw4Ix39CR4iYnUUZEx
	BJbs3Xt6IxRXbk5khMqTo7tp4/lR43yPBoDZVTOtzBNMpJ4beAxPcRtXcirIwMplPUUMHXH1mDE
	FaEiNn4mGcT4ZKa36g8lwmtNg004VNyOSJ3HA=
X-Received: by 2002:a05:620a:44c7:b0:8cd:7cea:aea9 with SMTP id af79cd13be357-8cda1abaf1fmr789339285a.64.1773322190933;
        Thu, 12 Mar 2026 06:29:50 -0700 (PDT)
X-Received: by 2002:a05:620a:44c7:b0:8cd:7cea:aea9 with SMTP id af79cd13be357-8cda1abaf1fmr789335285a.64.1773322190380;
        Thu, 12 Mar 2026 06:29:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm8646671fa.9.2026.03.12.06.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:29:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 15:29:32 +0200
Subject: [PATCH v3 11/27] drm/msm/mdss: use new helper to set
 macrotile_mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-ubwc-rework-v3-11-b7e8f800176a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1276;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fgMYnVyPuAQnxDWOJRtoRoZ5nPUFMHGHRdMlLxdeUlg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsr+2PHXln+GxAhv4rZpGkmVzg4UbcjjY2I5wr
 hNB/RdxueqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabK/tgAKCRCLPIo+Aiko
 1Y65B/9B78W61F+4C5Mxta78QZuIxh4tslI5LhCH3hMdR5ojQfZSsmB8XkU+uH+lqb3vFGXExF6
 vwASD1dRDCEHvkIh8mXTAVKilXxxgsqU7a/nMAnC3evodzdJ4vMpKEmTYnwMVWlLA49a+TLhrW9
 dmhbt3KwHePGX3EWRcuz0/qoY90idgtAMjQKwgFrvX6A2ezJBRbYARgaqW3DEN8ws3xSbYEpDnK
 VJB8iwpi0nHfoqBBqplAOrjJZrxQ1G9a0u4HJCtPOAqcCXBKZA53uvDGx83IfupeMyGSsCRKW6E
 CGLVFhUU6RPUCp05sbUgSJZtkFw3MCG1mOmXE3tupMju2XrO
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNyBTYWx0ZWRfXzLCXeP3TGpMD
 22tV7/pbqHm0snQeYpsTKZbZc2D6zoPLyPeCyvF3nf20NCksUGbISGFPMY5BTy3LnBv1Id59Tvf
 YHUZcC0Qc/EhCnwiBxnCDXGteWrTyumF40XxVwMGea+DO93uNOshy25eO4YsGZDjvbHouASmEX+
 RByBvoFuRPiF7pBR8No4dSCvfvxVJkY3I6qabLxUefxCkDYWzhlXzsNUDXFkFJnbuopZCCXOWz1
 qjeKIwDaqIdfaSs5QGIalOU6yy5ey8k4ZivARQSRl0pbkfXDVMndDB5sEdkTjKPobQPOTjxlJ6X
 84rBHIpMDOApd5q18/9DnJ6EMpfV2fJwIal2uoaL8n2arSs9dIUmFrsBK7LV5GHUDRnLy0P47cW
 OJgJzZEGD6ASK213LdF9y+jExYOzMBTOHuWzCqnImoVXRrndKOk9DVoABOLPGO/l1hPIxiQOTbd
 0I5BirCWQTaiLNFljBA==
X-Proofpoint-ORIG-GUID: CqnMxLq_-MjkJlcbdjCrV8BmEx_UhGtj
X-Authority-Analysis: v=2.4 cv=C+7kCAP+ c=1 sm=1 tr=0 ts=69b2bfcf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ujCctoy6CNRHcyqwK_8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: CqnMxLq_-MjkJlcbdjCrV8BmEx_UhGtj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
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
	TAGGED_FROM(0.00)[bounces-97231-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: A54CF272A91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use freshly defined helper instead of using the raw value from the
database.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 565e671ee402..453be86c3420 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -183,7 +183,7 @@ static void msm_mdss_5x_setup_ubwc(struct msm_mdss *msm_mdss)
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
-	if (data->macrotile_mode)
+	if (qcom_ubwc_macrotile_mode(data))
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
 	if (data->ubwc_enc_version == UBWC_3_0)
@@ -204,7 +204,7 @@ static void msm_mdss_6x_setup_ubwc(struct msm_mdss *msm_mdss)
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
 
-	if (data->macrotile_mode)
+	if (qcom_ubwc_macrotile_mode(data))
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
 	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));

-- 
2.47.3


