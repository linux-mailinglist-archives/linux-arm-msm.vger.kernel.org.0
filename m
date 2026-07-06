Return-Path: <linux-arm-msm+bounces-117033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1cKsHtsYTGpngQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:06:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9227159FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:06:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Nfe2e3kB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WkrPu331;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117033-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117033-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D9D73038780
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 21:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3678639A07B;
	Mon,  6 Jul 2026 21:05:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F084D3ADB9B
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 21:05:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783371932; cv=none; b=vAzpDsibYVw1muWRsG3fTum8o1DOxZZ13zZ3owfhQu/9MMqB07hw+D5a5uR++09+8JYq6TAMvNTKU79OU2p+uoBLnzO5HY71b5h73ndLuNIMBgmxVUfchh1J6fKQJZ9AlgBw2dWbLOov1bYF8c5DlOmaJOGxVcVB+41+J9ZHpW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783371932; c=relaxed/simple;
	bh=8G002/IxABPssrEzt3TqDoNY1L4MUJqdSn00j40u6ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B9I8Ldm8rxf1Isqb/Et3YJMLEuzNu6iI8r4DglnQ3QOQjQtecoBIEMGMdxb3GE3LCRFAUmM9h6FyBtXhxqFxsfHqfEqvxlgN/MUva02+Fo0Ym8eNHClCZnXn1wM3fYM/Fb65F7CTk74hVHmKdWdR0A6sIxC62UmRHcOzpVhEzWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nfe2e3kB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WkrPu331; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KDo2N1649922
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 21:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o57AaR11oY74r7NNNrEra2MutbnOlIvU5mENPfvHh4o=; b=Nfe2e3kBjn1flEcj
	9fCTeI8Psnisy1AXPGc3a2t5QPCx3o/OX4aze3IGnGTLw/W7oHQbVFny8/lWiokG
	jBNGIGUimQ98xkXAiv2AOmVBNnqF7X780OUA3zcJwXQ5Y/2mUEBO3H0Uvg6SHVeG
	zpS7ooPd5lUJ35xhwjS2anhkpvmI8Ng4uGuFKiaDIWGk2luoKo7N+hVyo/2hzOtY
	k1ewLJsHXcu7FzvLbheLXOeJXBH0Q/W5sC5MA7E6FP/hJ9/57cJVE/U+UD0erleF
	zjUhO2/MQuszqOdM262shEHp3EBhx/GorCp/N/+NNfgiBvnPUq2+R2V4U4T1nQxj
	Jj8LEg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgu1jw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 21:05:30 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c889d1eebafso8353512a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783371930; x=1783976730; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o57AaR11oY74r7NNNrEra2MutbnOlIvU5mENPfvHh4o=;
        b=WkrPu3319DFM/Vth8h0lBbSdRoxHkO6GKBePVM0GXoEKr6j/JLSsEJ0c4kjdheyUuV
         XQGjzwwzIZMHvcw6k5nZB+RJRUxJfRXAAoPgj0WyXqn6nzAKL3KtI3EgOLOjakt7MFVT
         JJ7TSmxFRA9XomEtBqYdNMUh3hzo+1wIH2mV+8JPkofrxD7ngZBFgtr68E5sXUW6pYFB
         jO5wMo8Wipg6Amfs29cQw26vNfqCKqGKNKLkCtEhG8gnvqDVHBIn3xmcXabhgUkv5sYU
         eueWmnwz0lEtwSUItTnMqbXx0/o3HtDZ9gRaeBy903c20YqvtNI7IFJnGoaCIvr2Px4B
         V7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783371930; x=1783976730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o57AaR11oY74r7NNNrEra2MutbnOlIvU5mENPfvHh4o=;
        b=PMY2CaAPtrE33nzksnhQtfMIVfShWonRsoUYI2/21hkY5iAObtDSSPr2PvjfQANnsy
         fZa0pcEoEjz7ZI8G8m7gEAlwp6Zpq0OykQXbqvJFK1etuuwI49fFNb0sqoGpIgKItCsI
         UO9wz/1+zS/R3+yX3NGSwhK9NDxqbuOAl6lCHSItRHtJ7JzvJ5QnYanJ3+wTWEJOTtGI
         HqHVnO+zORb4dSR4rWKvwERwiGNLAwzQi4xn0tN0SodNDgadzER73zy3RMuzGnHbyeXn
         guWlrogL0AW8klWVgcicp67nOLviZ/1fYyFPn6213G4/9J/j4ktSpp54DeWxmiBbPnoU
         CeEg==
