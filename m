Return-Path: <linux-arm-msm+bounces-112100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ceUnNSrjJ2pN4AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:55:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8013D65E982
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:55:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bS8dsvnG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TH+EbwcD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112100-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112100-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 27AA730C4241
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B04A93DE43D;
	Tue,  9 Jun 2026 09:47:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B7B3EFD28
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:47:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998421; cv=none; b=ibBNbpiwUflIhc8hFMF3kvxZ7zEUJxDpWMmTbX09XWMyiSggmHGdOIgrOMg7M3et437B7VJjrLnWfA7wulCx04dOrvwLITD/my+NP0R7B8lnHunbMCqlTBPkrxsUprtWjP3EIHR1eoQ5MphcGqOZUDAy59n2wNZfgfa7WIZ16gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998421; c=relaxed/simple;
	bh=iMxmvh12Ai7OvQmfN+ngrN462Gqpte4TcdsH7pCGquA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FqgQuy1BqfXDKxk0m7VNanVYJ+1rrZbRXwozspdi+XjIt+p8znMyhT8wjw1UZk8CN5IdJMKDJ0zE4uiB6K0u0HEnHaqGxSfejnV113XlduMCQhBxlw+wctryqAoMxU/2EC/7GR78iVQDHf9YtubW4Jywdp262YxHkJifiBNU4hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bS8dsvnG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TH+EbwcD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rfZA1958684
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CP5bG4WCek6MUN3KRDCTosp+Uu7SRi1xM31/3kH0myc=; b=bS8dsvnGYp8BTe+Y
	hIbR9TZ3sauMMQDPvIwEYiYYGw+1D0M2q6jHZnkFdhSC1hPMytsRU+mHtGNVVFpG
	9hzuwYysa8kfpMwcrwATCg14S0xKrW7QKaRZJv21JwEr+kjY0TY0XTkTiv2IKnu+
	k/l1Og4Qg3IDeTFlPOXWLDJoC+sLPV6DOCWq2OGhbICF0Q6rZyVOIth+rVYvhVL5
	ZfWgmCOQnVx2IjP3GQKUD3knqTPfJBG5JjmqIVVEE5ZusxWdXkF51N35esd5eJNh
	yQhjA4/PsugeeweSQQkBCS8rQi0zJCM8ubu0G7d/5XcN3S87wd77LqSjUyXgdVOd
	+aKkPQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdds8vgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:46:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91574ad681eso788314085a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780998419; x=1781603219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CP5bG4WCek6MUN3KRDCTosp+Uu7SRi1xM31/3kH0myc=;
        b=TH+EbwcDEdRGL8myzFU+YjCcLhHA04IsonluOLh3Ky/JE6xo9eX9wpLf8NNwZ8W9mF
         +VRTfN324E43sqqt1PYm5JiWPPTt6XfiDmrUChzA7g4BGiVgaDoB+K5hiY3RIOVBbu3D
         Cd/feV9rrCBjJKzPeEawewetPV4KhApu5plir66lhujuOGIwUCcoY7WXzsCvawAcKYdV
         OtLUu9IMb6iVnx9NH/BU4t9O0KYAl83Hlab0/eo8pYiysKaQPFXmefl9b5OAT3BGKEf8
         HobOB+kPIcczUlnpd9+oXphHbY0cCAKqdcxACYb2l5LjO3bVoAgewiRQ8lsETYreYCCL
         9hyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998419; x=1781603219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CP5bG4WCek6MUN3KRDCTosp+Uu7SRi1xM31/3kH0myc=;
        b=MWSgorVi+OOz/sdjvpjsCqzI188FH08EMFJzSiXvYuqsF9YVsIaqfrz9DEWFQR1qtb
         mQrUHvGdSkyb6Uf6xCUOqr6Aw/32DBqoSO3z1FFlnh2YdgzYk1El63l5QSyeG2JnTr85
         2YjTdTc6UM8+Fwi4QzD/NN8XGmZnxcA3Am+0fmlys5JMtgOPF73/zhe8G94c+aJTM7aI
         4toIhueJL8ewVkLFFsspcZJmVl2GyAH2FQFyg75Mjoa9fra59AhindxJx4MEuq28f7vL
         Ril2HzH+peh4IcbTEphoedrKIjRZG3WmVCegvOBwYqA0jWYt/4wFpONaTLiTal2NPWh2
         nIxQ==
