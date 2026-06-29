Return-Path: <linux-arm-msm+bounces-115132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aPlSGdeAQmre8gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:27:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C80486DC066
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:27:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=L3WrEAWX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WaiDLctv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115132-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115132-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45EC030C299C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C321440BCC4;
	Mon, 29 Jun 2026 14:15:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0D540BCCE
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:15:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742530; cv=none; b=VoUEsDHjUzi5F47FOlc/EM7cozCXKAJXMl45ENR6849bp7KgCN6kSUHiAMk0y9KWqdb878gus607MzRedRvXGqnZ0gHQLlW1+Uk7VkhluG9LCWHTxO/fVhjNEEyEECiy4wgiOb0wPKLU6smEVvvx0G4ibhUHZ8asR6Qx2OOnLYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742530; c=relaxed/simple;
	bh=gIv5uLtP7lbXWQD8S1GUgAprcuNDtvhwKTafo/JSk0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rF4S9qeJE6IZzgz5T6nl6s6pJ8BUlECXA2AHFdfr7DXG7biKct8p9s479MO6ryNQ3qF6Ws+awojriE6HPmguAcDVQfrx4PTPcrVkQPbby6S8GoQkCD0VR+C69/YJ+QMQl9gklMeUa6WhtW0Aiv/a8v7o+84i7RvqY2FAZh66RlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L3WrEAWX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WaiDLctv; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATE4g2579139
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XunwKltBuQx7NM9Pkse8vSkVfTxH7eu3yB8C93aFJzA=; b=L3WrEAWXmaFTvwRy
	tw9eEkmZ9vdGQU2vm8qgqbVVB7HCdzzGqAzE4M7Wu1N6c+/YHCn9P1PDKNHJMt93
	TKkMapUNp+aSUbobzeEOCqCBXIn33XuNjTlcEIZblwysPuOCGrLPgT7dqgZrDxmN
	Q3UZTVuo81Jai83ddLutY7N2gF6DJuWFJfKefXsmnE9HgMxxV6oVZp+TQQct8aok
	1mTZ1Izj8k07ukvQkbwfmIZNd+iZY5XuVhykLASOJ0yebGKhViRyHsDYlpsOREiy
	3t4fk+afTkcDH3Yz89bnrCZGNkiRDNL3KLlfNGePGw5UuUMg/J48IvhrpUp6vsrj
	sq+3Nw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7hqs0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:15:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92158791d14so433711885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742527; x=1783347327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XunwKltBuQx7NM9Pkse8vSkVfTxH7eu3yB8C93aFJzA=;
        b=WaiDLctv+tPFwV+zKBqea20YYN+9Hg8Th8w1jKTl5SLDMU71NZd0f3NR5HwJWO0r8F
         XAo86c34nK89j4I68JP78f9qJlY9RUdpLa3RipPAhFsfKtQF6YjAvOkdt/2d4kn7QKhu
         LDGHMAR9/JT0/GW1K/rp13M+qNEZeRpgUaiP8u4im7ODXSeIeZxwhpk5zMYsxr50Uza4
         sPjmo452QVFfbWDMMyAth/lkQvuU2SVUZpTaQeoEHJXaA+xCCsv3aV5Xk1/BySax8C7J
         xcMROadBMi9F0xRpOUeMQ+4ip/FbOxPglFNWHgOxjsRu2unykvDuc4nQkfhZ/0XThLWJ
         kyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742527; x=1783347327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XunwKltBuQx7NM9Pkse8vSkVfTxH7eu3yB8C93aFJzA=;
        b=QzRoUHGIqYOdmEkS7OPlcgTCu11P6PsLZD1RUimLOS46+gCWBr3fJFil72vX7mpmeU
         9OLjOKXqkZd4/iOzAHcee2xrjHEcWsQDfG+n7vPH6o180JA+4p9GDuzGjHO6iZhJ9z9B
         EOMXqN+GUW/rvEMtQx9l8X6J+YLAIoc2z76yVvMeN6qyvBm0Ba8bFbNUL39E/To6sR6V
         T92M43JXuZD0stH+dH9JmuvG6WYUQHxWOhCkBKQ4VZCeMrJUAMi6wP2MeDo9B3nstDOr
         huJWtmXY4Nej/lpRWdC4IMqZBxL0J/Z/b6DYWXqcfC1TAk2zZZEDaE3BiBQXOC87j3CN
         1r1g==
