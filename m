Return-Path: <linux-arm-msm+bounces-99801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCAtMd+Pw2mCrgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 08:33:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C63DF320BDE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 08:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 785F13016B03
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 07:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03484367F5A;
	Wed, 25 Mar 2026 07:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XBoNjTZz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fcT2v8M1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F92E36607C
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 07:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774423824; cv=none; b=N9D3r903qVWoqw0FAIED/uBszyemm0P86p7corOwOZm3tvD/TbbGixwWDPbnco7DT0+aOgOyhJledssOfjY6jNHco+qCY4VGWb3tgaPQd00JkOJACN9mvJOxY1pgxmSSUc6raed2Ld7/uXGFvOij23x7gWysGkWzXVpdsGN9hg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774423824; c=relaxed/simple;
	bh=dKZnm1NKIAInWCR3adC+CxY3O2RaJO81lRLtHVc1WPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzZOyionkMI7e+bnHjC/3mrEdcatBWq7/nGqtwtTZILbc0DfJO6BLMnsQIbQEdHDDpJUTyj6VYGJUi7xaMfHU8HH0q1FgmjIeIeY095IkVQMH0Tuhy/EDK8K5jWcS+hSYGruThM4uhPVAb/mkdmX5rayLpVoiLCrvjZaUKS4MAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XBoNjTZz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fcT2v8M1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OMgDbt1354120
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 07:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0fCloKeIgd9lSWMeOiu2m3Pb
	uQlaLl7gCecj/rK1QsQ=; b=XBoNjTZzL7ikRyuUs9/zZoTMq59YRd65FylItvcD
	P9vx8DwQaKnCmfjLMtk6rNXcyYTzO/CFbHofGluc1V4a6F2+iVQMvJ4mHf0Nfp45
	74G9Bheu1yyy/SOeUSGTtxVWAW67+iG3L8ad8+Ccr24ejf64lWCgHU7gEPY20Ry4
	Dgci9qVhd5MtyX+wy4d8Gl6DDbUTazYUMA8q3VYJRS/NUVR+dllLss6G+wBpWOIe
	2ODfCz52gi+1l0TvTPdpvSB5eO3tOfNV0XRRVvd/xc0LcobffUnsgTQ0MTP/3f/f
	wWQSM7ixJXBplmZ0OiWFrpzy+6UiKFSplD4yTNTcIJR34w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3ukmbb1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 07:30:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b802961ecso11573491cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 00:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774423820; x=1775028620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0fCloKeIgd9lSWMeOiu2m3PbuQlaLl7gCecj/rK1QsQ=;
        b=fcT2v8M18JLrkNZIYtZADSy5b17JOI4S4ZGyMS3oOcoefeEukc9tJqiuv8/9HuGtTE
         UNJ6Sj+sHExUD2IuVPyu0alrjjOJwpibkVhhBz/oOuK2HzmuV6ugd2s0yegimvxYv9lJ
         SJV/OehiakwoGuZJnlCDU917cvQTp8JfSkTvv6Vd3JWJT7Jcyl429N1mMF9ZDC8jZUFh
         3HMm0cJ30hMw5yvKR9IExP6bsqxQYHTWWWM0J2fnVbEVfI7IRV4d2Cvj4qFk946BKhnB
         y71UONGzkCHv71VPPwPmgwnwXhiV9rKwDPP053xBjO9s1wTjYzp9qtKXzY4ExVqF80pJ
         KtEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774423820; x=1775028620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0fCloKeIgd9lSWMeOiu2m3PbuQlaLl7gCecj/rK1QsQ=;
        b=E0eZDfjnLCrXUwjJPSsvMmlL/hojvBCHQDBLFHgNR14imF+CeIbTu/OLN4JDui5JVX
         G+WV+Rp7wn23KxSTxspFw/psijWE1FhUR19GJfPXHj4JJ6tjOEX/UsvLK2TzHfbseKdS
         ofaZp4JQrJ+ircrpXf2s5T3dBPovYyCkyzPisbpbUQVVytvVs10cYTdpTX1HIvZ5fLc2
         2PdmH2/VgBGQrMhDxhdjVCQr9VI7fNfFACupNF5kJZ6x3QmIJqqbY/FZ+914QpYXogdo
         IsfYdF8+d1pxL3Zb8TfKO+nB3Ssn7LokJejD7x91kPHCOWrhkPHH+oGst3VoKuBXKPxd
         UhSg==
