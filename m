Return-Path: <linux-arm-msm+bounces-116415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id COenMj8dSGrkmQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 22:36:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 682FC705846
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 22:36:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OomLeSBG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=A0xaUC+h;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116415-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116415-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0AF5D3034AFC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 20:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4FDC352010;
	Fri,  3 Jul 2026 20:35:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D20C34C9AD
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 20:35:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110947; cv=none; b=T9nTDVGUl4pccwYbLQjsibnUGDZ+X+QhMXbMOltAt201bob8eLfGWabN53b04Lraz05lojb1wagbGCbGAFJomQHJ2MDvVUvhe5h3o48KMS4qHMQSelCibjfg9mdAHAYonGbZT3qW9HZj5ReD9RQjzBQr4RHa3YbpWmYJUtOmvXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110947; c=relaxed/simple;
	bh=8G002/IxABPssrEzt3TqDoNY1L4MUJqdSn00j40u6ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y5rAJlF0ISWcP7xhprxEKEXf01X/X7zOhQXOOCIbqb3W1pz7yJn0pcs6PUdxurnd0AVlgxcv8skwWdMr2iyD0p2YpQom/Eoe67uEFTh0vRWTHiwwE00bQA6zh7RbcrXIJR2/bk1sW4jaRLKUbC1v25wtcHUYyn3ZqgNy6wLl7fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OomLeSBG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A0xaUC+h; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KQYQT1032670
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 20:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o57AaR11oY74r7NNNrEra2MutbnOlIvU5mENPfvHh4o=; b=OomLeSBGdaXwW9nF
	k4zirJkKvIjQMNSCeeMHkgHg2Nu41+fTSH1hESfZCyqPqxPLdnBB6nyVzOsIP/1f
	npgRwIiurTWf0CEL6Q4jBVciA4VGbDTS9eCvC1/E1fOh+eaNJsRF/lSRshNXlsxB
	6pte5e140Wu3DOMLOzi5j74PoHdWQ+fRbH69UNzrVI/nOaQ/mRVRuorfoj4DlS7q
	aPbzZbNv8igCLD7FJa0Qx42Lwm2LKb7lsaBxh9pp95l5SHgjqdjWUe9cAJT0hmYy
	DSST4wfvfyJ8TwNN3aOfVPy66dRhq/kUMyzHieWnfmv0eXLU0R5jMx9FNZp2QMO+
	epyy/Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5bw30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 20:35:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37d4eede8ccso795904a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 13:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783110944; x=1783715744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o57AaR11oY74r7NNNrEra2MutbnOlIvU5mENPfvHh4o=;
        b=A0xaUC+hGP+j1TGZlWTMu6Q+ZQoz4fNn6QYcI1au6x6RApzSbbHE6Xn8IhaTtOvyF/
         r0xb2Yu8Excz9ykg9zESLjpNNjZcHwfpTR9B4y4aEq6ORbQJdPg25/lRVb0pz/cmBkUm
         3373rhRrZNSofGMrwiCGhTO4NngqxuUQeO5p5Mf66pKLFgWu87T8kDiBYgkV1MkcCjFu
         R4QEjUjE5VZ7Qh+KwYoyHwXynk06uhDigunFre3TJQtkvh9+XZ+qGWwLZkEGGA3F/hAL
         0atJBfQVqUfs6v6apsYlzCZ+eCkfm+Zi1V0lK3Svem+6SE65dmduxQXXviGe0toVaAAt
         0D/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783110944; x=1783715744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o57AaR11oY74r7NNNrEra2MutbnOlIvU5mENPfvHh4o=;
        b=Yy6LzwOSGGZqugSXcZE6EZ/iXDUZ65npdgnwvm95J52fqt53nZPp8M2GXe9USlVDZH
         LhsVRqb+9RWtJl7+A1X7G/PVEk9KfUzdvZkCSCav346nqb5C+TjT5Z3Zfze4svlcr++I
         nJPtvS4LImQSJcvX9qe4XvHq46dvUF7aTieEgkz2RudTKF3kizvjrUBOCLgkh7EIQ5Ig
         Eg8HoLOJDNjoGzhPxaYqn/92+yBNYteWRef83l94UM2yM/BhUSZi7cDrBdZ6zKbuYLqk
         krNMJjNBgidpqMjdO45Ko1jFP2q2Vxvu/zhzejlbNotsSfuIAZ2/1BjV3CWx2GwbO2DJ
         x4Og==
