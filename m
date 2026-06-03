Return-Path: <linux-arm-msm+bounces-111021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YmBVKXlFIGrrzgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 17:17:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 183E063909D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 17:17:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LGP0dkdD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jBm2NJjG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111021-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111021-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD7D53013B61
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 14:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8B45385D64;
	Wed,  3 Jun 2026 14:59:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672C734E75A
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 14:59:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780498781; cv=none; b=PLFiRSK6vLccblCHtyJ/vfPDvoZDYjchJDzHGtnyWjH5W8LuOKQnbsej9B+zbTbqRf93lLO3zMByV5VlvEMcX+pjtzvzm7ZMEjY57Gg8fuYYPik7mVt2eQs29F1UfpVUwebsZsaeCZCnjhXedqnDpoBUJ9qOtraqbMczMAZl18E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780498781; c=relaxed/simple;
	bh=tlczd3hbO7jRStxmbXwY/7Pvez+jwqK8qrOvD2gZiqc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H9T7jCFH5EYtBFtGLVAICbHrBrQ4pg7M+IBHqkw2bu6Anvq5c4BNNg/2fAs+TqoPO/Csc/uGRkqwRN5gV27EncgNX7Ge9IHYQIljl5uMnjPbnltuKLM9ArAB+0gJ4hDcMMwTetAkB/Ws7SBxBtQehXDKb0Y+UDlDx7iZs/vxCEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LGP0dkdD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jBm2NJjG; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653AB4xf3552292
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 14:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OHsKV+ltiKXXlmj8cUFWo9
	IbTkRATlv2GK6UqkbO9h4=; b=LGP0dkdDB/zIX1VP4TSAhzZdDunN+X8a21fjfc
	kWdA25gpjcSUH4hBGFoMDe15TSA5J62MDzzfPpR33WVdWY5QlZ++2ocwmD8DT0im
	/CSnTGyUec9kqbVoNIzXvCLbZ8wHhm/fdT8tjf8lY5rs/G3h0wUxJWQGUg7JqnT9
	tbuLiIZTgtxwggkRGdUQshxJsIEP8se1b4FYjiD4OHnlhAKYXP3p4k4qBszLFiS+
	89EVsCwGN9DfKnutMcAfcVKnQrhO3cxak98I09t18A514ss5hzrWZIPhKJD8GTdA
	JrkY9YAEbCBdbioM3v58dOE13HczH2Ce4JRf5CnK/KXN9Hbw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj9ms4e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 14:59:39 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8596e4272aso4751647a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 07:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780498779; x=1781103579; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OHsKV+ltiKXXlmj8cUFWo9IbTkRATlv2GK6UqkbO9h4=;
        b=jBm2NJjGELzoz7my0B/RuipeUYhMjpAY8McP258sFq2ejq2//avPTOaQ3YIDu45vln
         s+FVd+C3QIoPxiVAz57q57zziMVggAX7KNbFF/wxYGhKcuM9p7QU4xH4X2e/e4VZSyXl
         aXv2fr5nC16OE5Yfo9kXrLmvNY6p7NINNGMGprGkv5LYISdBXYvT/deU8Jh2zJNueHhg
         rrhsgcCleiiuS2FYLPsDSed+OfjHT5m/ZSE+J9wxlQnX2+lMrtLdrQepKzRy65Trccxe
         w0LmiT538p4Bmc5UWDRw/v5HkgZQZbBMP4pEV+nyDj57LCZk7jdJG16ndBin+1XhNC5s
         WOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780498779; x=1781103579;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OHsKV+ltiKXXlmj8cUFWo9IbTkRATlv2GK6UqkbO9h4=;
        b=IzRT2a6UJzuT8swvQephppwvGGW4ktEV3tH4JDE4daik36I63XMeBY4DbJ81P9vizM
         yy6ZreP58WTN8OsTklPoR8YynCKItPq71iYHvfJ3gNGDPHLw/uC4fVoiZKxsEUAuTbqJ
         VgGhSennGlQ5EMJTIVobbtS+/HdkcO+z0nn2epTGUjPE/WOq7/IgU7m/0epOfBt2uibl
         pAHdRtQim6tQ8i9cB18f8ghKc7RpvNkfERiUduON9GkOYjgeSuFJNwKSIxxmBYOlgvxB
         Co1wMcLNNc5v/6AzN+evHafiMdkQeC/tbL95o6tvGSzzAQFbPLLjbWpCV1YHUg3Cn+wq
         tq0w==
