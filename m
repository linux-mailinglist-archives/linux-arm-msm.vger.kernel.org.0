Return-Path: <linux-arm-msm+bounces-115153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cAYMCJSBQmoW8wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:30:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C046DC0F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:30:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HfxVIzRF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EM0PFznC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115153-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115153-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B60F630488E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15DE3408002;
	Mon, 29 Jun 2026 14:17:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31E2423167
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:17:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742626; cv=none; b=RMACJFVRLH8Q+sDcyokOEBIAbWp+w4t72+Mf3+oZss+1QR35k4yC2YyKEyfLaXVM7uzuCcqxKOJdLivhK/VXyjzUn7BHdV/zj8zsEVmYqHt318dM+w3T+mmq39WQlaaU94UwcSlxuTWcQ+Uofg77crjVmbBrtBJojbKyiDb1Ivs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742626; c=relaxed/simple;
	bh=b2i238VUI/AdKzoSuCKAbFa1dbTjNQRwjyN6xCNz0mo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P70tJUG457TLPT/HD86/Ma95u5FLoRUM/X2e7wbhD4yD/CLSmmheQFF+dZ7qYyrXrm6NVnNSEhwcMXYghMZpH64GrobM/t4dk6B/2vwXk3GLuMYEfybVfyjFNewKkXC44FnXnjPy6dI3I481JHGK667bX6tVkm1YxLwjUkxTM4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HfxVIzRF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EM0PFznC; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATGPJ2628186
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s3VwBumwCqEjd1GYUzP46GInRqb8UClCfWsUQZYOShE=; b=HfxVIzRFx73FAPkn
	ditk1xCO1diJU0vRJtCrnydiQExGXu5MQlI9hQFi2CakmktSyvJy/TPI4FajvrGl
	+XOe215R8NOlXFBMp/t6k4KNTpoigFdqeR21HTvNlxsYVm3zXtT1EFWKb1ky/0vw
	t/HfnWRilQ+mi3R9JSkdliH1yOprBCeSxyR8VYu8sdjX2FHMq5HVYY6N9hU8IMTQ
	Gic15XD5PQXPimrBMFfs7XoMvdRzb1W0btaqUaYBUeET0HbPW2KDW/iBZeis3Bql
	njcVXqyhMkz/ShPPXuuea+KdPMt5jsEW5eAiIffJ6zpCsvrzhHDDkPuqFbpDe3sf
	i7g/ww==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgs94t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:17:03 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8eac2620cb0so55760256d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742623; x=1783347423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3VwBumwCqEjd1GYUzP46GInRqb8UClCfWsUQZYOShE=;
        b=EM0PFznCEyP0LaHoA8Llh0kg5U/YcFje/dUJBd1HDKQ2N87LT7Uf4bexzixtLM1pp1
         pXjyeAL7scryjo9bYPL/zi1KZy4fYqiZDSgTu/nat0BelC56yij/QmHsYjx7CRb+badO
         Kgn/R4ObVI6ptipfhbs7y5MdSC4ZsL2Ppdj96eqf9G6o4NOXEqlmOefcw+r4bUfn8ihG
         rVbgWgItgNxK6iGUkr8JIaJ1I7Vm7CrFovXXc1R9960tbT9gBshgzlrMFo2z024M6Ltz
         XoLRDvZ2lQT/ti+6Ay0+YTmMBQafk4mTHCTsZk/C/YRHIGoNIJktxSNDUPK48S4ZtnBX
         iISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742623; x=1783347423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s3VwBumwCqEjd1GYUzP46GInRqb8UClCfWsUQZYOShE=;
        b=EItqluYYGdDQCP0T0l0QtczQ2jGBJ95RbmGlRJ0jazRQcMvVXZyKIzxlWE8RITPN9+
         RyUThIGAbe7lyk+fC7JyrL9A6OBbHX+5hzeWYj8eJeEo8F30SgW7irMw53qjDzTp1TD2
         TT8tlD2DqHNcQ3qtGhKMPiD4MUYz8+E3vbj6LsF0kD+SbjwuVUOAki6dHF4Ol1XiuI6G
         2fAoF/WDxJQgKhICStDgpyEj4F4mp2MTSc+gc+4BcSCynCI11aP8Dq3kH7NtinUCmdmH
         uzeaNFPhAlzxF1auvhdmrC+Ch5JApgx/FihhLpzpPyxYABGkuK5ajIXX2rh96/JNpmD3
         +pFw==
