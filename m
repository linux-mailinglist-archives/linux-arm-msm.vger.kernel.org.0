Return-Path: <linux-arm-msm+bounces-111026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pKnCIWFIIGqD0AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 17:29:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BDA639343
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 17:29:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FR7PSlyO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EDHQf92O;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111026-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111026-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DB46F31DF923
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 15:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168012F7EE8;
	Wed,  3 Jun 2026 15:00:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5F63CF67A
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 15:00:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780498824; cv=none; b=L4y5+G+Vhjm2KHWYasiOJOO7ZBVzYrmxZbPc2iMr5rVX+jdNgA9vB5ebmM0mxUGSRQG2UVMYRW5WuLaySr868zI1GWPJWTtqoKLqzIF1EWErvKnR4CJBvy/mPLlglLEfZ6e17OUDZ3uXMaAOuZ/ZTZ3OoJxn1cSf8YG3/0x+D4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780498824; c=relaxed/simple;
	bh=oR2yHxswddj6quJTdd+FGIgKIDMApsb7sGBB9OxVs9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MDDOYK3fQXSD4h5uN1mHgl87xx5E66DZXh1Cng8015bLLV7d2/wH7yMubY8SWfE+hrUhEIcYjpH7EEYBU2OAU0CsuAGtI42eXBvO16bdEciVp9YS6MFj+VHNFz0jun6xpyImrGqcheX9gGQTM/S2l098Iuh+I52Mavt4uvHS7Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FR7PSlyO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EDHQf92O; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653CUCf6873766
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 15:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uBhEfdW/m0+frpWlSOZbFsnd5JIPo2zwXhwrIyotka0=; b=FR7PSlyOJkWGIVkP
	s6K5xuZO8708Qske/MsZj0ohP7hQzcNJPNb20Hx54i3AeK6MWJ1LU6PTti3NXgDJ
	0R2wBcwfzbNy76tZjRzRkiIQMcmzPZDf3I+sDeMlabw9gVD4tPx0j53IFckySyXt
	9LljQR8atd5o24uTbjtFePW3cSKsUxJyDJ/mgF0fEvKo0a480VjSIljfHHeAC1Dn
	tJ0FskdFCcfF3usxaFdRegGWE0S/wZZj5q66dXsfm53CjicBEY6foMUh2NBPhUzx
	5wOpdzPs+EGPt/2x7FxbQO25m3SsQp0uN0vcOGpN9ObPB7K6S2VUQDExk4P2xfD8
	XWGtNA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ej6a9m23x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 15:00:22 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85dc345ac8so622912a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 08:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780498821; x=1781103621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uBhEfdW/m0+frpWlSOZbFsnd5JIPo2zwXhwrIyotka0=;
        b=EDHQf92Oh9Jyiqdq1Fza0tsFBGX7gZu4GuY60rKk4dfNvGL9D6NhGYAUqLvXvv7VBx
         jDXkNfCXnMI7awOk4iW5iuN2Q5P6NREMWByVvGkdwwFFQAu62GV1gPQhVOC8YJ/sejw/
         zXhO09SUgEl3THuyaD9ELzQpB7MAiBXfdpFEF44j8KMO9lGaQGezcAd/UBnpNDJgQyul
         wW5muKvgp3lgTdm8HkIefm5AsrqCTgT+XRtE2s3hMGexm3N6f04oRImnfgVU9TPhi3oT
         Xz1JVeQyONUfggCcrkX6+d12cqUcV1eqiofMwwji5JnDU4G4Xign4hEswDghYsNP207K
         kZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780498821; x=1781103621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uBhEfdW/m0+frpWlSOZbFsnd5JIPo2zwXhwrIyotka0=;
        b=R24VGmc/uqvsCEgQT0cdo6ByWSZnLGOd0dUA9mDlmFGEZsZjOlhiX7C9PFJOyOPIgz
         Kkl8VBbcFuNVQgKSs0YEaZ4aCq3WAFP/GhGO+G+nGogbfR2W5xdiArwkNKlRUQ4gbuzZ
         +u8aUHt7dHjM9moZ6Xr1FXmkjexy21MjAlZJuw9NqYkFrXMaJJ6pY5yZqxVAGSj/KvqB
         qvEejflCLBesdObgPugvsoLqWDuGUb8cbtzpV80JUU46cWgRTLkbK8GkzR/zsvHOwRpf
         gmhsY2UcqlpIPP/cCqytLx9YM42oGSikW/gn7YQsYgfCKEGL/l/zjlBp3/mJpbtauXWi
         LA2g==
X-Gm-Message-State: AOJu0YxwprWgp8e5aKHQ/QwUV8J2Bk93O85VAvsgCZrhK9ZGh/yVE9gL
	BY+WLmv+8MKxr9TeVz+eJsDbFQukagX1nPOVZ195cdFqp5ULL4km0cYPoRLdHCoBC8mIkbZEdRO
	2MckIeYJq13zClWMf+Lhusq4zKwt139tf2qtOffWhgIvv7/KzF5l8c7e3QTV/eHbwO03H
