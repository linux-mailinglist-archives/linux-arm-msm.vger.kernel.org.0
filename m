Return-Path: <linux-arm-msm+bounces-102651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PAqGx7G2GkuiAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:42:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1344A3D517F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:42:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0F3F6304D66D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A64236826C;
	Fri, 10 Apr 2026 09:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cu0gNcdw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XVMhJBOf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4D73C3C19
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813776; cv=none; b=i3WEL1Kdo7mMOO/+VG9kS1VJQ1wEJJ55aSu0MdutPjuz+snnPjvp6IncoYOyo9++hHeV3wyhCXhl2jLnUwgngTkuRpwNGOvTOWpVeHkSXN1Wh4IKDQ6gUfDj60/PgVRCvfcLNT8c+ohx6V8GW/vYTLe1YwlTivdDrr7wV48vSRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813776; c=relaxed/simple;
	bh=u2wyhK5Qo/+5QUfcOJSc3YlFKqTmBPG3chh6feU2iII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hxu0xQJJp6NUhUp3oa4Im9YMaLygOKmv9UUeaFRZafnUgSuWwlWjyabjFcb7wmuzUS+EsNBlEgylR0ns5Sk8U2KnmjgkOiIcd2WPXtj+cqJosfGBsS51QuFkJbVv2THTPB/n/QLTmrH9iwnZmY72294vI1DbdoPffav3cBETGFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cu0gNcdw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XVMhJBOf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5oXAb4148794
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:36:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CThD/5AMeBM6JcRkP/l6fYlNQZ0JmRoS9eNyVFEqViA=; b=cu0gNcdwqRd/2VRI
	eTicJkQ9g7dB9azYcylCw7LxiilyeyXGeBMhBtgfHyTT3CJGqI8iBIdpzEENG3aL
	Ui0fthYpi959ypFFX4aaiAQatH/PSvHX6dn2F80fb4LbkE3+zndpQX6qb7Wx2Lq/
	737TmoZlzA2a+A8bSZ+WCkUOnbkRUB/tlxNw8elG9Eos4htHh8SBecN4+PPeRoVP
	usuv8IHNCVSw1Cu9lHcvXJjevQhBNVZWiYc4gh5jnNJbv2TtBv3WNIjGVx3RWuFz
	s8ol465ptcz5oTWmdJVAu3Bl3681AFMK3F9ms53BLK6F+OKtiJjUYiVmXqXR0cld
	cxC0DA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudggsry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:36:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8a0ef4a7021so29513566d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813773; x=1776418573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CThD/5AMeBM6JcRkP/l6fYlNQZ0JmRoS9eNyVFEqViA=;
        b=XVMhJBOf/z55SYz+Zjb/tTfMuO1wG6mNLBKgVDYQKmi0oUbK3wKq9i0jCdbduh0vA4
         +EfOrUhFr1epx7+4/kSNdaYi/vcLAMsw61n1Iy2sbxVihXBiPVPbTA8X+kxxNEqo04d4
         20Usaa1/FPObMRwqrjZWUxUhe5as1BL9siCcra5PeQoZyV6y+sXxjxBz3ofpQaUmJ2lA
         glK28+tdZzGxjKZvn4HTFNZoeI3dGdkgAx+5ZQN681af+cvTzPz6tVhgwEbPv2qy/QD3
         GbW+tGj5K2S75oPE7GJh8+E0mUtOYdoEpETWONdRBPFFH7tgXTH/3r2ca7Oz1dtBHkV/
         En4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813773; x=1776418573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CThD/5AMeBM6JcRkP/l6fYlNQZ0JmRoS9eNyVFEqViA=;
        b=IFuLlBRxmThfaDpMiqD62q9iQrr2iBdOvuTrZQu6hDr1g2ZHB+6Z/gau1HiIwmkdZ3
         EApZpqAcGcg58feH56lhLI+wNBt4GQesnsbJewdPJ3hCINbIdO58Z6FVo8FL+yY9NG4G
         +Ufg3ZFcGszEmPLpeeKAF8FH3O1ueShgjleZNLOJDZSoQTZUWoAzFSwx10b1uzAZtZu/
         Xf3nbfkLJ3CnziU8RrEksKlX6rwzMAt1dcqMrkFiuG3ZgcryFa4a1Vv1mawb8UV/6iT3
         GHTocZCxyC16PV0jFo7UiSqpvcwc9sJ8cojnMPchq0xG3nPG+iEOIe3eEEwTWyKXOFTc
         ks9w==
