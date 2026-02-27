Return-Path: <linux-arm-msm+bounces-94519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iF9iM0vzoWkwxgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 20:40:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE671BCF4E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 20:40:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 78ACF3007AE8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 19:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9415C4508F5;
	Fri, 27 Feb 2026 19:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kCBEyDtK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ylcabiiv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74172451058
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 19:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772221253; cv=none; b=Cvv0xRegtUmpE6XrV3dOnCHQYA34Hp+YcZA4NEQedycd3ooVdSsWC3s5yvtHY8ztkjOSJCw5fIyYUFfLpxSuAAPWJt8v3gNCfLhNgmfijZPM1ecBOdtG2Rs7bEaiA08FOG0UdTWayj9zzA8X7dkJ37c1KwVWPaKFLjP70rpknNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772221253; c=relaxed/simple;
	bh=f+CMVfU+w/gVxnWiQ5f+78cD0MWPBO38SOp/FNUIMtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cTRWm/jLpUHpQah1LvstfoEFRfTs62OHBJ4GhgOw47RpQVEDbHYgohSiCiHZZ6MbUIQl9LLF+RgGPDdoooYD5KFiqiGu8y9lhDKO7AWbLdJEk9+v+OnUF6aSdOu8i6/YcKTaB8RP0bYWGoGy1i+h7hFK3j+jvZMdxnZLeurFRMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kCBEyDtK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ylcabiiv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RH0LCC702281
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 19:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L75XY9VEM+sSzrGnvNJpY4LH
	cDeszKmzt7QufvAjjD4=; b=kCBEyDtKO2tuM+jyPbQE1di4CocBj7SILndsalhQ
	kbWohsHL61Q6Y9ZHxPlzx5+/bPS5rsWfrVQ5kNUws8DICCrAtjiijRIYxA2f+Hvx
	WonsGno4pmOj8rLq14LEat013dDab1ddiLv7qycJGM3K0kkoBB5zvIhxsClgoYNZ
	TdGKageIX/p/mqOhMHHeTv6lFUBO6idtpB5qMjzu7tV3AWV42/pLwqYqerRUbNH3
	fbnBblmJtKMXWQ9lkzBtAl1QEbpedvNw6CdYH0jAzKwIVDIh3OFKIu596HvKL1H4
	xZRH/TSNM5mXfLkHJb43s20PgseBJ0ufNRNVvASAGh8UNw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck8x89xb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 19:40:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb403842b6so2238852885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 11:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772221246; x=1772826046; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L75XY9VEM+sSzrGnvNJpY4LHcDeszKmzt7QufvAjjD4=;
        b=Ylcabiiv9gKUIL6F5CgjjI8exiHaZOMmpclAfissgdzaqkSCIzPYkwNWkGneOLEr4y
         mKb4wW3e9u+FQ4B6rQhpv9lkmJNLMw2mCiproIO/N3CWseBk0wwFtumrUpbM4bCH0GGu
         3VdiT4PimEnJGUySLO2HFC0C4/MDLXjtxjGuEBe6QdHuTxNJ+WUcNCXHYt9eJ2Po9M3b
         P9c2XcC98/7g07h8ybOe7i6RiD1hScbBVlHIAQpPgSzqHqK/97Z1HGjhrqnlFkfFwtsQ
         2tSgLCa6AHvFu0TzSDAzHVcm+APOFsqnpPoDVEgcuDVwDRRu6+w4psklZUNn2K9CRo1D
         KOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772221246; x=1772826046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L75XY9VEM+sSzrGnvNJpY4LHcDeszKmzt7QufvAjjD4=;
        b=BysFe+rLoZnWtFgqJ472YHnu+DggHURG8GqUvk6vkdO6xwuD6OzmCHeonHv7v+o+j8
         rt5IADF4ESFKM0MhOmz3RAzNZhIkOfT1KBArBymKk5wdbc7uY4Az1mjKO11oaSdIy1RC
         NWIuiQBHxpCBsUN10HV03GIwSDtmZ6jd4NcbsfA2qQ0xFwuacBvKmcH0scAzAOcjBklE
         Tfmz/2rOcUoU8d5BLcpdJrWgM9brogpi6aa4jl2LhHMwwUcMFzSD9AazSrW7i36AzHuO
         0f9FEZSqrkn3BObwFhEKrMigeFWX3x7qz9Uepcn5MPc8bEepg5N4zAyA3CoAtZE06ACv
         ej+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWSNGiPrLxtZK3m/RBfYLDq/b+u8QHrzexAB11S5TUCnCxMhoNwNIEct2Adr1jouXd1X4S68wRmwvioUkDG@vger.kernel.org
X-Gm-Message-State: AOJu0YyVA5WSoqPw3inJKlAiCac9bxnyLWo1b8Tle2bxu0Hcxs1Yu+yS
	+WUDWK+vsREnZnKFpK+Hrh6FME2B+xMfCNqEzCrKtBNhH5MuD4NK4T1MhTnsupB66/bTXSzrhoz
	yE0dFyNNTnBcAgbClHdKEP7ChwnErAjgNtKBPqmjEDbIJra1wbLoTy8e0OZhw+HFqKa99
