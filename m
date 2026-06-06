Return-Path: <linux-arm-msm+bounces-111496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6AsGDEUNJGp32QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:06:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E68164D51C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:06:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZuAAY2AJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PcRdxA5X;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111496-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111496-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 807BB300EF88
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 12:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C9F43976A0;
	Sat,  6 Jun 2026 12:05:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB5F3A168B
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 12:05:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780747548; cv=none; b=snOwXAqJSFwa/5+cRUou3rAUWXNbEAsPeZxmcjUZZobpJGmdQxQ4xGZspb6d0/NIj5lqSGY/W7aEBSIkP5ZrXhLAJpO0SQLPssFzYlOaoSX3CI7urtVnrv4XOgWoWSNbZnQTFiH0RyKImoQr1nIX4Ni4PXHZkTqSB+5i1Zj+WMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780747548; c=relaxed/simple;
	bh=zSMfT0DMwD/4+ok/8u9Mp2oYCqapDw71VhgCXriIqtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DSMF0IXfV93CXYwmJHBs39R8ybix70iU8NWmA2PZ1WUSzMbnF5TICtRK7zp1q3SkhW2zbdP3QyLq01/O3aDnVPHdfjW6CbHWWRsQDPaOFuuA9hSATipcT+4AswT52u+hmoK1EPx8qaxIlTqq7eNlL0DfOR9LvNgiLhxVDCggb6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZuAAY2AJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PcRdxA5X; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BDeXf1231111
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 12:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8HBzGlX6MFZLSmVg9ZtYUP
	IQ9RoPtWcjeoYSCL3J7w8=; b=ZuAAY2AJkDEQ1npBxasm+RFL8z01sBXgjTMNee
	LkjWMSn7xjaKheqZ3yyoGbQGbPBgeyXSLFFJ+MV51PKN52wtCMqjs5OdgdpxYN96
	5dzDC34h9+Uii1aYqYRe084OH5PTrTk2B2JlN8hxFSAYmd1eIF8w5i4ZSOzxynzk
	hM96JQBay47JXsMlWJ+gRSvfh7i4K1U3VmsWgW+6KjM6DWQ9tv/JNErVZGJJvyyT
	pJHiO4aVyvk8hNpyWkq6+t9DDDID3v8jRDY3tWoqo5knSi+zeSR5IYTFoAWYt2Yz
	pGrV1n6Rz7mmhOjJqGrzv2OW8i1sFQwIVHTpd308oRA3vY3w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgrsfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 12:05:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8cced8f230bso67908096d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 05:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780747545; x=1781352345; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8HBzGlX6MFZLSmVg9ZtYUPIQ9RoPtWcjeoYSCL3J7w8=;
        b=PcRdxA5XC0lSH0hNqfzNbwmFxI8alLSaT6KHhVT7gfssbfsSzYnntN86ouVrPh+Mxu
         1QFQgnF8BcMSS2a25J6etG5B2CyB9+tfy7CJCIpZPEoiqJUjh0iiXyhUS6zC/cRtiMb2
         93rLepVT7ve01pfElgDRkF/HGqhhy6o4RFZuRcSxFEKy7oqbLYGqDt1w+kolB9ZIhcyT
         8qzxbEkI+bu0eTIzJYIbpemMFEdnozmk+ltvoW0EVED+KiGlfknsh+TWGvQn4tWIkbXY
         YYu9NME5RreoeVMRpXt0zSHpQS/ddluNwM9k32Hxl+432pkv5M4YzqRSjhDJOM1KMsQ+
         ZiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780747545; x=1781352345;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8HBzGlX6MFZLSmVg9ZtYUPIQ9RoPtWcjeoYSCL3J7w8=;
        b=fsbsopeK58Rxc5x7PM1gblWV/kKuQt6ymOGLUSYjYRsEYrN4+EWR4kuVwpY2qZ9i+K
         N2CiQldc0D26C1iBSTwZm1IMToJ0E6K6Ybrz4DTdq8xhBm8ilQum1v4f1B5IUzQ2MbXv
         okI7QuAfOVpo+ire/yQeJLsRgtLM2KOOtUDIMsv7HF7t/nbiUD0ExkcoL2w6hwy5yxHJ
         PxuC+H4CGzOS75tcuh+FH8mywu7PwWv5v5ABU9FCqqi3N2IgVK9lL0VBg4Iozogd+Fsv
         JP6H7U2D+edytCDmcxknDxvTZz7+YH0le/op12qXP62NNWz6OyKXTkwG5KeFuOZmIYql
         9YKA==
