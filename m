Return-Path: <linux-arm-msm+bounces-112107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1SHdFJLkJ2rb4AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:01:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C1165EA9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:01:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dzxs3kCY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ciQjKS8n;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112107-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112107-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CDDD5308D19E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11EE13F5BDD;
	Tue,  9 Jun 2026 09:47:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94023F1643
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:47:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998457; cv=none; b=JkfkWFXij/Qt6ALBRUzdS0ZJvzOpmOfk709Lc5bu169mRIZxrjun2HDVwRN7Vic6KLEoYOIxwNhNqXneoE9ejA3hsdiMTwrXk5sjawDxD4sEoRGw3fclm9RaaMjW+fm4bE45c3nYengDhmMcDrODXRVrk0MiN3v5HymZv4EzSRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998457; c=relaxed/simple;
	bh=gBQT/Y5ZNW+Ey9wkKWiGORr1X84QSCGzRIOGvoBugf4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pv8V1+S39YIv7IQ/skKEoHPuISQMEHDvLU1t/0G2FdXHZyDLSbv3oB3wGJOumiFwxDeM0Y1ykPAVcqDosm4KP3FDSy9fo39fNJptl8v9ugeNXHZtOwDXXrABPliboDqpJEThAeASUCCEhSL66C6rQJHKcH//DQjZKV++Unjh/W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dzxs3kCY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ciQjKS8n; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rfjP1958687
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oLgp/E7dZZ3XA3/5TWWpxvhDXhHZaG1LDXI6Ib9fI60=; b=dzxs3kCYfS5+IF8o
	6Jmpdl01PaM95u5tVC1n2Putc3k7DS4ZnRBQQKUaXJaG3ghxmlBx+DnZK9PBB6tP
	jDVVyF/eyALmXfIGQbfOmK69DA4+UKS1Y9BKuTsIUB9Te87ozAAPBYoLcgRzhPF9
	vGQsakE8fPUlMk1gZVDLLZQL5yyKxfb7MEvAYTXD+mXpRx9RxjLUVSKz83+E1sdh
	RGrBvZLtZiPNJYmFNSnkAYDoB0U0aaPpZXRdEr27dTDXFDhvYMKCbgvPrI85DFyA
	6sri2AaRxaLMEA/Mi1KTtYmgstkZoIMnQ/AZKpj3NXU3cE9WEhfZknb7x2xRN9iv
	ynzwXA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdds8vkk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:47:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91578c374easo1125987985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780998453; x=1781603253; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oLgp/E7dZZ3XA3/5TWWpxvhDXhHZaG1LDXI6Ib9fI60=;
        b=ciQjKS8nyzlo6lwM4lWNHi/xHGJcv3DiWViclnxnyoVJx1KjkbVeHj/eXCzcVrUYHF
         WeJGPYWMsYrRgR/Y0B4NmKiD8MZzHY/RATQ1OxE/IFq/OdWE5h00hOdGyOAK2yRSPctr
         FK4Kx1TLjSsPttGUCppjXuhjP9exnyjKOtOBPCPyPlfegAYNydi3ipnxpYZgLjQxH30v
         Nt5qK8LC/CBihcKlpCj8TscnT5hk9CazBNC56IPqgdisqHF/UoLAdi1WgAwmYJBeSzjw
         uEIIZvrYN7/vvraASFCr8XVdKjuMvg7I81TpEMK/KPnLWYJam1MfpI2yNVKExNUfyXnz
         NJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998453; x=1781603253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oLgp/E7dZZ3XA3/5TWWpxvhDXhHZaG1LDXI6Ib9fI60=;
        b=r0hrWP0bDql3r6fsTSJpmzq52BjAb7poQBWrtx0Ww1BjPssT+tj2jSDdRtjjlCyBgR
         eN966zcUKylLj7RNJzuqhNvHZvTM2q66nEymae4KkguXcph4bRx85x6gYW0Sx/Nr23me
         l4BFwRP3omczV5isw4eMOWF06Etvh2QkhSPROGAsHlPyPBKo/ZXrvXT4YMvfEY/ltlgd
         rS3bTn+WyOw+8iPF1vGM3X68I0tM7fQLgqp83R93hBtEjeOwYaeGHNlc1gy88rR9vbeE
         YUQRcIkFp1HwvwU+xN3IthzqzsFXwisTAprfjpu1g5w0eObIHI7JHRSTsPhXoGMsra6H
         4rYA==
X-Gm-Message-State: AOJu0Yxs2eLbK1W7XOYsEt2krbDIpzOo1G9XcEuh4tSt8xfEpq/yEiNv
	PhGKreZp6ed7f+90IPwwdeWxZP1wv1GfyDpe41byxF1Lsgxl1LC437RfltYidxUzcm95HLU3hZL
	pzFp2sHUYy9hQp/voVMWX2Wp5ClasWezcfVv9DlSVLkRYrv3NqO8r7CoIhL9M0G/75rRo
X-Gm-Gg: Acq92OHtBkHWiX4AKIQVKTDKkEPTYWTQXeCfClIDrUZMvb4wglcju0sh2akS0Ia1FpQ
	1k3DlYfUUladobg3SAyc5CiYgTQ6PPCdMyLiujdD5/lYwr/LQ5tVipLAO+4/jmCXSwffPbjGK++
	ORIaiTjm2VjTEmGDcqLCJI1/g9DKq27xRHkDFpZpKnAaPc40ZzEp3lokRa0nxXO7kwQ6LJVCcRW
	leTB4oo0LDXpv9iaPPRbycCaZoGE83v++fsvJVGKXTSwUSwWcpRToB6bae+zowuWSmAF0FHhPFi
	DOvUND8xXass0zMUakvFVivWEhHYn5M9FbgMQczT9HxFx+Rw/jxZBhVBWyIUCjtf6Km/bf9SyDC
	iPLIDAxTyehjE/OORhItHR/rMLzF5AoXVdMcJZ9bveYSb1Iz56EfwUAn+usHUrt7kW2nNyTBAHx
	ActkGfJ8uVtIRuo4Op/A==
