Return-Path: <linux-arm-msm+bounces-93203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJoGBviVlGneFgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 17:23:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A8714E19A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 17:23:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E13A53006217
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 16:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE2436E495;
	Tue, 17 Feb 2026 16:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZCNW1L6Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b98GKMQ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3BF36E488
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 16:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771345395; cv=none; b=oLakOur3EoDko1Yf8lL0Nv4SkJZHjuReilhwPvP8yygqGZBlzjwgTWlaJ6xdZfVR/OCAbkQrMRWKJzt1Cy8Tp0Z4deUWlS3Hz0F6Dgz/Llf0weHg9urp0ss5boe0cA7NyLAvLiT410CYTpnSAOi1oVxqDebFZUpkXHWH46ZPlCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771345395; c=relaxed/simple;
	bh=huPv1Rq82ylXN0CnKmdOpk+HRnSzxJ99NW1Era5l7sQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKkmk8GHvvEn6FSxrtGc9VJbFqgkFSWbS3VgiLmkkKXRMvPQFjhcPJ26Eg/5hCJ0dRdxjtr1jFeunps1GD7CC5bfLouHlIDCPIwtwqmrSCw7eeQbM9MKSiwknSEw4DcHAVlIcvZO90d/WU61C1xji4XTvhuG+nEHdjx8ifpOogM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZCNW1L6Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b98GKMQ2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H9Gq3D1545000
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 16:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M+8icpgoWecUC2cZa/Z4FLKT
	WEtQIY9I7RrykM8WNkc=; b=ZCNW1L6ZwI+JqjXAx9yq8205HD/tBwWorsrrKWJy
	8tw9/HKp1dqwufsf0zjCnOJ5nqXom2blR1+n2rKG1NMPjk6KQ33f7qxJhztaNVh9
	63PZ7DGT+Z15JpqSQm7fKVceA19Cd0mtjXdFShJ6BbIHQeahvpkI9y1TDmuZUfox
	LSzLe1iJbu2KVhaCKkydqF5//g6Iaf3mpr4h4PrK4KTqjHLM77st+Cmj65H9Dkp/
	KG50JYVEXwSV5B7SDpLAlX6K7BgHwk1S9sCYERLHIhQFdRrsg3ebNSjbin7P4hBO
	jTqVjoTwS9Xk/oB5i0cHbiQAPSrnlsDsrbInqShSYiU0ZA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ajtwfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 16:23:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3ad1b81aso4455131885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 08:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771345393; x=1771950193; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M+8icpgoWecUC2cZa/Z4FLKTWEtQIY9I7RrykM8WNkc=;
        b=b98GKMQ2iJ4O7fz691rKSqOdLMIedlbyLL161SC2yZWeEgzJntbUBboEdBxWIVt4lN
         DJzToKBHJ8XwLUGsHwxV0YR2NCjsNB9gcgg27oxKRegqci9JHsQSgnH9Rpq4BlxGjE+c
         MUkLU0efW674PFW29nkAVPuKaSfZYG+gbMrxnvvQi3k9R+fmuubQBpuBMwfBthrF0mCl
         GEWsgsmwnCHBytQY6bQz4X5WdfztcA2sI4J2TRdTn8Ddr4+3CQ3CfLA2fouTYQiBtpkX
         GA5XIZ9jxENQGpYVxA3GyHQ8FfRENwJq4oGeKI7InrhSJzMWTEC4CpgggwIUPFw6GkgD
         LjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771345393; x=1771950193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+8icpgoWecUC2cZa/Z4FLKTWEtQIY9I7RrykM8WNkc=;
        b=CEX8mhBN/LIIGMiMGP47W9iTi3DtemmcWMjPmCdStqyzcoXNxgi7jTJL5bYwVNYee5
         8cWfWmzXBFmxJ9wdCMFsncSooRYBqWp3ZzPrMuvMImejMFkHNpmVNmJ2Y1YIsVqChl3r
         vUVHQPbDd3Dg0JCg2BkvmB4HPOY0MOJNzTTXtfsz5sRU6BTmh2nfGPDF8sm1qJEdjF7W
         QxoKWMkyfIbmImU6MVdm6MnxR5LV1qG8OmewHuK9lYFkEOrfkyDBWRZ44j2+mHHp2VfC
         aFnE7CEFFs9O5MkK392/OTFKJdCdSbRgwShnTUgAZjwuLzd8Rck5u8J0ti++602UWIv+
         oueA==