X-Gm-Gg: Acq92OHqoHtXND2w2Wf64Fs4K224b6iEQDPBbFPACtivaFWdjrwKx693heEUyyVWwpL
	1H6tIMvX6Lba+dCIT8PP+CnjcRmwuT8/Xtu20V1pOob3fusZUuQMheEwu9uchadbT/PDNUJQnWu
	p/VQBwBXvvjpsOp1uIGlut5B1RI0XsJPAxfNHatZTDl+UqD2nMdDNSxx4dC8oFY4MebL1Ihb2e5
	Ox3SOlcl14PDn8emHCEX7Favj1Vz7cBbCsuXLfy8LxpnpGgWw+Ul0gzSuuoq3FnLpmyv6Xk08FU
	RVZe8IvMrG0K6/A+v5f5gY4BalFcZ1m6l2GJ6pBBlo5vkLT07kEIf1VLOv7ytWJkEl3lomLbYMo
	JejLRwm6hJAb9ueQk6Vd/psg0cHIU7A8PT3Y059xERV1r8xG4gyy0u6uEuRo=
X-Received: by 2002:a05:6a00:c90:b0:83f:2568:d45f with SMTP id d2e1a72fcca58-84284f5f588mr3805650b3a.23.1780498821412;
        Wed, 03 Jun 2026 08:00:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:c90:b0:83f:2568:d45f with SMTP id d2e1a72fcca58-84284f5f588mr3805562b3a.23.1780498820755;
        Wed, 03 Jun 2026 08:00:20 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282882170sm3747409b3a.30.2026.06.03.08.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:00:20 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 20:29:30 +0530
Subject: [PATCH 5/5] iommu/arm-smmu: Add qcom,shikra-mdss to Qualcomm SMMU
 client tables
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260603-shikra-display-v1-5-aeac1b94faa7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780498770; l=1873;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=oR2yHxswddj6quJTdd+FGIgKIDMApsb7sGBB9OxVs9c=;
 b=slT7W/f52dq5AGO2+1rwtTo0T6c9Jbsdja/oVrv6fulBjy7AdNAx6Ybfd6TtE7V8hPTZoRf2Z
 IBvqNqxSNY+BT8jWJynyp5mtqdDgum45kTsfs7dMaj99ai7z9uACjZl
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: r_XBGXRSUxnBYUyimQnfd--rkKRoPJtI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE0NCBTYWx0ZWRfXzNC4CqA4HdqZ
 td7wl3KxAsTEoFQXYxXIdey7p+cXEbbSCRWOJHtPIFlygrYbbdnrFLrox+hH8evAmmJP5USAE/9
 uxQoQTxOs/yIL96fXkQIQ+zhPqPJGKyKg7hJbOw0ubGI3qzPorwnCiDJKzoBUOmdz1QcKQH3x6a
 T1kxM1JCrjoAcc85QCfHaoDaKZ0baZQxMKhv1H+u6X2js3O22/89/99/aJuYx29Ljnm1GWvX5U6
 5SioQBblRz7QhgTuMnoFFr+Z00EOhkGQmhIOoY9PJwmuop2tA5N1sIwn0YnIGZMXaxJZSPOiDtQ
 CPtBHe7rIzpuvLvlW6sH3YyhUHIU3yIcZGbz8eBQIjjg4WuF55SH1/zAwsxsyWbn6NfF6DOtqTK
 iCV1n2vQvyqhpk1ckAcWYH//oT1CuEOjPh0pd5fWua/454Cgp30IitK+CNBt9VeDepAxxUnpFhG
 2IQ3+IbknAczplf4Qwg==
X-Authority-Analysis: v=2.4 cv=I/9Vgtgg c=1 sm=1 tr=0 ts=6a204186 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=WiTR6ph8kncRzgk6yhEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: r_XBGXRSUxnBYUyimQnfd--rkKRoPJtI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030144
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111026-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkrishn@quicinc.com,m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:nabige.aala@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 87BDA639343

Register the Shikra MDSS display subsystem in both the SMMU ACTLR
client table (for TLB prefetch tuning) and the SMMU client match table.

Shikra MDSS uses qcom,shikra-mdss as its sole compatible string, so
explicit entries are required — there is no fallback to qcom,qcm2290-mdss
to fall back on. The prefetch settings mirror qcm2290-mdss
(PREFETCH_SHALLOW | CPRE | CMTLB) as Shikra shares the same display
hardware block.

No entry is needed in qcom_smmu_impl_of_match: Shikra's apps_smmu
carries qcom,smmu-500 as a fallback and is covered by the catch-all
entry there.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index e2c914fccd6f..3dfee947e2c9 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -45,6 +45,8 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
 			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
 	{ .compatible = "qcom,qcm2290-mdss",
 			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,shikra-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
 	{ .compatible = "qcom,sa8775p-mdss",
 			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
 	{ .compatible = "qcom,sc7280-mdss",
@@ -410,6 +412,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,mdp4" },
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,qcm2290-mdss" },
+	{ .compatible = "qcom,shikra-mdss" },
 	{ .compatible = "qcom,sar2130p-mdss" },
 	{ .compatible = "qcom,sc7180-mdss" },
 	{ .compatible = "qcom,sc7180-mss-pil" },

-- 
2.34.1


