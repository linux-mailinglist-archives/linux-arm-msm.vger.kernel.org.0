Return-Path: <linux-arm-msm+bounces-114794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0kIJDflmQWokpgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 20:24:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2CB6D49FA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 20:24:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=b7gI6+6E;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MnCaFBWl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114794-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114794-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5657301BF4E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 18:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4314304BDF;
	Sun, 28 Jun 2026 18:24:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18592D97A6
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 18:24:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782671074; cv=none; b=uRt6sojBAccZ/xhbSetJg3GdfJQkh+VjYAE6kJZ+rU/bzOgeqQmwZeJoSafpIah7+hyYEV8iLmVxB93b8g9OCcN3XqNmgyaKG/zi/oJmpD623oLH7xvmHXvukLLEzzN7yeow0vuOqy1wHuAWE3mHTSiCQwh8fFU03vdiTV7d/ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782671074; c=relaxed/simple;
	bh=FouFj+iYJhzcqR59XAa2/WxqzLLfYvt1re4RY7l+JLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XgDy5uwWQ+MABtke8R7rRFJoS8b9Jh98Q8Osk5xnhtZG+LADvlvMCsFFJij99QpFKXUzGRPuveyX5NSlSHzGMFyV4hTyFqyS6mLFum8EpYsBxLNrCftf7PKUgVuz8FLNw/PYf4J2YJJcKNALFW6WA8xcQlffZbLULYPnyNOLapk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b7gI6+6E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MnCaFBWl; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SHifgq444251
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 18:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RJNbTAj+jMFVYX4XVSum5y6+uZsOGvYQPlgU5ZiXWP4=; b=b7gI6+6E+IyJ3GMr
	JGNhNPvvWEuhGi2oyJJfH1DTEQHSNX6FbL0eowjjuI7VjiPh4XSwP7BLOWIIV8Rl
	A5H5QngRwub9KeE5tQw3SGiAAmKJu7prlKkvfGpNEUOOhu1aXTb8G+1dF39AbnKg
	4oRKopXTA/yYrMhvmtRymFr+cNs73lhBW/viD4ZGf+iYgNkZ1dgWeu+0Z40228t+
	DYBk8Md2Oe5xrscuUVFHeMtgpr/2kGYIYYQc1AArU103RO2M5jNoOdoDohy4Pi1j
	ChZgXuVhK9rH0fi/9OIhe9/AqvCbRqFlok0YejzT4ajEv3X9SkySW7YmraHOTTvp
	+5ggHA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27083cqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 18:24:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c011c7cb9so6031575eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 11:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782671071; x=1783275871; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RJNbTAj+jMFVYX4XVSum5y6+uZsOGvYQPlgU5ZiXWP4=;
        b=MnCaFBWlWuaOrwQcCr+xWYP9H0w3nTlQ97VGT3zKY9UCudI6m2n59iG95CfeicKUYG
         q4wkThtegXxx5pOSqB6LCZrSsL2am8O72KfU5r537dHG39+f+qhe0cIKSImKB4ogDgRX
         t3LoxC9aRQf3qZDx/j9D8kg2UYNAv7WavBNIF8ymMg7P/9AkZxD8vwUumn8Z6301nTOh
         lgOt7qMRZ7e47GZ4PHcc4YZuJrRmOTT3I5YjVQ50cCPYcxjDzrg1T9+Ltzx8gzP9VMGp
         XtRqpASkgD0M9dzjNvDlRD44Tb155ZTeqri5k5gHsLoQeBbVK2pOT5poneefrxCWlTdN
         9liw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782671071; x=1783275871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RJNbTAj+jMFVYX4XVSum5y6+uZsOGvYQPlgU5ZiXWP4=;
        b=CWZ8udpieS/fTsLoDjNI1F0YqMU//qt2Ud23Znav0PWtlOZBIY7NrCqvBfYZtKUD8o
         UKiI1Q5D5VMB/JCiIv9fXO3VBYDDgw8i/AhRAJ6Ggim2uyvbLUVTPZUza345K5y55osF
         0B+J/Vo6Jk9hFaz67Wbs4KpgG/Q3EGwluhsueaX3aq53jGllyH5guOEQBiLXXGBr0LKQ
         wFZ9n/YkpgE1VwOj2D54OFecxdjTgJSIZ0kgm9tLlMznlrdf1XcHFhsBrCsBmTCDv4XU
         GnIu495jnWyRL86ROFXQGD5WLT3iqKy3SVC/xJ/eANpUyFSztDedWC+vuqpdqpmT0ejk
         mQgQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr6Nvl2G+7PmBioRXHx93d1La9kCutFhROkSMDkuRH71WkIVk91XIcYgwE5H6mXdu7jLXls6OTc1G9Tk09q@vger.kernel.org
