Return-Path: <linux-arm-msm+bounces-113486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YGFjJuPeMWrvrAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 01:40:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF40695C00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 01:40:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=R7sgntdd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Qr1x7VVS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113486-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113486-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E516E3157B8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 23:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F35481A83;
	Tue, 16 Jun 2026 23:40:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EC1481A86
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 23:40:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781653211; cv=none; b=GXZuJxgFbziNfDJuJdov9NXaXQiu45Nw5/tIPRxOuMeMfvwBlt6ob6+LffQw/Z1o7qrB/8y0MliPBZSDtrMBV341MhCVVz8JV5o7vo4D4RTZ9pgHJJCabvsECruuccDLPEZMoyjll8qUKMTcdJJcTdfipDhQQd1j7TzTZl8IK30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781653211; c=relaxed/simple;
	bh=s2axybC9gZJV6DhelFvJqIsgDslOKwc4D1G669PivyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KSVyPgXD3xgfML0k6piwI8KtDlISMLCNbRqLXa5cCC8gxcAt8sbPO/n1S0HnacOPv0JM6kFDqzH5KFBRrruZ1CKB94HKZ2FKSdrvXahGgZ+KWSZydqABbTVGCKjBkoJpnOA27Cu4TuRLIF0i2ZetVM0lixZn0RqMooo8Itzj6Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R7sgntdd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qr1x7VVS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GLTVfL198521
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 23:40:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Tmy1cIYxXjpzHBntLzbSuQARaXb8dG+6b7KwUXzoV0=; b=R7sgntddRyQ36YY5
	1oVYBMgfYIr0+mBiTT9S3Cz1fQ5G6xRPGn+pAV6SLiOA8PCSvqJWOz5ibYpk4Hdm
	Gbi6xJFhvyOtHC52P6uz20YkwK40dfOqWc77447Qi0iQmc2s14F1UJu1ZChsrbN7
	4a+rcgF1YsNE6FK9/Ktae+49OicHpDoWJV4nRZEkypXMS6zeHBAaYDi1gTWRg5PD
	vUpvj4vgCG0LPUBuBCh/BgtggtWUx5+T0qQ+1nNlGsEDuxp77ijY3RQVPd8Mk/Lj
	NWozHyw6phuYMn9HtIdXTEqXIhlbsGuD2q+++b4ER5NJCMpzMGTYXUuQ3/mH1qzD
	MN3bMg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueer0cda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 23:40:09 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30715229191so518112eec.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 16:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781653209; x=1782258009; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Tmy1cIYxXjpzHBntLzbSuQARaXb8dG+6b7KwUXzoV0=;
        b=Qr1x7VVSxqniEe4ClCug10doI0Pxpae4KCF2SLpJI5jOY+Yh/8Oc662EsGg7vWK7BB
         NJRlIpfgmU0iy2gP/w8mVTm2Gmi0amHtxOKEnAT7ywRurRXs+ueqN5eZDRQhwVtSV/MW
         jYclcZqntFuYERGi5PLeee5qo7SIvcc0G78tmx4UX8OjPu9BiRXI5v/hDnjFskuh9P+5
         L5joE1p1+gyG5tEp9gb/01uNpA8hpdsnMsgQbQDo6DaDQbzcZyZKOS+D+z92+8i7HCuA
         VosiOC03MwyKySPlF8+Ca98dM2hs3QM96FbafYmV2VeEeQC+8r74QJzBm22wJGmiiX5S
         3XzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781653209; x=1782258009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0Tmy1cIYxXjpzHBntLzbSuQARaXb8dG+6b7KwUXzoV0=;
        b=OcXlzP+FaCuzBmaQvJ0+wyKT+YaN4B9T9uJkIb8lo2rrHqqO5ptb3qDFSyLHQBlOC7
         1aBpn5SkcgtwmPWy/s09vyY5MOXZKgYynEbwaaQjPMxNRmHCgQ2AvuuCmhPfRd6eM3OD
         IWjN3ChIXtA3ZuT52PcOtpkkHwYHerI8W1y4YxvlHEQM/uL4zAjBG7zZtaL0wscRlhaU
         aOCHEJ0AJP7t//a3XWrf3C3WVW0VmcZfucMpROUdkS9OFPrTAeh3w1RPRB/C2nwqHvjE
         wYCd46UNqzdI7WTl9eTAf6DXfdsZj4AvpLOnK5vOg0uJ+56POxpq8Vv5B3EoBryXj2ZN
         cYmQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ioYrSTaAiQ5z/xEsYfX3E1/A97A16bZD9ED7ekogQTfxC6fXX4mAxVf5UIdY9NG3uiDc3V3cTFUffoVzL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2tjc7G8L4o/GAkzMqHg5vZlr0n2TbwSfayIBpH+UfoKSpEZIn
	eVUzduD+YlCU1GSDMi05yf21bXhao8LAZpu+MAgA9oPLTuniuZkkzaT5CX3cMYtt1QhTx1PoPDL
	0R0euUkHmnnxIlDxjMa4oa+NsIrI9ZgQAmKF5L9OuWrGKNyOppaB+Sms77VjbExSgYUIw
