Return-Path: <linux-arm-msm+bounces-116413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id orlXOicdSGrVmQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 22:35:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B39705817
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 22:35:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="bkVbzb/m";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="JC/weDX1";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116413-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116413-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E96843012267
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 20:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84A8314D34;
	Fri,  3 Jul 2026 20:35:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B750932B9A8
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 20:35:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110929; cv=none; b=tj0rSuOU72e/chLXEl6tYGcQhyqIqyrHexjXYtGlOxPcIVrDD24gVCN/dm8ev0cYvofLNjXD/yWv/q5RW0GzeE8ynu677z3snlgR8a+dwt+tdD+DTZxugE+4cJLKDA26OTls+cwj0t0m/Fzo/MXHOlAFL8Ockho4XreXVaYKCik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110929; c=relaxed/simple;
	bh=rYZUtLoMbkIwkI8yFMTr/hVq0ZeMXm4yVfo/qe4LXmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R7DIL0mj6bdUkEn3LgKsnUQB+400wEsv5QeZc1aiE8rQk1VQuWQoM1BknPk7aC4oXBAuWihMIqdWIEZEh3Y3nxBaT/hz67d6r/nxWZlJqYzA2FboFs+Fz9arfH3PSTL6w1x+ybqHG0PfjSmu5hLENeDUVSBEbesg/vZyuycxpT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bkVbzb/m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JC/weDX1; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPSvx890142
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 20:35:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	exxwhZMTU/he8IZUkUT7QVw1F7W+mPM7cjzl+8AkNbk=; b=bkVbzb/m/+c8R/ds
	OquV2I1Ep8YCvaIC++gxM4vg7K7PZSyc4jMj+AKyLx7efXnU0ngZBlfbyE/mz8zx
	QoBQ5aHHH4Omjfwr6F1zNttJLcZsyTllra9bIKwHyEXb4rO5nagPVeFhUP54TACx
	BN9fYt8B7UxDdMnN0szkJvvg0GJLKEAjAQ9/9220RZT361nl7NK6ut2o/3loNwy9
	ohJeLY82VilBIvVO6UhCaERmW7I9zGtDYy86C6yqUarNARTNCN+WJ3Btlw+T4040
	eI4rQ9QPKPG5sicGAXAes68UDQNbBYYCHYOHpDUt2rb4I3IVUCtIxAimKEXqF8P/
	pa15gw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j030mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 20:35:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381250979d5so946816a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 13:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783110926; x=1783715726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=exxwhZMTU/he8IZUkUT7QVw1F7W+mPM7cjzl+8AkNbk=;
        b=JC/weDX1V8gw2nAvhbCzLbA9JUbJyDv2c027Sm5EI68htpYLqZGxdfgh4DJL4Ew0w1
         gdYXKQzndBfgGRsBcsoWjHl9IQcpdL/DsoNaC47nK4y81laLF+Lqmt7tbkCSxON1zbXv
         7aKDHiSgNROFfvAzla4H7M8tGvj2dRffXLU1MnNUyad2dZQeBRvh7I2gUyXviPWFvxKV
         evfRCN7FlEfvUKtEfH5GEUbamhPMorlC2PZjsTMFht6zElGKJOVM6r6R607sDP+G+rtk
         Uyn77bo+dG/uXPMjWxkBOVMLEDUAiHDlrxIFrnYZOrbtnILmq8GOYmBJp+0G7HXErwdh
         +zOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783110926; x=1783715726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=exxwhZMTU/he8IZUkUT7QVw1F7W+mPM7cjzl+8AkNbk=;
        b=Od/0umlMDUCBMn9xK6UyjJFNSjg2sHEdK00zaWAW9qKEIE1HyH5e5yFecOvlbuS0Ns
         bNmxhCD57yhXpQXKQ6PyKphVAZemPlnLBuQ9uSAJ/q/IFgj0nQA6IvjsSAz+fZIJ50L+
         V1AcwhNXFXpSY11RaIxknX/ijc0OUoF1VsnYe1NcQDI744sEDpzf8RHRdIUY4elwG0of
         kayPN/Sx2gkGNHBUM6WSFUVpnLCalmCvuwPBrH+SwB2qPkVK08MiH+ALqAZZDUibaKuN
         kgz5XHBQHxg0sgArf4JiAVmbG+rha9N4Tc8n0RDsbut+k/3Uad4GK4TbEdcUVZNW2XcT
         maLQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrw+BfNbNLpzRP3lvZ7+sgzCMRdjyUDH2kAZbmpttuIh5dGUPRbUm8onNXdaV84I5MwokWU6bAwvi50l/rP@vger.kernel.org
