Return-Path: <linux-arm-msm+bounces-107358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNeFFdaNBGoVLgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:42:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B61535530
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0DD81303FE87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3EB944A730;
	Wed, 13 May 2026 14:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cyTHKO38";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OziaUvQa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D22943D4E2
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682834; cv=none; b=JYN5rz74fhd/LamfW1CMzLXGvWsGwkLernoCjqKxtCqSKgD8XGTHMRxik2GyjDhFP8riJol264MwhgVk7jYi2vrqSoBhr8uWUuGr2KXYJ3U2Pt11pXpjubcpwE7VQjOq4bjFTir0AEdlaOaLSxxDD6sgaojQvSqOh1VKd96Pygg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682834; c=relaxed/simple;
	bh=2trH886MfLfuFoHZsrAJOX3OMrZrPn8DhveaaIce2Co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZ9bf8SJm6Est4TE+NMDKvEtXz2gOP7f4H/4JAnUTYvTTeOS8i2x5ssgQ9yG9D3grC4LlrtI6UBuPFfXdmUrgsoM1IWiiifDCF66SHqmxhz+gf70m+hVpQvGWEd3akL7AZZtrc33IpkKEvVXAuGdl0cUoP5lijQSyHqkuoFeP8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cyTHKO38; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OziaUvQa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D9oevT2338837
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ILKMJ7fUBLO2oDSMkX1W0LNfF59UlR8aCBGAm1P/8BQ=; b=cyTHKO38kskLh5I6
	p48lJOasi0t+fKZVK0LvqH+ukZiGJ5YfmM8MX2j6rx/8YsETCQRGb1d714dZHY76
	iRTm9n/pU+tAHmhVFqnOBcoklfhSqdCtooyP+mGw67b3WujNTBho0tiTtIfvtNGM
	Hx2ahUukboeIg7SIoQhpnNP1wiw7hfeVhRW91ywnyIhk0lF7ZxWDbWGDDkb5tG3P
	hm75y3bVEB3nOk/22XZPXocSx/9bdJR3oAB8y4Aay2b5CvvZ4t+3Pe8uBRpbKfEc
	/udQAE4LeaaFYAh9/tlMDmmZLPtNlgy6CF5o10Im0oVXC7j78MdwCwmhNZbBeycR
	r75rzg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e49vxbwnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:33:50 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-63271d633b5so2874729137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778682830; x=1779287630; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ILKMJ7fUBLO2oDSMkX1W0LNfF59UlR8aCBGAm1P/8BQ=;
        b=OziaUvQad2694yywjUBlFSXgWNiZHwgwDekDy3xvUOiXSdwVn5WIolduSE9PodXwnc
         5nCXR+SispZCJpOZB3SJfK90wCieTpaCht+gy6n5hTZsUuKXccEf7UWEneCvHFbvMvCB
         kRs2QNeCxels8tiBUSO9sc2Ojdf53l/kWbAvkyCxERwARBT7MoNVJFJqLUvI7YGMwGW1
         RJpI3rteRNdNIEWebaxHCBq0T4Tsreh8rvTbcMfmbcJckmXuHwU01IDzmoQWJTZfJ9AK
         zfyKnD2kNaDcn12ZoDtnTMYq94OpM0c11qH2uciMT4SMv7C28JRG9PKXmm4OlOX0qs6A
         K2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682830; x=1779287630;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ILKMJ7fUBLO2oDSMkX1W0LNfF59UlR8aCBGAm1P/8BQ=;
        b=CnKTpiDSMWkk61GsKiEuK5qQJ6XecGGEwd/y6Wn5EJ9HRD3X4ryJpSUT3Q96LvfOwM
         2yTXoWLWYPiaXEZQ88piiN+HNvoPNwoX4nE+uKeU+MB4XzNAMYyQg9mSLeI6qvc1tRB/
         JMeaLH6mCXwUvJKIL3hS3Q7f+yWO4kpOjuTNKNoErQYNx6Ikz6/Cqv0av4Gb/2JkURuR
         UVmtoSQvwe2MGu8fnsAmhQ40mTfgT2qtrMJRgKS9gU2A0xonps9rPrSW6lWfCnqstBe4
         D2jv6hnZzEyCK1pJ4sZiCDSAp3FVmrJUthCijlgpf0To48TPi/cdvkncJaq3VMemWFbN
         jPCw==
