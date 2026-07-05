Return-Path: <linux-arm-msm+bounces-116518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GzLlLf4SSmpv+AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:17:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 225B8709671
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:17:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KvAciPTo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MpBarQ31;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116518-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116518-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 293AF30356E7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 08:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC6536D4F1;
	Sun,  5 Jul 2026 08:15:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E59F36C597
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 08:15:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783239312; cv=none; b=nKlxFwf1Q0PY1FZSm8ZSf2wn7FW+MESvobkpkdS6BepEOx0xkc/53Y/4EjSR0lQ9kGeI/ppqOmCIbNUbioQxTTTZe69deVRuHhKWpGWau+FuTZoTS6gYNGbgXutEVbcxRnKJUoPG9I7gCGFn/Bjhrk4684SqR3T6yTHwyE34mGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783239312; c=relaxed/simple;
	bh=LaExk5CcIsnQobdkf+tB0TGQXJcIbfm+LHR//18ybOQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JDz00R3Zcam4qYvvc0dhtgbFigTfnCOLQ/ZNhTy1idiAKsXDE9eo1DhSdUoyn6KKh3LtC7CFQkOTNRtAkocyz2Po1fMGKiIO69Az0+E2w7/Vv9zwQuhnPU6y9zNNDEXdwISSj2KY+p/NT5YEy9y3o6FTIGv9eeSfnpNexaR7s7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KvAciPTo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MpBarQ31; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664NaprF146751
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 08:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KNyCxijy9WsR1AOyIAocOM9RR1P64I7j0GHUMuAw51k=; b=KvAciPTo2opHuKFN
	hIdWUJNugTqAmpZnAo3usxfYZVs/0s23fjArjmpVvW9KWQAS+qXw6UxcUIinpVVL
	du5M7pS9upROlpHBDsp6SOwIRLMw525dbjpGq76d9GLofEEAT1a5IPL1r0I+duQV
	Qxq+jSCOg3Z2SPd+poj7m2ZD4Sbhcd8OlKWfXpU6p5nkcsHgrOk3S1QQSrUk84LB
	qmfTZJHNBaZlxPCa0y0WkBFW5RrTJTpfc1gMjSyZEscAsF9PwfeEK2I5I6t8rU1A
	ckuuruQOHoKwR1uiuiEnp0dX8rReYP1ctx0kxpm8CS2newYWi2m1RMGpQYgJvRTe
	XOisJg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3aaq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 08:15:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc77a6943eso26491585ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 01:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783239310; x=1783844110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KNyCxijy9WsR1AOyIAocOM9RR1P64I7j0GHUMuAw51k=;
        b=MpBarQ31nY345uAOcm81RYU7PB+Evielq10gDOhbALp853Zhrd2Qd+2XbkY2nf7oiq
         Dqlo/8WtxM4crmkFZKmBcTHjfTTkYxZZRJAHXbeh2ICb6HR9hiNEh/PQqc6vQOLvhzXp
         HLPKDrrjMmp3kQrJFfiP9OlTUPYj7uRrqKL6TfGZ4EVXKoOvyU/GyFESBNtmk+5qUFQZ
         LikhFo1BS4cetDjrcM02bEIBpD6IFUsHwGjKVtRwxiE2pIJwArFGQx64/od8XVD4dVXl
         9CXHNYn4QehufWRSOun82ffU443KuqWsREoHa+foPIMbRHCYEeELXUVBULo/aY4whyp3
         TKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783239310; x=1783844110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KNyCxijy9WsR1AOyIAocOM9RR1P64I7j0GHUMuAw51k=;
        b=OgueR50rfLLcC+1Gy+nKVDYhmAZlAHnyHfSEMFpgEjdRVLqM3g9PUOVexHTx6tNFTN
         PZJDkIgeakLgxF2kdBkpN8XKhJEB/Q8Y2ispW2p7ZpqVUMgBhyVny0n5VzAsRWScmhVS
         rwMOFzWX6Udck+EZc35VJDlITtJP/GuYQLhNTrKhdafmTGfBEdAdfiakRTXiXndRwSGi
         tHvgFofxweEG3dMYC9juTMb9Op3kw884NruzzLZzKy0efp6OvMr5+gct20aSirfQNSJx
         vx7gWlFjVipwnWPbCFcaZsEoo5UKSEfWUvG+q0iCfp9+nHTSdNPSnZDIX+FtR90et2BF
         YUJg==
X-Forwarded-Encrypted: i=1; AHgh+Rrr5M62SBqRG9pD+UggVjmoWsk0ExmuHaaXS2JMiTWqwJAWKRXS1uavR8WBVDOvk3RiC4058gi5Tk0duA1V@vger.kernel.org
X-Gm-Message-State: AOJu0YwysNmqp0rExGS7LnlLouQdgeoEtuxojASzRJlWdrU3c2KdDPYM
	6lQL0+hfMfxZ7HdBStZtGIAc5fKxJuOAoEMSs+09BaZnCu1SvxK79jM+KrQ6R5otMx8DZoHxzQf
	gsAHkTMCfSWryDD8sirsN2dPBUZw2e06EZaKQpxwDiSB8wHO2NLUZEErnuxDDCKZ7OZGB
