Return-Path: <linux-arm-msm+bounces-109495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MHUCFzUEmqz4QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 12:35:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D21D5C1F49
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 12:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D331E3021E57
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 10:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE0B3911B8;
	Sun, 24 May 2026 10:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Waa6ssRi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ktNjSgnm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD0027F4F5
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 10:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779618824; cv=none; b=aB2p4S78FrSVdDR5I/Vh8suuovnXIW/NnBNa2YRy5djkbKBC0Oyqx//zT2muvQ1QiKwfsVT1UTXe+/QS7IRwlutLchNpifT+NKnaLuSAa03DM7EkLrg5bZUG3ZiexqZ78vJn62Qo7s+4okcI0e2eXeZFd7rOaDAOBu3XXpc6Nlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779618824; c=relaxed/simple;
	bh=a1msQBKlYK8Fg6QQ4+aBnX8lUx244ZTssTQXW+xoUjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C8lnCKGGtb8Qcl6tr78fl35J0mi/3jKvdf2vSGz4jwkU1CrxD448CD1blYtVLekG0hJXXN0Ds+H3aufowKDWZ0lxis8C9o2HxnytAd41++RcNhMT9dq8uWKYPAmpY8O97VuUqUK3emKAq5nUxzBgSjEvK8Rqih1XZRrpl5TMX9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Waa6ssRi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ktNjSgnm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64O14YlI1972436
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 10:33:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iyv9syfthQXpoKYKQYEjdlG8jJw3/TSDQ0p9GxKw8Tg=; b=Waa6ssRifQJMB6u/
	akF5iunjLiwwFmxG2WIqS2dIhibph3JuvWbry7GAhI73MM8KfNk63eOd+tAqdXam
	zl4AEBg3wX40zXKPchf2n4y4JcY7t9PjpOpWc9NqqBYHZhwO5zCz/9x535CY0rsK
	jAmUODGAsCg3/cZ7KUaPc5Tgc1nnKsJ0zpTI7Bmm9OhD05EJFhrA+bwWmMCZ6VFg
	EmdsQW4DD6XZgKv635WFkUdLtmPT/UAEkGVP0vm2RqORXDb5swQpmobAZbczfTsx
	2idn+m37Fjkc1lEawq5+B33OLfJWu2PfEnMn0eUBPw6gBGAmd5A1D5Hp9k4xBorG
	hfiyVQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb386k3wb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 10:33:42 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56f6ef62af1so21029196e0c.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 03:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779618821; x=1780223621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iyv9syfthQXpoKYKQYEjdlG8jJw3/TSDQ0p9GxKw8Tg=;
        b=ktNjSgnmh6lw5NalsCXs8KEyzwRhtc+dueN/83UZ4wFGvRgSsoLfVs+JvQrigfO14G
         2mUOdEirDVh+yTBlxv/Pwcknq7lSrilQSHCzj2wWnaFsWvANHYLtPskl0MqyAK0SD4vV
         fZDFDYy2FDdlS5QvpEd1jB4t4m4yemg6lbfNKyqhbL9z+GL7awYM/7RvlWg78ucfFlkh
         2X5MK1WO6FFAmcpDR4aX1EPJdsJlbGOSkth/IZp8q6L2i7LsmDdCg5QxOkjqojWXjHCp
         HdmSd831Iso3Ed7WNAOrti07oebfbpivrdDiFWO0sRStjhi4yfLGNkOsHdjr525fQWEW
         ykCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779618821; x=1780223621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iyv9syfthQXpoKYKQYEjdlG8jJw3/TSDQ0p9GxKw8Tg=;
        b=gsUl8cyH7Badc+hXYA6vTYM9nfF/ey7BqskFbZrGHY5DsRf9PiXjRPdxfyrvZurK6B
         QqUGP5ZBoec5cgGo3UguSWn3tQyDl6sGXnGDv3DIdqLvvr+yaRzva2E2W0Ccs7N4hibO
         nnj1Ft667A3RSHJTnXu5Tf7q32gxAqo8Phdy37lyxV6CmECBLipIHz33qvLLLWyAWcon
         AGLQ5lD4JvLoyXrdCPM4eqsEXv1zRxLHxHdsK3G0NqK+sK0vjSWVKotGzeAouSeVHiUg
         S9StoWFK807hBveGsf2wUoO9yIx+0gZaUB3Z0wA1v55IKPeYrGf1iju4i+q59OOl2NJh
         g3Rg==
X-Gm-Message-State: AOJu0YyXrwtI/zBkhBiEYiXY7Dl07G2vr4Ey9VCD3BQnqyPgdDGBQJrF
	wv6XG3KGIDYVMwavPxUQe15ahHLF2snIjLe9CgxTsXqvMGdqrSMoF5GQQA9woHzoir19sF1yU1n
	bOnCuW6qxrX7e3kcVeL7Ioe2WruIyNohj8a+r5JIHOgk0GFnEOozR0uzVFl+E6eGGLXb1
