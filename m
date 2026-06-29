Return-Path: <linux-arm-msm+bounces-115093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uwdEGcRyQmri7QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:27:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C29226DB31B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:27:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Tgh0+XBA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GVIKBKK6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115093-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115093-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 170883030D46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29999416CEC;
	Mon, 29 Jun 2026 13:17:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35B9416CE2
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739048; cv=none; b=OQQp3dVbw5TvvNVPkity3OXUx20/A4VsdXINpn6RgKIhXIjyipkyuWt4uRGimwXi17/ZxnsZHm33wGjV9bBF+2F5CZRcjkHIRB+bOuHZmNUsfmcLESD45ZdHnF7CcW8JnNoTiVyuSuaJTbUupIPpHPGoWf0Ztb07wF3KHn37wgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739048; c=relaxed/simple;
	bh=aNYD9OMPwNCeknvqoYVxnTIvvH7ZaraN+x/3sRKxRdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UFvd/KCx4x94LQmplCs8aea3se+93i+vclcL6KPf8DYC9TY5LEspA+330/kHcQFPxeFpz9XIuLpAq0CwE1+6WZwqYoQpArTcQxgpd8qU46htafUC13eWe5veZO9RguKS8mqat0k6Hi6X3sJCt3vpYK1elQ/LfeZLPSrBowuIn98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tgh0+XBA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GVIKBKK6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATEut2579139
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p1CONgWJ01NtWeyqUGCMrIIJYd+vBD6kZt60dnrceag=; b=Tgh0+XBA0usTA+OQ
	PFfudKejC4khUe0VaZYcX2XnvuX8dbZGKscKwsPsN3YDOS8ADM/8XNNAquQE9lhI
	6ZhdUE/+wqWIm4WAsj1YFVUY7j5Vkt9A8R4qRD6lM8PmwMOdcwfIGQofAL/sp23Z
	f4Nmh80DANy8u2SE6SUnp50rkry/8UwP6tmo6sHougmsQnT3TIq5nxgoPDmn/ArW
	zeyV/4Ol482qkDOALghkfMs7/6d8S6LYekq/9ssM5tYNfsEMSv34XgxjFQG78h6j
	3gswxV5PmaXLGN5FnM8CCB6f1tB640heoYPRW0O2NEmYAyUKtKJVBWDp58xfcYw1
	7teY/Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7hg8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ef81cc115cso22466196d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782739044; x=1783343844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p1CONgWJ01NtWeyqUGCMrIIJYd+vBD6kZt60dnrceag=;
        b=GVIKBKK6atYUo+pMPvCD0AK2gjxip5v86JavFOoLBRrOf2kCo0qHYhpXH3zkaJjL9j
         1prRrD/tTqt/zGxMUY9VrBCdsPGM+w943qrYtT3qErHeLY+pT7xOQ/iVkfz5OeQZQWGW
         /5rKNBQAKsGsaXRDPtLA5UlPTLY53v6WJQDPJiQCSvCAMbZHhnJIf4gJlUvAP8VfQUr2
         NJOgSO6fv8g/6AsykCwqVuSuYBFRp/jsIotDiO0A/N0RGnNNusFUQyOZ5TctV0UhvKuD
         10gX0uXA5hhFzHnHLI3pkamXVgd9UhS2D8b6AsO9ICLkzrI/gfQ9uvJkXKie9/ruhiub
         v1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782739044; x=1783343844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p1CONgWJ01NtWeyqUGCMrIIJYd+vBD6kZt60dnrceag=;
        b=d/mB1FGOdhL0cB4hkLGZgYC5QvmB3G1aiJ5BBg4YDADhvDyT1vkZP0PZWC7X7BtyeY
         fyYcUbAWP2gcLpspawjANiAgDC/HVFkS6PXhFanwsCKDAPuJ3Y2xJrzRDaF4On7EnMtG
         ZLYteKfT5nfVLh12memM1aSyh3rZcGRwPOX47jBwaXaqOmzAD76Tdxo/eAnZCYV81iyU
         xJVDPUbrNDJRmqPg+K0u41UMok8xJ80GjOWsEyqQ1G1tAhU/pOG1Kjz7fgG3zljFLvtM
         oiks5GJc59To7uyYF/HNp0Wn+Km0HKij640uTAiy9kM17y2DrAMRnrtlYVy0Ff5mlMgG
         oZpQ==
X-Gm-Message-State: AOJu0YyBOwu/a4526relMcHNJNe3O7b602VAcpXEUb3Ewgj190bgF3ur
	J/K1Z7rmL7nrceXlDuVmE8MsCisXn1G9r/hJq7FIokNcse50+OsnZShld9mmbjwvFinr1GvsJzI
	mQwLJ1kRry/rmLsJxSE47rD4W//hU4rkh1El7evWQStKJUvMYM1FKj0K7mCeR1K3JyXe9
X-Gm-Gg: AfdE7clAlF9nKp0ompnxHT7UsS5bu6p+4X4UFbvlRMvUuuHBSQ40i1r3uTFSVaTTnac
	xeobMMT2Va4N3f73coHJIPGyHECo+vPIG4tegI8FeDQppKfa3yh9oPKYejOIWrFWsLZof2vY4Ak
	GdX+BxwQ4VGUhaV47RufWoc14bk4PxVF/8DEeiJw3zxkbtgSCce87ykpesI+faaLIW2cEWRcuAX
	s94ow8GIwkjtBamlFOTZBlXW0PbsbV8u/IKZvzXpWJlUbbRBedR5CoOnspX44hkAQjUrfWlJGFi
	9X3TlznVDMJYl0sZtpGWpWE2YbK8cZrv3yMPJqPXze8s8wUt7Ykmys/YXSqV62LHrI3zkwLVwsj
	ZZhqDaOfSn+84ov0uZOMWyYD4zLTfQqP8t/8ZpX0FDAPGp3Y4cx+92UdRQdIzbuxZDv/GBjcPAA
	==
