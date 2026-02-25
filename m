Return-Path: <linux-arm-msm+bounces-94143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOD3ISoPn2neYgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:03:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B4B199266
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:03:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 83E5E303EDB1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 15:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D2F3D4131;
	Wed, 25 Feb 2026 15:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cb7No4cx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZnyZhn08"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C553D4115
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772031716; cv=none; b=Y25uqwov88H1CiYqFNVpyoUFLMd29age0IDKIqMU2JCQUIT+JUeQlgdRSgr7VKk2vXSVeOVBuWcEN6XxCJBt0ZayWY9irIjLd/Y+5nTzZdy82qmsrIVP5idzL2Dc/X4UhM/PW1v4TaL3FHckPShM9U2UGrbHsNvgMrgFtTLWTRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772031716; c=relaxed/simple;
	bh=EDYsvqb5RsGmgJKZcirhixacxJ9cMh6CHZqD60mgbwQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tV+KK6In7rhxiy8oHK8rx87HhEg94UoRbQJCc6a13H5jnhsiPY+dWzJQKTD/P/EixbxGBRn1Lu5vl5Ysduv5qRrLxY4odTRDPItiQeMRJgWwCiIs7RDxumYMJ3IWs32YVimyqp2RUcaE0Gq71fTZrCMJJITBTlAHOHQXKcTVWUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cb7No4cx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZnyZhn08; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9Sd531087959
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hUJtIXwURM+
	mnrOq4kR+X5jB3iPfIoZRKw9f5krjPCU=; b=cb7No4cxim+Yg1XavpwCGDAaGpk
	SvSULWwGPe920HgxmH2LRcDzkglqktTvoLcggNVKlaWgk7WszPO/ejbP3ACeJ0By
	ZKd2nscqkkvCJF38OkR3ZN0uNL5g6vfKS3IC/Di1IXJXZA2fQILRyJ0mqVx+SLUO
	2cwTL2Tc2UvO8JF+Ovqzbe+gZC1TlFeE6nalWhSRczbnctiRLzMr3TLgT0qvBc3A
	odzZwl0/PAY2/r5kvoQq/gTREt4036BBu3GdUs7KcEKmvg+5y9aDVefF/wrt12Tx
	0UqQqPWxqNSfTWHJUPHq3kdIadWRTkIbmgLnpLQBCdF4I4+55FbKbWlfs8w==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chh473bhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:01:51 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-66b47c7a795so56770923eaf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772031710; x=1772636510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hUJtIXwURM+mnrOq4kR+X5jB3iPfIoZRKw9f5krjPCU=;
        b=ZnyZhn08415hs+VhehEpbnw5z+SiiGiZiPwDNtGfLROwhLkLvTtxJ9U4r0/VyDEHcm
         LM35cANEMCo0w3ptfEAOCEy8BwXqnM9a/HgTBaKy0u2xm5yeHMCnu+KhEpVXZfqGAh8q
         hps2T2tWIU3x8ih/NJpY/wbyEawOLmMm857P3wzl4iQGmAgr8rjL4quncLl9Ral5r2lz
         7vgMKmSYjDgYUuxBIRpWz0J4xovSAm5Tmf2uy5ErE3iu5qPS35MEIn28O58pBuC9T8jU
         rKiK4ceOIPNUu5BzZtpmnykmlEWT/l3b78ygSX4l+1hmE4EqbdMLFtxOOVqh7Xrgxi7L
         ZaBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772031710; x=1772636510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hUJtIXwURM+mnrOq4kR+X5jB3iPfIoZRKw9f5krjPCU=;
        b=eazgtvY1Ce2Bej9yY21sKz4U5u8iO2UDl61hcmSiOIibqpGWRgfsyj5mA2gOyYaRA0
         sSaW8vhukr7Bf2iBBCknR6NDfNyCDyRA1co9hkBMOB++7J2CcCfHoAUTHKaISc+wj/Fg
         ZfyYjfiXr7Re1scD7OnBgZkcZzakwMX6S5V3a6cl7C/bS8tuqVRnW5y1e478Pc3B/W2t
         FyzX8BH0n5vS0xQQO850DT3ejIG1smTAUo1LVfashgFk/EnEGEAab/L4hqtNPaOS/UKt
         ALqxnpwcUzX2jG+DbKysB2lSVccuWmQiBDJ8aCRJh7XMptuubZd//DLR4O5xqibSy/MB
         dgBg==
