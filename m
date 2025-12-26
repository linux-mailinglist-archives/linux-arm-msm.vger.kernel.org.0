Return-Path: <linux-arm-msm+bounces-86653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 755CFCDED65
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 18:03:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9FF4230006E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 17:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 759AC2DE702;
	Fri, 26 Dec 2025 17:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f2SV0bQv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dj7bvPv1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA88A2DCF58
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 17:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766768583; cv=none; b=WlLqhEmK61fi3pmdPItznh/XheGhKdvwc5rJMXBquAZnVea7abRbT6KcU7dxd1CH1M+5ctrKp8p68jHxVWCwqcmf84oCn7gfTQU0tx+K6Udj0S3ea5sTmW0AtOFMUUBpeoUvibK0vqicneSI1nJYMATvNWFgDuSvv+jztPZNi18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766768583; c=relaxed/simple;
	bh=7oJHaOoVPGbu+Y0koyarmW7MhRopSTjXWtt5TcEvA5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMEbYOFAl/7p08wfLGkU/q8kkrSkwDHvjx8574Xv1hPQ/uYGT9bV4CXQofW5h0NE6zdaxGQL+5k+o5jhysD7Ic8ZDGCIp9e1wTri6p6gW/1ToeDYGNrY+6mBALO6y5DRvayKqXzNjnFvl+Nt9DfnoF5+eZPms5Bak+AQWABNbe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f2SV0bQv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dj7bvPv1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BQ8bnXi1011920
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 17:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NtfH2afvuczdz9DdqWZw8eEZQ6PQp40MM2EwYZTIcE4=; b=f2SV0bQv/V3GfOB8
	bVXrU30EmLjJCJnHJ738WjB2gm88MbDxiTNwEtSNj68vuxA3o0LSnOI2ta4Uq5ye
	IHg6IakAcR2GXY/so2W0Nf7BmDnUd3BFoxYpodYjlAP0Uruu0fn/DfraVaiARxex
	TtooKEfV6WBdOnPH2KR5HARH51uPoZSgtzTvX4n4QYNnMzUp06l7DT58viz0aYlK
	KexUb4kpH+OiflbLXRQCQHyo2zqWlXZg7i+7yuDlxjMorkGael1WQAWjb+cYLxA0
	t7FyjMZbf/5bNqYNqURUYvAuUrYW7tWzh/PJdGNh/vx5fB3+oJrKn/J/iPrPUuVe
	8mjDLw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8kywmatf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 17:02:55 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5dd9e584d7eso13407990137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 09:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766768575; x=1767373375; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NtfH2afvuczdz9DdqWZw8eEZQ6PQp40MM2EwYZTIcE4=;
        b=Dj7bvPv1gpRThW/U3adWOitK1Iv+aXdx7mqW7Ji/HQjXdLBL4gMp88kiNpr7p4AXMf
         t5040S2Pb1k71er0KjmE4pr55b2ldanHfwX8dOL+J11mylghF3YciECDwMB6Y+MqWxgZ
         bs1foe7FbESW/+jecas024WInt9GXBWNMfaQYMx4+vTN2gJNJzM3PcX5J6SULx9Jeclx
         16rIhLOqfG2KVf+xxwO3j8pzstfI1SY5jAGjd4VzxYI5g7eVo++FD+AIATApgSyGjP5+
         /I3uaS7yCtESa8OuM6LexACi5K3CWTebVRQEmK5EgTlgynE8XwJmpkKzP8PaEsR0aVmX
         k1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766768575; x=1767373375;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NtfH2afvuczdz9DdqWZw8eEZQ6PQp40MM2EwYZTIcE4=;
        b=RyEH/EvXaaGesC8BkvO3ApoeUxDNC1JIkYPr3BxFHjIFoYX3mwqMJt96dWSmVRnbQJ
         byT5pQnP1dRoaWmlkitPsDSaMcuDXnXUJ1zAHhw9K0sZ02klyCbWU8K0uTC8QLRWiJbT
         lW/JtuNSZTILyJzf0lQsubMXx9M0D3yjhyrvorbRzdtKXi5FdKN8SIvLWTzbN4np+UiJ
         kqKQWjzwu8zR92EAY576e7JUxaexnm/Tbuc5EQqcG7c0ELIac+t9D0TXdMBzFTv0AdBf
         Y0VRaKbwxX+vQdG2cp3Hyua+d87f08vQYzDJ3ywRNtPpHcKlIHDBH7ydEuYGqq+wPOb3
         h85g==
