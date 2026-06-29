Return-Path: <linux-arm-msm+bounces-115151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FshMKwmBQmro8gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:28:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2E76DC091
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:28:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SXU7iMmc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Un/cyEci";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115151-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115151-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7215D31C4AD5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47354310763;
	Mon, 29 Jun 2026 14:17:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86D3421F00
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742621; cv=none; b=gCOISO2rTRrf/usvYrIQP43Z3Y7aTlwvbDGpG6w6H1SNuqFOEgppJ4Va/JWamxBaMKC1E5onvbKycPSmGe0zbemcDimIghPKHTNxV8dnES4A6RIadIFwR1DjcAzsLSJPPovE5H1GDcOfRYF2gbMWsNcrJnwcR8ibHL2PLNNPZCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742621; c=relaxed/simple;
	bh=Nu7YW4TXEkufL2/VUa/aa1d9ExabRLDcY0ZzM8BCDDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E9mv45pm2ge25JOZfFson+Is8nwWBMEYt50O7d//I0h+b9q8YUjuyvQsVyUbZwgFhAB4v20+XE0BrzV8EHe4vKRHcXwDFseDCMOxiTMUXtSrUabceJ8KBGIQwZIG0s81f/I43r0MFUVs8C8NPYlhE71eMdVMQfJbTqwBKZZmO74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SXU7iMmc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Un/cyEci; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT3jx2641405
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q9GXCpGI2FZ2U+GAfjzoSbly46KsmEpGgfcu9nwsblA=; b=SXU7iMmcDyIcFmyT
	+a8iAuG7FzqVJ6eamj1jWYKeFTCIJ1KaX7bGjcCyrGKACNeU6FDEVCpkO8ApBMQE
	DMMKhAQQk5oJIZFhTf0kMAnoYscAnPxsR7sVBcfQDL5nSEtBX7G93vLIPJ3shTE2
	/lHvAbziPbWAcOGcx4GKXaTyyqXj0H9NTaCXzlENw/ZUMK4Q9rpqfz4QXLIbFCXW
	Tbv8CSGVOGVdiDBfV2DSXecsOlYty/NJdXQSyR2x6Gh2RvZq94lsoWAR8xD6k633
	qQ8Bt/IHb05d8mum156JZnqTj8oaVUR0CzPQNYCgNBli0m8/6DpRwxJ0EutuH/xP
	Xb5MUg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s1cb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ef18406878so25231086d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742618; x=1783347418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9GXCpGI2FZ2U+GAfjzoSbly46KsmEpGgfcu9nwsblA=;
        b=Un/cyEciEAfxtyMS6jQMZovfpihqNue4JYhadmL72uT6kDWvWqaHKPs495aFRJm2yZ
         0ChZlfVrPnnWL7t0Vd6HkUlBFm+2BO58USBh+uMCvin1gOiVMaiSqudae7UFBHb+qgdg
         1ZEdh5PiwbsMru3gAG7nphRAIuBLRMw775GaRi2lOBLjcONmYuvnYgq3wyInfYdPvZk+
         kJGPHYBq6OP6bl5Q/QzbHHbGbJpkmW4hLDrT3YDY+At0186ygJ/aCLJqPXvOPcuvTwyX
         s0jZhWV84dFpxyH5xOR83i4dvlp73KFzAoxbiGcJCEY8Pbs/6yGBfVmd1eZXYi7EZE+s
         wD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742618; x=1783347418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q9GXCpGI2FZ2U+GAfjzoSbly46KsmEpGgfcu9nwsblA=;
        b=P4QZUhWrzsgnh2Qi5tdpFU8RAHqLKqWpHkSfIkT2JY0X3i2mE83ATFub2wPyKjdzBg
         d3ddZ99JDQ0GsZ6Oi5uWZRtiHDOJL89CqXdEV1lvuo9dP+sWR79hfauIxlXgtD/G5XbB
         gj2jDnn+YIM/QKRSFPfVUDN/i5d+6JTAm3T9jUwla7Dj6knqgeh1af7GL/dOCKJaWdXJ
         Q/46oT2/3YOduOPfsyZVNgo7aySqpmODW3K/QRCUzZ55AxbI3F2Pj3XjMy0AALG8wEXz
         Zep+tazWYH6NjpETPkOeC+3LjTumk95enoAk+FUWpsYpJonqECxpbz/h09sziasR73YS
         JxiQ==
