Return-Path: <linux-arm-msm+bounces-115091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AxJQNqNyQmrc7QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:26:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AFA6DB300
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:26:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GTBP3Z+6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jDq1ji+q;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115091-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115091-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55F3D300809D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2A141167E;
	Mon, 29 Jun 2026 13:17:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF68E41169F
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739040; cv=none; b=YdtuqESYbpTr1A09l4KibRfOzFtBOfJrwhmsThdSNTnqmQ4y1u4xIGRRiJ1y4fOg43nR1VeS5Zmy+Yd17nnoSWxuePtVkHDJ5cDKXyTcleMX1X/OaJTHl5YttyHkcX949T8qiw0L+gCstv/NfD/Id2e09r2YxAlTdva/b+jjfZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739040; c=relaxed/simple;
	bh=2DadO9dbrkJYVBcoUaKT8RWkTt/Ql0glwREdC1IMers=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NjIVTLW4Az0aWJhSAxhc3DWF25S7bEvzG1fEJzfFlNkNhnuHzd3OVTRo15FX7RM4zzZH6nuPiMOujZZs96+UmaEkjVLMIgn9P+xq/zn6yQMm19jLFs0/nhWrdYx36vFf03EZz7SO4/mtCY2yMD9vmUmQGbnzo7aq7PXTbyPS60c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GTBP3Z+6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jDq1ji+q; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATCtt2647685
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MHgB5G6TE/PbHdElrcCTuIcIKhO01iUj0GGp9N4zkEk=; b=GTBP3Z+6yYR5XSI7
	NWQOozjVARDy0K+pJ4yqQ6czIXfTWXP1bCbDNsLkqaRLitt6bttIfnUwm+o8mAJ0
	YKoMTPFFxDxRYzUeUrb6WUG+Kq2b2MQiroRvU2bNu0a6XAF0DlZNzvWuvDodI0fn
	6nnEN0q/yY3aNUhX0iiedoCitlrPHcUXQDah86JCqzpKa15eI9Tkm3xmeOps5nZr
	s7QyqiMBNKwtVfFlBj/K+dUdn8QtSbEufbaw3tTAuzOTbRInU8TJORmqHaJLcFIW
	Zqbsk2MAchoEXOH3Un1hMKF5cAw0b+Y3aLFMi7h2LBQFxyi5yGu/dkqWSWW3BQ93
	G/Wxcg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjhenj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:11 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-96910ded42cso1080614241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782739030; x=1783343830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MHgB5G6TE/PbHdElrcCTuIcIKhO01iUj0GGp9N4zkEk=;
        b=jDq1ji+qWej8uxWSMTiZoYgdGf62GTAuAqypEJIzUwVJas2J9z7cI08QTqPlkWkdm/
         QJtmBVPVwnGGC8Mezf+9IJcg3IoSrhMitumwuG+2QXaaPpW5cl+1ee5DEVJ6Oaqu44fe
         bupvOrCzUv7qoGXW9hfi5LaxXdWesuOeFiREFgu6Yuk2N9XsqDU8gDOnJB35YxPaL9K9
         FBqL2+PTmiwYKaqxksh/uj01yJ8ehYm7cl8Qt8maVYCTmwNO5YpeLbLvAqL4af95Y5At
         NfoErB6qlInN3XHdxsI6RI9EM7KnQUcGlxOHei8Gv2a/ex4j5W11A3p0/0zxDKeNH0YQ
         suYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782739030; x=1783343830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MHgB5G6TE/PbHdElrcCTuIcIKhO01iUj0GGp9N4zkEk=;
        b=PjQJYFRMIUC594w9LfpgQfqX7JQSdWkoAX9L/sbtvYSDdAMpSA11tT5ua7tRKfXFW2
         7BJLmhbmi3IPeqjnP7GcTYSDI/ECagq5Y3B4Ld3PtoQP5ZtDxCEhFQOgBV/LjsZAAXfW
         RExE+u3NqE/A0Q49XVBqZ90S04dLn5YcBQuAoDxoQOIMYkM4rocutmTNZ6uwRbOadOKL
         zI6xpVAphV0KynJbGrP4L1nYoM2OP4Oft9QemwQ3o7t2eiD9NGJE3M/7wsrB6AwnSJDb
         8ovxgQme3gR+lgrH9PnVxzU+ztnxAm/E9vi3TTLvwnnLXWoXIPJUsgdlNY3T0dQMPfXh
         gMxQ==