X-Gm-Message-State: AOJu0YwYNOcwwI08qoQxUTn24IHjed7UCQFrGNDsnmlx7Ntwb4lVRgVa
	sh84KZTxStanP40KCO3Vs5t7cxzVpBj7rLcng2JcLRxK14fHiRV75/3m5iEN+1pLXO6IJIeEJSB
	9H/Kiha3xfFPh1RbmTBu6sw365zu2ICNzj4seh+k2MpuReA/5djB8kJ6jE5kwGfwxgOgG
X-Gm-Gg: Acq92OFwYSJSjqL429HoAzPYQ5DUXiUFFrl6lLdJRfv0mzlradCSocAUWO6kDfVVxbm
	nD133bC5I4N8domM+XqfbsVBbGTs1tOXBhy6HJB8o7MiDj86SI+vuhWIsHhbBOGSzm3rLNOMdLd
	90sPkH5kLh8drblIILIdmk5wIR+pJeLllps6PttgcvwTXZmVyo1bykrHVqYk8JW6oUzH8MYGJgO
	VWZUJsXlmsQJU+syEE4kixidOgncy5zefDo9iql7wFRA4FxiWag7NJPQV5EuUs5hmR2aZ06BEnf
	IfMTeOyWXLWuhSc8Y2nSE8fvFWZ/5Xb7qtlQtSC/qUrbQgSA5k7R1tCWsZM1S4PJiezFDfdpBWr
	Qzg2UaIErVXwWxPmsqDcnBzHMjd9A7SBYtAkqT0m5Vgnflu5n9W7idTtRsB0=
X-Received: by 2002:a05:6a00:4085:b0:82f:6e9:d1c3 with SMTP id d2e1a72fcca58-84284ef2c4cmr4096569b3a.29.1780498779035;
        Wed, 03 Jun 2026 07:59:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:4085:b0:82f:6e9:d1c3 with SMTP id d2e1a72fcca58-84284ef2c4cmr4096526b3a.29.1780498778597;
        Wed, 03 Jun 2026 07:59:38 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282882170sm3747409b3a.30.2026.06.03.07.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:59:38 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH 0/5] Subject: [PATCH 0/5] Add Shikra (QCM2290) display
 support
Date: Wed, 03 Jun 2026 20:29:25 +0530
Message-Id: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE1BIGoC/yXMQQ6CMBBA0auQWTvJUJMWuQpxUdsBRg2QDhAN4
 e4UXb7F/xsoJ2GFutgg8Soq45BRXgoIvR86RonZYMhYsnRF7eWVPEbR6e2/SM5ZZ6hq/Y0gR1P
 iVj6/YXP/W5fHk8N8XmDfD+zSrYlyAAAA
