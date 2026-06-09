Return-Path: <linux-arm-msm+bounces-112099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 45SaKhHiJ2r33wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:51:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4DA65E8DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:51:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HdKfR2oi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hNAcd8VZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112099-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112099-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 791B83061F16
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3B0390212;
	Tue,  9 Jun 2026 09:46:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AF93EF0C8
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:46:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998417; cv=none; b=r5OTTofVqLVEbIAlaMHwJyIlnqd6Bgt5G4cCJudeI8rtZ5muLYJ8G7orqQtLNUNw4qWrFLhlcP86Jl6LT9NU0QrnNFx4WrsJRHVBy9iKI5tN2IeDxVWGJnTQYrLJOqMc22Yppst5aOTASkZ4vlsHOz/MJu4SCUJXBES+FqNul3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998417; c=relaxed/simple;
	bh=utX2rWcnEK7sp26OqAqarcDBJ0uE50FzNeV/RPRB27I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mvz7X/q4eupgojAJNSCm/iyOaJZx7yvHTT+saVnvRD1mIvNyA8a1jshL9cmtdXaJ6MZ9U4l8x7BQbO/72XJ/4bS43sLlHSx3Lr+rkTsgFnQWjB/ohBcWDxaxXDbwyR3umCDr3BJb9vYb1yRu/9Kcj/CET3KdV4niBIxrTRWpFyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HdKfR2oi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hNAcd8VZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599Jk352223003
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gsb2m0YYMxi0oazQhslfYqgxjuHbp4QxtyHnC/SdYhY=; b=HdKfR2oiPO5h+fm+
	TMqC4xzUt1k//m4c2C3bv6HWlZ90p8eca7S8umejkhW6BvMXuvAAnwTIztvMop7P
	ykiyBaiTEHbBKBsJ2baKbTAYdNgYvorIc0zQoqyKdSFIN5QKwBxTD+PEB5IiAOZF
	syJ4vzrdGpjaVoQ5rgnEjZcTMZ0Z/CtoeyPdOHOqhZ4fIP119R9+6ZR3acQ/mLKr
	WTA5lR3+x/4X66d01ariOMq/5hlLwD5QppiF2Bh3HsElLNkmnaKKIZDGRRZ5zDb/
	SZQkt7xuEXrDki/bd/9iPT1Egly+ClSSgVUwU2lS64Urp8BhIzavOt9LUyZ8JJ+C
	K7CPbw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3v03gt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:46:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9157db42dd8so1205717685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780998414; x=1781603214; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gsb2m0YYMxi0oazQhslfYqgxjuHbp4QxtyHnC/SdYhY=;
        b=hNAcd8VZReficCSW1tdEj65uXtB67LLFMRunm1QlU2OEv/BBABzzzqaZPSZiguPGco
         eUPHaHrZlsZvd8RaCJsBtuPKNGIBtf/h2JhgscYn+TmR1pmVxC9RIQE8EKfSIbfJYWIO
         8lXMHJexa5fCXNkVFF2vCxLgrayjHoHv++gECmeV3MNbsORwuM7duwFNs1cimoQDnRpx
         bpsDq0MLUoncS9Hh4vTaBM6sBhlJaJqzI3BtSYhRAbAdt1SnGpMmZwaRUX9U9IqWKxnG
         o5o9svgELbo+BWd1aKAwuonlzSTS2jBDdbuKVh6amanBLm4R1Vs6ryicC37ppNRCkgcK
         viAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998414; x=1781603214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gsb2m0YYMxi0oazQhslfYqgxjuHbp4QxtyHnC/SdYhY=;
        b=L/eScpjnQdqPC44aDoFsZBfdE7uNmiI3ftDK/7GbSXqCm/d3QVJMuQR8c6aVZaJMuu
         NOUdO09LIYM3Z6wtNQIAsJkaxPXozSj/iT0cP2avf0dRPOL0+bw8S2RgwT7bkUmhc0sh
         O36+/zKMrxkJU2ndkhJCywQ7ahWMM64EB9q4ch025QhhiO3DbiqE7sZtlZUL0feVRUNm
         +WB63FKXmjA/AYiZKrQl2zF4c45aNHpQ+hXjuuxKEFQb3oNv87bGzQwv+efxx3vvofsB
         8i/C4DpB6qeGo68RyqJk/st5J+VN1U9Tx9WWf/CXI+1kaF//Hr8jyARiLWuhGALOzz2/
         K/tg==