X-Gm-Message-State: AOJu0Yxg6vfJlvk6jnlxF9/KC54H9AG82pOagJXq56XEt0SFG1KpAGBp
	uGeC8IXNVVQwB0rGfXjlUMmxOzB4TZ4tYcl9zJZ5BEbyx9/6Vg8cEQp6vx3gmFrqF1MyTC+xXBH
	fi4cvPDGKyclO7qCY9sRNabPnLCQuHSTGeHX3bxRb89Ft6metGzR0ZjFY0SOOGLohtHTq
X-Gm-Gg: AfdE7clVxoOLiTVL+zLXMrjhMKrqmI02TxsZdux0OjTHalkS3BmdFpqwyDUeHEly8zf
	G6TxjhmxoUtqT4/VLVkJMq7dROhzgeZce7Bl5JenmPgPbMwWGV+qOPjYRKe5lXJVLTO1adKdqal
	NaKaxPMqsAVJLdsNAjA+11Zz9JK1CEXKk+Vs5n1aimEU0pccqYSckAAqdhzTgVFiR1pLX2IkvnY
	a0v/aGVqxZq+PdYrAY4z+5Rr9sgUhVGglSwcycA/sejhC/gpt24QxmYmV7K+RawC5ZINH6caTfo
	8YVJUDLIbOgwbZFEWm/iXGh156AUdvYrtEPnqW8AQ/Pz0M3WhjmWQkXCR2pFVG7CpGICltc6zHT
	ucoQJnGVoOHR/WICPD+oFDwFko+9s3NqjRdfIUr89noMNsJeaMjBiNTu+i6OXQF8Fn70r2Q==
X-Received: by 2002:a05:620a:199d:b0:92b:67e6:8ac1 with SMTP id af79cd13be357-92b67e68c82mr1352649185a.59.1782742524606;
        Mon, 29 Jun 2026 07:15:24 -0700 (PDT)
X-Received: by 2002:a05:620a:199d:b0:92b:67e6:8ac1 with SMTP id af79cd13be357-92b67e68c82mr1352595385a.59.1782742520894;
        Mon, 29 Jun 2026 07:15:20 -0700 (PDT)
Received: from yongmou2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9260079070bsm2143165885a.40.2026.06.29.07.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:15:20 -0700 (PDT)
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
Subject: [PATCH RESEND v5 04/25] drm/msm/dp: use stream_id to change offsets in dp_catalog
Date: Mon, 29 Jun 2026 22:14:25 +0800
Message-ID: <20260629-msm-dp-mst-v5-4-2ed6aee1867a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782742144; l=18640; i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id; bh=PnE99oAhCBIy4iAcBDIR6OXrNQicBoxIsBkQyHP2lJE=; b=EZU+GegxgpLzlxs9sZkuhTF04i0URZGPTJ8F9ylJ9LYXCFUcuUNzSI2xQiyUS12XmH2SRYbQd C+f1YaDUyGzCutTp4kKM/w71UqipgDaxDoCBGvBqUibzWACS5VhsJdz
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519; pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfXzu4msWCYM/LB
 B4RNlsD7a1kwH++j99UVzinzett0njMXZXDtQQjZvMzY7/9rGiQOHS5L2WICJauV752Fid/GQT2
 Z+NdimpstpwkClL1H4YbC1Gt+oz6yWw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX/vBovb4heHiv
 653gwyGsfIfUzL3tpYEkxHIqSYhCnYry5HeSpyvsX/5RpNA7Nw6KZoNGfdA20jmSRR4Lis1BV5P
 RyApJp6Tw4E35KB2cSz9eBghg7a3BVpgP4jem1rMXnKdvAQ5Xnx4AutB7Ig0Hif4CpaCVfs+lfW
 x4NPmGv45Ga/A9eyijictKux2jrfFoP9sCIef8Y8biJZWOsDEBgiZOzrVrTtMkKcur8cOAEksf1
 XfWUSrf8BwO9bmWtstcpfizARnSjYDa6X4UYWEi4V+0ekuOMcs54WjMW75Hr96694I+teUrAdN/
 6GeqzCAVzDxIMQBm8C+VlHauYTvEppcONifxHvuFfJ+4dffdJCBQFSY4jBjqoKMWCV7OwOxKhW8
 G2pZWt3hsa8l0Rg+mWlBxZ+t4bpGvauNuK3Vwa/DlTM9sQQFBPhIBFDT4BlHi5nADmUQvMn+Zas
 jRAjTUEwRIWDqW73jEg==