X-Gm-Gg: AfdE7cmZ/tHbLw54A0SzAzqPuWwOlKx/k8k0LrjG8EOVh6zf8E0e1eiBpbOnAQWw4Lz
	M9aTvVANyyYBKtO0MfwYxKmXGBrthUH82cnhQquFXP3HVsjJxUXvPRFVmBXaVobKgQa7xR9moyr
	K/bcWzE4I5KI3CgQkrKZo+fRBWGzYd/K/gQy7GYWHN/oDLCkzFvqFfWFe3cKIynI+fjgD1Axd44
	W2HFwN6lfdzHnp4AZg0DsaisWyoZZ/wn8/lxO8QV+qIUgBbXVC6MczckKVQ2/Zm1/PGr2yuTU/j
	11Oy2hUFkK3XC9sB+HUo3kiyZg19H27B0jG5OFe4DzxrYTGXvCYM8zLhBRv6aMoAkPrtQVJXa/P
	aSwXPXgKpofe7QaJcRmQzoLx+dER2QWuH4kdvlBg9LoJQ2rEMRr4doxPU8Uu84H7jVgkyCo9y9w
	w8W4dQhA==
X-Received: by 2002:a05:7300:2153:b0:2d5:9438:2a02 with SMTP id 5a478bee46e88-30bc9cb8b04mr388065eec.1.1781653208910;
        Tue, 16 Jun 2026 16:40:08 -0700 (PDT)
X-Received: by 2002:a05:7300:2153:b0:2d5:9438:2a02 with SMTP id 5a478bee46e88-30bc9cb8b04mr388058eec.1.1781653208386;
        Tue, 16 Jun 2026 16:40:08 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30bbbd636fasm2828607eec.22.2026.06.16.16.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 16:40:08 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 16:40:04 -0700