X-Gm-Message-State: AOJu0Yy07se9GafoI6wzjO4D8pEiClw/fvbeU/YXjD5CtYe3E1autP+d
	phfaSO0Ul3MfkMklG3qlb562dhcppfzIi0UXWuMNR0kicgYS0pcbPDL44PvPefD+Rl3xXtOoTHY
	Iz6kfuc1YUsD3RJqgUYumjbPNuw9zdJdUT4/9P1cmjafVn7XywVM/DFgBdjMAEIi7gqqw
X-Gm-Gg: Acq92OEKHIfeJuaat90vPMrJ7RZ8GibqbtNYVicqoE+QJCc42k/gXDjSyAqX55zaGYV
	Vg3tJzaVpxB2N0Odey7OXFwl4NWSRcvL89y/fgPMjVDVE9CBsf6bYbeUzs8DGGhZSO0gfKMhUaz
	0MqLZ8u3dWy//oRYeWpyHgFNw/+MADB+dZ2dKlBd3H3JSH8XLCffJioSNLCZcR73fNMmB65r59q
	l3ZZ8c3OgqiD0dliRxyUZfMqsX4gwfgIknS162SE8ygxmVuJ+XcPFtnKl/Zn0IIbdHD8TOKjmt8
	CZxwkZwz/f23wRjcPGePH5c3CnVJheLSLZ+4QpvDl2d/6GJ2AdrtLt+bRidFdz0Mhcw2Bs3yC5m
	eILrK4Hbxw5JtOaiZzWT0DZmZ4Gn9b8LxiGMiM4DTTAycuT4NPY/1ZLrM6uxDpw2YuQIHq6D7fh
	i3RIYkuC95NkSDUbXQyg==
X-Received: by 2002:a05:620a:1988:b0:915:7f6f:c8c0 with SMTP id af79cd13be357-915a9cadf7cmr3172256585a.15.1780998413785;
        Tue, 09 Jun 2026 02:46:53 -0700 (PDT)
X-Received: by 2002:a05:620a:1988:b0:915:7f6f:c8c0 with SMTP id af79cd13be357-915a9cadf7cmr3172251785a.15.1780998413402;
        Tue, 09 Jun 2026 02:46:53 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a00afafsm2047489485a.2.2026.06.09.02.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:46:53 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 17:46:25 +0800
Subject: [PATCH v7 03/15] drm/msm/dp: move mode setup into
 msm_dp_panel_init_panel_info()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-dp_mstclean-v7-3-ea04113e8233@oss.qualcomm.com>
References: <20260609-dp_mstclean-v7-0-ea04113e8233@oss.qualcomm.com>
In-Reply-To: <20260609-dp_mstclean-v7-0-ea04113e8233@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780998392; l=4086;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=utX2rWcnEK7sp26OqAqarcDBJ0uE50FzNeV/RPRB27I=;
 b=A2HR27xzrxB/wtBy9J4YOlebtXmWevEbShlDriMz70kcp3Sdwz1vvlnqBVe4axQgYqNt3cYm5
 YkDp/8ZE8ASC74VUieDHxuPw3McqqpcuhhX8FM0bcqRR7QD40GtxQAD
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=St6gLvO0 c=1 sm=1 tr=0 ts=6a27e10e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=RRF978PcF5p4qF5CYGQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: YFzj_CRHgkV5uZti0PpCTDYd_79fbvBp
X-Proofpoint-GUID: YFzj_CRHgkV5uZti0PpCTDYd_79fbvBp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5MCBTYWx0ZWRfX3TEYw+wyMZD8
 Po1AYWt5nBMtG+Tq5TVFikK+fLFk2YBIX90zMsHyBdjmtDcgUwpioMpJNjjN8BLG9B3uauNJVSA
 5EWxygbIb0TszoeYmZG6owZtF4fgPxoGPRlsi3aUFTaUP9XcQiyQqJPsgLlR/i5Ps+kzoMVeL7h
 P/tZUW9qeA3IA/GAoWaLzH6Vfu+21BijL8kUeZrI0ew+MrW0fZqfB3VPNVvqu5KW6/97KGvOiBO
 VbVIzSiQpkqwTo3I7p54Fcyv9hvsVoDg1ZQlnB2V8YBWQlPRiMqr65PBauXIh6Rdi27A1k4QBym
 jL3HQp5OPPb7k/rgZcoDbOkeYW3u8zyOtQgIezPzalPvYPLRfQaZkqPi+N5rxCDpajUaabldnn/
 3hRXMdf/G7zi8CXnuKZ7rmm7gYnglkIC/7R1UsjVrlAY1Q6os+k0yU5cIcSVlWKUuKMkfpHh1eG
 zJd3gVglOGmABAIsw4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112099-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 3A4DA65E8DA

