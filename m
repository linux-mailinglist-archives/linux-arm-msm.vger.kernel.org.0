Return-Path: <linux-arm-msm+bounces-107972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABDvMuiSB2pV9QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 23:40:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7265584F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 23:40:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1F205300C024
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 21:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D2D73EDABD;
	Fri, 15 May 2026 21:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hsQmukuO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wv1ZsMLt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D481B3EDE53
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 21:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778881215; cv=none; b=EQ1NbREPdWpFPWcV8kW9UI+kdGQE83VIENymAKdY42E35bzt7zAlbDbsKwCCwuXATx74uPhFNRpM/w60OPkdDnhnfGqq5I4W7e49tYVkgwJlodw5jxf3MR8B/HXm8eLaE4Q6eWZ2s3nNUDvZZQCDk8ljOMifoIJUCj+k1M7WOfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778881215; c=relaxed/simple;
	bh=mSBe1ewrkuZ1aPgknwAsTonJHEuKfOujavbWoGjO4AA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sfB+Et27gRYbfwkzWlOlBCz6x0FCLA4KzywTkMF7xUYxpu4Jz7qLGPJHGtDrX4dVRy3QAt0yQ6s1PrY1+dHCkKJ/Q0AXyP+4V9BaLQt0Z1wimo0BJfHC5vlS4mz3FP2VnsX8G94hO6XrHguB25BxDSlOmrQWdvsvTLZb6wLUcPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hsQmukuO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wv1ZsMLt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FJeZRH2837697
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 21:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OKkbaykvbXdsB+BNrhh2by
	OrHmUZCxNVjNiczxF+Bwo=; b=hsQmukuObI+/wlN6uVU3a0v0kPWf6HeehB0N/+
	XiLxLxa9ZBq2cnVU6tv00SLfSOIIlgP4G508fRVjy6RzPfcCC/0XAcb6nU9hW6r3
	2U34d7cwnkZXpKHlKoQrow3vEUfdL0Xo8J6dYNEOffAmMk4w24vjXJGh3TOom70m
	7gZyU8dIHGxEAftlm6DaIoKHPybfZV068i4BJtYRJmoHALrANf7fSWnd7rFEGB+M
	Fb2DnHFMqxz+E/TrICL+gjB7IyKIHla6QBfTpwU/dVM57ZjoU0/84ROb5HbqMVch
	sVrZ0GYBdmDV1sy8MG4lO0Kk4bEGG4eVusTICWlkQTW6g9WQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e694n0exk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 21:40:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d6bf346adso9218411cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 14:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778881212; x=1779486012; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OKkbaykvbXdsB+BNrhh2byOrHmUZCxNVjNiczxF+Bwo=;
        b=Wv1ZsMLtCsP+du2zrhDEwAr6h9aNl+FouKZX3i9TCwUVj67anotY5DDia/Dcy3Esmy
         NhKc7JxnMDOqa6rFeR5wj47oJMtctM8LVOC3C1JEXd+wv5a4UcWK+BkpXF2ZjhnQbm3/
         XL8q0ofjyK82d4uhf29TjvmTmDC1poXiwDTaayYgtpYHfIhzXVRy2NrCB4SJJeK726BS
         l68GXluySANfs0yGL8S5/GUQlrDEedx+Slqo54fo5AP4hjZYJi+HXmSptMhxwTnT3aVr
         lvugCVHWwx3poLFeRv4TN9dG4k/Ix3dOk8NPxdUfZTaH67mdy+EIhaODzrjBBy13C+ED
         4osA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778881212; x=1779486012;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKkbaykvbXdsB+BNrhh2byOrHmUZCxNVjNiczxF+Bwo=;
        b=BiMYqoCO2WnI8eoNDVR3NiAnue50GfQ0p+N7HF7ylmiTFNedBcrChC0eViMKnEimvu
         zVwSVVt/hv/XcHbwSAvCIb/TFlLkIIOCMQtxQV7H7wWcKojCqtig0z63i+0WG46WWb+D
         WBQyRmoVGikTHoCEHAAQG6D6XKNxbrSSrJ3Hkvxln0bhtjZevcV4DbF5OIc7ErQnE7BT
         BM+GkKEhpXHjonsSvNpbHyr3kLKFBm+1UlvEyhrInaVMK7TxoX2q0pDi7lZPYZe7n+xI
         0T9kTrLqVt5FcL5S2OuPl4glGP64hy4SrnH/rDz1WeSEXrLC8oDht/0/mDyQTW/114Mg
         fO5Q==
X-Gm-Message-State: AOJu0YxdKgkV6CRyD9JQ/qsrqq63UKR1Koz06kbJi0LYdVvEqaiIxpnu
	se9eg1A8D/0/PGPI08xAUgv9psbq0poeJ9dmJFjEfXOy530z2QqVex2UEER0Px3mPdYbwbt/A9C
	Zzom80JPYEY7AUP+oBYKumawmwn0D/9B2QLOfGURWRSlEcH5o2OiCs9zJuPq5kWqqiBcrYqcqYV
	0f