X-Forwarded-Encrypted: i=1; AFNElJ/Xjz4Lsds/aGl619MAPIiGLjZ5zlW2auztM1asowstUag413EKlZugkPsbIEMIwmeNA1U/rY8YGn0gPQxV@vger.kernel.org
X-Gm-Message-State: AOJu0YyGCYKkAx4Ai13vs1vQEitTtnz2AQ308SLXgepYh9xRKqFCD4Hy
	xirc2Bwq8Mv4zZw2tuBlJJqeQ6yyyk4t+98AAIfv111Nj5GKasQtqWcBZvfXYrWJGjUDWbCRFt2
	7GdvI9ib3AG/J+5DbBpGlH//SvTdnN86hRjg7FiEtKp6XQSAaYafXaz40xYcZWOLCf4W0
X-Gm-Gg: Acq92OH8+K/z5dle4CsP1WQsUsmZa+/h59mzc+LNfmJJOom33FZCF1CKUnY60KUxxrC
	t6B5GbImH0TLiuKBWuxHmOwWmqOtR2IuMv/Nlnha6JI6jAF1753mPWSCxebgxcFQeKMNWaSLkYt
	5BpP/kDZikhFuZRzMI27djphZ8gk3CBwx2iw+z7fmcHM/iLVYUrrg2pRlhAJaAuKYGXySXsrBJt
	+VwFzjkuoKvJIjCwVGGQBQettWRPot0f28+7YITauumLjIeTy2JFNMT4LsMWJytNmVq27eymnDR
	T5fUhLV6u0ai6YXfU/c/I/K0uUFoJSfTtYD8tLawreCjKmeSL7nej1W4Bj+TB5FbmfwGl53xk3k
	3KWhNaYqAwh5boYhfBv7naEMPqZLJpJG6ZuDiM7F35I4msgPPiojXJ7yXDnEuL+nUIdzVDgblND
	9At/WfbjTWRPSx2Qssm2N+9HboNrkbfreIph4=
X-Received: by 2002:a05:6102:5346:b0:634:92c:bdd0 with SMTP id ada2fe7eead31-637a6f3af24mr1347961137.6.1778682830177;
        Wed, 13 May 2026 07:33:50 -0700 (PDT)
X-Received: by 2002:a05:6102:5346:b0:634:92c:bdd0 with SMTP id ada2fe7eead31-637a6f3af24mr1347942137.6.1778682829682;
        Wed, 13 May 2026 07:33:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8cbfc4dcbsm2307502e87.16.2026.05.13.07.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:33:48 -0700 (PDT)
Date: Wed, 13 May 2026 17:33:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: monaco-evk: Extract common EVK
 hardware into shared dtsi
Message-ID: <vnax3dacoobn3hsx3xf7dnfloxv7qbjxqjwkwnxc3ux6jbqo2w@3zroc5uxgfg5>
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
 <20260427170505.1494703-2-umang.chheda@oss.qualcomm.com>
 <36ghmwuwqgm3d432nkklw4igl6wpr5snug7jpha6ioz52qev7f@4g5pxcjxx5rg>
 <6cea3306-280b-4f01-be46-28e546cebbda@oss.qualcomm.com>
 <uxklfc663dzdjxd5e7gd6mftddty2nxqypoandbwakydgrjhaa@s5mskp2tlfch>
 <7461207d-aa05-4272-a9c0-360e6abfb0a6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7461207d-aa05-4272-a9c0-360e6abfb0a6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: kEOCskTxZy04R_9w-ouD0-avey-GexGo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0OSBTYWx0ZWRfX+8spg0U/1sjP
 kfu6pT8IxaamP822dek6vbFFmPeqh/10KOkmiWo1GrLfVd6TvYjZzJbmcwGdoXBfLdY0cJSX25S
 Tqie6rnoIKhFvVz7HuIJxmUEH0Ck8zVQqnTENEYWtJ/x73ZDX6ulGt+IQrKf/mxe7Igi1e1Cq7J
 bh8msSFbjrZgHD72qPa50AjR3RgZ9ZqLJ6iiHUl2jY9TjyP6BrJpeYDtzr/eTKmD+oiYMozNI+N
 ttyZy2kZdAbEuIIYIZJ4B9nj0E2wP1UIO0p2gTnfmGj+PblK22hfPLIyFuKXcPvbl7uZW6TjP8z
 pl7QwOBZBXFglVvPlGaR8Pdzog05bQs2H48+RkIAW5U+9z6Chg2HT/PDgeIslJwhVGM78N22AoA
 lg2gludRe46rb6Ts4Un+B90LO+b+pF9FpWW5T/18wvsS3/LtvZKBAwW3vFo9CIU49PhO9ORELIb
 oUElwi3cz6sbxfnmW5A==
