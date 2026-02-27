Return-Path: <linux-arm-msm+bounces-94526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OwlLGr5oWlkyAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 21:07:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A401BD357
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 21:07:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DF2530FF3C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 20:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D9242EEC1;
	Fri, 27 Feb 2026 20:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SpgcyeDs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZYXGG5SG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EE22D73BC
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 20:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772222765; cv=none; b=ZGIa4Vm/DVGHCQOUBHT6MnVSqNu8vcLokNhEvIttS9dz50sDlVH8TZX+l2UBtCHTUpfumeuz/yWe9OlyPFuHHkoFzjJJelIJWcHtvzud7wIg1K0wzvrXxW3sIbgbAuvqL2xyFAOt4BhMkBzOFkzhtC9S/hBCDsjE0UbhIY/rKKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772222765; c=relaxed/simple;
	bh=5aAaE8gA2wGIKuGiNBgpXyCDhi4Gc1+RIiVU5ZNikJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aqiKqq6PDYh/3MSKeHEmDMHdywy1sl6mi2Bh9LNZiqVWhHnwkanqYEGYC1JyrcFXVVhBhwa8DS1ZAypBANNkBHrLfsm/ccMoBhP+Fl5PG+WekmAQDBzyHAKqPZ+DeNBS0cA3NtFzVPCe0hb8bUo3RkMM4HJ3m2gW9yd5ubdPN5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SpgcyeDs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZYXGG5SG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RIexiT373681
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 20:06:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qmrycw3jNTQMcvCiBGbpSf9e
	aMmJAlY7g5duJVBGMwk=; b=SpgcyeDsoyy9dUTRmhmEUYntWqWFD7adVwKE2uLi
	dZ9eMHs1hwhJbOGeo4rMXQhmjvCzFselFCOiUjw8nQSjqO7ZkG3sbSWTXWBlF/Kv
	rgMjV+pS08d2QlY8wnH1F+j4MqqqqSmY7f1n/uLB1RHGzkm2LZlOi4P6jMypQqeu
	EWE4WF8GHHJJOdLe8in8sfIY9KafnOtsxv7l51BWs9FhpwuP1G2lQy3AdYx61aeR
	4A0wL2BFq8tuCCBm0ifWbOvNtfPRYtQ8Os/P7wRwJNW9qEWzP09AMT5kh9cmxt5A
	UvAA2WzhkU68yWMMglJgIjAHKY1JqCTSLHI8wraVh/bBCw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckgrtr8em-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 20:06:02 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-896fa0fcf27so254012836d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 12:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772222762; x=1772827562; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qmrycw3jNTQMcvCiBGbpSf9eaMmJAlY7g5duJVBGMwk=;
        b=ZYXGG5SGHX746YchVjCE9MVvx06gvX5YrajKZpzoNEWqRjgMRevmLenDjKxwOrjRcu
         xdnfFnpGLYkwgWXFLG98tLGrWdwhjLPjGs0aC1G1JceLUIZf0MzBB3Td7LYgmOJ7gmwp
         40b8UMePW8e1+08f2duoZFUDssNkkE7wa9JPOklrgHGNM5qWF5GUg/TtKXv5Gx9F2gXc
         HryqUmC8frMNfj9/ytfXC3vM84fL1CJg1/N8IwFvZz0MnqorZc9Qea5qFTZUtyTRjJyJ
         Au/220xELMF+CAe1tY4zbA80DHthRhe0SnsJTVTO4pMo6sVitIzEUSUTOwUqU44GSu4B
         oSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772222762; x=1772827562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qmrycw3jNTQMcvCiBGbpSf9eaMmJAlY7g5duJVBGMwk=;
        b=YapNbux2RFo4hRp6M5wMlrSb7/4+3QFuaqQ68GN+Y74PqcHCzK+dQrrldZcGUCq2xg
         KFY87oEAhggu/AJzxhIFJFf7J1uQSizDom7O6pf4Y7GRFutmnbHZnwJzapnCsuzEdK2Z
         fINNGfxDsnjBulq/VevGt535R2QDygZ0PSmnWhJibWRzampM1p2/qSiv2Cc3y1HZtu04
         dpiLgMmueQ22HgU1zyB1hE0T79C/1y925qT9eIb5jaIwXCj4yMgcdSjfU1g9yop/0u2c
         EqFnhB56Ezw5DCihhuToAQrQ4nJ0VObXr8NMcmGEyWgH+CZGs7VK/oydUnk5LFbn4Ikl
         +y+w==
