Return-Path: <linux-arm-msm+bounces-113054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LAtMKiQeL2r37wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 23:33:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7566824D0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 23:33:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kZVvZP6V;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ccDi8dr9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113054-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113054-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77F9530078AE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 21:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6AB30148A;
	Sun, 14 Jun 2026 21:33:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82C9285C84
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 21:33:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781472802; cv=none; b=CWgpk7ZlTH26zcth2goO3dhNWuQeVm4KC0C6W6Y0SBlyHgWA4biYodkTj+Y0Bq7FBpEzq5I1BDa/xe90puloqmxLQDCJtLfTI8ojX5crzlHLSkr0XcN4rcMDvlZlhkBtB+E+RSDVUIE4NxKqGnNaOOM8HWQ86HFktiHJwYKNOQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781472802; c=relaxed/simple;
	bh=FouFj+iYJhzcqR59XAa2/WxqzLLfYvt1re4RY7l+JLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mny4fKTF9U8VYETzarNMycFOS4eDZxmwZm6hB2DrEkjQi0q28ncNrilIk8BKS7K6GmFS0/1R8JScBFyi8NrK6v2cwOCSomzdsK6ylOlZOlAPWuNMMwF9YPqavwnnNkm/RKS4CTb5P2Voa9j6FTRg8Dhw46V+QlSaD3OTZS0gM6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kZVvZP6V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ccDi8dr9; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ELF2bH2731536
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 21:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RJNbTAj+jMFVYX4XVSum5y6+uZsOGvYQPlgU5ZiXWP4=; b=kZVvZP6VJrKoSNV7
	LKhWeEnDvy8IowCzIt6/hmnwStxg4uCjdN1GlRDOcsPizXajLUvfCBEdbhYJR5ut
	bWBXM/xGfnVx8JP3CVlt48QKCcU0uI5nCar9ZL/AUh1ImXT6vzSZ1exCyc/gNLgA
	FaBJeKjOdHlqowWqZF03bGMYMziZmq7WqJ2bVZcE2L34vo+p4gJjRBFT94FtlxBu
	3QgMvuOhG61la6WPdSzn0KK3/7vM2sgfuBprK1zPpE+qZqNKAaZJOYRDqgEiyrZV
	Gxb/jUlrN7AlSEZjIQqv55kFWmJwHOOxQ405eb9mMaRSCr0p+skAWRSbClUnGwou
	9KtT7g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery8wvju3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 21:33:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0bf6904a6so46004045ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 14:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781472798; x=1782077598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RJNbTAj+jMFVYX4XVSum5y6+uZsOGvYQPlgU5ZiXWP4=;
        b=ccDi8dr9lYAzGOx4rJQJtSCkpqbOQ8iO93vsche/KufeqQce/3yIBzbkftkZQBQCwD
         bj4mk0CKdERXASl+0bkvKifWmYo3KzzjLJIOpCs+ytp6Dc8/4n8hfy918xTDjC9Bzbzh
         XxLdYa27zZwWTcuIb2MqtkMccKYux7m0qIplNfXT7/OJ78O3vEQsZQQbnMYdNODobl3M
         1pdgI9aD3tuE7MVVQp3dQfBCQy4OE7hCwENAE8c4Ee7HwVP7dE3MjIQwEyG2chGBrGSJ
         y0qI43GvRnUzzPFbgaXOeVvo09PFxYb9ZGBl0HqMamAwv3SWUZziqQo9aR0I2cOyitYi
         aoag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781472798; x=1782077598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RJNbTAj+jMFVYX4XVSum5y6+uZsOGvYQPlgU5ZiXWP4=;
        b=PtckPjKa/YeqhgHHpr4U2D0OMynGBPRTPN/SWfqf9gI4gQ49Bz0mymNtBu6Zqe2bia
         gTnBO/JfWGCJ7Jo1NWyXY/ZT4rizD8hcMjpuX6fOjAhsk0C6aXMIUDBCDdPwbMHkBTFe
         Fw04aNflLztFTCVT0fgWTGxARotMcfnYKQSNbyXuJeEMPbDWPXE5AkFT35x1lRX07z1A
         fsjapV7i5FgNarV6N0NemKq5tM8Gkxn1oDTtm2FXYlpruLSsQY9VRtlK9PQNY0uUp0ZB
         6e6kD33LtrJ/TfrYqyaMWIuoZcLnYCtQEXr37vTOc4DtQGsYcnvyn9yJCZV2osqXeamX
         o9Lg==
