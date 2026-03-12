Return-Path: <linux-arm-msm+bounces-97110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHrnLlkosmnlIwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:43:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3738526C5E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:43:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B89283042772
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 02:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A77346782;
	Thu, 12 Mar 2026 02:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ar+VEMnG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BGYuPmjM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B4135E549
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773283398; cv=none; b=Yy+Ny83rAk9GH0WIliXM+COqHEhxJwlahPCZSLjlSCMPA5IHqd/cc8vRKYxPcA2TyrA7K/bNf7+pLieNkQcVxKp3JreSeSNkoo/z6/cuhRRXU24nwgz3y94V2E2g/fbPYQYB9p2ssK1NQJo8l3X/WKn0aajE0DsJD92HAlPBWa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773283398; c=relaxed/simple;
	bh=uk7CNDKM8XxtoZORH7V3PBtfP7E4CoLA30eka570/Dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qV6Y1KbWTv75vvnHAsrZBkT9BdFF07vhatErG1bFzusbRWW0SclmVQY/7uHQ9ouMV9a+1RbDPLl3dYtR+XzR0ZuVi5kCUDdFYF8iRFm8rKoZPZwXDHCV21KrEfrfMnhcFpONmZnhUoqoodQOcz2B9rbpEf7M+byRktBVt5Zardo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ar+VEMnG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BGYuPmjM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C2cbPl1594289
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9NxVHPaolc1r7NOcdWDnrv0U
	tIp1b8BLoMOL1LjyGv0=; b=Ar+VEMnGYAvMy7QVnytg5et1oVleOT6k0pjliNPC
	kEhPs7AnLKX2+5jQ17KRzwkapCr2vUyc4AUb3DaboNyPMurMRi31HOkx1JL7QSMK
	WVEggGzTzJj4wAqhxekNc7Eck8i9GT+u4pCQRbTyQvplBY580TN5RGc1slvogLFb
	eJIey4pVc41vuLs/hKrZT36js7GeuJ85yYVyBODdk2/iJ68NISMY92lKFTFWZLVB
	vn6ulJeF0f/Ovb/CGH4inV6J3UA1feRO/rMuFnQ9UbU4NUT0wblBQVWSY775CA8N
	T3DBoMoPgJWoD+JUTxnpuU0R7l7kUN4kTHC9vEpM9jWdRw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvq80dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:43:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50939597b85so28577201cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 19:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773283396; x=1773888196; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9NxVHPaolc1r7NOcdWDnrv0UtIp1b8BLoMOL1LjyGv0=;
        b=BGYuPmjMcfXdgAflpTAvWjAV3tuGyLOHJpa/21539gLOHTPJyGDEBvYuVrnQMfnEnk
         4MySssJzcz+p2gIRb94KNQSTlgDZqrObxJCdMQQeUNCcGrPfLIRKbjq5LoQvE6BetLZl
         PpSBs40q+gJ92/sIhLF8mD96zSNaH8IKLfw3pms1Dyr4wDYi1P6QBHHhpppQG+fEvyp1
         7c35M0joWQXXv+Eh9jnebA33LzOwyrWaNKX0YDQ6N4B/LWwUqKjESm1okRm9vbajQ377
         r4y4cFSApPzxgBNTLHvbrVsP3XGhb/ZxFrV1dBB+yN6HbaMsYUNP1ZcVKtDvZadUj6Kg
         tFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773283396; x=1773888196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9NxVHPaolc1r7NOcdWDnrv0UtIp1b8BLoMOL1LjyGv0=;
        b=aDmQ4oQaU+ohReJENKogcf6gUOWLQQJVlVtlJRBEdE0CZ9bOVatn4NWFp7HDNqEwk3
         QyqllMjWNcHInoOQH2xytFXND833w2Ij2FZ3bO7/bmPw5dwapAa30y43wMow4/T8wgIt
         OIi/pseWVwmjdEgQU4YuBtuaU+RObuQV5Hw7a/ZBYGg3phkbtLSzB6kHyka0n6GPHp1i
         I7QVQaIChLYhnJh1Mfhf3T9LuyQjUzH9wKH1eXey+e8V15PReKkt/8Gb95EEMeYL4DGl
         gpv/gnJsRddFUUNlaMoW1qqtJ6AHmaSeHLMaRHCrgdlRIFSAZbTGAqTIiZIc6JdTwxkx
         OX2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2mKRCQiBxpgLGAqcGVTPLdhMaRd2hexqvQIJIYIvjNYclnFJd5vwV4/KxadwzvCQA+MZzHG3wwwF38Gfz@vger.kernel.org
