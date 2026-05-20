Return-Path: <linux-arm-msm+bounces-108796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CZMOUPPDWr53QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:12:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55773590902
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:12:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 433563185C8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DA0B3EFFD8;
	Wed, 20 May 2026 14:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q0xmi/Nb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ed/Vq2HO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA00A3F1AD9
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288705; cv=none; b=RAPE+Trki6r6zn0eotlWPI7o/FwpTy49am8LIvK6CszxtLc6004aEFNeYiVVFAV0qZcQj2LbTqoDWNYCu44uXTbz2hjAfOGJRsJ+5DQkg+OqKaJtNaqUNVFz5NZ29jCKl+pA7VrUfj2GBT3joTncCBNT4gqjBx7fCu1poWkLwnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288705; c=relaxed/simple;
	bh=05LhYAKGVaBgZaN0qt9lOXQChuEy0ARdc0e/ucvP2Qw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IrhCoGzFis9gSfh3kYzRQ0FvbnAQ41eU2e8eMe9IMdom1A5irM+i32X23HMtsq57o2Q48F9rWeSLnjyehazkPqsifI3w7GIjw3stCE0nKzTNmiiaaIqi+s/KJEfVINgOjiEjyi3CPe1nClWVajRYwBuWAGX8WJzF1E+9l7ACEVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q0xmi/Nb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ed/Vq2HO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KDXYoI1797760
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oiUTlYZdmXRE6wHZobRlLY7t2S1s4URFF4b8EHPtYQc=; b=Q0xmi/NbitxmcvIr
	sw28MKVhUys3bEosnqDqsthvWfKzFVBJjHXz2CZbkGHjPewjfw/spQ40hv+ovtio
	wN8an6OWenbw716nkkjpoTLKOLqI1XxdCgGOUKCtFRsZQsPiBeTab5PDF2+Uvp6l
	0jXIYQE+6NGD7ACiiqC0kX0QRaCADJZMvdya4I0mnBP5ss2QQ+UGKQib+WftNSU5
	mLJS7sgy4ZQb0BE8R7S9t43b/xNoawgMCH/po/di5/n6DBPuUW2sxPTeya++OGRQ
	9c5VFClwrT3KMJvRi1838bBxxuVAwOjtXR80P8F7WjHJLn9y9MHb/WBtWDJpOtZJ
	6iOCCQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu0a10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:43 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-63136f3c5d6so8833169137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288702; x=1779893502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oiUTlYZdmXRE6wHZobRlLY7t2S1s4URFF4b8EHPtYQc=;
        b=ed/Vq2HOp5bO/g0Vqui2XEhDCfx4cQ1D45y48D+i4rvqXqGyAxwZDFZGo41hOWhGHc
         PAik00r66bcVc0wrZaQK/q1MHJAHxE/PBo+DsXWpBjOmB4PgrNyOMQj02QvJsiSUWsKw
         C46S0VQsFlrxB+WJUtPbAIG3TB1HC91HFhyn+NRzOx3dY/93OzSb/nanO0ruPQFP+Fst
         /nq15wTm1X8y4qrzxKkqNfOtsjV04GqcMzLOj0M1pejFEflLoXC68mO6W2Pmbt+i9jpl
         XoZkD7b9/0h0zrxrMFrKuL1hWIEUfFWNUuvqoDF2yg0rBrmvMVX9ZCgc+ljXfT1fWBn+
         7oKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288702; x=1779893502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oiUTlYZdmXRE6wHZobRlLY7t2S1s4URFF4b8EHPtYQc=;
        b=lPQW9LaDNG5qy0s0dbrOtHrji8xogzDshPe/lOeTPpy/eEn9zQLpFv9ndorY93mss1
         saFCgKRno1a6LIvtNbp7vp9uzCvAMEClPniLzMuEWIUjih4kv+31fOYKJ2zYoCTP+UJJ
         MT/kr/T9jfJsUCOQ0cMATbRXvwNApA2/gqQSSGSCoX0c7dyTTO1ybGk7qKdHVlv2PXCW
         N4fFCLm6nb9VbEF8iiQMCKI/K1Fo2tWmrENlmKG2IwadKsd+h0aBqT3g0LsPElWFkSCQ
         hm6ccEPWkbVExQULMwcjnuwSP6fQThOJ+baaWEe/j/zXCdZ5nBjE09CX+ZFKIgv5j59U
         rOMA==
X-Gm-Message-State: AOJu0YwZEut2j4zlga7El/FbIjHRVA9MoAMoem6M6gC0d2/luACGVL2E
	2rLTRHZPhEs3mfN39RLo2lAkwOpSdZq8gwkYvNDo6OwGptj/Oh++6WSHaEehoqMyM7+5szweSUE
	R0LO2J3fU96U0BmciqnRBy3hz+gsrKmfLYsx8/yMrUO4wSN9Q774A5rtd3RM2S/GNvDKYnu+4zo
	d+