X-Change-ID: 20260603-shikra-display-07767208fa90
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780498770; l=2627;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=tlczd3hbO7jRStxmbXwY/7Pvez+jwqK8qrOvD2gZiqc=;
 b=NuBmKboJ2e9mtFWMrrsLSiNUZwFZCNOuWYAD9ECbT/obdMO75IR3X0zKzn8SsFhx1YCJYfXpd
 t5w8rKtPPLWAIxXudncUKr9Kq4VWoutNylTrUaf1UuMDOP8r2sgYGcu
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: fxPt18dESJ4pvkeRv4M751tub8thtvub
X-Authority-Analysis: v=2.4 cv=XK0AjwhE c=1 sm=1 tr=0 ts=6a20415b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=sFAlhcv5WihPgsyf0pgA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE0NCBTYWx0ZWRfX1E+rdQ+2zw7+
 4VnWqOqfObQVkJJbupFqjMAiPhq5P21naMQbGqXUI9PXJxm9tFdgkirZN1rm3fIpFxeSjYVazzr
 6t4XbUTD3GCfy/HQWUDADcmR1shWfseqWoNP0FNzKw+NRavXivf6qf8fBDrOX/3UR18Meaf0ttT
 xMY/A4owUPsCIuuUhVhftSZoLV2jej4Gmy42/KfvyWrAppR2/c/jy0ru3uBX2vkS3Nxrgigcep5
 U76f9UnFcTQu+8TOt+HjE2Phg5couo7sSIqh/VIxCGXhXX2NO4awT6YfRyY0N54i9k7GlEzMHTO
 iUobd28BPRAY8vBGZGwSvWacdh7+AlOepnVWhZMlKVUHs9M3M+K1MRAcGcQcSy625JO+5EYw0jc
 N/TIylmuMAETbfyhbTnEQXH/dgcH+ewoI6AGzhw0ezk6OQ0A0Ry91j5pgfIlE/e5WjSGU+XzJrr
 iTpzjf6wxi+upG2fNbQ==
X-Proofpoint-ORIG-GUID: fxPt18dESJ4pvkeRv4M751tub8thtvub
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030144
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111021-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkrishn@quicinc.com,m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:nabige.aala@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 183E063909D

Shikra (QCM2290) is a Qualcomm SoC based on the QCM2290 family that
reuses the same MDSS/DPU 6.5 hardware as QCM2290. This series enables
the display subsystem for Shikra by adding DT binding updates for MDSS,
DSI controller and DPU, drm/msm driver entries reusing the QCM2290
AHB clock and DPU catalog, UBWC configuration (no_ubwc_data), arm64
defconfig enablement for the ILI7807S DSI panel, and explicit SMMU
client table entries for qcom,shikra-mdss.

Tested on Shikra EVK board with ILI7807S DSI panel. Display
pipeline probes cleanly and panel renders correctly.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
Nabige Aala (5):
  dt-bindings: display: msm: qcm2290: Add Shikra MDSS
  drm/msm/mdss: Add Shikra support
  arm64: defconfig: Enable ILI7807S DSI panel driver
  soc: qcom: ubwc: Add Shikra UBWC config
  iommu/arm-smmu: Add qcom,shikra-mdss to Qualcomm SMMU client tables

 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml		|  1 +
 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml		|  4 +++-
 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml		| 34 +++++++++++++++++++++++++++-------
 arch/arm64/configs/defconfig							|  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c					|  1 +
 drivers/gpu/drm/msm/msm_mdss.c							|  1 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c					|  3 +++
 drivers/soc/qcom/ubwc_config.c							|  1 +
 8 files changed, 38 insertions(+), 8 deletions(-)
---
Prerequisite-Message-Id: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>

---
Nabige Aala (5):
      dt-bindings: display: msm: qcm2290: Add Shikra MDSS
      drm/msm/mdss: Add Shikra support
      arm64: defconfig: Enable ILI7807S DSI panel driver
      soc: qcom: ubwc: Add Shikra UBWC config
      iommu/arm-smmu: Add qcom,shikra-mdss to Qualcomm SMMU client tables

 .../bindings/display/msm/dsi-controller-main.yaml  |  1 +
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  4 ++-
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    | 34 +++++++++++++++++-----
 arch/arm64/configs/defconfig                       |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  1 +
 drivers/gpu/drm/msm/msm_mdss.c                     |  1 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         |  3 ++
 drivers/soc/qcom/ubwc_config.c                     |  1 +
 8 files changed, 38 insertions(+), 8 deletions(-)
---
base-commit: 3a34f9c13cc0688f8db2a0db8506bf8c0d90737d
change-id: 20260603-shikra-display-07767208fa90

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>


