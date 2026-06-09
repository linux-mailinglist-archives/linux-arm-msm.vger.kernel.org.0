Return-Path: <linux-arm-msm+bounces-112106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yI49LIXkJ2rV4AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:01:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A961D65EA94
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:01:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JxuhRlmr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OSPIX8W2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112106-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112106-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8C22A30877C2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E725C3F58EB;
	Tue,  9 Jun 2026 09:47:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7903F54A4
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:47:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998452; cv=none; b=Ni33oPX+pAnxC/g3L9vIG5Csv6tGdlYXQUF/CQnD+SXZ8h8YW+OtEpvP5UiX7tFjcGBkoX5PqNYBxIhq0Yij31wfBdyL5s8fjzU+ZzUVVrB3H2Zl6bxCLk1IftE1/9GUHQ66qZytVmxwXoydu17hCB1Ivg28tt5SZ/n5srA0690=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998452; c=relaxed/simple;
	bh=ZRFBR56BzQUz+pR0m2yjwRVvezzmqgrYLgNu6IxtVtw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qvWAXQj/G9YGFQ54LSki9AMqTkBEx5V3uxTU6SodHlUVqTrfDWgSUE/9aHwXyvn2dMYhlupoy68qJhV5ZDJakewikJmOnZCnI9PyK1/5QXAWTFt8yH4RKUztRy8hFM0tZ2BY0MmEFJ48hu4BQCMxFp5+gsvcwXavw9iQctwp9Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JxuhRlmr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OSPIX8W2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rdRA1958629
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7hb/FfVnd7PMoaRS4u6TXp4l3uKqHy74XnbEX6RG4Go=; b=JxuhRlmrIaRuaN/8
	DeRP1p2EA+7Me7PsYI4xrZqMUO95HVn9KuahVGvjgaz7GWWjCKUHcjO9WvvTuuDG
	0d/oosBrQ2nfSzZ0gEQ0EO4W7Cq+5mwwKEaK9WOW4n6uBgkB5djT7dKXjiFm6Zmn
	sOYwCEAft1lat9zgJYHjnSuiPn4Xsf76G0NeLRllCkoUvLZaWLmavHtQaXTzF+l8
	AtpGoaD7BhKcYveN7xJ4iJj9SsgroyepnEf0H2y940FlyfxXazFktAJeSjejjZW6
	KdQ8m5f2IIb8GScC8IziEA0VYNF4T+VdxyEqsclLON9tGp4ZqbbiWfElblPnCeQQ
	Wk/3HQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdds8vk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:47:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91577337648so634473585a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780998449; x=1781603249; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7hb/FfVnd7PMoaRS4u6TXp4l3uKqHy74XnbEX6RG4Go=;
        b=OSPIX8W2yB9KO7RSDHNtvLTF9+awNBVPBTuD8i22mtb14s3o0flvEEoQ8jqzAdng+E
         Ti5RHYzRPE059/Qqj6Rs7uE7WTTzUfaXBT3uqKTKymsZmgT3LkXP/KTF8qJGfJgfsaC7
         HR15vq64UdUAGQnjbBHncP2K+FCoucpChGNCApV1RW1/4VoaiHQOFsFkNMYkYhWuKDct
         GAf4oMeFTO7N9RDzLfPyvFRRyrx9j9+oHzxx9Atwr3TsvHUMEVfM6ZFP4A9Ly3Nz+gOU
         VTVcJIfHbFJIzXhkYY1SSTpYxoccIdNBUAOvDrInQR6wzQYKn+o785K8WSOs20cEMt9z
         ocGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998449; x=1781603249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7hb/FfVnd7PMoaRS4u6TXp4l3uKqHy74XnbEX6RG4Go=;
        b=JZF+SbLiKwK0xtCg7uRDvdrxNkYr0URAkLQ9OeTsUWcFAg2PkiPhDkbnAgWGdRyzvE
         anbIG9XK6pYgIUZaqevNfF/X08OWpRCDNqTRieJb/HctwBakNSGXvaAo2eH86wyUXKUo
         ISHc07RP8a8Lijb0lbg/YgpdSjy9wvsjwd6DWswPpk4lLBEbsDAHSrwOUVRYQwTD0RFU
         qaBOoE5lbO5xV4dynLHpx4qf4+cTRXaIqL0hjbtxqE7FJy4I/WvDoMN4MVL96szI3yr1
         VoYSrb/Zbwbf0ndzzfm+uo6RzGEG8TzCohVD8hZlI3edluYT49Z/GUtV734Y7fKJ/pds
         xO0w==
X-Gm-Message-State: AOJu0YzFwH4FwW8ZJ8Z4V4NsPx2SUPVUcaidPngi5LflKmB5BTKMBxuK
	doQv97p28AErubGOuuYGWPPGbbRv8JwCT/oYNlS8+1fxXDQmmpSoJ1zarLTEzPg8jnxBw2SdkPK
	eGrSSz0FJpG+9O34XqUeHWCZvRqvepgC65iV1EESXz0tJPlIXVLfkXDO7aEsWNYuuvrIi
