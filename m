Return-Path: <linux-arm-msm+bounces-110996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0KVVLB46IGp7ywAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:28:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E124638931
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:28:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YtSpB8ba;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KfATbp7C;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110996-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110996-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25E4D3113380
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 14:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B287F3955F3;
	Wed,  3 Jun 2026 14:20:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1067480346
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 14:20:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496452; cv=none; b=IyLcud2NNMrOz0WnZEwsj7qIlYQSbUmUexqdnI8KbX6qmxCPRcvDOb6sEbtU8rfdYpzfzUAQ4MECcq6Ny3QiPNOFO/OnRzIRq46dqznp8QqLQnTu+B7+Jh+OyPWu4p+n1zs8DapbaJaYF3cNigXTP+5YIewHWFXIWi/Wj8ZQ2Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496452; c=relaxed/simple;
	bh=onJeJiw9EMeTDpFkD/CSfgq5ekY6oL32ti+K4AKPSPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j/cryGuyU6XY4/yh/DlorJ6KHv0vUFkqmpDKS9c8vlqRbTv41WEwvlCS8BjMZdNYrDpU7tr+5cv13j1HtlOeCt6Xdrmd3n6tmr7b3JhpsUITktTmsTdVjwovLBdUOeoZOE3lXYUQ/b5MxJhSvyR1sqTpciiO/imY8zq8FbkNpVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YtSpB8ba; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KfATbp7C; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653C6xmd3077955
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 14:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kqDWRt1uVdCbnOpqf0M1wXSvFfZm943941fN6LZQjNI=; b=YtSpB8bajl0hhI87
	bRdNBnmUDZtwuAOtJY0BXhqaSHuy8hYLSO720yYTj9GGsF9KUlxJ/ywRhOiO9koY
	m/f5ie1uzLl1CpWaIHFnFJEvhO3k/S3yDDcFg7XhyyMCIaEObkErSEscejJ+SbE4
	iaMgg+5JBE2fcyN/qhcNoPZgX3GgjzTRlb/ivezZtZ87pvMjHhMW4n05HQc1uQjE
	hO24OILLxyKyRPghOVtV1YaZ8OaOPCFNTr8PnziNtHlAX3iUUl5gktkeIuHgw1Wm
	sHfztvj3YXxtSv5/pnKhAjF/L/LjS/dxQDrnIsNKiSzhFugTZLLVCDSTJ0taET3l
	LSQD8w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejabbtvg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 14:20:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf32fb7cb2so36108375ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 07:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780496450; x=1781101250; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kqDWRt1uVdCbnOpqf0M1wXSvFfZm943941fN6LZQjNI=;
        b=KfATbp7CncFN/LiDm/FHX+pYE3ZXdumU3HuJJtLHpuzsye+FfhX6h9yNC1m0ahWzCT
         t562/DUQSF/0rz8GWewgq3tDU7mKmj2pYpNSsBm+iSMC8YVJdej26vUzeNgW8Bg1lsiQ
         k2xEht4wA5k++mQsVRPXIlm3ntzqRXmwz/iMYbxvDGQUxsQQpLTl+31auGQWgSPBucxT
         qzdDxwh9WAyplJvSiWKH/sE2fJ47DyrUu/JTeII0u85/PYH7TxpJ6b8sgglZ2yyUTWqy
         fyeXUt0SCasoU63IF614mIvG1TXAraNHNm5u09RBPugZNd4gvG/L4f17bOfYHTTsJD1A
         /3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496450; x=1781101250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kqDWRt1uVdCbnOpqf0M1wXSvFfZm943941fN6LZQjNI=;
        b=RA2GBuSrUN4DqVXwwpjP1G99G+nbBS2fi/RbGjDRb9E+x6AnduqWs+rQwPGtnTcIeY
         XPshNvoBnQEZzGDze3AK4SuOqhbGRuk6+Y1psTOntUEaQho00WoeqFTB69seBbS6BBei
         kCVPCfPp79x8hHMllJ7Bzb2dbe1HU3ghqH2iPVlY8UpaFs/ELuaF2557r9j8kENg1M+k
         WVXsQBm7T5DhoZDMqJboZg8Cb7LPX+hzHfj2wNB9mbXvoIPPw27CFZe7SkQk4y44/RjI
         1gzKCMXf57WGYSMMTGcxmguo1JVm7u2hy44M1+1wMI6hxIiIqRrkpVVyCK16D+qNoPDv
         DGbA==
