Return-Path: <linux-arm-msm+bounces-115267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dNK+Ap9iQ2rYXgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 08:30:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 997636E0C11
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 08:30:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=S5WbAOQE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=W5P7Kj0D;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115267-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115267-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 14FCC300D4ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 06:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F6EF368D4B;
	Tue, 30 Jun 2026 06:30:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD16A23C4F3
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:30:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801050; cv=none; b=VO29A+1Fc1m06XnNzL1nKR2j5XtIUQfhgvrDlhS9DS7ZR/MUlXsQ2qVU9muf1U0EW25tOV72ymVX8+yY1OtKC5vtm+bRhLcVktl2zHwKOxbj7Rh24h5CKAL5m0SjU4GKAPbaDUdfmbD+2ZjUBc6DODXYlff2vVp7LXGtTTxmWQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801050; c=relaxed/simple;
	bh=cKoa/2WFhBW/jlxOH87mkn/Q91gpnRbIKMx3DDYetHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yh1+asMQpBjO5/Tl0Yj5kVW8rUM4LpdheVVsRGiqiFgYnR1yXNQjDALFbcFkRN9Zj8B2JFyjkoMjwuxceOQPwREJsVJYFs/+Th7vd9Zt8b6SUvsCZC9uV6sw/As09HOpnvCW61cQ0SUeDcIUKs0yWuQoPTxnE+6ejygOKdB9420=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S5WbAOQE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W5P7Kj0D; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CKvM1097780
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fDG5CA7UdEc+XI5+vmHnkILcyd6biWAmZKjpNZyeL/M=; b=S5WbAOQE4T6UsIcV
	wSz1fx0axkD+A1HvQDQeW1oFDBuMkRlXoCIEOE8FS/MksvESP8bSV/GRDQWfNIXZ
	m+KFkUfoQmCKiGoAymup2d+9bJkrVMQt6f4n+o8omVHATK9Opg5rLm91wsBpp/TK
	9rpEmsf7ZVQyhfz7UflwtGJmoZ5Q4ktI7AOaltEk7gXwBkLMXNsBnFghHohuwuVa
	eNJ1W5hYUHUdUnwXcLNk6C47On+x6+b31Zkb0a1abuEtm8BANMUAPGSQkKt/P48c
	CQrqxfyRJuqclU6oFHNb96nm+FD4r+AjpQM6GoFaP5u+n9vYhbKANcrvV1+Qm2Jk
	xhv7gQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1ct6xm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:30:47 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30ca81e05bfso4255875eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 23:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782801046; x=1783405846; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fDG5CA7UdEc+XI5+vmHnkILcyd6biWAmZKjpNZyeL/M=;
        b=W5P7Kj0Dsmx69yMWgx/jp5ILIzSw7noMKBzTh69JoIOT09BgkRH3WyoSxu2EuAb3Hj
         Txu0AzAKp8vBCtmlF+a+IXqV839Z1hMsFZmBlunBN/6emk91I0n2UDxR6LDXnODnFUdO
         M2GiPLE4L0Kee8O64IPg93nljnchmu0G8OD6PI6yqk894tRkSvd6SeVyEpwFCkT17Qu6
         B56udAFk9be2ZbkrHs7FyW4A9qv+dC6IaiJULqdrhqyCbWoyt0Ibgy+XfkxVY9O1zOTy
         G9qdXLzyVr6P8Bt3fImO+5PcEka2Ly0SmeMzpyZAvPVY9BHOnhDRiYVuUqVb6IKXkM1J
         cW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801046; x=1783405846;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fDG5CA7UdEc+XI5+vmHnkILcyd6biWAmZKjpNZyeL/M=;
        b=i8WqV2tExnccZlHTuT/C7ANTRu9eI+F/ln2VdwE1sBJULFHctAWu45Gk6lwrdjhtxX
         Fa2gFPnpSQG0MAruldx9uZ8q49SfWnx2azUkimzS6rnZk3UxGhLJMjJDqJ1LYgKBH9jm
         OzDjWtZ2YCxtTBZdpbs+DStwu+HnYpnxyoahzaf5rMpPBn450TasslQEyZjU6DdD3XME
         RFjamyT+/MfamSh+LhCTcc8tBoicMH8Bwv8U9aoqXgT0ZEzD2fqs6gOzHV6GPnKp/3k2
         ARUdFTa1R3z6GCwdAYZxuZRz8dpEsMPnwqYyuH08S3GvhCSV2R5V/eablyJmiwqAzV/1
         BI+g==
X-Forwarded-Encrypted: i=1; AHgh+Rp8o1fGHgSegnYB51ePlNHOqIy/gpEyTUUHov5t0QQMGy4CiVbQi8vzI7esnmrqIFVK1sAeyd5qnhxemcmN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+ljXyfZjnNS2L/Ng0uU7WEiyWf1iTNlYj4Z1a0EfXxitN+s6k
	5xyojGZ3pHPeWTnZ67eraqmRSplFUYHsuuohVcRKpsbWfnuuzYFNhZJMtMMfF60WW3PRP6CFW3j
	p1wgIpeYca42r+VJtcnPVwwhYm+JgnmERbFjlHYEFMAYnbW0b2vMMyGjSdn27URHjtOLi