X-Gm-Message-State: AOJu0YyKDyoV1UIX3Jye8Cc/1ok/LonRdJuH/5FMcPxQvuVgTvs/a7wr
	2oU+LtjkH7MJ45pGHr6BzSUTqdJ/v8SA45CaWdXVovdBJPByoAzw0lJfpp2KHVBkenMXVMe4kRH
	HhkyBGiM7Cy015TFviqI4IU3F9sMLkQ1VZs2wr4eGYnCCKWzbG8V+u85NKJRC9JrExoTxM+ogJN
	FLuts=
X-Gm-Gg: AfdE7cniLxlIXGASZSpkif3OyEvgEMjFtHF0bJUb3Rx6pqn3fdyA1RsMrl9i5P68Ryq
	oFzgH8R4CZDXLJkwoYYPtQpSTvQcdB8YWD+ifDtmPBfg8WPnvhS/H1D1LGdsjQ4DWJ1sVtnfMND
	9sgCZ2CuukXqgNXGtD+jMVaPAUGQ+alMvsBCHLt64I9bChJQAbeAqc1AxEB1hIHXBzETBrlheRm
	w51gWcYziGwTXkp1eKlSm1ftfeFqFEKlNJIjoyCHgyM0fyvkc9UUE7Wh1PMhZ6L2Hue4+bU0Fuv
	KWP+nzTKfPe920RPgn589z3LulN6hRmU0p4MzK3FelXfcc3VDpV/VQyqEB7Jh6AnQoETct6VPw3
	BTXTAM5JjdHft8f45Nume4+1TTpbrxK/asK5NMLl0sWp8oY7PEoW9PgvV9U6MlixR5RoHAA==
X-Received: by 2002:a05:620a:2612:b0:920:91a7:1d99 with SMTP id af79cd13be357-92e5f04e0c7mr133125885a.7.1782742617525;
        Mon, 29 Jun 2026 07:16:57 -0700 (PDT)
X-Received: by 2002:a05:620a:2612:b0:920:91a7:1d99 with SMTP id af79cd13be357-92e5f04e0c7mr133121185a.7.1782742616923;
        Mon, 29 Jun 2026 07:16:56 -0700 (PDT)
Received: from yongmou2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9260079070bsm2143165885a.40.2026.06.29.07.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:16:56 -0700 (PDT)
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
Subject: [PATCH RESEND v5 21/25] drm/msm/dpu: use msm_dp_get_mst_intf_id() to get the intf id
Date: Mon, 29 Jun 2026 22:14:42 +0800
Message-ID: <20260629-msm-dp-mst-v5-21-2ed6aee1867a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782742144; l=4713; i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id; bh=Nu7YW4TXEkufL2/VUa/aa1d9ExabRLDcY0ZzM8BCDDg=; b=sZAUP8eAf/QiLXkrh0A2OThr4b7zwiZA/XoNAllvJ6p9D6zP/Zo1h+f6zdLyUu3JPJ8uv0w/i DpuomXbfuVKCN5amWahb6l6lhD4Kc9itatYsCBvtP/mOR2/sOgUtB3a
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519; pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX2felOTp56cUs
 xga+jEEO4aQ/Wyk3Mm2zCruoeobVFxVv2YvoE7xkWpEC8YFwW2kTNGs2M07tx/jeYqTN+aMktye
 xK6f9ahadUmcrS0TDXMKuNGVn0hxB4g=
X-Proofpoint-ORIG-GUID: avxWEneGRQNXtpP8D7y6gMLSxqn1YuI6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX86wL5efzcqpM
 DLYlzWsYmqphlRaOocte4pygNYZZomy4O8RWbHMbXnU1UcVeSQkqSxaub13l12GyoXQr8Z/fG1b
 eknBQjlq+g6eB1WJi1mvLel54hoMGhOG1T00FOK0OW6bv6PW/gZIRoXMF+XlrQuZEFAJbNkviU9
 GHufpESTWMaxCUnXxmx875L275VhzDrrDG1Y8UfcVWUXb6E5IN7UC8I3YvjXWhddrRBU3HHY0X7
 ZrxisyynwDlOYM5s4Jcz9m0D4gxL2x3x0u2xlstW/9mUcoxcPWft0iIya+II2B/ICAy3Y6kAVK1
 GW5ZGS9aB0e+TGe41AYqbw+EpI5MF8SxaZtNOj8OGr/I4Edg4YFmYYg6hA3szhLbo2LulyQD7PN
 RwU50J3LYzjK7/BJDAjNdoA9biEFg73u1iEWbY5GkaU4UbqVm2DhUwH6G0veHTIr1c7RKHIAdd5
 fOPxw/ssdaMxpq+K9/Q==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a427e5a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=xL80pz1hMqKSlDDrj7YA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: avxWEneGRQNXtpP8D7y6gMLSxqn1YuI6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115151-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 0B2E76DC091

