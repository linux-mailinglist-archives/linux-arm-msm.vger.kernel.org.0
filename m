Return-Path: <linux-arm-msm+bounces-90263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPsWMtiEcmkrlwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 21:13:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B7D6D5D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 21:13:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A40E30180AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 20:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8768E39BA48;
	Thu, 22 Jan 2026 20:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HYJyEqbH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WoRs4avW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4869439283B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 20:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769112783; cv=none; b=gEvg4BSTmvM6othiaEKGEukEuWCcdFWEUaoUdqhs8Boky2u+mgdEjF/YwgVqw8YJUb1jU/iMNHSeZ+67oDUFkhVjSaCAWq4fxhozQKMF1GZgY3UpRkxgEfWYSNOB3hby6YTTiTNTKRIs4qDRgvJ90xlb9McTkTXzKHoqfc7Oh8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769112783; c=relaxed/simple;
	bh=kETdlgq3mRj2CGYHfDUfs8Gq8EgqBAAq6aAIipvcOaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LzTmnyI8SOIufiKzGnOVQqzwxIScQWSBhjkhIaRNaWOovEW4GM1ID8QMyGnStzirsFT/x3PoMYdDJPdDGR1m6w1fIwD4eVZHbeyxXZuJZrrPpiIFH0K5wFkkwL4B3trwZKaZwo6imK9IVmb7VSX0pXy+ji//C1+sBCpMqYNiZag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HYJyEqbH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WoRs4avW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MK7QtX3677732
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 20:12:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SA1JXQKeHjDTC4DubGlj145P
	/VFCD04yuCXGDLkeMt8=; b=HYJyEqbHZG/PKicNDO+0npA72awEEQ8KBQrpQRyK
	6lgFJ9FS2kVihGkXicFcbntOu7Ra9Hxs0icureWv8IVP2yKfYowYBZtJywpBJUdH
	2UNbYFCNnZ+ZHi1NUD1KfvVkKwWB25+Cpz5EWRpPWBUIZGKQYgL+a/YUDqji+VWY
	orWZYK3zNEWX17XCpVNmLHX7YrrFZmBSolxF1HS90BqTUJ/fKmyi06cG1z/tQ/0f
	ND4vPZI+NzEbavI9296Bo77sbURK0PTeZCyySTXJ2FCfSeVOa9KI8gV7f0SOqrKg
	f2vj4scj0FkOLDpI/jZhwKq/gT5HoX5ewcSa9Aa7r8myGA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buqyp0md9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 20:12:53 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5f53259a432so2784787137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 12:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769112772; x=1769717572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SA1JXQKeHjDTC4DubGlj145P/VFCD04yuCXGDLkeMt8=;
        b=WoRs4avWtaYkQ3HE1xa9puap6fMjSMVC5MyWW2QW4gMz2Yz4RU5FefJNjWhTlKrbx1
         q+FA0E/qHEeWwz4Bpbe/8UiMkitngdglAmvxOCK4YtJFnTwxXs7TKj8uBvhq3iii2nmO
         YwGRTrlr/St+d+9zm637OoxsiPe9eCuME8hD/kbkowlJcQtL5CCHC5IkXtGUrvFiaWMF
         sBB8LS+uTrHcPBZzhTVp40MYdkYUWw/r3133jWLmDw/dQ8uoZVKhEGpx2NJW9UvCA7V9
         jsbQZsUSq7vBvRCn6HtGT8c5qkk6fAMUIF6w6H4Bm2jXe2JjvwD9FRDmMFpk2hJXAZSL
         khOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769112772; x=1769717572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SA1JXQKeHjDTC4DubGlj145P/VFCD04yuCXGDLkeMt8=;
        b=LZE1q+fgygkEniBKaNlUemOr5zqdHd0KC7IJsV6TkLM7s4TI+w4BQt0vM5JtneRL9k
         6VE+N8vAF1sicC2ngWIB/jcdQm7lZL9HadMwka1k2rpxNbG/iPkbVNFcKzu4BYkVhxDM
         uBrQ4ZQ5s2321YxWMgc1hEae5ux/nmXe4XTREaU97NxFMG9DJHF09bRvYq9ovX+4c87v
         E1/jGJ4TsNwOhX2ZNWQ+TstiLmPSPeDOmaF0yRz9GP33UtDdxXbKzcfJH5zJ77bYjJbG
         3IpmNFHjC7zkPENMVehZgUibvdIecy4broywdRIBA8o2DhGqns972QHTB27UX/WQJm0u
         ExKw==
X-Forwarded-Encrypted: i=1; AJvYcCWg0TjvPwWT+gOUShkGxBINjVMabd0mGNJlpE5yG71iT4UlfY3MPawQ7eBUNxZSFZ24C9bwgMzIM7gS93e5@vger.kernel.org
X-Gm-Message-State: AOJu0YwcbcsltqXumjfRqqw7Kl7NTgAuFEhcftH0/iDkQ0kV3DMRBIzX
	sXqOTTz81Eb2kwH0WIg3LVwRs9vXQZoL0AhamwoNsKz8jNa+wa3YTHjNj/bF1Az/zuWf4AbOOtZ
	w+cWEQRi0Aq+d8WZBSdcjhvEOGp+S94I7QukjgZTFWSb3wyn6hKykBzCZ3xxtk68SynWv