The display layer directly assigns msm_dp_panel mode fields (bpp,
sync polarity, yuv420 flag) instead of letting the panel manage its
own state. Pass adjusted_mode and bpp as parameters to
msm_dp_panel_init_panel_info() and move the assignments inside it.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 11 +----------
 drivers/gpu/drm/msm/dp/dp_panel.c   | 18 +++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_panel.h   |  4 +++-
 3 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 181d238addfc..f33c754b83c3 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -604,21 +604,12 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	drm_mode_copy(&msm_dp_panel->msm_dp_mode.drm_mode, adjusted_mode);
 	if (msm_dp_display_check_video_test(msm_dp_display))
 		bpp = msm_dp_display_get_test_bpp(msm_dp_display);
 	else
 		bpp = msm_dp_panel->connector->display_info.bpc * 3;
 
-	msm_dp_panel->msm_dp_mode.bpp = bpp ? bpp : 24; /* Default bpp */
-	msm_dp_panel->msm_dp_mode.v_active_low =
-		!!(adjusted_mode->flags & DRM_MODE_FLAG_NVSYNC);
-	msm_dp_panel->msm_dp_mode.h_active_low =
-		!!(adjusted_mode->flags & DRM_MODE_FLAG_NHSYNC);
-	msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 =
-		drm_mode_is_420_only(&msm_dp_panel->connector->display_info, adjusted_mode) &&
-		msm_dp_panel->vsc_sdp_supported;
-	msm_dp_panel_init_panel_info(msm_dp_panel);
+	msm_dp_panel_init_panel_info(msm_dp_panel, adjusted_mode, bpp ? bpp : 24);
 
 	/* populate wide_bus_support to different layers */
 	dp->ctrl->wide_bus_en =
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index bde4a772d22c..e76dad0f6663 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -647,15 +647,27 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
 	return 0;
 }
 
-int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel)
+int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel,
+				 const struct drm_display_mode *adjusted_mode,
+				 u32 bpp)
 {
 	struct drm_display_mode *drm_mode;
 	struct msm_dp_panel_private *panel;
 
-	drm_mode = &msm_dp_panel->msm_dp_mode.drm_mode;
-
 	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 
+	drm_mode_copy(&msm_dp_panel->msm_dp_mode.drm_mode, adjusted_mode);
+	msm_dp_panel->msm_dp_mode.bpp = bpp;
+	msm_dp_panel->msm_dp_mode.v_active_low =
+		!!(adjusted_mode->flags & DRM_MODE_FLAG_NVSYNC);
+	msm_dp_panel->msm_dp_mode.h_active_low =
+		!!(adjusted_mode->flags & DRM_MODE_FLAG_NHSYNC);
+	msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 =
+		drm_mode_is_420_only(&msm_dp_panel->connector->display_info, adjusted_mode) &&
+		msm_dp_panel->vsc_sdp_supported;
+
+	drm_mode = &msm_dp_panel->msm_dp_mode.drm_mode;
+
 	/*
 	 * print resolution info as this is a result
 	 * of user initiated action of cable connection
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 53b7b4463551..4519ac374220 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -43,7 +43,9 @@ struct msm_dp_panel {
 	u32 max_bw_code;
 };
 
-int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel);
+int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel,
+				 const struct drm_display_mode *adjusted_mode,
+				 u32 bpp);
 int msm_dp_panel_deinit(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en);
 int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,

-- 
2.43.0


