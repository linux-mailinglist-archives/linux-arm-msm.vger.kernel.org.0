Return-Path: <linux-arm-msm+bounces-111197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Rtl/FKtxIWoTGgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:38:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8B463FEFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:38:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MfoqlJm3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="fz/LEivr";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111197-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111197-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D08C304F38C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 12:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EED847799D;
	Thu,  4 Jun 2026 12:31:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DF8472793
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 12:31:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780576295; cv=none; b=d6Hd7ZbaKWh8pU8+sBNJAi7O9Z6oK5U9ObVW9xWBJBAvJ3uLrM8QYsBQRgnnVt1U2nBdDtgAqME93oN9uukjjMPPYsY+L+7brPGoUl2/ES1pB+Y/qq0qmjgX2OGcH9DAk9qXkRRZICO2g59mpDmV0t9V1W4gzzGzW7Up30JGX+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780576295; c=relaxed/simple;
	bh=SCs9KQKBtzRapnZIGqIOvP+xU2+TnEvlesLmeM6sxt0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GvQXj5d8QyJcgR9CMoTTUIZjglj8BscJB3aWdojcU2F/21yeGhMkYf5B+XRpQKf1o7lQ+F2xNwKwgMH2TDwO3aTD5Sc5LPC60gAxudNdtIIfUcepkVYkQ1s0AJf6LbWbU0ZqZZ+tgF2b4/N3PD8s8ThFtVYchMJbX0J4BmHk0jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MfoqlJm3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fz/LEivr; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654CCd8c3221159
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 12:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y6UZz8IjVdVITbvOPHhdrUuJW0/kbNYyuOsWRAfVo8o=; b=MfoqlJm33MHz1RXo
	VaPPkj7+9L6dYSMphzMDlXqrUxYF/tjEoIaBQsTAwlti6OLji+gN+nAsJGO/pgOr
	e4NpL7icnywOddrjOc7u8ASzihLlaBh2FYSz0ImFmOBxThr2oVP4m4sD5PfCv02i
	FaX5dBYRefGXGmnzO0Tnz02AdXhHQlZl/Kk/9Iki20jVBtV4drzu5xcwRx8/YbVo
	edZGNzE9MGTpwvdaI3whUS+bByWFPVr6stI3/QNNzPNBbn/tFvxrkF+186FmDCGO
	fzIVCAyvweoGEd7bJ1AyvG8AINWJrj9Vyb1oMQtgIs+3kYleQcfTYXtadv24EWTa
	YiUnww==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek95u82d6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 12:31:29 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8422f987f2eso1143392b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 05:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780576289; x=1781181089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6UZz8IjVdVITbvOPHhdrUuJW0/kbNYyuOsWRAfVo8o=;
        b=fz/LEivrS/gDcCT3dT1SXy/VqLFFk8hguPzw8RRe7Y5d15otXWe1AQii3wI6ZYE1zg
         LhptjqwhW3hWVEXz5sc0nWnw2vXEyBVqFQYScm0pAdqgb9bt3BDBSMRqKWyHC5c8a3uz
         c1VFWrQ6RzL2eVAGbeOV1IxORh8bnz96tXIlD1TvcppFoq8Z6sxksNnKVNp4eqsCaHlB
         pKc0egyrNJuinEVYb4UXCIIX2/vwN1GbCfPV7R8fqMuEESkF5/x/sqXn3tzmWit8H506
         CGHnUYlZxp7xozWJUAH7LHWRtMYC9j1nj/7dciLviWlG69Fk0vDHMh0nzpmjxV/xxTpV
         NxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780576289; x=1781181089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y6UZz8IjVdVITbvOPHhdrUuJW0/kbNYyuOsWRAfVo8o=;
        b=seGnFJvFHSdBRQnWst3SBTvi5PmCTW0xm7Y56DDDZz7bG/LeIs6yvFmitmoKueKy/d
         PbuwyIiXCBfZi0n71ftlG2nqs/mAkNvVDv9lu/0vqYc7DckQU5UL82OnWxdsM0mF+677
         4wPhWYfjet9OF7xTFSP2aFTmdVZ6ubY2scgmwaPoc0m2KMS9EeNzZYq5VuMSe9v4tb5B
         +HIAL6oIjeIDYDgR9gyTzJsFUcoBxFokdltbvtLaIGoBj2mD9CZaW6RpZArpi9E6bJSS
         fnbtO1H6MQvfmM4U6qKvo6jydrRlMTYyM/gJeHUet0AQSPdYRm1jm47JY8SC17IKT6jr
         zAmQ==