X-Gm-Gg: Acq92OGXf0+mj3Iui2ZXjK88nafxqca25DCBY22SrQPiR3fwWxOI7hwfqCvsB/mATro
	NgpHqtzx00JC2ruAICdoc3eaVwhPPInvZzXJ8Gxp7c8Rohj/KXOFDqNZp0S0g41cPAQetNHE6I/
	UPo3dGHEU64eMi/TSZX18QPjYhRa1dgIQxP5Bzt/1uqfXCDO+OaJiUJKxrugfLJherzxaYx8B64
	7Ad//OwUFlzo06Fio5XdtBSUsl6+/Ek7hLTx0krH7KeGjtbAhqD+dUtx58qhxBcusURJp79GT8D
	e/Tr7HaOJNw3l6NknbZCpZNqbBc5G6xUywfP2YioZhGa+Yy9I+eg6TbmOcVssQT+iIwa1acoKRk
	SG/PJgNIWohsM3LxlK1sylZxShU29dtzbimV1lnct8NVTCuTZk6Sd7+c4eTZMj1mfIltPT0U50Z
	VXtghKY78brODAiMYciA==
X-Received: by 2002:a05:620a:f12:b0:915:89d4:df17 with SMTP id af79cd13be357-915a9d76032mr3188247285a.33.1780998448452;
        Tue, 09 Jun 2026 02:47:28 -0700 (PDT)
X-Received: by 2002:a05:620a:f12:b0:915:89d4:df17 with SMTP id af79cd13be357-915a9d76032mr3188243285a.33.1780998447934;
        Tue, 09 Jun 2026 02:47:27 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a00afafsm2047489485a.2.2026.06.09.02.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:47:27 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 17:46:32 +0800
Subject: [PATCH v7 10/15] drm/msm/dp: allow dp_ctrl stream APIs to use any
 panel passed to it
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-dp_mstclean-v7-10-ea04113e8233@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780998393; l=32357;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=fBTI5DSJUakJQJtBZ9iXtP+zjtz0ryhulbsAIEWR9ZU=;
 b=slZwAD5uoACxcXgw8ABYdS9Z4blEWQLT0IHPCTIX+1A5D5oTJzFPkqQMRT8iBIrLy9WNuW9n8
 LVGHgOwCvrIBYxNpvsNg9duOUyvrudwAs60ciL/zsMI4AvN64CnVnea
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: xBDUfHN-cIhxgvPzsfM9QwPXrRvvu1eC
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a27e131 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=531mWe0hPKX_9nM1v_MA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: xBDUfHN-cIhxgvPzsfM9QwPXrRvvu1eC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5MCBTYWx0ZWRfX6K8lyfKyXpmL
 HsQfvA/0053GjnYyG4KJ4oJkPuJ1H/noqr5CaLFwDDEPnK/rGDrHIc2kQuQmS28tV6vzcbVv+L+
 vaFUnJRByUZ6ojPATovixBZHZHLFnfoQEOPL4W3dA52apeD7T8Dek9WGanbNLfCV+EYqVIX37G0
 OfLbR00CwTdYjOQccVa8Hamda4v6WUOT4zVztHThTHjayapKVeucaihwdim1wToW691EeVTJ6mb
 Ku8QKjpLFC/AsKeoWLoK2ArGy4sPmuftXknEMpeh9zbormdlIMlUoQeA0wXylTXtuXoocXtTDTe
 pmfu3U/LVR7QnG43fWD8W1kT7A7jGCMEx1+MzthAfUHJY4fQZLBOZboiar1odgr4ebpupi9BtrJ
 zHjYku0ZPK4obhjCgc8x4QCZ+A3zdf6z+jHELWgSP4L28bCCZ3iSSrc0WWzAETiBauTsj/IiqRj
 +HhWaLBpNgbgFhfJoqQ==
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
	TAGGED_FROM(0.00)[bounces-112106-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
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
X-Rspamd-Queue-Id: A961D65EA94

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

With MST, multiple sinks share a single DP controller, so a cached
panel in msm_dp_ctrl_private can no longer represent the per-stream
sink. Drop the cache and pass panel explicitly to all stream-related
dp_ctrl APIs.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 196 ++++++++++++++++++++----------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  28 ++++--
 drivers/gpu/drm/msm/dp/dp_display.c |  24 ++---
 3 files changed, 140 insertions(+), 108 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 626b95d4d015..87c3a5517911 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -114,7 +114,6 @@ struct msm_dp_ctrl_private {
 	struct drm_device *drm_dev;
 	struct device *dev;
 	struct drm_dp_aux *aux;
-	struct msm_dp_panel *panel;
 	struct msm_dp_link *link;
 	void __iomem *ahb_base;
 	void __iomem *link_base;
@@ -202,7 +201,8 @@ static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
 /*
  * NOTE: resetting DP controller will also clear any pending HPD related interrupts
  */
-void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl,
+		       struct msm_dp_panel *panel)
 {
 	struct msm_dp_ctrl_private *ctrl =
 		container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
@@ -219,7 +219,7 @@ void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	if (!ctrl->hw_revision) {
 		ctrl->hw_revision = msm_dp_read_ahb(ctrl, REG_DP_HW_VERSION);
-		ctrl->panel->hw_revision = ctrl->hw_revision;
+		panel->hw_revision = ctrl->hw_revision;
 	}
 }
 
@@ -414,10 +414,11 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
 	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
 }
 
