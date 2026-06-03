Return-Path: <linux-arm-msm+bounces-111022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +sa2IxFDIGqszQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 17:06:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B02B638F01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 17:06:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MpJfbVvM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Pwd+6Lue;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111022-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111022-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C6ECC3097A89
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 14:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91732772D;
	Wed,  3 Jun 2026 14:59:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D09C3859F5
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 14:59:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780498790; cv=none; b=Lfd4TN38Jpe99hx4L78iuy4Dm/BfhYDWO7skon8ZBjJIeyIn9MKKKR0KaIWn7bsmHsZSRk/IF3GIpnHWqH5hHe4H5W06EqJMJuPouWtrqQLJFEbpfuXuEOLJZFcVwsGgSBTms/MtQApnUY0hZhfCAHkEhxFYEt5/FmRtLknsbPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780498790; c=relaxed/simple;
	bh=MlVeOjyzwpym+szw56TwOtGwaPWWiF2YunpAZEWQfDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cef9MqRSRdFhujj4VYCn2yI/k63cbkkkRLfsuKj3gzhud4mKGoQTZc4W4xcSwZMmHysGnS6C4Mpvv41ZlKHvxITV5pocx0BQ6YaJK9Oy77R/xyxXizAvXhsQPG1yMtjxWcuSu5g9fRsOK+MruwLVJQ7mP0AzrGOx6GBfFLOeV58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MpJfbVvM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pwd+6Lue; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653CJ9WA1200538
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 14:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FCvEktdSiv4A6mtT0YE77fV8FNu/cYvcs0DIGD1tKXo=; b=MpJfbVvM755po/He
	XTPfzryXQ/64qNgjYaLJh72VMguEPzoGAErIPRLRKcpzjRywcQXw/8RNcL3rD/jc
	vNGtu7kok8OpwFvnqX/kJOUyRQNWQnrTjP54ejaTJ8IPtZD2tMZJgVlNkTmcf8mB
	WWZWU0WvHj4SnloocUhlLjwEbas13xbjvGi0TzsE48O+GwMzhdNTgwZaRSeEPlOQ
	ShgH6NFjD7xaTGoz83jwWxdZM13Wo88ObLFGEmbqB6scRCcwhyBH+AR+a38QJvC3
	1oTYWPA8RTBWpIfAqteBT60TWBeFvA20Q+S2oJw47qqY1PQx2W5gHUoLM3Vx7Ia1
	jF/yQQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejckw2m83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 14:59:48 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8422382178bso3106603b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 07:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780498787; x=1781103587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FCvEktdSiv4A6mtT0YE77fV8FNu/cYvcs0DIGD1tKXo=;
        b=Pwd+6LuenLdQHwWZbyk9jfscR4JC+NZKu4YPHZxXmNiY3AemgCDlo8sayhq93yuBeS
         kSupTaPlDVXdvsd/VlhnjmGuBNWj5R9NYjeLzpEYtsj+ko+nK65KykKkp2ofxv+aFHmA
         gy7GcDLBwF9Op2xkDqlmji4ReJfUM3nsDSNvfHS2pWBAHKSbPrRyyWoclOoReOQ4U0d9
         SELP3Sk8jeb3++/43DoBB/BWS24WGjE7hWtS4T/D/uTtatrsoWmKBraYT66n35TOgWcQ
         0lmTSxXUe6SuzqRNSWhgbfnE+3waOS82YaSUEKNkHyBFLhQNAvTqHkOnOLC5hZFmOuRN
         /4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780498787; x=1781103587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FCvEktdSiv4A6mtT0YE77fV8FNu/cYvcs0DIGD1tKXo=;
        b=bh9CEsrY/172D4/YdDTw4lgni+p1M3RPr/9CZ7r2LfWAWFwh9GEBf/6el2v2s82tnE
         w7eoCkQTne7ze8JkegfgswC3d3EyAzyWmxH1DWpkNq08b9YlzV67vb3RxEMHt2ce04An
         ug9xpqLrBgf0DO7UG4NcXH9YN7gtquhbcgFEhp0FQB8ExXl1oIV9gZOWvHBAzIpOa5lE
         VbluqotPGxGuP6sQqIHCQApCFpuCiwjeZP/MrRICm8KZbLXZyWOyI1ntT+shVJCKLgHP
         egoeSaG8BrN1mDYv9c9KfLkwO5xfCEutQilP95O6j5dkkTtKxKS8mjukc8ghHKHmsH50
         cbKw==