X-Forwarded-Encrypted: i=1; AJvYcCXM21wKWs75myQxR5JsTuGXszjaLSKU6DCpql8KdxGQxcCCS9Jd9DOnyezQP+G8+rqzZdEWjvg3j952rXYh@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcm0Wj9xr+YGJcl36UA/0lxLVivw5LKUa/ZWkh2UoPs+J937u0
	i57qQX8ZrVXQTvt/RDbWPOIPDNhOdg1iUkWsdDKD8yrFy+HmINzQJxuMVjDir7GIclSoI82jXVr
	kiHDENKO5Y4UW9+84Z4hoosTq2Y/UpCsvq05tgseQo5n/8M1gMvBu1aYaxmOr/0Le884H
X-Gm-Gg: ATEYQzyprH4R0/Lrzqnhi4G8Nr2iMiN4h67JxwH0IjTm4SCOZkclMAXHzzCtlBJ6IXE
	iaqTaEZY7QBonznedkLlLHiHXTwCmfYNhJiAZ98yv35Ti1rVlwLCGrBRO1ggpnOHqFDBsJ/GHAN
	EPltaKrjKWZ7p8nqZGesIZ/0HUrfLwuxtaa8QEw79HI3g8J7Nbola2vgUxUt44MjupVzFc0Z9aN
	jgMU+HS2BJLFpPHeS4DHxwsemgOxU8gmCtIym6EixbvfVS2im6DQNVRvpsJ79oQuqKDRjfDONPX
	5pE/F0K8UdoS99KNOdmpuiggtq23Ap06ipPE89jgI/PqYM3oQU+Zr5StIvq5xUJlrFO1BsUF9/L
	5sytOykX2Qi0OB14vgpnPT/Cq26KIAF/PtJTYbrEw4RY4XO39drIev5MWXp+FJh9BLd/Ft/FoA1
	zYzC3JT34kDhP155Gd0o1oUEhEADZNM4ONDA4=
X-Received: by 2002:a05:622a:2985:b0:50b:4cae:e37d with SMTP id d75a77b69052e-50b80f2a30dmr29477941cf.71.1774423820232;
        Wed, 25 Mar 2026 00:30:20 -0700 (PDT)
X-Received: by 2002:a05:622a:2985:b0:50b:4cae:e37d with SMTP id d75a77b69052e-50b80f2a30dmr29477481cf.71.1774423819692;
        Wed, 25 Mar 2026 00:30:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9ac6d55sm38145881fa.40.2026.03.25.00.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:30:18 -0700 (PDT)
Date: Wed, 25 Mar 2026 09:30:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: Re: [PATCH v1] ASoC: qcom: audioreach: explicitly enable speaker
 protection modules
Message-ID: <sf2hegu7qqiq56nftimjpvf2hj4jiti3zxjex75pmcjuoaqkel@4rosfzs5zvcl>
References: <20260325054408.1994556-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325054408.1994556-1-ravi.hothi@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69c38f0c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=8CM6PFMxr7d9lmg1EjMA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: GOL9_Qe8FiEvlWAdBrW-_TaA5q0t0gPn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA1MiBTYWx0ZWRfX+eAZWFMhrTUj
 KQwaXvovX+sp4jhKMwq/bMG9bO2unZ+QYaH9SXVvt+Ni3M6bHEg2444bhZv1Y8HbjKSNqMr4poQ
 dOjDK1HKSSLfhzPgvAp7jyyQQaRMygOMwVxmZVeBQN0SzleAi0P6WFu//CghMKOjvNTbbOm9hbp
 7NrmsrZW0cXe1Qe2nmHuRXreyEZvUxHxCfsuNHsURSbQ1Ds9yBwtqpqjVraqZJM6wCST7HZYRcw
 rKessGhEpGrDm+od+6wA/hyfDgozmZqNTi7Hy07fKr8wGgzN8n1D7y8DNPI4YsO0AY7DDKdWYUd
 GGpI7Blu7qmUc3Yh1cZohbxYaW5dw9fpO6+1LQKqa3AajY3NXL+xMHikjQv6Yw6CWJPWQrofk2e
 Tw1x0vthsUuz/wPFblKDEzgYAhHBXAA6iHBfT2jf3ZH0aMwLBjig3yhGgv843MaTrIsvR8dsFda
 zyrF3koSNQaGl4ASSKg==
X-Proofpoint-GUID: GOL9_Qe8FiEvlWAdBrW-_TaA5q0t0gPn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250052
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-99801-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C63DF320BDE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 11:14:08AM +0530, Ravi Hothi wrote:
> Speaker protection and VI feedback modules are disabled by default.
> Explicitly enable them when configuring speaker protection.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

Fixes?

> ---
>  sound/soc/qcom/qdsp6/audioreach.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

-- 
With best wishes
Dmitry