-static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl,
+					 struct msm_dp_panel *panel)
 {
 	u32 config = 0;
-	const u8 *dpcd = ctrl->panel->dpcd;
+	const u8 *dpcd = panel->dpcd;
 
 	/* Default-> LSCLK DIV: 1/4 LCLK  */
 	config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
@@ -480,13 +481,14 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
 	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0, misc_val);
 }
 
-static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl,
+						struct msm_dp_panel *panel)
 {
-	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
+	msm_dp_ctrl_config_ctrl_streams(ctrl, panel);
 
-	msm_dp_ctrl_config_misc1_misc0(ctrl, ctrl->panel);
+	msm_dp_ctrl_config_misc1_misc0(ctrl, panel);
 
-	msm_dp_panel_timing_cfg(ctrl->panel, ctrl->msm_dp_ctrl.wide_bus_en);
+	msm_dp_panel_timing_cfg(panel, ctrl->msm_dp_ctrl.wide_bus_en);
 }
 
 /*
@@ -1256,20 +1258,21 @@ static void _dp_ctrl_calc_tu(struct msm_dp_ctrl_private *ctrl,
 }
 
 static void msm_dp_ctrl_calc_tu_parameters(struct msm_dp_ctrl_private *ctrl,
+		struct msm_dp_panel *panel,
 		struct msm_dp_vc_tu_mapping_table *tu_table)
 {
 	struct msm_dp_tu_calc_input in;
-	struct drm_display_mode *drm_mode;
+	const struct drm_display_mode *drm_mode;
 
-	drm_mode = &ctrl->panel->msm_dp_mode.drm_mode;
+	drm_mode = &panel->msm_dp_mode.drm_mode;
 
 	in.lclk = ctrl->link->link_params.rate / 1000;
 	in.pclk_khz = drm_mode->clock;
 	in.hactive = drm_mode->hdisplay;
 	in.hporch = drm_mode->htotal - drm_mode->hdisplay;
 	in.nlanes = ctrl->link->link_params.num_lanes;
-	in.bpp = ctrl->panel->msm_dp_mode.bpp;
-	in.pixel_enc = ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420 ? 420 : 444;
+	in.bpp = panel->msm_dp_mode.bpp;
+	in.pixel_enc = panel->msm_dp_mode.out_fmt_is_yuv_420 ? 420 : 444;
 	in.dsc_en = 0;
 	in.async_en = 0;
 	in.fec_en = 0;
@@ -1279,14 +1282,15 @@ static void msm_dp_ctrl_calc_tu_parameters(struct msm_dp_ctrl_private *ctrl,
 	_dp_ctrl_calc_tu(ctrl, &in, tu_table);
 }
 
-static void msm_dp_ctrl_setup_tr_unit(struct msm_dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_setup_tr_unit(struct msm_dp_ctrl_private *ctrl,
+				      struct msm_dp_panel *panel)
 {
 	u32 msm_dp_tu = 0x0;
 	u32 valid_boundary = 0x0;
 	u32 valid_boundary2 = 0x0;
 	struct msm_dp_vc_tu_mapping_table tu_calc_table;
 
-	msm_dp_ctrl_calc_tu_parameters(ctrl, &tu_calc_table);
+	msm_dp_ctrl_calc_tu_parameters(ctrl, panel, &tu_calc_table);
 
 	msm_dp_tu |= tu_calc_table.tu_size_minus1;
 	valid_boundary |= tu_calc_table.valid_boundary_link;
@@ -1438,6 +1442,7 @@ static int msm_dp_ctrl_set_pattern_state_bit(struct msm_dp_ctrl_private *ctrl,
 }
 
 static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
+			struct msm_dp_panel *panel,
 			int *training_step, enum drm_dp_phy dp_phy)
 {
 	int delay_us;
@@ -1446,7 +1451,7 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
 	int const maximum_retries = 4;
 
 	delay_us = drm_dp_read_clock_recovery_delay(ctrl->aux,
-						    ctrl->panel->dpcd, dp_phy, false);
+						    panel->dpcd, dp_phy, false);
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, 0);
 
@@ -1532,14 +1537,15 @@ static int msm_dp_ctrl_link_rate_down_shift(struct msm_dp_ctrl_private *ctrl)
 	return ret;
 }
 
-static int msm_dp_ctrl_link_lane_down_shift(struct msm_dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_link_lane_down_shift(struct msm_dp_ctrl_private *ctrl,
+					    struct msm_dp_panel *panel)
 {
 
 	if (ctrl->link->link_params.num_lanes == 1)
 		return -1;
 
 	ctrl->link->link_params.num_lanes /= 2;
-	ctrl->link->link_params.rate = ctrl->panel->link_info.rate;
+	ctrl->link->link_params.rate = panel->link_info.rate;
 
 	ctrl->link->phy_params.p_level = 0;
 	ctrl->link->phy_params.v_level = 0;
@@ -1548,6 +1554,7 @@ static int msm_dp_ctrl_link_lane_down_shift(struct msm_dp_ctrl_private *ctrl)
 }
 
 static void msm_dp_ctrl_clear_training_pattern(struct msm_dp_ctrl_private *ctrl,
+					       struct msm_dp_panel *panel,
 					       enum drm_dp_phy dp_phy)
 {
 	int delay_us;
@@ -1555,11 +1562,12 @@ static void msm_dp_ctrl_clear_training_pattern(struct msm_dp_ctrl_private *ctrl,
 	msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_DISABLE, dp_phy);
 
 	delay_us = drm_dp_read_channel_eq_delay(ctrl->aux,
-						ctrl->panel->dpcd, dp_phy, false);
+						panel->dpcd, dp_phy, false);
 	fsleep(delay_us);
 }
 
 static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
+			struct msm_dp_panel *panel,
 			int *training_step, enum drm_dp_phy dp_phy)
 {
 	int delay_us;
@@ -1570,16 +1578,16 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
 	u8 link_status[DP_LINK_STATUS_SIZE];
 
 	delay_us = drm_dp_read_channel_eq_delay(ctrl->aux,
-						ctrl->panel->dpcd, dp_phy, false);
+						panel->dpcd, dp_phy, false);
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, 0);
 
 	*training_step = DP_TRAINING_2;
 
-	if (drm_dp_tps4_supported(ctrl->panel->dpcd)) {
+	if (drm_dp_tps4_supported(panel->dpcd)) {
 		pattern = DP_TRAINING_PATTERN_4;
 		state_ctrl_bit = 4;
-	} else if (drm_dp_tps3_supported(ctrl->panel->dpcd)) {
+	} else if (drm_dp_tps3_supported(panel->dpcd)) {
 		pattern = DP_TRAINING_PATTERN_3;
 		state_ctrl_bit = 3;
 	} else {
@@ -1616,18 +1624,19 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
 }
 
 static int msm_dp_ctrl_link_train_1_2(struct msm_dp_ctrl_private *ctrl,
+				      struct msm_dp_panel *panel,
 				      int *training_step, enum drm_dp_phy dp_phy)
 {
 	int ret;
 
-	ret = msm_dp_ctrl_link_train_1(ctrl, training_step, dp_phy);
+	ret = msm_dp_ctrl_link_train_1(ctrl, panel, training_step, dp_phy);
 	if (ret) {
 		DRM_ERROR("link training #1 on phy %d failed. ret=%d\n", dp_phy, ret);
 		return ret;
 	}
 	drm_dbg_dp(ctrl->drm_dev, "link training #1 on phy %d successful\n", dp_phy);
 
-	ret = msm_dp_ctrl_link_train_2(ctrl, training_step, dp_phy);
+	ret = msm_dp_ctrl_link_train_2(ctrl, panel, training_step, dp_phy);
 	if (ret) {
 		DRM_ERROR("link training #2 on phy %d failed. ret=%d\n", dp_phy, ret);
 		return ret;
@@ -1638,16 +1647,17 @@ static int msm_dp_ctrl_link_train_1_2(struct msm_dp_ctrl_private *ctrl,
 }
 
 static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
+			struct msm_dp_panel *panel,
 			int *training_step)
 {
 	int i;
 	int ret = 0;
-	const u8 *dpcd = ctrl->panel->dpcd;
+	const u8 *dpcd = panel->dpcd;
 	u8 encoding[] = { 0, DP_SET_ANSI_8B10B };
 	u8 assr;
 	struct msm_dp_link_info link_info = {0};
 
-	msm_dp_ctrl_config_ctrl_link(ctrl);
+	msm_dp_ctrl_config_ctrl_link(ctrl, panel);
 
 	link_info.num_lanes = ctrl->link->link_params.num_lanes;
 	link_info.rate = ctrl->link->link_params.rate;
@@ -1670,8 +1680,8 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 	for (i = ctrl->link->lttpr_count - 1; i >= 0; i--) {
 		enum drm_dp_phy dp_phy = DP_PHY_LTTPR(i);
 
-		ret = msm_dp_ctrl_link_train_1_2(ctrl, training_step, dp_phy);
-		msm_dp_ctrl_clear_training_pattern(ctrl, dp_phy);
+		ret = msm_dp_ctrl_link_train_1_2(ctrl, panel, training_step, dp_phy);
+		msm_dp_ctrl_clear_training_pattern(ctrl, panel, dp_phy);
 
 		if (ret)
 			break;
@@ -1682,7 +1692,7 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 		goto end;
 	}
 
-	ret = msm_dp_ctrl_link_train_1_2(ctrl, training_step, DP_PHY_DPRX);
+	ret = msm_dp_ctrl_link_train_1_2(ctrl, panel, training_step, DP_PHY_DPRX);
 	if (ret) {
 		DRM_ERROR("link training on sink failed. ret=%d\n", ret);
 		goto end;
@@ -1695,6 +1705,7 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 }
 
 static int msm_dp_ctrl_setup_main_link(struct msm_dp_ctrl_private *ctrl,
+			struct msm_dp_panel *panel,
 			int *training_step)
 {
 	int ret = 0;
@@ -1710,7 +1721,7 @@ static int msm_dp_ctrl_setup_main_link(struct msm_dp_ctrl_private *ctrl,
 	 * a link training pattern, we have to first do soft reset.
 	 */
 