X-Gm-Message-State: AOJu0YzsFKJH9IvLY/Xl85IFKMIX5ZANHmtg5JQnmXXF6Si1LWDFkFXw
	WOgUKrzW+oko8CXyGAAauzUI7TiAzZGo4aefRCDmNHjit1LoDs4V79E1pCgeOtxEDbli5Korxsb
	J2Zew64YVMEFEUDA8oULoyzxmhiEThnTKblLbJMVByTyzfZ8qPagSJMRxi4d8eQOkfekuGqxb01
	QXYDoLhw==
X-Gm-Gg: AeBDievcJhDASCwj1YvxcOlWMvLNSOriePDFYr7XmFvlfMI1mWzGjJKPvIvOg9/adD5
	9nDX2GpC0P8wK12KHjDy+ezIkbu1RBKFF/b9pd+tz5OTmRTERtio3QBjaEXre7u/4I03INmJAVO
	vbsnNnH9recK4k3K+3et+flcGWmJ0HrW/Ftk8tcbauQJ1L1mGwwsTljs+0kHx/Kz61rJWvm2q1v
	vtGQf+K1rzzLiVkDHE5qYX6sN29oYH634VZHsCQqDkhaLnWBpr6uR2rkqrlIjTaXhbG2aj7epAU
	1CiX/J7LHxM/6G0zjeIx+NZHJKr3j8crTGIEpB2+Nl+aJtXbPWki+wN9ofHMTV/SxkDe9Bof+Fo
	DZ4w7wi7IwyZO502dabMiv3mxONx1Ky5o/VyxLazDPyPJxsvtggaYgj32W0F76OWh6TGLWjwsxp
	YlW+siilM=
X-Received: by 2002:a05:6214:8008:b0:8a1:8f74:3eab with SMTP id 6a1803df08f44-8ac860c7db2mr29576886d6.9.1775813773232;
        Fri, 10 Apr 2026 02:36:13 -0700 (PDT)
X-Received: by 2002:a05:6214:8008:b0:8a1:8f74:3eab with SMTP id 6a1803df08f44-8ac860c7db2mr29576486d6.9.1775813772779;
        Fri, 10 Apr 2026 02:36:12 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb135fsm19223386d6.38.2026.04.10.02.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:36:12 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:34:03 +0800
Subject: [PATCH v4 28/39] drm/msm/dp: Mark the SST bridge disconnected when
 mst is active
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-msm-dp-mst-v4-28-b20518dea8de@oss.qualcomm.com>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
In-Reply-To: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775813628; l=1012;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=k6iai2XwJqF9HQ6fP9coFSGKWj6p7U1qYefntORtujU=;
 b=NaLMEm4HX7teN+xR8vLnLQmdHzNB4iBVCT4BRua+7lyu7hyrqCu4EA4gyZD2p//WTkzyfzqrq
 faZfzcBRWTbDhW2PfQLVZaE7P1+RAiRVTB7Gf0ovZW6U6SkbA7Yzjjh
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: ltPeR-Sv0uy0zWyHCsOd28fmoelPQ9V9
X-Proofpoint-GUID: ltPeR-Sv0uy0zWyHCsOd28fmoelPQ9V9
X-Authority-Analysis: v=2.4 cv=H/brBeYi c=1 sm=1 tr=0 ts=69d8c48e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ao9NmXljvuVdf-BuN7wA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4OSBTYWx0ZWRfXyEuWG5g9XdUc
 /GxIgS2NOpgvUmNzqqARXH3p1foVmlcxeIcefEtQkzeleIjK+dmW/n19iI+QKovvytSwm+NGA4z
 Ehj5iLjNc9kIgXb3XInONFyQHuRypRHcJU+laJGFpNO1cJK2mhJGi9mPAKNNY7UiX0JzKlIw/oe
 +ED+30Vzb0seHdRJ2csiVMY9SH97/ZD8qnKgGoeclXl1VA/qaiucaugAjU20bZS8rCF287Baj1f
 FcCJsRG/tndP0UEj99sKF0FKhdH5WmDwcALpHpLUBFpJgIG9vXFwNkxmvH9+Ah+IRyv7rbl6wP/
 ghl26Vwxzcbamm4L5oWw34aYZkby6/aEOZZxpuMFBC3iI3V1oKTwPG2b1fdb7rDHHlEJLhUDKqL
 bToCERzOUfvnksrBpXH9xws3DrMSCmMrEt2a70/MN5nZlHZSCzmgKR417qjzC5EOzz95jnSmphP
 9EjB5kTdJkqPuUHyAJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102651-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1344A3D517F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

The bridge detect function is only applicable for SST. In MST mode,
connector detection is handled by MST bridges. This patch skips
detection for the SST bridge when MST is active.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e6ecbb3a688e..8ae690ce2b9f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -926,6 +926,9 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 
 	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
+	if (dp->mst_active)
+		return status;
+
 	mutex_lock(&priv->plugged_lock);
 	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
 	if (ret) {

-- 
2.43.0