X-Gm-Message-State: AOJu0YwWVLFMncKGEppFaxV80PgW/o8/wlsoe59tlELbKCtxhau/3TV8
	C2LMw+c/oJb561+DmNMF8wxY9Rsx6dSN04zA+K531OrqYb8y99tNuwuKRvdz4iMiw1r+dl4iozh
	3IXjOSNufK+PwtKk3Wm2sZNGTx5jxeuvqMRHMzGlqTEiecrvgOVu+Gjgc5iZFIgLiwTMd
X-Gm-Gg: ATEYQzy5Pq3jfJ5829dg2N5UTUOP9yJwEX5irDGmNuhTLHa4eqo1GaosUE86sXyeJJD
	dmfEyAR7t/4XmUhz3576BuJL4YLeXFBfwZWBsUz0peskgXrKrOi0LSAMQo3qZaR8Eua33dyr9oz
	4QWNYE2ZkqUhj1j858T3k4HQZ7hB1eQabIQc0VbIQ9J5bNYrdWaIz6iJJI0RE//4ye9xvM3/JNn
	ZZee9R/YT+bRyolwLtmgJW4ZWfFq+L0N3xzl5MHu8bgNATDV7CP50JI49yhiwwj+qQw/mozpQpM
	kBIvVhWMb7S+HDUOcXvHt5uAmL/eMQH4J7z7XvkVNC7v0Ywm4aSVLnWD8qprRAv8XxC0dimykE0
	/FeBzaR9iNlVsQVVmtYK+wdSi/KGYd1ISHVmib6CLLj5qRAY4mMzekfhWOf1l8Q6JkIRW6WJ+XN
	fgV1zlQ+4Un5LlfExJSVYWTUqjwIyUNVUyDzs=
X-Received: by 2002:a05:622a:1a87:b0:509:164b:5b44 with SMTP id d75a77b69052e-5093a1f96fdmr70932451cf.67.1773283395705;
        Wed, 11 Mar 2026 19:43:15 -0700 (PDT)
X-Received: by 2002:a05:622a:1a87:b0:509:164b:5b44 with SMTP id d75a77b69052e-5093a1f96fdmr70932181cf.67.1773283395256;
        Wed, 11 Mar 2026 19:43:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e18fsm680175e87.22.2026.03.11.19.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 19:43:12 -0700 (PDT)
Date: Thu, 12 Mar 2026 04:43:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] drm/msm/hdmi: Drop redundant 'int' for longs
Message-ID: <zjyfuzbinlbwmvypklvsx3teds6ny4q6sc3g7qe2xddx5mkyhh@hwqzoqcwo7f7>
References: <20260311-drm-msm-hdmi-cleanup-v1-0-c5535245f6de@oss.qualcomm.com>
 <20260311-drm-msm-hdmi-cleanup-v1-5-c5535245f6de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-drm-msm-hdmi-cleanup-v1-5-c5535245f6de@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: XVxCeVwf96xpe9Ml6hAcxr2ig94O7CtK
X-Proofpoint-GUID: XVxCeVwf96xpe9Ml6hAcxr2ig94O7CtK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDAxOSBTYWx0ZWRfX4z3zMhHnlfuB
 tn67SgiCNdbqbRSs9KCn+VHfNSgyIyQQdQn8MiKaZj4nJAx5b+A3axIGNF9bKaoG7p5Ty6xWIf/
 QTgwXYbDGMJWG+XdZxj72efOST6f7QJ8j1T0iB+iE/KnDAk3VCTbgbnwnCtmaZ7f6V/ym+OzW5A
 JkdnI+9FY6VE9s+/d4IzAKa8epg3nTNe8e443RHm6UYryrxnX/P/8CZNDlatSUDstBEhyAXIQQk
 WmOeak9G56OEC5vfcJQTj1bqmlhlRFGTAmy8Qd6dnd41oNWHhjD3qbAR1/9Gu75feT8phUcKM2T
 JHGfTydHsp6v+i+YY9Z3u+/ZPt53WV17OHoN01rK9UhZ3a6zSiJOER+FM4w/IW1zbflCa5uA4pk
 3vDOo+idMp5H5TjPxVUiL2KievsEWC6uGS8AEnPzJqdwqcn/RVjQnkAFRAYZW60RTHfQSQngY8N
 gzUlWHFrZI7Zl6XbzXw==
X-Authority-Analysis: v=2.4 cv=ccHfb3DM c=1 sm=1 tr=0 ts=69b22844 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=l012cfDhOvI0_Hk9PuYA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120019
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97110-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3738526C5E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 09:17:29PM +0100, Krzysztof Kozlowski wrote:
> 'long' type is already an integer, so 'int' is redundant.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi.h          | 6 +++---
>  drivers/gpu/drm/msm/hdmi/hdmi_phy.c      | 2 +-
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c | 2 +-
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c | 2 +-
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c | 2 +-
>  5 files changed, 7 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