X-Received: by 2002:a05:6214:4506:b0:8f1:2fef:78c8 with SMTP id 6a1803df08f44-8f12fef7aeamr15307596d6.19.1782739044034;
        Mon, 29 Jun 2026 06:17:24 -0700 (PDT)
X-Received: by 2002:a05:6214:4506:b0:8f1:2fef:78c8 with SMTP id 6a1803df08f44-8f12fef7aeamr15303756d6.19.1782739039914;
        Mon, 29 Jun 2026 06:17:19 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ef0f2b9df0sm56744616d6.13.2026.06.29.06.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:17:19 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:16:28 +0800
Subject: [PATCH v5 10/25] drm/msm/dp: Always program MST_FIFO_CONSTANT_FILL
 for MST use cases
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-msm-dp-mst-v5-10-1d882d9012f4@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782738985; l=2539;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=NN3ZQ7RQKQ4IPtPV9Psg0vrIOb4voIVZosbAYDy6STY=;
 b=zoYI8ASIaci6SW3dWtVfeAGjeqiz/AA12sLnqxeR3dMWUSxJSZHjHaVl6t5c/HKemz6HBBCkB
 nb4kmM7dGd1CPdo/K0cxgUXMFla3WttajkYNsyR5u/UMjtR97uxJ0bv
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfX4+sQzhtQ2CnW
 uw78L1i4177iP/QOE1E+d1Gcb9pbFYG1IU+eqbXkl66CUJ9ITGX9QgjOoNpfBMWn5YHGMNgknDx
 FXHvjXS2S/H2hW41kOyo4USU8zbR+tg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfX1zVSy3xRed+n
 8CEAtFlpBAEQhqcjrHPKVnxxgECELzl0FUUK+Xa2E7KF2scrCqQjS1MYTCw+ESMCGi0kob0t1Iq
 sF5FwJAUhEGyU/0h/rg7Bd2kArvO5npSDTV3KVvXIevsksVPn/9AHDGzQo4Sesw6sxN4Pzuo78A
 Sw2qKSeOy+eqIE/qPWsBlZgl6GuD/X0T5kw3eN7On24qMjS1FJShbjj1nRbRCf3Bk/73OCID+BB
 Rty53SU5Y1xdajM1UO2+gFP8Aa+Rc3hLq7p8dbDtq//Z6vJ+2tsonjOzDFaQwg2GeE1Lu7nbkvW
 hTAmp1LQWQNzk0V4JOLwvuiQKTYBuiQaIIrHJApUa05VeMnfpVr5LdU9PlZ1xjh+hOz3eF0cBq/
 NqGK+T+Huhy5uBVtf0EGQ9x0tn5+4sVf48DFB3dzqoUDDW687Q0DTkLCu7Am7HgftPaLuoPbv13
 r0crRcekXVyMCImBKLw==
X-Proofpoint-ORIG-GUID: ZzptpwG7Gib3iPak-gmmvF052c7EHO15
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a427065 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=_o_Q1azn2oY438DeJ5EA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ZzptpwG7Gib3iPak-gmmvF052c7EHO15
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
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
	TAGGED_FROM(0.00)[bounces-115093-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
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
X-Rspamd-Queue-Id: C29226DB31B

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

As per the hardware programming guide, MST_FIFO_CONSTANT_FILL must
always be programmed when operating in MST mode. Ensure the register
is configured accordingly.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c  |  2 ++
 drivers/gpu/drm/msm/dp/dp_panel.c | 12 ++++++++++++
 drivers/gpu/drm/msm/dp/dp_panel.h |  2 ++
 3 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index c4f1a68b1210..80116e19fbbf 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -677,6 +677,8 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 	msm_dp_ctrl_config_misc1_misc0(ctrl, panel);
 
 	msm_dp_panel_timing_cfg(panel, ctrl->msm_dp_ctrl.wide_bus_en);
+
+	msm_dp_panel_mst_async_fifo(panel, ctrl->mst_active);
 }
 
 /*
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index cbbcc0dbf652..ba5ee2ad8924 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -741,6 +741,18 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
 	return 0;
 }
 
+void msm_dp_panel_mst_async_fifo(struct msm_dp_panel *msm_dp_panel, bool mst_en)
+{
+	struct msm_dp_panel_private *panel;
+
+	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
+
+	if (mst_en)
+		msm_dp_write_pn(panel, MMSS_DP_ASYNC_FIFO_CONFIG, 0x01);
+	else
+		msm_dp_write_pn(panel, MMSS_DP_ASYNC_FIFO_CONFIG, 0x00);
+}
+
 int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel,
 				 const struct drm_display_mode *adjusted_mode,
 				 u32 bpp)
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 3e78af9e430d..edc39ee5268e 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -73,6 +73,8 @@ void msm_dp_panel_clear_dsc_dto(struct msm_dp_panel *msm_dp_panel);
 void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sdp *vsc_sdp);
 void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel);
 
+void msm_dp_panel_mst_async_fifo(struct msm_dp_panel *msm_dp_panel, bool mst_en);
+
 /**
  * is_link_rate_valid() - validates the link rate
  * @bw_code: link rate requested by the sink

-- 
2.43.0