X-Gm-Gg: AZuq6aJtXEouzHQd3i6WkYC2aB+teXzFyJf/HpFcUTqmEDvt0vm0x+GJPMYmEhlb/vz
	qjWtO5xY5gfbw3r2Gwl8YLF/DX3yQsk7qfjoCocGvIFNl3syPt4KKbyJ+TPaYrheCqwckEwuqml
	KpcOuj0HMhtMggst/9BH8zEw7sMD/NXscmnNdEdOXneIvoFLh+m05bHKxusEYYoeWaOwUkImtMb
	Fc/U75E62+XFnAJ2l2N7IQ3kvK9woJ/rRMjys/Xy8kkF8Jh5COx+JtWMdZBQGZ4rbCEv4KxeitW
	DxJlxbMcq8G/sG43w69w17K6viL4671fT2/iIk/oVRPZlyVz4cWRoa5dA3L81QxDZPKfkE+w+Pk
	BAbiGa+SaWGx7GtcbHdCMRydBctWXFENcPOrxPNZTcCFXz1yKcATdw62xTsUrtYyF2wj3YoXxAE
	3ZCskVB2DroIOKq7J4hn6N9dw=
X-Received: by 2002:a05:6102:32c5:b0:5f1:9641:4f4e with SMTP id ada2fe7eead31-5f54b9dac18mr306681137.8.1769112772392;
        Thu, 22 Jan 2026 12:12:52 -0800 (PST)
X-Received: by 2002:a05:6102:32c5:b0:5f1:9641:4f4e with SMTP id ada2fe7eead31-5f54b9dac18mr306677137.8.1769112772001;
        Thu, 22 Jan 2026 12:12:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de4918679sm115343e87.63.2026.01.22.12.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 12:12:51 -0800 (PST)
Date: Thu, 22 Jan 2026 22:12:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Georgi Djakov <djakov@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] interconnect: qcom: msm8974: drop duplicated
 RPM_BUS_{MASTER,SLAVE}_REQ defines
Message-ID: <63n5yafjvmq5mwqowokh5ecobi3zbzflx73xhheqnwhdke6fat@u7nn2i3qumqx>
References: <20260122-icc-qcom-dupe-defines-v1-0-eea876c2d98f@gmail.com>
 <20260122-icc-qcom-dupe-defines-v1-2-eea876c2d98f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-icc-qcom-dupe-defines-v1-2-eea876c2d98f@gmail.com>
X-Authority-Analysis: v=2.4 cv=RMy+3oi+ c=1 sm=1 tr=0 ts=697284c5 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ucfLbyYKLo5MbnlhLQ8A:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: auB1tJIKoWG27OaNkzQrozbxiLULwsNh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDE1NSBTYWx0ZWRfX3cJJ3qe/FC2F
 wwPnaUuMjH8xVBZ+i9eXoQQvX+6a6NrQPJPbUEBTZudIkQHsY+DHjNcdrjj9QdwkSWYDgpK5jFl
 fpNn3GmnF5DTf17k83AWFxLPxvTzXF4btWEnHHoxKGElXjZXbVt9HWLXZMJphplOqz9PXeMDFnL
 H8O1Yh0Q4rzmTbLxftp7048K7p7MvUIkfP2IHGM6OZKOh8a5JVDZG7fkDzV8I0dACL3TSEmxEmw
 fkdiT5YfsV0KtyXap0UOMLJfkZEiy913qyMgDV4Llgol3gqLcN9c4o0SUA9mRPhfsRPZCQdRXHR
 B3NRWaev6YhNBkUsWJf5bSYEBpsGQefC0mpt3KAtBkrNo0aNTbRxEPvhQ0ek/WOjk3h/isrw8rh
 o+tkugt1GbKrkoVsmhej+WHUUPFfKsPPZqSQCMK+QUWQxA4VbXXoYRWgm6LzCMiT8p54plvSX8a
 ZuddvGBcl40XWFws9OQ==
X-Proofpoint-GUID: auB1tJIKoWG27OaNkzQrozbxiLULwsNh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_04,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220155
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
	TAGGED_FROM(0.00)[bounces-90263-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 28B7D6D5D4
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 08:34:23PM +0100, Gabor Juhos wrote:
> Both the RPM_BUS_MASTER_REQ and the RPM_BUS_SLAVE_REQ constants are
> also defined in the 'icc-rpm.h' header.
> 
>   $ git grep -nHE 'define[[:blank:]]+RPM_BUS_MASTER_REQ[[:blank:]]'
>   drivers/interconnect/qcom/icc-rpm.h:16:#define RPM_BUS_MASTER_REQ       0x73616d62
>   drivers/interconnect/qcom/msm8974.c:176:#define RPM_BUS_MASTER_REQ      0x73616d62
> 
>   $ git grep -nHE 'define[[:blank:]]+RPM_BUS_SLAVE_REQ[[:blank:]]'
>   drivers/interconnect/qcom/icc-rpm.h:17:#define RPM_BUS_SLAVE_REQ        0x766c7362
>   drivers/interconnect/qcom/msm8974.c:177:#define RPM_BUS_SLAVE_REQ       0x766c7362
> 
> Drop the local defines to avoid the duplications.
> 
> No functional changes intended. Compile tested only.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
>  drivers/interconnect/qcom/msm8974.c | 3 ---
>  1 file changed, 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