X-Forwarded-Encrypted: i=1; AJvYcCXRV7yNZNvOxxb5eC3tOcEO+S7q4kw9IhXYA44OpxDNOGRPvUXkttYYIuaJBvEc4GdgLV5yhqygXmhrfgvR@vger.kernel.org
X-Gm-Message-State: AOJu0YzCpqiL/MDQ/pa/CBhWucvUhYnRwPosKrGq+1Cdc9hh5fwrFjZP
	ZXxlhW4dA1NjDagtKCopRiDp0cZhSIH/VknZUwtclsCh4uwgXwC3QLzPhQuWOK0agQjnnURUyk7
	fyNuz8SoYPf8FWf0dJ3L6CJMHbYGd6olcS+wDhE25iTCxAvyFX+RoxJvWA75ZIx7y0AtvfAslIK
	4ekvo=
X-Gm-Gg: ATEYQzxKoOfcHe+fOmxfyf/lPitaK8zkN34YPec+aJoRSrGvL9zFqPWUUg4xbR/KsVd
	L3Dg9v53cEtgKXRlLLK7iHFq6+vkUifk5y0yjntfNfzv3kxdcGIWHwoBd3Ipuf75cH4MFIDLcMj
	S6ZM7PAtN2D/RbuTKxdpCnKBP0ZbdcRK9jqRDAMKVjmXAXeiDyItoZtGZD+EUzjJ9kvlG08Imco
	HcEujDxUqPYr1rfypNYIQb+s1ySV9UIwx261fbIw301bbyEDmcuwkQncArsvvY2aEV2ilhZSvbk
	YuNBmMIlgf3Kmeh2L3wObYEgxfl08aaMpq4QLBt+ZptCb+Cr+aswjLBkqWS2YV1VvJ9CGzJ70EZ
	YiLiL8IwFt79KGnXaJfzA3uwXyvbHCHLaq4Rb5GOTedz0dU2P3/mI9IPwNVNxcVJsl/8x3FR1vW
	KEPQN1BQNssBw=
X-Received: by 2002:a05:6820:828:b0:679:a4bc:9f88 with SMTP id 006d021491bc7-679c46c7f30mr7713179eaf.47.1772031709189;
        Wed, 25 Feb 2026 07:01:49 -0800 (PST)
X-Received: by 2002:a05:6820:828:b0:679:a4bc:9f88 with SMTP id 006d021491bc7-679c46c7f30mr7713144eaf.47.1772031708214;
        Wed, 25 Feb 2026 07:01:48 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:bd3f:a77b:995:768e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65eab9a08edsm4306552a12.5.2026.02.25.07.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:01:47 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 5/5] media: qcom: camss: vfe-340: Support for PIX client
Date: Wed, 25 Feb 2026 16:01:22 +0100
Message-Id: <20260225150122.766220-6-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260225150122.766220-1-loic.poulain@oss.qualcomm.com>
References: <20260225150122.766220-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: T9oFJEON3nDuZk6Dvr41JHTnBW0-qQKE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE0NCBTYWx0ZWRfX8Wk45rYjvo+g
 cEUujNcEVp20EAYuZvi4l8TgZgxoDzHWeJhaji9tV7rWTR1XhvsjCwlid/tLXZrm1mIPUXF6uUi
 wMH80oLIS6jHRCdL98uCRdIxKCaQR/DspMxfbxDzA3iM+Y4oSaOhkihayEwLZmLw7i4vz8+ykcI
 a+KFgWFucV716WeLfpc3jd38+PsCY35zgEC/0q0cOBLAZ64JcwpxIDYTisXiuvPq8qgwvfHBcJ3
 GEndWTn3Vh3hO8TcBguWBeJoUSsTercA7IKxapNI67sMl23/tIc/aQlxgGVy9jQ7TgjhjIsK4Fv
 afANxJNgfSzQbekb7f6wb2/Xny4mpJ9WizKsmxunRrntacuA2kciBq1lFYgsfmDLwy84PYMyv72
 SNnoy9st/SEdS53Wjs6NeL2cqdAeRj4pEWICNGthuamSNTNpYyg5xxM2J6N7biyzjCyYGIzW8Sy
 qmIDY5bvP7hzPsGbVfQ==