X-Gm-Message-State: AOJu0YyBUcHIVa3FXw+22TZ6+EY5HakVWLVX7KZTUYvggiWFoL9rFN62
	YiM/g/p8+NMnyDoCYV3ZqIfNVS9Ses61Q5+BBifvduZdUSzAqGRxD3Oj0MQIWi7HVasa0x43UDT
	NuhdnBoDS+oXtdj3SXgg9ExxPZQxCxnp9G/F/3LjV/tgJ79j5vxFoOufpyF7tk6QVSgIs
X-Gm-Gg: AfdE7clR78ajr+vIxbkBo5vn3kl4mCO6yNHoGxDDmCRmpRsT4jfgwuwM6w32Z6aMUJ2
	77KlpbRn0s5WcdqbrNavdHsNFbQZEtyTlN1XWe8sDKjAwzUR6gcwLShJ4IVGV2POhuL/IQjCFwT
	5os5IzOSxnMU7fQSmevGPpj3rDaltzxXHIxMWJS3blh7l5mk+3RwY3muUXiWH9KSM7wpSnpZsl4
	UmIEQxHqHIyso7ytUXoSlq3uHePTGyDJ5V4DkUugaifhavvjG94sf14f9OL4u0BuBvN6PogzMmO
	1EVfM1D32Hy5Cj50+jOt54epTAtUTZ3eolC0f6ojoz3wBS9FvaG7DAsqj/LTZ+U09uxGY+EdjTa
	Wzuh0MbbkKl5OBE9jZJwzSezNAyH6eg8SzOlJd4QaCMZOw4jeuZZ5/NgFvV5R4WeagpVqEspm0g
	==
X-Received: by 2002:a05:6122:d20:b0:59e:6c31:5aae with SMTP id 71dfb90a1353d-5bd69dfc2bfmr7098686e0c.5.1782739030441;
        Mon, 29 Jun 2026 06:17:10 -0700 (PDT)
X-Received: by 2002:a05:6122:d20:b0:59e:6c31:5aae with SMTP id 71dfb90a1353d-5bd69dfc2bfmr7098611e0c.5.1782739029817;
        Mon, 29 Jun 2026 06:17:09 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ef0f2b9df0sm56744616d6.13.2026.06.29.06.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:17:09 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:16:26 +0800
