Return-Path: <linux-arm-msm+bounces-115143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jhcHNvaAQmrk8gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:28:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC266DC082
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:28:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dKq2y0fM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QRlon2vl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115143-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115143-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2375932A7BD2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1F1341B354;
	Mon, 29 Jun 2026 14:16:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D0E41B343
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742585; cv=none; b=JlAPUlGdThA+DRq8otZh1EdvI52Kqht3PL/sOGz8bs/1lOEm1KZYpixdhir/BviGsV9ft0zrCvlb77Ch7xbSRieSDtoWH0LxROvooO3yxybaPVUIA5hBoJiB+q9DedeeG7QXSQo+c848AVIGjuDrZ8B1PO1G3yqBYsUqH2PDm+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742585; c=relaxed/simple;
	bh=9zOzLt5mkeQ+0BdAJthsd0BI2XytM0z6k1g5yXgmtSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mnjXLI49KV8o78ydEdiSR0TKyvOp+Xv9d1KRQXvORjfou2Qe1mPPXvJ8qsl9rMQ7aObPmxSfUQirj+NhJCb5rukaEDiRYM0H0Nsiv7ea1NiTpL6asmvA/Dax4KTsK8OLzNMq08dbx8gzNacGPDtA4TX+/FIagoWYUO/RyMgyIos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dKq2y0fM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QRlon2vl; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT4OJ2601617
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wMuCUkGM/5ZuNYaTfCD+8LGq0IU6gFC3uoV0LKcWT8I=; b=dKq2y0fM49KcNTPG
	5Nz8JVF47d8ZirjOK7uaXIPcR5rnRX7zYn0s5+3Bjtesevx0GwQzFoDl+IgH6chp
	IQewS9XnacN9AJ2ATDBpnKojmLdyuXNcum2aiPRq7QuzvCYtjfV5mKTGX8lJd/QE
	r6Uhi66BoCUU9uAR1A46RvXKNYWRSTLAidhL/ftzni8qD4JjfkGhUJDT1aXFQ5aJ
	q8iyxMMsOC2bSxL+uEktOL05fuHphuqxXh5sBG6PscXPcHaOqMljfr5JNpASPJsZ
	lVLanWTL2ui5rMICWNMAhKwvtRkBZmg9qZ/zMtbZIKRvZPto5NJHNdytCYQX6gYc
	zFC8FA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw97qs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9203d077d77so619976485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742583; x=1783347383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMuCUkGM/5ZuNYaTfCD+8LGq0IU6gFC3uoV0LKcWT8I=;
        b=QRlon2vl2XPzARd1Q679B4Ar/XRUhrYmQ91POwhJhMdxgNfsP1y9Kpw3f/l6JY4RZY
         53rO0DqGVza9JyNDR0Atd9XMmmiAmJtt+Qms0c2hHFtgYBwzaBIeeehQk9jBvkp7PNxN
         zcOC2YenmG+0TVJjwQMhd114z8hXDoZ85DEzmagvwoXW42InSCcTJ8tWGjGqoKqHNanp
         WpJMSoxk0qyDErfepj+1Hislqm2aKeJlRFgCcQuwCPNZ3rZhhXkoTYyHg2T6MnRuubsq
         uzad9/EEZyxeIJhuEBNvfwNA0JUM56W5f35T7qAWrUnXaaK+GElE+1a1hcDMLduuLWCg
         2XqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742583; x=1783347383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wMuCUkGM/5ZuNYaTfCD+8LGq0IU6gFC3uoV0LKcWT8I=;
        b=ZEDZoqWAQvN/hjZTy6uc+xTFCEM5m4BTAqpZ+fSQdMrRcnvzXOu8LJoanet3ChUAvu
         SG7qipbWfdltkG4gfM6pQtEUhnjNXgXln6RlS+/+8ZX43gjkCYsUrNWwLUdIQppbL9GL
         0ydFgSUHW+OPoFfHd/kt4mbeD4KNfYNvw14L1VdKLTkvFLy1auOS6NhEoG9x77vvsS21
         7iVEOFX9OlVLw5qY3ZCe2JAR2Occ99r+2g9djt9glNmNkC4Eg/cUHojGzbYCTF78fSeL
         b6GdSWy9VtXoMj/55Hlh73ox8VmV7euh5TiN+c+KEq5aOW4hrS1dGtCkeZD21cTfBxss
         QxGA==