X-Gm-Message-State: AOJu0YyWxrS9KLfdJU/mLclNVZEavVyCWf/IZbf9T1SSr1LtwO+pWrTJ
	CE6vgb1yEbTpIIYmpUT8YIVoiqUXuJS75Vvah6yxLFBjkqaEHVVvoggxTf2hk4kTrsmtx0gOIEK
	hdFwKh+HFZTplMvuKgrjmQvm4RFEZ5L4BWfRNSx7pybDxlWhxguILbsb0XUh2bcnEDJpr
X-Gm-Gg: AfdE7cmzcA95Nqr3qV8ZENXYHtLQoIU0BTzxj8Aik/WSIsXkY+JG4qKjL1WLpHVr9e3
	XHXvSAVJtqesyjcB/P4Yd5bIW+4L98VWQ8bcmsFDOuc/+E5IMasT2WQVH8nE8vKD24cekSv8KgG
	8Uqj0jrJwilPYG4KiIhgFM94FhwhgBd3pdoSYrny7dLo2lUOD+LzQwsQEwnxoj2OXapFYdF8snR
	LeVUHlK+wWQrSANGainMhwO3sFlyxkFCvWPjtSzMlZ9KKvuaBB6bnLwh737+pBK0NE6HF8oYB4L
	9y2zYu2bVMKxmfVC2yjuOe1IT8YDCKRgBoMLXgAf3Fwt5b74zResqLqS4vNg5tx/EF6sRDWZirM
	voXGK7JGJoa+LPCu6IUlrYF3R14uX5IgNcGM=
X-Received: by 2002:a17:90b:4c4c:b0:37f:eeeb:646b with SMTP id 98e67ed59e1d1-382800d2225mr1038721a91.3.1783110926377;
        Fri, 03 Jul 2026 13:35:26 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4c:b0:37f:eeeb:646b with SMTP id 98e67ed59e1d1-382800d2225mr1038664a91.3.1783110925866;
        Fri, 03 Jul 2026 13:35:25 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm24815567eec.2.2026.07.03.13.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 13:35:25 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 04 Jul 2026 02:04:27 +0530
Subject: [PATCH v4 1/9] dt-bindings: display/msm/gpu: Add support for A704
 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-shikra-gpu-v4-1-90cf1a52e539@oss.qualcomm.com>
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
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783110907; l=919;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=e0reXjU4841qQsB76OT4bfKmGmY/z//RRWVRYHDWGzM=;
 b=366NlHMFnKH7Fuj62J9JVaF1Nr8CsES6ABTopFiQsD6b4y9xxXYodoaDhxIvDxQzXBPtTPNRB
 4O++nujOYdvChSFrKzJQei8xwwbHJTOg5lXp9iD3kMBWnYPuMWgEJpm
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: GYflEuDN1I2n6QiLmaiUyTGe_iiCgmh7
X-Proofpoint-ORIG-GUID: GYflEuDN1I2n6QiLmaiUyTGe_iiCgmh7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfXy4uIol2sHiJ5
 H45zUTtVA9j15rpSmTDhFB+iARnZOQtb5ERorfQwEEgTbAsoo3dgi32xDsfQGEyZWTzu9D6aGNB
 n2MWpJ4xfv/XRQ6cdaBeFfL5vSnCdbQ=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a481d0f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=0BLMfrXV4dllX2mv9u4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX/nF0N0+o4Zi4
 9iebiAejg03AcpcFaKnJHd9Zny9ugEBF1K6LghWet+xXJZgTvbxqfrHc/uS/DYO8BuJm2fK1fjg
 VD8ofq9tFkpuzvWeOr85qbF2VZNWnXzb4nEIM1lqWd72jMSgzsPZU4j7S3Q0poF6Ta+fLe8QbIM
 UJDb10rQ+PL9TebHECN1KWel7WZPKr9d42TUTg/rhWzF4G/lH8lrhAa7A+B/7C6VL9v+ApBiu6C
 tIQTMlCKCBBALCAtCDxidexqmbYY7kCxCHc+Ox18RQD8fvLXkYBp+GGj3i7A6qMoDYaZnfIT8z+
 2Tx0g7Ipp0Mxph1pPHDwLrCF4PUWYoeHO5AFwDx8lNsfgbTeA6VwVw+TACI6uxucm8dfCoILe9B
 HkctqBupHZcDKW8dFIh8DzyV3iKmkObB7u5KBAEEGLPJqXK95EfC+at98tyNAWCfHA+Ya7dS+M1
 MtiAErBf88L6knnzGbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030208
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116413-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:asherawa@qti.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 90B39705817

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Adreno A704 GPU found Shikra SoC is an IP reuse of A702 GPU with very
minimal changes.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index dbbd8b814189..8e648bfb3b23 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -353,6 +353,7 @@ allOf:
               - qcom,adreno-610.0
               - qcom,adreno-619.1
               - qcom,adreno-07000200
+              - qcom,adreno-07000400
     then:
       properties:
         clocks:

-- 
2.54.0


