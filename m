Return-Path: <linux-arm-msm+bounces-118089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6ovMG7zuT2p1qgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 20:55:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 090E17349DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 20:55:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kttAp11+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ILb7GIx4;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118089-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118089-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B73593131E76
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 18:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F0244999B;
	Thu,  9 Jul 2026 18:43:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811D343745C
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 18:43:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622601; cv=none; b=hj+NkB2qMelXTTQq5JpTKbR6776QBWf2Wr0cYjY7x4kxWLbgKAv8O8SuqKZg06FdhxapUtr1eONvLzsbHil90cknYGLFrZ79ajldPQpHwb+bj2yKj9jWwvL+Jt78fYo1VRb+9ilfr46KmudBlV5hseKTjNTTiYLvObgmJA8A01w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622601; c=relaxed/simple;
	bh=O9niL4UAC1BXVT/0hAy727laAjQWWk0ZIJq8uv4T2Po=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rbOckzV99/03QIfR3JkXIxunLLKlv9zyQcUDGhQCgw0+Rwa3HlKAdqIJukY9u+DdZtcWVTUgdAv88KS8xwy0kxSpGYQrWZtGhUDiL9R99C51BdfEMnFIImoPXyT2/LsTCUjc83vZy4DoYL4os7j6+llTJkX/INifuM6htGeiY8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kttAp11+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ILb7GIx4; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HWxpJ2374237
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 18:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VZQa/mqvt93chY0RVU5zPGmb1at+p5NGdnFyV5RZOgI=; b=kttAp11+1wwuB+SO
	rITOqpWpy1QK9fpn+uMaZKyNalwD7bIGGLtFn5BeOZkpPVi/+zNYM+KkfvzDRdlL
	J3kAbwQhVdMMv4BPn6OIPeS+XTWxyKuz+l34yGxtPHIgNHjbFd7nrjHkeC7Jnkcb
	tDLPYYOdjPN7VbH++3Q33STz9tgjxtB8ptOCoaeNIpVOt/Y8+wpeHCWudekjg5Q9
	GIAfy1rL70lAHnOuviXTOLTLdjlupoibNXJ5f2gtBsntJ5Jnai9X7QKapndaPOk3
	VpVPC/mEFbUhgFNzGW6NNAyTxDPyW4x3YesjtJ8I7BskFT9hDf82Z/qilaa3KWiU
	fg/eEA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg5gwk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 18:43:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cacf17c7e0so1027655ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 11:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783622599; x=1784227399; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZQa/mqvt93chY0RVU5zPGmb1at+p5NGdnFyV5RZOgI=;
        b=ILb7GIx4MPuhxtWqZe/L2ZQHpMiqcw0G5nygj1oiXPu28XvMKQgJASgXQtlBJF2Idt
         5/TXB9Ksf4ZGTEW5m1SDMwEb0+z0nSYpCrks95oA0M0BVXA7iKXoge2w89DNeqCLq7eL
         LtRizAeMOueeVw2CndSE+RtUDh+T5AdViOHq+F9N9BTIR4SeEbtsDCdxMf/BzxwnjWpY
         pH3bva1qtIzBjMRSaCckFUtRrvilGM8LTMYfKhNiBVggN5xOHjeAZahW/6D2pEdNphZ0
         wXeREfD9MN22iS1GsDmdFj27vQ19A/+TrIjeK+TZQwIhfoMLw1FJko4KqJDdEleQXte5
         so0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622599; x=1784227399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VZQa/mqvt93chY0RVU5zPGmb1at+p5NGdnFyV5RZOgI=;
        b=Hdvmo03AmEULm9aYjKPlo0J3VUBBkyoK13JAqvW/pUFKL7Gdoai/Je/qDM58a6G6VQ
         4u29x8SDD9qXek+vFlccT/qWurKxOFIcNd110q/sqCEIPZUegWXlsH7IcQJNM5CNQx6T
         4f9MisrG5u02UN1Mm7KAOKRSdVkVUI+YvpZHVGgeq7WTp43s+4wqnzflrFCVGYJwmMrm
         0RqPcbeKAeCkGJZ2EPO13mtpeGCf5WI9mW7mfP1bz8i7rrIO8ChRnVhMR3Ni6+2I25Ha
         i3W6MHko/xBvffF/o7GyCWq0lK0JrY7J7seovsXPV3xBJaErRviUg14bbuPUNH4B8bi+
         DFag==
X-Forwarded-Encrypted: i=1; AHgh+RpbWnV6ujAOosVwUw2q9uwgLISjf3Lsm0MmVAvVJA1vRc7VlJEWghoOi48z7xAEBqwQRZvxGACvVS8XjlE6@vger.kernel.org
X-Gm-Message-State: AOJu0YxG5SFupwrH0SI+RDkccmGAcJX5fkMguLYTcQ6tVXrvfQSdDmO+
	oD4Ry3dz+4ZDirdctZM5wz9AmFk2pOUkAkrn58gB+iEeb53v7xrj9cDlwaQ3zWs1Kswil33T1qv
	p+12SYtYFfyBWSXxFmIWo1LB8FV4cd39uLQtLeu5DPOIIDlE2xmifNXQUXrv3lhJZuzwk
