Return-Path: <linux-arm-msm+bounces-115095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tURUDttyQmrq7QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:27:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B88C26DB32E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:27:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LyBlQY6m;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AGjRPOix;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115095-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115095-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B513F30418AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 645E04192E0;
	Mon, 29 Jun 2026 13:17:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11DB4192E2
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739057; cv=none; b=IpRI9lvL0o1vBZnx+xrQXtwcZb91qL/x2ANGlXVuAcUf9k/TmpQouLTv0b+2Zn+KFSJFZNECHIvIEGxPYlGXtHhsbu+qCkYJM/LMltH2pDhYni7p7DFtfAtQAFmf2PwMguZHzR3aSg8zsvRneRJokn9wZ36RbJkgRNtDTljVgEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739057; c=relaxed/simple;
	bh=Nf1AvzGaEEpEYSX9Gph5/QaTlWnimXF8lHPYzXfiEKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UKsUMlINLgs9fXY2ISCIcgiFo9hqvG2WuSm3+NoxCPRPLCs3inV8sgabBizjihH9FV39tY6WHpDxerTd8lafZEMkhpfqSQItOMY/Wq+gHh2GXjZgl5C3Ub94eY3u0fn/31WBngrj7gKhmEgojoIFa3er7K4AlbwKYXLv8jcD6nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LyBlQY6m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AGjRPOix; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASvpJ2601200
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9svuRAUWKf4Cq1A1NpmrcreySoHCCAmo74eRJpf7Vus=; b=LyBlQY6msL0lZ1RK
	L6o7wHkawQeHaKROTbl+Yn+ngRVn656oMbq5TruDWSCWV6+l6bJ2NCf59nKWGs2c
	xUql3CCqcAIOTuBtS0wiR987o0jHU08Db/1jIU2jrnJTfR/tw+ppBuIjTRjUx1Sy
	bsSAFbwudTmaXDnljFgjkVfgRHXXFUn02Bz9V/8nFJ08FaJ+bV2vlJdI8qROrf7L
	kn2IU6ar2M/YCOULHW/jeBf+ZhvOOktW5225nTvh3D8sXTWd1rq76UM4FFRzaJIo
	Gn381ogH1s5Slc/gIr7v3QeUeVbaUEn+D2oASOix9MQ6bbTLFX59ArR+RbKhMOtF
	s2aMJA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw8yxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a88357129so49733981cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782739054; x=1783343854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9svuRAUWKf4Cq1A1NpmrcreySoHCCAmo74eRJpf7Vus=;
        b=AGjRPOixP8Ja4D6I/bduoNGqpJ4MYRPahj4/DTd60DIFg23GtGhQ8xy+oIG/ZW1rWw
         eLGK7Y7OShygRTc8j2JGdb23Qr4Zas/JcJIxR0dUW/HTjovYl8eMjOAoLsbVdkECqy6u
         6nq7cZNJ6tFAt9g8FgSA7FED+4aO/UjjhqKp3g4tTnnSYryXjhYy+zZCqAWgVcQ1FaRm
         cUP3ItqztSBKGMYTUofoqH6lAAjGSdNyBJgeAzZKfAl/cPZkXwQPKgRv5FgjRTM65cSq
         VDcnauc+ep6KuZkcKF9YN6AAOy1T1EmauHXn5JKyYHfp+6cEWRec1VsJuz8R672g3i9n
         gpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782739054; x=1783343854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9svuRAUWKf4Cq1A1NpmrcreySoHCCAmo74eRJpf7Vus=;
        b=fMT6SLxK7a5MShysRwu3S8aT+0VHOirdjukqq/jIc8SytH2zgS8zDlt9JiuiJm5ui+
         0iiKSrJ/OWyy0fX5zTar0gUIKDDzDf5hx3G0xsT0Kl12ekkypcnJYr+oZ3iVSxfbAkpE
         ntH63SDZXYzI0Ccin8D4kIng8TdTm+ZJPHcG9jBk7XXer8lQs3/D/6Q4OyQHGufnlONP
         XVyBEtZYTph7TiFfA+RvL3V+8/Mk4IyBwRmZtJK5G/+aIPh16J1PC5uW0aDZnZU35uDo
         UHN6duN9669QCSu9pwYMixmQb486ZLx2283SmqvWAkJR478+SZiOdnfA+31e1yByHfYu
         9TGg==
