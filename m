Return-Path: <linux-arm-msm+bounces-116420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tDhgCmgdSGrzmQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 22:36:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F15B5705876
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 22:36:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dveUoURl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=N+5+GVhA;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116420-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116420-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 177CD3035EB0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 20:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72B1433E79;
	Fri,  3 Jul 2026 20:36:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19C535677C
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 20:36:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110993; cv=none; b=T87Vh9ff+/ZfTKC7V5b/JxlsP4tsZk9rpQAJPNwDnZ71vH6P/UxGYq+bIvItyPXxxXP31vHNIXcJTZcJj4E4Cl03HUe8Tm0hWHmDzTc/MNhOV+cwA7bsOfWZa6aab4duzo0uY5X7QC3gT2a3Q6mFpc79A1DADugPPnwBaKkOnCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110993; c=relaxed/simple;
	bh=e7loczfllL/pumoewaOymYiokr/D/1bSGb//+r4vM0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A39IA8WgmQ2elu3Le6t06Beo5AvNzfMhzDtBHF7G5oj8cFvo2nAwRINFzWlPzMg3uxfxW4LeEuh94DODxrS6aBBT0sf1GI1ifK/6pH2X9NESQtPpechASMNMrIN8BPGHy5KjMjzr+PUukNcShcQJJAGBUMVv1HMgc/eESWNEap8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dveUoURl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N+5+GVhA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KQ0nD1021049
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 20:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I3Mr60y0+dO9JKpcFRd8+KSXVcXHZQThl+NbZHMGx/E=; b=dveUoURlYPAM5nVI
	5PErai44qS1UMMuNlvsWX+1GcwixZE5ClKW2MidRZEDujcUNX5k1DLccb/+8ixjm
	4Knjeh7HodckZpt8JkQIn+WOG97zt171QbUAn3uQjZ0fTK1QZ6wE26QuxLFBRoTx
	ZHL0QxBC1J7naXn7Xq7c6EuQpm1tmTI4BzNVDIUAhPpKDm146kTkisdrRoA2rGFs
	W/ziGpTcnX/Tovv8XR800cxXvTp38Kp7ZV8ZxcPOdht8VlvHqEWKAmpD4mr94jyJ
	v5fAUBikl/SyskA6uCGhGVo/qUsn8GeKN9XMFPP4zcMmUHMQbHFMhrA1F1F15fZH
	gHRppg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6dkkhdbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 20:36:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381ed6616f7so508235a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 13:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783110988; x=1783715788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I3Mr60y0+dO9JKpcFRd8+KSXVcXHZQThl+NbZHMGx/E=;
        b=N+5+GVhAxqNGFoVlzc9hWjx1YfQG9t9+3CNMy14Gt0+26635Q3eE63hvyWwW2Rf+yy
         yBIpCcAPDkNakMiYmji8S6H1YyV68zMsRBWkYB94vUtrYDVrPADfBeEWPi3f9l/Gakiq
         Oa2QbT+6ceJlEahXqWfNKYxrllsBLQxBvxIuo1n5yXoyPhyTJxJII7oryJASLMQfEXgY
         G9yJ1pNvm2SJU63g0l76/143HK5qj7alrNMvMJrUfnPBg5ZR5e3SjFA5iiGh+KNhfJ8p
         WLU5n5UgwI/i4THfDHFelXni6Qgxleq0m+GULbN97y5I9r6YQ/iZyvNUfS+wHAhhIvdx
         NZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783110988; x=1783715788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I3Mr60y0+dO9JKpcFRd8+KSXVcXHZQThl+NbZHMGx/E=;
        b=enX6NiJvtG1XOHu7iWyLmkEAnf9mFKmTDGwbvOdrCAx7dmljVwlXGx/KYXg+03FgVU
         ABsosAehFDIFAjhmmp3NgdQT1QUmEE8rxT6DGYbp2lQVp2tfAUaxvRqz3rgQvzewWAc1
         LyJNrR85khUOFBy3bz3XhzyovTyQbik000BFTrla9YBxoEtoECsaoWryrOz53re+Tcu1
         8EU6nS5Hq5GiE+aXjgJ2Fv+SlHxZ2NXq8h5pEg1BvGYzteCoBJ+E5Tl3iAnAtb8+Aggu
         bMCiQf+Tb3LDMv32YG7BgGAMbCEalUsUoZ6j/lqVyN1YsTWYoZ5vK8/ROw23uvncHHaL
         akRg==