X-Gm-Message-State: AOJu0YybvOS25k14ULBqbGs5gnG31UP/zbv4I4MrjIvEx9Go+VlAooWF
	sTFAHJoBEq0B6X0iJyyTyVHhTarkAM9hSenK5/oK5RmInXojEzFb+sLj9pxl84qwcqINTJe5tNI
	z9cgh88QTcZq3DD46j0a8f2uaV8FTMGXSoG5y55JvXrgNXqTUqTU3zSweIfIVRV2n1ZLd
X-Gm-Gg: Acq92OEt5RI6ymeuUBfJBK8sjuEB+CkzlAJOFtTXPTXmHQuFdMZI+55986ysCVIfasM
	U5/+endtt4pdpq16rCwV5x0ohfvXUEDyXmuZJnXvrzw9pGFkwkFDSTI1GyjSRv0m5zoPY0z2jA7
	3LkUo8xWLL+2ux4N0DalPs5CC+R+OuE8X6ZQVfSJ/0ejBvpz+cyVTDrTBrrGoW7WONYkSTtUYiW
	rUxvMQ0Zw/GEX0pNFzCduD4rDE3FK1PNsAQC9gchMELUwV4/MIhaGWRKSsj5IVnGYMftXSgzsgS
	EP8/+Dj73AxGIYqi90YBByH/8HrQijsSx83lo0L8fWXrtpqXDcz+O1GdSlb0K6jN+IEw5GMuqs2
	5wZKV3X3peIyvPS/CYRyOMy8tbqvlkZ5cGbwDgLilzPwm0xNaXkfcrIlvcYE=
X-Received: by 2002:a05:6a00:6c87:b0:82c:d7c9:5479 with SMTP id d2e1a72fcca58-84284e8e557mr7258383b3a.32.1780576288665;
        Thu, 04 Jun 2026 05:31:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c87:b0:82c:d7c9:5479 with SMTP id d2e1a72fcca58-84284e8e557mr7258325b3a.32.1780576288185;
        Thu, 04 Jun 2026 05:31:28 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428325d9a3sm6015917b3a.34.2026.06.04.05.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:31:27 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 18:00:48 +0530
Subject: [PATCH v2 2/3] arm64: defconfig: Enable ILI7807S DSI panel driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-display-v2-2-b3c1b2b67edc@oss.qualcomm.com>
References: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780576263; l=708;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=SCs9KQKBtzRapnZIGqIOvP+xU2+TnEvlesLmeM6sxt0=;
 b=m9yIbYKaT8kCKl/fs9wocRmDzoj1uNJswWvdoxbvdIWYfP842Sv1SMBB1G9LaTbU0FTO9Vdyl
 QvUjcv/T4EUC2yeF7PvcAc73PU1HzUvdE6d8SwFee05DqQT2ZjtUuHp
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=at2CzyZV c=1 sm=1 tr=0 ts=6a217021 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=aMhaXRkMA95IrCOZcTgA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyMiBTYWx0ZWRfXxPD80gd1kWkf
 DsgiXXFZRSZCJGmL+LQ+eY1Yqfo61RPWtQn5zZfMnygGuij93f3fyQTuQxFvIhYaRpf7gTrft75
 FFVUR3wRjj9yITNF0TaOCfLZmszfYAn9xmYdPp1lF2rLdHtc3nnPM58Z0zUkOk2y8dt8kWy0t1s
 Rs7yvcdnbXC9ST58o1Dfst5XX8Ss5HlsBi30A1asf0AuFaIc2IwmI4QDTOkzWUsh2td/Xfv0oa7
 Nbz2js/6dy9LYm9E8Vmy8Md1kItxWqhIibuKQRKH2rYY/XFeKMub5giF6HKQg5sM8nTu8iCF7Jr
 MLn59+wW69lzdj/GlOJOxMuBnGToAmFiWLw5WSS03jD+jH1KPCuTWUAFvtonVI+t+iMWgQzQ9ou
 6wAemH2qxhIRM1bWeq/qL5DOJbwd5o8fBLZuI6NnhU+kTNeZWDiXN/9LdjXxmJjR3bJK/OU3s4i
 Pf8/SfXgmNzeCIAGYkA==
X-Proofpoint-GUID: 4_bHRiHb7kPbrnEJsRLw85GKUdBa9JCQ
X-Proofpoint-ORIG-GUID: 4_bHRiHb7kPbrnEJsRLw85GKUdBa9JCQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111197-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkrishn@quicinc.com,m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:nabige.aala@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: BA8B463FEFA

Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
used on the Shikra CQM EVK board.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 909f3c188e75..a6d72ff63e57 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1005,6 +1005,7 @@ CONFIG_DRM_MXSFB=m
 CONFIG_DRM_IMX_LCDIF=m
 CONFIG_DRM_NOUVEAU=m
 CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=m
+CONFIG_DRM_PANEL_ILITEK_ILI7807S=m
 CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_HIMAX_HX8279=m
 CONFIG_DRM_PANEL_HIMAX_HX83112A=m

-- 
2.34.1