X-Gm-Gg: AfdE7cna1L7tLv6O5/M+TtfbkIKZgo10WOz86oBjy+5NT+l89Mi7a+xqTxTt7zH+SfH
	mTKwxf5ioSfNLasv12mM799+umtwI3SKawwrby1LNiC7ZDNDjpwWIEoyin+oLdTElm6lYo9UozW
	0SMtfOyKtUk/YTs1Or8rPofvVcJzXppqkRSjulJ6KRhuLMgpZmj9iXAkC18ZLRs5wVR0NlWPrRt
	6pskqo9ouF3P9GyE1/ltjGp+SMKhXovR2a2gKI+BNN4CeUdthbDSUuOqT8IIrcqLLpwAHHcYPh4
	JqvAksyOEWXRqSbdXUFeAFsO4dvP1HwJeb9CxYFxke6sLFR1KVn9V3mWwq4X0hTvkL61bOZZURR
	iIj72E2tN/FqjdhOH5e/kEMfS2gIrUkcVWXR7GA==
X-Received: by 2002:a05:7300:d0f:b0:30c:f84c:b2af with SMTP id 5a478bee46e88-30ee1489960mr1774644eec.33.1782801045864;
        Mon, 29 Jun 2026 23:30:45 -0700 (PDT)
X-Received: by 2002:a05:7300:d0f:b0:30c:f84c:b2af with SMTP id 5a478bee46e88-30ee1489960mr1774618eec.33.1782801045153;
        Mon, 29 Jun 2026 23:30:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee320827fsm4128655eec.25.2026.06.29.23.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:30:44 -0700 (PDT)
Date: Tue, 30 Jun 2026 12:00:37 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v8] arm64: dts: qcom: kodiak: Add EL2 overlay
Message-ID: <20260630063037.k47sbwf26l4fi5gu@hu-mojha-hyd.qualcomm.com>
References: <20260624063952.2242702-1-mukesh.ojha@oss.qualcomm.com>
 <8fbfa82f-aae7-48d6-9406-d04e719f028d@oss.qualcomm.com>
 <0e7a5719-9271-498c-bc0d-5fa76341ede7@oss.qualcomm.com>
 <20260629122248.yb5fe7rifdoowpfl@hu-mojha-hyd.qualcomm.com>
 <b7d6e7dd-afd6-4ca9-bc54-4533de6b663e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7d6e7dd-afd6-4ca9-bc54-4533de6b663e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA1MyBTYWx0ZWRfXyTQ0sr+rSYps
 06Tsc01StKG4Ek3Cml0z2UIWgSqqS7PCRId9Uw38f3Dg7tie2S+mkDMgEgyP+g6mJpkc9G4jqvP
 ywhkqVszPVgM0H2FlyoPIWl3CV7jMTCG4nL++dhD2bKRhLvZYQUq1lWI8uF/jH+8BvMXiOdlSKi
 i49nVLo1Yqen3rIA9KHS633CSyJsfe8gUlJpsNmyiBSt8J2+m/n1HFkFdReMj3oVgiKUWDiTezg
 wcjanQBuzGEDKjP0+dvZvLtPA5XkGl5xveA83nSBJ1IGFY1WJ/KSwulQCWgHf9J9EJXist9TBGm
 oLZjt18qb2NQNSHbZUkVlM7NY1EqBddmMGjUVZI8M9sEO+Mec5QWT8IgkDCoptuhN8ifCS/CvRL
 wuVgk9RR5GvRh0hXJND8pvESrb2nyD+8Url41QoYynvFN3OaFb+M3bTdZfNz4EhnzCpk5KeWReT
 32Y6N5G5o771CVvC4Dg==
X-Proofpoint-ORIG-GUID: 7ozbCQZZEoTeSwPusFo_iTEIjJy6S-Zr
X-Proofpoint-GUID: 7ozbCQZZEoTeSwPusFo_iTEIjJy6S-Zr
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a436297 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=8nJEP1OIZ-IA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=l-lKhsVhalfiKrVvuzAA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA1MyBTYWx0ZWRfXyevrJbIRc8qL
 3inhXuSf6yh5yMCFaZYyrkFKEO9nSb/0oLJSQwSoW2gK+cjO7O0KcJdI7eVgmKu3k7iomGniv7I
 4DLLLDN/sToCpUjRlZPg0KlWT+WUKYM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300053
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-115267-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,hu-mojha-hyd.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:miaoqing.pan@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sumit.garg@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 997636E0C11

On Mon, Jun 29, 2026 at 04:08:26PM +0200, Konrad Dybcio wrote:
> On 6/29/26 2:22 PM, Mukesh Ojha wrote:
> > On Mon, Jun 29, 2026 at 01:36:34PM +0200, Konrad Dybcio wrote:
> >> On 6/25/26 3:14 AM, Miaoqing Pan wrote:
> >>>
> >>>
> >>> On 6/24/2026 2:39 PM, Mukesh Ojha wrote:
> >>>> All the existing variants Kodiak boards are using Gunyah hypervisor
> >>>> which means that, so far, Linux-based OS could only boot in EL1 on those
> >>>> devices.  However, it is possible for us to boot Linux at EL2 on these
> >>>> devices [1].
> >>
> >> [...]
> >>
> >>> Is it necessary to redefine |wlan_ce_mem|? Can we consider updating |qcs6490-rb3gen2.dts|?
> >>> I have verified that with the following changes, *NON-KVM works fine*, and |wlan_ce_mem| is only used by the WCN6750 firmware.
> >>
> >> Is there a good reason non-chrome devices never defined that region in
> >> the first place?
> > 
> > This region is needed by WPSS and non-Chrome (Gunyah) has IOMMU
> > control, maps it for WPSS during boot up while Linux at EL2 needs
> > to map it for WPSS in Gunyah's absence.
> 
> Right, I'm asking about it usefulness on devices *with* Gunyah

Ideally, it does not need to be mentioned in the OS device tree when
Gunyah is present as there is no user in OS..

> 
> Konrad

-- 
-Mukesh Ojha