Use msm_dp_get_mst_intf_id() to get the interface ID for the DP MST
controller as the intf_id is unique for each MST stream of each DP
controller.

For DSI/eDP/DP SST, the stream_id is always 0, so existing behavior
remains unchanged.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 20 +++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  4 ++++
 3 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1c74ff6f0dbd..3adfaeaab71d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1438,18 +1438,21 @@ void dpu_encoder_phys_disable(struct drm_encoder *drm_enc,
 
 static struct dpu_hw_intf *dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
 		struct dpu_rm *dpu_rm,
-		enum dpu_intf_type type, u32 controller_id)
+		struct msm_display_info *disp_info, u32 controller_id)
 {
-	int i = 0;
+	int i = 0, cnt = 0;
+	int stream_id = disp_info->stream_id;
 
-	if (type == INTF_WB)
+	if (disp_info->intf_type == INTF_WB)
 		return NULL;
 
+	DPU_DEBUG("intf_type 0x%x controller_id %d stream_id %d\n",
+		  disp_info->intf_type, controller_id, stream_id);
 	for (i = 0; i < catalog->intf_count; i++) {
-		if (catalog->intf[i].type == type
-		    && catalog->intf[i].controller_id == controller_id) {
-			return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
-		}
+		if (catalog->intf[i].type == disp_info->intf_type &&
+		    controller_id == catalog->intf[i].controller_id)
+			if (cnt++ == stream_id)
+				return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
 	}
 
 	return NULL;
@@ -2675,8 +2678,7 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 				i, controller_id, phys_params.split_role);
 
 		phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
-							   disp_info->intf_type,
-							   controller_id);
+							   disp_info, controller_id);
 
 		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
 			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 25ade3dbbeda..861d69afbd76 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -28,6 +28,7 @@
  * @h_tile_instance:    Controller instance used per tile. Number of elements is
  *                      based on num_of_h_tiles
  * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
+ * @stream_id		stream id for which the interface needs to be acquired
  * @vsync_source:	Source of the TE signal for DSI CMD devices
  */
 struct msm_display_info {
@@ -35,6 +36,7 @@ struct msm_display_info {
 	uint32_t num_of_h_tiles;
 	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
 	bool is_cmd_mode;
+	int stream_id;
 	enum dpu_vsync_source vsync_source;
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 91d33b432427..b32ecd5b0777 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -614,6 +614,7 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 			info.h_tile_instance[info.num_of_h_tiles++] = other;
 
 		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->kms->dsi[i]);
+		info.stream_id = 0;
 
 		rc = dpu_kms_dsi_set_te_source(&info, priv->kms->dsi[i]);
 		if (rc) {
@@ -689,6 +690,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 			}
 
 			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
+				info.stream_id = stream_id;
 				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
 				if (IS_ERR(encoder)) {
 					DPU_ERROR("encoder init failed for dp mst display\n");
@@ -716,6 +718,7 @@ static int _dpu_kms_initialize_hdmi(struct drm_device *dev,
 	info.num_of_h_tiles = 1;
 	info.h_tile_instance[0] = 0;
 	info.intf_type = INTF_HDMI;
+	info.stream_id = 0;
 
 	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS, &info);
 	if (IS_ERR(encoder)) {
@@ -748,6 +751,7 @@ static int _dpu_kms_initialize_writeback(struct drm_device *dev,
 	/* use only WB idx 2 instance for DPU */
 	info.h_tile_instance[0] = wb_idx;
 	info.intf_type = INTF_WB;
+	info.stream_id = 0;
 
 	maxlinewidth = dpu_rm_get_wb(&dpu_kms->rm, info.h_tile_instance[0])->caps->maxlinewidth;
 

-- 
2.43.0


