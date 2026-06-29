Return-Path: <linux-arm-msm+bounces-115085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wg67AT5zQmoL7gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:29:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 564EB6DB372
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:29:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=D9sieNi1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ty33bJke;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115085-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115085-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24560310AC45
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EECC40B384;
	Mon, 29 Jun 2026 13:16:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E52E408606
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:16:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739003; cv=none; b=FR+3vYASIXkAs7cp8+2nxIPUT2mm8XQQHp5fk2cNbrWPiJPA9L5+Pte7uWrn0UH3jmA0csJKgfpgzOl90w27r2Y0xzYb39IM2vnDbIEsRVDHhfRJ1wFvitscxS3F9RW0um8sgdl8YRejtN9ojYwVcuaxJtuNF74Gxg6UVK9hzvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739003; c=relaxed/simple;
	bh=OaULnG6ZYqDjHwwokAvPm9tNfpMjHsLvWglqwDgfRoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XKPjRNDy+RtSdfTKlaQSfd/phZhO5IS5Hy1YdjkrSP+f2TVXlPhDHWqhxf+NimcYsXLLL4GXGDV7AgQurdl2/tSSK1lw6j4S8t4VfyNUeuP9dK8ZaczqzxBTRL5zHJycp3Q9Dsk+2r4nGN16ffgtgp+RG0rO5owc8N0e/tIDRCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D9sieNi1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ty33bJke; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATJmx2656106
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eErWUES5lcasuhvm6WPQHNkgN01/Ssy72Sz66KPQZic=; b=D9sieNi139Ib95CD
	ESCCPZhlZ8Ney2NwGWBR0aQ47ISUV3CJ371rmQ5laUV8tpNmaFvgrrjhtVejmh5R
	qUKGYbiUO7ToRkBbKukrcdAONioo0Eni2DJFSh9BmvEidUDXvrDjigXlJaVtwl4o
	J0ozoTaNGzOhm56SgQXF5P2i4mi5uNalfmfCeRs33ObL070PXqlRfsiP3JNhDBVX
	sRCSO/kabEA4/zsPapztkTwop6IdxMgVZYHPJQT6iKRhnOxbLANfJHKPXPCqDnuV
	3FOe5c9/Gm6O7OWSYHTjI24sJzynSEnf6Hwn3qocg00S8lGJgV/OOEvQNtFO3wjh
	hO1MZA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3np7gyan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:16:41 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8099ed7adc6so56087527b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782739000; x=1783343800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eErWUES5lcasuhvm6WPQHNkgN01/Ssy72Sz66KPQZic=;
        b=Ty33bJkeuWhbf4FkS7xfSfnjWPYQEPdURd5KJhVHFxYEEwkIXLr9u09COZja4E906W
         cNZQqIf4cd85vM6zKZxLwINLFIy07QWghfHapeAuSEaLdSKNyNFRo84MV83sQiGP7gDN
         r3UPikjCAryOldsPn5cGphsYD17uAGuZw7ISoy333UuZ3Ljjx+KzX7IduI63LH1uzTHJ
         9txSa37eZ1cWccuAfZ5Tm9oXDz8oTj2VMHnYMzH5OPEjWGUXHoEAl5XOj+kaEDsCwsol
         OCJrvrI13oKP1s7myxsib6A+ZHmKxSl4k7yB5PztROIUu209Lzn01YEuTe7alGVus6i6
         +Lgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782739000; x=1783343800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eErWUES5lcasuhvm6WPQHNkgN01/Ssy72Sz66KPQZic=;
        b=M0kw/JysTOoYubkpySWQLHO7pPNy2q9FlrVIchGPioGJRrtNuCmnG6NPJ8Ax+s5LdZ
         Fy0VgWdrh05vx1F8FPUv1lNeUYMgnEemEhooURiOhGBE0wYN3Al8cv4scjmyq9kprzAU
         LjRRvd6fvTV0iXVSGzgj03FAS8BP2CACZLOZ/Wvyr9zCGlFJhhvvp0Ug70EUCrgrSWZb
         imo0OkyujJTLkib+BfgkVLnsdiFch+0nawBVmudG7DX6ki+g+08T2yXi9ueGHtF8m+Gn
         WlyRRkNCBlHHcxxwGsbdEIv6Uu58YHXK/OkfvkMJ0iIzTPQft3dSkq1kYcmpuqSavwjY
         2bJw==