-	ret = msm_dp_ctrl_link_train(ctrl, training_step);
+	ret = msm_dp_ctrl_link_train(ctrl, panel, training_step);
 
 	return ret;
 }
@@ -1809,11 +1820,12 @@ static void msm_dp_ctrl_link_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
 		   str_on_off(ctrl->core_clks_on));
 }
 
-static int msm_dp_ctrl_enable_mainlink_clocks(struct msm_dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_enable_mainlink_clocks(struct msm_dp_ctrl_private *ctrl,
+					      struct msm_dp_panel *panel)
 {
 	int ret = 0;
 	struct phy *phy = ctrl->phy;
-	const u8 *dpcd = ctrl->panel->dpcd;
+	const u8 *dpcd = panel->dpcd;
 
 	ctrl->phy_opts.dp.lanes = ctrl->link->link_params.num_lanes;
 	ctrl->phy_opts.dp.link_rate = ctrl->link->link_params.rate / 100;
@@ -1865,13 +1877,14 @@ static void msm_dp_ctrl_psr_exit(struct msm_dp_ctrl_private *ctrl)
 	msm_dp_write_link(ctrl, REG_PSR_CMD, cmd);
 }
 
-void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl,
+			    struct msm_dp_panel *panel)
 {
 	struct msm_dp_ctrl_private *ctrl = container_of(msm_dp_ctrl,
 			struct msm_dp_ctrl_private, msm_dp_ctrl);
 	u32 cfg;
 
-	if (!ctrl->panel->psr_cap.version)
+	if (!panel->psr_cap.version)
 		return;
 
 	/* enable PSR1 function */
@@ -1886,12 +1899,13 @@ void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl)
 	drm_dp_dpcd_write(ctrl->aux, DP_PSR_EN_CFG, &cfg, 1);
 }
 