X-Forwarded-Encrypted: i=1; AJvYcCU1i7/AOL3TpdsAH4TPNxnPTNs+RuwWqjZL/XiqL2N6bgX/vnyvMwQoMDb44qtKyVfgqhIILi4dmUmyn3+L@vger.kernel.org
X-Gm-Message-State: AOJu0YyEgl/e3Ko20bk42FrmpehFhXsfjhG0Ghc3OZKenarO9DwJKdUh
	TY8gRih1KgzGyazCY5CzIlypV6fvyyO79ZSCl+b9uOUWyxOwsakdu4g4t4F62o7UjiPjebg412r
	omjUGL3+Yh4Pq/RC84La++nmY8OEEPwOnwQzSf9S1YXZbAwiUcs53vdd9to/fRcFqYDuS
X-Gm-Gg: AY/fxX4zIIHCJcBbrbQ6ZEayF42LrxUH/mUx74mUKNy5i7qoHbpYl9Gd7ZWzsOY/rTD
	YQ0UDx3pGAGZkNlGdUSzbsS9JIVbCgbQoi9QK9ZsBQ0GwGJCDucV6c2d+h+LN4a6hRm1r9pscjv
	Bwii51J0+2G1HobyDfeBzHfVPJ0szAoJUjCmfSfSu7VKeSsxUytrvLKClnfAJyHP+0ROWsntt+8
	08nggdKacu783WeDfpmbOCnmVwSY3WivKxYCXqAyODLDCOBTP+f7Z8ta2TVDeqAcB+zGCIMjJds
	CLjb3oHRRkWyqxU9FE7TupPYRTmvw9j4NEd97yGt8OhgKpzf6BW8hlP3u6lSFKX3ycIpzmsJJmQ
	03f9vd2/07CqQe4ieveauCj2c7KWkUA42lFvuk76ZafK/akwZ1xKhgN6oQDUGu3HSQCYVW4kfUr
	Tzv8tdK6xE5GSykygMxPVUXLs=
X-Received: by 2002:a05:6102:3ec4:b0:5df:aff3:c42d with SMTP id ada2fe7eead31-5eb1a816ee2mr8794120137.32.1766768574636;
        Fri, 26 Dec 2025 09:02:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHl4HDTtD1xjVNsDTHMdzYHBv+dDCIdnJRB/dyhaIkKcpagSvwTl1Blz8ED9b7oc7xrtUcKtw==
X-Received: by 2002:a05:6102:3ec4:b0:5df:aff3:c42d with SMTP id ada2fe7eead31-5eb1a816ee2mr8794057137.32.1766768574110;
        Fri, 26 Dec 2025 09:02:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185ddc12sm6825688e87.37.2025.12.26.09.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 09:02:53 -0800 (PST)
Date: Fri, 26 Dec 2025 19:02:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, jens.glathe@oldschoolsolutions.biz,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>, Jos Dehaes <jos.dehaes@gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: add
 retimers, dp altmode support
Message-ID: <sassa62hyh2six6dbn6qgz7eobzt4z2p3eyqz3uaifcglwmf42@ckdaonsd3roe>
References: <20250417-slim7x-retimer-v2-1-dbe2dd511137@oldschoolsolutions.biz>
 <CAAQ0ZWT=s2BdobfkKuBAhw5H761ZH7uCH70i_UOR+wJ6cjSZJA@mail.gmail.com>
 <7283e3e7-54f6-4946-b526-2fa180f15c50@kernel.org>
 <aU6Ka6elOYfYbflG@dragon>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aU6Ka6elOYfYbflG@dragon>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDE1OSBTYWx0ZWRfX0uv5TQPwW00w
 bHfHCiapFaYvDrPZ2P4paT9Jiu5Aw+JJof1GPj9rwgY2FJFNbQ0izYCSXDv7NoZ+AhaHVeT9SQC
 y0LbvD4yI2QujXWxSezRTJrgUBEMhOFhxw6oURHKPH74/SwlcgoPnP1ioR1Io4Fc/xH/HsGyzpA
 V8wQMuxp5OvrgnfOjbUblAzLx+mdZl5Xnb7ojJMh8PrDgIdQbVNdxWPnj/N8aU7TDGB3/PEq7Kw
 u6xT3mMA9tEAdUkeApQdL871aDfuJ0XnqYU+hkmBdp0Fkq7YKyzo1kfla20ShM0z8g1BwFS57/x
 UzU9RYazSLlSHRTQUtO2XifPS7xgFg5IpRMhXBqhliDg4YeLR/Z8jFygdqr8RB+16CPE5a83s7R
 tn8xjjNrFfXmO1cDYGDoHkJMFzer/585mcqlZMJNN5VQgkG3euh5IizC+LwqTFVn0U5HU9NOPH3
 eJbERr4g9a6OwBmki5Q==
