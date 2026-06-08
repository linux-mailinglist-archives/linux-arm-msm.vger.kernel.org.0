Return-Path: <linux-arm-msm+bounces-111952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qMadAfcNJ2qYqwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:46:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 239D7659D7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:46:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oXENHefx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jgwhjVro;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111952-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111952-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BB2E307D7E0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 18:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C70EC3E3DBE;
	Mon,  8 Jun 2026 18:31:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBEC3E120B
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 18:31:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780943491; cv=none; b=PmU0N6MoKRA9WYU9yak9zO94y95eTt7LogAA53F38lHxmS8ohgpbZdVhHFXyRLOyGut3OUKbEw1rzaUsmyLXtBhwcedF0cwDp2pV6O1ww1G1igI8CZmN3bgzbWELoRB8zzOM8VY6eLDsx36VkF/MfQCVPFXv0jAblTlrXZir1ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780943491; c=relaxed/simple;
	bh=xNum+tWC2aMU452Q4bpTFPsuhLzqpmZUmqcPe0OPSiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DNHO3oFcisDKenlJtFfG3VHcZw/+aUIeDbqeKGcxI5+ooGQKDXAeYWlhperPmS06i0XmXQdLPdrmewI7i9CFfGUCYptq1LqrqpR0MqW0HN8uDNU9IpnikhbbZtxuOe0KHYCvy0zGYAKK0KRekW369pLuzax/rBTv2eGOT4ny5v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oXENHefx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jgwhjVro; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFWch3479140
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 18:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yL3biVRnQzmQP3JTE+TrfcqR
	LaExr7Z+40hJ1bAFkXo=; b=oXENHefxvYDkgrLThJUdpDu9IwUyLKB+g0fX3dIn
	mzPq3pEyVQI0iiKJrMhVVJW72aT4lesVI8JrV93dHXmYjDhipX8BedPGunhk0gyf
	WwJqNiGm1pCttLFX2ZMLKISj6gOJjM0S7gxSgMAXh/rXsHZl5iyt7Gu7SFcg3aQv
	c5POOIOBucgzQo1AzWFdzbES3EKcrEqE/OgWdr0SixCGP1HvlVdZQOBa6qBff0nC
	5p0uOkuznRgW62+mo+FnT2DJBQW/1PMp7r06usbQcJCayDm/Vg1RR3mgB/+NG0Pn
	ooXbpngwfEOoAPimclKCu+YdnRASfyIU4L7nNkp+hFzESw==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxx41dsk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 18:31:28 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4867831a9a8so5838651b6e.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 11:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780943488; x=1781548288; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yL3biVRnQzmQP3JTE+TrfcqRLaExr7Z+40hJ1bAFkXo=;
        b=jgwhjVrofuArGjI+m9nTmJ788IGRP9r7RSpVrpfBvnaOShs0+2eV75ODMthq+qGzcG
         eP4PRo96yXTd2KmP5/LKvMWCakYPOhMslID6N0vBuosuJZUPrEXKrJ6x+q1mgR9BRMuy
         ejS6+pt8ejcBv25YAR+Ar690Ak9yeR4hTzwvJabTNqV0CsBoFjZuJBRzfGwVjRm8vqY8
         G2SzPrXoAmJJvNzjIE4Aqb0ZUNmVMR62nNzlMWZHe4H7HDg/JX3muJIr2SLB1JjqeiMx
         JJG8Qy4s/pnMMhxy1xf1Lh2ufJIJRffIfU4hrdJofM2GHHyYrflpFyqCEEplYaUHgn0m
         eihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780943488; x=1781548288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yL3biVRnQzmQP3JTE+TrfcqRLaExr7Z+40hJ1bAFkXo=;
        b=C1Za8z/bWjddAsxSiFLSrGHxtuvjrfJtvj05UjI8wgTKqT//nVC9HowwcM8HDVNRjH
         mZm2HGOOxRu/Gwoq+zTYMVkKxKqy7JiY7YYAd4L5RoHTx/92uDDAZcflrBcikPBTnr5g
         IPCAa9xQehU7j8NoA1dItehk5qMVXqX+0NehtJmCDzdLnSwHqyIFGBwH7/7CKF3bd2AI
         DIXFHu6NTqSkzwphMRfqjji7HW/4JYDummohRfTxXBhttru0QngOp+YxaKwUCAbl9DJv
         xRSNZiveb+AnAFBk9L0WeOM1UHNfw7SCU2Hc+tpXVPkxSfGhCt+Gesym+J0saQEdjUCD
         EKnA==
X-Forwarded-Encrypted: i=1; AFNElJ+olIsekrubk1iE6RTQ0MM+uhWSER0gU8hovf3ABiPxTGi2Vwlinm2xpYyeeQWrIyrNZSx8FbhRMnm0LEYK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9QWwFsUC/jQLt3GsGApHKWUTTAwX4QN7RqTAqgCMb971uGiHi
	9DNqLR6qh6wIRDuUZCUHWAusb/8xVXYk+xFuckDqsHy9JtfYu5iVRRGqYKsTdzyMyKuEU/4WRA/
	p4A3DT8FRHT1uRYiz7VXmFDW5YsQlJ+qUfTOorSn+F834cgQ4dJ4Mjvl+OX4P048nEGlx