X-Gm-Gg: Acq92OEkvUJSkh9WjhPhebumrcLjtVZId2qDpJT0IaEo2Vv3weq0s2PqNE/H//yWM5N
	tjJuzO+fjWjCPyJjgzvdl8BgJ1KDBqDmt8gXh20FSc4BK+ZvXDZftDTpVA1DqhXekGXirGhSCV1
	+CQYH4cDeQEJJtaP+MbbJ0Y4vYRYFgKa4NFj0YFZJDrHVlIODmk1Db+QZArk2u86U8wW1kR29vK
	RXUleU7cvWJKz70zrqLVb4NglStXCi3X7gAoZ3q4Ob0GARfAVIEtG5mZMvtvNa/QX118Hs8QOZO
	l0aEKVhhh6iZNuR45OQAOoZcVGyQ9daM7IEm6OlgsCm4v4MGaMSzXPIBpvf1ZxBL/MnOPExTVb/
	+Nf2AsuLUCJBy+Jh9VlocsRdm2Fw1fPZ7yNhyO4xiAEunnDY1kjX/M8MX6CfCqErwkp653XGAI7
	iIDtGCYPqwR+wVAXdrwkGe2fWiiXMgn13DigU=
X-Received: by 2002:a05:622a:9012:b0:50e:a1ab:114c with SMTP id d75a77b69052e-5165a1eb7e4mr72271581cf.32.1778881211931;
        Fri, 15 May 2026 14:40:11 -0700 (PDT)
X-Received: by 2002:a05:622a:9012:b0:50e:a1ab:114c with SMTP id d75a77b69052e-5165a1eb7e4mr72271161cf.32.1778881211521;
        Fri, 15 May 2026 14:40:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945c8859e6sm18274001fa.9.2026.05.15.14.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 14:40:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 May 2026 00:40:10 +0300
Subject: [PATCH] drm/msm/snapshot: fix dumping of the unaligned regions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-msm-fix-dsi-dump-2-v1-1-43928094d25b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALmSB2oC/yXMQQqEMAyF4atI1gbaql14lcFFbaNGqCONDgPi3
 a26/OC9/wChxCTQFgck+rHwd8nQZQF+cstIyCEbjDJWNbrBKBEH/mMQxrDHFQ3a2lW911YFZyE
 f10R58UQ/3WvZ+5n8dpfgPC8nE9lHdgAAAA==
X-Change-ID: 20260515-msm-fix-dsi-dump-2-64a3bc160da6
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Salendarsingh Gaud <sgaud@qti.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3707;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mSBe1ewrkuZ1aPgknwAsTonJHEuKfOujavbWoGjO4AA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxb7pF2XTjo6pqZVHWkLLztrePa3jpZ6/Avh1/MCDN8cD
 1vmFXGjk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATmXif/X/QhPsXWA43bncL
 WT3hTeCtl4wKEe8mKmpKxU5yLkjftyzh9PYNwhcO8NWUtjJ2G1zsLiifJn9SJMwoMHSlXFzwW4E
 fvqUrwmp155s/EI9bsKOkX4G1htdkh/uXSRMS/Thvl1yV8tZfLLn8pffb99c2RE3UmP37Qchl0a
 yjE3ZJKD3o3r64u/7WMn2lX6fcXH5sf7Qzi+UR7xmpYEvLspNBqaWb828KWBoXxHSlLG2U8VHZ8
 dhQxPRXiv7DfKPPF7IYni/l9lZmPm/2UiP9rskR8cbJgR9Tl2r7poRrKU5IWGZluNv7gJrB8whf
 U9UTevqmDA/Z17flOvfv3+EbcK16Y7HOXG4DqWjZn0+9AQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Ba3oFLt2 c=1 sm=1 tr=0 ts=6a0792bc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ohjMCsGq1aJjNZ5JAMoA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDIxNiBTYWx0ZWRfX14rCaf8dG9Qm
 iLLFuHtTz3r+2h2wmwE/vrMqNoF53xNQZm0dfqQxtmJymqU7HvviPb+IllxhtrmPAzpQw96ksa3
 lrSAO3HTcCv8GfkTAjgHgjMFuDwv8+bhIxqSL1DYotPk7OU/4ZTZt9JHefUMkIS3Evnu6OmbZMJ
 2/GOek1lRcDgPbslFhIbEg2SPKBCqE73xf/+TM2JxTt4dnaL2F1WxumTRvH/M3hd6KYzv/jO+ph
 ek4NnCTXsIX81t1AlFugilfJHb0MQ8y7HK/DQeL5pc2G+c65MobOStOlA1Tk6ZgfQeGUInvyHys
 kzYpFY0rCPnshAqkdgPf/o3BFd9AF2BiTVkb8gP4yr9+eCFG2StbtS0kYAoE3/i50hv3BIY4/H5
 UZvX4w1TdZOtaN491MZqhYLwKN14r3aBpMHhg78Sv5k/O2rErV1lPHFIrqpZcKM8kRpha/Ib8zF
 bgbgkSzcR4isuTdkOBQ==
