Return-Path: <linux-arm-msm+bounces-97240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKTHK2rBsmmvPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:36:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 731C1272B51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:36:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 92343307F00E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88373C73DE;
	Thu, 12 Mar 2026 13:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blOgwmYA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fznvz0Jm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF063C8729
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322208; cv=none; b=oFR0WjSik5weEEOpCIloqRGINvqRYkqzKSLzwQMSvCzg11iMapvGdUrxokdXQobugbxGc+CTc/fHyF4Bw9DmWYJl4EPSzo3PAtxoVfg4owXX0UPHx/8CtweZP2VTh5iBdbiJpK2sYW7lbpsUlRue1LDT0XDzxqdAxFsSE4hYNe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322208; c=relaxed/simple;
	bh=ffK+O6D6vNEMnJEMM/tky7u/BwlqJOyoW6OX7dYRjJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uq/yq7/rV+0nIQ53VB+xBMGou3dBqW3AQaMvmnhm2iF9Z8WIyZk8A5jHZhzPoQshz23wcy8HS7vMeIdsD4lcTzp6QkXBAw0yjEatJQVrNx3vHCFPMRWI4jE50pT9EnjtVhchIE7dHC3uU4gnR7wnAJHvgQ2I1Uy6MOhHbAappyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blOgwmYA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fznvz0Jm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9xJYP1756065
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KHDCJ96vbTYJbdrHJg2LGldtamq3JQy7Ivw7gaZRqFM=; b=blOgwmYA/0t1q2nQ
	z+h2EgQzs+vBdjDboYhPCf+8YDTdI/KcXMYUihgS3uFBHjzpl36Es6j57fVZsZe9
	cCTgj0kW4KBNcMHIvHGaqSfA6cgj+aktV8nTUvQZ8RsBNMpGEX21t7EuCRCJqyUd
	UoCwYCgjbiPyFHFvhwbAnf8ZUoxYIf/bYlkDrti89CFwd8v9gVJRymcx5dbiIu9y
	c3AYmmRN6A/4ushuw1e8SxpcfxFGdsrFPEozSod7lQc4YJxXEeWWVhPt/ZmZ+Jgu
	FjmTwioNol93LBgTZQp1fDZM0yMyM3gr4Vy2bAnYY6i0Kf7A3w9zu0TieDPYwNLW
	a6bwqg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh53j6vu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:30:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd80c4965aso706747385a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773322206; x=1773927006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KHDCJ96vbTYJbdrHJg2LGldtamq3JQy7Ivw7gaZRqFM=;
        b=Fznvz0JmX8aGKsNDQD/j5vcKIZ9vWSb5X09+FijQzGkCKmn/9Ovgmz3i1LdgLsun6z
         eUaSM5WNjisiWwivDpY/jhRRYBd619XG3JywWT7OWSAsqyyyupPRAgIdi+mFReqQy+wQ
         jVRZXRg3guQHJ5XkaQPFJjI7I05c2rfm+AX4k33fSLzDkrDl8hRaNvNya8LVxg2XKDYW
         z8GPGp9tY2V6opBNcSQIet1DGADVgvDd3y4TZRg2NJXQx6BLiPAIV5wooz4paGH3Tffh
         DHAeY/OuUXO0SoHNwRh1n4OIFtxIalTbLf8m/eYjtlILc7QrThoTrbL8T+lLb9nEsf12
         SHsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322206; x=1773927006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KHDCJ96vbTYJbdrHJg2LGldtamq3JQy7Ivw7gaZRqFM=;
        b=Q2L5b85dZ/1qqG/zJp6ALkkOYcF1JKAPX0UFacGnRzAZHhB+IeTWXIfaFo7J4mO2qw
         RZu96W09ikMYeF3GVhJFShn+Og08BDbgNaQ+HyFR5/397QlXJ0ps4vrdkd9sOsA31zu/
         cHv07X1f/MIjDPtE20S8cygxCI36IRP/mXhmXlRCNPvRhwN0r2nyO8/mJ0LcmfKVhqZY
         ITQ0qqAnqSW5QAjEqyCBcrf1qEIwmwHOOayu03piz02tQXNiJLybUkwY2gcLRqP6hbgG
         Ld4iripxadCmmQjd+ezxqURKaeAdmcWsbgIGttn09gZhM6+jir8u0kfrsQ7mh2ooaGTI
         ufQQ==
X-Gm-Message-State: AOJu0Yw+EtMk2y9EgO8m84ZbG6m5a9IGRq4Silwm5dv9lhf6ho4V4a8Z
	WiGfYsZ07/+hmvk2oFFCrqI1t7e3k9Ow3yBlF6EEm8R4AL2n+uPfX1ynRzuUS/RwVT0ulI86uDc
	iAHEDI6vLBsqi7OWvfCxQ0QvNIVEW9Y1yWbySp4zy9wNgmem9fveC7vk88u2/ALKPaN+m
