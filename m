Return-Path: <linux-arm-msm+bounces-111264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xo1eMqrcIWpNPwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 22:14:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CB9643270
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 22:14:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ku6mCb1F;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Y673HOC7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111264-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111264-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90550305FC11
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 20:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1952D3D3D1A;
	Thu,  4 Jun 2026 20:10:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA515367B90
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 20:10:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780603826; cv=none; b=FbOcPi7NIparOuTmLBPce2OGRdrpn/bCs5NmV4BFy5VEMr7jzs+EwSL69HWKum6MbnWtcZYikSxyzZ3c3dbwxquguRRIDlxnqjsyErYy6j99tYNhYtefOngLWE0tLiXT5ENiJo3MtR80HWTcDw0sb9CgJ9NqQdPlMdbuR1UypQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780603826; c=relaxed/simple;
	bh=ELnhKuOwZgtCAxie8qqIfGWsgvW5Dz1MZaoEWQu71zk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qLDoo4oGaHoIdpSeTt7tkEKB5UeQXdMKRnfcicK76xDgSZCpb3syertywWcrBD/HYsCCYlRf8Uap561DexjZa3w42Rcwgfe473JiGaj46t+PFuAYhr+9kE6fuFgaWTiM4aaDRD07pRvor10IwyjfKeA7d/JEUyFU4h6ykRZHe08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ku6mCb1F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y673HOC7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654IQjwN2668059
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 20:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tEzM6aI+gFSdEXjQV7bYfKRnP6YjGvJAld8/hhWOkMA=; b=ku6mCb1FuOl28hAl
	gXZA/z+m6ewRQE8YxjrQFrxWVvGYyhBLov7sH1v8wyA7yO11mUd+pzM1/cPgzlL7
	JvgfoVImsBioqXt1KDbJCHPWFAYYzB4Uruxcfkz0YbN4dmoUtCDspdOv3kaL5NEm
	uowT0PnP+OY49rCiLI08Y3MeSxes1iTWuD5AMEI8Ww26nuZpGV908O6F9FBECMU5
	944aslBMxtvQb2QJzaMA03pb3clb5b+UOP9Zco+Ksy8E+IIG4qW4te3AWN66g0Ud
	yztDXLtMql79wBej+tDCAxC8932UPKYjcxY3F3xv4E82h7is8Eg16pzYELn1opRk
	lZ6cow==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekemyrdcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 20:10:22 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423f3e4728so757934b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 13:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780603822; x=1781208622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tEzM6aI+gFSdEXjQV7bYfKRnP6YjGvJAld8/hhWOkMA=;
        b=Y673HOC7VTKxSZJ6o6tE0r9fbpBNvRtGqTSUKN2eREBKhbqRp/qWN9aB2JEAY0uUIB
         X/q64N4ilWcvQYRITBpw9LxhTgLqXFcvQ++fat0qllhjFKIXWdozaKAgw/Xs8Vh01/+Q
         bQg82C2qIiTMupcVvoCBF0cYxvhO8Xaej4/S/TvSO+cok75m3/8a+FCooURt7U9hjCdy
         TulMD2FrKaCG01f8S9CEf5RGp4WQGwIxTBQzFeL/qP4HWSr9p1ZxBKPVxWFAnEVGtup7
         VWqqn8KP8JszvTEYt2n4NwezHvfcT7qGBOKwLa983VmrUKXmeGrylQGcbBMHUaupEpSg
         A3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780603822; x=1781208622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tEzM6aI+gFSdEXjQV7bYfKRnP6YjGvJAld8/hhWOkMA=;
        b=QYCsygBr0ucQKwMQOP3z2xXEWsJCCiH2Dy8i72FXcPrvn54z151bnvoiZWSrY0zJ87
         u7YQRmm7v1H4EXo6ZIPyezY9Ej/FT1VXjg34XDe9Qr7aJjK25leanb+9KQFw6tdVu0Dc
         FoB7gkE2xWzuYO+AaNLpdW76tZTEEIDDhcOmHkqHlIRlmKNq0fxiUMzMGSYP+PnhAAaJ
         iByLL62BkxY6iQ5/EKxw9OvtgvndDZxJa5oDl5HXdSavtNS9VodGSw2IY8eQH0M09AgW
         bPscJmq+PsDxsjcRveDkdpG5AO+I4gfbdZOAHNWJ7mb4PJrRz+Wd2hEe8ivxS1NJhP4C
         L6rg==
X-Gm-Message-State: AOJu0Ywa/NOFUGJnfzVIfapPVaMJ9yx4iwJcTF6wnNxghQZM+09ozNDH
	QxDLRlg33o64aCxGkFlRV4E/t7ZzaNDEk6TushzO1QGUWNRP22HD/FtRYc5Ca6KkLbfuV2AvYIA
	lVnb2yU8Dl5sKZtoWUnjuFNO5vbD0Art8JraVW2QrsxMArcS+B/LY8Moo59Jxhbq9jv95
