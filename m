Return-Path: <linux-arm-msm+bounces-103622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBaoBtil5GlSXwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 11:52:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81896423942
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 11:52:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 35B4A300F140
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 09:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8457F3254B3;
	Sun, 19 Apr 2026 09:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="al+xqVad";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K9YoEwzb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4861B1A6831
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 09:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776592340; cv=none; b=NDz3fYzXkIKhpDwTMnd3J6RZmNWytjNJgCHJ8PXqjMtFCRmKVPTnsiEDC50ZNlQgCK/+lnUUp9iPF2oDthyIWQCxMJ8NiTy6Pj2ien/jtiy/4TyGnWmPv/7imDx0BMi+6EG2bMs8vAY6zmsX08qVVOe9zggQycLYm0CJDH7BQe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776592340; c=relaxed/simple;
	bh=E0HvCgJX/7g4mDSi7loqmioSNLi/qoK3a2PhrolbZy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MC2/7hI5oCIcIQMLxEwMPq1j6Z+RLirtmYBmyGUBTtYphSW9IiiVR2Bgl8aKX5zsueEbrWJ9JKyezo8VkyLe9kX6F/X5SUeXboVIs4MSiyjvDOTEpPUogfjXBzNSSCaT0T9JdLKrIvHbGyhOA7ATwefUaSGPZQQOUctHoqpl6yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=al+xqVad; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K9YoEwzb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63J0QvB41885502
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 09:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XEo2oTEcsG7l3+0lO7xxDJBT
	jTSe7sGpcaQQHTUMBQ4=; b=al+xqVad34Y/bw7J9fDIIbwH24QaohImnwDm6pGa
	gx6jPzlcOjHPgGY0a9S84+nvdXyfkcizkgdraOpsrljazqANG/kOaPgStN9sXt+e
	EHrJphjGkh74TcCUIe7gVJ/s8CO2Tqkbe4EHDZjPTZznH6WSFrYAI+EJBCtmRhPj
	4xFnc7anee0zBmWvqhSE8/mYqRyidloYwxtWPbvoS5IdpIXFb3khqRjKYwMD/A04
	Ld+nEu41Ot/Qrmhh/4Cdi2Z6nGl43YaDAzUKiKtmg6H0hOdIozkChRF4BMohoOnY
	Xm0E0ZdY1aKIO1dQiFTPRR9xnFWouvPhLNduqQyEsCqqXw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm261tar1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 09:52:18 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1273dfdaf5dso1700882c88.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 02:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776592338; x=1777197138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XEo2oTEcsG7l3+0lO7xxDJBTjTSe7sGpcaQQHTUMBQ4=;
        b=K9YoEwzbkURsEN2fhI8MqZP+BVK6inPQQo35mlvdHbWg/qngX5eiUBX9o+uZ2PFI60
         l7ajT+o6rHrA4HjE/ygRknjFQ+1+npTkgq9tAZn4Fwtys3l1wIydMrQdYPKxuqzcEFJp
         0ZTKkW9pwyNgs4iISv6aVOB1GrtgjE5tiPNwvu6at3kImsIyukJZd0EwzPa7RP8ZaQNI
         JeH/eJ1nDwgtPqaP1l4OWEpO9DUVX8/0n9ZZRm9MOKGYJ/YnVQXl8iB7rs7vODOMuYcH
         8RmeJ05iPIYiCig7eix4gDGjjhjE+YjJBPebzFshzEWk1j+D+f+RU+48J0ov0O83BqRp
         Y/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776592338; x=1777197138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XEo2oTEcsG7l3+0lO7xxDJBTjTSe7sGpcaQQHTUMBQ4=;
        b=DFhOrztitAvJEGMA6nw4mK6h6ieeJq/otXuBtOZmI53lObShQSAMWhDvlQwrWBgrxW
         P1g3UhuFVneqSVQWf6pCcvr+F9xzlTtwP/hnTBqSIGjn6kUjn17Kq3mywWeXpvq0S3yJ
         HdvZ8jAoHUoE2FX0qykm7v6j/W/Pzb5ZBEHttuHk82yM0mHE55Z/vL3v8GN4XCUJ3jyd
         JVcpKsy9WctgafPSCrMVFKdXSptkqG/wThbYSPnuMimgYRyvPEIxzjRvg2TVaZaf0vVa
         gYMas//iv1ZUq3U3psq0EzM8zsI+crrVW+34OjYQPR3sTOwdVawzitI4kjWYlf0vnu7d
         44Rw==