X-Forwarded-Encrypted: i=1; AHgh+RpiD/WKa0dRFDUxTenc/s0j0STRZt4I4uO4XpzXZlrsQqrREGsa9fHq5iqeu1HfgJj5QVz2UErXzeJZmRg5@vger.kernel.org
X-Gm-Message-State: AOJu0YyO6/B3QypqHQ7QuT7WKF6q657EFlXaQPa2yYFdbyRxg7FAvbZL
	R7p1LntJ6rvTyWw0HSMxSi2kL4cBhYxvf/KFP1VMpmYph7nAD3kHPyVA/IiPZM6CGMGLTNBVMr1
	qN9Qmy1cQHk7OBV5LAgvK2TdzhewByUIWcQDkWERxphUJj/z+kEfRBgNuq/IgNWwSkt9n
X-Gm-Gg: AfdE7cl5eF7o9gW3mrUbVdFNbmvVckMbqxvD7RoeJmKidsl7h/wyWcDEj/C8jd/ifRH
	JQ+DaK8OT+OnkMp0wOWv++u7mrB5s7rEz8VOigZXRaGjmLXgugeh/bLcgPVlmwgNuCuO6UVTYi0
	E51NWyvUPQ8+h2flvNcgLpfbAWhmBNj0BWSyyB+ctmSdWD41IUWKBP7uAzeE2juE/e1Fd3Wyl7j
	E6j0u/smjji8iqCw/F8eYFMDGFB7pZgcAUBNIGI2I0X4+QCPNwRAUkuqxogQm2wV9TdxoRsCq3c
	NFnAVj52dktGNYpVSz87rz+L1JujTXwSKLCNqF47pT36T6eUgIFCZwEAXpsSa09C0b8H3bGTgQD
	XIA9Wav8X8KsDoRwcAZPs+/82l6poUe2e9jQ=
X-Received: by 2002:a17:90b:51:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-382808b43cemr879973a91.8.1783110988391;
        Fri, 03 Jul 2026 13:36:28 -0700 (PDT)
X-Received: by 2002:a17:90b:51:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-382808b43cemr879934a91.8.1783110987939;
        Fri, 03 Jul 2026 13:36:27 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm24815567eec.2.2026.07.03.13.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 13:36:27 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 04 Jul 2026 02:04:34 +0530
Subject: [PATCH v4 8/9] arm64: dts: qcom: shikra-cqs-evk: Enable A704 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-shikra-gpu-v4-8-90cf1a52e539@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783110907; l=894;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=gfyhHgOTYf7Emr9cLrvSN0kypJSlIEIIltSML9/b06g=;
 b=K/LDEKPGoZfUeH0tbE74ajfDKOByD2ZHrcPWd7L5t+EUoogX2zIW7VdSETU2ARUATIH0akAMR
 AAKcD2XotdRCPLTyDSnzTY7LWtZbQ9VE2nior29pU513KlghswTzcfr
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX75AUbxKbh9IA
 +l6xEZMrIWLHxEcztW7L9ZJT4qcrAB35gKSAm6A6y/V/G7iXe/YC0qjglnDr+eU9kXmKvdKMFy6
 EbT3dEL8uxJd2XajA/jeI+NyT5/+DL3XLOpiCTa4hSJTyqB161zurYFSW1msWVEphp1UsOa+57d
 izuKOXPX8pDFZ3uDpCcG662Yj9TwY+nAMq9NXAGcrf4N9uhOygfKyfP1NyuwKPaNJJ/1XjXIBdD
 YPxb+Jg9yaw4CJzVmupn0LoG3h30Q3IWs8OVyoCbvYaGUADkx7kfgaU9a207v3reZFeTMrBU5j5
 ANtNp8zVhBUpG2QbE75RIJmTld9WUPvb8AjHVjybeZBOazBWmcsTvlgB+y4U/lPn0gRaYSRdZFM
 gLL4k8P+OQ39iG4nH7RRlRjZSgxWtv0D1fpSSWzGf9HVBJqEuI5fQ9LMJlFlSWEpQfSSoGPzQpA
 JnY8N7hD1X0BIsSAR0w==
X-Authority-Analysis: v=2.4 cv=LeUMLDfi c=1 sm=1 tr=0 ts=6a481d4d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=JW4bpjJLMT2bmMDKeKQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: qLY-wJesfFVWFdH9JRyfYXibpctf-SGa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX6JgIUc65lG54
 L5YqK9lvIi0tKjY004EduRgk5te24rqQbZdO8cg3tH4zw5m7g3rltZjc4tg7qcFmcUC01hxMYEL
 XPlW041eJdzuIOn9n0JIYsdZR3u83u0=
X-Proofpoint-GUID: qLY-wJesfFVWFdH9JRyfYXibpctf-SGa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030208
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
	TAGGED_FROM(0.00)[bounces-116420-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:asherawa@qti.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: F15B5705876

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Enable the A704 GPU and configure its zap-shader firmware on the
Shikra CQS EVK board.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index ccf8f856e994..a95daed1581f 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -50,6 +50,14 @@ &remoteproc_mpss {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/shikra/a704_zap.mbn";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;

-- 
2.54.0


