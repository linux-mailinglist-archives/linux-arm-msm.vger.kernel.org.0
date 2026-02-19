Return-Path: <linux-arm-msm+bounces-93420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GoMJhcsl2nmvQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 16:28:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DB1160229
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 16:28:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5D79C3019CB5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 15:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC26E25A645;
	Thu, 19 Feb 2026 15:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PEKEoX/2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NkM5pn97"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6556F34028B
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 15:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771514872; cv=none; b=fFAoow5jaP4ilIlPBYHJt95sXIIXfS9jCikSDsliptVHA+VDtG2UuPivupJhTzek+wrRt8lTdHYUv9OS9in6WhEqXupToi7IoBrak7VHSK6RVy6dKG/5NQzzSkucHiOd4i+6G+YaZImzSyWDGc+r9WH2h0kyfeoNYMkQ0DrMEUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771514872; c=relaxed/simple;
	bh=letGs/Jv3ibp120UojnK5gyUjQNN9y8CPX5HtAjAaCo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eAQrrZZ2DODyiNcve2/Pbp1DQHuLQZOKJOXObw5lQJdnrr0saQBmhWhHuVcLs+GQUv9DJg+LUlb72BHgqvdlav0yYgOd0ojlbfNlx+uqWBNdO5RL66pAW+lZuToed6aG/dvh5CAEnjbkKmqQpdVxCxloMO9GuDQyj2aDo279ZSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PEKEoX/2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NkM5pn97; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JCJQs72885457
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 15:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jpU2yqgS3Tb
	1S+0UHkdFAHU6e6WBLvfhQdKd+RG9qAs=; b=PEKEoX/2gh8P4CukyYwurSUtcFO
	4K0VHF1Aq488Y6XvnOSQDMTbPXl/2zyhcj3Xp+stlFB9UhHqtLSOtxr3iCEppE63
	7S3xXdG2pianViG3dBKjgAHb6lL6K4VZMqTOOqYmXF6NcxHzVSM9iY6wIyy71l9F
	ZzeA7ziT8mLJ3Eud29QEtnMIcPEAaostQCaYMX3j8raH9snXF/QO1teUYl/AdrJ2
	orQi0/Fl9FzRXEnbvtbGr2opTaE3/pbIzLXUYWrVtBka6AHMIvaOTU1+DyaiK9jK
	vJrii9U3EdjM7ljEcZKkTJw81ZaHMRX999F2U3au704piFcT59kt3jnw4LA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdqfga2v8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 15:27:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3ad1b81aso1276859085a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 07:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771514870; x=1772119670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpU2yqgS3Tb1S+0UHkdFAHU6e6WBLvfhQdKd+RG9qAs=;
        b=NkM5pn978oduXsbL0WS067S6yu1+BhOPHZ06F5qGZw63oDqk3/ZxVdlDYSOavq7pr7
         NmsL5XHA1cIz8ZnTXgBum1zgINc4Z3xZtra7CuhwCgTaVx+X8imxSX8j/wtLgQxWCVMx
         vj6Lq10nkFReE/XLSe9vQNbtCh918nNPZKgz1OXlHZKh7mmz6J5mLtOc4Eaf2Zkwg6zD
         rejZYEBLR/KEkk7KTz1CDhc66T7LCfRCky/F2vvJ36fJJ9sFpOAyyL4tvDAepb+nNeB5
         O693Z02jEBenSbU7Pi5DvGhPKHotAvWKXooEdxdK0nzC2605XAQFfF0pNXJuyePf5rN2
         tEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771514870; x=1772119670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jpU2yqgS3Tb1S+0UHkdFAHU6e6WBLvfhQdKd+RG9qAs=;
        b=ZUVlqjJdvXilxx/7k4fa8iBQD6uVv/cr/Tx2TNOMgRUdRTlEQRtNoNFt6Q3ZkF5Qsb
         0FeHqhF56iB/fc87gJkXoHXY0+gh2VhezGQz0YGtp/PF6ubOnIGjRg58PLhZdkYhNwj0
         U/saAWqd0wuJQK67GOl8v4vzd9g2nF1ZYWyBuvvT0gTraWS6VY15tC8UrrFBQ/rPvEgc
         RasqwGFwrB12u1NUKztTVTayu52a4Lun4oKYLV6Zepypxu6nXsj6xB51RYhwfnRk92ri
         pkRKleL7d/tlQttgvh/UQ6Z38cd47ulMYcq7JxrVNFpUfxMi4RExKHdtYlZXIqsrXiKR
         P9ow==