X-Received: by 2002:a05:620a:439f:b0:915:94f7:55df with SMTP id af79cd13be357-915a9cb224fmr2865692985a.20.1780998453312;
        Tue, 09 Jun 2026 02:47:33 -0700 (PDT)
X-Received: by 2002:a05:620a:439f:b0:915:94f7:55df with SMTP id af79cd13be357-915a9cb224fmr2865688985a.20.1780998452904;
        Tue, 09 Jun 2026 02:47:32 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a00afafsm2047489485a.2.2026.06.09.02.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:47:32 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 17:46:33 +0800
Subject: [PATCH v7 11/15] drm/msm/dp: split dp_ctrl_off() into stream and
 link parts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-dp_mstclean-v7-11-ea04113e8233@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780998393; l=3896;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=V50+Rq87Zu55c599ZG/HVdfIbWqRw5QteR34CLOzRzw=;
 b=8JtMKVjwvmt+e2ppGSAUvJQoPjq3T1WtagBOkM/lfK/BuBRO77wxwYY/FIO5Pab9ahzN7h6gP
 LMLAdP9NbyyB/maC8ARI2xEfYlKpWMkyhoso441SKCsASyP2Aetvwnj
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: qrHqYOU0TNE2JK8keuAAHSJGvin9quHH
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a27e135 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=2kxiPxfbkJi5fZIrDGYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: qrHqYOU0TNE2JK8keuAAHSJGvin9quHH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5MCBTYWx0ZWRfX5hEj/OgMYtks
 0pDERTlW+0AIpZNHKxZTFUTb+zungHmfIFPdZQqTmNIp+7t5HQ6H+ZwCLBN8HHjbMORFQjEsscC
 ce1wV++yE9WCumBqtpMxODZuWFg1sMvFSwnSKfaMsn8KFjdzIQcsMxvEDvHFeCX1/v/xUvbC/Oq
 c0WTs11KNWNZznotv66NMd/B5gP6QpNBiybvujuwOe/tDbAYbp8lROymxgylqcdt7zgr2yIe3CY
 qy0WhIP1p+qA5GHmIAG1twhmxW8zgE2IE1bNA9xMpjmMJtxp8bM92B11MtRf+XhnX/EzBQ8fQi0
 wFf838V4ym7Wx23KBiKNdSxdng5CCT0MN46RzzLHtT3BmkYkSAwIwO3AAamxYfkRdmaeb2xu1jh
 9XHm82HjnSgj2Zn0QzFtBXvfU/Zrk8i71ahNnq81HpIGOSfFdAO5WfRlTsFPRFxp7BBa24w8GPE
 dAaFtlnbaad4C5yJqyA==
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112107-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 43C1165EA9D

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Split dp_ctrl_off() into stream and link parts so that for MST
cases we can control the link and pixel parts separately.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 10 +++++-----
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 +++--
 drivers/gpu/drm/msm/dp/dp_display.c |  7 ++++---
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 87c3a5517911..90fba03de7f0 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2211,7 +2211,7 @@ static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned l
 	return ret;
 }
 
-static void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
 
@@ -2240,7 +2240,8 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
 	 * running. Add the global reset just before disabling the
 	 * link clocks and core clocks.
 	 */
-	msm_dp_ctrl_off(&ctrl->msm_dp_ctrl, panel);
+	msm_dp_ctrl_off_pixel_clk(&ctrl->msm_dp_ctrl);
+	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl, panel);
 
 	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl, panel);
 	if (ret) {
@@ -2634,8 +2635,8 @@ void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl)
 	phy_init(phy);
 }
 
-void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl,
-		     struct msm_dp_panel *panel)
+void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
+			  struct msm_dp_panel *panel)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	struct phy *phy;
@@ -2649,7 +2650,6 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl,
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl, panel);
 
-	msm_dp_ctrl_off_pixel_clk(msm_dp_ctrl);
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 00b430392a52..5902cf7e746a 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -22,8 +22,9 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
 				  struct msm_dp_panel *panel,
 				  bool force_link_train);
-void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl,
-		     struct msm_dp_panel *panel);
+void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
+			  struct msm_dp_panel *panel);
+void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
 			    struct msm_dp_panel *panel);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 230e14615a23..8f472633da82 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -725,15 +725,16 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 
 		/* set dongle to D3 (power off) mode */
 		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
-		msm_dp_ctrl_off(dp->ctrl, dp->panel);
-		/* re-init the PHY so that we can listen to Dongle disconnect */
+		msm_dp_ctrl_off_pixel_clk(dp->ctrl);
+		msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
 		msm_dp_ctrl_reinit_phy(dp->ctrl);
 	} else {
 		/*
 		 * unplugged interrupt
 		 * dongle unplugged out of DUT
 		 */
-		msm_dp_ctrl_off(dp->ctrl, dp->panel);
+		msm_dp_ctrl_off_pixel_clk(dp->ctrl);
+		msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
 		msm_dp_display_host_phy_exit(dp);
 	}
 

-- 
2.43.0