X-Authority-Analysis: v=2.4 cv=fvDRpV4f c=1 sm=1 tr=0 ts=699f0edf cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=T0JAYaUI_TIkQzIuI_sA:9
 a=QEj_SxXEJzKJbFzb:21 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: T9oFJEON3nDuZk6Dvr41JHTnBW0-qQKE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250144
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94143-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 16B4B199266
X-Rspamd-Action: no action

Add support for the vfe-340 PIX write engine, enabling frame capture
through the PIX video device (e.g. msm_vfe0_pix). The PIX path requires
a separate configuration flow from RDI, including cropping setup, line-
based write engine configuration, and the correct packer format based
on the input pixel format.

In contrast to RDI, the PIX interface embeds a lightweight processing
engine we can use for cropping, configuring custom stride/alignment,
and, in the future, extracting frame statistics.

The functionality has been validated on Arduino-Uno-Q with:
media-ctl -d /dev/media0 --reset
media-ctl -d /dev/media0 -l '"msm_csiphy0":1->"msm_csid0":0[1],"msm_csid0":4->"msm_vfe0_pix":0[1]'
media-ctl -d /dev/media0 -V '"imx219 1-0010":0[fmt:SRGGB8_1X8/640x480 field:none]'
media-ctl -d /dev/media0 -V '"msm_csiphy0":0[fmt:SRGGB8_1X8/640x480 field:none]'
media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB8_1X8/640x480 field:none]'
media-ctl -d /dev/media0 -V '"msm_vfe0_pix":0[fmt:SRGGB8_1X8/640x480 field:none]'
yavta -B capture-mplane --capture=3 -n 3 -f SRGGB8 -s 640x480 /dev/video3

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-vfe-340.c | 85 ++++++++++++++++---
 1 file changed, 75 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
index 2f8205fa40a4..fc2dcba43188 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
@@ -54,6 +54,7 @@
 
 #define TFE_BUS_CLIENT_CFG(c)				BUS_REG(0x200 + (c) * 0x100)
 #define		TFE_BUS_CLIENT_CFG_EN		BIT(0)
+#define		TFE_BUS_CLIENT_CFG_AUTORECOVER	BIT(4)
 #define		TFE_BUS_CLIENT_CFG_MODE_FRAME	BIT(16)
 #define TFE_BUS_IMAGE_ADDR(c)				BUS_REG(0x204 + (c) * 0x100)
 #define TFE_BUS_FRAME_INCR(c)				BUS_REG(0x208 + (c) * 0x100)
@@ -63,12 +64,23 @@
 #define TFE_BUS_IMAGE_CFG_2(c)				BUS_REG(0x214 + (c) * 0x100)
 #define		TFE_BUS_IMAGE_CFG_2_DEFAULT	0xffff
 #define TFE_BUS_PACKER_CFG(c)				BUS_REG(0x218 + (c) * 0x100)
+#define		TFE_BUS_PACKER_CFG_FMT_PLAIN8	0x1
 #define		TFE_BUS_PACKER_CFG_FMT_PLAIN64	0xa
+#define		TFE_BUS_PACKER_CFG_FMT_MIPI10	0xc
+#define		TFE_BUS_PACKER_CFG_FMT_MIPI12	0xd
 #define TFE_BUS_IRQ_SUBSAMPLE_CFG_0(c)			BUS_REG(0x230 + (c) * 0x100)
 #define TFE_BUS_IRQ_SUBSAMPLE_CFG_1(c)			BUS_REG(0x234 + (c) * 0x100)
 #define TFE_BUS_FRAMEDROP_CFG_0(c)			BUS_REG(0x238 + (c) * 0x100)
 #define TFE_BUS_FRAMEDROP_CFG_1(c)			BUS_REG(0x23c + (c) * 0x100)
 
+#define PP_CROP_REG(a)					(0x2800 + (a))
+#define TFE_PP_CROP_CFG					PP_CROP_REG(0x60)
+#define		TFE_PP_CROP_CFG_EN	(BIT(0) | BIT(9))
+#define	TFE_PP_CROP_LINE_CFG				PP_CROP_REG(0x68)
+#define		TFE_PP_CROP_FIRST	GENMASK(29, 16)
+#define		TFE_PP_CROP_LAST	GENMASK(13, 0)
+#define	TFE_PP_CROP_PIX_CFG				PP_CROP_REG(0x6C)
+
 enum tfe_client {
 	TFE_CLI_BAYER,
 	TFE_CLI_IDEAL_RAW,
@@ -255,18 +267,72 @@ static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
 	writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(client));
 }
 
