Return-Path: <linux-arm-msm+bounces-111710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Zus2MglpJmpkWAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:02:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 632CD653582
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:02:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LkjzvS6F;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HINXchZ8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111710-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111710-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 425D4301E3C0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 07:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F85F35E1C5;
	Mon,  8 Jun 2026 07:02:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48142D739B
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 07:02:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780902128; cv=none; b=Wv8a9FtX9tdQyjYZ2FCGqNCqcjkvJjq9lpUlMHAD5pALN3d671a7h35KH8b906OLXCuwqXcIEXhlD8grs5I03nihFROwhq0OTQVj6j2KSyE4/gPkPxEz5PriU9lq80MEKe5w/9IeWt67lhpy+PK3KxwVsjRCoZaoWnrHEP5NtXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780902128; c=relaxed/simple;
	bh=f/sCFDjTgatU0BGy4aowz36ZzDRGX9hyPbW8Spw3VEo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nRQCROpYs5QuGsyM87Z+VZ/EuvcpIaikL+fyasWKHB6/Y9rghI7jyarRlo056bIjfcTQrQAtw/qqvbR7pBg1GbG2RXVuXZEVhKIZmYztV+8lpvEEm7AD3gFZPHn26FWfmt/Hp22vMO5Qy615R7xc8xM22mx7znMQ8zXfGzrcBSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LkjzvS6F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HINXchZ8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586P2fh2802607
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 07:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4SqlhiCUHy+ItpDoHiIxZ33OiGVmsHhLICsi3glIWBc=; b=LkjzvS6F7bXJ4tOj
	C3sz8nXDmROsAjh5QWk5fvuhZV5SLFkwDQvzt0TCTge6v4ZKqKcUJLhgTbKLu18L
	2K3oLpCpzUVIDkr3ZiHDTWSh0kba4+pgsRlOMWAysVBu4equjwoNOrwDysludr8t
	fEiZKyP+h7wEPWLKLYOOEpqCGqEN+KFlUo7o5+4EtvSVAJWMCO+UH+kwFF73dw3Y
	j8/uYDV6FDzQD+/3FkraiDFTR2j18C02fzoRXrSXpVEmCDuOtGGpPBVVY/GxaqoW
	hYqSlMXaizdn3WewH4Dp3UkNPrryCB2tu/sFrHOPPy+TSy4BNEsX3f3ogRti26Fi
	cTuekA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3pt04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 07:02:04 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85edbb10dfso2158304a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 00:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780902124; x=1781506924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4SqlhiCUHy+ItpDoHiIxZ33OiGVmsHhLICsi3glIWBc=;
        b=HINXchZ88Fwr/h7kf/3ZFAjMcBG8q85e6FiI9yZY/3JLPFAcbspVEceW2ueKYklglu
         JdWKskZb2QyAQxhrHv3DZ5pvZlJ74iIDszq1HDgkrzyEY9qS74Rxf8o+UjtdGYNh+j6r
         eLrMhUaA2XXsk7WchsDOx8w0mx1FP2R1TET0zI7Q1PWFFyxECCTVRJXuyFJ2DqmBCBZF
         8200/xtI8G0Dl33kUi3+HyCQnb1drlJXEjSGs6ArCGVhPenza8jkswu2ek/m0yvUiZIF
         PwT493i1h641NOlWuUhXfRDS7X6PAqa76Aj0j5dBRrd/DD52jBUt4I+Xd35l9GHNzYRg
         NqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780902124; x=1781506924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4SqlhiCUHy+ItpDoHiIxZ33OiGVmsHhLICsi3glIWBc=;
        b=cYw+eyvBl/qw10q1MeAw0pSpj/aSRj5Ys+Z2VMOKgyjyQbaYcL97neyqFVHT3ELqS5
         /BhQiueri3ImUfDSGjTp1CD0mjRGznbi/mAch3os2RoiSc0Bzy/hy4O6GEQ5CgqMHuAv
         tPSn6pzu5GPXbuCh+Ntkr1Z8kMP1WVcvpwmd5YEwAgtN0ue+WAXNXS5VqlSquBbdmOq/
         JqdmLg7BdMr/5aXGL/i2lwYGzEmC/3iZI0fflmK8VEdMWlhi6fpILWMpycpRM6cW9PV+
         bXVDHvbpmo5Wtd9/Vw0Filah+FVU/yKjMi0zmD2V4siWVeszMd9v79hyydvpQ+9OdnVH
         6ymg==