X-Gm-Gg: Acq92OHDL5JYQq/YVFJYBbhRCJK88ANbPILOoLhnzZ8tVLcJ2dDQoLsfSfZCbsdGe+r
	bo3+SDXwTqKoa/uP0KMFM3b7MNEZ6dUPFEA3D7F0V1u9A57cfRsmMcBv6YKB5LNmLurxBq8MuGY
	tpNi4IxiRoBc3FIv58VTCm3upw78D9uh1f02oVX3NPz7DEwu6ChxVH6Cp5rUiZjUyBgXWjKPR5x
	eTJSHp4ebykwrN4l5gFKAbctJNjuqVXceUV9HkKJXUgVGUhUbe8V6+u1UXE/lc0vQNdY3dARei4
	So2Z+HmHr73PE+ai6E7zXsGBzLzFyF+Q1Xl+Sjt+6BOSj5AbU8Wu+SyiFCJebD8vdreJRf5Gn0q
	AXJQgw/671J4PBCnX43BNy+mPzEbWWr/uuH+6MRkLxXMMc8q9cl7mw811
X-Received: by 2002:a05:6a00:2d07:b0:842:4387:34c2 with SMTP id d2e1a72fcca58-842b0f1eb81mr219322b3a.10.1780603821691;
        Thu, 04 Jun 2026 13:10:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d07:b0:842:4387:34c2 with SMTP id d2e1a72fcca58-842b0f1eb81mr219304b3a.10.1780603821243;
        Thu, 04 Jun 2026 13:10:21 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428290067dsm6721425b3a.53.2026.06.04.13.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 13:10:20 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 05 Jun 2026 01:38:19 +0530
Subject: [PATCH 3/6] drm/msm/a6xx: Fix A663 GPUCC register list for state
 capture
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-assorted-fixes-june-v1-3-2caa04f7287c@oss.qualcomm.com>
References: <20260605-assorted-fixes-june-v1-0-2caa04f7287c@oss.qualcomm.com>
In-Reply-To: <20260605-assorted-fixes-june-v1-0-2caa04f7287c@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
        Jie Zhang <quic_jiezh@quicinc.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780603799; l=1196;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=KD6o6YqvRymUJjmyXkRq8JL7HBh95pEmuexIqWDOoFY=;
 b=Rf+OoZSBSB83ESsduxAX+IGD/p3hwH9STY3omijSLj0gNynys7t/XryrP6/hBWdeyjo5+Id8o
 kUaTfr/Oh7ZA3kAaz3Sk7IqLthdGnFo8kzXzEXLXyyOOIpn/NAFc86+
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: Wdoyv5HPx2VAr0aAfoVvbTVrGoiaG-9b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE5NyBTYWx0ZWRfX9Fi44efEifwN
 GbgO0p+g+a3GqjtP6Fe1nDmHJDTG9YNam2BjtZyRUtPBJ9X3i/pLFxbmE6NN8WaWXI8G/ICoJu8
 WoVk6FGGGyvVqoWBAhpim8Q5CJouBVZ1P/LZiUn3AVoS3ZsEeOr38WKW8gqnaxwWGqrfN6pNxNo
 RdMRJTU6r5pGY3La2xO1UtyTYGclRi0aWLFYdAmQqewc+axOtg676wpQ1gyS0PZAsHLpGvH1/+h
 ig//Zly8kZRAs2KmBpQK7KG2ZiGI5X6w37lg6B324epJC2/bnpbHRsU62IX7/mZUrLP4SwHRFi8
 xcd6A5Mh4xZgT6Pc7cmPelxR8gAFPdxJik1hhZWwJH/mqer/atEVr8mUoqUKW3Z9MQGUmek3DBk
 JfZQ9VEU338qSgZGFIGVB2WhiKmeLYFxtBk9GS5TQ6LNYsAMEDM1q+XLpdyuK/2RBwzyZZm0Ugl
 9sR8aM/h/ml5BFIpy9g==
X-Authority-Analysis: v=2.4 cv=K/wS2SWI c=1 sm=1 tr=0 ts=6a21dbae cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=oU5QhpEZILUeHJGd72wA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: Wdoyv5HPx2VAr0aAfoVvbTVrGoiaG-9b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040197
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111264-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_pvgtejas@quicinc.com,m:quic_jiezh@quicinc.com,m:mcanal@igalia.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:jie.zhang@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,quicinc.com,igalia.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 65CB9643270

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

The GPUCC register list for A663 is incorrect, which can cause
out-of-bounds register access during GPU state capture.

Update it to use the correct register ranges.

Fixes: 5773cce8615c ("drm/msm/a6xx: Add support for A663")
Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 166365359fa6..2a62a22077f9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1244,7 +1244,9 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
 	_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[1],
 		&a6xx_state->gmu_registers[1], true);
 
-	if (adreno_is_a621(adreno_gpu) || adreno_is_a623(adreno_gpu))
+	if (adreno_is_a621(adreno_gpu) ||
+	    adreno_is_a623(adreno_gpu) ||
+	    adreno_is_a663(adreno_gpu))
 		_a6xx_get_gmu_registers(gpu, a6xx_state, &a621_gpucc_reg,
 			&a6xx_state->gmu_registers[2], false);
 	else

-- 
2.51.0