X-Forwarded-Encrypted: i=1; AFNElJ/jthubzFP2m/Qat5/s1DGfI7QXwO8XwsR+Ye6I6UFCofMQDgPQKZClLf19tMxP3S+LzPXj7RqBtB1QjaIB@vger.kernel.org
X-Gm-Message-State: AOJu0YxbV36biZKgMkVB4oyLlCGZYWrseI2D9PQxKUg0pTCr7eW+Ag9W
	ELW3VK7g8O5AXNkoQKG0XpO4SHhp3vxOT+6skLpXd771Z/fVSva26ECSrSEBqPkFYn13xXeB2/6
	aKzZ6EGbl5jCi6mm2zI49CpavJNQaO1G15nhE04sAfrYGqZp0+WcjPlEYcDd40X6ni8Yl
X-Gm-Gg: AeBDiesahRuDcFWwjog8b0LYHqDAdupQ0kn2afhDNZTVi+K+1AVBqjFQJ6xsbbjhw99
	5lxvaAmp+4k90+BwLBsMGKBYM6HA9fBQPyVvkBv0OauIbnA3vZI84GWSgzSielTSKfD7Yjo4UzC
	Je1Z9qIAvmAihtFlmVPwfLEXFKNPyxIghOcTSSAQlsyUkZ1FbvLvu1FpMSltEt24UXBBNLi7Esz
	JFQoeuqp2yA/CZgCUfjtRD86XUScsB3Q8VoKbrw8FP7S+fjsYJ7IKr4HnbbPQEOfkOsfBMMrkhp
	OYeR3VPL2FuOa8bZuCDkc7b6mcSrm1r/JMCSahBYPMEKZM9LdkSf/gANIP8e08GSWH/2uPofyZO
	TUbwZoLiEi+A3hNlimKN+eozFfN2j7jOGBXDqzN7jOgoiHP/Mk9WrWepRu/pY4qFj0UZTde2PNr
	c=
X-Received: by 2002:a05:7022:4186:b0:12c:3d1c:b325 with SMTP id a92af1059eb24-12c73b2bd66mr3631735c88.14.1776592337876;
        Sun, 19 Apr 2026 02:52:17 -0700 (PDT)
X-Received: by 2002:a05:7022:4186:b0:12c:3d1c:b325 with SMTP id a92af1059eb24-12c73b2bd66mr3631727c88.14.1776592337343;
        Sun, 19 Apr 2026 02:52:17 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2cfd3esm9308003eec.21.2026.04.19.02.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 02:52:17 -0700 (PDT)
Date: Sun, 19 Apr 2026 17:52:11 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: bibek.patro@oss.qualcomm.com
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Dmitry Baryshkov <lumag@kernel.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Fix fastrpc compatible string in
 ACTLR client match table
Message-ID: <aeSly0N7IkXHYExB@QCOM-aGQu4IUr3Y>
References: <20260408130825.3268733-1-bibek.patro@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408130825.3268733-1-bibek.patro@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE5MDEwMiBTYWx0ZWRfX7nbSqzpz8TNL
 zzZjhzkgyxyRCw1Rt2B/BwNbxI347DGLNBF09hfodQRmzrwocagzW3ZUGtfRGVn9JhwWtojjSnB
 ZA1UjsZytqUNYQBNK0V48MG7Ji5/925iSnJFDIqnTRM4Kb/SIio29g7MXftf5z8LdTBOAZiUdvp
 ynM3tF5hBJhYXKUfY/vRwH0IRTudLa/kYZu5KVjkLJKk8i2qRd7OwXKnmLHIqS4sfza7NeHk2S2
 Zri8Eeq0yx8fzNSlfUT574JJDtEqYr4cjRqTNvthSYgZUCHAUPiDRpOq7VbTzQwLBeSIlPzNqHf
 PYDm7a/snyl//UaUH4CaWoMTFtugNhoJbJFz2SxKKrABCXPNdUPxFp51xzf2O1mr/yvX2stiYXf
 XjHm+AKXnQyCQ3impWM8oZ/YsF1dpLMBPQz0boXuN7k3PLvon72xVuv7x7NIxOgh/76jnQiXOT7
 ohzAw0eXuOo6DdE9KPA==
X-Authority-Analysis: v=2.4 cv=dcywG3Xe c=1 sm=1 tr=0 ts=69e4a5d2 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=R4lqVJv_ZxSicD1_n0oA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: uk9ovbV8XUYyhhYSa0_EFh9SYM9iXspO
X-Proofpoint-GUID: uk9ovbV8XUYyhhYSa0_EFh9SYM9iXspO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604190102
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103622-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 81896423942
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 06:38:25PM +0530, bibek.patro@oss.qualcomm.com wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
...
> Assisted-by: Anthropic:claude-4-6-sonnet

Nit - coding-assistants.rst suggests format:

  Assisted-by: AGENT_NAME:MODEL_VERSION

So I guess this might be better?

  Assisted-by: Claude:claude-4-6-sonnet

Shawn

> Fixes: 3e35c3e725de ("iommu/arm-smmu: Add ACTLR data and support for qcom_smmu_500")
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