X-Forwarded-Encrypted: i=1; AJvYcCWqzmHTlC8P5AlTuk5DyTngPHur6Lob+PGvVfjvyHcUVDzIWSkjxkGnfYujSiZ+HqsC1yGfp2DLOyKUcNGg@vger.kernel.org
X-Gm-Message-State: AOJu0YxRu+dy0XEbA3/9FuMs4Vn65/g+XncTrCD45OXTBpSyqmYc3X4Z
	vmSZDS137OwBEx45wk9g2nHLK/0iEyZ595Oi/VPWBmkg/sVaAFfWZiBfF13LKfFDVeAToM9vE9M
	twdlJjs7WzmP1JaCNmtfHHEsQsGoXEaCQU/3KyWIIhfRF3CfX6iV53FwOcMHpdJN/hxBe
X-Gm-Gg: AZuq6aJXhUklDXHUTDMO519Jfp5bcFD7BSp6sWv0T5CZfncDmDOPldyREOu9t+h//qp
	0bDVlyJ1+5i0Ktac3DQ0+ZD8ziplWIpHL0gqloSaOi3QoV34WsqYSDoheZi8U8AKa5dPb85jC+d
	aJDcXgY/MHq2aBlY95tX4hUgxW1e+lOvjRz4w/zGNL8QGb7jxQPFcmTNEL+hnhGu5Qc9atVC16P
	dpt4aLCijxj8EgccztJTI4y3CvI+9JuW3kc7EIeBRZGTt4xJZAdwZqGP0wqYe/J6E5j59hKmXKn
	tcSMtcZJ/+nvbzT2/WzWsxZYSHs6TEKkKi1wb6ZRVPh1O8clGGl5jnEGR1SdwqbjXqpFAyDESxs
	on7Y4RibfM/cFoq6YunmIsKdzyrWVFC7rF4/G8Egb+rlRxgA6FdeiUJIpxNp8Ut6dGTBdcz0Mjo
	WTBjy1kupPW+jB
X-Received: by 2002:a05:620a:28d4:b0:8c7:1317:142e with SMTP id af79cd13be357-8cb4c0419fdmr2104184285a.85.1771514869595;
        Thu, 19 Feb 2026 07:27:49 -0800 (PST)
X-Received: by 2002:a05:620a:28d4:b0:8c7:1317:142e with SMTP id af79cd13be357-8cb4c0419fdmr2104180385a.85.1771514869062;
        Thu, 19 Feb 2026 07:27:49 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:38c9:810e:d893:92d5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0ce73fsm2241024785a.11.2026.02.19.07.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 07:27:48 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 3/3] media: qcom: camss: vfe-340: Support for PIX client
