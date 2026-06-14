Return-Path: <linux-arm-msm+bounces-113056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TuMmIUYeL2oE8AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 23:33:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1C86824FF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 23:33:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FsLNiNId;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZJARjjUm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113056-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113056-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 56C4B300FB4A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 21:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2217C2D7DE7;
	Sun, 14 Jun 2026 21:33:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C505730148A
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 21:33:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781472817; cv=none; b=h2YcoTjA76qSuKL88lMGaCec/ZRD5f3madB26wClux2sDmWmFNUY7sIu/Z6/7BETc73AVsIYSPl417wctiKqzwLb9RzhLoVmXyAdVHUKC+s1mb3MFw7VZt5VKXvLKWQO0gPY73URvCB15p3bOu1bSb+RddGseRVOPE+FH21SXh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781472817; c=relaxed/simple;
	bh=8qIA4dcSBlcfJHA8gtA3WsEzp54v0mcEyfaTc7WO5lQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R4toz9IKWMxOINkzSrFijDdlXaU5ZmmYnkrQHEh4ytk/dG6OZzWMx5VOVVfMVxqwuxclD+Lf/WWSzbgs0kuybfLSD9G9r3UT0eyTrC/3yu3fjVdUQV327UpxPV9BjEzpJ6gP9+fc/Yj2iHxapTz1UWiX54CKcP0GpwMpIV5ws3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FsLNiNId; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZJARjjUm; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ELF8tn2695662
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 21:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qtZnYSknyC6VJ7wYBpo4K4Mxwk7AfbIC2xEn+pH4i4U=; b=FsLNiNIdFmZndie2
	tRt5ydKZzUxW/6mifNC4GmEyHdSfZP2CobxkJ+rfx12JrWu8TqPsWEqV6hLQfCzC
	5D84ckxeYSFcD6dJkM/mqv2AzG/hq+FgDJE9/SKyye0hceGdue4YM16lhngWdiXV
	J1rLaeNsLicGxKuzqPvFwYBzODqXhCSFA3hAmAZ90Och1F2ojiBtY8RYhF/Lnp5s
	HhAMSz4BM51OEeD552zbcTie5lu2I72Ki+P2Q8jN+U9xJUdI1G6XPy6eN3kPMJLu
	7zfwOdClIIFat+7IBwXfURaKD+LiOh27fFVZbro9dEXlOFybvshEz8CEPxP/bKJI
	rgmn8Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7gvmg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 21:33:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36b9106b0fbso2462215a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 14:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781472814; x=1782077614; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qtZnYSknyC6VJ7wYBpo4K4Mxwk7AfbIC2xEn+pH4i4U=;
        b=ZJARjjUmELwZ2d4s1onwvWdUdkAQWIXNO0+Dslzf2TWe94PWjQi8cNW4FFkdvQvki4
         c5pw7NUFwhGSS7YkI2VUgS8mEpF6v0dWF6D3A0NHFq+qW5UiBCCOasR0SYdohUdPQZvO
         bjNnsOXP33LxUz25a/GkDyjl2EpKefkY87YHwt6UeNhmiWdbAkfeWO2hlTWd8N2AV0Qg
         yBkz+1/hhjPryKcO8denoa/X3WJp8Ubejyj6xQP5dZx4W7luFVDShZz1lK++zXy6jt63
         UdPF7IIYhSXLMXimRcCmorMtx7Tu9Bb5bGS0laQB9LUehoXRQWZL+cZSZli8fSMVhIDl
         dxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781472814; x=1782077614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qtZnYSknyC6VJ7wYBpo4K4Mxwk7AfbIC2xEn+pH4i4U=;
        b=Le28s2tDVsFp4vs4e8OEQ0mfPThqAjeJP57Sv53W6zCvIVMt/jksVOdKjsYyyElN6I
         9S7TKuDusuwtqoegMFt+f3g2RWL23UbStKUtnjndanFDA/+h90NC6sg3uOzXqxlvQVLR
         ErghSkRc1mBnfQ3fJUY1/rZU78fshMf+uOnaiutpRD0y9WU2FpXRg8hUFa1o3fQq0suU
         Ikf/qvxtVY5G0lsbhYRMAG/Stggq8A2/mX/1/YmoEwyLA6mwzqJaXrfan42o5x7DRWKT
         6MW4h2NU4Y8CP6qdGW0NxaHD5gB82i9x23eprP2BPoBks+Ji04NqXJEXYkyGYa//noiW
         RwQw==
X-Forwarded-Encrypted: i=1; AFNElJ8Pg2ju4J1YVZZcqvJyXHkBwALhsH4N0L0BKN74rQ4W5zsZVI8liKsaspT9/ILaUlUmRkHK64kVSmGmmqJq@vger.kernel.org
X-Gm-Message-State: AOJu0YyaH01l7WlD1xQB2fOkfH/fjYzJXx7IGtOcbe0c5yZpMo+5NG3K
	AO93fuKs2lp8pEKeC8THBTqKjWRy6KhPwLum0vi9zg2m4T3DcA7a4bPM3WL1qpwGl0QqzdrkFx+
	kOcKoZFownfqFphY6PfHKsNKYxP6fbBeUMmdICz+Un70ZsZYnem11zmWAEfpRKoupiGQX
