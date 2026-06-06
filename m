Return-Path: <linux-arm-msm+bounces-111492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VXRlKoQLJGr/2AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 13:59:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F5964D4BC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 13:58:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GCfvyYzI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=f++tpMUM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111492-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111492-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BEB53009F84
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 11:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D2D36D9FE;
	Sat,  6 Jun 2026 11:57:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBAF260580
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 11:57:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780747044; cv=none; b=d9Y7vnfu1UpIpHqaFxC5gPWO+D6L0i+ugRMB25BSeNeWT8iVwNdxerv7ZMHg/JyI1qGvtQNe7VbNYg7weaxA6kZNcs4UmcqfoIV/1cq10YUBlwQHAa/JQUaIipUB6KyLlQiePnXPg2zSEDMFKQT7LZPVJ/hVSUwjNP03HN0UngQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780747044; c=relaxed/simple;
	bh=waentt4KdOym2AZ3UJsiVMq3XU727IXciRZfMq1s/E4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UM0FenOwWgWA5yG1MsJieVBG5aWUswcied9Ce9qNa4wiN2IQwg05RpszlywIKGKabE3Zobsa61jmdVMvZECPUo8kfNBaj1oBMSJKa3HVrXUGgUivUkfQbq7bi06EgdpRASwbWWYopYYAnQFDDupJ6rambta/3/wEzfRkbEa5vl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GCfvyYzI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f++tpMUM; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BEFCW1280392
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 11:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wey/tSMTRv7+4E+9tdIhwUzz
	H5WVe3KCUdKb6rs33XA=; b=GCfvyYzI9LedX8KY+DsjhJmlSx9hqQ/4EuycW68N
	Eki2VCs42WH24iqhUIJkDHrWxbzzw7UQFAzz5rNcxesGFCVLAIDk5lqUw8MIeX45
	3cBc6qqs/lQRIutv2dpn5m43QARfk0JwCwWqyDevHjijZIgd8+KSEN2GlAxDenXs
	WVfXxs2B47HS6JISUFC2JyTTAE1k4Kz/pKpYft6grMsRsuoqtRSoRG7crM9OWW+3
	gW1R9RXXvJvewmMjcbDO2KkBscrGUUCOveCKMlq0sZoQyz1quTmrMj3b4IJZhdkw
	mQW5JjZ+lQBpik3gIoFQm1Ss8Kdzz7dTKwf3ZP02DD2kQQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagr990x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 11:57:22 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6ce6f8465a9so3449175137.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 04:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780747042; x=1781351842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wey/tSMTRv7+4E+9tdIhwUzzH5WVe3KCUdKb6rs33XA=;
        b=f++tpMUMPoTPi5E/QFdQ5yDZfbprjmigPPKkwo+KWgz1SejX0rgZmjfvm8H1arKirG
         JfL8C8j/sPCL5ef0sLgxU9OGi94uF9aUF+zpnlOi/KxY6pRX2JT2bO5iAP23b3dP/U3x
         uV12USXE765UwDdCeYeXCmYfx2FUUCbAHqB+G5lv5KANfNvRPzb5fNQIhAguLoF/WA+U
         1yC5oPK42B4rvBSCEL1bc2WqiKgekBSkZV0VGZMo63T5zh/FGftxEptNvVf4cc8rU+aI
         6yo5kPmZ9wQeLCrYgrOpUamv2foajIujCOMyxllFqj8BkE0nY1OgQHJLYmBZ2zpWTRaw
         9cGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780747042; x=1781351842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wey/tSMTRv7+4E+9tdIhwUzzH5WVe3KCUdKb6rs33XA=;
        b=kpElvzQkSAcUBxwt1WT0cT0zcTNR6Uu97QHxec2cUw7wp0pN6FqlpM1dEFfp++gWBI
         yhdB5V3oGWQC1t1dBRrWqP9DU3GkD6snzlfC5z609njUHEumNt3aklb8i8Fd2gptAhbB
         3a55CaKAGpA8t9djcdASNXKXsAZ55vTmSxfzVLz2ijKvU8C0KkM6TnebvGw5FataOZe9
         //MvOoJf0n3++BEXF94Kc1riEzVXL2o+rIAl4dotrVM199huVIwRMM55cy+EkCvfeKPO
         yJgMfzeVEOpF54eqJiIuE+2dxVfnJTuWLzXmC4+vb834EcYFd0lQ7c3xS2qQ0rvVxjVh
         8n2g==