X-Forwarded-Encrypted: i=1; AFNElJ8Vo99Ki70S5Ganmo4eI51zHHjWj5DnPaJIwPwuRsLbUk2IJnhhaFsHSCbuAUsrRfkqQqz9vjWJW4YEfgH+@vger.kernel.org
X-Gm-Message-State: AOJu0YwvPbZUZ///n3nPBRH7ZmnM2lDkqgEN+5wCw6aHa86iDW8ORv1A
	I4pl2xhBqaHQz1zSzTsgu6WCVSrFR4tZeK5dLsvbL2Z5yHSTKysbkKwB7acIQ/ZxHao1jU6+3nm
	FkuKzyuNu99mVcwZFzNGw73ZKWmI0D5SUOpQ2eI1mDHJd228OPt28qkiu3XMq7W3rU4ed
X-Gm-Gg: Acq92OEF/1HDSNi67cz6dOw3jHn9QU1xQ9PKUcKAK4zFlkC5QoBfryJ8RQskdfKANEM
	DpR8F+vmqG8omMOaQVoSXn11KGdMtFw3/FSNoVelDkPpJWhku51njp0B+Ghs7DtNYvf1uQ0+bf0
	6tIvAZ37rMiwmUn1pxv2OtBnqne3qVOd5eyJrhy7Sid+RF24zKM1SbCOYIIKigVmO1nvxXO0q6R
	UeSSGoGSZVYfIYQ6RK7E+Y5ymR1UL4Ll6EeHEcu9vIWCuQBc4TB8dq9aQoJhaRKIHonZWJLAq8w
	j8HBZLCQalnya69cWFVnsEDzkXjRa8LhlKLtOsY3KuRhiOKWOxlSz0gdwIy9vTiveyDQ+8M9iqN
	7Dey1fwhHUn2WeReJLoHJqnwkFI+wAsJDPgu1uVmN4cRwqXYAsuSRitI7ndv6L5UhDA==
X-Received: by 2002:a17:902:d4c7:b0:2bd:606d:b339 with SMTP id d9443c01a7336-2c1644a9b5fmr36384185ad.21.1780496449312;
        Wed, 03 Jun 2026 07:20:49 -0700 (PDT)
X-Received: by 2002:a17:902:d4c7:b0:2bd:606d:b339 with SMTP id d9443c01a7336-2c1644a9b5fmr36383635ad.21.1780496448538;
        Wed, 03 Jun 2026 07:20:48 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm41514955ad.9.2026.06.03.07.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:20:48 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 19:48:43 +0530
Subject: [PATCH v7 05/12] media: iris: Enable Secure PAS support with IOMMU
 managed by Linux
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-glymur-v7-5-afaa55d11fe0@oss.qualcomm.com>
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
In-Reply-To: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780496410; l=7327;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=37/hiTXVX9eQYBQu3HR7YyKJBAxiMFbmP14R68LJz1k=;
 b=nwqxUJRgDkdXvei9R24670xtfdO69q5JjuNJD6NKNJ0AU9FU3NtUDWQPEIZ5c4EcWNQagD67c
 262Zd5eNV6PCtIvLZYzfR1iYDWeVsWwtsNogkXxplhsuVk4bF1u8W7+
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzNyBTYWx0ZWRfX+TYs0qSWVmmT
 RTgmRg+R9hbe9Lz4RlNgtPJg7fnb2RE4qp0QTeIe8NyxaHdFD8gwjXrKTrrcLjTaE09vDO4Stt3
 Tgkltep93sszoPIoPd83Q02zxDJNWcAFNl98tmzbqsWN5LY/hjyg1rZN3S3XIJgxHCQxV0xZuwZ
 POTxbRuDGuv9fc8ctIKoO4OnEKTF8fWTans8A4aPb9jI6nFRnGnusRvXHwz51nhyjOVgPhGm0tu
 QVgntgOaQN9LCC1WRTIIEdaW4hZLQkgzWGP8masppnJtrzt10crIo9R2JOEH9CJAomh0osYfUl5
 avVQd2sIkABonAmN6HBLnik0pIcXCZpdkl/GV70AbvxQUDDAQeszCPZ/u36ZRKig8oyvgkjdNKE
 kDqysw9VKt8gaQQGZyK4RTRpjkaWbqD3TL4rSMLIpLsNf4QM9Q0ob6jJXtmeLqXZm5yY0gsZO8C
 oSOPgGwrzNwagmAh4Pg==
