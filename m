Return-Path: <linux-arm-msm+bounces-115133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3TWUCGODQmqR8wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:38:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6333F6DC252
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:38:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VKJExNGt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jNRfPcza;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115133-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115133-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16A92325D890
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75CDA40E8F1;
	Mon, 29 Jun 2026 14:15:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057743C2762
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:15:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742534; cv=none; b=nAZG9PDnrl3pi1bQJ8ugsGftQkRaRF9dusuyaHc0CrQNdykL90cpJtSihHbCqTg9n/1ZJYrFqgdcX4os22TeBy1Fl1W5RiXv4r3AW1tELlMdVWbYpLPJ9IXzrBTkhi1oaT7KyJcv/fwq+JJ+2fZTGI48whx3dShxLeOMKNiQNCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742534; c=relaxed/simple;
	bh=VcNGluQYjuLDv0aCn1QjB0FdyM2PXkwBb3VM0HO4GTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mOW21WxLm65eaCcVEouRhf39SFxIdYdYDJ1sL2m6RtuI5o0HThjjqJyp2yhtpNPrAyqGb7hAnQQ/GrI1JB+BYAM9Ba+2vL6ffpI/LoE5hhuaK+ZFdkVJTRAI2H2EWora6r7F0vwtjGGJB/+f9NJYMnQmf2xzcXIVpkxkE2i+n0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VKJExNGt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jNRfPcza; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASv052601200
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:15:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i5I7/GYfl2jmAzQHd0ut9S5y6abt3vFLbK90TYMdM5k=; b=VKJExNGtutRzityu
	pT7/lB9dQJBP/1fy+5BjJR8+IGzFGk9ckhSOd0rs+ttSoTTeKiqr1xc3xg7kEMqR
	H6+TquKBQ2YWDRLI1XYngHrngIzj0yKl58qbLJC0aPe2N/6ZAfkASLoMswQtxIt7
	q3NVFyUFfaGJazIIvBkkR3OmOlswfaJud6/YigNDVmf/O/0aVZnOuIpSFUqIkTtN
	HQheY8uTnnnOVEz1qqiKehAs3WWG0Q3hbtOX8WiXXM303K683+a2ZWn+BPurGXzJ
	Ahd9iZt+He68sXWzQlnVzNmzP5DH6aRMQL/V+CNGj+PnkU/WFB4WJh7/R8Y7evth
	qkB8Yw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw97kt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:15:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92a62578049so544406585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742531; x=1783347331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5I7/GYfl2jmAzQHd0ut9S5y6abt3vFLbK90TYMdM5k=;
        b=jNRfPczazqFNqKH1F/XE2UknrrT4CDQ+kLvHQxo2JLiOw/68Ukz0Ah07BJarGaL4Vf
         KuBX1vfsG9jx6sVMUWVM2cnXHDgaaBHGk3TuL8d/CtUlYsyPactqe75ndB23BdYt888O
         LoGENU2TMFax2Xroxhl7g2UeQ/k66IJQgy2EhCGHDzHn+oeI8uS1hGtmH3SKFKtOkdmU
         gH30IOlkJcr817+itlwPzWVXZNvk9dZJi7egtoi9TWZa5cd5hnbzUILujqSqLL0aaCXH
         CYvgjRg/ElKi0yLu8b+4kg92XkcgItDVBkBYxVjof+Fg1argCqoZujPPpXvk3B21Vl/x
         NkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742531; x=1783347331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i5I7/GYfl2jmAzQHd0ut9S5y6abt3vFLbK90TYMdM5k=;
        b=KNN+yHFKgFv+Pdj/H+sWiPzX6uWQFvfKbjNxsdJJE/QuO0Hqy92kCSukEvI6t7K7ok
         bpZCvMsYgQIJxLDbRH9R7fuVuGHZkadRJmDopbdT9g1k/1O5v7aZv2NSrkfokLkMnpeh
         TS8uWKO4q3XU22ibiVi+6atlj5cE9y9PPAkDzxPLgHgUFbsL/yzMLFcRN60SqUj1L+xf
         l99JjVPIrZExfAOEBNAKVEaAame/GyBKBgcZLBS93xw9HwqYpi0aolUPK9tXImZ0YI9j
         ot9xfrjvZo2UdjCOY2h7h+nIl3O21NadiAVq8XgBgGdCwSwTooI1cFLP4FCNf31U//HW
         dluw==