X-Forwarded-Encrypted: i=1; AFNElJ/HSb15Da497gb+huWTz4bdgHYyz6Sg1hY0sJiwIhVMNjRbWYiVtiD9JS2WfsPR4a3GUoZ8Yy2Ppi8FaphP@vger.kernel.org
X-Gm-Message-State: AOJu0YwzFGb+9B6BLPUpgS/kx3akPODvAudTD1Xr8FiUJw3BwExNb2nw
	pG6PLsQw/BVqFfGjSxOridkowwbVG46GLitRVSKogKRE56WkP43fgALoWDCfUlYgZHmmfu2Aysp
	M2+uhdWsyhGPCq0hzwGRPnFwweWHqer5hN4aEubVIlMkNykc8MIbk+6wUwpQOGGcHLm/I
X-Gm-Gg: Acq92OG7XiPNlcWxbzg+POsSvB2Db8B/dxIXlzp0+KwAhF6zl9vIxvL2cy12rqvIV7Q
	6xFHpo143rUtGMpRb18yM+5okbGYSwLkY/MZyernTX2LQ9+s0HODkc+CIhSrggqPHdXpIHUttZJ
	kRT1nqlQAwpd72c1Pank+8SINqAEfL/JTcyYlVxuQX/k0dx3kDCuwOsSR/tr5RgiljtohJ180dW
	dJ26hR/Jw8NJL9LfXcKzmox4hoj0HTvUwd6rWovE0JlaG2LSqtCh3Luk1Baw3jNPv0CxkL3TeCw
	peoUzsHoDfVrJ4fKb5N6STjmDycjcHosCvN8K6wF5uFh2ct2fOSFJqr8Xw9hHjwWg0z5fceheSZ
	CGsPSLiAiWbtVuNpWTGQ3Hrbyot0Jvwle33lqDJa7ZT1yqgLBYfxmA82kBSHhGa7PI+GMvAiB/Z
	qJha8S/YCRLTeG22dCfT/1ie92OnJ2K1qgO3zjI/Vh09c+5g==
X-Received: by 2002:a05:6102:6447:b0:6c8:eb6e:a078 with SMTP id ada2fe7eead31-6feea045839mr3844005137.0.1780747042050;
        Sat, 06 Jun 2026 04:57:22 -0700 (PDT)
X-Received: by 2002:a05:6102:6447:b0:6c8:eb6e:a078 with SMTP id ada2fe7eead31-6feea045839mr3843996137.0.1780747041664;
        Sat, 06 Jun 2026 04:57:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b99ca90sm2474531e87.84.2026.06.06.04.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:57:20 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:57:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: webgeek1234@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Teguh Sobirin <teguh@sobir.in>
Subject: Re: [PATCH 2/2] soc: qcom: socinfo: Add CQ8725S SoC ID
Message-ID: <aqjyspitfk3xqb3xorae4upqrdx3whg7ficlb6p4uw3xowoobc@ccdwxeetaokn>
References: <20260605-cq8725s-soc-id-v1-0-bb1ef93de649@gmail.com>
 <20260605-cq8725s-soc-id-v1-2-bb1ef93de649@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-cq8725s-soc-id-v1-2-bb1ef93de649@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExOCBTYWx0ZWRfX45b7CAuc/cHk
 c2vuyc4KJqzQyyUW7QVEQt3EL6Ajq+RbbQRCr5hdz9OLWLODho2MjVq769+8AyYrYzi4QxDKYKb
 1Cwkg1mcz66S60KwE4Hqq9XMna/6xR6Er4j8i9IllTPSii1w7GpwR059krpiKIJoCUDwz3nBzEd
 cVepJH6DUAM5FZK+WslOqB+DER6oSQKKQBRHpVQmTsqRPUPmyKnZ3iOhgh/2OcMJZSUUn3K0+PD
 I39KKfEwiPVrYQqEU5mNkA7TSBuHrhzIqONet3ZYbsa1j80zHQnXz1bRJYu4Bbu0jYCnsCC05k3
 2x/YsGd/UOCXXXxX0bIylItP5CA9y+s+LsZHq0Hn2YSpU5s4cSUSm5TFIxsbHyJO+lXVFOmNTVM
 UJYwfp+TIBI5N41uUib7kkuj9GYljS+VGHJv5kwfOb6J7BpCaL+e+GPDmtsel689V6o0t9RBE24
 V3wsUEnA4SJ5/qXgtWg==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a240b22 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=l1xjegFVcgAHJcQvvZEA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: NqSsie7EybSc_CCWUs8hi5As82Ieorh3
X-Proofpoint-GUID: NqSsie7EybSc_CCWUs8hi5As82Ieorh3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606060118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111492-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:dkim,ccdwxeetaokn:mid];
	FORGED_RECIPIENTS(0.00)[m:webgeek1234@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:teguh@sobir.in,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 00F5964D4BC

On Fri, Jun 05, 2026 at 04:49:08PM -0500, Aaron Kling via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> Add the ID for the Qualcomm CQ8725S SoC which represents the Pakala
> platform.

What is Pakala? It wasn't described beforehand, so please add a note.

> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  drivers/soc/qcom/socinfo.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> 

-- 
With best wishes
Dmitry