X-Gm-Gg: Acq92OHKC6JsNzHd92m1t8Lxl2WG7V39QL7I5Xks76LZhbMAXDU1lfgkaam84nRGHwP
	09APybu+EGq8s1BWjEz29gkR76i6K3H1SVzUyAd5yGE+ywT6oZBeOE/ADXIC1e/eYhecDQ44S5N
	mZmSxLBJ+TLvnmoSq/aGsjwfAkLvcXi7qd8ugUohF2xu3RZJ6n2E++k+sBgPY4YBeSOw/vo75v0
	9Xmd5T+MFlzMGOW4acuG6fk99vJRfvqrXqK6A2R7Bq7EYJrCFeXyqC109pWrwyjLs/1o3nCLozp
	adJHAFLnwZLDNpinsWUJ8kHRE3qcD8D6GajeRwqn9G4xaSLKkIZVVzDZtjZTodjpywEuM3cBQZb
	YbWASW3F65pVOqLmPT+S6C+JmTvWXsnt/KP2IriYexWvjiXXvrwCrrPyMa/vL+c5UrA5ERUcb25
	Hg7SxP+I0dF1og5nrgheyrMmykOXEqyWXYeuY=
X-Received: by 2002:a05:6122:1310:b0:56b:1eb:d396 with SMTP id 71dfb90a1353d-58664ddc313mr5496543e0c.14.1779618821381;
        Sun, 24 May 2026 03:33:41 -0700 (PDT)
X-Received: by 2002:a05:6122:1310:b0:56b:1eb:d396 with SMTP id 71dfb90a1353d-58664ddc313mr5496527e0c.14.1779618820941;
        Sun, 24 May 2026 03:33:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cba880sm1816148e87.32.2026.05.24.03.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 03:33:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 24 May 2026 13:33:30 +0300
Subject: [PATCH v6 02/10] drm/msm/dp: Fix the ISR_* enum values
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-hpd-refactor-v6-2-cf3ab488dd7b@oss.qualcomm.com>
References: <20260524-hpd-refactor-v6-0-cf3ab488dd7b@oss.qualcomm.com>
In-Reply-To: <20260524-hpd-refactor-v6-0-cf3ab488dd7b@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Val Packett <val@packett.cool>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1314;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=M0xFObuyqZgBlqNrkdp3PVX6fNui+g+cwQXG8fz/uhs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqEtP8qvFgjuBpy2TdYOyhSO2wLOR65eGv95Da8
 AIL9bX3hXqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCahLT/AAKCRCLPIo+Aiko
 1SqiB/990K2kPsax9ea0OrmCVcDsuamPI+mrHcpsT1rLpmgDpHrzNb65CoGdS6CLHZ7RJKWoUHm
 wpRbX2/iT7SQMAtdBwVeqNrwYh1hKUaILucW64mONupci45Qc7LGyV2tgLbq3spRpHI6ykE3jwo
 9zT5DO6I8IFFXOVLra/uNe8tgSC2ZI9DnTYWuqfVeecbqBP9+Al+ieDo4RlBtLbMzvreZ1KsWXH
 /AKAvxrOLLLhnbjYNgmd9groKwDruSIkT+NyGrcDBvbQpvI47Fos6Wlv2zW3J3CLRDQPRF9BkaM
 J6ggWq344csTY6gYKOjN571jk4q4M27cVX1Vk00aQG/5R5EZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: J91MAyyXL_kwrlm7q3aLJzmZhVQ89cjQ
X-Proofpoint-GUID: J91MAyyXL_kwrlm7q3aLJzmZhVQ89cjQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDEwNyBTYWx0ZWRfX1UM5/wm5UiR5
 lMX2zI3IKFB3CjtlHgGJ9pGGxVn1riAlGU1NuCBwjF5CIaYyftG7t8vllTIgUZ4YVBvLqd8Oee2
 aQc1tXFox9h3kiXSx58fGaNl8SZzeISJxgxXKEJWbEO5qoi81Cz/iR/K0VCRoZoo/QGFcwOABeT
 AzgsPoT1Tg1yDBMTHPtCt9kyVAK7d+eczKXrxf/tkQwXRfISsR3GuBZIXAhmG6a8Kr6KtgrCqEJ
 mJQn2T0D7gBSUQ8FY9AuuaK5EQXH17VwiFC2Ala0/s1T0r4ZxDguZIA89TOrCtajgWkjURa0ElJ
 poPfBiwEV2At8tRGmSqJ9ndpxbtv3B0fnCJOTEGiz5qfyj52naADm8e3q1kh8aAbo4OUYz06Awd
 FqhWp1QY/zW/7Y5gwlopGSSJjo8HlinCGPP6fGYtnnxlppCk78SDd5X8zLAa5VmRQR4AKK1c9j6
 TEhQzfnzxcVzgxCPLVg==
X-Authority-Analysis: v=2.4 cv=PJY/P/qC c=1 sm=1 tr=0 ts=6a12d406 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=aneus3DpQx8xEqIVSrsA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605240107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109495-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,packett.cool:email,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 7D21D5C1F49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

The ISR_HPD_* enum should represent values that can be read from the
REG_DP_DP_HPD_INT_STATUS register. Swap ISR_HPD_IO_GLITCH_COUNT and
ISR_HPD_REPLUG_COUNT to map them correctly to register values.

While we are at it, correct the spelling for ISR_HPD_REPLUG_COUNT.

Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
Tested-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com> # Hamoa IOT EVK, QCS8300 Ride
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1b3cbf4016ef..1dd168acbbc3 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -38,9 +38,9 @@ enum {
 	ISR_DISCONNECTED,
 	ISR_CONNECT_PENDING,
 	ISR_CONNECTED,
-	ISR_HPD_REPLUG_COUNT,
+	ISR_HPD_IO_GLITCH_COUNT,
 	ISR_IRQ_HPD_PULSE_COUNT,
-	ISR_HPD_LO_GLITH_COUNT,
+	ISR_HPD_REPLUG_COUNT,
 };
 
 /* event thread connection state */

-- 
2.47.3