X-Proofpoint-GUID: kEOCskTxZy04R_9w-ouD0-avey-GexGo
X-Authority-Analysis: v=2.4 cv=A8Fc+aWG c=1 sm=1 tr=0 ts=6a048bce cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nxX5gXaIHGdBwnkTwtIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130149
X-Rspamd-Queue-Id: 57B61535530
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107358-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 05, 2026 at 07:17:17PM +0530, Umang Chheda wrote:
> Hi Dmitry,
> 
> On 5/5/2026 4:58 AM, Dmitry Baryshkov wrote:
> > On Tue, May 05, 2026 at 12:56:15AM +0530, Umang Chheda wrote:
> >> Hello Dmitry,
> >>
> >>
> >> On 5/5/2026 12:14 AM, Dmitry Baryshkov wrote:
> >>> On Mon, Apr 27, 2026 at 10:35:02PM +0530, Umang Chheda wrote:
> >>>> The monaco-ac EVK is a new board variant which shares the majority of
> >>>> its hardware description with the existing monaco-evk board.
> >>>
> >>> No, this is not a good reason. Is there a common PCB? There was a long
> >>> discussion for it for the Hamoa / Purwa EVK.
> >>
> >> PCB is not common for these 2 boards.
> >>
> >> Also, not sure if I mis-understood you - You had mentioned to have a
> >> common file for both the variants [1] in the earlier version of patch
> >> hence refactored it this way.
> > 
> > There was an explicit question if PCB is the same as a prerequisite for
> > the unification of DTS
> 
> 
> Thanks for the clarification.
> 
> This was discussed in the earlier v2 [1] — even though the PCB is not
> common, the majority of the hardware blocks and their wiring are
> functionally identical between monaco-evk and monaco-ac-evk, with only
> difference in H/W being 4 PMIC in monaco-evk v/s 2 PMIC on monaco-ac-evk
> and the rail which is supplied to the SDHC controller.
> 
> The intent here is to avoid duplication across the two boards rather
> than imply a shared PCB, similar to what was discussed earlier.
> 
> If this approach is still not acceptable without a common PCB, can I
> drop the refactoring and keep the DTS files fully separate ?

Judged on the previous suggestions by DT maintainers, there should be
separate DTS files.

> 
> [1]
> https://lore.kernel.org/all/8f79000d-ccbb-403c-871c-7a36423c9eee@oss.qualcomm.com/
> 
> > 
> >>
> >> [1]
> >> https://lore.kernel.org/lkml/7r6373fo56alzqa4e2zzdnsgwfhgdkmbhxe4cvdo4p7fg3zren@eyiml4uedfbn/
> >>
> >>>
> >>>>
> >>>> In preparation for adding this variant, extract the common hardware
> >>>> nodes from monaco-evk.dts into a new shared monaco-evk-common.dtsi
> >>>> include file, and update monaco-evk.dts to include it and keep only
> >>>> board-specific overrides.
> >>>>
> >>>> No functional change intended.
> >>>>
> >>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> >>>> ---
> >>>
> >>
> >> Thanks,
> >> Umang
> >>
> > 
> 
> Thanks,
> Umang
> 
> 

-- 
With best wishes
Dmitry

