Return-Path: <linux-arm-msm+bounces-118087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GkXvJ4rwT2rsqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 21:03:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFB7734B41
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 21:03:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Nn93OOl8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TWlzLJFg;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118087-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118087-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2B30F3063324
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 18:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E134499B9;
	Thu,  9 Jul 2026 18:43:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B894499B0
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 18:43:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622584; cv=none; b=SZWLG4ewvnIa4aHNKqzwD7ry75VhV5jrerGlFi9o9wtMCDeoJXPKURfHSbAErB4S6UM/q1FD23T/pWUHsH9yQ9LgaO31aaGAX7gjUsVVi/AJXYPnmNLsBsKDu1m+3uFKgy0YxRA3lttrjx/ZLS5e3+xyDOZqXSmDKB2+peeyX4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622584; c=relaxed/simple;
	bh=yGsij9VKWI7rB/vT0J8nK7LauF77nPjz0MJTy7VKUkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K69Szt3RKbnNrBLDso74btJ0qSQg/v+fYv6Z7cV8YpcNE9ovuC7i/hdYSHjw0S3Eb/h0uWqgBGVHgQS4hOmDIDCK4pgqQpdCgPrQIEV/0939G+o/0hiNaORK5PMbHBzSrptulJrKLCUU3HHbxJ9PnzcMqA4XCxisHRAu6s71d5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nn93OOl8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TWlzLJFg; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HWq6x2373957
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 18:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2d5kwEQJ4zj6pWZ0cwELlzSxpmKyMsiG0qTFS7qufTg=; b=Nn93OOl8OZNvmHgX
	gvJJp5QWD8pxMtDdHmWnsdrAZYMSIBorgL7VdW313o8cyeJEFCUe+Ns5n6Pj2G1Y
	dfOfGefQdFUOLAmNfMULNJ53GMT6g8U6vVNKvnHfl+CC9+0/XY/dCIgLEz2MS0cA
	OR3ZdUxt/zV2qH3Z1FCZtTtq5dlLlWdpFcWNReTWRvGmA73ZeH4LjvjRPD5Xon8G
	vxFnXP6Fn09KMDSrgj60yrNRaPl7kLL+K4VdnTU+hW7LpwfEMqRKj5xnPZ9qC9d5
	jawDxZjcAW6rl7rDnpyK1O3+hsvoslrNdcV+kd/mtbYCgm9gY4oO4oD+iLH6TbPi
	weFEEA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg5gwj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 18:43:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37e5ef8299fso189039a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 11:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783622581; x=1784227381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2d5kwEQJ4zj6pWZ0cwELlzSxpmKyMsiG0qTFS7qufTg=;
        b=TWlzLJFg80+ai6qOT30OA3iCwhcptd2kLAb5sPiOCi3sgwknfq16CtGJ4BMY6vOaw9
         gjiU4tWa3wYdyXcfD6DgdhmEg97smXPAuFygcf1p8NxDf3eAQHPpFO90sLQFQkOphHZF
         XrRm9dBBFvKxuT3BoOAvB7+HO+nQpFhHXg+phehJaahf8+7NiFJ5/TZSTrGqBjaGUbXR
         HycEkiGdMpogX+mnzma/8Jxz3R1Q8ETYaKZoj/wMat84HYUOV/5e6fzxFWVdffQSH+bi
         53TprV3uBO4ScHy9h09io9ErOa7CjnMRQuAvGidGyZ/SWCqY9XPwTCLYHvSh79q6pT+8
         vDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622581; x=1784227381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2d5kwEQJ4zj6pWZ0cwELlzSxpmKyMsiG0qTFS7qufTg=;
        b=Q/nel4+76iQewRBs5CyMI6uoawon9ibPlOhv16JuRZ72tUcboxgxSE/houThg3Uco2
         cF/n21yqy+YCSEmAmxvJRwWJjG31s1UKllL0Rl+trrh4fM6jJdt3B1jspE1YfCT9VwbO
         56QqpRaa0GpPiuAScNr6gB/o1txyG8Pp5MH7XDbB0/cdW2W5JZ4SLJRVM6obHNlsTnW/
         K3oaQ6id+fce2o8zeEN8pAzJ3QZyetV1tpia6tlLbGX0ITr810xqyDgydYo1QmAYp5nY
         VdbX7rWZxEuCwqSb4Pu0qFy4a9CoRCZXL4PjkgUkkJpIplumadyVo6zZO6K0o1yzZTT+
         96bQ==
X-Forwarded-Encrypted: i=1; AHgh+RpiESy7mC2h+Yd0BZjDKEUJvEmoRaq4Ar2OBcTtEn20b9PQakswYeiHNngZDF/IsS0X4ImV9gzaLaeVaIFl@vger.kernel.org
X-Gm-Message-State: AOJu0YyAIUynBb700j8aIGxPIOyxAgo3RnMYRds6AQo54dMmJi5uToEy
	nim2PTOM+9XPlGSpvEj51i70QEgLH1h6zWlO51nApt0+GnHpd7YZH7RAKu6MDoReHBGFL7zdK9T
	JEBnmnn4P+kgoX8wKaKYrin5MwQYIdY5mosKbKC74PoPZSiCB9eqzz5yWGQN4x5kCjGfC