X-Gm-Message-State: AOJu0YxbXHcIDydE4w3bk666+xn4F0QQppiyiVE0QfWkTU9OIDSh4R2W
	wRm3NBlX59eQz6duQ1+TP3mCsa4i91C3V33mOS7mMJd4CuQi9f5F6vQJ1g60lwGJW/qZx0VE+A3
	W/sbalqVfUT+mdvwLvdUZwHwxUH9HhXC3hyvf9pouUWfhVaAm7+T59v9SROZ5GrMTLJNt
X-Gm-Gg: Acq92OFOO0Nubb2CjL91eAMxp+TD+PH3y+oP13OQ3CxT0Xfbs894F5O4ADbONul+tdu
	Z2xHwMzYKl7XhWSJUmkheTFlJW47iijSgPwLGp2xL+vKtUSUTQslVJwvEob2fG9UgxoDRZcRmvc
	8/oizGHTPJEAO0Arw7PUlk9peXxqQuTeizoARRsfKqxkMmJ1fyuA9q7gtuSDLNnwe+2u11C69sk
	PDNjsVpxdOFef4vYE9Lo5jDBwLlai6mWYBFe5OgnoSYznrW9J2XCdDhh+D3YUJuJecHTq69/XXq
	hZLETefU3K+oKTRsqTz6ifHTi3WPYMjJJm3vZA8EPUCWiGI4wLBB7eP67rF9k//4jtYGMLxG8jY
	Ln9XYw/SWxoAev30/z5aQ+oXr45COchKtLUnbP2EmycqEpWp/pPoW/lsgWO/LZ/vExEKG7CFfy9
	IbHnx6bSof/ebyeUEkbQ==
X-Received: by 2002:a05:6214:6017:b0:8cc:cf1e:1fde with SMTP id 6a1803df08f44-8cee611fb96mr123871536d6.26.1780747544982;
        Sat, 06 Jun 2026 05:05:44 -0700 (PDT)
X-Received: by 2002:a05:6214:6017:b0:8cc:cf1e:1fde with SMTP id 6a1803df08f44-8cee611fb96mr123870846d6.26.1780747544603;
        Sat, 06 Jun 2026 05:05:44 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccdcc968sm113138306d6.22.2026.06.06.05.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 05:05:44 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Sat, 06 Jun 2026 20:05:29 +0800
Subject: [PATCH] drm/msm/dp: Introduce poll_hpd_irq callback for MST
 sideband handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260606-mst_irq-v1-1-98bd86445c03@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAgNJGoC/0XMTQrDIBCG4asE1xX8V7xKCUXN2LowSTUNhZC71
 ySLMqt3+Hg2VKEkqMh2GyqwppqmsQW9dSi83PgEnIbWiBGmSDuc6/JI5Y3FIBRoRrl2DrX1XCC
 m7ynd+6sLvD8NXK7n37PdqQlKmpbxMB8o5pJy4hUYb4RdxWF6VwGHKee02I5DJMZ4EqTWzKmop
 eICpHCOiyhjII6FZgbU7/sPKZqTztcAAAA=
X-Change-ID: 20260606-mst_irq-4d46e72137aa
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780747540; l=6713;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=zSMfT0DMwD/4+ok/8u9Mp2oYCqapDw71VhgCXriIqtk=;
 b=fMY4OsRWOqrHDWz1/ZrLJ4mxxNmK+ADiU5kpLHNfGmZTvYefcAynCxtc8po+CSN/uZjy3/sPB
 BUHi+56B/eNASfrFei8sQsFj4DzA5guK5BFhWh0yiMf3JyUbZTUoLaz
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a240d1a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=MOQejHObSoPVBmRpUXQA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: xdkWyDZmMfz1-WVV7KrrNQu0RlCYF1ys
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExOSBTYWx0ZWRfX2ziDkB/zkGFE
 2mh82tDZP9KgSSkXmMMb4iKp2ncSK4RRiSyHawDBdbbcL8S6mOdADgjI2vnSrcih5rcSy7iHUS0
 KJf8FqNXVRvFB3GduRFJezHMbxn1zSIX/f6W2ty2ydswOU/4FJitBbX4Ra4OUbECykk9vrDuQbp
 kdYs2bYkIHSh7nC7whuBGW+CR1W+xPsoWFcuQ5TLuU0dTWJEOHs2Q4Exi00Tq2Fpd9mXuKE4sNz
 Ql8nMHe7vzOnJVDZyy9b9l7564UqVyHdhWLgU4JKvOam+i4v8jD6CE0+UsoY9HlOF2XKwmG9ZrQ
 LTMKE2JJFUg+n6pslNw6Ekuh/IBX7BY4iZl4FvTl3V7RlK1hcIt55KR7ZiC4sDEiMV1hcuTEpsw
 BUdEjFs4nbaOJUZqGUp2bZ1jzqnagNd+WnIKH1fUVzMAE60BlPqOT2lXz1iUu60K/ukdRH3VzGZ
 F8iplfKFCOt+/6Wd1tg==