X-Gm-Gg: AfdE7ck56FFoCqmS4V6gd10OjwwzXiNHmp/PxeUj8FC5aBMOZ8EBu4Qv47fOHY4c7B+
	MBbGF8GYBmMQfhRKqHAMMAKl3MUCXw/0SWQ03Ah9KUSVWySJAOxUgk4Vmg8Y/GSWAeI+Nn5v7h1
	dHMCer/OamyY064kRujVwloQ53Fm9efDUwrLgkkB89mx32mz6r+ZinUJAAxbYQ05pWZonlNl8Qo
	mA+DQ20FgjiOXnOsaCGvCv6+CqZ79aoagNU/S0O6miM5zutAVvgkOfg0XTHIec+sz+yO3T6IWaR
	T+7sB92KjNkMs8tExk0IPTqDLEaCrqSSskXKV2I/Io7jJcw4goDz26vVNWHk18nfydYEaGu60Ax
	r8IusWzoe9RAMZ6Sz8p2CmPleJhcDAYFVRd8=
X-Received: by 2002:a17:903:94d:b0:2ca:ca48:c380 with SMTP id d9443c01a7336-2cbb9f17242mr60483985ad.47.1783239309774;
        Sun, 05 Jul 2026 01:15:09 -0700 (PDT)
X-Received: by 2002:a17:903:94d:b0:2ca:ca48:c380 with SMTP id d9443c01a7336-2cbb9f17242mr60483705ad.47.1783239309320;
        Sun, 05 Jul 2026 01:15:09 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85d4fesm36403980c88.11.2026.07.05.01.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:15:08 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:44:19 +0530
Subject: [PATCH 4/8] dt-bindings: arm-smmu: Document GPU SMMU for Eliza SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-eliza-gpu-v1-4-c9f1354dbd29@oss.qualcomm.com>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783239265; l=1118;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=LaExk5CcIsnQobdkf+tB0TGQXJcIbfm+LHR//18ybOQ=;
 b=VCe5OcUC+YrAxAUSyCuNQqTb0M7+on6Cxws1+B96zvqSXIOvBEXu8K5mbkAmqcoJ/obMc4EbB
 40gj+Ln37yCAo6AFTXP4OAT10Srm2ogRfoYXQqUulwYf1GqRudc9cNY
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfX6p/rr5jHDLSW
 ZHwotnjY0EuU/EZUeJbrtOQNoDg1VRzaZQWrbxWgayW+GU49gWqaUUkgpU0nzX3ZfHpaP/9m0dW
 Amm0JQYeJRLPZhDkisocE+Po92QwSo4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfX5ic1J+Haehiq
 zVT6lcmzC3qlhL1eB5DUdHFzZcbixnbOwd9w5Whecc5WsaD4lVi+BFZo7hxdXh1v5C+AZ1eccwb
 uvT66OwMMyHfR/1Cj571eFdRx5RZp8n0Q65+7/iJxJOK6KcdYi4X6qgcMhKzXySiPsf0J7Us/oS
 jGlZ/yiGvPZ09yy4FPnVthbmzhDhuKD75perCp5gwixTquEKr1pCvrXgPik/BzwmI5ixyRb6C75
 bQt9tOutwUBhkgm1x/vf9pu8dMxLbr3XJGcv6GhVL2tlU5TAEvs/Svi9W34E6hH8gpfJnUIiBql
 gikw2BcpUEBZeCwrdfd5Rlte0+2mRlbX6uGwT9IDKdm5jYrnz3ZqlL6S2NDVI0TyvMjxUZoRXlf
 PhcA8eB7fjZSxUOQ9cXBQdxEEnzdr6nAit7cbAFFU6upCrVFQgHU2w+XLAgXM/rwcZIVqNMJ8uC
 7BkZLP9aN6/9yZaQ/UQ==
X-Proofpoint-GUID: gO_ziW6bSrQgTYhFDD5jkKiLpidZ3SpO
X-Proofpoint-ORIG-GUID: gO_ziW6bSrQgTYhFDD5jkKiLpidZ3SpO
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4a128e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=iEDX-NX4Me02MYkbRrQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050082
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116518-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:puranam.tejaswi@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 225B8709671

Add specific compatible strings to document the GPU SMMU present
in the Shikra SoC.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index a701dec2fa0a..ed556683817c 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -95,6 +95,7 @@ properties:
       - description: Qcom Adreno GPUs implementing "qcom,smmu-500" and "arm,mmu-500"
         items:
           - enum:
+              - qcom,eliza-smmu-500
               - qcom,glymur-smmu-500
               - qcom,hawi-smmu-500
               - qcom,kaanapali-smmu-500
@@ -570,6 +571,7 @@ allOf:
         compatible:
           items:
             - enum:
+                - qcom,eliza-smmu-500
                 - qcom,glymur-smmu-500
                 - qcom,hawi-smmu-500
                 - qcom,kaanapali-smmu-500

-- 
2.54.0