-void msm_dp_ctrl_set_psr(struct msm_dp_ctrl *msm_dp_ctrl, bool enter)
+void msm_dp_ctrl_set_psr(struct msm_dp_ctrl *msm_dp_ctrl,
+			 struct msm_dp_panel *panel, bool enter)
 {
 	struct msm_dp_ctrl_private *ctrl = container_of(msm_dp_ctrl,
 			struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	if (!ctrl->panel->psr_cap.version)
+	if (!panel->psr_cap.version)
 		return;
 
 	/*
@@ -1961,7 +1975,8 @@ void msm_dp_ctrl_phy_exit(struct msm_dp_ctrl *msm_dp_ctrl)
 	phy_exit(phy);
 }
 
-static int msm_dp_ctrl_reinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_reinitialize_mainlink(struct msm_dp_ctrl_private *ctrl,
+					     struct msm_dp_panel *panel)
 {
 	struct phy *phy = ctrl->phy;
 	int ret = 0;
@@ -1982,7 +1997,7 @@ static int msm_dp_ctrl_reinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
 	/* hw recommended delay before re-enabling clocks */
 	msleep(20);
 
-	ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl);
+	ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl, panel);
 	if (ret) {
 		DRM_ERROR("Failed to enable mainlink clks. ret=%d\n", ret);
 		return ret;
@@ -1991,7 +2006,8 @@ static int msm_dp_ctrl_reinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
 	return ret;
 }
 
-static int msm_dp_ctrl_deinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_deinitialize_mainlink(struct msm_dp_ctrl_private *ctrl,
+					     struct msm_dp_panel *panel)
 {
 	struct phy *phy;
 
@@ -1999,7 +2015,7 @@ static int msm_dp_ctrl_deinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
 
 	msm_dp_ctrl_mainlink_disable(ctrl);
 
-	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
+	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl, panel);
 
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
@@ -2013,7 +2029,8 @@ static int msm_dp_ctrl_deinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
 	return 0;
 }
 
-static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl,
+					struct msm_dp_panel *panel)
 {
 	int ret = 0;
 	int training_step = DP_TRAINING_NONE;
@@ -2023,11 +2040,11 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
 	ctrl->link->phy_params.p_level = 0;
 	ctrl->link->phy_params.v_level = 0;
 
-	ret = msm_dp_ctrl_setup_main_link(ctrl, &training_step);
+	ret = msm_dp_ctrl_setup_main_link(ctrl, panel, &training_step);
 	if (ret)
 		goto end;
 
-	msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
+	msm_dp_ctrl_clear_training_pattern(ctrl, panel, DP_PHY_DPRX);
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
@@ -2206,7 +2223,8 @@ static void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
 	}
 }
 
-static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl,
+						struct msm_dp_panel *panel)
 {
 	int ret;
 	unsigned long pixel_rate;
@@ -2222,15 +2240,15 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
 	 * running. Add the global reset just before disabling the
 	 * link clocks and core clocks.
 	 */
-	msm_dp_ctrl_off(&ctrl->msm_dp_ctrl);
+	msm_dp_ctrl_off(&ctrl->msm_dp_ctrl, panel);
 
-	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl);
+	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl, panel);
 	if (ret) {
 		DRM_ERROR("failed to enable DP link controller\n");
 		return ret;
 	}
 
-	pixel_rate = ctrl->panel->msm_dp_mode.drm_mode.clock;
+	pixel_rate = panel->msm_dp_mode.drm_mode.clock;
 	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
 
 	msm_dp_ctrl_send_phy_test_pattern(ctrl);
@@ -2238,7 +2256,8 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
 	return 0;
 }
 
