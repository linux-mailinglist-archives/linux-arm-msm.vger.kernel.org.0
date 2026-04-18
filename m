Return-Path: <linux-arm-msm+bounces-103592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DVHIZKe42n0JAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 17:09:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D925E4216A1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 17:09:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3BC13012C5A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 15:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87DDA2C158E;
	Sat, 18 Apr 2026 15:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cdgBPamb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WQz5PaEf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210A5280037
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 15:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776524942; cv=none; b=ItBdx7yFBoL1Vlf6YGJe6P0rTWFqWu33olsOUu6cgktZLxgbpzeQzwMisXqk4Lv0l/pSwC+A+CBoBBrpN3mKmXV+U5p9f6P29+Yo1WoMDvdiOKjMK0HyTf6lZCjHUTsvnsvtUTeUn/SeY8qxPwp8/on0yNDmla2zwqhi7WL51+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776524942; c=relaxed/simple;
	bh=K9Pw6o8Brk8am9IXaoscqme2/3W4hMGqjRJxjBd4Xx8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KsJ6K49heAg3mdGCylfmfw/IZfCd04FrJd/f0uy5i81dT5JDKaSZvwIFFvtQVRZ9YIN3WK2w3rgPtoPBsVHkODuqHmnitNwb7D9dMVYa7XsEKSGT1Q4Wff1YkVJ9MJ55uKRGQCRlbgGEXpHuYURr1//MuqXviBz/LcrKTmxqr+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cdgBPamb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WQz5PaEf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63I4UQJW3441426
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 15:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7RKGiZUqwXHwZlcK3riA8O7YRYr98W6ip9N
	WAR5j7yc=; b=cdgBPambaGImn9rgHx07MsxuvMGmN+FB0slXy+XK/gn5TPAfKP2
	QIQbNrirfJz7BHLn41K9m5uSewx9JVb7lrhQUmVo2ZmKb5d2tVO6d7LsvFfpWBYk
	aoZQLW1VHGieEKGTaingE9TLqZ3pD3wtn0QuffyEW1njgjzTywYqwL0gn1FA/gDz
	Pki5igp6knt4dU7+V+jvpAj0rr70nDJkogh12+CvR0MG6QJ1nXka5Oz+zP9Tzy72
	jaHSyxpTVJSiZZNlOq81xrcKtS0ONGwgnxE/EVRMkW7Mj8XQK8V2erd2E3iYV1XT
	M/aDXX1dDS2SHAjvKxYe/bFVQH4UMTIwwCA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkyne995x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 15:08:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35d9278587bso1834433a91.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 08:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776524932; x=1777129732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7RKGiZUqwXHwZlcK3riA8O7YRYr98W6ip9NWAR5j7yc=;
        b=WQz5PaEffaFwLSGS18eoezf7FuB7xupWG/MmssUAFA1YFHBirj3N3E6jdt68xQyZ9C
         u017Mk5SUQstkF7/9QKAkJRGofqoiX/FfDPW3httJ4CzEv86+FOzaGuaZR4Re9p1mm/S
         F18VDtOJP/0xhEOwqSNdypXiFj8DDZ+5D4iPE0KBUeamFPxJQUQ51Uui2/ytFxU+7ghl
         i26l/ggyj3iDNIdQfdHeyi1T6QY8FjP7+zfRqYo9uoCEz6RrS4qrlBq1H+WJn495l0GO
         WrarPLGznEGJzygwv6Zv4lx2Va+vDlO/X4QGctHCHpRSGQke3M75+5WAsVYSNUbNQtnb
         vLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776524932; x=1777129732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RKGiZUqwXHwZlcK3riA8O7YRYr98W6ip9NWAR5j7yc=;
        b=BFFB5hBV2nw5XzpqdVLdw/UlMfQINg0PCvKWpWZ+fu3mR9/WQDZaXdtAtTD8+toLOa
         VSKvVn2H1DGTxFVDLaUl55qj8hw87JMpuDQlyFKgfBzfawUqMT+2sOw1r5uoRsJTMTYU
         bPpkgYB6Sy6fuMFtPo9JaZpe1zqn+r4vFLzlrfSfAv3YhjQHTr6XBsV7/2xxcE+XkCiA
         LihpUOCGZx51QmcT/2/TH3ZrFUvB+nyQwiAWU8nIirHV8jkRhGMkwDjd0ykPeReV4Hvo
         MERtl1+JDv6YNnBfSvpHZDMI7H8XHFijeN+Fpmm7yR6xmokMiv14ypDXaMWboSLYaIwh
         AnBw==
