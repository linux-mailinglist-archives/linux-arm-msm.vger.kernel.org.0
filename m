Return-Path: <linux-arm-msm+bounces-115094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CTmDKtByQmrn7QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:27:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 205FC6DB323
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:27:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Yej7WL7p;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="LB/L9AhS";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115094-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115094-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 42676303AF8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0746C416D06;
	Mon, 29 Jun 2026 13:17:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9B2413D9C
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739051; cv=none; b=IVd/Rn8QBCY/LUlUdS7C83FW29AighkMEhI8PdWR7ufgbO0hdG2Yhj+esSSGQb46Y/TQxqxMQ38bPNWazkd6pMCWAW+7RvcOtOm17YOL5DKYobBP3f+H+wyYmRr1N+wBUPC8UIBCy/Bb+U7RHFcX9ZH4HHHTny1qCdYQB9zm2rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739051; c=relaxed/simple;
	bh=yGUsWWBpVJZ20b67T+qLNgW8SIPwI+1q8jEal6Hcy5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YVUXKBrUygLvYdwT1/XAtFncNNRDBn9tLTmVuTvra3IpDXuEcdWgcz6jCGkBwd8QZT65n7Huw3kV/a9nCIzqamHAKfQr1XBNc55tajnggpPZr3CxjeuMiDeXBlF8vD3ixQB3xWWHPBohSyCC28740LE9LHxAJR/g73fi74v6jnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yej7WL7p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LB/L9AhS; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATKDT2656131
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jusjjSJwJFuIT3xoYc/Wmu34BYtQlfiUmQ5CnQZ7+xQ=; b=Yej7WL7p4t4mQCtb
	i1gbX7UFKfiVRKf6aRt6AWv22qYY2xkoa9qG9WOEwS2gOyKSFCfhXt5Ov84ojTql
	BiSv77B0t+0KXcwM1Iv5lU4jpmj73z1bykhQb1v6fLh9BRjE9wAKw+Agri1M84wI
	2ASvnHmwsEvwB+o5DgsDG8TiyuI3Sqp090b6yu4lI575F3lQArWEi5Hpt5zH465U
	6htM8LS7//mcZhXVZUJJ6ecmeoN+N38XrXJeAo++M/kHv3OtBUL2oPhHZP0RRSAc
	FQIINtkudbGacdBMw29XkU6vKEj0ozbm3BoeI3dO4s2hadmOx5jim+4ueHC8M6M2
	6mTtdA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3np7gyev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f08f19552aso8066256d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782739049; x=1783343849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jusjjSJwJFuIT3xoYc/Wmu34BYtQlfiUmQ5CnQZ7+xQ=;
        b=LB/L9AhS/AdBSDn5Q5fMB8jX4bbN/tKTsHg2JKfzMKr5XfOOj6EfGYjVHqqvancOVW
         dJCWmILtW70Yqj8npmVuMf3a4wDHoZ+gT7mTxByI4xaNwtANC6nmAzLYHX2RcnWHlNq0
         ggXosKCjkQs0kwywa+n2n4ziYyqKZA0Z9V57itoAuu5vjEDtH2Mp9i4DbE0f88/n1vWi
         +jTFzi5foNZ9XuAJI+fNx/xPZ0gB9CDwMmCm6oA9nQo8tL09n9lQCWu/HqAW+TWdP4vA
         vdtPg5BkfDJhtEHSXkJ6IHun7xpapSr8liqEkKPwFci3Ja7Ed81db2JpLboNkv5J3wZ5
         3hzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782739049; x=1783343849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jusjjSJwJFuIT3xoYc/Wmu34BYtQlfiUmQ5CnQZ7+xQ=;
        b=CN4DGooKiMFqAwn4n7NKyRDtDtP21bId2VNWKovd9owlOf7+yWJxAvb33wXxVTTvLt
         1zBO8jQxgTx0gZMNcZtS6ZjHveVsZbj27YTx6oXVLSBJoEIdrT67YZ5mFBp+ieLcrId1
         F87FBFBnoaLz6XeuV0W24Bug7J//0qPwdMnZKdW9lSHQh6J9yMev4y5ED/OvK5IH6e32
         Q5g9boER9mj+/CeEUVQy3iFp7z2E6F76qZEWPV7Bdq84eilT9R1InSqZXUcZMUgrx4sj
         OcnvRb5E6IZGSAqaG0YnGNYd16LDypR5TzsOmsThBF1mhW8dZNytANx68R3eFKLqsW1P
         NSzQ==
