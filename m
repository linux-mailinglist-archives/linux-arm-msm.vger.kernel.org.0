Return-Path: <linux-arm-msm+bounces-115098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LVP4LTp4Qmr17wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:50:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF6D6DB8CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:50:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="bC/qF17P";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WodnIJpP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115098-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115098-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBE3F319B6EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10C141B37F;
	Mon, 29 Jun 2026 13:17:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE87A41930D
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739070; cv=none; b=Rbw8ZPQC5MSPoSYMwnEzH1ebh4IyXyV7cghbDHqqjskWb2to8AcQPBWlKUawhc4cEaocO+8rCJyvcpzXf/9TSeGRwgHinXIpw4PwCI4++w64JpcssVSd4L9EJq5r+jSYfFxaC3yR2tnEuGICbLDg/421ncnEzGgYSOYjlBrtVE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739070; c=relaxed/simple;
	bh=9zOzLt5mkeQ+0BdAJthsd0BI2XytM0z6k1g5yXgmtSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PGq1kxoR7Nsg8UeorwHfT0At9NgewHOl38RICgACExoU1yR6BmcP2xQC29MKGqdv9AILQz/vvcsNVLRAqTt2O80KRRyuQNdDjRXy5JROy5izzm2RVLBIfB/QNPYojtXSoOhESIApM23zoHP3ecnnHRmDRF7LdX4rn34y/TCmEpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bC/qF17P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WodnIJpP; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASufJ2640822
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wMuCUkGM/5ZuNYaTfCD+8LGq0IU6gFC3uoV0LKcWT8I=; b=bC/qF17PTw/XzT+W
	EZ7+JqzDsgwoMCLJNYTKKov8r5pSbDmFGWiZZD3gQWyirznuZLowhp3dLjpaCo4A
	UPTr5Ouv+qjBal2wFK+B0xExMWaptuIF/d0KrAOxYH2dvwhyZZ3mlNz/1zhKmhqQ
	rDMYAwmst6fxskwtaN0GfXcVasP6rKY90ud/zgoRAnFtgA0/a8w6LjsYTct2xMxJ
	PDNSxpnvP+u7GxKs+vLhLbMYu75WvFa7+neyhpSXT/qF6M0A5hfqJMKfn6UByXSA
	YaijTS1hjaE9dEe/tlm8MisAMJ1tZTeUDwdmsVV6U+1gg6QnxozitlqVR+vFxJMx
	oVADxg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s14q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8eee7bce014so30749146d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782739068; x=1783343868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wMuCUkGM/5ZuNYaTfCD+8LGq0IU6gFC3uoV0LKcWT8I=;
        b=WodnIJpPUseJTgQT1h49zrSIRDfmuBZW8V5YjdntT63CdSCo7//3LbSp3gvFO0ISfF
         dQLF2xNUle4IEG3PZN0/67DiAgKjrnUIdODyRDTeqRq3Uicwwn+OZakMUB99H405dNJM
         eb284ZzmlkKpJeKLK9plsOJWIXXeGTasT2Tujx5ineTdv4I4HDn4vaUm0a0SsasZxcoG
         FzIZX3PVlOqiEb0Uk5jY7+24bgEQf2fjbyohagbYE5Nhp+FfVvojqtYJk9J6sVWixYEW
         d9uQ85VppyvTf8cx3cxL1/eTvkoibNl6DNjLYuNMIeciy/L9t3VATpOvdMqCxgizyTQt
         kKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782739068; x=1783343868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wMuCUkGM/5ZuNYaTfCD+8LGq0IU6gFC3uoV0LKcWT8I=;
        b=aWsy3M1TKOoQkrXFjSpl4VCpdMGvyjoeJGfCNVPCmupFCXOQFlHJFkmmJX+0c+hUuH
         VX/JX9mZ0/he+PEZsFDqzrF4Qi7Xqo4kQ7ibIzUqqKfNr6IHw1DynHKzysU3lKQJYw5a
         tVS9Kl1klLl54SAjcrSBRexAESFJYdqH69dO0bFrHltiQuoGxiZUOIr0wPmwks1lD5m3
         n1NYdCO1jxVezwpuJ3RQgmDuuglJNXSZRDknhWpRVw1ZNF1aMSoVhprj2/5sG5t/wF0O
         ELWl73TZ6pWgw8rJE7emHyER0+qgsbbSoJLopEn+0mPnpRC3fbEFva3CVWenF1jeKX/d
         waEQ==
