Return-Path: <linux-arm-msm+bounces-91936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GD2jJQGvhGk14QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 15:53:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB78F4478
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 15:53:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 526A730166D0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 14:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B88E641C2F6;
	Thu,  5 Feb 2026 14:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j48/J2jw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gwf5M0Fu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EFC3EDADD
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 14:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770303228; cv=none; b=bZ1eJrSWmQKEDlONOPh7tzhh26nlsFA7jwHRAYjjIw/FfFWQWcRm/7k/VrTje1MGDvNuapUV1iGFwV/7AE70Bq/jqtmFEfr5LC5NUHswlFiPeCZh9WeuROWAm3jt+xUHbdX2m/2eMlpVs3MhaWMUhv3670zD5hdSOLPrX/DgSgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770303228; c=relaxed/simple;
	bh=ZwTws5Wp3s/3u+wvh0h7sn7pKfDk+8i3+HfkFTjhvSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TJru2t7R2E+dI2QWTx1w5wd68/AGA85GGFmWp6Y9p2DvqsbMnwHwXKppTqaOUdVfxwuWmGumVz8EpXL/3F/PxCpI95faWSBmE7MyXxzMwQ8U1OLaLH1Qs8BkNHa1DTvA/p5wx1UOpXVXeUGqyt4aODnR0YMKz5P70Qw/syxiPFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j48/J2jw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gwf5M0Fu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615EWZ8m2945197
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 14:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3zdqUJw9qtQU1loPiEvujh90
	oDIRx6jke/+KDijdHPk=; b=j48/J2jwaL8GuMAL7XIaV/2wrifuuuZlbBV2O7Dk
	4Q95eKsO3sRpl5R0Kr+e6Nkzi+QrPIrW9dw0QQvkIyjusSTkvFw251lf3WN34PRv
	YhoNJJAw5o/Fcz/8BOQdvVVj8RC/duuQLAINukC88Ve+mHlu4C1ETenxW117jp3W
	vQyrXHIpkBGvkEbUzxwoYLpPK3DTI9LSWUqU/7r60yWTqeAoaArgIDiS3NQZBteM
	BtdG2VHynHWRnA/HygnyOgg5Lam0oUy/EV9ans8tVkJXVqvizSjH84n0TUo/KkTv
	W6raBkfxCJ442Od+YjsAtMZoVfhIjZcL9Njlgik+I34fUg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4q55s8w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 14:53:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70a62ca32so300416985a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 06:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770303227; x=1770908027; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3zdqUJw9qtQU1loPiEvujh90oDIRx6jke/+KDijdHPk=;
        b=gwf5M0FuaUL45z+g/DewD6DVidqqS4NRUX72eymR9J+TR2OTCNNZp714nUn7j6JzZB
         UXF3fhh+p+CIsOJCVjspsucNhbGwvdsXd7Hanh/iP5TyJQcPVIzTJHt5wOB1ZRy5WGzG
         2yFZlvxCI073AhYbkG4rLtGd4tyl+J9YP+fXFkR4ClKXMQ4TwSyQTkBojJ1BpHThQk0e
         +4+N5USTkQozPlK4gCz4gPW8hxoawS2Wnoee0+fSsr6aaIptrHoixr6ZiIuKJJsJPY4O
         2pgLg4CDeqJu/2fsYw+nUbFRrOFRwn7g7VWhPVjU4c4xArCgPrBjLhswqD+rVkKbRqQW
         ocMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770303227; x=1770908027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3zdqUJw9qtQU1loPiEvujh90oDIRx6jke/+KDijdHPk=;
        b=iG5l0H29uoo4PCCPu3IE34xf9HgBCWhBQftF3Lrgv+Tnb3mH4US5Vsdx3xTWyiR3+M
         mNYrhEKhq43UZUNjnzgjKUp7opepVe+hKxH/j1pZbct5SiO9D+GLN9yXLf5LAqkaO4Ab
         ntUJbklLzaqUTIGMpHNKu1LV1wvmV+/EqV4pYkbZgW8zMtYyruWgHxBt67kf9qLW1SZ2
         L+WiS+C4pQG6E5B0sE2GHRB0FnDwDgBDsYILUwfcWnTMD+dCLoSwR6OV1OVOMsKQmPCb
         aY13cC36WDuhZ4umzB2AB8hnQ6SPLz8FHxPKjwovBb3feyO3rQmVtn3UUeu5n9PKmqYM
         PV0g==
