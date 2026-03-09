Return-Path: <linux-arm-msm+bounces-96368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LoCBUk2r2kPQQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 22:06:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A4538241527
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 22:06:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 14E103021953
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 21:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17AE33ED126;
	Mon,  9 Mar 2026 21:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jhbmR9Nb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AAHURRJt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F9F3B7B61
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 21:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773090373; cv=none; b=XipyDIfrbozSK9W+/HeMiKt0g10sKBJFVLz5dFBYmkJvLBTbQT+ZVjAMDBtVhMEEZqCb8JyGW78MK7CyYAvuZRTir4nN+5PLLGjXzkcuhsWQlq5qlQl8fnRDHtrahSEche5tT87QsBZSxL/+Gj10VYR5kKPkO1yxEcOFGkZsVbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773090373; c=relaxed/simple;
	bh=xaEeiX6OmsoumLdOC5tJ63/jO1CWQAAlNzVa0vnV+80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7uLVrTVrMqnZtF7wsr5CVxdr4cJtRUJ6PEAxbmwSu7oAh8fg673EyzUFNhsUEGHXSwzsBNTKgAcjA7/TQO4Zru5OSnhtrTPewitPTjahLIn0NpJs3MQbCl4Vp0W38nsIZQ2R3IFcUvMVm87Xm2bnkW5jnGOpUn+rQ5dQSgb+FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jhbmR9Nb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AAHURRJt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBidV859327
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 21:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n698Dyj5P7b6CPLnLLa4Pbha
	fMLunYH5Og2awom7UOo=; b=jhbmR9Nbz4D9t2k9X0lvO+UqzQczbJ27xXgVXtPS
	iaqkraQKDT6PB4F9YXFAUMEAOsBZfoKHomja+ga4gzop8yQPWYzKerbwz+MddKMB
	LqPbvupPSkksg+dzVccVZuvVFCQnZUDRjhTRvOIxxD3yUSxr2g6rWssDLx1YBvaS
	9Nkmq9JVLnzxQMEGpyeqzTwlJT2Kzcfc5onoEgUgr/Gsqp5U28G1GkjTHhQ7rctM
	A4K7WmIDQTXSKIcHd8iSFvFbrFnE071C732ChnTmQ5rcZ56YCAXon1DHmkbzPS9v
	VvYfXQM6laGa8xWDsypBarzqC7nxO8tPeCYDNEPjHsLI1g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyhbscvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 21:06:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd83cfb36cso1188706685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 14:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773090370; x=1773695170; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n698Dyj5P7b6CPLnLLa4PbhafMLunYH5Og2awom7UOo=;
        b=AAHURRJtZL+xgojYBEH26JltK2qWeptIFMM+S4bcgV5dk3XcvSFi0MW44Zf9IvSxMF
         C1u4vM3wrMbLIrEFp+McU4KuQOXKXso27Pw4f25D65nh/wmLR5iz2/MgwkxD8R3Zd+/8
         JGnHpzth783pWgERPeZ+XvjEGo+eGqJ8kWgxTO5b9Mq7Sm/TAApN7Y2wf/tbQfA5nMUs
         /kC9/seBMQyC/BvZEbV9dCglcK0q49KSTiCOBPJQVLzijNiNgBu5k33bFkibFr2twL3O
         MABEM9m0BgQB3YB7Av/O4OYvXocqCessj7mvB4RNo74Z+l3aPjvigDOqLOGEAIG782Yw
         YDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773090370; x=1773695170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n698Dyj5P7b6CPLnLLa4PbhafMLunYH5Og2awom7UOo=;
        b=JmjXhM7vyKOd12GU01OV6Eb4Lw+3lWZA8a/VEt48VoBoH4vF/NhBY09WaQEy7RGUdm
         AxwlMnckhmDBDfM1s6vRh+pRYS9oyiu1rk7fuYCCxLj8L6JteJRnFvQHy0raW51a8bvS
         ythQvzFM+o5crPMRtOSUUPBFC2S2ym11A7OwyWfh3zfrukzOeWMeKhT2+d+j3rzkkOMT
         486WscC8B66m95xnRMHPwww2GtwvkIq4WxLoLb+3/6Ae2++ga5xw0exZNB5yV6G9TXr9
         L5NSXfiuss0lRi6WENKL7M0bc/NoQWTzcZk1bQUXrKy1MXszQDgTcIpuj/pnSInXPjFV
         Iwvw==
X-Forwarded-Encrypted: i=1; AJvYcCUFi5vy7NyCviD+PezR1F+MacVglb8C7RqASIVcPgUs8W0p1YPvnHd8cGCOgyI+oW+fvaM0wcUtSb5VDhfx@vger.kernel.org
X-Gm-Message-State: AOJu0YwaXnPzbZQp3UdQBRuExNrRvVq4BbKftNuk5ajOXH9+g4p3rkR3
	7AvPawW18ynFnbhYrb4tddtYKnVmk8Jy6q+7+3Redn0T3j81BgUUf0cnruj4FCofD7MPski1Z9S
	Pdgt9kIqpru+6NvTzIjB2mZbLgTcJb8BX/iFhUnWC/lQUZ+HKc8Z9rwrLoEUSZwpcG5F1