Subject: [PATCH 2/3] media: v4l2-core: Add support for video encoder ROI
 control
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-enc_roi_enable-v1-2-fefcc4e76f33@oss.qualcomm.com>
References: <20260616-enc_roi_enable-v1-0-fefcc4e76f33@oss.qualcomm.com>
In-Reply-To: <20260616-enc_roi_enable-v1-0-fefcc4e76f33@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781653206; l=4874;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=s2axybC9gZJV6DhelFvJqIsgDslOKwc4D1G669PivyQ=;
 b=5e7ji4nw/cmeEZBzzL43KzRs3bfG/FnCF0j/D7yVYPIfhaJFhwtPn1LjC0TzyQUicA/YJGbNE
 yNMlZ3kDSdEAH9/P7yb8T7b0t2TvyJ8KEwRwEe2l0lnB+bW5onTEavP
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-ORIG-GUID: YKDRyaEJ9TmhBSBREIPbDvY2Hke9GI8D
X-Authority-Analysis: v=2.4 cv=Mr1iLWae c=1 sm=1 tr=0 ts=6a31ded9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1VXWyIoLJVhIH0d9pWEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: YKDRyaEJ9TmhBSBREIPbDvY2Hke9GI8D
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIzOSBTYWx0ZWRfX0OujrhKyvTN9
 aRe2nvbBPqeuBq62D0CqjK7S3LnUbkMdx4jpgTGVyX9CCyHXd24BImaPlrfIhH9LTJUAV32L5QL
 PXy5i7BucMlqKMNHREw6ZbJAkjvU80o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIzOSBTYWx0ZWRfX6gCMsZoNj1iG
 6Vc5hTsDuc7XBVsf8aCrNjLTsFdaw4K4xczwqnsnXk1j5H4RRZsafvBhqjZ6ddwV0Q9O0ln5By2
 1qB3DxSM33dyi75Pukfi6SEL1HqX/RjqADxztjt6oqSKFmz5g8ofdowjiIFiVy5Pb4OvefhDGRE
 9C2YG64wV+xOumsyVnwHDwe1KD5rPz/lnkxTNGLLaumrj4AQu6n45gn5+OzUtZLcXejtvcLUQ0X
 adfRYR/+4MSJYEMbtvORlNG5Dcc9TqrIirB+6yoGcySucQTPUkownQjqEKMMce6IRDEefVkCuNE
 7PfhSSe9bV96fv4T9uTBt17aP67/U+aGF6agbZ98dkR75yOk9QUNDO/971fXkHmarjgi+gwxZAm
 h0DMdBNZMxuz5r2y3UH93G7AjKHsq2YWyCjSjOdBRLgm+eOOYmnZ8PNVDfylsfiHmADeLlgXAXi
 pEIawfXmgfsq0VA+pdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606160239
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113486-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[deepa.madivalara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:deepa.madivalara@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deepa.madivalara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2FF40695C00

Add necessary support for controls V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP
and V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c  |  1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 21 +++++++++++++++++++--
 drivers/media/v4l2-core/v4l2-ctrls-defs.c | 10 ++++++++++
 3 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 93d8d4012d0f4fef004e417d0aee2ae44b1b30bd..7d41cfd7378baaa929d4da0266c45f731bb54285 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -980,6 +980,7 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
 	case V4L2_CTRL_TYPE_U8:
 	case V4L2_CTRL_TYPE_U16:
 	case V4L2_CTRL_TYPE_U32:
+	case V4L2_CTRL_TYPE_S8:
 		if (ctrl->is_array)
 			return -EINVAL;
 		ret = check_range(ctrl->type, min, max, step, def);
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index ba047d7d86010bf0cf8f8fbf2dc343883d6bdae0..ec7e49407603b34d3b7eed40cc6fde001b0b10d0 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -287,6 +287,14 @@ static void __v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
 			memset(ptr.p_u32 + from_idx, 0, elems * sizeof(u32));
 		}
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		if (value) {
+			for (i = from_idx; i < tot_elems; i++)
+				ptr.p_s8[i] = value;
+		} else {
+			memset(ptr.p_s8 + from_idx, 0, elems * sizeof(s8));
+		}
+		break;
 	default:
 		for (i = from_idx; i < tot_elems; i++) {
 			switch (which) {
@@ -367,6 +375,9 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 	case V4L2_CTRL_TYPE_U32:
 		pr_cont("%u", (unsigned)*ptr.p_u32);
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		pr_cont("%d", *ptr.p_s8);
+		break;
 	case V4L2_CTRL_TYPE_AREA:
 		pr_cont("%ux%u", ptr.p_area->width, ptr.p_area->height);
 		break;
@@ -1365,6 +1376,8 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 			return -EINVAL;
 		break;
 
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -1403,7 +1416,8 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
 		return ROUND_TO_RANGE(ptr.p_u16[idx], u16, ctrl);
 	case V4L2_CTRL_TYPE_U32:
 		return ROUND_TO_RANGE(ptr.p_u32[idx], u32, ctrl);
-
+	case V4L2_CTRL_TYPE_S8:
+		return ROUND_TO_RANGE(ptr.p_s8[idx], s8, ctrl);
 	case V4L2_CTRL_TYPE_BOOLEAN:
 		ptr.p_s32[idx] = !!ptr.p_s32[idx];
 		return 0;
@@ -1556,6 +1570,7 @@ void cur_to_new(struct v4l2_ctrl *ctrl)
 		return;
 	if (ctrl->is_dyn_array)
 		ctrl->new_elems = ctrl->elems;
+
 	ptr_to_ptr(ctrl, ctrl->p_cur, ctrl->p_new, ctrl->new_elems);
 }
 
@@ -1998,6 +2013,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_U32:
 		elem_size = sizeof(u32);
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		elem_size = sizeof(s8);
+		break;
 	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
 		elem_size = sizeof(struct v4l2_ctrl_mpeg2_sequence);
 		break;
@@ -2215,7 +2233,6 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 
 	if (flags & V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX) {
 		void *ptr = ctrl->p_def.p;
-
 		if (p_min.p_const) {
 			ptr += elem_size;
 			ctrl->p_min.p = ptr;
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index e062f2088490470c42d6c579ff7675be454a29b0..8f895060799ea13443143edd398dfb97f4ba0085 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -974,6 +974,8 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:			return "Average QP Value";
 	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
 	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:		return "Encoder ROI MB Delta QP";
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:			return "Encoder ROI MB Size";
 
 	/* VPX controls */
 	case V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS:		return "VPX Number of Partitions";
@@ -1622,6 +1624,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
 		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
 		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
+		*type = V4L2_CTRL_TYPE_S8;
+		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
+		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:
+		*type = V4L2_CTRL_TYPE_U8;
+		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
+		break;
 	default:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;

-- 
2.34.1


