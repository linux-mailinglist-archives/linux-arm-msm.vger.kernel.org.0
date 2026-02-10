Return-Path: <linux-arm-msm+bounces-92491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGi+Aqchi2lyQQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 13:16:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8A011A98B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 13:16:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3ED953005321
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 12:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA4EA31B82C;
	Tue, 10 Feb 2026 12:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hE3ve0/0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WnX5rnSA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B743A2DA75A
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770725793; cv=none; b=B71XmHnOucCRI8Ue/l9tMQ9JgG/r89BVZhU9yL/M/Q2/HwH7iB7QjmhUKtf9hams1dyUvbfpmiVGcgmRKP1e+7uDkVFhjGVEC6v1h95vkZK0LtDTAVt43qrvDevJEYDmwZZ1ww3AfrBUCr+lqziGGEN0LNQvrCbKR11NJUkusE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770725793; c=relaxed/simple;
	bh=1+lrzVw6gSIyoOyIYzGtS2gwiGoLRQerUtv2sBfRgm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKSg8Ciy6tMDzBFr0PKMP4r6EA9hLOMFeE6y2zMDacpO9qri2P4TCuquTVJDsrKj0Kn6dGJUl4k1fNnRCEARGPxW/1a2+zRywzf/0lMqYZEzixY3+MGC9TzfVhyrwEFXhY2Zdr1cFtKnvPvyMhRsYY9qyYmib7Xi12NpGGVaj6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hE3ve0/0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WnX5rnSA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AAWGbI4102801
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6NTcd3AVs46EaEd/4Ke4nN0q
	XjsJrpAAcBTjMzzROA0=; b=hE3ve0/0ZtCE3dv+qmd/7MfCfjIrkKQlOK21qiig
	jXGOeXFnPynuqbAq1LV1cnlm+saPxvy9EsnJ3Oas66sXU0Eu8uYkN+FGAXGVj4Ve
	MDHq60A1nkjiUB2Ieyohp8KPSsLnWa45k5j5DJ8H0DgopRLlkOuC2er11Nmsucyw
	v0RFv4pjaJgZ+ky9UVpNxj8D/2SSgbg2Clg1IqP3WQR/O+0zQqSro6+NZzHRdE8f
	VfMp41rG5ylvh2FWqqMga/yEaWJD+y+fRBSBFfY6nSrxy9/daovT1Zoh//cf8bhm
	bwf9m6qHKvjYq4ge7mmEhWIYf+5x+sUqypLhSQ3ZzsQk2w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7k61kgdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:16:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a87029b6so242389185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 04:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770725791; x=1771330591; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6NTcd3AVs46EaEd/4Ke4nN0qXjsJrpAAcBTjMzzROA0=;
        b=WnX5rnSAEyMaKsAl8eTKpJjSmO0RtjyqCYdpMpRnuzfbGDRi8PtbcezNjxN+GJqsfX
         DK1NKbnf0Y1sq+6aIEBsuPNdO6DyfCNm+xQBbGFKO3GhWH6TkfjXfg2cq0UET+kRs4Zg
         tKnQb5pTpTx9X4cieYBgxpvdeij40oj676Cy+Mal/XuOQVTgVQQKWj2Ae1JDbniWmk7m
         6uQaK9PD3t1AYtaCg6DNPfbNGXrnCyqOF/BJPXdX7X3kHzhGWYZHH6GdXT8wKOh/xQVm
         sABzlaX/4UMxtaUMIv2+EM+CbYUUEBfLlJ3PkwA6canfYvxExj7mZ2z8jchF8Iq7SjPB
         Xlsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770725791; x=1771330591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6NTcd3AVs46EaEd/4Ke4nN0qXjsJrpAAcBTjMzzROA0=;
        b=L7x5XsEO0Ki283+vhZ65X6p5dk4b7vrai+TpsduYCSkeUjmFYvSRatzCbiXrJu+ZKx
         xJGKhLIFzD0HJg1ZthBjyFb0FxeXHpGUMKBbG19Q0/J9dxcdknx5JC2r7NI+2NtBVVhk
         Ol5qaTXmqcZNkToyqCpPd/FmmqHCFdhoYdTEdo7Y+6nNZyXMc0QIKhehSOTzSxF4ziVw
         lddHeK7+uxJ2t2uqJGG+TzzDNKbEQz/P5tHDq7vSrUQWqUZuXhecwgc0lzfMf7/qBQhi
         42GbpsByi4IeaiJwOSlXOWsKWM1q2ER144o3rHs3vMqfO2hPH25y+9Yzz55E+tEb6ALO
         y9JQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKBSkEz/QlkSbP9upH/bjh0AuhRB3PGJPpRmnRqmfwNh1F0SepUdGJvAWjgsalLtaJ9Dy+tx8Ep9lHfbVn@vger.kernel.org
X-Gm-Message-State: AOJu0YwG4dzJtP85+di/2GzobrlRP/0lZLiySIv7tnSQeWTlePTTMNaz
	iPLnwvuBh38PlGTAPBLUhuR6FJQMCmZ87PJW2nSVETkzCZ7OR28IaC33R8+tBG2xSvn9ix+LruR
	XZJf1Hp4Z5/sOMyUaUNlovJQSHPPvMUMLLtsgpK1eb9DZVQ4gcyXDYFWmqW7MIxCmxT0H