X-Gm-Gg: AfdE7clZVQjYAdlu/3OBF8FG9F+c7TYwPw381bwDb2UU8W9MxNGHp9LDHJDGEzG0AMx
	0kcVQ+xE/fg2es41u17g8/fPacN6FmUaDuPf1pgCiJ2UD9fH8i2ffC+4Pqs3m85OY4zCQHWPPAX
	37XMFHxDtJVN3TCrvijBthU62rceT2n+Bz0Bi5zCLZMNaE+RvBbD/+TAWfvp5210T4axp7RbOjK
	uikKb6943MjnXSVx35kBVCLhQH47kakBpPQoazNOTMBSpVcGLtvYnKt+79zQ3OEe1ZUisECBQQW
	r+9XBqOqgeNVMGORc0Zpmzisa6ggrz0nATHG82VgvmhUityO063M81Om+ViC7FCIMmUKLvgB3Vu
	Y1I9s99vML+T+ihvCA9b1RYUBokrIRwVCqC0=
X-Received: by 2002:a17:90a:e7cc:b0:381:9ff6:3dd5 with SMTP id 98e67ed59e1d1-389415e9f47mr8816704a91.25.1783622599287;
        Thu, 09 Jul 2026 11:43:19 -0700 (PDT)
X-Received: by 2002:a17:90a:e7cc:b0:381:9ff6:3dd5 with SMTP id 98e67ed59e1d1-389415e9f47mr8816665a91.25.1783622598836;
        Thu, 09 Jul 2026 11:43:18 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm34205652eec.16.2026.07.09.11.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:43:18 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 00:12:05 +0530
Subject: [PATCH v6 6/7] arm64: dts: qcom: shikra: Add GPU cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260710-shikra-gpu-v6-6-b388ec5dce77@oss.qualcomm.com>
References: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
In-Reply-To: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783622535; l=1606;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=hyEGcjwM6KENpeiGPhvJEAD4XFMZNW+63d9GkBZxZpM=;
 b=NnPL1pTXwyODmjoz9V6QImzaxRVMlFXSMFKP0EI3HRuym5woRxSxuwPBcZ6F2RmFq4guFSEBF
 HlxdGGQu0CeB7RqV2YL9E3KoLSDrA8wK8H/NZ1rspf394vAZc1s+TfN
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=FN8rAeos c=1 sm=1 tr=0 ts=6a4febc7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=tZdy-_Mj5ciOPZFqPb4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE4NSBTYWx0ZWRfX3ssQVCmZo/Mr
 yMpDwLvBf0cSrlGgn4l5ced2qn6R5XwtXMvM10DVB1XGimeUwAGryg4o/4BmYDCLnoOFnBtnWal
 GyE/s4TYGDrCsYWQnrr5gdFpghcF/A0=
X-Proofpoint-ORIG-GUID: ag2NM0H_yae9g1hi3vHhj0cUTSZiUtK_
X-Proofpoint-GUID: ag2NM0H_yae9g1hi3vHhj0cUTSZiUtK_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE4NSBTYWx0ZWRfXz1ta+FLfxEfO
 7y3ynHlc16WNpNQ/srSivHXaLAmeuTc/SGjeXciLf8skiszYaZSxcd0MyZ/MbeHILFm+l+WEDHi
 vo7io0fHmS0pQQ3jAGQzJd9Y0Y1N7EMMr8OKsKThACuNwtAFMMMKX7KG7E8EHhqejw5Lsic1OtY
 alOTHayPIq6bQhQenACYvEVfBu32m3ZiirBLBfVUeTodE6w95xzCO0e++3ajniTcgxDT8TXk38a
 78dzjzvEV32qSQInb5aUgodpXhXxGjMg+uTSGs5u9SRMtBm5faViiU9NoCmIEdhRqa6aIyfH7xd
 clQFmBSIUXQwF5YOY4jl2/KAE8eDelnGm1ZnwzMpFjXsQiMo0HpHnmvn5Hw7GmLyOjcH5g2BCnc
 Dg97ShM/VEB8j31ikUArHfXOQ93KjAzsk0TZF2BxGBYkIdUfQUwraIsL+pC5zeybRzA8Xfo4Ud/
 bzP5VqFXNVmwpYFX7qA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090185
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
	TAGGED_FROM(0.00)[bounces-118089-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:aastha.pandey@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 090E17349DB

From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>

Unlike the CPU, the GPU does not throttle its speed automatically when it
reaches high temperatures. Set up GPU cooling by throttling the GPU speed
when reaching 115°C.

Without passive_delay, the governor fires only on trip crossing
interrupts. Temperature stabilizing between two trips generates no
interrupt, so not all cooling levels are applied. Set passive_delay to
enable periodic polling to ensure all cooling levels are applied.

Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 34261221664b..eeeaa369d3a7 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2510,6 +2510,7 @@ cpuss0-critical {
 		};
 
 		gpuss-thermal {
+			polling-delay-passive = <10>;
 			thermal-sensors = <&tsens0 6>;
 
 			trips {
@@ -2519,12 +2520,25 @@ trip-point0 {
 					type = "hot";
 				};
 
-				gpuss-critical {
+				gpuss_alert0: gpuss-alert0 {
 					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				gpuss-critical {
+					temperature = <120000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-thermal {

-- 
2.54.0