X-Gm-Message-State: AOJu0YxTpypRG9zIVFpf7xKUoOdXmkWnmL/bfDqBTbPdyKYCUGhz0eYf
	Yhtzgdd8zInwI46mdoe/zWViRZJD8Lb4oz0vx2LNU1FM6TkSPGWmnR8W1o/cOhp7mEcT1jntOCD
	79muho2VFVEdUD1i98iMrgOKPaVKmOabOCHKVjATXlS/Oai3+Qu9E5qpix8pm7CEGJAEm
X-Gm-Gg: AfdE7ckla/cVoHVYXYF0b6HiEVMjQLBEbIv3BipUdh7VDfWvT2bbtPwPkLmCiaKxOj3
	0wV21vHgpneSZtd4i2cqQoWVpSpxDUo3htRqWesEa7SmEUal1kBmmkRAR5bpxcA5jekUtZmGoii
	gjf76T2N8yZ270wlNzPHtnazkFuyxaQyeDratDZKejfy5KaMm4Edm11/P3MZX6+01m9PvJrd3lB
	VpOKnhtnT8MgDFLqPUDj1kTa2sxzbopURDtNYVx4DpjtKCqCVXkMan/c3mSZboovfQ2x22xK6S7
	j25dzCWgfM6JpSoAFYPRob4RIkh2hgbzK7Vi6jkilDCzxRB/4hMLnbDHFww1jJaT971tEUmo3Xf
	V4bbGNf0ptq4cpiVYEEkXu6DHqJGuj2w0lRRjCOcy8xhSnJYsAWFF4vAvKME6kDvcajl4jw==
X-Received: by 2002:a05:620a:29ca:b0:92e:5b63:224d with SMTP id af79cd13be357-92e5b6324fbmr225271485a.26.1782742528801;
        Mon, 29 Jun 2026 07:15:28 -0700 (PDT)
X-Received: by 2002:a05:620a:29ca:b0:92e:5b63:224d with SMTP id af79cd13be357-92e5b6324fbmr225252085a.26.1782742527530;
        Mon, 29 Jun 2026 07:15:27 -0700 (PDT)
Received: from yongmou2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9260079070bsm2143165885a.40.2026.06.29.07.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:15:27 -0700 (PDT)
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
Subject: [PATCH RESEND v5 05/25] drm/msm/dp: add support to send ACT packets for MST
Date: Mon, 29 Jun 2026 22:14:26 +0800
Message-ID: <20260629-msm-dp-mst-v5-5-2ed6aee1867a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782742144; l=6676; i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id; bh=r08KKKkvMIlamabPFqv7xoxa+q/geEn5p6rbSAMhrAg=; b=jgQuXjghhW1PUmsB4lmxGSEVQZNxEKUNfUr6YPodEsaaMwGY+T3eosCrdW9HuWlWtgLPvdmwW qNasezMSTijB/P+pwz0vVu3J/wSSybnUa/k9uXNPl6zpaghfbuZXrTX
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519; pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX2cqY4ndqGfSN
 TSZ1/zujVSQs8MlIwuPDCN6VOHbGG/rnsgrbzU8YeaJekW0i+z78XC2bPka8Ajpx8tx/avukQh1
 xRlGxMY4zdvGWRxxXgH7FgcX9ZViYgM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfXyaoshjG+wg/f
 /wrKKVY7gtQeUNnckj0qxLD9b1VW12NH3xCZ69XxdUu5Z08dewXaNFAm6HACwy86uhNw7zdJvkX
 8iKEStYkxmjvqEQsNbfCi3wq+0lAyrYRoH4SFGT9NlNd38JH8f/Us6GpNjdGYkiVTJKtXAWpJ5I
 k9zGd3zxY9QYtqst0Owhye+8gjyIF1bdKDdBvKuYtL+6MGBPIhWk0uFm7wEsN09bKKx/X+edfZl
 rsLgu0wdsQ2nAT4mlQvo1x8GH+tIsk7OP1ruToGPPgEgpKnXXYMI19cI9xKSwVNSaYT+TIgO3fs
 oypq3oZKOEpl14H5c9uCXok2ax53AB4BVb3Nol0QWiMngYNoyuC6klBFCJlxKShVdFM0PF4VRRK
 2D9lTQD2GolBCVUD+HqKut6SqED+h1zctwZnsjTSR+RQJSPqkkKhtI8+T7BlfPJ1bwMReLDAhOY
 cvyCokumqjIS8Y21x3A==