X-Gm-Message-State: AOJu0YwSC9cAt2vpy9OGEg3k7cKGYGx1dL94BZRRefaOwlm0ukLGY3Ag
	WsIoLkfY4n4UKm+o6C9QoB9P6+vGBb2t8SMyl+bqEzKi0Boe90JDALoZN5ZUWXp4H56g5nBiHqo
	5G15M9dCIfdth03RHIAL7zaE5+F15ZI42cs/DKJfg5tUvdNerbEs8rAV3nJiIIeKaYXAG
X-Gm-Gg: Acq92OGJrdGlcISEiM+NXKHvq1t+yQ6g4O1foqbzqLFoIECtDJ097bhf+TAhzzV0bNP
	ASVObZdpG22j88M3ioWyfzIF+VdPrWvPcVMewwsl9Zy9suaY43LrYAJV8tAThlVLsWgXVGKX4ZS
	9b1j38qMpGHTQndjoR2m/M84dzAD/4Xkugfxh1FAHNqO/n2SQyzGkElV/S64qTKRTsuf/MfYpbC
	VP1vXXUILEeQqXcDgXwgFrmCOifeXOajsP3gqcdroA/4coNVRoGxpKvmkRi/83g91AkiDyfpPiK
	Q9MrDgTSvmkSMZVqzduwQxDpRMHIBezgNTGaxf6EU6ss+8R+Bd1xDfJTK4bWrNPBabjzR0xIgdl
	caGP8xtuLXkZnPsMtC5YHdzmwZcHvv8qFDfbo65pyXoFzwHsymt5I5rF0xoU=
X-Received: by 2002:a05:6a00:181b:b0:82f:4cc9:1854 with SMTP id d2e1a72fcca58-84284f4eb8amr3945725b3a.49.1780498787380;
        Wed, 03 Jun 2026 07:59:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:181b:b0:82f:4cc9:1854 with SMTP id d2e1a72fcca58-84284f4eb8amr3945675b3a.49.1780498786882;
        Wed, 03 Jun 2026 07:59:46 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282882170sm3747409b3a.30.2026.06.03.07.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:59:46 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 20:29:26 +0530
Subject: [PATCH 1/5] dt-bindings: display: msm: qcm2290: Add Shikra MDSS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-shikra-display-v1-1-aeac1b94faa7@oss.qualcomm.com>
References: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
In-Reply-To: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780498770; l=4175;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=MlVeOjyzwpym+szw56TwOtGwaPWWiF2YunpAZEWQfDo=;
 b=oxLSInKe2xaUTLeI9g3Z5OUf7JJRMtiRqN/OpXficZ7vBb/NRa3zVy3B7/ShmW5dyy21yM4/H
 tkNVDWGHZMUBTCpEPMfU6fGIUthwjbz1/Zk+f3hiIxAYjthF9wOuCYJ
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: rITnDAhA_Si_vQ-RzxboyHUV1eQ9AihB
X-Authority-Analysis: v=2.4 cv=edUNubEH c=1 sm=1 tr=0 ts=6a204164 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=_tpsKkHDXNPZovU35XoA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE0NCBTYWx0ZWRfX9b/JiuFuGSjf
 Aho4362ZSa7/B8FH2vfyXK+OA8VXdawSitKYqsHC+fbtMV2C9ovnXIOou5JVMileQnewf6WtywS
 XzwyEdC5f4UvKX3c+Va2CNkQWAXRYYIXUEUqX4L4aH8L/L/hceb2DvRoVMPbatbiPVGClVOTXvV
 OMmbbCJQGsOWUN4ldKaiyeIIK63RSE8wB+utrvt1HPTJ3ii5PZFQnuHmoACWF4nlHMwP+ohUJM2
 /1NbypCza8tLSmNzmbuA15SpoKfowaTVxfjZTPtjYZy8leAlmHm4PMPGQEA358H/bdMD99IWAqm
 sT5ME12xnK5AoKntgK9Fs+aRezT98gxGbcEWFPzdbdbufXcIiMXuGqr9VmnEFRw53L0Fqhkcyf1
 pFwv01gJZVdksDEGeFtGyCK748fFCZ6qVewc+9Mniv5+LmrDz0G+5dIvTX/b687JIhEMY8V0/5M
 G2VopVO0jctCcNYch2Q==