X-Gm-Gg: Acq92OFU3u2MC7JPvqLjd0CfHoJdMigbiF4rDDMcFpx43zD0bI4r5B6xkcU75Sn99/K
	nV2DO165mejsxpNbyxEfP0o+JGqmyU5dRsNLb0akdKDnznQ+yDl7K9J84vPBuSI7vrTYDCZFKpL
	0iwJHlKN9irg/UuxlgqR+Ee1MAaMIvOHlqfN5B0DnJuN+HHeoSpPrY1TF08K23cUyt7/o1WFM8R
	W+SCCfxCX3nGKKh73uNfASY9QmR31InRTCSjDhqouwQrzyUPhuH8s1qsULdsjNZf1Qg27YBjGFM
	dIrSW0Qxz+f4TbzhP5r1jX62vBdkQBSmzCc/o3ae244veq+7xr2rpj/6ap8agTqaNcQa9yd3928
	3kUmqxiexNOtZ2X/D8AeT19tPloeBdWKVwYBxMIiANAhz3Cb9NXe/53bj+YOLGOUV7Z/181wrE3
	jwtMevoPBaw9jIn7h/OiwdvJKTeYQ1N3NgsOY=
X-Received: by 2002:a05:6102:358e:b0:605:5d09:8631 with SMTP id ada2fe7eead31-63a3fc98de6mr13087503137.29.1779288702140;
        Wed, 20 May 2026 07:51:42 -0700 (PDT)
X-Received: by 2002:a05:6102:358e:b0:605:5d09:8631 with SMTP id ada2fe7eead31-63a3fc98de6mr13087481137.29.1779288701632;
        Wed, 20 May 2026 07:51:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c78csm5128907e87.14.2026.05.20.07.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:51:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:51:18 +0300
Subject: [PATCH v5 11/28] drm/msm/mdss: use new helper to set UBWC bank
 spreading
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ubwc-rework-v5-11-72f2749bc807@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=853;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=05LhYAKGVaBgZaN0qt9lOXQChuEy0ARdc0e/ucvP2Qw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxbvqfSTCpfebak57jC9nSVwT4AL/ymz8IhVb7WtIvnLE
 6skXz7sZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEbrRzMMzoFH/Afbu1VdBg
 1prG6pJJMh+MT/belZig94LB0v4Bp9bX42xvOb7c1bRNif5zTTaK4VzLtMufdv+ctCXmxWTzI78
 Cv83W+jvF0VXd3kdR6dCWV/GBQlvk1BTvrJRhnRLMKPJ/zQ3Z+hbGF4bv9S9fepqrI7Er7QF77v
 zbRfZ562cdm/rOqNcx2fBu/uzrWgp+/9zMeyrfKC9kNn91klVldd4c3o/OngWaZusf3Wm5WHRje
 Y+nxTWP476Z6jZZyhr613UOVafVyx85y/J2XXhJkw7fQtm8hSZhf09sN3zfvdfhREr9zwXlTQxr
 jymocqwvcbXtLcopuL2IVUW1p7SX88hWzuhZcX9zrXX1AQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NSBTYWx0ZWRfX5s4C5kYog/Lk
 VnUmnzio7UaHqHZsJE7kfQCUkTNyhBB9hhUDA4nca+IvIL6qjyOb+z6xwSEQbknEJ2IyVBekarH
 c/cru4nNYMvhP/ZOpqCeqJbLw2QmpzbhLsgBCGj4jlZKshjuyadPM1TPaYA6PCwoIKcPj7QCbYE
 dMd6rrTGKg75kxunPfQc2eNaDMMsKbDQlg83t65GuhjbXSG5F3anjum98T4DMDvN7eXQMRR4kAx
 8GpuDhyYsjbuZvkhlMZ5wxjw7KnQ4I2ozp4xumYML/E7nZNKfPB9CA1O2Tikxt2lroJuLDVwzCu
 qlCzuGrdnmzbSG6rBqtRh+3bRRqfmBbD44qaBlD++pc9ZjF2j7Uw+rPQLf4P79duLZ9wO8+Fc9r
 CCMqxpUUbihovkEeIOMXGuFrRk1CuJu/LSWbGNpZz4nhaklrX5d174F077qF0RhAyvUgy8da1WK
 dviave6aD1PpU9AJioQ==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0dca7f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=vkIeKiNhsAXvYQN2DwYA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: iC3OEek7dSVoA2EF6XRabgHUMYxA1dUq
X-Proofpoint-ORIG-GUID: iC3OEek7dSVoA2EF6XRabgHUMYxA1dUq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200145
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108796-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 55773590902
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use freshly defined helper instead of hardcoding the checks in the
driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2742d4bb2a4d..bf106d849dea 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -201,7 +201,7 @@ static void msm_mdss_6x_setup_ubwc(struct msm_mdss *msm_mdss)
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 	u32 prediction_mode;
 
-	if (data->ubwc_bank_spread)
+	if (qcom_ubwc_bank_spread(data))
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
 
 	if (qcom_ubwc_macrotile_mode(data))

-- 
2.47.3