X-Gm-Message-State: AOJu0YweMZaUk37eBsz4BsfOOZ1ysQiLPxWK1ABeKIddhh6nMw1WvAZu
	aU4X3fvJ+VfLXyrIDp1pxbyjJfWS+pzqb/ioEPYHPz6Ma97MS4RThEN2d+T084EpVQaBVqrWdjG
	flvFPKE6DE+EMldDXLs+E35Wxb4WJyHwRcRjPjUwpDyBpyiAUpzsgrg2mUY/m6jjLB08/
X-Gm-Gg: AfdE7cmiwLiQ/DaURf+5bE1s3ODPjPxA8qFbNw4ObVBGZKeoIkgtsmidoDeqIBx1gzu
	XdKTJUObIGowlKw+VUHDk4p05ucpdpJUtFNQLWei/Xc+p5cnWSe5fY4AC+WWU1/XTV05b8/HBRR
	R/EWMOWL5qrXV6rd9ikLVs9/fvSGMffZivXtK/51+LXjBrAzGaMq3a280wAHO90NECDi1frwt17
	R5BH6WI8eankiT+iU6KK1Z/2YBJ0g9Em8Ve0houg7OLYjc2+rdtXB9XFND/gFdUou1+SE8Jxsw9
	1JqNWXJCoHeEcQbinp6bXjaLv4/p/qi4tiTweeKNu8SA8OagAfX0Djpbw9Rkzdka//J/tyTNrpe
	lbofuehrKlI3yfm3UVVcnIo6dVA4moeRvFVI=
X-Received: by 2002:a05:7300:7fac:b0:304:2176:a871 with SMTP id 5a478bee46e88-30c84a265a1mr13670338eec.0.1782671071214;
        Sun, 28 Jun 2026 11:24:31 -0700 (PDT)
X-Received: by 2002:a05:7300:7fac:b0:304:2176:a871 with SMTP id 5a478bee46e88-30c84a265a1mr13670305eec.0.1782671070686;
        Sun, 28 Jun 2026 11:24:30 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a75sm37508218eec.19.2026.06.28.11.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 11:24:30 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 23:53:54 +0530
Subject: [PATCH v3 1/8] dt-bindings: display/msm/gpu: Add support for A704
 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-shikra-gpu-v3-1-9b28a3b167e1@oss.qualcomm.com>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
In-Reply-To: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782671052; l=919;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=JBJQ6bZjxqgxmRsc6EMGB+P+JygJ8pgGviEVLPjhEKI=;
 b=22p2wlSkso0sZ4PEQ7LITGuwdJa9RASM+Jq+223nG5cAcH8yMmpZFDMuD6z9JBVhrbUJh2aE9
 UR9CUdoJ8n0B5yFmfy5Fk5N6AuTTQsx6RktlFU2oCAgzHBC3Pba4JXE
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=ObKoyBTY c=1 sm=1 tr=0 ts=6a4166e0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=0BLMfrXV4dllX2mv9u4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX5KvmOOS5vGwS
 N2C98nbYj/lWKP3Xt+EqKn9+5eWApzg63EiCYZplY2qG9Dpqpcuo146wqbWF53w2VnqfgP67g3N
 sDoAwA8nKUlFT6kOFUAHfKY6Gg5WyHunE8muGBqADYGvAgrk6ZW7/m2M7Lp0fCi3ruHcFBJtj3m
 WvREChuN5Ro2UWDY2oIdkxGI4ysCId8WOeNBdDE849JQ1d+7oMp3ojwpO3IlcNqkriUg8fGw+gR
 vV9IC27CBtBCzDNm2ovaIgRwe0LsDVfHacaSJow0vIsNtFSQwhPdXTHPKCzcZ95errKpFsaCber
 ZO/ZMnm/gxtARzuvYbRC96aQzO78m4mve2iEzu7XHD3bh2XQF1RJS4pWHory8UyAJwTHFPVEYxW
 Io3l4Zv9N/9Cfasjm8Yh1z2Z0mzbwTW0WnFsFrAi2ZYdRr9rTNeuopLvtQd8dNFoO+mnALTfiLs
 HDhmbbTMlmTB9IaN8KA==
X-Proofpoint-ORIG-GUID: UeZYWg4A7LlXV0RZelHlkn2xgnZRtlKD
X-Proofpoint-GUID: UeZYWg4A7LlXV0RZelHlkn2xgnZRtlKD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX3LhphJtN6lXQ
 nvvOYOMX6w77zB4OAo8tRA2t/S+lgzWa3dTfRiOP/41kGcblLF6rCXl2SCZgQQ8HzXm2FIM36tn
 OCwMchFg5K3l6s2g4WO4rTJyWH+XsQg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606280165
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
	TAGGED_FROM(0.00)[bounces-114794-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:asherawa@qti.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: BF2CB6D49FA

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