X-Gm-Message-State: AOJu0YzleVGM1N89KlC5IKkQFdh2ckzpJNaMOCMm83yQ11zcWCNr5vhl
	6DFVmlxeDimjT/V3e6FYPEO53gsPhjN5qX87aDXuQ+BI0EV6uK3enHiPbLiD81at0iuOuH1KhRt
	G4KC1rcWExWOtMs2Ey1iO9wK4AUNOhBZ8hQfqEJXmEO/GWaIX91CWpgpoSTERcUW0U/cw
X-Gm-Gg: AfdE7cnCjk5bNj3Z0tIgebi8UzE0l+3oEs8MO9Nm9KFNuglzpNtwBImyazK29fLx4/n
	khlM1McZh1CqXbzzd8l7dDbbtWTpVhK0vl3qlzfO3Jpil8HDmzsypkjd5pnp/3qinOgZJ6KUnys
	KHM0oUKprxxloQv30OklZpz0HN9i4DIDwIzg9tc2xhessjJjHdEtk1KIWlYUjdnS8HAgOB2n+Jn
	lrNXZlt+Hbxz4TXkNdRBn54iZ8w3Bgf8zvu5ZA50cgC9nQg/9GamEYDj0cKERgcU/inq7k0CBH3
	i9OE0nAXl0IzjeZCIxaViYYyUB2KTcLN7jZuORcS2YMlUIyVOP7HuCG6XSRRLeGtsaf2UdTSGSl
	ByUfhOBZTxy0bz8YUI/ibEs/1IObeFb9ulQD7l0afxA/aDm9gUoxlmLP1L5aNwe2Jn5ezuzOcow
	==
X-Received: by 2002:a05:6214:19eb:b0:8f1:440c:7f81 with SMTP id 6a1803df08f44-8f156ef576amr13537306d6.4.1782739067887;
        Mon, 29 Jun 2026 06:17:47 -0700 (PDT)
X-Received: by 2002:a05:6214:19eb:b0:8f1:440c:7f81 with SMTP id 6a1803df08f44-8f156ef576amr13536466d6.4.1782739067159;
        Mon, 29 Jun 2026 06:17:47 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ef0f2b9df0sm56744616d6.13.2026.06.29.06.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:17:46 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:16:33 +0800
Subject: [PATCH v5 15/25] drm/msm/dp: add an API to initialize MST on sink
 side
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-msm-dp-mst-v5-15-1d882d9012f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782738985; l=3085;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=rWGVRQL4yrr/+OcPJZsE2NbhmKlJWDJ86JwhFSr0tHA=;
 b=xCIcIDG7pws1ClQd7PC3CwUlNQhBJI8jVvRfykcS3wrdmsxLhNMkla8CXIHQvrko+Rhx8J7Er
 4Yl+YOgG7DnBOTSoCycNmMHaLw4Rd6b++2BuFujbs/GrYqxTwhTsB3c
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExMCBTYWx0ZWRfX9JjLcP17TwOg
 RSay5oqAqqV7G6zbnwjdTXIRPmIDz2TcC+d4s0LaDEmplxZ148RlfIB9xCBUGwCWRDdVspndK7V
 xGx/44T3J2tuGwCgHhan2GfURZvlFvg=