Subject: [PATCH v5 08/25] drm/msm/dp: Add support for MST channel slot
 allocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-msm-dp-mst-v5-8-1d882d9012f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782738985; l=14493;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=6lpvA03lTMdRM/0wlQkWgH5cAUUD9fhbnOBTPzj7wzo=;
 b=3AGfjxlxSJxwMW1tRCS0T8qQVSMiT23NNwpFIh+Iiot2uYrX7xe898iSOWgFZwtACl1RFRnzG
 2RZ6RBQldVTB4M+9SFWkDxIg4CNt9FobbfSQxFnv1DDd0FLItU9+BN3
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: k74_fkD0FHMooDsSMpSQTpYvGQgjEeXa
X-Proofpoint-ORIG-GUID: k74_fkD0FHMooDsSMpSQTpYvGQgjEeXa
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a427057 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=hJW9TclkvKJq_QVPYxUA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfX1yHpocGma+Sp
 EabCqnmOq33yjvL1ci+kmx0QBwjNxOh16rYYyimsF5ScPUvfF2fieviu8oXts1ENyxB2aFeKk1N
 /4w9YIbL119faFY7U+94Mfv73slhQiQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfX4yvT2gnrlhGj
 tDlmiBLqEOZ/omsv9FxTYW4gESpm33yEx7L3XCt0nkGfj2vEFPsVpfLN3IIbwO9bYK6wvLjrWOh
 h9WzD8X+BTdjnnkKVOuBvSjeSWCYM1A+deD/pHNZISMuFreW3Wc6JBf02ilfUCVeM64HCOwbKuv
 Wl/sHue0GH/RVrzFRkdkHuvXq2ZjF+LrtPjZQFY9EMRsCE7+yMVv/P6wUCC2LPmpR1RI5Ksa5jo
 NR3Mwql2WvjIXVB9dPsC2RwYk4j8thMWtJqs3dNIiI+ZAoiJ/m68PQpkoUEm8Jrc2AMUJe3xZUp
 08H31Zw0Wvp8Ad0dlt6XdhLt2byb5QKkmFXRD81vApX2Cf2XBh9JEEWw3GkEyvjVhwl+n3ftQOI
 Ftpt5o7HMivuKtfrgLUgumP8As9wm3h1ArLKQA+9nLKaGPUO2P2/OVfnLrRRpF5ZCYqTwaISRda
 KkHnxf0zAazROONsOqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290109
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
	TAGGED_FROM(0.00)[bounces-115091-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
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
X-Rspamd-Queue-Id: 41AFA6DB300

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

DP MST streams share 64 MTP slots in a time-multiplexed manner. Add
support for calculating the rate governor, slot allocation, and slot
reservation in the DP controller.

Each MST stream can reserve its slots by calling
msm_dp_display_set_stream_info() from its bridge callbacks.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 192 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   4 +
 drivers/gpu/drm/msm/dp/dp_display.c |  17 ++++
 drivers/gpu/drm/msm/dp/dp_display.h |   2 +
 drivers/gpu/drm/msm/dp/dp_panel.c   |   6 ++
 drivers/gpu/drm/msm/dp/dp_panel.h   |   1 +
 drivers/gpu/drm/msm/dp/dp_reg.h     |  10 ++
 7 files changed, 232 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 5b5149b160df..15df82a0caca 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -73,6 +73,7 @@
 #define MR_LINK_PRBS7 0x100
 #define MR_LINK_CUSTOM80 0x200
 #define MR_LINK_TRAINING4  0x40
+#define DP_MAX_TIME_SLOTS 64
 
 enum {
 	DP_TRAINING_NONE,
@@ -109,6 +110,11 @@ struct msm_dp_vc_tu_mapping_table {
 	u8 tu_size_minus1;
 };
 
+struct msm_dp_mst_ch_slot_info {
+	u32 start_slot;
+	u32 tot_slots;
+};
+
 struct msm_dp_ctrl_private {
 	struct msm_dp_ctrl msm_dp_ctrl;
 	struct drm_device *drm_dev;
@@ -143,6 +149,8 @@ struct msm_dp_ctrl_private {
 	bool link_clks_on;
 	bool stream_clks_on[DP_STREAM_MAX];
 	bool mst_active;
+
+	struct msm_dp_mst_ch_slot_info mst_ch_info[DP_STREAM_MAX];
 };
 
 static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)
@@ -289,6 +297,44 @@ static void msm_dp_ctrl_mst_config(struct msm_dp_ctrl_private *ctrl, bool enable
 	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 }
 
+static void msm_dp_ctrl_mst_channel_alloc(struct msm_dp_ctrl_private *ctrl,
+					  enum msm_dp_stream_id stream_id, u32 ch_start_slot,
+					  u32 tot_slot_cnt)
+{
+	u32 slot_reg_1 = 0, slot_reg_2 = 0;
+
+	if (ch_start_slot > DP_MAX_TIME_SLOTS ||
+	    (ch_start_slot + tot_slot_cnt > DP_MAX_TIME_SLOTS)) {
+		DRM_ERROR("invalid slots start %d, tot %d\n",
+			  ch_start_slot, tot_slot_cnt);
+		return;
+	}
+
+	drm_dbg_dp(ctrl->drm_dev, "stream_id %d, start_slot %d, tot_slot %d\n",
+		   stream_id, ch_start_slot, tot_slot_cnt);
+
+	if (ch_start_slot && tot_slot_cnt) {
+		u64 mask = GENMASK_ULL(ch_start_slot + tot_slot_cnt - 2, ch_start_slot - 1);
+
+		slot_reg_1 = mask & 0xFFFFFFFF;
+		slot_reg_2 = (mask >> 32) & 0xFFFFFFFF;
+	}
+
+	msm_dp_write_stream_link(ctrl, stream_id, REG_DP_DP0_TIMESLOT_1_32, slot_reg_1);
+	msm_dp_write_stream_link(ctrl, stream_id, REG_DP_DP0_TIMESLOT_33_63, slot_reg_2);
+}
+
+static void msm_dp_ctrl_update_rg(struct msm_dp_ctrl_private *ctrl,
+				  enum msm_dp_stream_id stream_id, u32 x_int, u32 y_frac_enum)
+{
+	u32 rg = y_frac_enum | (x_int << 16);
+
+	drm_dbg_dp(ctrl->drm_dev, "stream_id: %d x_int:%d y_frac_enum:%d rg:%d\n",
+		   stream_id, x_int, y_frac_enum, rg);
+
+	msm_dp_write_stream_link(ctrl, stream_id, REG_DP_DP0_RG, rg);
+}
+
 /*
  * NOTE: resetting DP controller will also clear any pending HPD related interrupts
  */
@@ -2619,6 +2665,117 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
 	msm_dp_write_stream_link(ctrl, panel->stream_id, REG_DP_SOFTWARE_NVID, nvid);
 }
 
+/*
+ * Calculate MST Rate Governor parameters x_int and y_frac_enum (HPG 3.8.1.2).
+ *
+ * The RG paces symbol delivery per MTP via: M = x_int + y_frac_enum/256
+ * where M is the target symbol count per MTP across all lanes.
+ *
+ * min_slot_cnt = (pclk * bpp/8) / (lclk * lanes) * 64   -- slots at 1.0x BW
+ * max_slot_cnt = pbn * 54 / (lclk * lanes)               -- slots at PBN limit
+ * raw_target_sc = (min + max) / 2                        -- midpoint (~1.003x)
+ *
+ * Quantize raw_target_sc to 1/(256*lanes) steps, then:
+ *   M           = Chosen_TARGET_Slot_Count * lanes
+ *   x_int       = INT(M)
+ *   y_frac_enum = CEIL(256 * MOD(M, 1))
+ */
+static void msm_dp_ctrl_mst_calculate_rg(struct msm_dp_ctrl_private *ctrl,
+					 struct msm_dp_panel *panel,
+					 u32 *p_x_int, u32 *p_y_frac_enum)
+{
+	u64 min_slot_cnt, max_slot_cnt;
+	u64 raw_target_sc, target_sc_fixp;
+	u64 ts_denom, ts_enum, ts_int;
+	u64 pclk = panel->msm_dp_mode.drm_mode.clock;
+	u64 lclk = 0;
+	u64 lanes = ctrl->link->link_params.num_lanes;
+	u64 bpp = panel->msm_dp_mode.bpp;
+	u64 pbn = panel->pbn;
+	u64 numerator, denominator, temp, temp1, temp2;
+	u32 x_int = 0, y_frac_enum = 0;
+	u64 target_strm_sym, ts_int_fixp, ts_frac_fixp, y_frac_enum_fixp;
+
+	lclk = ctrl->link->link_params.rate;
+
+	/* min_slot_cnt */
+	numerator = pclk * bpp * 64 * 1000;
+	denominator = lclk * lanes * 8 * 1000;
+	min_slot_cnt = drm_fixp_from_fraction(numerator, denominator);
+
+	/* max_slot_cnt */
+	numerator = pbn * 54 * 1000;
+	denominator = lclk * lanes;
+	max_slot_cnt = drm_fixp_from_fraction(numerator, denominator);
+
+	/* raw_target_sc */
+	numerator = max_slot_cnt + min_slot_cnt;
+	denominator = drm_fixp_from_fraction(2, 1);
+	raw_target_sc = drm_fixp_div(numerator, denominator);
+
+	/* target_sc */
+	temp = drm_fixp_from_fraction(256 * lanes, 1);
+	numerator = drm_fixp_mul(raw_target_sc, temp);
+	denominator = drm_fixp_from_fraction(256 * lanes, 1);
+	target_sc_fixp = drm_fixp_div(numerator, denominator);
+
+	ts_enum = 256 * lanes;
+	ts_denom = drm_fixp_from_fraction(256 * lanes, 1);
+	ts_int = drm_fixp2int(target_sc_fixp);
+
+	temp = drm_fixp2int_ceil(raw_target_sc);
+	if (temp != ts_int) {
+		temp = drm_fixp_from_fraction(ts_int, 1);
+		temp1 = raw_target_sc - temp;
+		temp2 = drm_fixp_mul(temp1, ts_denom);
+		ts_enum = drm_fixp2int(temp2);
+	}
+
+	/* target_strm_sym */
+	ts_int_fixp = drm_fixp_from_fraction(ts_int, 1);
+	ts_frac_fixp = drm_fixp_from_fraction(ts_enum, drm_fixp2int(ts_denom));
+	temp = ts_int_fixp + ts_frac_fixp;
+	temp1 = drm_fixp_from_fraction(lanes, 1);
+	target_strm_sym = drm_fixp_mul(temp, temp1);
+
+	/* x_int */
+	x_int = drm_fixp2int(target_strm_sym);
+
+	/* y_enum_frac */
+	temp = drm_fixp_from_fraction(x_int, 1);
+	temp1 = target_strm_sym - temp;
+	temp2 = drm_fixp_from_fraction(256, 1);
+	y_frac_enum_fixp = drm_fixp_mul(temp1, temp2);
+
+	temp1 = drm_fixp2int(y_frac_enum_fixp);
+	temp2 = drm_fixp2int_ceil(y_frac_enum_fixp);
+
+	y_frac_enum = (u32)((temp1 == temp2) ? temp1 : temp1 + 1);
+
+	*p_x_int = x_int;
+	*p_y_frac_enum = y_frac_enum;
+
+	drm_dbg_dp(ctrl->drm_dev, "MST lane_cnt:%llu, rate:%llu x_int:%d, y_frac:%d\n",
+		   lanes, lclk, x_int, y_frac_enum);
+}
+
+static void msm_dp_ctrl_mst_stream_setup(struct msm_dp_ctrl_private *ctrl,
+					 struct msm_dp_panel *panel)
+{
+	u32 x_int, y_frac_enum;
+
+	if (!ctrl->mst_active)
+		return;
+
+	drm_dbg_dp(ctrl->drm_dev, "MST stream channel allocation\n");
+
+	msm_dp_ctrl_mst_stream_channel_slot_setup(&ctrl->msm_dp_ctrl);
+
+	msm_dp_ctrl_mst_calculate_rg(ctrl, panel, &x_int, &y_frac_enum);
+
+	msm_dp_ctrl_update_rg(ctrl, panel->stream_id, x_int, y_frac_enum);
+}
+
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
 				  struct msm_dp_panel *panel,
 				  bool force_link_train)