X-Gm-Message-State: AOJu0YxQOmccBLUUTww785hFZHfDEHDJX5oqHsIXb1vGG7r4wpCsogPl
	VQ78crgaqTp9NSsWbZ8e50uLQm+48zhSNiTImtxQlvbxmbk880/h7BDtY1jSP3r93Cn50DikE2m
	cG3RT4etjazsYY4QvsBepJDJV9llmNHewH1IFmRpRiXkRf2beIvztU7FIAVNP7fgT3LLn
X-Gm-Gg: AfdE7cmyycGf3fgXwxqANAEDz9+mbuAN8KZ1lp6/KPO5bYjXkwi78hgTNrifeC35lQc
	XCG41iuuU7YqiXeZp6Alan2TqiDgtZTrmUHn122+it19R1rPXYnFCoM3/jenlKOYbbto5cBnZru
	8cUlTFjtgO65ajfIsysgwa6wz66NNmdbf3q3vYTMQw5p4+dsbB39rIPNwonEoDeDX61jcjTfgkK
	LGdGbEuAYDUeT8np5QZDLXjleXub+7khSsQ7gXUJgGTkG3RRaWi/6Di9k2l56UqqWs/mmBsdHEk
	xfaQ7oGdINaAVDFAlwIbkLiGohKrN4qB8khMj7qEX2EXjma2n/rDt5DzD4088tVw/ehc/NMp825
	5XJrAynQSJwQUuF4UVjcSq10BhFoxfYTdh2BcHRE/CxxJaU3GqLVLj8sdbSver28HvUyTdFNG0g
	==
X-Received: by 2002:a05:690c:7408:b0:80b:d5d5:1aa with SMTP id 00721157ae682-80bd5d50715mr105681567b3.1.1782739000539;
        Mon, 29 Jun 2026 06:16:40 -0700 (PDT)
X-Received: by 2002:a05:690c:7408:b0:80b:d5d5:1aa with SMTP id 00721157ae682-80bd5d50715mr105680927b3.1.1782738999830;
        Mon, 29 Jun 2026 06:16:39 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ef0f2b9df0sm56744616d6.13.2026.06.29.06.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:16:39 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:16:20 +0800
Subject: [PATCH v5 02/25] drm/msm/dp: introduce max_streams for DP
 controller MST support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-msm-dp-mst-v5-2-1d882d9012f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782738985; l=4176;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=Aqo+NoeQSRVWiAKg7eVou998ouelemJcrlt/SprmKw8=;
 b=TIYTkfX0XafmUOXJSWn8NvOtut2IsgrSuWaPzmMGqkxhCMAVZH3hBe2UK9x5WiMFmJkj83b0S
 vXL7oooXhRqA4q1K6fSIt4ZTI/7QkpQWPO+dO7SV9iymhDwEwdSIc0R
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfX0VQNNhprhavq
 0pun1Rrg4QcHydWg21nfNoBP89uSerW2Cp84w3S1qjhuLnW6SFwahZ4i1usJCcyXe89+x1Kwo4l
 vJut0B5ZpoiRyQ86rFlmtYGhbnmyVoPTeDfwZ1V8ayFEj9xrq0drnmSVgi0PeF2e588FKKKDeBB
 8jfTTJx+O6r18w43R7qTuocg0Dy+TKk+tqcySkkQQTyEbpP5y4bU9wWsfDKdoOz19lH1AHYuuPu
 xhwqyfbAICdzWwjM0m52d8HkYPHofGUCGULRnRp1bWNzpfSGLePJjuCHiPFrt6VYs06WB0en9oy
 ljycTLYxOiwJvDffGR4sqVjZ0i7FwoA4wGlNv0YD1YbzZrJXA8Kp63SrscUiIukWijjcDLcqpjZ
 I50meISTuDsCgTGA8cUZckNu2tKKSmGfC1fJL35xeL2otLMHv3Hhgz9WNjHFJWrvGSPO7Agwof/
 ZZM/20vnERDtzyAAKsg==