X-Proofpoint-ORIG-GUID: xdkWyDZmMfz1-WVV7KrrNQu0RlCYF1ys
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060119
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
	TAGGED_FROM(0.00)[bounces-111496-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
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
X-Rspamd-Queue-Id: 7E68164D51C

On RB8 hardware, after drm_dp_add_payload_part2() completes, the
downstream MST dongle has a high probability of silently dropping the
short-pulse IRQ at specific timing windows.

Implement the .poll_hpd_irq topology callback so that the DRM MST core can
proactively poll for unhandled sideband events whenever it suspects a
missed IRQ.

Note: The new MST series will integrate this change into the introduce MST
IRQ patch

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index c8623849c001..8cc44dcc37cd 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -60,6 +60,8 @@ struct msm_dp_mst {
 	u32 max_streams;
 	/* Protects MST bridge enable/disable handling. */
 	struct mutex mst_lock;
+	/* Serializes HPD IRQ handling between IRQ handler and poll_hpd_irq. */
+	struct mutex hpd_irq_lock;
 };
 
 static struct drm_private_state *msm_dp_mst_duplicate_bridge_state(struct drm_private_obj *obj)
@@ -500,10 +502,12 @@ void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display)
 	unsigned int esi_res = DP_SINK_COUNT_ESI + 1;
 	bool handled;
 
+	mutex_lock(&mst->hpd_irq_lock);
+
 	rc = drm_dp_dpcd_read_data(mst->dp_aux, DP_SINK_COUNT_ESI, esi, 4);
 	if (rc < 0) {
 		DRM_ERROR("DPCD sink status read failed, rlen=%d\n", rc);
-		return;
+		goto out_unlock;
 	}
 
 	drm_dbg_dp(dp_display->drm_dev, "MST irq: esi1[0x%x] esi2[0x%x] esi3[%x]\n",
@@ -516,12 +520,15 @@ void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display)
 		rc = drm_dp_dpcd_write_byte(mst->dp_aux, esi_res, ack[1]);
 		if (rc < 0) {
 			DRM_ERROR("DPCD esi_res failed. rc=%d\n", rc);
-			return;
+			goto out_unlock;
 		}
 
 		drm_dp_mst_hpd_irq_send_new_request(&mst->mst_mgr);
 	}
 	drm_dbg_dp(dp_display->drm_dev, "MST display hpd_irq handled:%d rc:%d\n", handled, rc);
+
+out_unlock:
+	mutex_unlock(&mst->hpd_irq_lock);
 }
 
 /* DP MST Connector OPs */
@@ -749,8 +756,16 @@ msm_dp_mst_add_connector(struct drm_dp_mst_topology_mgr *mgr,
 	return connector;
 }
 
+static void msm_dp_mst_poll_hpd_irq(struct drm_dp_mst_topology_mgr *mgr)
+{
+	struct msm_dp_mst *mst = container_of(mgr, struct msm_dp_mst, mst_mgr);
+
+	msm_dp_mst_display_hpd_irq(mst->msm_dp);
+}
+
 static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
 	.add_connector = msm_dp_mst_add_connector,
+	.poll_hpd_irq  = msm_dp_mst_poll_hpd_irq,
 };
 
 int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux)
@@ -791,5 +806,6 @@ int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_au
 	dp_display->msm_dp_mst = msm_dp_mst;
 
 	mutex_init(&msm_dp_mst->mst_lock);
+	mutex_init(&msm_dp_mst->hpd_irq_lock);
 	return ret;
 }