X-Gm-Message-State: AOJu0Yz8r3dCumi10zOipG5S/Jb24jxvb2ehYhpqyglFlqj5RNXoZKc4
	pMf8yTksl2Ff6PL0GO8G9mgtVQHCjz1R+3Be30hXUtO2bkWTM5koAhKCJWSazIUGFcVLQukGmGM
	aC+FHTLzjxnhm1h2j8SStGLs9SDAMyYKOZmMleIsCoPDVpM30yP104/cL7a+gaf2YwAqd
X-Gm-Gg: Acq92OEGzLkOygBU/zivkvIFwCdpHPCP5yXgpV9rq8SnAHVeA56INQD9J2IDdgcA6YU
	mzLl8DJ3fNOZWamFgJHymhBuALYaM0RtKDoSNHkuKVnrPu4uVf1XBYskAsftDcc5mIWAnJTgyzH
	gRIWv2+F4Dk1sW60qa6bNVVfXjAoAJAxvxQG7TGdEaz0z3zMDMBzQ7BboluOQKv2QIJ4IomugMo
	Fh0p9/kIkjahDQkWm6vplkRIVNsuNdyYQG4hpwXt+yY3UgBHFCou2KXy+U4xAToMIAeKGWzpfxw
	f45N+iRkQJNQWiZ10QSYsbRkbX9CTfQxCFvbjkLG0IA9EtvWo5xAnnjWCOAs4NtOGPH6OzTjrTW
	OXsxZ3c5DpMoIh6CnYZqp7huEUy5qlJEvtTlwKjxHJc7cnVRhIu7yk0uoY60=
X-Received: by 2002:a05:6a21:6b8c:b0:3b3:3506:cf3f with SMTP id adf61e73a8af0-3b4d39ea8d8mr11958837637.1.1780902123815;
        Mon, 08 Jun 2026 00:02:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b8c:b0:3b3:3506:cf3f with SMTP id adf61e73a8af0-3b4d39ea8d8mr11958792637.1.1780902123334;
        Mon, 08 Jun 2026 00:02:03 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86151154a8sm6267723a12.22.2026.06.08.00.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 00:02:02 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 12:31:42 +0530
Subject: [PATCH v4 1/2] dt-bindings: display: msm: qcm2290: Add Shikra MDSS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-display-v4-1-88a846afdd5d@oss.qualcomm.com>
References: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780902106; l=3783;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=f/sCFDjTgatU0BGy4aowz36ZzDRGX9hyPbW8Spw3VEo=;
 b=3x+ZlUOf+wBvB+AHBU7fiuERNwbEV6hSQI9aySyJjZAyO4j5aINgHa5ClzJ3B/FdpAky6FC31
 e7ARgDXnF/bBbGnNPhCthcBG2EpS3e8W1qCplKY/8LUfa9o4nFpoBd7
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2MiBTYWx0ZWRfX0xLJA6yVdtuM
 +O+mRB8TG/zvv45JXy8AgjqbrC/KPccYaL47MXLIiaoRLOkY4vmKtnQI8tra7Z370lJsIznpsTz
 i66entdmSZAIWoxaxnA4PK5IgK6QvreOVjTp43470jg4TA8SxtyABDDI6rx/qO+NA4nHU+VJ1gr
 hxP5fY1l+XTrO7/O1kmkVwLBNE5zLOeA1iJ+2xg3dow/lkzCMVmDsA6CDEkLjYNj12Rlsgdaaix
 aWYopaQSbwbYOlAjD6QOPavCNFB5263ZCXfyJkVI8uGhcgnxJOdQH1qkzS1xIFQAVHeCCppe5s6
 wBSIfmkqCjuJltsxKRz/t1Vu0VjQUH66mTn3mDm1n7TE35lso4sI6+uLUsMVtIyGiczyc3uZEOe
 hh6XS47IpXZbnuYGioXbMj7Dm2XjqJi4vsZgbL0tuRnAP/T91zVyW3uaPKmYnADje5ppk6Nk/gt
 GkwFh58b6RGGdDGerSw==