X-Gm-Gg: ATEYQzx3gtLlqYy0g4CMV5km1+GzaexCUUqIsTHR02laMD75+Po6Hh4BoxasAghlZ++
	jI8x/i0Kuk/YozzcRPUVXwmyrXDVYmAH2B+vCZ58zLann/KyxqJz+gSx9WRgtYX1Nug/4AS0zDS
	mVAcpX3z/mSID2F6cY2mis/cLJWGGSrJB5QdwIJ2tH//JCBC2yzrIfhE2YF+wXmoyv79dmSaav8
	EQl2k3Jtdlz2VZlPjmPRTEJt/eEuBjxNw30QMeo5Wk0oNLQezYh74iavNBQcwYT3uowOCKvHg9A
	xlnu6HVsYzHBlzFQkp4VW9OiU6s7fncJ5op3Wm7SxoSq8n7QDgJNu36B2Bl8zSga4dkErVoHmqm
	yYqn5YZ0XtYRGLfmDxmE0ctbsRdEVozbw1hSBYy8nP5iJoB/BJE21/LUAbB0bUNcL6A+yrZXpDH
	dU9EfD83EvTD96dGNDkbdLH/Ks4gVq1pweUhg=
X-Received: by 2002:a05:620a:1a1f:b0:8ca:305b:749b with SMTP id af79cd13be357-8cbc8f3626bmr503266485a.60.1772221246384;
        Fri, 27 Feb 2026 11:40:46 -0800 (PST)
X-Received: by 2002:a05:620a:1a1f:b0:8ca:305b:749b with SMTP id af79cd13be357-8cbc8f3626bmr503263185a.60.1772221245826;
        Fri, 27 Feb 2026 11:40:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30169e7sm15922351fa.31.2026.02.27.11.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 11:40:45 -0800 (PST)
Date: Fri, 27 Feb 2026 21:40:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: Re: [PATCH] phy: qualcomm: m31-eusb2: Make USB repeater optional
Message-ID: <nka7f2iq7tbjthbhknl4ixtlmnasuy6jfkjqrmrnghuysm74em@7clv5rukburm>
References: <20260227-phy-qcom-m31-eusb2-make-repeater-optional-v1-1-07a086bbaba4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-phy-qcom-m31-eusb2-make-repeater-optional-v1-1-07a086bbaba4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=WZwBqkhX c=1 sm=1 tr=0 ts=69a1f33f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Jej4ySSpV8SEB3TWoE8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE3MiBTYWx0ZWRfXzRBbq6iBcpys
 IHZC6Fm0oDZa8z4zfUGokKyOPLhdHcxEjYq+wOlPJVblghFmGiFWEMdaVIFx0h5yXdn9P/aO/Zk
 rocfivYeAap4wcNylXbhFUrlgg4oFS3ZrNAryRmbK1+DJXXbMAqnn/OIB0e85dVpvDPUzCbNI5C
 1y7HYoQ89hXdwBqWGsMs2Rp+xt9qXo8t+XhxtMAFknAezZXw07QqsDPMIUd8q08UEFzX6cWLPs2
 IMQJNtuYoYVXQHQxwwecJx4Qt3CvS72lMgBdtk7C3FUjSPlF2aDDj1VHjRny9Y6Yh/v8Ez42kSC
 1Uchlx/l2JYg5/poOxAXl0gzR6knpFztyUJ+mpzScQhafKzZUUVHXQ4s4eN8qRsou26dZa9u/nV
 HZZYHlifbb2cqcFJOvlBFKqusWmACqyfNNf2NQXvdG9lAwZWiX7BDThajp+1JVeg0dh5K0L9B+h
 32otPTCoofCi1e6lZeg==
X-Proofpoint-ORIG-GUID: PPqXOFk2j4MY5lgLAp7_KfPFKS-jztS-
X-Proofpoint-GUID: PPqXOFk2j4MY5lgLAp7_KfPFKS-jztS-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270172
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94519-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EFE671BCF4E
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 07:47:14PM +0200, Abel Vesa wrote:
> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> 
> A repeater is not required for the PHY to function. On systems with
> multiple PHY instances connected to a multi-port controller, some PHYs
> may be unconnected. All PHYs must still probe successfully even without
> attached repeaters, otherwise the controller probe fails.
> 
> So make it optional.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> [abel.vesa@oss.qualcomm.com: commit re-worded to reflect actual reason]
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> This has been sent initially by Wesley here:
> https://lore.kernel.org/all/20250920032108.242643-10-wesley.cheng@oss.qualcomm.com/
> 
> This is still needed, but for a different reason, so re-worded the
> commit message to reflect why.
> ---
>  drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

With the changes suggested by Bjorn:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