X-Gm-Message-State: AOJu0YzcYYXpXpo/Xs7zs+NCWb2C6Ea2EYItA49PkSR7/JcMYojFsakG
	QmSkpBlJFYvRjCBZTkAB+Bjwt4EyzkvHKOO233lScbf6bPoiQm8/MRPYW1rQNnPvQsvg3VZUjXh
	HS3/01AtaYdAE+HhT/6eGe6tYez+ZI4v8NmJNY0+ekzkwMW3NYPE8uaqJYkC4diSktzW5
X-Gm-Gg: AfdE7cmBbeTo41ACpPtzzGHm8O+J7w6hskS2lAJhGKG96umfP89Sjh7JOTxm2nCZfqI
	ZO28gK25XxWfPbBHQ7i8Fey+j71kd2iwoqsPnbYKeaIk8yF6MojvA9UmqQFHrBRmetiMr2gsCwB
	RDOIpBLBEoAYSPszGDibw1wVgrDX9LI52OnAa0QHDXgAzP7mpsAoXpwFlY/P/Nfgr9IDhN4Iyj4
	axqlxwN/UDhVK5BmHtxDZLBIpIcNODc04yttc85Ol+z9N0vu+UxQyZHguU2GVfmHcggJCpKJyrh
	QeB9KsQjMzkVrAMOA3nb7NzJgDSvtYRoi1jg/rZufnhFZP5Ev2LN9sH1Eim99w7wMVMvySo2I5B
	8bvDKFmQOekRGM5tSc5xjC/F53acWSUVEYJzlmS4+EQbcmvAsvQq+E1YFfLH9JTOBEIjZsYsS4A
	==
X-Received: by 2002:ac8:5a48:0:b0:516:ddfa:b6b9 with SMTP id d75a77b69052e-51a51b2e6acmr333456511cf.23.1782739053637;
        Mon, 29 Jun 2026 06:17:33 -0700 (PDT)
X-Received: by 2002:ac8:5a48:0:b0:516:ddfa:b6b9 with SMTP id d75a77b69052e-51a51b2e6acmr333455711cf.23.1782739052899;
        Mon, 29 Jun 2026 06:17:32 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ef0f2b9df0sm56744616d6.13.2026.06.29.06.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:17:32 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:16:30 +0800
Subject: [PATCH v5 12/25] drm/msm/dp: factor out _helper variants of bridge
 ops accepting a panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-msm-dp-mst-v5-12-1d882d9012f4@oss.qualcomm.com>
References: <20260629-msm-dp-mst-v5-0-1d882d9012f4@oss.qualcomm.com>
In-Reply-To: <20260629-msm-dp-mst-v5-0-1d882d9012f4@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782738985; l=8495;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=euWeALUbmMzdGUkiE/Q/aV5WnjeW32f7QOdos3tj6qM=;
 b=BgnU+v+B0PK6FU8r58V/Aat/2Puy+/V8rnh+1cIZgkTV28bTLh7ENsEa/uV7sWMTi6QEnV9bs
 Hyzxcp7zR5oC5f/1fdRLxCbGFoZvOAiVGLIQ/CGf9M05SEEG+MZOE2Q
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfXzB+tFrWlukzm
 3/wCXiI/ZfQAocjy91Ar5adyPqSkzwJ2UwMQKyw7tZVPjTjOKA7wvUt7nicP3FO4RAU7Ysu+jck
 Hjdrd2c/thCy1ZrJ5s/e22IRv359dec=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfX0uVMos6Fz1T2
 tYG0sRalmP5HfBZnCGHLix51dtmDr2VLfbdiYPSheJnR6N2vcOYbT7OhOSNLXjHZrJ7jzim6fL/
 ee3VEgax7xKYcM7jg4+gRIvQuC+KGq/72R2ggfhwgWxz1Ec8deSZcUdqJlxxWD77+vOO/cQ1UJ2
 TOLTNUx58SlXtFMTgJHyurTlpf0lftrhZ6AR9eQHJjScJi242kBgQPPJZjFOZ8Q455Ob6F4l2b+
 K9JY99Koa3L2g45gvAt7bsf/Tl12BG99HL+5SxG+KgVTvaq2WqzK07E24O/DUP06mN95mfCNxli
 kA/pzHAfm4MGy+BboL4scs3JfY4nG2Sy60mRc/56qK+9hSOqhS4LCrOsjMnNm8Fz4c7EjmMIA6N
 zzy7a0vNHsT/UDxnol1PB9em3Zve98OoXWWPH8fDDp8fBmAtYpZI0Rzviywug3UFViRRLfjwrnK
 Yf6uiMV/FUMT6q1iAQA==