X-Proofpoint-ORIG-GUID: BGmgyRbpe2Og0GUFFLQ4iRtZV-hah6yo
X-Proofpoint-GUID: BGmgyRbpe2Og0GUFFLQ4iRtZV-hah6yo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_05,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150216
X-Rspamd-Queue-Id: 8C7265584F6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107972-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
X-Rspamd-Action: no action

The snapshotting code internally aligns data segment to 16 bytes. This
works fine for DPU code (where most of the regions are aligned), but
fails for snapshotting of the DSI data (because DSI data region is
shifted by 4 bytes). Fix the code by removing length alignment and by
accurately printing last registers in the region. While reworking the
code also fix the 16x memory overallocation in
msm_disp_state_dump_regs().

Fixes: 98659487b845 ("drm/msm: add support to take dpu snapshot")
Reported-by: Salendarsingh Gaud <sgaud@qti.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 27 ++++++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index 5e151952dea8..a86c7fc46f68 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -9,7 +9,7 @@
 
 #include "msm_disp_snapshot.h"
 
-static void msm_disp_state_dump_regs(u32 **reg, u32 aligned_len, void __iomem *base_addr)
+static void msm_disp_state_dump_regs(u32 **reg, u32 len, void __iomem *base_addr)
 {
 	u32 len_padded;
 	u32 num_rows;
@@ -19,11 +19,11 @@ static void msm_disp_state_dump_regs(u32 **reg, u32 aligned_len, void __iomem *b
 	void __iomem *end_addr;
 	int i;
 
-	len_padded = aligned_len * REG_DUMP_ALIGN;
-	num_rows = aligned_len / REG_DUMP_ALIGN;
+	len_padded = round_up(len, REG_DUMP_ALIGN);
+	num_rows = DIV_ROUND_UP(len, REG_DUMP_ALIGN);
 
 	addr = base_addr;
-	end_addr = base_addr + aligned_len;
+	end_addr = base_addr + len;
 
 	*reg = kvzalloc(len_padded, GFP_KERNEL);
 	if (!*reg)
@@ -48,8 +48,8 @@ static void msm_disp_state_dump_regs(u32 **reg, u32 aligned_len, void __iomem *b
 static void msm_disp_state_print_regs(const u32 *dump_addr, u32 len,
 		void __iomem *base_addr, struct drm_printer *p)
 {
+	void __iomem *addr, *end_addr;
 	int i;
-	void __iomem *addr;
 	u32 num_rows;
 
 	if (!dump_addr) {
@@ -58,6 +58,7 @@ static void msm_disp_state_print_regs(const u32 *dump_addr, u32 len,
 	}
 
 	addr = base_addr;
+	end_addr = base_addr + len;
 	num_rows = len / REG_DUMP_ALIGN;
 
 	for (i = 0; i < num_rows; i++) {
@@ -67,6 +68,17 @@ static void msm_disp_state_print_regs(const u32 *dump_addr, u32 len,
 				dump_addr[i * 4 + 2], dump_addr[i * 4 + 3]);
 		addr += REG_DUMP_ALIGN;
 	}
+
+	if (addr != end_addr) {
+		drm_printf(p, "0x%lx : %08x",
+			   (unsigned long)(addr - base_addr),
+			   dump_addr[i * 4]);
+		if (addr + 0x4 < end_addr)
+			drm_printf(p, " %08x", dump_addr[i * 4 + 1]);
+		if (addr + 0x8 < end_addr)
+			drm_printf(p, " %08x", dump_addr[i * 4 + 2]);
+		drm_printf(p, "\n");
+	}
 }
 
 void msm_disp_state_print(struct msm_disp_state *state, struct drm_printer *p)
@@ -172,6 +184,9 @@ void msm_disp_snapshot_add_block(struct msm_disp_state *disp_state, u32 len,
 	struct va_format vaf;
 	va_list va;
 
+	if (strcmp(fmt, "dsi%d_ctrl"))
+		return;
+
 	new_blk = kzalloc_obj(struct msm_disp_state_block);
 	if (!new_blk)
 		return;
@@ -185,7 +200,7 @@ void msm_disp_snapshot_add_block(struct msm_disp_state *disp_state, u32 len,
 	va_end(va);
 
 	INIT_LIST_HEAD(&new_blk->node);
-	new_blk->size = ALIGN(len, REG_DUMP_ALIGN);
+	new_blk->size = len;
 	new_blk->base_addr = base_addr;
 
 	msm_disp_state_dump_regs(&new_blk->state, new_blk->size, base_addr);

---
base-commit: 11ff30385c8ad7de9862f4f1cec424fca15a4f13
change-id: 20260515-msm-fix-dsi-dump-2-64a3bc160da6

Best regards,
--  
With best wishes
Dmitry