X-Forwarded-Encrypted: i=1; AHgh+RoLJBiRvXvKw9RAoUNYDQuPJQUbF1ZHL1dJnl4b4vUonQya7QM2/ZyAtgYsWfD6wE1FJA9xx/UbaSqW1fxQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxwQdjDqeOOD7RVvLy9M634kMlNCLeRQdQ+3++JxYpv1HLsJvSW
	QcWY+4xdnHg+3qklUfZCLWnQ+p4Kp8oAfqCWUeCZ9imV+d+Vz2wP2UOu3oR4Amzdy/InOXVGKzZ
	0ri+tkh38zv9KOqUk36sQDt9wnIhUJGdx2OUrOUXPj2WMmbucXf2zTYK3tVCDlu4lBtOz
X-Gm-Gg: AfdE7ckPTdokkB84wEpYBeu6Ap9c3rrKljbHAM2aYzk5qPzo6jX9Kvm3sKpROSLMibh
	EKYZifT5Vq6vgV6uLyXQKJLKTE7cn03U1gHZsOySLWXr24eAnCWPszkoPgGLOsG14F+BY7diUBt
	8iX9VuUljL+S4cAiQ50GWDHJs5npJ7SHnOwiKANzrge0NWGjnQCz0Jo05yfPot4SSFZaMNiSbP4
	lFCCY+Pg4yrWkSDHuJjonaej3RI9VfxRHMJNpV/tVm82j1yImR6RFA0AgdvEbhuAM7eQDfNl+7Q
	qlGZfTVLDHYRfz3Om8XUWuisUZXdRtir4TxkCdm9vVkyhvInHqUzhcQdL0KM1RBSe9csPHSP9DL
	Iuawz5HPh358M4Jg+IiGqWmBvY3Ea3419TkQ=
X-Received: by 2002:a17:90b:3808:b0:37f:9ce0:af31 with SMTP id 98e67ed59e1d1-3829f4e6e58mr957993a91.28.1783110944165;
        Fri, 03 Jul 2026 13:35:44 -0700 (PDT)
X-Received: by 2002:a17:90b:3808:b0:37f:9ce0:af31 with SMTP id 98e67ed59e1d1-3829f4e6e58mr957959a91.28.1783110943675;
        Fri, 03 Jul 2026 13:35:43 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm24815567eec.2.2026.07.03.13.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 13:35:43 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 04 Jul 2026 02:04:29 +0530
Subject: [PATCH v4 3/9] dt-bindings: arm-smmu: Document GPU SMMU for Shikra
 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-shikra-gpu-v4-3-90cf1a52e539@oss.qualcomm.com>
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
In-Reply-To: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783110907; l=1298;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=2jQmU1XEfwX7ksFDjORvPn6m0bWV65j9hgt3Tl3GEMo=;
 b=KNwcyIU5VqC/XQr4QH/U8KJlsgyT01EHf38v8j5tlJ2UjyZDi/yhU6ttLhTIayHlMRgIJ0PKZ
 lcgwcjlSFQYDI5rA10heEZb2fIAwdN9cVwv6HJVUEhVI+ZiVqtcHGSt
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX37x6ASNyKEAU
 qq3MkaETIqurfhtiogWOrka4MXC2Kekrq7HV8DMhv186re8es5SDJ9w8h4X2PauUwKNx/xtauMs
 gAMsuD8KGoQoKGC6WfuqMbxwyJsgHmw=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a481d20 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=iEDX-NX4Me02MYkbRrQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: _FRD_c3q0NHbI1d4qyL8EnChGnc12-rE
X-Proofpoint-GUID: _FRD_c3q0NHbI1d4qyL8EnChGnc12-rE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfXxgSWb8fkfGyT
 fgLutHHzC2hzvlEacm0vdzXteXoewB/JKNR3w7HNd0tWfwPhtr6Ph8/JYEVPEvFzfxyVoCMuW26
 A2p62wp+QBSHyeb6jOFg/SqlyW0Cl/4yoV9z9yDaNr5iRqNbp+Ih8hpepeWRhAOY0JqTtyHbjPq
 ZnwibMVEDm/kCWZPz1+mTtzxpl1eLHP+yQJkkJCDtvu3kK6SUTt+J/Jhp/uwH0HugbEYb4WeS2W
 ZP/c83Fh+YcDYa+VIU/T9J4TmRVK3ec8hUMimloo18PjazgH3awW0wD9RbsKvIZjUp1Zh9VwS/k
 jW1MsIGfYKDH71qYBrDyBF6Fy2UNzKRKxVphbqsTRPWEOxZX+6gkgcv7Aqde1uiaCa4ruO6gp/6
 3oJoCQ+58FHV/eLTZaT2XMkmlXXQYUrU7keIOpHzMCFvf+AcOcdTpsQgSY2Z55vJhaQ+DXd/g2e
 BsSyPL83IfrfMDue1GA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030208
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116415-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 682FC705846

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add specific compatible strings to document the GPU SMMU present
in the Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
2.54.0