X-Gm-Gg: ATEYQzy0ihuM6bqLJK/e4MGVKtHRru5CIQrkfUbCIhyxW6o8D5eYqJgKSaCcVrZepsX
	w/M+0XrElCnebT+q5sfUMOE0Rxs3WR+48wD921N42E9dM/PMTw8tcT9GsNvCrvJPvxUdslKmmii
	yByWBks+/35rQrY+jTF2ApGGF4EaFrFY4QS+YcfWU1SGzbrRVk6tHec2ldM43b+smhxcpahh9I6
	sOTNdqFSMcwpFQjpGEpoSX38YUfcDDPtB/DErUrLS03/njOjZnVQ+iBP8Rv8H4VPesPZw9jeB+x
	mGOzCqBuIf4ryQo51jf5u9VsmcLaksl91ovzLaZib9VT8Cb8mKxd1ZR3vMZNQV65/z3gH5KMVox
	fySC7rkQCwyenyRHEyq1FEIrtS1uwbKan5/QklelcOvAEUcKHsLm3n+hWpxg7z0KlD+JMkNhImh
	pTX4vV3hK4LkJM83nU1DVUs3nAqwXr20IAlHo=
X-Received: by 2002:a05:620a:319f:b0:8cb:66dc:9fd8 with SMTP id af79cd13be357-8cd6d46b265mr1656312885a.65.1773090370109;
        Mon, 09 Mar 2026 14:06:10 -0700 (PDT)
X-Received: by 2002:a05:620a:319f:b0:8cb:66dc:9fd8 with SMTP id af79cd13be357-8cd6d46b265mr1656308485a.65.1773090369630;
        Mon, 09 Mar 2026 14:06:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d07e16dsm2298947e87.42.2026.03.09.14.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:06:08 -0700 (PDT)
Date: Mon, 9 Mar 2026 23:06:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        ilpo.jarvinen@linux.intel.com, hansg@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH V3 1/5] dt-bindings: embedded-controller: Add EC bindings
 for Qualcomm reference devices
Message-ID: <6wim6vo626jy627k32nlhxjd5dh7cvvwxraqyv7uujfgbo5p4m@cesxgplycnpm>
References: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
 <20260308233646.2318676-2-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308233646.2318676-2-sibi.sankar@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Rcmdyltv c=1 sm=1 tr=0 ts=69af3642 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=4Fh_A_dtJNkFtXRpuoYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4NyBTYWx0ZWRfXxk9PLtICEGBY
 3H0/RPeaTUcvrYFqcC+7kBoREKA2hr4rRWtF3dDGYqNN9+OrXsLRCYg0+3vYb4QrqpIwmzjG9tQ
 PQEtKdA6RpUnk5fUrdM1LwesmxId9xruwk8kIrljsNkPp3PfOGQNte/Tvm961R4wN9DMhHUZO7v
 zJ1QI9Zf1BQXVOvy4dE/8LWOQ5s9nArsxWfhE5a6YAsyTgEDWU/o3e0RxrbVw8irIlZtD1HIem1
 lLR/mbM86fsucGbmyl9BPByxG+PUOOsYRwQFOErnpWimETP8UGa6KaC+WDFUfYrEPkL+ZW6DSJ/
 qOX28ICPSVwBw4t3r2hO6czb/YUkV4WVmdojPP4Zyb89E4oteU3apcTD9wg2miVNMzieGh4BaSt
 SwlRZ7Qgex594R++hsOJO2b7dJv1Qndicr/4oj9XWfHVgz/aztd/EvKBtPa5M6xGFEebZPkpo+3
 xTinzznEbEg5fJdixQg==
X-Proofpoint-GUID: bQ-l7NPDuiY_QiqSb9fO17yyzkeUZti7
X-Proofpoint-ORIG-GUID: bQ-l7NPDuiY_QiqSb9fO17yyzkeUZti7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090187
X-Rspamd-Queue-Id: A4538241527
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96368-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 05:06:42AM +0530, Sibi Sankar wrote:
> From: Maya Matuszczyk <maccraft123mc@gmail.com>
> 
> Add bindings for the EC firmware running on Hamoa/Purwa and Glymur
> reference devices, which run on IT8987 and Nuvoton MCUs respectively.
> 
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---
>  .../embedded-controller/qcom,hamoa-ec.yaml    | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml

Looking at the DSDT database at [1], several laptops are using the same
protocol for the EC. Do we plan to use this driver for other
Linux-supported laptops too?

> 

-- 
With best wishes
Dmitry