X-Authority-Analysis: v=2.4 cv=UqZT8ewB c=1 sm=1 tr=0 ts=6a203842 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=U8OLdchxA3Z7P0hrdlYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: q6OUd1DMZpWIrSQAGeH02cW3H6oL0nf5
X-Proofpoint-GUID: q6OUd1DMZpWIrSQAGeH02cW3H6oL0nf5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030137
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
	TAGGED_FROM(0.00)[bounces-110996-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 2E124638931

From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

On platforms where a hypervisor is present, all Secure Monitor Calls
(SMC) are intercepted. For qcom_scm_pas_auth_and_reset(), the hypervisor
registers a Shared Memory (SHM) bridge over the Peripheral Image Loader
(PIL) memory region so that TrustZone (TZ) can access it, forwards the
authentication SMC to TZ, and upon return maps the PIL region and
triggers the co-processor bring-up sequence:

HLOS -> Hypervisor(SHM setup) -> TZ(auth) -> Hypervisor(map+reset) -> IRIS

On platforms without a hypervisor, Linux drives these steps directly.
The SHM bridge infrastructure required for this is already upstream [1].

To isolate firmware memory in its own Input-Output Memory Management
Unit (IOMMU) context, a dedicated stream ID (SID) is required, tied to
the firmware function ID. This SID is specified via the iommu-map
property in the device tree using the firmware function ID as the lookup
key. A firmware device is created and mapped to this SID.

The presence of a SID mapped to the firmware device via iommu-map is
used to detect whether a hypervisor is absent: when the firmware device
has a SID mapped, Linux manages the IOMMU directly; when no SID is
mapped, a hypervisor is assumed to be present and these steps are
skipped.

Extend the Iris driver to support Secure Peripheral Authentication
Service (PAS) on platforms where Linux manages the IOMMU, by creating
the firmware context device and performing the necessary IOMMU mapping
when the firmware device SID is present.

[1] https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380
@oss.qualcomm.com/

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h     |  4 ++
 drivers/media/platform/qcom/iris/iris_firmware.c | 73 ++++++++++++++++++++----
 2 files changed, 67 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 24da60448cf2..2edba569fa25 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -36,6 +36,8 @@ struct qcom_ubwc_cfg_data;
  * struct iris_core - holds core parameters valid for all instances
  *
  * @dev: reference to device structure
+ * @fw_dev: reference to the context bank device used for firmware load
+ * @pas_ctx: SCM PAS context for authenticated firmware load and shutdown
  * @reg_base: IO memory base address
  * @irq: iris irq
  * @v4l2_dev: a holder for v4l2 device structure
@@ -81,6 +83,8 @@ struct qcom_ubwc_cfg_data;
 
 struct iris_core {
 	struct device				*dev;
+	struct device				*fw_dev;
+	struct qcom_scm_pas_context		*pas_ctx;
 	void __iomem				*reg_base;
 	int					irq;
 	struct v4l2_device			v4l2_dev;
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 1a476146d758..8bdc9273036c 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -5,6 +5,7 @@
 
 #include <linux/firmware.h>
 #include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/iommu.h>
 #include <linux/of_address.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/soc/qcom/mdt_loader.h>
@@ -15,11 +16,14 @@
 #define IRIS_PAS_ID				9
 
 #define MAX_FIRMWARE_NAME_SIZE	128
+#define IRIS_FW_START_ADDR	0
 
 static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 {
+	struct device *fw_dev = core->fw_dev ? core->fw_dev : core->dev;
 	const struct firmware *firmware = NULL;
-	struct device *dev = core->dev;
+	struct qcom_scm_pas_context *pas_ctx;
+	struct iommu_domain *domain;
 	struct resource res;
 	phys_addr_t mem_phys;
 	size_t res_size;
@@ -30,14 +34,18 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
 		return -EINVAL;
 
-	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
+	ret = of_reserved_mem_region_to_resource(core->dev->of_node, 0, &res);
 	if (ret)
 		return ret;
 
 	mem_phys = res.start;
 	res_size = resource_size(&res);
 
-	ret = request_firmware(&firmware, fw_name, dev);
+	pas_ctx = devm_qcom_scm_pas_context_alloc(fw_dev, IRIS_PAS_ID, mem_phys, res_size);
+	if (IS_ERR(pas_ctx))
+		return PTR_ERR(pas_ctx);
+
+	ret = request_firmware(&firmware, fw_name, fw_dev);
 	if (ret)
 		return ret;
 
@@ -53,9 +61,27 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 		goto err_release_fw;
 	}
 
-	ret = qcom_mdt_load(dev, firmware, fw_name,
-			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
+	pas_ctx->use_tzmem = !!core->fw_dev;
+	ret = qcom_mdt_pas_load(pas_ctx, firmware, fw_name, mem_virt, NULL);
+	if (ret)
+		goto err_mem_unmap;
+
+	if (pas_ctx->use_tzmem) {
+		domain = iommu_get_domain_for_dev(fw_dev);
+		if (!domain) {
+			ret = -ENODEV;
+			goto err_mem_unmap;
+		}
+
+		ret = iommu_map(domain, IRIS_FW_START_ADDR, mem_phys, res_size,
+				IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV, GFP_KERNEL);
+		if (ret)
+			goto err_mem_unmap;
+	}
+
+	core->pas_ctx = pas_ctx;
 
+err_mem_unmap:
 	memunmap(mem_virt);
 err_release_fw:
 	release_firmware(firmware);
@@ -63,6 +89,18 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	return ret;
 }
 
+static void iris_fw_iommu_unmap(struct iris_core *core)
+{
+	struct iommu_domain *domain;
+
+	if (!core->pas_ctx->use_tzmem)
+		return;
+
+	domain = iommu_get_domain_for_dev(core->fw_dev);
+	if (domain)
+		iommu_unmap(domain, IRIS_FW_START_ADDR, core->pas_ctx->mem_size);
+}
+
 int iris_fw_load(struct iris_core *core)
 {
 	const struct tz_cp_config *cp_config;
@@ -77,13 +115,13 @@ int iris_fw_load(struct iris_core *core)
 	ret = iris_load_fw_to_memory(core, fwpath);
 	if (ret) {
 		dev_err(core->dev, "firmware download failed\n");
-		return -ENOMEM;
+		return ret;
 	}
 
-	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
+	ret = qcom_scm_pas_prepare_and_auth_reset(core->pas_ctx);
 	if (ret)  {
 		dev_err(core->dev, "auth and reset failed: %d\n", ret);
-		return ret;
+		goto err_unmap;
 	}
 
 	for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; i++) {
@@ -95,16 +133,31 @@ int iris_fw_load(struct iris_core *core)
 		if (ret) {
 			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
 			qcom_scm_pas_shutdown(IRIS_PAS_ID);
-			return ret;
+			goto err_pas_shutdown;
 		}
 	}
 
+	return 0;
+
+err_pas_shutdown:
+	qcom_scm_pas_shutdown(core->pas_ctx->pas_id);
+err_unmap:
+	iris_fw_iommu_unmap(core);
+
 	return ret;
 }
 
 int iris_fw_unload(struct iris_core *core)
 {
-	return qcom_scm_pas_shutdown(IRIS_PAS_ID);
+	int ret;
+
+	ret = qcom_scm_pas_shutdown(core->pas_ctx->pas_id);
+	if (ret)
+		return ret;
+
+	iris_fw_iommu_unmap(core);
+
+	return ret;
 }
 
 int iris_set_hw_state(struct iris_core *core, bool resume)

-- 
2.34.1