X-Forwarded-Encrypted: i=1; AHgh+RpHwTJ07lbMR7niMktbuahjDQ23ywt9JxLEvj4+Lh57w8L2ejJ7lbQFSiIFKb20QfipPjufA5L7CJY825Az@vger.kernel.org
X-Gm-Message-State: AOJu0YwHkF2s9zqb6t5tSfMbyA9bDCDQpDGmls+0Qg7uwy3dSqiK/v5d
	NoNYNBhUaGsA+qXmjNsbB3u7OPrU/I0kdSyPx37N72sputG9JtJ5nO+w7n3MeLxzPBJ32vJcFKJ
	OCjDFnmKSp+y2ercy2NllNhPynMo4UG43EKLbi/PxQE796U/Mi2TRPM5jKGGOaTKcJVKI
X-Gm-Gg: AfdE7ckLjC7uk1+WxeFhiadSheYHcuAZl/VcPKhzCFg5GdeM+zwvNvhDzjFWy4t9hBJ
	cQC4RNpwFc1HI7eAN6l1Jf6CLVjd4o3RTIb3MGmEgmFrKTrYukkdRvxmR7Nue0h4/6aqA1VOT3B
	cNtfWDyUbD/SH2Z48QaEQNVk7aOmcwoBUr1msihZMLdl+r25n3IYhqABL/nlQGhYGYqYkqbioB/
	TkoL7P94pLrmXsn98J8bH1ODMU+nlotCSFWLilyOxb86V4U978FgfAiHMFiaVdCBXKoP/7RIQIv
	osgSEE1amjwcU6xfXdA7PPIPCAMevZIBzFue7pKrvhjAzt9svuiclt3s7/A6GlSCLfFdeUPimgs
	pkhjOrBU78u4OuBzWAbiY1uJ8MkzYbShWlhM=
X-Received: by 2002:a05:6a20:914d:b0:3bf:6c08:284d with SMTP id adf61e73a8af0-3c08ef83fabmr2831817637.60.1783371929605;
        Mon, 06 Jul 2026 14:05:29 -0700 (PDT)
X-Received: by 2002:a05:6a20:914d:b0:3bf:6c08:284d with SMTP id adf61e73a8af0-3c08ef83fabmr2831599637.60.1783371926807;
        Mon, 06 Jul 2026 14:05:26 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659fa13bsm305031c88.15.2026.07.06.14.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:05:26 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 02:34:35 +0530
Subject: [PATCH v5 3/7] dt-bindings: arm-smmu: Document GPU SMMU for Shikra
 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-shikra-gpu-v5-3-d2f373912d3f@oss.qualcomm.com>
References: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
In-Reply-To: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783371890; l=1298;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=2jQmU1XEfwX7ksFDjORvPn6m0bWV65j9hgt3Tl3GEMo=;
 b=ql7/qNujURK5g0Rtx0oRe5F0EU5W6LTR4C3UxuwOB5V3LYSyWrfhLBHWlDx7ojbZZsimC6+l+
 g7ggaP35tf3BZydN57xyWo8ihHxk0MOvYi4WuQM9x3G919M+PkRSAFe
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: brfCLLlcZtwjkG4rT-PliGNvVCN8L48y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX1NLNHK4CFa6M
 /RggPEBgOiHfy97scnWPsE2y4u4cAruKkqJsMbAfyh4H+YgBg8fMgVRfeur5tcDV3u/zCnA8Jd4
 QOJsGnoZTfKfgmSFKas5pIbjYzqLIbcuDqvdq1fSO55QhvRXLYZs/XGYgiO18tCBR1y5mNpGKJO
 29nNisINUCfEktwHqgfGX1GcRUKrBxLSMPc8U3YOCt+zgcortbW91+AdTWGUyFwFWbpAkMhYeMV
 tQB/y4kap7h9B8c+ANejFMnLGdvlKj6SlW3/NleTPnMcO6AlApDJsolMpAdCteCDnxlV1E6Zib7
 q3eocbQ16MFiQ5n3O6r4rEgxldnCRGHmzvWCOq6EEXwnWo0w52kD8kKuNZM6P7p9iI60GxuBRgw
 l+uevhf0BmuN60QskFioe7iDR3kiyS7yo0y+oDNJjoAfiB2G6c7NyI7kR6/4Ht3GDR229dlQh6T
 ici9UQ4AwoMAZ7pDF6Q==
X-Proofpoint-ORIG-GUID: brfCLLlcZtwjkG4rT-PliGNvVCN8L48y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX731M6igvwIdt
 JhBaoWfs29J/GyGXaiGqOQ7tNOIy95aResgai+xJ84cL9HNFOwKMuDDt+lksiGzMRH2S5IJurI6
 CpFhW10LRWoXzxY/qnleJlONpJZhZgM=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4c189a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=iEDX-NX4Me02MYkbRrQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060213
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
	TAGGED_FROM(0.00)[bounces-117033-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: DF9227159FD

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