X-Gm-Gg: Acq92OFdWs4DNeTGTVjTCwny8wNgYlkUB0znOdR5cvXF5uVTWQ/byciO/gjTCAArPxG
	bG7hMWkX9bSDkTwrwxche437wzcNS2Y3LXBAQrtyd65Rt1A4EZQ9g1gWimEkT2OpB6OnLPBfEDv
	TWyWm0TVnFBt+73KW1CnfJju2ppH/Fe2puaAnBjsDHF5SeQC6wN9OtCHQEXIEiJULlwAdkhBhpR
	tLv6JfBcrIi9w7K/0JUTnd8xKoid+X3mTIgRacCoxaF6h7udPPAYjn/75UaEdXS5YQwr9I/bUMX
	S9oSobRAWWntoEtCS4o0HYkiURBZZ/zuJiBUezSQCBrQ8mQ2RKQXL3s9OSTVMQRZE8yCmSFtQPF
	eFk/SB0PzsBufMt5AhrwjwD0zv9di7gEKWdfvYtUNFiW4IZ8bd1A6ksFRvYDX5cUwLVDTiaFsTP
	wr546nEJIyqTuit5r7lIf2celj7e8DX6iXvf7ceOQIVcAohw==
X-Received: by 2002:a05:6808:2223:b0:486:89d8:6d50 with SMTP id 5614622812f47-4868dddaf14mr8480542b6e.4.1780943487650;
        Mon, 08 Jun 2026 11:31:27 -0700 (PDT)
X-Received: by 2002:a05:6808:2223:b0:486:89d8:6d50 with SMTP id 5614622812f47-4868dddaf14mr8480525b6e.4.1780943487271;
        Mon, 08 Jun 2026 11:31:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97ab56sm4037399e87.44.2026.06.08.11.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 11:31:26 -0700 (PDT)
Date: Mon, 8 Jun 2026 21:31:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        Om Prakash Singh <quic_omprsing@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, Olivia Mackall <olivia@selenic.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 3/4] crypto: qcom-rng - Remove crypto_rng interface
Message-ID: <5u2hogvqf273xuapkdeygsoqsncfhbexzcpwgsbddhgg4j7wmm@2t6gnzakxzi7>
References: <20260608175848.2045229-1-ebiggers@kernel.org>
 <20260608175848.2045229-4-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608175848.2045229-4-ebiggers@kernel.org>
X-Authority-Analysis: v=2.4 cv=cverVV4i c=1 sm=1 tr=0 ts=6a270a80 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=GGXhDfIuiivKoIxXIwgA:9 a=CjuIK1q_8ugA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-ORIG-GUID: 7b_wWvVzylmVxWxVeXF5Ic2hYX-LqhYh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE3MyBTYWx0ZWRfX8b+dyjVgFIdm
 fZvIrt1vKlvbNsI30MgiRtdxzJ3Ayj6stQZbMqit71OPGdR6G2VNBaQQ+1VqIZF6RvD6s3V9aig
 qqlI1CBgYRk8soUrMGwK6QEx5iM+kvkByAW3O0XRuPHWO5CPa5gzXefKsEsbMrIOWJDKHDI7ROm
 YMulIN9Ot/ie9epvUtyf3n9Gg2ThavPN3pX3f8uGPsc6DpGKhEi0/XUKbx+RS3MLFdlcaFFtnV2
 LVBTy/07fJyh+oVzOi5u5GWIckVwdY5bwqfubrWLj7JxFYLubYx/FG4KTQvIXW5JVX9Z8dXn178
 es87fObjTTtxd4JTWqvSrSau3Ia/VXaLZ6oQvM47DD2olRtDGdXTfNr00jjPjX3DniKN7VdHUm7
 JkEhvhBRn9CKw5JhDSWxUZTVTZvoEavL+dBvGBes6xVAgnBZgQuW0FRRbDfSxg0079qjijUQ+6f
 wOSN9723XvVyj/VeboA==
X-Proofpoint-GUID: 7b_wWvVzylmVxWxVeXF5Ic2hYX-LqhYh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080173
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111952-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:quic_omprsing@quicinc.com,m:quic_bjorande@quicinc.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:olivia@selenic.com,m:neeraj.soni@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 239D7659D7C

On Mon, Jun 08, 2026 at 05:58:47PM +0000, Eric Biggers wrote:
> qcom-rng.c exposes the same hardware through two completely separate
> interfaces, crypto_rng and hwrng.  However, the implementation of this
> is buggy because it permits generation operations from these interfaces
> to run concurrently with each other, accessing the same registers.  That
> is, qcom_rng_generate() synchronizes with itself but not with
> qcom_hwrng_read().  This results in potential repetition of output from
> the RNG, output of non-random values, etc.
> 
> Fortunately, there's actually no point in hardware RNG drivers
> implementing the crypto_rng interface.  It's not actually used by
> anything besides the "rng" algorithm type of AF_ALG, which in turn is
> not actually used in practice.  Other crypto_rng hardware drivers are
> likewise being phased out, leaving just the hwrng support.
> 
> Thus, remove it to simplify the code and avoid conflict (and confusion)
> with the hwrng interface which is the one that actually matters.
> 
> Fixes: f29cd5bb64c2 ("crypto: qcom-rng - Add hw_random interface support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>  drivers/crypto/Kconfig    |   1 -
>  drivers/crypto/qcom-rng.c | 158 +++++---------------------------------
>  2 files changed, 19 insertions(+), 140 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