X-Gm-Gg: AZuq6aJq5zOeLnuKaV0NOIwzH1P1hwYe/bOwYGv3Huysdm1XnOzEqCGnjkVt3uonf0Q
	IDeYUBY5jGIAUKLmjTnbDBnT3XqxTUbaSEXTqkBxayeNNCjxNUMZ5J0rkeZW9qMIeCrBOBENM0r
	scudjD4bavwIzHVF4+zF4BR/TyJP9SmR5TYdMkiSscPsOCXReqBD4UX3rlMEfJwRfoz+tUHtEiS
	0NOycsitNQeNaNz63JMNh1gkh0nlGzub54q5RIWwzsNN/RvLnVi0wdEvhCZd9GcHP79Ubo5reZT
	BHITDd91L3aQd9/Um/2tNDh6Z8j6QjpY/jLFIkyDvxpMAO3K8yQYouKEPbM9LTKEELKOy5ov8tk
	thcJG6qd8rh/tUGgXirQedvgARdvkUMPCRGewrhpIO9JYbBCmy4RvRothiKFGy2h4MwMGP2lu5m
	ywmC1gH0N0TRRVMgHofM1u0hRzdHSOIZvcRv8=
X-Received: by 2002:a05:620a:8acc:b0:8cb:1d9a:42ac with SMTP id af79cd13be357-8cb1d9a434fmr269628885a.51.1770725791007;
        Tue, 10 Feb 2026 04:16:31 -0800 (PST)
X-Received: by 2002:a05:620a:8acc:b0:8cb:1d9a:42ac with SMTP id af79cd13be357-8cb1d9a434fmr269627385a.51.1770725790546;
        Tue, 10 Feb 2026 04:16:30 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44e231d5sm3271065e87.81.2026.02.10.04.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 04:16:29 -0800 (PST)
Date: Tue, 10 Feb 2026 14:16:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
Subject: Re: [PATCH v3 2/2] Bluetooth: qca: add QCC2072 support
Message-ID: <erc5u6hzofidlf54dsz7htta55o4xwgihgh4tu6mqkg2ijz3fo@6hd6q6iljrfq>
References: <20260209080613.217578-1-vivek.sahu@oss.qualcomm.com>
 <20260209080613.217578-3-vivek.sahu@oss.qualcomm.com>
 <CAMRc=MfT7ourMH+ShJpnBAjv_uOb_ds0rxJOYaz_HsoT45dJYA@mail.gmail.com>
 <cbc0b42d-fb5f-45b8-9074-d0bcc64a9de1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbc0b42d-fb5f-45b8-9074-d0bcc64a9de1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=M8lA6iws c=1 sm=1 tr=0 ts=698b219f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=IUNqW5v9qaHhjVISCi0A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDEwMyBTYWx0ZWRfX0gkZ8Qbp9XzP
 l6f24vnNRNx5vgVfKMtVZavGTQGSBNfQDEvohYOE9nUQcH/EGzQB7TBH2zX2G2A+8l9WvfQpIWY
 bFvyDOVuv+Da0vNPNb5lCIeyHMkQcAiFZwrz5gq1ScpEiBe9NWwBazouCYVVNCpE9/7x4uQwkq1
 sUoaCYSntheDCHjNZDWN2T+Qmu18LnjWhktDx369q2HFBpEBU7JV0Tluy9LuDKihwezQDJtMEmM
 Gt9OKf8dD5b0XsJmLNpff03eTzIVRo7MSCdpYn8Y9rIT9d34N2IGFlTpE6F46jDaigbPEKSuUk1
 54ysT2GJVYMka4kpsA4OArf2nOuMUE7o92Jh3zlJU6/8Dvph3y+KXKOzPN147vN0Kj1jdIR4Qe7
 uqztaBQ104DqbmEio/L53T6zpCEOEb3++ti2u3PnRXKRQIdmZ/nwcMErDVxeHazBM0b1zDutmB4
 nAk80QmjgboHQq9cAJw==
X-Proofpoint-GUID: DcZJfH-11zkkqw1bI8ntKbkgMwyI9prK
X-Proofpoint-ORIG-GUID: DcZJfH-11zkkqw1bI8ntKbkgMwyI9prK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100103
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92491-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,quicinc.com,vger.kernel.org,holtmann.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1C8A011A98B
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 05:41:13PM +0530, Vivek Sahu wrote:
> 
> On 2/9/2026 5:04 PM, Bartosz Golaszewski wrote:
> > On Mon, 9 Feb 2026 09:06:13 +0100, Vivek Sahu
> > <vivek.sahu@oss.qualcomm.com> said:
> > > QCC2072 is a family of WiFi/BT connectivity chip.
> > > It requires different firmware files and has different
> > > configurations , so add it as a separate SoC type.
> > > 
> > > Correct the sorting of other chipsets for better readability.
> > > 
> > > The firmware for these chips has been recently added to the
> > >      linux-firmware repository and will be a part of the upcoming
> > >      release.
> > Something is wrong with formatting here.
> > 
> > I would personally split the sorting and support for the new model into two
> > patches - without and with functional changes respectively - for easier review.
> > 
> > Bartosz
> 
> Yes, I'm now splitting this patch into 2 parts, one for sorting another one
> for new model
> 
> support. Please ignore this patch.

Please stop adding extra empty lines between (or fix your email client).

> 
> Sorting change has been raised with tittle "[PATCH v1] Bluetooth: qca:
> Refactor code on
> 
> the basis of chipset names". Please approve it at quickest so that we can
> raise new model
> 
> addition code changes on top of that.


Why couldn't you send it as 2 patches in a single series?

-- 
With best wishes
Dmitry