X-Proofpoint-ORIG-GUID: tHcWocC1xXaiA8ESp6UYCgU8HPSkrAD0
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a427dff cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=haGoBri_-Elbrn-HMXcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: tHcWocC1xXaiA8ESp6UYCgU8HPSkrAD0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115132-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: C80486DC066

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

In the DP MST architecture, stream 1 shares the same link clock as
stream 0 but uses different register offsets within the same link
register space. Use the dp_panel's stream_id to select the correct
register offsets for stream 1 in dp_catalog. Also add stream 1
register defines.

Streams 2 and 3 are not covered here, as they use separate link clocks
and require separate handling.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 78 ++++++++++++++++++++++++------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  4 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 24 +++++++++-
 drivers/gpu/drm/msm/dp/dp_panel.c   | 94 ++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_panel.h   |  4 ++
 drivers/gpu/drm/msm/dp/dp_reg.h     | 44 +++++++++++++++++
 6 files changed, 229 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 68fb4facb056..5c491a925b4b 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -117,6 +117,8 @@ struct msm_dp_ctrl_private {
 	struct msm_dp_link *link;
 	void __iomem *ahb_base;
 	void __iomem *link_base;
+	void __iomem *mst2link_base;
+	void __iomem *mst3link_base;
 
 	struct phy *phy;
 
@@ -172,6 +174,49 @@ static inline void msm_dp_write_link(struct msm_dp_ctrl_private *ctrl,
 	writel(data, ctrl->link_base + offset);
 }
 
+static inline u32 msm_dp_read_stream_link(struct msm_dp_ctrl_private *ctrl,
+					   enum msm_dp_stream_id stream_id, u32 offset)
+{
+	offset = msm_dp_stream_reg(stream_id, offset);
+	switch (stream_id) {
+	case DP_STREAM_0:
+	case DP_STREAM_1:
+		return readl_relaxed(ctrl->link_base + offset);
+	case DP_STREAM_2:
+		return readl_relaxed(ctrl->mst2link_base + offset);
+	case DP_STREAM_3:
+		return readl_relaxed(ctrl->mst3link_base + offset);
+	default:
+		DRM_ERROR("error stream_id\n");
+		return 0;
+	}
+}
+
+static inline void msm_dp_write_stream_link(struct msm_dp_ctrl_private *ctrl,
+					     enum msm_dp_stream_id stream_id, u32 offset, u32 data)
+{
+	/*
+	 * To make sure link reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	offset = msm_dp_stream_reg(stream_id, offset);
+	switch (stream_id) {
+	case DP_STREAM_0:
+	case DP_STREAM_1:
+		writel(data, ctrl->link_base + offset);
+		break;
+	case DP_STREAM_2:
+		writel(data, ctrl->mst2link_base + offset);
+		break;
+	case DP_STREAM_3:
+		writel(data, ctrl->mst3link_base + offset);
+		break;
+	default:
+		DRM_ERROR("error stream_id\n");
+		break;
+	}
+}
+
 static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
 					struct msm_dp_link_info *link)
 {
@@ -397,7 +442,8 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
 	/*
 	 * RMW: Called from atomic_enable(). Serialized by the DRM atomic framework.
 	 */
-	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
+	if (msm_dp_panel->stream_id == DP_STREAM_0)
+		config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
 
 	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
 		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
@@ -412,7 +458,7 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
 
 	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
 
-	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
+	msm_dp_write_stream_link(ctrl, msm_dp_panel->stream_id, REG_DP_CONFIGURATION_CTRL, config);
 }
 
 static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl,
@@ -469,7 +515,7 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
 							  msm_dp_panel->msm_dp_mode.bpp);
 	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
 
-	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0);
+	misc_val = msm_dp_read_stream_link(ctrl, msm_dp_panel->stream_id, REG_DP_MISC1_MISC0);
 
 	/* clear bpp bits */
 	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
@@ -479,7 +525,7 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
 	misc_val |= DP_MISC0_SYNCHRONOUS_CLK;
 
 	drm_dbg_dp(ctrl->drm_dev, "misc settings = 0x%x\n", misc_val);
-	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0, misc_val);
+	msm_dp_write_stream_link(ctrl, msm_dp_panel->stream_id, REG_DP_MISC1_MISC0, misc_val);
 }
 
 static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl,