X-Forwarded-Encrypted: i=1; AJvYcCX8fyFxna5sNZcrNRxSukM02aF9PUAqBDQn7wbTjOH3otkfw298MgRSjC5s0psqKDD6axwitHcqFft+MdeN@vger.kernel.org
X-Gm-Message-State: AOJu0YyaL7bwNMSIMFdEirTgJAKM/o5YBgSwvRVanSEZpVLv59x699FB
	H1Uhm9kyUSRcefOcgjwmRLInfVlkw+MZELhgtthS2E5MDDEyop2DXP750pxaWzGKCqUKi//eXvK
	y83OQNZa8hMVNb1crUYLHQfC6VFk8cKxUgQVUd3ia8URyM+G59me7sSmK2S98DW9KKqUY
X-Gm-Gg: AZuq6aIHH2P0a3M4KK8AFsc2dm+/c0ZyNMDmsqZ8oN+VCkaQYr8/7bjvCkuQQEXClOB
	uWdX40X4eS2vFQ5hJSU5VLeRUAhHs4lT+R/RZ9ZfWXQhXQw4C1Xt599D2grqIpXiAJOwJ7VCI/N
	YAy+gPxU/3v3+aJm8B0q9F7yUnzVi8X3DODCBDvigprJNicCCWDD6AOInqfE7WVNhXhByfwZy0P
	fU9fsttatTDjWUyJzjONHCNwi4J/tZBD9E5C92cgCVjjoDudCJvFX0AN0KBAHluGdCOhRFj+zFj
	OWRKm0av9H/OqFF6LEeUvvOHkNbIv+iQd1ocPA5nar7Ux8NFa7ZdGx8raRkLAuIoG91NcIynzIu
	mnytdCK6z20Gt7zHjXjnRLcrY4Vc0JE8xsrOHbeOotCErqDURYs7Udb9mCSE0RtJ0CV9q4TNU+N
	1Qab8MG1rnxqP/9N95IQbcAgo=
X-Received: by 2002:a05:620a:17a9:b0:8c6:b14e:655d with SMTP id af79cd13be357-8ca2fa75386mr869026185a.74.1770303226674;
        Thu, 05 Feb 2026 06:53:46 -0800 (PST)
X-Received: by 2002:a05:620a:17a9:b0:8c6:b14e:655d with SMTP id af79cd13be357-8ca2fa75386mr869022885a.74.1770303226121;
        Thu, 05 Feb 2026 06:53:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e3881b1a1sm1467745e87.61.2026.02.05.06.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 06:53:45 -0800 (PST)