X-Gm-Message-State: AOJu0YwXFBUQAZ8p+5znikjVA224eY34U+Uy3ha5QAwNmZHTgvHyFNb6
	h33dconJ2q2zrDqLg//i3inWhcOvYteikGOiiVA9xgrnOY9Fo2wFLcre+fLgV4wOlKM7GWOIR1L
	R21bsjJeorQprb7MfWZxSUKOHxTZOc/vaEOFQFDRcECk0XkJNfkOaLtGUSrwO5udhdzQk
X-Gm-Gg: AfdE7ckxg9aCoQzY27i4tz4uNlw1/DgSIKwyoT+fw+zkxxqCEGhzfCGm0BJ111fOn70
	1VXdR/fnaoLhyEN0Q8jRxVMALcmwAq8yMv1Sm5x6yTzCSoJLwOu2m4SJUXJaKs1FssPd71ntAti
	WuO+ILrg7QH2QOka3s2dpIs0LdxKBGBPa4j4J+bmSYIuaTD+adKk7IisSMvOr1IZp1uTPaHJu+Z
	0ZgBNNQTaioGgiyrKAUI9dugaW/eb347poGG4Oy3DBznd8WgwFEpJHwHlvEAwsgIil9ZUML1qg9
	ODTtdjYxBOfsJa1lNaLOqFL3rIun+ThWIzZ8n6nt4PIw5SqMLgRfruxfAMurxKygVIoeth/CkUg
	r41Oh6zHI0n1dl1BWjG7OymJ0wvn6/YoIS/Y3E596KyzP8G+UeR6wuB+0xOYM8hZUH2koLg==
X-Received: by 2002:a05:620a:2301:10b0:92b:32d4:4ae6 with SMTP id af79cd13be357-92b32d46453mr1194424985a.42.1782742622562;
        Mon, 29 Jun 2026 07:17:02 -0700 (PDT)
X-Received: by 2002:a05:620a:2301:10b0:92b:32d4:4ae6 with SMTP id af79cd13be357-92b32d46453mr1194420985a.42.1782742621870;
        Mon, 29 Jun 2026 07:17:01 -0700 (PDT)
Received: from yongmou2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9260079070bsm2143165885a.40.2026.06.29.07.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:17:01 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH RESEND v5 22/25] drm/msm/dp: wire MST helpers into atomic check and commit paths
Date: Mon, 29 Jun 2026 22:14:43 +0800
Message-ID: <20260629-msm-dp-mst-v5-22-2ed6aee1867a@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782742144; l=3337; i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id; bh=b2i238VUI/AdKzoSuCKAbFa1dbTjNQRwjyN6xCNz0mo=; b=igEgrzozdyLMzTrm2/ynfm9SDhtgOWmyL75SDtVtIh+KRvPdQR3TaKoFjqQI6DDHzD+QSGfVV xZh9vwij2jWCA9H1pOpUd8wGitlgUN+Tfo9+KwkSx3idfi+sI9CUtLA
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519; pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 675TkxeisWb-6dgWVFRdlz-p6QH5noMP
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a427e5f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=rXwVWE6-aGP_zC5-gXEA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfXz4oRMhKhsvgA
 ipf+dG5cHdvIMN4Nr6cd9Un7lBiEL6GKHtKNe4NdSgV2uOGsxT0zyLFh+BQaGcSR9NDABCJza7/
 /8nCbycSArR0wad59N2ukC8lbNKVKqo=