@@ -2708,6 +2865,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 	if (!ctrl->mst_active)
 		msm_dp_ctrl_setup_tr_unit(ctrl, panel);
 
+	msm_dp_ctrl_mst_stream_setup(ctrl, panel);
+
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
 	ret = msm_dp_ctrl_mst_send_act(msm_dp_ctrl, panel);
@@ -2760,6 +2919,39 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
 	phy_power_off(phy);
 }
 
+void msm_dp_ctrl_set_mst_channel_info(struct msm_dp_ctrl *msm_dp_ctrl,
+				      enum msm_dp_stream_id stream_id,
+				      u32 start_slot, u32 tot_slots)
+{
+	struct msm_dp_ctrl_private *ctrl;
+
+	if (!msm_dp_ctrl || stream_id >= DP_STREAM_MAX) {
+		DRM_ERROR("invalid input\n");
+		return;
+	}
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	ctrl->mst_ch_info[stream_id].start_slot = start_slot;
+	ctrl->mst_ch_info[stream_id].tot_slots = tot_slots;
+}
+
+void msm_dp_ctrl_mst_stream_channel_slot_setup(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	struct msm_dp_ctrl_private *ctrl;
+	int i;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	if (!ctrl->mst_active)
+		return;
+
+	for (i = DP_STREAM_0; i < ctrl->num_pixel_clks; i++) {
+		msm_dp_ctrl_mst_channel_alloc(ctrl, i, ctrl->mst_ch_info[i].start_slot,
+					      ctrl->mst_ch_info[i].tot_slots);
+	}
+}
+
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
 			    struct msm_dp_panel *panel)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 6de028da85fb..e1d10ae20f70 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -61,4 +61,8 @@ void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *dp_ctrl);
 int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl,
 			     struct msm_dp_panel *panel);