@@ -2461,8 +2507,8 @@ static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl,
 }
 
 static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
-			       u32 rate, u32 stream_rate_khz,
-			       bool is_ycbcr_420)
+			       struct msm_dp_panel *panel,
+			       u32 rate, u32 stream_rate_khz)
 {
 	u32 pixel_m, pixel_n;
 	u32 mvid, nvid, pixel_div, dispcc_input_rate;
@@ -2514,7 +2560,7 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
 		nvid = temp;
 	}
 
-	if (is_ycbcr_420)
+	if (panel->msm_dp_mode.out_fmt_is_yuv_420)
 		mvid /= 2;
 
 	if (link_rate_hbr2 == rate)
@@ -2524,8 +2570,8 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
 		nvid *= 3;
 
 	drm_dbg_dp(ctrl->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
-	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_MVID, mvid);
-	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID, nvid);
+	msm_dp_write_stream_link(ctrl, panel->stream_id, REG_DP_SOFTWARE_MVID, mvid);
+	msm_dp_write_stream_link(ctrl, panel->stream_id, REG_DP_SOFTWARE_NVID, nvid);
 }
 
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
@@ -2597,14 +2643,14 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_ctrl_lane_mapping(ctrl);
 	msm_dp_setup_peripheral_flush(ctrl);
-	msm_dp_ctrl_config_ctrl_link(ctrl, panel);
+	if (panel->stream_id == DP_STREAM_0)
+		msm_dp_ctrl_config_ctrl_link(ctrl, panel);
 
 	msm_dp_ctrl_configure_source_params(ctrl, panel);
 
 	msm_dp_ctrl_config_msa(ctrl,
-		ctrl->link->link_params.rate,
-		pixel_rate_orig,
-		panel->msm_dp_mode.out_fmt_is_yuv_420);
+		panel, ctrl->link->link_params.rate,
+		pixel_rate_orig);
 
 	msm_dp_panel_clear_dsc_dto(panel);
 
@@ -2788,7 +2834,9 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 			struct drm_dp_aux *aux,
 			struct phy *phy,
 			void __iomem *ahb_base,
-			void __iomem *link_base)
+			void __iomem *link_base,
+			void __iomem *mst2link_base,
+			void __iomem *mst3link_base)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	int ret;
@@ -2827,6 +2875,8 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 	ctrl->phy      = phy;
 	ctrl->ahb_base = ahb_base;
 	ctrl->link_base = link_base;
+	ctrl->mst2link_base = mst2link_base;
+	ctrl->mst3link_base = mst3link_base;
 
 	ret = msm_dp_ctrl_clk_init(&ctrl->msm_dp_ctrl);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 305add3dcd93..49d16911ae8b 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -35,7 +35,9 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev,
 				    struct drm_dp_aux *aux,
 				    struct phy *phy,
 				    void __iomem *ahb_base,
-				    void __iomem *link_base);
+				    void __iomem *link_base,
+				    void __iomem *mst2link_base,
+				    void __iomem *mst3link_base);
 
 void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl,
 		       struct msm_dp_panel *panel);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 74f481a18164..c58896b351b3 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -85,6 +85,12 @@ struct msm_dp_display_private {
 	void __iomem *link_base;
 	size_t link_len;
 
+	void __iomem *mst2link_base;
+	size_t mst2link_len;
+
+	void __iomem *mst3link_base;
+	size_t mst3link_len;
+
 	void __iomem *pixel_base[DP_STREAM_MAX];
 	size_t pixel_len;
 
@@ -564,7 +570,8 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		goto error_link;
 	}
 
-	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->pixel_base[0]);
+	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base,
+				     dp->mst2link_base, dp->mst3link_base, dp->pixel_base[0]);
 	if (IS_ERR(dp->panel)) {
 		rc = PTR_ERR(dp->panel);
 		DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
@@ -573,7 +580,8 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 	}
 
 	dp->ctrl = msm_dp_ctrl_get(dev, dp->link, dp->aux,
-			       phy, dp->ahb_base, dp->link_base);
+			       phy, dp->ahb_base, dp->link_base,
+			       dp->mst2link_base, dp->mst3link_base);
 	if (IS_ERR(dp->ctrl)) {
 		rc = PTR_ERR(dp->ctrl);
 		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
@@ -850,6 +858,10 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 				    msm_dp_display->aux_base, "dp_aux");
 	msm_disp_snapshot_add_block(disp_state, msm_dp_display->link_len,
 				    msm_dp_display->link_base, "dp_link");
