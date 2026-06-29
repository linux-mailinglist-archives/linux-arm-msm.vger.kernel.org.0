Return-Path: <linux-arm-msm+bounces-115139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jPEwHlKBQmr/8gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:29:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B33DB6DC0D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:29:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cxvB5Qox;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cwd8JgGU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115139-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115139-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F39B30F05AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F107416D1F;
	Mon, 29 Jun 2026 14:16:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126404192F2
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742565; cv=none; b=cDhhOc5pmrDz36P/xxunry3BHiuBXKvJ+a4xVvPDSTPdLoZalX3ReMe3bqCIJmDw9n99frKoNPZQSST7m3zDnpxSyenOF+vO94zzGgZRZUGA2CF1OkwIHdwtmn99/o8R1hcGHqMN492CZ42mPE3v4qixVnalzV/nNhqv70BcGNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742565; c=relaxed/simple;
	bh=yGUsWWBpVJZ20b67T+qLNgW8SIPwI+1q8jEal6Hcy5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MKgA669zFJTty1aqRiNKBM2usN+7xyeskZe6OcHOPodfni3Dy1bgCGL0ZHFp0cl0WO3MTc7+AyiRL5pjopA0d3PxKuk4v9Kh/nTmZl9L+V/7D3wBFLIBamimXbDMGdry41vYPdFlcB2JugBCZ456AgJKXY8VPNrbJsAGmWoElv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cxvB5Qox; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cwd8JgGU; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TB5FN72728482
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jusjjSJwJFuIT3xoYc/Wmu34BYtQlfiUmQ5CnQZ7+xQ=; b=cxvB5QoxSgcrXltE
	7rm8q9solaabb8OY55XueCGR9zm+d2egTJIuILYpdhikWaJpyfqGDb6rGL0wvqto
	kc7f+2uKjpp0nmvKK0YJejvFMh1nITpUNxOyLYUWBHpotMcKgsDQc3BTeHouaT0O
	wzG11zqCNEOl52rYJzKafq8nBdW0kbyMw6yu75i67hJ1shjtR+CkkhWMjlXuj9UP
	O3YO3nSB2aHM9SFHizqa6XT+QiGBq7HGxRjIpf9mivlKkf6xKrlVlpC3swRy5NXI
	HlcJwavnFse+JwBBMZVsm+EDBGqW10eRTa2BNyJTOHcEyMogWQ9dNN6rdpeUz0Pt
	5N3zcA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3qha8pf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92a62578049so544569485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742562; x=1783347362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jusjjSJwJFuIT3xoYc/Wmu34BYtQlfiUmQ5CnQZ7+xQ=;
        b=cwd8JgGU6Nanj/oPDAIyJRSSZvNFDw0+soTbrawvpxRgElSNxpUeOLTV63XAwYw2vz
         OoyxZEXnYiJXJdHMu3m6k4CZ501gU1Enm4FcSKehDsJAuCSRC6qLPWIlFMfOM0EoUvG7
         yWNHXqYU1vDPATXJJ0Uw5js6CN57u9da+/L/BLfrxlGXIxckijp0tn6gVI6c2ps0q4iD
         LfsTAaXYmIV9Mv3Q6nwNSbK5vskjyIYdjAjq+N6gZGd0EeJGmG8Y5FJvJ4gdFqNLlBXe
         fMeH/t0JZh5K/w+HGkOOq01+1Oax2hrISkdwzAoT2fkaUOZnRDZjdvRrJ2v6Eg1w8Ap1
         i2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742562; x=1783347362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jusjjSJwJFuIT3xoYc/Wmu34BYtQlfiUmQ5CnQZ7+xQ=;
        b=cnC8GO7Woy/yGYbYjfFXOYY/9rJRQQlCvDWkcFF/TuZ1kcOnwmU7gSVhsJZ818FBFM
         yvtGbuga9a+1XvEkwQ1bVbWzVTipuglopl04IOeqQXPX1sf+ll/hbAKcbkU73jalMF7s
         E5oSMo0Rm/ApMolK0+Y8XKdQT9A1MOrOvfBEZ45cpY1NMOmF9K2SRwuHi7BnDEqgIQal
         5FaVm+zziTP5hm7QwiF+g8+ASCUNDIWIhm/cJYEUlMcyVx3mBWzDD/k8RJijsuF6g9mo
         PLG7PrYTz8R4OqE5m7xOrgu/znIAheU6qJUNPyZ7zxptHiw9csayeSGSqNQlFptIfP87
         /yGw==
X-Gm-Message-State: AOJu0YwFPgkFD3dIVCexHFlZP1lfzrVMIxAG7chez0ZVKGoozjfgvajZ
	TO4PoBWFjJhyoT5Cxirzo/e9gvbofeXKAqeRBVKWlpn5/JPP/9e9GBGE4IJrxe1Dyne1sKatlec
	Bg0/KBUyo+ZkWSgJgztokr8N1RShoUFRcbG1RteflNpjIn6ZkSoOjIkYxxzxJhrRn9fgb
X-Gm-Gg: AfdE7cnBYPpUf/uHVKmzn8pBPGqt5IRrGzSvawpIv/wS5gr+f+rolfro2AZwpGbTn1y
	ljvRhl2gIvDJk66rcOQrEKW0nV7IfI1L+ZElWi7bmPegNPX7QbUfhXxxY5ET6SRAKKYUcD1yhGG
	Q0vayhmfvMgdazQKY52x0D+1EABzhIXE56ZuNYufYQidCtrlA3R3cHz9XmfSqQgXj1YiDyWFEEv
	nmwm2+omk3vuo83ZbGqw6hRwk37gYTuSRuUe9Uo2KetOhTvUJOCO/dVkrtgYzNs6PnEeUZCCYpo
	F8Gvm0bRoyb34B+4oE3/nsRPDfrUvUajjZxWhRI3PeIPHRopAFj9wGVcL4R9FOZ5z9T998DZk37
	QNW+NDodfGg/R9NWyHpIbqa+aMUd2XLm+VKc3Gn5B6IjEtlFbdsRVc12Ru0wDbdMkrLRU5w==