X-Gm-Message-State: AOJu0YwEQRmuB2iisWGz9q1MGSbWuQ1h9YsQvt5Vyx2HaVEgzwUYHcSO
	TJ239kjGA9n4GtIEczNmayPQV5lUlNe7yy7DmanDQjVPncc3uFcA3r/a9rzAozdbVn5cluSHUpo
	n3vozGyDBLWnTOaDk2g/fQ22EnRi+aURIwuWVKnzynvWFlEUh0QHmR1l+PJkkBtXl9UOG
X-Gm-Gg: Acq92OHu7PrWDpSonPQZCQDqUidVmS6xxvqegiBUR/uJHVrwgOkk9oZM2TlvvRQn4t2
	+wQ0L51VIp6EcqTx1/RFgYa+AGOJFVT01S1LI8mz3H5dyO78eSROVHPVDn1GWgl+1jPszpShcQY
	FATJJLjVEEeBXdnDbuvtZRGtBzP6ugLIGM0R2rN8AvBnj2sobLUhUM48sExcHE9bhlUR2sJ2HvY
	eFO6QFcb2pBSTwEIuHlD0uBReR4Wwm9B2oxgIA83SEIXM1QIglcrPhsU3WBHVdZ9NFWL3qonhS9
	MI5MPLehrmKFdeie8XvyM10GFNim0xxDGGwMO2AK1H4F4J5Nwz78bQRwvC1WgD/xjHnFJWz2gbq
	d25z6LouyrwSoJLFfjo3W6Xz5nUHHWQ2NvXWsB+s4gS0i8dggyoKU/AvM4qNkmVbz5wIGZrxlkg
	4Y/63hvzwkmZyo2HUXsQ==
X-Received: by 2002:a05:620a:4508:b0:915:d10e:8c4f with SMTP id af79cd13be357-915d10e8f57mr1444066185a.53.1780998418557;
        Tue, 09 Jun 2026 02:46:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4508:b0:915:d10e:8c4f with SMTP id af79cd13be357-915d10e8f57mr1444063585a.53.1780998418082;
        Tue, 09 Jun 2026 02:46:58 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a00afafsm2047489485a.2.2026.06.09.02.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:46:57 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 17:46:26 +0800