+	msm_disp_snapshot_add_block(disp_state, msm_dp_display->mst2link_len,
+				    msm_dp_display->mst2link_base, "dp_mst2link");
+	msm_disp_snapshot_add_block(disp_state, msm_dp_display->mst3link_len,
+				    msm_dp_display->mst3link_base, "dp_mst3link");
 	msm_disp_snapshot_add_block(disp_state, msm_dp_display->pixel_len,
 				    msm_dp_display->pixel_base[0], "dp_p0");
 	msm_disp_snapshot_add_block(disp_state, msm_dp_display->pixel_len,
@@ -1196,6 +1208,14 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
 		}
 	}
 
+	display->mst2link_base = msm_dp_ioremap(pdev, 7, &display->mst2link_len);
+	if (IS_ERR(display->mst2link_base))
+		DRM_DEBUG_DP("unable to remap link region: %pe\n", display->mst2link_base);
+
+	display->mst3link_base = msm_dp_ioremap(pdev, 8, &display->mst3link_len);
+	if (IS_ERR(display->mst3link_base))
+		DRM_DEBUG_DP("unable to remap link region: %pe\n", display->mst3link_base);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 238920c45261..e0c0e8c9178c 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -25,13 +25,84 @@ struct msm_dp_panel_private {
 	struct drm_dp_aux *aux;
 	struct msm_dp_link *link;
 	void __iomem *link_base;
+	void __iomem *mst2link_base;
+	void __iomem *mst3link_base;
 	void __iomem *pixel_base;
 	bool panel_on;
 };
 