X-Proofpoint-ORIG-GUID: fxEaF5Y-8fSXV-wh1L6CgmT_P9-0Z-45
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExMCBTYWx0ZWRfX/rWbwZ4H/s05
 aPvnQtXK1xilMCS+lX1JvEUQ5DLpffhbkTloga5Td4ArimSgiLI4s1XstMuKUFPpdH4uD84fzFO
 i6NHB49CovizOcbEwbZ7LvIathyUNBs9PNLE+B1mu6xOCTex3DXZFiDW5gkVTlJz5xHGj8g4fah
 FHO5gnWhQDjuno5BdXcTd/1FVTYcthBSISEgmvIY0XVdLRNTjYULAadezkx3Es1gvw0Rc18pkDk
 jwwCc8PJ/YLZi+DJFE8e9vslaeXuf6ujA2juMetX9EOKg/rtDApoucP/fEMBp5eAPmWrSSsEZJG
 P4sz8x3Yi5yg9mAqkf4axM7N22PRM9rozhn5d08+qMYq3WXjxYlP3Fm/TEXhmOz0VpeW5elYtuc
 EThC5B66A5kTefwqD+uRmSDIbQHKJLMzzPh3kZWAJEcagluh+0PyoPm0TjeJirkm6G9Yqkm27Kp
 yu51JEWEu7NwR7oU3zw==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a42707c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=vCCEq3Mv4WXTdc8uXsoA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: fxEaF5Y-8fSXV-wh1L6CgmT_P9-0Z-45
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290110
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
	TAGGED_FROM(0.00)[bounces-115098-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
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
X-Rspamd-Queue-Id: 3BF6D6DB8CA

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

If the DP controller is capable of supporting multiple streams
then initialize the DP sink in MST mode by programming the DP_MSTM_CTRL
DPCD register to enable MST mode.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 48 +++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5786e598a406..c3be656f10ee 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -14,6 +14,7 @@
 #include <linux/string_choices.h>
 #include <drm/display/drm_dp_aux_bus.h>
 #include <drm/display/drm_hdmi_audio_helper.h>
+#include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_edid.h>
 
 #include "msm_drv.h"
@@ -270,6 +271,31 @@ static int msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd
 	return lttpr_count;
 }
 
+static void msm_dp_display_mst_init(struct msm_dp_display_private *dp)
+{
+	u8 old_mstm_ctrl;
+	struct msm_dp *msm_dp = &dp->msm_dp_display;
+	int ret;
+
+	/* clear sink MST state */
+	drm_dp_dpcd_read_byte(dp->aux, DP_MSTM_CTRL, &old_mstm_ctrl);
+
+	ret = drm_dp_dpcd_write_byte(dp->aux, DP_MSTM_CTRL, 0);
+	if (ret < 0) {
+		DRM_ERROR("failed to clear DP_MSTM_CTRL, ret=%d\n", ret);
+		return;
+	}
+
+	ret = drm_dp_dpcd_write_byte(dp->aux, DP_MSTM_CTRL,
+				     DP_MST_EN | DP_UP_REQ_EN | DP_UPSTREAM_IS_SRC);
+	if (ret < 0) {
+		DRM_ERROR("sink MST enablement failed\n");
+		return;
+	}
+
+	msm_dp->mst_active = true;
+}
+
 static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 {
 	struct drm_connector *connector = dp->msm_dp_display.connector;
@@ -288,14 +314,19 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	if (rc)
 		goto end;
 
-	drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
-	drm_edid_connector_update(connector, drm_edid);
+	if (!(dp->max_stream > 1) || !drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd)) {
+		drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
+		drm_edid_connector_update(connector, drm_edid);
 
-	if (!drm_edid) {
-		DRM_ERROR("panel edid read failed\n");
-		/* check edid read fail is due to unplug */
-		if (!msm_dp_aux_is_link_connected(dp->aux))
-			return -ETIMEDOUT;
+		if (!drm_edid) {
+			DRM_ERROR("panel edid read failed\n");
+			/* check edid read fail is due to unplug */
+			if (!msm_dp_aux_is_link_connected(dp->aux))
+				return -ETIMEDOUT;
+		}
+
+		if (rc)
+			goto end;
 	}
 
 	msm_dp_link_process_request(dp->link);
@@ -317,6 +348,9 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	 */
 	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
 
+	if (dp->max_stream > 1 && drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd))
+		msm_dp_display_mst_init(dp);
+
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
 end:

-- 
2.43.0