Subject: [PATCH v7 04/15] drm/msm/dp: split msm_dp_ctrl_config_ctrl() into
 link parts and stream parts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-dp_mstclean-v7-4-ea04113e8233@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780998392; l=3833;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=iMxmvh12Ai7OvQmfN+ngrN462Gqpte4TcdsH7pCGquA=;
 b=P4YjPxAtov+3XhLaRO1sHEGTtCxAfU1L5ZurDw0/+zRJss+yCB2WdkxIHiQTrc0fW7J919oJ9
 v/1yQ8riTLxDek0sJx68eogrhNhBOkA6a8Uph4142mXJ1iOIy7E6TeC
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: f3axOWKulWZDpRgZfuDUIP9mziAqsPqe
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a27e113 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=N4WGanfLxQUAwF0MUGsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: f3axOWKulWZDpRgZfuDUIP9mziAqsPqe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5MCBTYWx0ZWRfX6jthuxhX33N3
 YeglTY72TgfbHhQfn7Zxm6zn+PE/oJLBty/uL7qUw86Oy9+QUbICZb35aATM8UfP6kgdn3dEM1P
 N8IhdZ6SGDoss6KRiGpteEUFKt4frYbjDBfL0hd2B7QJbfPLKU7frNxx4iztzCAOs2WdFw2RGT8
 Sy6ceU6Ywu7+MVJrmDZwhRxs2DPJsjOH3F+FF2aJjn8Gza2kVOTq2AMeigSuWV0y0yjAaTIDdmX
 jSHs2HoCTAM/bJ2biO6j/3Q82PMEZBQLM2OM2tqvlebeFYhIbz6zCW0ZGz+/ekuTfSZI7INozm0
 kOYhmZG9dqmHeu9g6Hj3hDITSh0/aPtyNjv3kMLCx6raPK+Oq7Gy5XAqAo6ZwAODolfSD+9XqWp
 Ga8Yme4CrIrUmZh1RLIcjynGxFnkTtBNvDCRQUuwl8yWb6RP5wdnI+u/sz+qTniOLDu84tlVPi3
 qgLppS+sFl6P3Gkx6Nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090090
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
	TAGGED_FROM(0.00)[bounces-112100-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
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
X-Rspamd-Queue-Id: 8013D65E982

The DP_CONFIGURATION_CTRL register contains both link-level and
stream-specific fields. Currently, msm_dp_ctrl_config_ctrl() configures
all of them together. Separate the configuration into link parts and
stream parts to support MST.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 46 +++++++++++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 86ef8c89ad44..ed2ba47881fd 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -388,26 +388,44 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
 	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
 }
 
-static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
+					    struct msm_dp_panel *msm_dp_panel)
 {
 	u32 config = 0, tbd;
+
+	/*
+	 * RMW: Called from atomic_enable(). Serialized by the DRM atomic framework.
+	 */
+	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
+
+	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
+		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
+
+	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
+					      msm_dp_panel->msm_dp_mode.bpp);
+
+	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
+
+	if (msm_dp_panel->psr_cap.version)
+		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
+
+	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
+
+	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
+}
+
+static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)
+{
+	u32 config = 0;
 	const u8 *dpcd = ctrl->panel->dpcd;
 
 	/* Default-> LSCLK DIV: 1/4 LCLK  */
 	config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
 
-	if (ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
-		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
-
 	/* Scrambler reset enable */
 	if (drm_dp_alternate_scrambler_reset_cap(dpcd))
 		config |= DP_CONFIGURATION_CTRL_ASSR;
 
-	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
-			ctrl->panel->msm_dp_mode.bpp);
-
-	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
-
 	/* Num of Lanes */
 	config |= ((ctrl->link->link_params.num_lanes - 1)
 			<< DP_CONFIGURATION_CTRL_NUM_OF_LANES_SHIFT);
@@ -421,10 +439,7 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
 	config |= DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN;
 	config |= DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK;
 
-	if (ctrl->panel->psr_cap.version)
-		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
-
-	drm_dbg_dp(ctrl->drm_dev, "DP_CONFIGURATION_CTRL=0x%x\n", config);
+	drm_dbg_dp(ctrl->drm_dev, "link DP_CONFIGURATION_CTRL=0x%x\n", config);
 
 	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
 }
@@ -450,7 +465,8 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 	msm_dp_ctrl_lane_mapping(ctrl);
 	msm_dp_setup_peripheral_flush(ctrl);
 
-	msm_dp_ctrl_config_ctrl(ctrl);
+	msm_dp_ctrl_config_ctrl_link(ctrl);
+	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
 
 	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link, ctrl->panel->msm_dp_mode.bpp);
 	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
@@ -1628,7 +1644,7 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 	u8 assr;
 	struct msm_dp_link_info link_info = {0};
 
-	msm_dp_ctrl_config_ctrl(ctrl);
+	msm_dp_ctrl_config_ctrl_link(ctrl);
 
 	link_info.num_lanes = ctrl->link->link_params.num_lanes;
 	link_info.rate = ctrl->link->link_params.rate;

-- 
2.43.0