X-Proofpoint-GUID: rITnDAhA_Si_vQ-RzxboyHUV1eQ9AihB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030144
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111022-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkrishn@quicinc.com,m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:nabige.aala@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,devicetree.org:url,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 2B02B638F01

Shikra SoC uses the same MDSS/DPU/DSI hardware as QCM2290 (DPU 6.5),
sharing the same register layout, DSI controller and 14nm DSI PHY.
Add qcom,shikra-mdss to the qcm2290-mdss binding compatible enum
rather than introducing a separate binding file.

Register qcom,shikra-dsi-ctrl in dsi-controller-main.yaml alongside
qcom,qcm2290-dsi-ctrl, and update the qcm2290-mdss patternProperties
to accept both SoC-specific DPU and DSI controller compatibles.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 .../bindings/display/msm/dsi-controller-main.yaml  |  1 +
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  4 ++-
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    | 34 +++++++++++++++++-----
 3 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index dbc0613e427e..a2f3e91104af 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -33,6 +33,7 @@ properties:
               - qcom,sdm660-dsi-ctrl
               - qcom,sdm670-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
+              - qcom,shikra-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
               - qcom,sm6125-dsi-ctrl
               - qcom,sm6150-dsi-ctrl
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
index be6cd8adb3b6..cc1f227ade2d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
@@ -13,7 +13,9 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    const: qcom,qcm2290-dpu
+    enum:
+      - qcom,qcm2290-dpu
+      - qcom,shikra-dpu
 
   reg:
     items:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index bb09ecd1a5b4..d2609c24e305 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -4,21 +4,35 @@
 $id: http://devicetree.org/schemas/display/msm/qcom,qcm2290-mdss.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm QCM220 Display MDSS
+title: Qualcomm QCM2290 and Shikra Display MDSS
 
 maintainers:
   - Loic Poulain <loic.poulain@linaro.org>
+  - Nabige Aala <nabige.aala@oss.qualcomm.com>
 
 description:
   Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
   sub-blocks like DPU display controller and DSI. Device tree bindings of MDSS
-  are mentioned for QCM2290 target.
+  are mentioned for QCM2290 and Shikra targets. Shikra uses the same MDSS/DPU/DSI
+  hardware as QCM2290 (DPU 6.5) and shares the same register layout.
 
 $ref: /schemas/display/msm/mdss-common.yaml#
 
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - qcom,qcm2290-mdss
+          - qcom,shikra-mdss
+  required:
+    - compatible
+
 properties:
   compatible:
-    const: qcom,qcm2290-mdss
+    enum:
+      - qcom,qcm2290-mdss
+      - qcom,shikra-mdss
 
   clocks:
     items:
@@ -52,7 +66,9 @@ patternProperties:
 
     properties:
       compatible:
-        const: qcom,qcm2290-dpu
+        enum:
+          - qcom,qcm2290-dpu
+          - qcom,shikra-dpu
 
   "^dsi@[0-9a-f]+$":
     type: object
@@ -60,9 +76,13 @@ patternProperties:
 
     properties:
       compatible:
-        items:
-          - const: qcom,qcm2290-dsi-ctrl
-          - const: qcom,mdss-dsi-ctrl
+        oneOf:
+          - items:
+              - const: qcom,qcm2290-dsi-ctrl
+              - const: qcom,mdss-dsi-ctrl
+          - items:
+              - const: qcom,shikra-dsi-ctrl
+              - const: qcom,mdss-dsi-ctrl
 
   "^phy@[0-9a-f]+$":
     type: object

-- 
2.34.1