---
base-commit: 3ef088b0c5772a6f75634e54aa34f5fc0a2c041c
change-id: 20260606-mst_irq-4d46e72137aa
prerequisite-change-id: 20260410-msm-dp-mst-35130b6e8b84:v4
prerequisite-patch-id: 8b3f7f40025e7a10c4646435e9cfec4f9e275871
prerequisite-patch-id: 017d8e6efd9c8f120d0a7dd89b3e6c358fdc2126
prerequisite-patch-id: 010d0a4f1a67dcbcd29ff183e8bcb0d043e2c26d
prerequisite-patch-id: 547db98962f20218380e966b976aede824ff8433
prerequisite-patch-id: 1867c344ef6ead1034523ba65d2640f9ad0606cd
prerequisite-patch-id: a58ebaf429385c622869c83e83ce7ffdfe9ea27e
prerequisite-patch-id: d0f570e57559248ba6ca733f96fdb02af29f3055
prerequisite-patch-id: 44d390f5319068ad534c4be698dd8dba99c0bfd1
prerequisite-patch-id: 85438690573583cf62065f43531dbb4e221e9dd0
prerequisite-patch-id: b37db0f0b10f16ed45ab056aa87f2275bb02df94
prerequisite-patch-id: dcccd204ee8a979328719d41334453474bcfdf98
prerequisite-patch-id: db07c3aa80a597c91ae2329bc677bfd72b63716a
prerequisite-patch-id: 9778cc1ab60a0870a74d58ff220bb01011fdf1c0
prerequisite-patch-id: 95692a605647e51bdaf8d5b2e61635a6978121f0
prerequisite-patch-id: af51d259753df3795c9fe16bc1f8f98d0f525bd5
prerequisite-patch-id: 68f5e67439fb83ea39fd82dd8559a20c99e56b6e
prerequisite-patch-id: be0f4b80697df7224c80362b161b8a9f0a542184
prerequisite-patch-id: 0af9e48f1e0b698557303ada9aeb226e5b7f7561
prerequisite-patch-id: 3887553893357c1ffbda99eb010801bc2166cbad
prerequisite-patch-id: 3ce7fe5264dcef7ff752837c525791de84f2669c
prerequisite-patch-id: 3e635f008f9b56823101abd9253905f078fcb3b5
prerequisite-patch-id: e39e0dc124ed043c7a419610ebe03ad105da27db
prerequisite-patch-id: 85bca44976ae5e7f2f2aaff91478dce62c65a9b0
prerequisite-patch-id: 4f87805ca60f2c816cb8e20eb1bcde5f1ab1f809
prerequisite-patch-id: 755afef095a10fc5fb6d5946cb9af5026cc3f34f
prerequisite-patch-id: ee83dcca3c614dda1073ee42a07c48d9f8424e5d
prerequisite-patch-id: 68b1b8605e582f6ba826bbec74eea643e7eb7116
prerequisite-patch-id: ab8fc659c8805c19ed0d97ababf47a98efe17b6a
prerequisite-patch-id: 8d84e97e9abb207e151fa3437d57dd3261e80413
prerequisite-patch-id: 27038c091f1176d8ab9b28551eca3fa4d60964f2
prerequisite-patch-id: cd061c6c74c5ef1326d91b8bcac2ab1f0afc025d
prerequisite-patch-id: 68aa5463159f226f33ad4d59b38779cbcb65a3ce
prerequisite-patch-id: a6b78895c4b94c5508312028e0f6bc97b331821e
prerequisite-patch-id: 52f00ae0a5c7fdca8c8d026be2ad4078c229691a
prerequisite-patch-id: 4cf62cd1cf74ec67c8d3f3d0857c522d24f87cd5
prerequisite-patch-id: 59a643104d4d88f5f7513b026c3743873af89c51
prerequisite-patch-id: 81cb1cae4c4563a2cb96327a3d4e0bd18ea5a8f5
prerequisite-patch-id: c5ea571615b6728f3622104e726f62f383c6e607
prerequisite-patch-id: 7dc0efb1bafa6752af3ed46c99b34bacb14388bc
prerequisite-patch-id: e84e884e747390a7b7a0f1481fae91ac5a8809da
prerequisite-patch-id: 56d282f6950ea9b3c6737da0e2ca78ebde8b199a
prerequisite-patch-id: c19b234de6e7c0f505148386f201e653da1052c3
prerequisite-patch-id: 7859b691e9019d31d167adb10cbad3e39af33489
prerequisite-patch-id: 5685ad34e365343c03d13fed0a20ed4a4afe7f7e
prerequisite-patch-id: a1722149fbd725c1b5d3a610b2532fe588461cc8
prerequisite-patch-id: 0e8158a6e2c8b54e308e0ea75de91f823aebe1bc
prerequisite-patch-id: e12fd2908ca33de1f1265fd40190eaad8637e569
prerequisite-patch-id: 1d8af90cb7cc47ba27877637262c4046927aba6c
prerequisite-patch-id: fe50641762421af252fabb41b97b496539798151
prerequisite-patch-id: 915722dd72c8d485c33068cbf2ad2a87c783bcf0
prerequisite-patch-id: 45c0b5cf8735cf36c4b484edecaf8214f8b5a020
prerequisite-patch-id: e593f6149a649effe3252f663249c70b41d8d684
prerequisite-patch-id: c8d444e2a6512f106da2675d4a42a92208d5c6f1
prerequisite-patch-id: 85222573dc5e5bdb529de33fe19185338c154fe2

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>