-void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl,
+				     struct msm_dp_panel *panel)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	u32 sink_request = 0x0;
@@ -2253,14 +2272,14 @@ void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	if (sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
 		drm_dbg_dp(ctrl->drm_dev, "PHY_TEST_PATTERN request\n");
-		if (msm_dp_ctrl_process_phy_test_request(ctrl)) {
+		if (msm_dp_ctrl_process_phy_test_request(ctrl, panel)) {
 			DRM_ERROR("process phy_test_req failed\n");
 			return;
 		}
 	}
 
 	if (sink_request & DP_LINK_STATUS_UPDATED) {
-		if (msm_dp_ctrl_link_maintenance(ctrl)) {
+		if (msm_dp_ctrl_link_maintenance(ctrl, panel)) {
 			DRM_ERROR("LM failed: TEST_LINK_TRAINING\n");
 			return;
 		}
@@ -2268,7 +2287,7 @@ void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	if (sink_request & DP_TEST_LINK_TRAINING) {
 		msm_dp_link_send_test_response(ctrl->link);
-		if (msm_dp_ctrl_link_maintenance(ctrl)) {
+		if (msm_dp_ctrl_link_maintenance(ctrl, panel)) {
 			DRM_ERROR("LM failed: TEST_LINK_TRAINING\n");
 			return;
 		}
@@ -2304,7 +2323,8 @@ static bool msm_dp_ctrl_channel_eq_ok(struct msm_dp_ctrl_private *ctrl)
 	return drm_dp_channel_eq_ok(link_status, num_lanes);
 }
 
-int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
+int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
+			struct msm_dp_panel *panel)
 {
 	int rc = 0;
 	struct msm_dp_ctrl_private *ctrl;
@@ -2320,8 +2340,8 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	rate = ctrl->panel->link_info.rate;
-	pixel_rate = ctrl->panel->msm_dp_mode.drm_mode.clock;
+	rate = panel->link_info.rate;
+	pixel_rate = panel->msm_dp_mode.drm_mode.clock;
 
 	msm_dp_ctrl_core_clk_enable(&ctrl->msm_dp_ctrl);
 
@@ -2333,8 +2353,8 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 	} else {
 		ctrl->link->link_params.rate = rate;
 		ctrl->link->link_params.num_lanes =
-			ctrl->panel->link_info.num_lanes;
-		if (ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
+			panel->link_info.num_lanes;
+		if (panel->msm_dp_mode.out_fmt_is_yuv_420)
 			pixel_rate >>= 1;
 	}
 
@@ -2342,13 +2362,13 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 		ctrl->link->link_params.rate, ctrl->link->link_params.num_lanes,
 		pixel_rate);
 
-	rc = msm_dp_ctrl_enable_mainlink_clocks(ctrl);
+	rc = msm_dp_ctrl_enable_mainlink_clocks(ctrl, panel);
 	if (rc)
 		return rc;
 
 	while (--link_train_max_retries) {
 		training_step = DP_TRAINING_NONE;
-		rc = msm_dp_ctrl_setup_main_link(ctrl, &training_step);
+		rc = msm_dp_ctrl_setup_main_link(ctrl, panel, &training_step);
 		if (rc == 0) {
 			/* training completed successfully */
 			break;
@@ -2367,7 +2387,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 					 * some lanes are ready,
 					 * reduce lane number
 					 */
-					rc = msm_dp_ctrl_link_lane_down_shift(ctrl);
+					rc = msm_dp_ctrl_link_lane_down_shift(ctrl, panel);
 					if (rc < 0) { /* lane == 1 already */
 						/* end with failure */
 						break;
@@ -2388,7 +2408,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 					ctrl->link->link_params.num_lanes))
 				rc = msm_dp_ctrl_link_rate_down_shift(ctrl);
 			else
-				rc = msm_dp_ctrl_link_lane_down_shift(ctrl);
+				rc = msm_dp_ctrl_link_lane_down_shift(ctrl, panel);
 
 			if (rc < 0) {
 				/* end with failure */
@@ -2396,10 +2416,10 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 			}
 
 			/* stop link training before start re training  */
-			msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
+			msm_dp_ctrl_clear_training_pattern(ctrl, panel, DP_PHY_DPRX);
 		}
 
-		rc = msm_dp_ctrl_reinitialize_mainlink(ctrl);
+		rc = msm_dp_ctrl_reinitialize_mainlink(ctrl, panel);
 		if (rc) {
 			DRM_ERROR("Failed to reinitialize mainlink. rc=%d\n", rc);
 			break;
@@ -2420,20 +2440,21 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 		 * link training failed
 		 * end txing train pattern here
 		 */
-		msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
+		msm_dp_ctrl_clear_training_pattern(ctrl, panel, DP_PHY_DPRX);
 
-		msm_dp_ctrl_deinitialize_mainlink(ctrl);
+		msm_dp_ctrl_deinitialize_mainlink(ctrl, panel);
 		rc = -ECONNRESET;
 	}
 
 	return rc;
 }
 
-static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl,
+				    struct msm_dp_panel *panel)
 {
 	int training_step = DP_TRAINING_NONE;
 
-	return msm_dp_ctrl_setup_main_link(ctrl, &training_step);
+	return msm_dp_ctrl_setup_main_link(ctrl, panel, &training_step);
 }
 
 static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
@@ -2504,7 +2525,9 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
 	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID, nvid);
 }
 