X-Proofpoint-GUID: csxBJ5DvYir0d_NsLBRE33Cl9vZ3fj5r
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a42706e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=mu3EkBhnCEQeHIwj90QA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: csxBJ5DvYir0d_NsLBRE33Cl9vZ3fj5r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290109
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
	TAGGED_FROM(0.00)[bounces-115095-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
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
X-Rspamd-Queue-Id: B88C26DB32E

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

The atomic bridge callbacks (set_mode / enable / disable /
post_disable) on dp_display currently hard-code dp->panel. For
DP MST every stream has its own msm_dp_panel that the MST
encoder owns, so the same enable/disable sequence needs to be
invokable against an arbitrary panel.

Introduce *_helper variants that take struct msm_dp_panel * and
reduce the existing atomic_* callbacks to thin wrappers that
pass dp->panel. No SST-path behaviour change.

Also drop the static qualifier from msm_dp_display_prepare_link()
and msm_dp_display_unprepare() and change them to take
struct msm_dp * so the upcoming MST encoder code can drive
link-level prepare/unprepare uniformly through the public API.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 93 +++++++++++++++++++++++++++----------
 drivers/gpu/drm/msm/dp/dp_display.h | 12 +++++
 2 files changed, 80 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1680a67284a7..0e432f35cc51 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -628,12 +628,14 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
 	return 0;
 }
 
-static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
+int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display)
 {
-	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+	struct msm_dp_display_private *dp;
 	int rc = 0;
 	bool force_link_train = false;
 
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
 	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
 
 	if (msm_dp_display->is_edp)
@@ -1457,69 +1459,101 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	return 0;
 }
 
-void msm_dp_display_atomic_prepare(struct msm_dp *msm_dp_display,
-				   struct drm_atomic_commit *state)
+int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
+				   struct drm_atomic_commit *state,
+				   struct drm_encoder *drm_encoder,
+				   struct msm_dp_panel *msm_dp_panel)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *crtc_state;
+
+	crtc = drm_atomic_get_new_crtc_for_encoder(state, drm_encoder);
+	if (!crtc)
+		return 0;
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+
+	return msm_dp_display_set_mode(msm_dp_display, &crtc_state->adjusted_mode, msm_dp_panel);
+}
+
+void msm_dp_display_atomic_prepare(struct msm_dp *msm_dp_display,
+				   struct drm_atomic_commit *state)
+{
 	int rc = 0;
 	struct msm_dp_display_private *dp;
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	crtc = drm_atomic_get_new_crtc_for_encoder(state,
-						   msm_dp_display->bridge->encoder);
-	if (!crtc)
-		return;
-	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
-
-	rc = msm_dp_display_set_mode(msm_dp_display, &crtc_state->adjusted_mode, dp->panel);
+	rc = msm_dp_display_set_mode_helper(msm_dp_display, state,
+					    msm_dp_display->bridge->encoder, dp->panel);
 	if (rc) {
 		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
 		return;
 	}
 
-	rc = msm_dp_display_prepare_link(dp);
+	rc = msm_dp_display_prepare_link(msm_dp_display);
 	if (rc)
 		DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
 }
 