X-Gm-Gg: Acq92OGCN9F4e+jFOcVvKECihcBZkq5EOWtn9w98GoCFfcnIxyaPmxJ1KV0NiA0ciew
	9aER7Zd0gpsGsUJs+MFUbHIJEx+etD+x5zdRYUVy6UZERCXfh1lNZ4TQhwEz0XuPLY/8izSZiYj
	QpmtjooPEb8ZUEUhWYUBS/pseYlKpc5oXsfTuGTVoKw4eycEnr/e04qIYVNASzCrjnwqL0POD+D
	fYi/trUF97A/NR4JxMBdn6DOe6hS+dewuoAIKVkFt3Ern0j4Tz+kByvMeCRZzMRBc34AmNlHtj+
	R6TyicoNQdEi2Q3OnG1pGbXM+wM5Asc9siX+9aqZG8H8+0bivU0v23TpIObsG902Z2W4mGetUeT
	6+OZlxItJtdsN2x5BBZ6JEkIY2Laz0soCFL/7/bGR+j+g6Q==
X-Received: by 2002:a17:902:f790:b0:2ba:838b:bfae with SMTP id d9443c01a7336-2c42ee0f946mr95926845ad.18.1781472813703;
        Sun, 14 Jun 2026 14:33:33 -0700 (PDT)
X-Received: by 2002:a17:902:f790:b0:2ba:838b:bfae with SMTP id d9443c01a7336-2c42ee0f946mr95926735ad.18.1781472813306;
        Sun, 14 Jun 2026 14:33:33 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c6c5dsm78385815ad.21.2026.06.14.14.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 14:33:32 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 03:02:59 +0530
Subject: [PATCH v2 3/3] dt-bindings: arm-smmu: Document GPU SMMU for Shikra
 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-gpu-v2-3-2f2d1347c3fb@oss.qualcomm.com>
References: <20260615-shikra-gpu-v2-0-2f2d1347c3fb@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-gpu-v2-0-2f2d1347c3fb@oss.qualcomm.com>
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
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781472781; l=1225;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=S6znqV/U764pfMoWaMCKGZx0PPM7djt7INHbYNV0GNA=;
 b=cHbThRGdErenu+D4xB+6tFiU7NF1g5rTdTt10AdLvYMAoGXwlPggSRFZhJlXinOL4jAjn9CmZ
 z4iqDybCdYpDbwVAijgulh/0R9QqPHqBkUTaY2chI9tFPbAbld9LvBY
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDIyOSBTYWx0ZWRfX4lanIphJabOT
 D2vYFTNyPDfCrQlZmrGFED3zt3mHPEKpfLVYyjM6DcrowliCefgOohTCV0nh1EPV2XMq+a/B43d
 J+i1fm4/xCYrt6q1iKRNeTZvhZjS66I=
X-Authority-Analysis: v=2.4 cv=fLYJG5ae c=1 sm=1 tr=0 ts=6a2f1e2e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=iEDX-NX4Me02MYkbRrQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDIyOSBTYWx0ZWRfX5KKH6QHMw8Fs
 FNGkFJzb1+kH0bbhBhF7lgpLTTHGVKZNRDxs8HS6xlOXhUZyHXNpQfVyUDmqnxxC/IInbecwnvx
 jXPYM1R7Al5Al4I1bZBjOH13Iiy/Ntqgyae5PtyU4GjzUGtZJlgGYcr2+new7Rz4Bojl05uhfvT
 c4eowapEHeYNMM4JF2dW0ViLj4yN52I9zuOxw+hdqNlG14dHrMy2slv9WjR5u2HJqp1vO5isco6
 L5s2Sanl6hlpaaW5V+iFy5rNmnHYU0vh9FC7bbGGkgmESK0hBdJPrGfnUdGMpFouAmxBeuCokfZ
 4WQORQ1U2w/hmClcMf5YYJXHT9xN9l63i3cqef3FJVfeyqWh5kqESEgjF7qOiHvr5MobBlO8wsU
 OIO2xJJPX/xNLsSkiugXULPDWU6cys3IcP9QNlzuapPMdBv04nXdyD72pcq07DQbR6/LXksGWz/
 NKSCOFDTWVz2LanIOGQ==
X-Proofpoint-GUID: rCz2IjB8-UYdQpjftbuNIWMjxd8XBo1N
X-Proofpoint-ORIG-GUID: rCz2IjB8-UYdQpjftbuNIWMjxd8XBo1N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_05,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140229
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
	TAGGED_FROM(0.00)[bounces-113056-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: EC1C86824FF

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add specific compatible strings to document the GPU SMMU present
in the Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index a701dec2fa0a..ad15fda5c25e 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -108,6 +108,7 @@ properties:
               - qcom,sc7280-smmu-500
               - qcom,sc8180x-smmu-500
               - qcom,sc8280xp-smmu-500
+              - qcom,shikra-smmu-500
               - qcom,sm6115-smmu-500
               - qcom,sm6125-smmu-500
               - qcom,sm8150-smmu-500
@@ -543,6 +544,7 @@ allOf:
             - enum:
                 - qcom,milos-smmu-500
                 - qcom,sar2130p-smmu-500
+                - qcom,shikra-smmu-500
                 - qcom,sm8550-smmu-500
                 - qcom,sm8650-smmu-500
                 - qcom,x1e80100-smmu-500

-- 
2.51.0