X-Forwarded-Encrypted: i=1; AJvYcCUUuJVIEOKqbNW/JPPWzzYkvZe9bIIGU5uTk+y+vXuSb09D1qFVzX5vINd2mXzQ9fFIQ+Qp+jiz0wnWzcCg@vger.kernel.org
X-Gm-Message-State: AOJu0YyKbSY6THofQhmC9H8LmN7CjLR+x898+d2s1xMSf9zUMvmT0HbM
	Oj9LrzDu/fZRQlDQ8gCz5ZRMwxsa4vBGnZYIjBoK9xP/YppMEIUjYpk2vPSLEnUlrn6DnJYHypd
	s3dc6yvKXAzF7qfSEq8O0H1UvpmqqHOyo49kepSdCzyPqFKThPVRfJb/O5ma2D0zEbYNV
X-Gm-Gg: ATEYQzywNXvd+hdOJrW/opwOa0tOYjpYWcwhl3tnS4SfZYXGbXGJ/5IGjSM1ce7TQgZ
	do6VY31CnmWD/7Vz80biGyCBkHND4Rheasq7tx/91mAUMhgyxq0nSgvhfUQl7AOKonXHit7oDJM
	ShNgx1qthsuigT4WI+LzKqYDXe4WdGbgRitEbfvn1+EzJOmNfuB0rA61Fe56AEvkTfSL4ROZTHM
	3e22MoZftYREoES8/YzEIbKerdkv//e+kY5okMUAvz2FZenXfErTMCz0HLhlyJpVYgUl4SW9OPL
	rpGstSC8stLKBbGnL70/YoFJh2ozjvILQ/CGgCv9UkbHOKd5wkMr9e41T2nQaBDZK4cv4ezFiwL
	qgj9wa9jPzgtGuZwfoD0IQ56om2lPAsub2ZUi0ZfEJvqBpnfILdyrdqUE+PHrogAIGhelr737Hn
	QlehkuTiO8lcXHjURbgsKL7ZtSeaNkVfjzxyk=
X-Received: by 2002:a05:6214:4116:b0:88a:2444:36e1 with SMTP id 6a1803df08f44-899d1f4aacemr62994346d6.62.1772222761754;
        Fri, 27 Feb 2026 12:06:01 -0800 (PST)
X-Received: by 2002:a05:6214:4116:b0:88a:2444:36e1 with SMTP id 6a1803df08f44-899d1f4aacemr62993776d6.62.1772222761247;
        Fri, 27 Feb 2026 12:06:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bc9fd6sm155281e87.35.2026.02.27.12.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 12:05:59 -0800 (PST)
Date: Fri, 27 Feb 2026 22:05:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH 1/3] arm64: dts: qcom: monaco: Move eMMC CQE support from
 SoC to board DT
Message-ID: <nj2h4tp2w47xle45ouzvvn2mbfpqbdii27stp5wn3cv5vlv5ab@4iq3qn5ukn5p>
References: <20260227105055.2364348-1-monish.chunara@oss.qualcomm.com>
 <20260227105055.2364348-2-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227105055.2364348-2-monish.chunara@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=C8jkCAP+ c=1 sm=1 tr=0 ts=69a1f92a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=foJT35fSmds2pDCHF_0A:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: uuYkAPZVBTYWDMIFfPhp6iTGxKKNIqv9
X-Proofpoint-ORIG-GUID: uuYkAPZVBTYWDMIFfPhp6iTGxKKNIqv9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE3NSBTYWx0ZWRfX5tDD+8Axdatu
 ooqoJmkurbMTb6BIHZgyvd0SFYOTrI2DNA/1DHYkbWjhhLtzMfBMBmz8YAzrZQOV4ZRewqAg5F6
 q5K4zeQZZMaRrGonY9HPtInrfLiFG+VQ626bDc+b4tipWkUz1nAC4FtMWYRe0dZ/V3M47sqvxXo
 cLAW8mkYt44JDDrmwIuWKtJygSu7gEjdHQhgEalfijFG3fs4x9S+eUumTs+Vh+COm7Waq0YFCQ0
 AqL4MCcm/9+SBQO5yewKawQIMYRPyGF9NL+6iXXnLfhVOsn3/Bai0mv82q8Djy4SUceYCJFhgCR
 TZ6rGu8k2SYWQB9ScZe460z1K4Vlv3F+Kf3lNQrniHADAug//lQFcVvZ48BOLEgrjd854JWwNzd
 W17KxNyVtp+RWQDCstEV0cWkX23lz+KItypP3C2FL8EdQdoFenDR8gGPDXwKiiuW4Vmy7++dgLA
 Gpj+80D6FXAIj330zQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270175
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94526-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 13A401BD357
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 04:20:53PM +0530, Monish Chunara wrote:
> The Monaco SoC SDHC controller supports both eMMC and SD cards. However,
> the 'supports-cqe' property (Command Queue Engine) is specific to eMMC
> and conflicts with SD card operation.
> 
> Remove 'supports-cqe' from the SoC device tree to ensure compatibility
> with SD cards. Simultaneously, add the property explicitly to the
> qcs8300-ride board device tree, as this board uses the controller in
> eMMC mode.
> 
> This ensures the SoC definition remains generic while enabling features
> correctly at the board level.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi      | 1 -
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