X-Gm-Gg: ATEYQzxR/mu5asxs9qSCAoJQo4k/8rkwFFsaw1IbnpZT6gSbalIRGPtGouvMrgwKm7e
	Y1qk94D9Yu4sDU+48+9aCPdS+eY/iM0HOBcoN5ru/oOv2BGhjcepLHNiQcpFmDwynOC19qjUG9K
	bH2Y/l+Tl0xrSHCK1gWfZ+JDzkSznRuCmhk5OendE+Y4zlWRInPeEhHktx1b3+V2RFRcTUDTYj9
	2I1b5RwD1hVjGt9Fu0gHBGr7nIAhVEt6QtoRnmhZPOYEnhuaRt9yoT+PPDLl7U2lLab20a07aQ7
	3I4LQwXqKhFtQShBraVPhyc4cvIjWuRU49vMvON086CGDmXG9SLzoEPRuNhZjhpRqSJcAOTwGIJ
	08CcEOVcq+81t0Rtu3y2wADWnEPjGx/D7RzZMptWT8Bq46kGuqhn4GaGoE3Sx7ZgdBaVxoyzVGg
	OieP5jf3wOR6rGHD4XChLEnZQVO3vX7hF4QEM=
X-Received: by 2002:a05:620a:3727:b0:8cd:7833:7e3b with SMTP id af79cd13be357-8cdaa777ef2mr432821085a.6.1773322205937;
        Thu, 12 Mar 2026 06:30:05 -0700 (PDT)
X-Received: by 2002:a05:620a:3727:b0:8cd:7833:7e3b with SMTP id af79cd13be357-8cdaa777ef2mr432813085a.6.1773322205381;
        Thu, 12 Mar 2026 06:30:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm8646671fa.9.2026.03.12.06.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:30:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 15:29:41 +0200
Subject: [PATCH v3 20/27] drm/msm/adreno: adapt for UBWC 3.1 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-ubwc-rework-v3-20-b7e8f800176a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=738;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ffK+O6D6vNEMnJEMM/tky7u/BwlqJOyoW6OX7dYRjJY=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBpsr+3pyNJcy1gFw8sivFR5nHbRRGXO7kFW44t7
 sM/NCHEc8aJATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabK/twAKCRCLPIo+Aiko
 1YL3B/de+6/sWkudSyDY/t53dq8uUdLYFUjlm69O9qatQz6hr4nEnSmV7KOuVYsOpSJ0i/CF2tP
 1+w/R0r+BYPDs0dGZW2Ls11n8bsg60pIinhKSQpwhsM+gqRSt8t2QJay9wu1WQ9115pq+qw5qmD
 6Vn5zNbe3t0B6eBpc1R5WwhVJaVqmLdBwT+mjLJkbe9gLSztS1KCVRecS4tMi1bhKH/3b0V0TIP
 33qEsGu6FDuBgvA2lIk6V/lu16PAR6iNCB2NfTYkIKMrj88rEVOypeo+enia+Svq55yMPUhUhHK
 OUQwPYUfJZ0bkn0Hjy543xYPWA1W9dTUmAmF4cIADZKYeVQ=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ZN/aWH7b c=1 sm=1 tr=0 ts=69b2bfde cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=h0EdKdWjJzRczO_IdhYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNyBTYWx0ZWRfX348gjYixViPG
 C5h5LVFshY4m1parv3qBdKYEZ7qfLyNCbTcQQnmXbrLp81e2VDVCvE/RqgFe7OYZcE3FmHxXSDU
 0N2f3NXEe0RXIGawFNFcf3iHp5C10FtaICsV6XqUICQVr6j5pTmo2/FhEDtXQPnnAxnozaJYtW6
 NnVuKasOcMjDyaiJd6ksPnYk3OMj3NlAS33y0raC9Iwa9Hv7sPJKju2PUmmNeDYsnZdjzMOA7Sq
 WZYMq77xkqv77h5B94mpjSqdZ+yj5MBLTTSFE1Fa7s2Nq+h9dxvKxFChlR4jOxcWak+4FsYlLDR
 9UxK4Zh5KTHUMPh+G7/XOREBRKOC3R1BUYT2y+d+X11RinPZIR9YD6RRAcz7pbJL0zg7BUxJtRX
 jtHgLjnNuV9JXcJy5sHIuwy/S1QesM1r+4ckpK7VW3O/QGe+EhRYTYvPIakmKsnDotEBmwUDhgL
 hb0qefPVsC6HCx66SRA==
X-Proofpoint-GUID: MFgeyRqAvfomdHMXDWwHqsgOY8SPIoBB
X-Proofpoint-ORIG-GUID: MFgeyRqAvfomdHMXDWwHqsgOY8SPIoBB
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97240-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 731C1272B51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Extend the driver to handle UBWC 3.1 (in the same way as we handle UBWC
3.0).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 63934d21c831..e030e9e87ff6 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -290,6 +290,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 		fp16compoptdis = true;
 		rgba8888_lossless = true;
 		break;
+	case UBWC_3_1:
 	case UBWC_3_0:
 		break;
 	default:

-- 
2.47.3