-int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
+int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
+				  struct msm_dp_panel *panel,
+				  bool force_link_train)
 {
 	int ret = 0;
 	struct msm_dp_ctrl_private *ctrl;
@@ -2523,7 +2546,7 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_li
 		ctrl->core_clks_on, ctrl->link_clks_on, ctrl->stream_clks_on);
 
 	if (!ctrl->link_clks_on) { /* link clk is off */
-		ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl);
+		ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl, panel);
 		if (ret) {
 			DRM_ERROR("Failed to start link clocks. ret=%d\n", ret);
 			return ret;
@@ -2531,15 +2554,15 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_li
 	}
 
 	if (force_link_train || !msm_dp_ctrl_channel_eq_ok(ctrl))
-		msm_dp_ctrl_link_retrain(ctrl);
+		msm_dp_ctrl_link_retrain(ctrl, panel);
 
 	/* stop txing train pattern to end link training */
-	msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
+	msm_dp_ctrl_clear_training_pattern(ctrl, panel, DP_PHY_DPRX);
 
 	return ret;
 }
 
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel)
 {
 	int ret = 0;
 	bool mainlink_ready = false;
@@ -2552,10 +2575,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	pixel_rate_orig = ctrl->panel->msm_dp_mode.drm_mode.clock;
+	pixel_rate_orig = panel->msm_dp_mode.drm_mode.clock;
 	pixel_rate = pixel_rate_orig;
 
-	if (msm_dp_ctrl->wide_bus_en || ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
+	if (msm_dp_ctrl->wide_bus_en || panel->msm_dp_mode.out_fmt_is_yuv_420)
 		pixel_rate >>= 1;
 
 	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
@@ -2572,18 +2595,18 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	msm_dp_ctrl_lane_mapping(ctrl);
 	msm_dp_setup_peripheral_flush(ctrl);
-	msm_dp_ctrl_config_ctrl_link(ctrl);
+	msm_dp_ctrl_config_ctrl_link(ctrl, panel);
 
-	msm_dp_ctrl_configure_source_params(ctrl);
+	msm_dp_ctrl_configure_source_params(ctrl, panel);
 
 	msm_dp_ctrl_config_msa(ctrl,
 		ctrl->link->link_params.rate,
 		pixel_rate_orig,
-		ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
+		panel->msm_dp_mode.out_fmt_is_yuv_420);
 
-	msm_dp_panel_clear_dsc_dto(ctrl->panel);
+	msm_dp_panel_clear_dsc_dto(panel);
 
-	msm_dp_ctrl_setup_tr_unit(ctrl);
+	msm_dp_ctrl_setup_tr_unit(ctrl, panel);
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
@@ -2611,7 +2634,8 @@ void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl)
 	phy_init(phy);
 }
 
-void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl,
+		     struct msm_dp_panel *panel)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	struct phy *phy;
@@ -2619,11 +2643,11 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	phy = ctrl->phy;
 
-	msm_dp_panel_disable_vsc_sdp(ctrl->panel);
+	msm_dp_panel_disable_vsc_sdp(panel);
 
 	msm_dp_ctrl_mainlink_disable(ctrl);
 
-	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
+	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl, panel);
 
 	msm_dp_ctrl_off_pixel_clk(msm_dp_ctrl);
 	dev_pm_opp_set_rate(ctrl->dev, 0);
@@ -2632,7 +2656,8 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 	phy_power_off(phy);
 }
 
-irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
+irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
+			    struct msm_dp_panel *panel)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	u32 isr;
@@ -2643,7 +2668,7 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	if (ctrl->panel->psr_cap.version) {
+	if (panel->psr_cap.version) {
 		isr = msm_dp_ctrl_get_psr_interrupt(ctrl);
 
 		if (isr)
@@ -2732,7 +2757,7 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
 }
 
 struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link,
-			struct msm_dp_panel *panel,	struct drm_dp_aux *aux,
+			struct drm_dp_aux *aux,
 			struct phy *phy,
 			void __iomem *ahb_base,
 			void __iomem *link_base)
@@ -2740,7 +2765,7 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 	struct msm_dp_ctrl_private *ctrl;
 	int ret;
 
-	if (!dev || !panel || !aux || !link) {
+	if (!dev || !aux || !link) {
 		DRM_ERROR("invalid input\n");
 		return ERR_PTR(-EINVAL);
 	}
@@ -2768,7 +2793,6 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 	init_completion(&ctrl->video_comp);
 
 	/* in parameters */
-	ctrl->panel    = panel;
 	ctrl->aux      = aux;
 	ctrl->link     = link;
 	ctrl->dev      = dev;
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 5d615f50d13b..00b430392a52 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -16,28 +16,36 @@ struct msm_dp_ctrl {
 
 struct phy;
 
-int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
-int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
-void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
+int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
+			struct msm_dp_panel *panel);
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel);
+int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
+				  struct msm_dp_panel *panel,
+				  bool force_link_train);
+void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl,
+		     struct msm_dp_panel *panel);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
-irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
-void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl);
+irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
+			    struct msm_dp_panel *panel);
+void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl,
+				     struct msm_dp_panel *panel);
 struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev,
 				    struct msm_dp_link *link,
-				    struct msm_dp_panel *panel,
 				    struct drm_dp_aux *aux,
 				    struct phy *phy,
 				    void __iomem *ahb_base,
 				    void __iomem *link_base);
 