X-Gm-Message-State: AOJu0Yx9cXP9+flAfL//39qTCVMuZ7NjB0iab2/UoV+B9sLgI5upm5Ok
	DKOCb5OeUVomVkey30fbmIc08rdcaIqSHy2gIyaBDojgNynpxd116ayAvf9BkpuEzPhHvQiLKxE
	IV0Rx4Rwpj6D2rEpkA1ZfvBYob/CRjJgNAdUX28YFCu6ZUXKWuegnkXnsLZheLksYIMs/
X-Gm-Gg: AeBDieuednunMCDISrZ7canM0D+0FunDin6NmtCC8LLcfKaQf5t1uIu2TlfpTxpp1zs
	yjaRF5dogp4gdy1aKCq69lO3qBj+MNGrZnD4AQBVLHfXW0nvKXWVaW2u0EvBpqfwZhBzaCJPwm0
	4F9imQUvjjXfR5RcrlrRq8RlqqnugS58s4sYgzhQkC0CW+ggCa02H1xpqqBqGIHOmALflUUDOkO
	gqcHcE7sMzOoHB2ICFP0Ij/RQNATdxLtRdbrjrXZzT8cLgtFRRI9uF6sO+iNih7NwPmMbpt4D7D
	scsMrJhuL9SCQLmRJ/4wZKoggqOGIGpfQSi2ZEomUqIiovYa5jBGW52K99kgRA+oYYRelACkRbJ
	/wMt5uqsqaCy9DzTTN/fr81t9B54iM3xT8wuv9ujaoL0=
X-Received: by 2002:a17:90b:3b89:b0:35f:b1f3:ac12 with SMTP id 98e67ed59e1d1-361403cb172mr7163558a91.4.1776524932473;
        Sat, 18 Apr 2026 08:08:52 -0700 (PDT)
X-Received: by 2002:a17:90b:3b89:b0:35f:b1f3:ac12 with SMTP id 98e67ed59e1d1-361403cb172mr7163528a91.4.1776524931993;
        Sat, 18 Apr 2026 08:08:51 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36143b0dc2fsm4882353a91.3.2026.04.18.08.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 08:08:51 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Correct modparam description
Date: Sat, 18 Apr 2026 08:08:47 -0700
Message-ID: <20260418150847.157246-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HbokiCE8 c=1 sm=1 tr=0 ts=69e39e85 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=J8kFTu22RRC7rXhO3X0A:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: obtLeZwWubw02WYG4WEtt4tpn1XxiAN3
X-Proofpoint-ORIG-GUID: obtLeZwWubw02WYG4WEtt4tpn1XxiAN3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE1MCBTYWx0ZWRfX+LoVeZNP5ylQ
 8P5b67S2jVub5WUlItFrAo33dxbKcAOFld2dxRnC2lhmx7K4NbTHHsrRcVoBRTv1DrywilxbehJ
 3Jivwv4YiVIahQdbUy65Czg6EJiuMV/RDVAMz+4m2385JnF/aluwi1qHzyuyTggr4hTooLJCm8C
 HE/KN8ZQayEifWtnKNMzr4Xb6AB9YGa5/ZoZ2H6vWFYpjSTtkxXGQvAKPFHqzOlNIdtuw5XusSX
 vaK/88pz7q9mAB/IoNJ86vKgdk9L6lD3KzljAGsFQyKKf3z6SdOpEG+DHFyx12v+ABb3Hi/Su5h
 XtMHXeK9RsjccBhBF8+hCXIelj3otq59uUD6vTEj3hcXLZD2+fKGX4h+5o7DC7iMvbxE4hFcoTV
 QAIxtVTdlpIZwiG4Fho3VQpluhTwiYAfOi19n1yWpjepG3WvedJBkTG+dVgSX2jpgbzayokGpmj
 hn9kk6IFxaGfMOlo+qw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_04,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180150
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-103592-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D925E4216A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Preemption is enabled for gen8 as well.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 770078904182..7f20320ef66a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -17,7 +17,7 @@ MODULE_PARM_DESC(snapshot_debugbus, "Include debugbus sections in GPU devcoredum
 module_param_named(snapshot_debugbus, snapshot_debugbus, bool, 0600);
 
 int enable_preemption = -1;
-MODULE_PARM_DESC(enable_preemption, "Enable preemption (A7xx only) (1=on , 0=disable, -1=auto (default))");
+MODULE_PARM_DESC(enable_preemption, "Enable preemption (A7xx+ only) (1=on , 0=disable, -1=auto (default))");
 module_param(enable_preemption, int, 0600);
 
 bool disable_acd;
-- 
2.53.0