+u32 msm_dp_stream_reg(enum msm_dp_stream_id id, u32 reg)
+{
+	bool is_s1 = (id == DP_STREAM_1);
+
+	if (id == DP_STREAM_0)
+		return reg;
+
+	switch (reg) {
+	case REG_DP_CONFIGURATION_CTRL:
+		return is_s1 ? REG_DP1_CONFIGURATION_CTRL : REG_DP_MSTLINK_CONFIGURATION_CTRL;
+	case REG_DP_SOFTWARE_MVID:
+		return is_s1 ? REG_DP1_SOFTWARE_MVID : REG_MSTLINK_SOFTWARE_MVID;
+	case REG_DP_SOFTWARE_NVID:
+		return is_s1 ? REG_DP1_SOFTWARE_NVID : REG_MSTLINK_SOFTWARE_NVID;
+	case REG_DP_TOTAL_HOR_VER:
+		return is_s1 ? REG_DP1_TOTAL_HOR_VER : REG_DP_MSTLINK_TOTAL_HOR_VER;
+	case REG_DP_START_HOR_VER_FROM_SYNC:
+		return is_s1 ? REG_DP1_START_HOR_VER_FROM_SYNC
+			     : REG_DP_MSTLINK_START_HOR_VER_FROM_SYNC;
+	case REG_DP_HSYNC_VSYNC_WIDTH_POLARITY:
+		return is_s1 ? REG_DP1_HSYNC_VSYNC_WIDTH_POLARITY
+			     : REG_DP_MSTLINK_HSYNC_VSYNC_WIDTH_POLARITY;
+	case REG_DP_ACTIVE_HOR_VER:
+		return is_s1 ? REG_DP1_ACTIVE_HOR_VER : REG_DP_MSTLINK_ACTIVE_HOR_VER;
+	case REG_DP_MISC1_MISC0:
+		return is_s1 ? REG_DP1_MISC1_MISC0 : REG_DP_MSTLINK_MISC1_MISC0;
+	case MMSS_DP_SDP_CFG:
+		return is_s1 ? MMSS_DP1_SDP_CFG : MMSS_DP_MSTLINK_SDP_CFG;
+	case MMSS_DP_SDP_CFG2:
+		return is_s1 ? MMSS_DP1_SDP_CFG2 : MMSS_DP_MSTLINK_SDP_CFG2;
+	case MMSS_DP_SDP_CFG3:
+		return is_s1 ? MMSS_DP1_SDP_CFG3 : MMSS_DP_MSTLINK_SDP_CFG3;
+	case MMSS_DP_GENERIC0_0:
+		return is_s1 ? MMSS_DP1_GENERIC0_0 : MMSS_DP_MSTLINK_GENERIC0_0;
+	case MMSS_DP_GENERIC0_1:
+		return is_s1 ? MMSS_DP1_GENERIC0_1 : MMSS_DP_MSTLINK_GENERIC0_1;
+	case MMSS_DP_GENERIC0_2:
+		return is_s1 ? MMSS_DP1_GENERIC0_2 : MMSS_DP_MSTLINK_GENERIC0_2;
+	case MMSS_DP_GENERIC0_3:
+		return is_s1 ? MMSS_DP1_GENERIC0_3 : MMSS_DP_MSTLINK_GENERIC0_3;
+	case MMSS_DP_GENERIC0_4:
+		return is_s1 ? MMSS_DP1_GENERIC0_4 : MMSS_DP_MSTLINK_GENERIC0_4;
+	case MMSS_DP_GENERIC0_5:
+		return is_s1 ? MMSS_DP1_GENERIC0_5 : MMSS_DP_MSTLINK_GENERIC0_5;
+	case MMSS_DP_GENERIC0_6:
+		return is_s1 ? MMSS_DP1_GENERIC0_6 : MMSS_DP_MSTLINK_GENERIC0_6;
+	case MMSS_DP_GENERIC0_7:
+		return is_s1 ? MMSS_DP1_GENERIC0_7 : MMSS_DP_MSTLINK_GENERIC0_7;
+	case MMSS_DP_GENERIC0_8:
+		return is_s1 ? MMSS_DP1_GENERIC0_8 : MMSS_DP_MSTLINK_GENERIC0_8;
+	case MMSS_DP_GENERIC0_9:
+		return is_s1 ? MMSS_DP1_GENERIC0_9 : MMSS_DP_MSTLINK_GENERIC0_9;
+	default:
+		return reg;
+	}
+}
+
 static inline u32 msm_dp_read_link(struct msm_dp_panel_private *panel, u32 offset)
 {
-	return readl_relaxed(panel->link_base + offset);
+	offset = msm_dp_stream_reg(panel->msm_dp_panel.stream_id, offset);
+	switch (panel->msm_dp_panel.stream_id) {
+	case DP_STREAM_0:
+	case DP_STREAM_1:
+		return readl_relaxed(panel->link_base + offset);
+	case DP_STREAM_2:
+		return readl_relaxed(panel->mst2link_base + offset);
+	case DP_STREAM_3:
+		return readl_relaxed(panel->mst3link_base + offset);
+	default:
+		DRM_ERROR("error stream_id\n");
+		return 0;
+	}
 }
 
 static inline void msm_dp_write_link(struct msm_dp_panel_private *panel,
@@ -41,7 +112,22 @@ static inline void msm_dp_write_link(struct msm_dp_panel_private *panel,
 	 * To make sure link reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	writel(data, panel->link_base + offset);
+	offset = msm_dp_stream_reg(panel->msm_dp_panel.stream_id, offset);
+	switch (panel->msm_dp_panel.stream_id) {
+	case DP_STREAM_0:
+	case DP_STREAM_1:
+		writel(data, panel->link_base + offset);
+		break;
+	case DP_STREAM_2:
+		writel(data, panel->mst2link_base + offset);
+		break;
+	case DP_STREAM_3:
+		writel(data, panel->mst3link_base + offset);
+		break;
+	default:
+		DRM_ERROR("error stream_id\n");
+		break;
+	}
 }
 
 static inline void msm_dp_write_pn(struct msm_dp_panel_private *panel,
@@ -701,6 +787,8 @@ int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel,
 struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
 			      struct msm_dp_link *link,
 			      void __iomem *link_base,
+			      void __iomem *mst2link_base,
+			      void __iomem *mst3link_base,
 			      void __iomem *pixel_base)
 {
 	struct msm_dp_panel_private *panel;
@@ -720,6 +808,8 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
 	panel->link = link;
 	panel->link_base = link_base;
 	panel->pixel_base = pixel_base;
+	panel->mst2link_base = mst2link_base;
+	panel->mst3link_base = mst3link_base;
 
 	msm_dp_panel = &panel->msm_dp_panel;
 	msm_dp_panel->max_bw_code = DP_LINK_BW_8_1;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 218a09a2fa65..dc046fec24fc 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -99,8 +99,12 @@ static inline bool is_lane_count_valid(u32 lane_count)
 		lane_count == 4);
 }
 