X-Proofpoint-GUID: NnesWYmhddgAbxJ7SL808N5CJViKnQrn
X-Authority-Analysis: v=2.4 cv=MKVtWcZl c=1 sm=1 tr=0 ts=694ebfbf cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=gxl3bz0cAAAA:8 a=pGLkceISAAAA:8 a=cUBun8vSQBpvidU153gA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: NnesWYmhddgAbxJ7SL808N5CJViKnQrn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260159

On Fri, Dec 26, 2025 at 09:15:23PM +0800, Shawn Guo wrote:
> On Thu, Dec 25, 2025 at 09:33:59AM +0100, Krzysztof Kozlowski wrote:
> > On 25/12/2025 04:29, Shawn Guo wrote:
> > > On Fri, Apr 18, 2025 at 12:35 AM Jens Glathe via B4 Relay
> > > <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org> wrote:
> > >>
> > >> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> > >>
> > >> comparing with CRD and other dts for a more complete support of the 7X
> > >> only retimers, gpios, regulators, dp outputs
> > >>
> > >> Tested-by: Rob Clark <robdclark@gmail.com>
> > >> Tested-by: Jos Dehaes <jos.dehaes@gmail.com>
> > >> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> > >> ---
> > >> This patch adds the required nodes to support DP Altmode on all three type-c
> > >> ports. The definition is derived from the CRD. Since they are all marked 40Gbps,
> > >> I assume there are 3 PS8830 retimers.
> > >> This modification is now for ~8 weeks in my tree with little to no complaints. I
> > >> don't have access to a Yoga Slim 7X, however many people on #aarch64-laptops do
> > >> and some are using this patch.
> > >> ---
> > >> Changes in v2:
> > >> - removed changes not relevant to retimers and dp altmode (thanks Johan)
> > >> - Link to v1: https://lore.kernel.org/r/20250417-slim7x-retimer-v1-1-5813a7835903@oldschoolsolutions.biz
> > >> ---
> > >>  .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 476 ++++++++++++++++++++-
> > >>  1 file changed, 470 insertions(+), 6 deletions(-)
> > > 
> > > Hi,
> > > 
> > > I'm running a Slim7x China variant (Yoga Air 14s) with Debian 13.
> > > While the Debian stock 6.12 kernel works fine to bring up the display
> > > (AMOLED eDP panel), newer kernels like 6.18 loses display during boot.
> > > I can do either of the following to get the display back to work.
> > > 
> > > - Enable PS883X driver (Yes, CONFIG_TYPEC_MUX_PS883X is missing from
> > > Debian config [1])
> > 
> > Obviously.
> > 
> > > 
> > > OR
> > > 
> > > - Revert commit 299038d82418 ("arm64: dts: qcom:
> > > x1e80100-lenovo-yoga-slim7x: add retimers, dp altmode support")
> > > 
> > > My understanding is that a PS883X driver is required only for external
> > > DP support.  Why would the driver missing impact/break the internal
> > > panel support?  Do you guys have any insight on this?  Thanks!
> > > 
> > 
> > You need all drivers to avoid probe deferrals.
> 
> Ah, yes!  The display subsystem/card is wired up with all 4 eDP/DP
> ports.  A probe failure on any of the ports will cause the display
> card fail out, even though the eDP port has all the dependencies in
> place.

Unfortunately, that's a requirement for now. It might change in future,
once Luca finishes his hotplug bridges rework, but for now we have to
have all drivers in place.

Please send a patch to Debian kernel build system (ping me if you need
any help or if you'd need to convince Ben that we need it).

-- 
With best wishes
Dmitry