X-Forwarded-Encrypted: i=1; AFNElJ9BI7NadrPLb6FGjVDX9CxRrcJKkehJWW/O7KwceYD7eLyQX7Yog2dRgS0/pkJYckT0jcbOr2Dqx1OtOKiA@vger.kernel.org
X-Gm-Message-State: AOJu0YzZmd6V//THRb6iwm/SGLcza8zCf+7OTqupzX4GJ4ExyLeyxnqo
	HxKfp2FDOZVoZcGiGAp1WPjV/QNuAy9I5HLiJXa6E1rFfX37YiFFqbIOn7bRrcnhyJlKWj68QLU
	JDayjLpIzLKDcFaWe2zN/fPtLbgahBsjNbpc4mQq5ale55BC4gKSydoM1o0SO+gqrtadI
X-Gm-Gg: Acq92OGC3RNkM1C6Zd6ZgsAITqHPkbjGvdSVQBOscLvqgwRNtO/cIe5thfVxeNDT/od
	DgW+QxxwDFemJUqMPBHKkmhVgVG4uIslv3RrsRLszPPd/v0fLrrhLf/FGizH2ILU3DYqNGlAo71
	fBGqAFV5j+lw4bX0/kl3coo27lfP5KgHWe5qiFlaYHI/M8YY7E0BMGjTQ40SUZRvdX0yxhlmUr8
	glukwJNUZTXdG8El9j5m6VuZkm+yDLVoj4dTArbwWDuyGzzv4w+bPXyI8c09xmw8HfSUSSOieah
	FfGVCbs9XeEPEunTM9In4D8C1Cx0sN6rO049AvO4MAhwI19McBa4I0V23Xj0eDC4GalEn/lEfxi
	4WAScmEEUUhpiAjEr2PU8ugTL1BD/VgYio2MBSK0xVA5FDg==
X-Received: by 2002:a17:902:e54b:b0:2c0:bb2d:a314 with SMTP id d9443c01a7336-2c4129391a8mr131369575ad.28.1781472798108;
        Sun, 14 Jun 2026 14:33:18 -0700 (PDT)
X-Received: by 2002:a17:902:e54b:b0:2c0:bb2d:a314 with SMTP id d9443c01a7336-2c4129391a8mr131369115ad.28.1781472797754;
        Sun, 14 Jun 2026 14:33:17 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c6c5dsm78385815ad.21.2026.06.14.14.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 14:33:17 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 03:02:57 +0530
Subject: [PATCH v2 1/3] dt-bindings: display/msm/gpu: Add support for A704
 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-gpu-v2-1-2f2d1347c3fb@oss.qualcomm.com>
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
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781472781; l=919;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=JBJQ6bZjxqgxmRsc6EMGB+P+JygJ8pgGviEVLPjhEKI=;
 b=9c/Nh5M9LMZTEf7PKcK+5Hqv/dWjx+aNYHao+IXyE9Lpi8hX9zjkIPm1EMl/8kFjmr1IfHoDb
 QnNQYN//NpABbbG/pAJC2eLV4BL8orSO/XzLvu9r9mMxo4M1FCp7ipD
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: eJdbtC9PhKjQHVgHvjWhZV4cidNM94qZ
X-Proofpoint-GUID: eJdbtC9PhKjQHVgHvjWhZV4cidNM94qZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDIyOSBTYWx0ZWRfX/MAeuWGNgfJX
 nn0bFICwPzg0VcPEd0DaZ9RapBXZQWGxm5F6psH0eKpp3WmTZyFJJSD0ZIDkLH2ygIPRk9xE/zg
 UH9afIS6mBmiJQpP9z4pH8QA399JMBc=
X-Authority-Analysis: v=2.4 cv=IqAutr/g c=1 sm=1 tr=0 ts=6a2f1e1f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=0BLMfrXV4dllX2mv9u4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDIyOSBTYWx0ZWRfX+B7UhoaieNZo
 7aWRNRcPZFxJtGKoD2Cuu6MAM+X2p/VT4t3wPrlxnUSS4Y/PUKUjWfp2E0EDERA7Cm1XlTixfyh
 GAG3sRQp9Xv6SIStrq8JkQdGsuGD/cYOEVWz0XLJsRRnlW9c6Ga/dUCs2MHgm5+zGXn8E5iC8uC
 do8QsYc6fVicIlR1uk+1vkq3l3R+ApBfFIwJN8edmof74zxkdx9trFns0y4E6SIQLUy2YYhu5qS
 mQm6OSa7q0fFWGm+M9JeXT4HvuexI6G2uOcIxMKQUli57PrksiV4gpzIpr9n8GtvwVt63FfhTRQ
 dFvNwNXI/Tv/EV4cMztlsXeO/r+PgGaRgB1AJby1leTU73wmBoXY/VQMPwW2N9pOK/t4HD3nzHq
 hbILPBSIIbrPMh0TD5cWDzyJCa9PvGFVPJGDi0je03us+ULYPTW+pAmrfnfc1bkzhkoUooHIehN
 5J6QfprqIuz6xvegthw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_05,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
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
	TAGGED_FROM(0.00)[bounces-113054-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:asherawa@qti.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
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
X-Rspamd-Queue-Id: 5B7566824D0

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
2.51.0