+u32 msm_dp_stream_reg(enum msm_dp_stream_id id, u32 reg);
+
 struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
 			      struct msm_dp_link *link,
 			      void __iomem *link_base,
+			      void __iomem *mst2link_base,
+			      void __iomem *mst3link_base,
 			      void __iomem *pixel_base);
 #endif /* _DP_PANEL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 3689642b7fc0..310e5a1cc934 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -332,6 +332,50 @@
 #define DP_TPG_VIDEO_CONFIG_BPP_8BIT		(0x00000001)
 #define DP_TPG_VIDEO_CONFIG_RGB			(0x00000004)
 
+#define REG_DP1_CONFIGURATION_CTRL		(0x00000400)
+#define REG_DP1_SOFTWARE_MVID			(0x00000414)
+#define REG_DP1_SOFTWARE_NVID			(0x00000418)
+#define REG_DP1_TOTAL_HOR_VER			(0x0000041C)
+#define REG_DP1_START_HOR_VER_FROM_SYNC		(0x00000420)
+#define REG_DP1_HSYNC_VSYNC_WIDTH_POLARITY	(0x00000424)
+#define REG_DP1_ACTIVE_HOR_VER			(0x00000428)
+#define REG_DP1_MISC1_MISC0			(0x0000042C)
+#define MMSS_DP1_GENERIC0_0			(0x00000490)
+#define MMSS_DP1_GENERIC0_1			(0x00000494)
+#define MMSS_DP1_GENERIC0_2			(0x00000498)
+#define MMSS_DP1_GENERIC0_3			(0x0000049C)
+#define MMSS_DP1_GENERIC0_4			(0x000004A0)
+#define MMSS_DP1_GENERIC0_5			(0x000004A4)
+#define MMSS_DP1_GENERIC0_6			(0x000004A8)
+#define MMSS_DP1_GENERIC0_7			(0x000004AC)
+#define MMSS_DP1_GENERIC0_8			(0x000004B0)
+#define MMSS_DP1_GENERIC0_9			(0x000004B4)
+#define MMSS_DP1_SDP_CFG			(0x000004E0)
+#define MMSS_DP1_SDP_CFG2			(0x000004E4)
+#define MMSS_DP1_SDP_CFG3			(0x000004E8)
+
+#define REG_DP_MSTLINK_CONFIGURATION_CTRL	(0x00000034)
+#define REG_MSTLINK_SOFTWARE_MVID		(0x00000040)
+#define REG_MSTLINK_SOFTWARE_NVID		(0x00000044)
+#define REG_DP_MSTLINK_TOTAL_HOR_VER		(0x00000048)
+#define REG_DP_MSTLINK_START_HOR_VER_FROM_SYNC	(0x0000004C)
+#define REG_DP_MSTLINK_HSYNC_VSYNC_WIDTH_POLARITY	(0x00000050)
+#define REG_DP_MSTLINK_ACTIVE_HOR_VER		(0x00000054)
+#define REG_DP_MSTLINK_MISC1_MISC0		(0x00000058)
+#define MMSS_DP_MSTLINK_GENERIC0_0		(0x000000BC)
+#define MMSS_DP_MSTLINK_GENERIC0_1		(0x000000C0)
+#define MMSS_DP_MSTLINK_GENERIC0_2		(0x000000C4)
+#define MMSS_DP_MSTLINK_GENERIC0_3		(0x000000C8)
+#define MMSS_DP_MSTLINK_GENERIC0_4		(0x000000CC)
+#define MMSS_DP_MSTLINK_GENERIC0_5		(0x000000D0)
+#define MMSS_DP_MSTLINK_GENERIC0_6		(0x000000D4)
+#define MMSS_DP_MSTLINK_GENERIC0_7		(0x000000D8)
+#define MMSS_DP_MSTLINK_GENERIC0_8		(0x000000DC)
+#define MMSS_DP_MSTLINK_GENERIC0_9		(0x000000E0)
+#define MMSS_DP_MSTLINK_SDP_CFG			(0x0000010c)
+#define MMSS_DP_MSTLINK_SDP_CFG2		(0x0000011c)
+#define MMSS_DP_MSTLINK_SDP_CFG3		(0x00000114)
+
 #define MMSS_DP_ASYNC_FIFO_CONFIG		(0x00000088)
 
 #define REG_DP_PHY_AUX_INTERRUPT_CLEAR          (0x0000004C)

-- 
2.43.0