X-Gm-Gg: AfdE7clTsdNTkuds/mTSw1X8i9Owe69nsvM0eqKZwjQq7QtHM+pBzWDk3VM4c8vPBP+
	vguQD+ezUWwY2Jo1C83zvk8KNw0wCOiLstWUKEiRJFdnKW1rEXaoo9zokZaooLXv9ugOKYyI9pD
	bPuR+ZKs9iKg5iOpS+e76+FX84WNe7AvcLZl0tHkaj2q3ehvA92UIqVWMqG/ry6pZwPyi+FvEks
	eomQA8EYgxscMaDVK8mZIRSN+INawdHd5Zqa2Nart3qOBI+BTzf1P99XY5QNn8sajrYRvPSEznx
	FNZnQzK3W6+oRPORO/GL3eBmH3+hgqxgMzWxmFVPGP0XRdG5HGq5HwRZGRbxT99hxvROk88MaaU
	VKPUcAgnYlWx2v/Q3SUPlYwcenoNztpWjQK4=
X-Received: by 2002:a17:90b:3b8d:b0:37f:eeeb:646b with SMTP id 98e67ed59e1d1-3893f97ccf5mr7914189a91.3.1783622581512;
        Thu, 09 Jul 2026 11:43:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3b8d:b0:37f:eeeb:646b with SMTP id 98e67ed59e1d1-3893f97ccf5mr7914153a91.3.1783622580962;
        Thu, 09 Jul 2026 11:43:00 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm34205652eec.16.2026.07.09.11.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:43:00 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 00:12:03 +0530
Subject: [PATCH v6 4/7] arm64: dts: qcom: shikra: Add Adreno SMMU node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-shikra-gpu-v6-4-b388ec5dce77@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783622535; l=1898;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=EYNcq3OFs2Ql/wREKtEM5ji0GMxwTnKnJ9RpGAjMe6E=;
 b=2hVttTTQRx5zMnrLWm1rAziEUo0KqAbW50W+2RE7kkRSP52+sN8ta7ltAR+qhxhPFdVtIsNQT
 21HAwNZOnqjA1MKkTJmHPKDYJ149gLd1W3/OoOL0yOSPJS/9mcqOXYo
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=FN8rAeos c=1 sm=1 tr=0 ts=6a4febb6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=zTWU315qYGxAnKAOPQ0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE4NSBTYWx0ZWRfXzog+DQfxKm3S
 R7ca1gCCkqP3kksCVlWLCu9eH9wmuMx29iP496AscEEPrSUiQmrwfP1tkEcCLv5AwitfRofdd7U
 EZJJqzcXeyj7BjbTIH+A333nHvuf1Q4=
X-Proofpoint-ORIG-GUID: HvHPltHZOLHjPvJnF4gUxqgssZWqU4ic
X-Proofpoint-GUID: HvHPltHZOLHjPvJnF4gUxqgssZWqU4ic
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE4NSBTYWx0ZWRfXybt5dainPWaW
 j9jyTyXVUevvTROFhM2vozeNbDl3MtXXV0ZrQvnpNEO7HDkWhUBIZ/z6xjLpbHfr6WT3QV+a8FA
 rhHAPETUcpXM99/09nAk4WM9j0dhe3wO1+8tK33oVVbVY37pIaNygkOQnWNulAjQ6vTqn0rikKG
 q9OmDl6wng/T0TQzJ3curfxP4Vemhpwl2nFeVPvBBJ9kNRBDQc7nkGr517DvtEKr/NVPU4hJOwZ
 IBEHS7tepdp45TwsG+GFzfSGMGY+7bZhPyxsQGA0upBu59goi6UbfRCQGQEM3P87l4ozHRurt7D
 NXP39G6eiPOVpDkoHilot8B55rrbsDSdoctRlxdftfQETX9N22GfkYmD+d96/Cyy42c9UMNwna/
 uZrLRCs1mJj86GHsT4NnZbmSZR4FJkobhHa8f/y1MfxF71lUpFpZfINK3iDopproHA2lENpUY+6
 2/xvTDVjFyKnW7IpVKw==
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118087-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 9AFB7734B41

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add the Adreno GPU IOMMU (adreno_smmu) node for the Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index be443b362576..bb11e832d9a6 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2005,6 +2005,35 @@ gpucc: clock-controller@5990000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@59a0000 {
+			compatible = "qcom,shikra-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x059a0000 0x0 0x10000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>;
+			clock-names = "hlos",
+				      "bus",
+				      "iface",
+				      "ahb";
+
+			power-domains = <&gpucc GPU_CX_GDSC>;
+		};
+
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
 			reg = <0x0 0x05f00000 0x0 0x20000>;

-- 
2.54.0