Date: Thu, 5 Feb 2026 16:53:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH 2/7] of: factor out of_map_id() code
Message-ID: <zz7n3x7e7dsqgfw7qgppeaqnb3uz3i5bzd3tybzbv6q7zmdcgk@pojvxhui7q4v>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <20260126-kaanapali-iris-v1-2-e2646246bfc1@oss.qualcomm.com>
 <47fbba15-6375-40fc-bd2c-8ebf2788837e@linaro.org>
 <7d1b5897-8f17-4213-b893-d99d96afef94@oss.qualcomm.com>
 <j6euiso3pcg7nvewscsfjkqyfl55ajxxybf2pib3622uontj2y@aqj4satyf7b7>
 <4835d0b0-06c2-42d1-aa33-34daa0e7a8e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4835d0b0-06c2-42d1-aa33-34daa0e7a8e7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDExMiBTYWx0ZWRfX1GfAyXIyfjm0
 OlZJI2cbjZJK2Q7Pm4AgToz4TwIH97UvHaHiM7uZKDqEwRPsRk5Cy1KfUUwfs9x0B8Jku/q7cp3
 hekKqIp2HBdWVy9TgRLZuSY2iUHGTXK4/9My/az0+SShovABkiH5VVk1c5fh1+e0wnmRd5nB1j2
 ZtR0Y+vcVKxg71/3Iuge4aurBwaYscuCbypnKmthTQtgyESxkr/RnC3ycQ0KidS0gSpMaNKV/PQ
 HL+asfkITyuq6j2HRb2lDTX00Dsix2tzgQHM1UaxKZLWqsIwQsIzwKMS011QwQw8DE/soqeo9v2
 a1zzvb13ZPxS1vcO2n1HCOue6cC8HDmcDJQeiaSom7F2vP2MfMG3u63gD02lDIToq2UmjXo4o+J
 023yq03i/ypTzEk8MAaYk4phWm2SaDRcrpFaNiL45v8n0iAbCICiwvSEJtc99+nC6jyiiH0jSby
 6jOWv4JSqzIuI2B1bog==
X-Proofpoint-ORIG-GUID: AzWA0UbJqdhvw6NOpJF1qlK7Qps2sudx
X-Proofpoint-GUID: AzWA0UbJqdhvw6NOpJF1qlK7Qps2sudx
X-Authority-Analysis: v=2.4 cv=Z6zh3XRA c=1 sm=1 tr=0 ts=6984aefb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=8BOpGF2gbpNt03PPG4cA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_03,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050112
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91936-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EEB78F4478
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 01:39:54PM +0530, Vijayanand Jitta wrote:
> 
> 
> On 2/4/2026 6:41 AM, Dmitry Baryshkov wrote:
> > On Tue, Feb 03, 2026 at 03:43:58PM +0530, Vijayanand Jitta wrote:
> >>
> >>
> >> On 2/2/2026 8:22 PM, Bryan O'Donoghue wrote:
> >>> On 26/01/2026 12:25, Vikash Garodia wrote:
> >>>> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> >>>
> >>> This commit message is confusing and inaccurate.
> >>>
> >>> First up, you're not factoring _out_ of_map_id() - factor out of_map_id() means to remove of_map_id() - you are refactoring of_map_id().
> >>>
> >>> Your patch title should be something like "refactor of_map_id() to prepare for mapping of multiple IDs to a single device"
> >>>
> >>
> >> Sure, will update the commit.
> >>
> >>>> Linux interprets multiple mappings for the same input ID as a set of
> >>>> equivalent choices to pick one. There exists usecases where these set
> >>>> must be maintained in parallel, ex: on ARM, a dynamically created child
> >>>> device(s) is referencing multiple input id's in parent iommu-map.
> >>>>
> >>>> Factor out the code where multiple mappings needs to be maintained in
> >>>> parallel can be achieved through callback from this factored out code.
> >>>
> >>> Which callback ? There is no ->function(pointer, here...); ?!
> >>>
> >>> Just make some plain and straightforward statements about what you are doing and why. There's no need to resort to dissertation-speak.
> >>>
> >>
> >> The callback in introduced in patch 2 of this series. will update the commit descripition as suggested.
> > 
> > I think, the callback was NAKed already.
> > 
> > 
> 
> I'll remove the callback and update change such that all entries of iommu-map are always scanned.
> This would handle the video usecase ( i.e; same input id's mapping to different SIDs ) and in other
> cases it would result in few additional scans in iommu-map compared to existing implementation (where
> it just returns after first input id match) , does this look fine ?

This probably means that we can also drop of_map_args.

-- 
With best wishes
Dmitry