X-Gm-Message-State: AOJu0YyxxVF3QA4KrzE0ln8jjPeov10yLz5XVDchCKSUOMDBrT84Xwpn
	voGKpLThvS3Oxxnj6FJ/W2n5gKnhpoUcqokSW2kyRD0cceDtJGivZ4cJpo+JACbYFpn6uUrTBJI
	TaRr2HjBnaffxe/frUC9fB6OtTH+dYg5jCRMvicVHyffx0nf1FGqlyAcjj9MO7HMILyht
X-Gm-Gg: AfdE7clCPqgjQ26mNChJ0rJkTc9ltv849wL/ZrV4C1NehXlt+En9uVvHUZoavziGLvv
	+oGAjd12bxKFNNEh74OMY4sYOYTLrKNVxuSpuk0o6B+c7jxMgu2a4R4OKA0G2GLA6fERQY+FFU0
	Wlm4wSVvcXgbNNXIC0rvmVZxZWvdRDhmNk8G7xVtkaD37JDWY0Qg9yZUKiznjZAYWv02Q8g6fRT
	MQ2dz5BWSuJ9I7Ki2KMX8b6fzrHiTZsxWcEQQZAqucv3RY3CK7KL+U/5svqevhhSbAHWT49rRqM
	sgEc1TIlYnFCBUokwXHqAgni3NdVUTv5jDUyA3OZD1kzdvzhaTnOURXd3E5nDzZyCWxJiKPEoxv
	O5m8uitRPstGolJP3tzeME6SHrNSzu/PIsGr/xpxKgr28Qr7iBPi/O3UjmmQS9wufL4TArFWXrw
	==
X-Received: by 2002:a05:6214:268e:b0:8ee:9f8e:e910 with SMTP id 6a1803df08f44-8ee9f9e3296mr125452136d6.28.1782739048814;
        Mon, 29 Jun 2026 06:17:28 -0700 (PDT)
X-Received: by 2002:a05:6214:268e:b0:8ee:9f8e:e910 with SMTP id 6a1803df08f44-8ee9f9e3296mr125451146d6.28.1782739048081;
        Mon, 29 Jun 2026 06:17:28 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ef0f2b9df0sm56744616d6.13.2026.06.29.06.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:17:27 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:16:29 +0800
Subject: [PATCH v5 11/25] drm/msm/dp: move link-level teardown from
 display_disable to display_unprepare
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-msm-dp-mst-v5-11-1d882d9012f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782738985; l=2662;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=UZK+i8p/CNPfHLt8Mk2BsBISLw97recIVNrtzpulGWs=;
 b=OlhG2IwLeUdxLdXNkQe5yrC1xAoADYnbXOkAPtk7vqJVHIN7QRHbqCvVloFPSVBecBygAYN7S
 XDabucAoJDHCc9EXCCnlZ4aQqhFZUADKbFugFDS0kwmTGWkFbGS7vsf
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfXzKheHXRfuhfq
 yMIplaYF/ysoqH1GvQnkZugtmNJ4YyPPQvUDXGXCdDGzDZe99rfgLoG1tEwCXYf5FqvSP0ertcz
 vbYY0OZlJXGemJtHaeCOh7PyHE5oHG0PhofqfCBxd8xAOSao13+YEHtQNh1h9sYvUyU/zMmPPTP
 bdtCxlB0Y0AuXNufOgMWuAmVzgG9DYWHo/C9ipJ220920mUkc8FJvtM8ajNu1OyQnzE+nW6oGER
 70G9D8gZQFrgtetrmuArbmF7kuQLWOVXBGm4iGJooqKC56VOEgS/3p3QamdJllD3x9VtQ+fCqYF
 NCaQoaM8NZhfiRVjTLWBsGhc2HBy4+YuzjFrT8PXDHIdc/oYbpVGictBfvYbva2t80VvbOeYLx8
 RzvHBZF9hSdkw0KG6D9glYdDUMP/6A2S9MmxOJlyGmjk6tl1LkEpqwK1XNEI5JhG/sGNsj09tgR
 1/z6GlPCdSzyZMbWcqw==
X-Proofpoint-GUID: L3Y5TpdbgbHW346z7ZTWzBFv_F0Ez86k
X-Proofpoint-ORIG-GUID: L3Y5TpdbgbHW346z7ZTWzBFv_F0Ez86k
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfX+7CISC3IvjGq
 PJBiv0D/gjAD4aq+WCE9GpBPeb+Wh/g0rsnlZUO/bYmeG5vHw6lbdTnXS7AAOwTczngP1zWGu7l
 Row5v8Pl+bZKy+t+qhSETR01IdE136E=
X-Authority-Analysis: v=2.4 cv=OcWoyBTY c=1 sm=1 tr=0 ts=6a427069 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=a95-bzEMD9sxZBs1_CcA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115094-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 205FC6DB323

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