-void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
+void msm_dp_display_enable_helper(struct msm_dp *msm_dp_display, struct msm_dp_panel *msm_dp_panel)
 {
 	struct msm_dp_display_private *dp;
 	int rc = 0;
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	msm_dp_display_set_stream_info(msm_dp_display, dp->panel, 0, 0, 0);
+	msm_dp_display_set_stream_info(msm_dp_display, msm_dp_panel, 0, 0, 0);
 
-	rc = msm_dp_display_enable(dp, dp->panel);
+	rc = msm_dp_display_enable(dp, msm_dp_panel);
 	if (rc)
 		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
 
 	rc = msm_dp_display_post_enable(msm_dp_display);
 	if (rc) {
 		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		msm_dp_display_disable(dp, dp->panel);
+		msm_dp_display_disable(dp, msm_dp_panel);
 	}
 
 	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
 }
 
+void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	msm_dp_display_set_stream_info(msm_dp_display, dp->panel, 0, 0, 0);
+
+	msm_dp_display_enable_helper(msm_dp_display, dp->panel);
+}
+
+void msm_dp_display_disable_helper(struct msm_dp *msm_dp_display,
+				   struct msm_dp_panel *msm_dp_panel)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	msm_dp_ctrl_push_vcpf(dp->ctrl, msm_dp_panel);
+	msm_dp_ctrl_mst_stream_channel_slot_setup(dp->ctrl);
+	msm_dp_ctrl_mst_send_act(dp->ctrl, msm_dp_panel);
+}
+
 void msm_dp_display_atomic_disable(struct msm_dp *dp)
 {
 	struct msm_dp_display_private *msm_dp_display;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
-	msm_dp_ctrl_push_vcpf(msm_dp_display->ctrl, msm_dp_display->panel);
-	msm_dp_ctrl_mst_stream_channel_slot_setup(msm_dp_display->ctrl);
-	msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl, msm_dp_display->panel);
+	msm_dp_display_disable_helper(dp, msm_dp_display->panel);
 }
 
-static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
+void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
 {
-	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
 	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0)
@@ -1534,11 +1568,9 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 		msm_dp_display_host_phy_exit(dp);
 
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
-
-	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
 }
 
-void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
+void msm_dp_display_atomic_post_disable_helper(struct msm_dp *dp, struct msm_dp_panel *msm_dp_panel)
 {
 	struct msm_dp_display_private *msm_dp_display;
 
@@ -1549,7 +1581,18 @@ void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
 
 	msm_dp_display_audio_notify_disable(msm_dp_display);
 
-	msm_dp_display_disable(msm_dp_display, msm_dp_display->panel);
+	msm_dp_display_disable(msm_dp_display, msm_dp_panel);
+
+	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
+}
+
+void msm_dp_display_atomic_post_disable(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	msm_dp_display_atomic_post_disable_helper(msm_dp_display, dp->panel);
 
 	msm_dp_display_unprepare(msm_dp_display);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 45e2cc2d6add..55ffa22bb233 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -45,5 +45,17 @@ enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
 					       const struct drm_display_mode *mode);
 int msm_dp_display_set_stream_info(struct msm_dp *msm_dp_display, struct msm_dp_panel *panel,
 				   u32 start_slot, u32 num_slots, u32 pbn);
+void msm_dp_display_enable_helper(struct msm_dp *msm_dp_display,
+				  struct msm_dp_panel *msm_dp_panel);
+void msm_dp_display_disable_helper(struct msm_dp *msm_dp_display,
+				   struct msm_dp_panel *msm_dp_panel);
+void msm_dp_display_atomic_post_disable_helper(struct msm_dp *msm_dp_display,
+					       struct msm_dp_panel *msm_dp_panel);
+int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
+				   struct drm_atomic_commit *state,
+				   struct drm_encoder *drm_encoder,
+				   struct msm_dp_panel *msm_dp_panel);
+int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display);
+void msm_dp_display_unprepare(struct msm_dp *dp);
 
 #endif /* _DP_DISPLAY_H_ */

-- 
2.43.0