Date: Thu, 19 Feb 2026 16:27:37 +0100
Message-Id: <20260219152737.728106-4-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260219152737.728106-1-loic.poulain@oss.qualcomm.com>
References: <20260219152737.728106-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2iPXK1NOHu4IJCsHllm8yk5_pesEwg2P
X-Proofpoint-ORIG-GUID: 2iPXK1NOHu4IJCsHllm8yk5_pesEwg2P
X-Authority-Analysis: v=2.4 cv=A6hh/qWG c=1 sm=1 tr=0 ts=69972bf6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=7U93QfTUEiMoBrDrDEYA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE0MCBTYWx0ZWRfX1cm44V3L8WTn
 sDdB0gn7/HDI3mtUyujV9NWAW3JNbDAPFrRvaCBV7YTkwJckpCBY6REo8ycsxjYLuQRfAH44QLC
 pKbsvT3W417erAcy+vSWawa47idnGLVl+39DJsHovCOaKXG3Dj6sjMxmM3cRUEULCb8EaHQy3sg
 l0okltQlYJLfOrbfyRvq1AwLoxn1SmJjgFbNX9YzPm94mR+AdTSGOHXP45iCQJ2tJ+93aZcO+yA
 1qUIuv1CFC8QzaTqb+8rSNFzSGhugmZpunweQvmi1QOkXj38N6Uu5+PxVteQ2+MC3SNN4v8T/7+
 aYc3LHIwOS1QEovwU2lFZ6591LlZXMBoJSVfuHx0AUDyUFIbE4pjq6KWPPIt7MhMy6ovV5NHK7B
 8GpmMYX0Kzc05ZZ6dDQ2rUNJho771tTnULWLCbHbj6lH4wPTwSZIlZOGVvpGkRW5TUpdlO1iySs
 JWo8dmBMekdFWJTgoiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190140
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93420-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 51DB1160229
X-Rspamd-Action: no action

Add support for VFE PIX write engine, allowing to capture frames
via the PIX video device (e.g. msm_vfe0_pix).

Tested on Agatti/Arduino-Uno-Q with:
media-ctl -d /dev/media0 -l '"msm_csiphy0":1->"msm_csid0":0[1],"msm_csid0":4->"msm_vfe0_pix":0[1]'
media-ctl -d /dev/media0 -V '"imx219 2-0010":0[fmt:SRGGB10_1X10/640x480 field:none]'
media-ctl -d /dev/media0 -V '"msm_csiphy0":0[fmt:SRGGB10_1X10/640x480 field:none]'
media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10_1X10/640x480 field:none]'
media-ctl -d /dev/media0 -V '"msm_csid0":4[fmt:SRGGB10_1X10/640x480 field:none]'
media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10_1X10/640x480 field:none]'
media-ctl -d /dev/media0 -V '"msm_vfe0_pix":0[fmt:SRGGB10_1X10/640x480 field:none]'
yavta -B capture-mplane --capture=30 -n 3 -f SRGGB10P -s 640x480 /dev/video3

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-vfe-340.c | 64 +++++++++++++++----
 1 file changed, 53 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
index c6ea8b6216c2..50ac5d84f67c 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
@@ -63,7 +63,10 @@
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
@@ -103,7 +106,7 @@ enum tfe_subgroups {
 	TFE_SUBGROUP_NUM
 };
 
-static enum tfe_iface tfe_line_iface_map[VFE_LINE_NUM_MAX] = {
+static enum tfe_client tfe_wm_client_map[VFE_LINE_NUM_MAX] = {
 	[VFE_LINE_RDI0] = TFE_CLI_RDI0,
 	[VFE_LINE_RDI1] = TFE_CLI_RDI1,
 	[VFE_LINE_RDI2] = TFE_CLI_RDI2,
@@ -255,18 +258,58 @@ static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
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
+	if (client == TFE_CLI_BAYER) { /* PIX */
+		writel_relaxed(pix->width + (pix->height << 16),
+			       vfe->base + TFE_BUS_IMAGE_CFG_0(client));
+		writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
+		writel_relaxed(stride, vfe->base + TFE_BUS_IMAGE_CFG_2(client));
+		writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(client));
+		writel_relaxed(vfe_packer_format(vfe, pix->pixelformat),
+			       vfe->base + TFE_BUS_PACKER_CFG(client));
+	} else { /* RDI */
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
@@ -276,11 +319,10 @@ static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 
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