X-Proofpoint-GUID: QAHmGyK_YiTjU3X2tzeoii7Bg8YGJ5-1
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a427e04 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=WyzI5VeO30yZZBqxhZsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: QAHmGyK_YiTjU3X2tzeoii7Bg8YGJ5-1
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
	TAGGED_FROM(0.00)[bounces-115133-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: 6333F6DC252

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Whenever virtual channel slot allocation changes, the DP
source must send the action control trigger sequence to notify
the sink about the same. This would be applicable during the
start and stop of the pixel stream. Add the infrastructure
to be able to send ACT packets for the DP controller when
operating in MST mode.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 44 ++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 ++++-
 drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
 5 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 5c491a925b4b..6754b10d418c 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -142,6 +142,7 @@ struct msm_dp_ctrl_private {
 	bool core_clks_on;
 	bool link_clks_on;
 	bool stream_clks_on[DP_STREAM_MAX];
+	bool mst_active;
 };
 
 static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)
@@ -244,6 +245,37 @@ static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
 	return err;
 }
 
+int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl,
+			     struct msm_dp_panel *panel)
+{
+	struct msm_dp_ctrl_private *ctrl;
+	const struct drm_display_mode *mode;
+	u32 frame_time_ms;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	if (!ctrl->mst_active)
+		return 0;
+
+	mode = &panel->msm_dp_mode.drm_mode;
+	frame_time_ms = DIV_ROUND_UP((u64)mode->htotal * mode->vtotal,
+				     mode->clock) + 1;
+
+	msm_dp_write_link(ctrl, REG_DP_MST_ACT, 0x1);
+	/* make sure ACT signal is performed */
+	wmb();
+
+	msleep(frame_time_ms);
+
+	/* Hardware clears this bit after sending 4 ACT headers */
+	if (msm_dp_read_link(ctrl, REG_DP_MST_ACT)) {
+		drm_dbg_dp(ctrl->drm_dev, "MST ACT trigger complete failed\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /*
  * NOTE: resetting DP controller will also clear any pending HPD related interrupts
  */
@@ -2610,7 +2642,8 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
 	return ret;
 }
 
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel)
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel,
+			  bool mst_active)
 {
 	int ret = 0;
 	bool mainlink_ready = false;
@@ -2623,6 +2656,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
+	ctrl->mst_active = mst_active;
+
 	pixel_rate_orig = panel->msm_dp_mode.drm_mode.clock;
 	pixel_rate = pixel_rate_orig;
 
@@ -2658,6 +2693,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
+	ret = msm_dp_ctrl_mst_send_act(msm_dp_ctrl, panel);
+	if (ret)
+		return ret;
+
 	ret = msm_dp_ctrl_wait4video_ready(ctrl);
 	if (ret)
 		return ret;
@@ -2695,6 +2734,8 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl, panel);
 
+	ctrl->mst_active = false;
+
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
@@ -2877,6 +2918,7 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 	ctrl->link_base = link_base;
 	ctrl->mst2link_base = mst2link_base;
 	ctrl->mst3link_base = mst3link_base;
+	ctrl->mst_active = false;
 
 	ret = msm_dp_ctrl_clk_init(&ctrl->msm_dp_ctrl);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 49d16911ae8b..6de028da85fb 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -18,7 +18,8 @@ struct phy;
 
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
 			struct msm_dp_panel *panel);
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel);
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel,
+			  bool mst_active);
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
 				  struct msm_dp_panel *panel,
 				  bool force_link_train);
@@ -58,4 +59,6 @@ void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 
 void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *dp_ctrl);
+int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl,
+			     struct msm_dp_panel *panel);
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c58896b351b3..acb581a8a541 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -673,7 +673,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp,
 		return 0;
 	}
 
-	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel);
+	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel, msm_dp_display->mst_active);
 	if (!rc)
 		msm_dp_display->power_on = true;
 
@@ -1509,6 +1509,7 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
 	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
+	msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl, msm_dp_display->panel);
 }
 
 static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index d3d4ab98089d..e987de80522c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -19,6 +19,7 @@ struct msm_dp {
 	struct drm_bridge *bridge;
 	bool audio_enabled;
 	bool power_on;
+	bool mst_active;
 	unsigned int connector_type;
 	bool is_edp;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 310e5a1cc934..6808965878d4 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -156,6 +156,8 @@
 #define DP_CONFIGURATION_CTRL_BPC_SHIFT		(0x08)
 #define DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT	(0x0D)
 
+#define REG_DP_MST_ACT				(0x00000500)
+
 #define REG_DP_SOFTWARE_MVID			(0x00000010)
 #define REG_DP_SOFTWARE_NVID			(0x00000018)
 #define REG_DP_TOTAL_HOR_VER			(0x0000001C)

-- 
2.43.0