+void msm_dp_ctrl_mst_stream_channel_slot_setup(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_set_mst_channel_info(struct msm_dp_ctrl *msm_dp_ctrl,
+				      enum msm_dp_stream_id stream_id,
+				      u32 start_slot, u32 tot_slots);
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index acb581a8a541..36857d6ed313 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -749,6 +749,20 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp,
 	return 0;
 }
 
+int msm_dp_display_set_stream_info(struct msm_dp *msm_dp_display, struct msm_dp_panel *panel,
+				   u32 start_slot, u32 num_slots, u32 pbn)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	msm_dp_ctrl_set_mst_channel_info(dp->ctrl, panel->stream_id, start_slot, num_slots);
+
+	panel->pbn = pbn;
+
+	return 0;
+}
+
 /**
  * msm_dp_bridge_mode_valid - callback to determine if specified mode is valid
  * @dp: Pointer to dp display structure
@@ -1489,6 +1503,8 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
+	msm_dp_display_set_stream_info(msm_dp_display, dp->panel, 0, 0, 0);
+
 	rc = msm_dp_display_enable(dp, dp->panel);
 	if (rc)
 		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
@@ -1509,6 +1525,7 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
 	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
+	msm_dp_ctrl_mst_stream_channel_slot_setup(msm_dp_display->ctrl);
 	msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl, msm_dp_display->panel);
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index e987de80522c..45e2cc2d6add 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -43,5 +43,7 @@ void msm_dp_display_atomic_enable(struct msm_dp *dp_display);
 enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
 					       const struct drm_display_info *info,
 					       const struct drm_display_mode *mode);
+int msm_dp_display_set_stream_info(struct msm_dp *msm_dp_display, struct msm_dp_panel *panel,
+				   u32 start_slot, u32 num_slots, u32 pbn);
 
 #endif /* _DP_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index e0c0e8c9178c..ef2ded8ec4ea 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -57,6 +57,12 @@ u32 msm_dp_stream_reg(enum msm_dp_stream_id id, u32 reg)
 		return is_s1 ? REG_DP1_ACTIVE_HOR_VER : REG_DP_MSTLINK_ACTIVE_HOR_VER;
 	case REG_DP_MISC1_MISC0:
 		return is_s1 ? REG_DP1_MISC1_MISC0 : REG_DP_MSTLINK_MISC1_MISC0;
+	case REG_DP_DP0_TIMESLOT_1_32:
+		return is_s1 ? REG_DP_DP1_TIMESLOT_1_32 : REG_DP_MSTLINK_TIMESLOT_1_32;
+	case REG_DP_DP0_TIMESLOT_33_63:
+		return is_s1 ? REG_DP_DP1_TIMESLOT_33_63 : REG_DP_MSTLINK_TIMESLOT_33_63;
+	case REG_DP_DP0_RG:
+		return is_s1 ? REG_DP_DP1_RG : REG_DP_MSTLINK_DP_RG;
 	case MMSS_DP_SDP_CFG:
 		return is_s1 ? MMSS_DP1_SDP_CFG : MMSS_DP_MSTLINK_SDP_CFG;
 	case MMSS_DP_SDP_CFG2:
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index dc046fec24fc..3e78af9e430d 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -50,6 +50,7 @@ struct msm_dp_panel {
 	u32 hw_revision;
 
 	enum msm_dp_stream_id stream_id;
+	u32 pbn;
 
 	u32 max_bw_code;
 };
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index deb40ed24654..f2bd96f3bbd0 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -338,7 +338,13 @@
 #define DP_TPG_VIDEO_CONFIG_BPP_8BIT		(0x00000001)
 #define DP_TPG_VIDEO_CONFIG_RGB			(0x00000004)
 
+
+#define REG_DP_MSTLINK_DP_RG			(0X0000011C)
 #define REG_DP1_CONFIGURATION_CTRL		(0x00000400)
+#define REG_DP_DP0_TIMESLOT_1_32		(0x00000404)
+#define REG_DP_DP0_TIMESLOT_33_63		(0x00000408)
+#define REG_DP_DP1_TIMESLOT_1_32		(0x0000040C)
+#define REG_DP_DP1_TIMESLOT_33_63		(0x00000410)
 #define REG_DP1_SOFTWARE_MVID			(0x00000414)
 #define REG_DP1_SOFTWARE_NVID			(0x00000418)
 #define REG_DP1_TOTAL_HOR_VER			(0x0000041C)
@@ -359,8 +365,12 @@
 #define MMSS_DP1_SDP_CFG			(0x000004E0)
 #define MMSS_DP1_SDP_CFG2			(0x000004E4)
 #define MMSS_DP1_SDP_CFG3			(0x000004E8)
+#define REG_DP_DP0_RG				(0x000004F8)
+#define REG_DP_DP1_RG				(0x000004FC)
 
 #define REG_DP_MSTLINK_CONFIGURATION_CTRL	(0x00000034)
+#define REG_DP_MSTLINK_TIMESLOT_1_32		(0x00000038)
+#define REG_DP_MSTLINK_TIMESLOT_33_63		(0x0000003C)
 #define REG_MSTLINK_SOFTWARE_MVID		(0x00000040)
 #define REG_MSTLINK_SOFTWARE_NVID		(0x00000044)
 #define REG_DP_MSTLINK_TOTAL_HOR_VER		(0x00000048)

-- 
2.43.0