X-Proofpoint-ORIG-GUID: gDH_7emq1c9Xe1dJncO8Z83Si0Lp3xo2
X-Proofpoint-GUID: gDH_7emq1c9Xe1dJncO8Z83Si0Lp3xo2
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a2668ec cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=OEkpyX7SRU1z48_sfK4A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080062
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111710-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkrishn@quicinc.com,m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:nabige.aala@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 632CD653582

Shikra reuses the same MDSS/DPU 6.5 hardware as QCM2290. Extend
the existing qcm2290 bindings to cover Shikra by adding fallback
compatible chains for MDSS, DPU and DSI controller nodes rather
than introducing a separate binding file.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 .../bindings/display/msm/dsi-controller-main.yaml     |  4 ++++
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml        |  6 +++++-
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml       | 19 ++++++++++++-------
 3 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index dbc0613e427e..fd0834d09ad6 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -47,6 +47,10 @@ properties:
               - qcom,sm8650-dsi-ctrl
               - qcom,sm8750-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
+      - items:
+          - const: qcom,shikra-dsi-ctrl
+          - const: qcom,qcm2290-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
       - items:
           - enum:
               - qcom,qcs8300-dsi-ctrl
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
index be6cd8adb3b6..034d3df8d247 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
@@ -13,7 +13,11 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    const: qcom,qcm2290-dpu
+    oneOf:
+      - const: qcom,qcm2290-dpu
+      - items:
+          - const: qcom,shikra-dpu
+          - const: qcom,qcm2290-dpu
 
   reg:
     items:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index bb09ecd1a5b4..49a7b5c4c678 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/display/msm/qcom,qcm2290-mdss.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm QCM220 Display MDSS
+title: Qualcomm QCM2290 and Shikra Display MDSS
 
 maintainers:
   - Loic Poulain <loic.poulain@linaro.org>
@@ -12,13 +12,18 @@ maintainers:
 description:
   Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
   sub-blocks like DPU display controller and DSI. Device tree bindings of MDSS
-  are mentioned for QCM2290 target.
+  are mentioned for QCM2290 and Shikra targets. Shikra uses the same MDSS/DPU/DSI
+  hardware as QCM2290 (DPU 6.5) and shares the same register layout.
 
 $ref: /schemas/display/msm/mdss-common.yaml#
 
 properties:
   compatible:
-    const: qcom,qcm2290-mdss
+    oneOf:
+      - const: qcom,qcm2290-mdss
+      - items:
+          - const: qcom,shikra-mdss
+          - const: qcom,qcm2290-mdss
 
   clocks:
     items:
@@ -52,7 +57,8 @@ patternProperties:
 
     properties:
       compatible:
-        const: qcom,qcm2290-dpu
+        contains:
+          const: qcom,qcm2290-dpu
 
   "^dsi@[0-9a-f]+$":
     type: object
@@ -60,9 +66,8 @@ patternProperties:
 
     properties:
       compatible:
-        items:
-          - const: qcom,qcm2290-dsi-ctrl
-          - const: qcom,mdss-dsi-ctrl
+        contains:
+          const: qcom,qcm2290-dsi-ctrl
 
   "^phy@[0-9a-f]+$":
     type: object

-- 
2.34.1