X-Forwarded-Encrypted: i=1; AJvYcCV02b5N4x3m/DkQQFEmixIX/PlU/W4PDyCGPdyyvZl860RxmIHLcTIV+RhIQgAYnmU9fuObnjQVjGx51mnq@vger.kernel.org
X-Gm-Message-State: AOJu0YxRwE6mN6daeaPrNM1rP1AZnTkasAIsMjv/c9QirHGVqsOR3wn5
	l7Px4+BIEP3CmQLmobA323WMtPhLhpcOIDl+LGG8G8mLs2amkdjACxv6emm7w+JzBsWM/0uZq7m
	56UrxQNoHrWaY/rn/xz6Z4uhDSk0OHBhE4PjrJjbyWengn6xKwNsy5dYY5fMh5GkIZEhEdvYRAY
	RH
X-Gm-Gg: AZuq6aLcq7nkVkTQqxmaCzSeUaHYm3fVKcoiSWrBbFDdzJaf8RX1RjqTOv1qG4dx+9f
	Eb7o72a+rWFchjaMKGDjpJet2ugtMQ3G0HgK3g5g3vioFTCRdDGPDnuEbCqc6xoWbED6YfMM119
	SB7k3KHX+t5tUQBO2lBwICdPA+MHd7/L6jC1Iay3GcKMzMrkyKqICN6kfPSySFZ71j1KTHdOXEL
	DCo6Xu/QT6BuhLXDvIwVW4QkqnyaPQwVHWnT+e3mJIrZwOddLgeRAycungJ/Y1FFBM41KoUwio0
	igQ8oTuFhv5jQNlw0f9Q4iUUiCMPTM3tFuvBfqkwef6YmrOV6CMeZ+DpHjAsMXMqx2cV+DHy+Z6
	0soLwkAOA24l7gTZk8BwV/YBUmRia+zy6vyxPRsOI+BEoljautW3xRtM2A+ZxRdsC/gb9PUaDn9
	3/EW7YPJyU8qhQ13mk+h8jn0je1GRYyMILBKY=
X-Received: by 2002:a05:620a:1a04:b0:8ca:1240:4990 with SMTP id af79cd13be357-8cb4c041a5amr1410691185a.86.1771345392832;
        Tue, 17 Feb 2026 08:23:12 -0800 (PST)
X-Received: by 2002:a05:620a:1a04:b0:8ca:1240:4990 with SMTP id af79cd13be357-8cb4c041a5amr1410686585a.86.1771345392251;
        Tue, 17 Feb 2026 08:23:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5636b3sm3847209e87.14.2026.02.17.08.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 08:23:11 -0800 (PST)
Date: Tue, 17 Feb 2026 18:23:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: qcom: De-acronymize Glymur SoC name
Message-ID: <jfzhybhuh5doxxiymznhizrsqft2ywrtfcpuilmsz7gumsh7h3@o5ocoxq2qkpd>
References: <20260217130047.281813-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260217130047.281813-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217130047.281813-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEzMyBTYWx0ZWRfX3ld77Cw9esJ3
 0f9kghAugn9DGkmo3m1KHLK3bgT1ePw7Va2Mbndc4GbWkSRkNmCoaE9qjTbktUsOCkHbB8Kq5ta
 /m3KyoPn/5WnFqSwrEEts7//7n550vI+9DMvG9VL6fJwjVitadbc+vgk/380MK7h9+R+DKc8b7R
 9Et/mUhYCENih+1IL3CrVbvW6x2EnZ99BI8+0VPqrScldmUPOWodzVOVJG6Sml8kycOrxVPX6e/
 ST+LA4Ekuj0jd7JE72rvAtDmz/wCcAQ//iccn7uC0OG4Z++GBy4t8bh5RQ8B/tJMaSXmtuBSUoI
 FRb0SCnGc8qUnXo0APjyOc0Ep7ufmqu+CIXy84TONXO7IKcKcGIRcR9TnBqax7jjFrCqiplbhmx
 2uQDu23F143ji0eeY88MgWfA8+UapnS5+QOueJ2WGz6Nv+ADNxBzVxoBzc+erIeZs72kzmlQb2v
 1SHOguCcYpndieonzVw==
X-Proofpoint-ORIG-GUID: Z_TLAqS_P_hpV5Kwei9rrm4OwkV8447y
X-Authority-Analysis: v=2.4 cv=BryQAIX5 c=1 sm=1 tr=0 ts=699495f2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=Rh8BIR2qzSpX2dRZ-WwA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Z_TLAqS_P_hpV5Kwei9rrm4OwkV8447y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_02,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170133
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93203-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 40A8714E19A
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 02:00:49PM +0100, Krzysztof Kozlowski wrote:
> Glymur is a codename of Qualcomm SoC, not an acronym.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig         | 12 ++++++------
>  drivers/clk/qcom/dispcc-glymur.c |  2 +-
>  drivers/clk/qcom/gcc-glymur.c    |  2 +-
>  drivers/clk/qcom/tcsrcc-glymur.c |  2 +-
>  4 files changed, 9 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