X-Proofpoint-GUID: 675TkxeisWb-6dgWVFRdlz-p6QH5noMP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX3mGQOBbbCQj0
 iWf9aF4FRfp+pM3eW/pp3muouDJMtmpVUPNKkLOed8uaw3f5d4Hp9fuYFGjFN3luBNrgru1K7A0
 DDa6aqygnAc4BNoIi213OiszpNUfiMgyKELw6vjsMqZ1sioT39H7ESWt2PoMk1+TSB+Im9p54vM
 SqpsEgjlfOYgev+AAfhzG/Jyca5qVLsp2eMayQc2U6L5scj6N6Q46c5Xr3I+3fGei+rNo2jGxU+
 TkQy8Yst3+kK/i6buP2NYwIEKb+atND4Ykk+PC1dAsxoY0P3LjNEvcTNhvj70fk4zbPSpuYeF/I
 Ms0pGswBb0MfnRFMGhhUyoU9f8/YI1SXBzWT2ti0eNI14JTrst+OGrVar0/QZjaCys+8M1Q2Bsr
 XX0e25JTMnwxzD/rhOKb35LqXT/Sbz6U1IMUHe4/xOmZQTtaMovJotnYyvizSQsthh427O5jr/4
 YqusrgsKGdhshmKuAEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115153-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 89C046DC0F2

Call drm_dp_mst_atomic_check() from msm_atomic_check() so MST-specific
state, such as connector and topology changes, is validated as part of
the atomic check.

Hook the MST helpers into atomic_commit_setup() and
atomic_commit_tail() to support non-blocking atomic commits for
DisplayPort MST, and ensure MST commits properly wait for dependencies.

For SST, non-blocking commits are already handled via commit_tail(),
which waits for dependencies in the DRM core.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_atomic.c | 14 +++++++++++++-
 drivers/gpu/drm/msm/msm_drv.h    |  1 +
 drivers/gpu/drm/msm/msm_kms.c    |  1 +
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index a8babf1dbe0d..e70e5088cfe5 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -4,6 +4,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_vblank.h>
 
@@ -207,7 +208,11 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_commit *state)
 	if (ret)
 		return ret;
 
-	return drm_atomic_helper_check(dev, state);
+	ret = drm_atomic_helper_check(dev, state);
+	if (ret)
+		return ret;
+
+	return drm_dp_mst_atomic_check(state);
 }
 
 void msm_atomic_commit_tail(struct drm_atomic_commit *state)
@@ -221,6 +226,8 @@ void msm_atomic_commit_tail(struct drm_atomic_commit *state)
 
 	trace_msm_atomic_commit_tail_start(async, crtc_mask);
 
+	drm_dp_mst_atomic_wait_for_dependencies(state);
+
 	kms->funcs->enable_commit(kms);
 
 	/*
@@ -322,3 +329,8 @@ void msm_atomic_commit_tail(struct drm_atomic_commit *state)
 
 	trace_msm_atomic_commit_tail_finish(async, crtc_mask);
 }
+
+int msm_atomic_commit_setup(struct drm_atomic_commit *state)
+{
+	return drm_dp_mst_atomic_setup_commit(state);
+}
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 963303079220..f71200a790f3 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -213,6 +213,7 @@ int msm_atomic_init_pending_timer(struct msm_pending_timer *timer,
 		struct msm_kms *kms, int crtc_idx);
 void msm_atomic_destroy_pending_timer(struct msm_pending_timer *timer);
 void msm_atomic_commit_tail(struct drm_atomic_commit *state);
+int msm_atomic_commit_setup(struct drm_atomic_commit *state);
 int msm_atomic_check(struct drm_device *dev, struct drm_atomic_commit *state);
 struct drm_atomic_commit *msm_atomic_state_alloc(struct drm_device *dev);
 
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index e5d0ea629448..33ab30300e16 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -29,6 +29,7 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
 
 static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
 	.atomic_commit_tail = msm_atomic_commit_tail,
+	.atomic_commit_setup = msm_atomic_commit_setup,
 };
 
 static irqreturn_t msm_irq(int irq, void *arg)

-- 
2.43.0