+static u32 vfe_packer_format(struct vfe_device *vfe, u32 pixelformat)
+{
+	const struct camss_formats *fmt = vfe->res->formats_rdi;
+	int i;
+
+	for (i = 0; i < fmt->nformats; i++)
+		if (fmt->formats[i].pixelformat == pixelformat)
+			break;
+
+	if (i >= fmt->nformats)
+		return TFE_BUS_PACKER_CFG_FMT_PLAIN64;
+
+	switch (fmt->formats[i].mbus_bpp) {
+	case 8:
+		return TFE_BUS_PACKER_CFG_FMT_PLAIN8;
+	case 10:
+		return TFE_BUS_PACKER_CFG_FMT_MIPI10;
+	case 12:
+		return TFE_BUS_PACKER_CFG_FMT_MIPI12;
+	default:
+		dev_err(vfe->camss->dev, "VFE%u: Unsupported pixelformat", vfe->id);
+	}
+
+	return TFE_BUS_PACKER_CFG_FMT_PLAIN64;
+}
+
 static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 {
 	struct v4l2_pix_format_mplane *pix = &line->video_out.active_fmt.fmt.pix_mp;
 	u32 stride = pix->plane_fmt[0].bytesperline;
 	u8 client = __wm_to_client(wm);
-
-	/* Configuration for plain RDI frames */
-	writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_0(client));
-	writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
-	writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_2(client));
-	writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(client));
-	writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64, vfe->base + TFE_BUS_PACKER_CFG(client));
+	u32 cfg = TFE_BUS_CLIENT_CFG_EN;
+
+	if (client == TFE_CLI_BAYER) { /* PIX - Line based */
+		struct v4l2_rect *crop = &line->crop;
+
+		/* Cropping */
+		writel_relaxed(TFE_PP_CROP_CFG_EN, vfe->base + TFE_PP_CROP_CFG);
+		writel_relaxed(FIELD_PREP(TFE_PP_CROP_FIRST, crop->top) |
+			       FIELD_PREP(TFE_PP_CROP_LAST, crop->top + crop->height - 1),
+			       vfe->base + TFE_PP_CROP_LINE_CFG);
+		writel_relaxed(FIELD_PREP(TFE_PP_CROP_FIRST, crop->left) |
+			       FIELD_PREP(TFE_PP_CROP_LAST, crop->left + crop->width - 1),
+			       vfe->base + TFE_PP_CROP_PIX_CFG);
+
+		/* Write Engine */
+		writel_relaxed(pix->width + (pix->height << 16),
+			       vfe->base + TFE_BUS_IMAGE_CFG_0(client));
+		writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
+		writel_relaxed(stride, vfe->base + TFE_BUS_IMAGE_CFG_2(client));
+		writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(client));
+		writel_relaxed(vfe_packer_format(vfe, pix->pixelformat),
+			       vfe->base + TFE_BUS_PACKER_CFG(client));
+
+		cfg |= TFE_BUS_CLIENT_CFG_AUTORECOVER;
+	} else { /* RDI - Frame based */
+		writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT,
+			       vfe->base + TFE_BUS_IMAGE_CFG_0(client));
+		writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
+		writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT,
+			       vfe->base + TFE_BUS_IMAGE_CFG_2(client));
+		writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(client));
+		writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64,
+			       vfe->base + TFE_BUS_PACKER_CFG(client));
+		cfg |= TFE_BUS_CLIENT_CFG_MODE_FRAME;
+	}
 
 	/* No dropped frames, one irq per frame */
 	writel_relaxed(0, vfe->base + TFE_BUS_FRAMEDROP_CFG_0(client));
@@ -276,11 +342,10 @@ static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 
 	vfe_enable_irq(vfe);
 
-	writel(TFE_BUS_CLIENT_CFG_EN | TFE_BUS_CLIENT_CFG_MODE_FRAME,
-	       vfe->base + TFE_BUS_CLIENT_CFG(client));
+	writel(cfg, vfe->base + TFE_BUS_CLIENT_CFG(client));
 
 	dev_dbg(vfe->camss->dev, "VFE%u: Started client %u width %u height %u stride %u\n",
-		vfe->id, client, pix->width, pix->height, client);
+		vfe->id, client, pix->width, pix->height, stride);
 }
 
 static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
-- 
2.34.1