X-Received: by 2002:a05:620a:298e:b0:916:1785:57bf with SMTP id af79cd13be357-929245f72cdmr2204617185a.6.1782742562255;
        Mon, 29 Jun 2026 07:16:02 -0700 (PDT)
X-Received: by 2002:a05:620a:298e:b0:916:1785:57bf with SMTP id af79cd13be357-929245f72cdmr2204612685a.6.1782742561771;
        Mon, 29 Jun 2026 07:16:01 -0700 (PDT)
Received: from yongmou2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9260079070bsm2143165885a.40.2026.06.29.07.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:16:01 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH RESEND v5 11/25] drm/msm/dp: move link-level teardown from display_disable to display_unprepare
Date: Mon, 29 Jun 2026 22:14:32 +0800
Message-ID: <20260629-msm-dp-mst-v5-11-2ed6aee1867a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782742144; l=2662; i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id; bh=UZK+i8p/CNPfHLt8Mk2BsBISLw97recIVNrtzpulGWs=; b=I2VV7JlMyhcGJkCIjc/NlH/o7POr83aPjN3c+htVlrhxoHABnh2Ue1pf+4lkG+XDMmHnUl8rQ i0f9ctCuievBYGDG8uT3BWyNASZOjbfjlVjw3dKqmChTMXwbxIsbAPs
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519; pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RHjyEJbm7kaFIYZ1n-f5iLq7PdgxLEVf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX3+dzlxaDo9XX
 4FcUDyneVJxUZjM5gI2h3K1Rjn68yltohW/TtwqkxN6DrwBmP6YaPVAcDJjhXfUItywRsNcu5/3
 sPsB+qLX+OKofCn2PSosqZtYPw9qke1wdbXzbV7hxnh0hiv9oogVhKRZIpqql2alRwifyw5WBqN
 DoOBHS5YLZvSBKeTTfxKCLObUJqd8/isJ9JVsEE0Zj7SdrRB3l4e7G0R3H0JWChzJXT3yYFgjS9
 gf+L2to3D8FEjAgQnc+qMkYIhN+0KomvclrfkUd+vrWtnsK7XgORSNNPc7PqmzCSXY2M74nP7HR
 RjTE67BDS0jN9vKPfRTG28T4ZEKlG8KaGXv22ef0+9irELiw+2h1LGLD/jHZEjFvtrhuyORbchQ
 vcE2sk0qWKbbSABzejSgOMACGPw7WzEVriAISTTA789eoBBH2xIrAOT4KklGTekl8nK5sXH85Mi
 1Ov2NdSLESjeRiGbBoQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX7Y5ogvm6pPUt
 x8HR4ODyfC+5FtdJrpKfhkz9R5RyVSZ7ZEQ661Iu6xsDyTVfLQ0HQCjBfQg/TushvfM04A8fpAu
 VyjFlr1IZO7SFjD2MILDrL1Py3TClgk=
X-Authority-Analysis: v=2.4 cv=O9UJeh9W c=1 sm=1 tr=0 ts=6a427e22 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=a95-bzEMD9sxZBs1_CcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: RHjyEJbm7kaFIYZ1n-f5iLq7PdgxLEVf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115139-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: B33DB6DC0D5

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

msm_dp_display_disable() currently mixes stream-level shutdown
(disable VSC SDP, off pixel clk, clear power_on) with link-level
teardown (PSM config when sink_count==0, off_link, PHY re-init or
host PHY exit).

For DP MST the same link is shared across multiple streams, so
disabling one stream must not tear down the link. Move the
link-level steps into msm_dp_display_unprepare() so that
display_disable() handles only the per-stream sequence, mirroring
the split already present on the prepare path
(display_prepare_link vs display_set_mode / display_enable).

SST behaviour is unchanged: atomic_post_disable() still calls
display_disable() followed by display_unprepare() in the same
order, and the cached dp->panel used inside unprepare is the same
panel that was previously passed in.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1af56c84b82e..1680a67284a7 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -731,18 +731,6 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp,
 
 	msm_dp_ctrl_off_pixel_clk(dp->ctrl, msm_dp_panel->stream_id);
 
-	/* dongle is still connected but sinks are disconnected */
-	if (dp->link->sink_count == 0)
-		msm_dp_link_psm_config(dp->link, &msm_dp_panel->link_info, true);
-
-	msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
-
-	if (dp->link->sink_count == 0)
-		/* re-init the PHY so that we can listen to Dongle disconnect */
-		msm_dp_ctrl_reinit_phy(dp->ctrl);
-	else
-		msm_dp_display_host_phy_exit(dp);
-
 	msm_dp_display->power_on = false;
 
 	drm_dbg_dp(dp->drm_dev, "sink count: %d\n", dp->link->sink_count);
@@ -1533,6 +1521,18 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
+	/* dongle is still connected but sinks are disconnected */
+	if (dp->link->sink_count == 0)
+		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
+
+	msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
+
+	if (dp->link->sink_count == 0)
+		/* re-init the PHY so that we can listen to Dongle disconnect */
+		msm_dp_ctrl_reinit_phy(dp->ctrl);
+	else
+		msm_dp_display_host_phy_exit(dp);
+
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
 
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);

-- 
2.43.0