X-Gm-Message-State: AOJu0Yw27uzrymCmgZLH/U0fbWOkHoG22lKE7DHk+f6JlzDSnHvDavHj
	vNWoYA1+GSj54Q5TgojttU53tKCZqDsVSvP6OjhXlOLVyMhpXPrr+HVUTGcH/3l8vlxAzfJmYix
	8gOG0ZKViOSeTiRTS3drQ6GYIdnA+MCP8OZ5Mlmpx7YbtQo/eFpVhSHYwVrFEkDRtb2XN
X-Gm-Gg: AfdE7cnOgQbAFqNwmV9ScARNYKldxSX08UUOEEFSVuE8UBCNARduYykttXwYVuQHJD5
	97kTcq0fD04Tg6jbTbUilAvPKQgwX01kb9J4mCth2oH0nkhkQW3uXyqSmMml/5JmL2zneXmpxx3
	ISiTteSORPWZXDK9T6+4kDoZMockxa2SSmt0pif2Da/FxTEY05HXf4uc9hPsXfwtaTvbS/UK+P5
	CB11GqKH2icdEaiX6jVE/RNcsT5xlwaS661qkP8AQdinmR1mYL9lQjcT9701VuliuVAx8yKdztd
	X/75oyaNSPv5ym391bftta3r/EGCiwJRp+i74306tIuQM7w/5HFw/z1AkuJbRAqaaUgXZ9RnVjc
	d+v+3DZXRham/jojZBVU00vOSNgGG4/DOJfWyLUAs++TpbMfkdMfy7VvEboDeoGpmrt9K0A==
X-Received: by 2002:a05:620a:8719:20b0:92e:44be:bbd2 with SMTP id af79cd13be357-92e44bec6a7mr688009985a.9.1782742582309;
        Mon, 29 Jun 2026 07:16:22 -0700 (PDT)
X-Received: by 2002:a05:620a:8719:20b0:92e:44be:bbd2 with SMTP id af79cd13be357-92e44bec6a7mr688005585a.9.1782742581721;
        Mon, 29 Jun 2026 07:16:21 -0700 (PDT)
Received: from yongmou2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9260079070bsm2143165885a.40.2026.06.29.07.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:16:21 -0700 (PDT)
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
Subject: [PATCH RESEND v5 15/25] drm/msm/dp: add an API to initialize MST on sink side
Date: Mon, 29 Jun 2026 22:14:36 +0800
Message-ID: <20260629-msm-dp-mst-v5-15-2ed6aee1867a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782742144; l=3085; i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id; bh=rWGVRQL4yrr/+OcPJZsE2NbhmKlJWDJ86JwhFSr0tHA=; b=zp/0usdQR549mw+/NeCy7PT7dzFTuN9P/wjXLseMDCh/AeFJowZcElLpVJbjhgNu3r6hZsQRG HKc7XxlHUmqDGXWEc7sKzW7mjBNDpmrUJJL+n/QirG0QUBuWI1toBbn
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519; pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX4J6Hq0plVK59
 PgWHXL+Laza5yjaxMACeCRWSHyYZ0fxfTItv0tOORG54xsFaiSLrzE01QS/4CQPwzE5R83xcUZj
 7z75FdSubUaImAPeqSyPiTRaGt0OXNQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX3h5LZOZ/PN1J
 G3zEuoqw45hb/z4Mb9F59+NJGL0LvilHMC4xJTeq/A8NAvKhW1IyVJ5u9ur00MP/0uVJ+MDg2ht
 fONlpyYFkiIyRDuhjCGA6bnrzRQmteDBBhKe/1U79/rUQopfroirLG+PvUH4DKHP/70qug7LlRe
 RVtU0faW/ozCF8B7PaV26cmET2ohkFt5GKN/tFgp56TEHHlvuWEC9A97/T6zFOEU4hyd+kwuAgn
 VgkU1gGvmzEA224J+LOuLp8dJ/KG3UoLbWKexqeuWTmWl6yWSLKcJGQnhNKpjOpjAIPB6E0qCMd
 G6ipUaVvFV2OeqIKmbkywTV6N21CR0WvZKDCchXgHyoprps6kl2zCWcAdWNFYnUH7xH7Zd5H3nB
 jb5ii5ZEm+mp4eagigPnAZujHIDq0uaC40rS//5em/wS01nWMWW9dVNxrBU2CsEWZ0pHIP1+1wX
 f03L9tiIkz02TmHKOiw==
X-Proofpoint-GUID: 5zvwIhLuhVsn51IzUBlXx3i_sh-66UhF
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a427e37 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=vCCEq3Mv4WXTdc8uXsoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 5zvwIhLuhVsn51IzUBlXx3i_sh-66UhF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290118
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
	TAGGED_FROM(0.00)[bounces-115143-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
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
X-Rspamd-Queue-Id: 2FC266DC082

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