-void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl,
+		       struct msm_dp_panel *panel);
 void msm_dp_ctrl_phy_init(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_phy_exit(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_irq_phy_exit(struct msm_dp_ctrl *msm_dp_ctrl);
 
-void msm_dp_ctrl_set_psr(struct msm_dp_ctrl *msm_dp_ctrl, bool enable);
-void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_set_psr(struct msm_dp_ctrl *msm_dp_ctrl,
+			 struct msm_dp_panel *panel, bool enable);
+void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl,
+			    struct msm_dp_panel *panel);
 
 int msm_dp_ctrl_core_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index b8dab3f8a7c2..230e14615a23 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -359,7 +359,7 @@ static void msm_dp_display_host_init(struct msm_dp_display_private *dp)
 		dp->phy_initialized);
 
 	msm_dp_ctrl_core_clk_enable(dp->ctrl);
-	msm_dp_ctrl_reset(dp->ctrl);
+	msm_dp_ctrl_reset(dp->ctrl, dp->panel);
 	msm_dp_ctrl_enable_irq(dp->ctrl);
 	msm_dp_aux_init(dp->aux);
 	dp->core_initialized = true;
@@ -371,7 +371,7 @@ static void msm_dp_display_host_deinit(struct msm_dp_display_private *dp)
 		dp->msm_dp_display.connector_type, dp->core_initialized,
 		dp->phy_initialized);
 
-	msm_dp_ctrl_reset(dp->ctrl);
+	msm_dp_ctrl_reset(dp->ctrl, dp->panel);
 	msm_dp_ctrl_disable_irq(dp->ctrl);
 	msm_dp_aux_deinit(dp->aux);
 	msm_dp_ctrl_core_clk_disable(dp->ctrl);
@@ -392,7 +392,7 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
 
 	drm_dbg_dp(dp->drm_dev, "%d\n", sink_request);
 
-	msm_dp_ctrl_handle_sink_request(dp->ctrl);
+	msm_dp_ctrl_handle_sink_request(dp->ctrl, dp->panel);
 
 	if (sink_request & DP_TEST_LINK_VIDEO_PATTERN)
 		msm_dp_display_handle_video_request(dp);
@@ -570,7 +570,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		goto error_link;
 	}
 
-	dp->ctrl = msm_dp_ctrl_get(dev, dp->link, dp->panel, dp->aux,
+	dp->ctrl = msm_dp_ctrl_get(dev, dp->link, dp->aux,
 			       phy, dp->ahb_base, dp->link_base);
 	if (IS_ERR(dp->ctrl)) {
 		rc = PTR_ERR(dp->ctrl);
@@ -642,12 +642,12 @@ static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
 		force_link_train = true;
 	}
 
-	rc = msm_dp_ctrl_on_link(dp->ctrl);
+	rc = msm_dp_ctrl_on_link(dp->ctrl, dp->panel);
 	if (rc)
 		DRM_ERROR("Failed link training (rc=%d)\n", rc);
 	// TODO: schedule drm_connector_set_link_status_property()
 
-	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, force_link_train);
+	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
 }
 
 static int msm_dp_display_enable(struct msm_dp_display_private *dp)
@@ -661,7 +661,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp)
 		return 0;
 	}
 
-	rc = msm_dp_ctrl_on_stream(dp->ctrl);
+	rc = msm_dp_ctrl_on_stream(dp->ctrl, dp->panel);
 	if (!rc)
 		msm_dp_display->power_on = true;
 
@@ -686,7 +686,7 @@ static int msm_dp_display_post_enable(struct msm_dp *msm_dp_display)
 	msm_dp_display_handle_plugged_change(msm_dp_display, true);
 
 	if (msm_dp_display->psr_supported)
-		msm_dp_ctrl_config_psr(dp->ctrl);
+		msm_dp_ctrl_config_psr(dp->ctrl, dp->panel);
 
 	return 0;
 }
@@ -725,7 +725,7 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 
 		/* set dongle to D3 (power off) mode */
 		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
-		msm_dp_ctrl_off(dp->ctrl);
+		msm_dp_ctrl_off(dp->ctrl, dp->panel);
 		/* re-init the PHY so that we can listen to Dongle disconnect */
 		msm_dp_ctrl_reinit_phy(dp->ctrl);
 	} else {
@@ -733,7 +733,7 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 		 * unplugged interrupt
 		 * dongle unplugged out of DUT
 		 */
-		msm_dp_ctrl_off(dp->ctrl);
+		msm_dp_ctrl_off(dp->ctrl, dp->panel);
 		msm_dp_display_host_phy_exit(dp);
 	}
 
@@ -869,7 +869,7 @@ void msm_dp_display_set_psr(struct msm_dp *msm_dp_display, bool enter)
 	}
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
-	msm_dp_ctrl_set_psr(dp->ctrl, enter);
+	msm_dp_ctrl_set_psr(dp->ctrl, dp->panel, enter);
 }
 
 /**
@@ -979,7 +979,7 @@ static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
 	}
 
 	/* DP controller isr */
-	ret |= msm_dp_ctrl_isr(dp->ctrl);
+	ret |= msm_dp_ctrl_isr(dp->ctrl, dp->panel);
 
 	return ret;
 }

-- 
2.43.0