X-Proofpoint-GUID: qZHWJbAUTRtnMpJQHbUwD7ps_OX7T_51
X-Proofpoint-ORIG-GUID: qZHWJbAUTRtnMpJQHbUwD7ps_OX7T_51
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfX5miuVua6PByl
 HPuoirgbZexnt6Ll6zysDkgc63jH6Mmw/68nx4XhD0t6apQ+qDGfbKTpzJRezoZJYpGO8TbfnSS
 LIh+dHPa6i+8q6/K5WPCxY+62zU+O0s=
X-Authority-Analysis: v=2.4 cv=OcWoyBTY c=1 sm=1 tr=0 ts=6a427039 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=lhQZdvDDsnZ9MB6dQpsA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115085-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,quicinc.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 564EB6DB372

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

DP controllers across different SoCs vary in the number of concurrent
MST streams they can support. Rather than hardcoding per-platform
values, the number of available pixel clocks in DT serves as a natural
indicator since each stream requires a dedicated pixel clock.

Introduce max_stream to capture this at initialization time and expose
it for the MST module to use during setup.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 13 +++++++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c | 12 ++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 4 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index a475e787656e..68fb4facb056 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -127,6 +127,7 @@ struct msm_dp_ctrl_private {
 	struct clk_bulk_data *link_clks;
 
 	struct clk *pixel_clk[DP_STREAM_MAX];
+	unsigned int num_pixel_clks;
 
 	union phy_configure_opts phy_opts;
 
@@ -2754,6 +2755,7 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
 	if (rc)
 		return rc;
 
+	ctrl->num_pixel_clks = 0;
 	for (i = DP_STREAM_0; i < DP_STREAM_MAX; i++) {
 		ctrl->pixel_clk[i] = devm_clk_get(dev, pixel_clks[i]);
 
@@ -2766,11 +2768,22 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
 			DRM_DEBUG_DP("stream %d pixel clock not found", i);
 			break;
 		}
+
+		ctrl->num_pixel_clks++;
 	}
 
 	return 0;
 }
 
+int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	struct msm_dp_ctrl_private *ctrl;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	return ctrl->num_pixel_clks;
+}
+
 struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link,
 			struct drm_dp_aux *aux,
 			struct phy *phy,
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index be0d89d60914..305add3dcd93 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -55,4 +55,5 @@ void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 
 void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
+int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *dp_ctrl);
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bb243ab09e66..9cd243411e44 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -87,6 +87,8 @@ struct msm_dp_display_private {
 
 	void __iomem *p0_base;
 	size_t p0_len;
+
+	int max_stream;
 };
 
 struct msm_dp_desc {
@@ -578,6 +580,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		dp->ctrl = NULL;
 		goto error_link;
 	}
+	dp->max_stream = msm_dp_ctrl_get_stream_cnt(dp->ctrl);
 
 	dp->audio = msm_dp_audio_get(dp->msm_dp_display.pdev, dp->link_base);
 	if (IS_ERR(dp->audio)) {
@@ -1178,6 +1181,15 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
 	return 0;
 }
 
+int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	return dp->max_stream;
+}
+
 static int msm_dp_display_probe(struct platform_device *pdev)
 {
 	int rc = 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 43ed79093e24..d3d4ab98089d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -26,6 +26,7 @@ struct msm_dp {
 	bool psr_supported;
 };
 
+int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display);
 int msm_dp_display_get_modes(struct msm_dp *msm_dp_display);
 bool msm_dp_display_check_video_test(struct msm_dp *msm_dp_display);
 int msm_dp_display_get_test_bpp(struct msm_dp *msm_dp_display);

-- 
2.43.0


