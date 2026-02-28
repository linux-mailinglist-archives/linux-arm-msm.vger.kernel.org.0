Return-Path: <linux-arm-msm+bounces-94561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDzxIqaWomn14AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 08:17:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 084D91C0EB3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 08:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A1B843020FF5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 07:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54ED336920B;
	Sat, 28 Feb 2026 07:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fo7p2Ff+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gn9SzwvA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C6536605D
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 07:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772263073; cv=none; b=QIl6GBN/YciuqZu3IkAgRBgxfEE9KmIteVi3p8ojcCgmZHosULCAGd1bfYmdWIQbtdDjRsv7XBZbNmqRBA5jL1s1JmsdNSh7MRQdXuNpKJxCx7Jev62+By/1a+lLJplKFLwJyqg/9dpWtYj1nJuiAy77hm0L+CH/x7PTaPe94yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772263073; c=relaxed/simple;
	bh=pjHPMCgxqYfEhJbUMXAgV0DOg/qXZ27i6nxNztl78RE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3PPr/G9ATCZHVSq2SNXarpDSGDgp7FJzSbnZF8INRlGttrTon26eH/uLd1znsF2v4rI0xpu9t1ZEprbZlQMScYt/i0HnaFk2P6A2xnOBIjNM/xQafWBcrgvLNTDYCScpCB596he4UxgwFpHdCUgIh6qiy0+/e9CKWpu1iRN1ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fo7p2Ff+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gn9SzwvA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S6OFFC3832774
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 07:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XhQNpl7AQEod0mH40aeXlLKN
	V3u3+gs0tTBY/guFsgU=; b=Fo7p2Ff+Z/f1vIf11BNVx4/AywPkMuVDlKd8AXXN
	RLzkKupz9h159MGRlgAmMa9s/Aaju7o9agFqVNc005CPe1qjvCwEi/OfAA8mKWB/
	GlT1dID9FoQDZo54kKNBh3bWeGyrec1Z0f6PtK3DDtRpGRusXkljTt0h65V6MZxq
	Li8F9VsVMYOubnQXOPejsTgMI2SX8l2KVVxMppqbaqeFyO8vqWtV9Uk/+Sa257Zy
	47LiX5KEznMtqYCDYqCPoF5Izj3aTEoSUABisa3pKKUKc+H9X6xGK5Hy+NyjSVEF
	cx8GuPvNdIWmQIL6Rw6F6O6C74XaIYZt+9TJbaEhNVhzDA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksf8ge9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 07:17:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5033c483b76so291987941cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 23:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772263070; x=1772867870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XhQNpl7AQEod0mH40aeXlLKNV3u3+gs0tTBY/guFsgU=;
        b=Gn9SzwvAKgg1DzX3jffeRHAMS6w57mE7YgelU2anGKbYRYf1jXFeYOCQO2/HFQhBIb
         x8P2yoHFt8uo0VZi+he2SBgxrWXNKaN1JDJfEKJ1yU35O5NAPYgT4rdVWc93GH9LxHtU
         ER3VMjMQTvc+81mpkTuDMyGMTStficR2fMiJvARqoHt9xGUhPpdE5BGP7ZTymcM4/mCq
         3GjqkK33gp4/VgrJ86QflEYxHHAIvk+DbICuPHyXSoeirBbhaqqqVv8d9o+lIW70RDWS
         B5hgkhEsgWz8haZDVkHqdprGGeuZVw9/qfFjWcr0AHJ+Se6vj92H+XtYuySqwF9TIaso
         HtvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772263070; x=1772867870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XhQNpl7AQEod0mH40aeXlLKNV3u3+gs0tTBY/guFsgU=;
        b=IF6ATV/72nCcEBe4bHevjWjgaMv6kqgpRtrVEXVycnBDkYVnDWGBiWYPGXt+NEBt+t
         8zQPhy9AhdcuzbJjgX2aqHxYD5oaT99k3OYzlgyvFRCZcZa3Eq09sqBdhJQP+4PBq/rU
         9ZuBw2LkNeRMK8XYTuwaVWZ20ZZs/hHaEcchjsDKvUrW7dJoVE8lWSe7c/K883/V6QJH
         qxf777O5NhoqCq8zkdTi438FhYXX68adULqWCKJ4K9mwZ20fwFh9KC+uLwI07RI39qwQ
         iovaK2ktwsxwhrxsyLbPyUEBqxk8wcgExd/1qynZM1pArQ8QwKfZNHGn/YxBW7EdaXCU
         Ge3g==
X-Forwarded-Encrypted: i=1; AJvYcCXCet3H++20CpzfX8xbvqnEhN6RzbXrQrNgmW8+Sgh/RJXlc5YzKdiQs3Klg9rx2yd3zqk2cOy3hbY38coI@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq5xZjN7x0xgPvvoLoe9CqbRHxccKfghlINpFQL6sHaAmQeQqn
	oxs6YZm4uEvD8MJJAJrzLDJ53C9YbHDR0ENxJWMcf5xgEJzNEs9ak0d6n1TMAn5S0TD0Ia+am7x
	F0A8b575xF3rMbYhtYsZTzgmM8sa2Y1j+b6V/xEb90KcjingG00z0usGnvcfuAlDhDM/5
X-Gm-Gg: ATEYQzzf7Wl4MH6fJFrgKvFFEZWMk2u+dkqFCkuyJFlv9BPbLuZwA2RO4P3i8FYHQ8g
	9b7CpQTDMUMyiqlXbRa1JmvUYYAyVQeUlY0Mm3WttnMrkNSMzBJy+yx4Xn77wfaUar7PfRC04Dk
	tCo9jsLkxXzHr0oY1fDs+v40I8iTNlmhEhJhnLGAGLMaWn72c5AIOppj0YelTTA2LNpS9cXDxca
	HueLAk7mqcib7F1klQrhNUS8kcEqeDVVz41pFadKtLpfvo2PA1eV4SjPLpADsQxpdQKe0sQFv/j
	pMjOC+Ym+t+A16Nk7mtjm+IfeaYSx/iiTjDAjERbFan0S5ARbF6JfY/h0agoPv5yThAN7ZEDbst
	VX6q1tV2ZP8QMJvTOLsOlTHG177vuDIVCxqJYG8mHYjG6GquxqUt3en9P1519taFQbmsMt+870b
	08QzWUlHN5FcDLnpf0IJrcDWeQaFNizhbvqH0=
X-Received: by 2002:a05:620a:7118:b0:8b2:e1b5:5f20 with SMTP id af79cd13be357-8cbc8e39beamr607082185a.80.1772263070362;
        Fri, 27 Feb 2026 23:17:50 -0800 (PST)
X-Received: by 2002:a05:620a:7118:b0:8b2:e1b5:5f20 with SMTP id af79cd13be357-8cbc8e39beamr607080485a.80.1772263069886;
        Fri, 27 Feb 2026 23:17:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a11771e36dsm262153e87.78.2026.02.27.23.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 23:17:49 -0800 (PST)
Date: Sat, 28 Feb 2026 09:17:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v8 03/18] dt-bindings: media: qcom,x1e80100-camss: Add
 support for combo-mode endpoints
Message-ID: <j46cw7ns2jvcojavsqw3f6se5zwjt6lfx7z5ahy56owtrwd27q@ufjrfwnfk453>
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-3-95517393bcb2@linaro.org>
 <06249a9b825de30d1fc19fac873840ab3cd7f6aa.camel@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06249a9b825de30d1fc19fac873840ab3cd7f6aa.camel@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA2NiBTYWx0ZWRfX3Ec2Cw6aoCAn
 1jr66rPOtZnJ1cHsUxEzcX1/GSu6S4o/SmQLlALkGcmqWytnCROsUsOB3n0CO00zylcv27NtYzQ
 usZl6S+qzkemXxeq9rEOz0yskU7x98FgNbLkJGP/fJL/HCgXpR2snRz+6m9NPflTvT2h7mOuW7D
 kc62K1putBDLG8JJBUS7qKuh3NVZXcG5KpH6fB8KX1pP0OftqmInNz0dYPRoZMU0n+PoH0ES0VL
 hs6mf1W8wJeqLafYA3zscZr4e3NjLqv6zoagZ5EjpNrn4K9TEsP3RyzZoxlf+qxj0Aa9q5dGihm
 2QUhE0w+FDxlg+nctfv4KHNP3DRnfMLn1cGX2ARtw9bFt52QCD4K5C20TorT62/R3mnbmVTZt9D
 CcvNZiSFd1QF+iZCTFgepEoYQEXYMfqrs88uJDhtkhuiVpjNcPNSa60NBwwjG47XCuojBXafjKw
 lEBlFu6bL3m8u7rGjrg==
X-Proofpoint-ORIG-GUID: iAJi6M99P0ZfUle5Pz87V3q_vfwl9Uhk
X-Proofpoint-GUID: iAJi6M99P0ZfUle5Pz87V3q_vfwl9Uhk
X-Authority-Analysis: v=2.4 cv=I5dohdgg c=1 sm=1 tr=0 ts=69a2969f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=lcIpdndxgU2EbPpCd8EA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280066
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94561-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,baylibre.com,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 084D91C0EB3
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 10:01:43PM +0000, Christopher Obbard wrote:
> Hi Bryan,
> 
> On Wed, 2026-02-25 at 15:11 +0000, Bryan O'Donoghue wrote:
> > 
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>

Christopher, please trim your messages. There is no point in having the
whole original patch to be quoted if you are replying with an R-B.

> 
> > ---
> >  .../bindings/media/qcom,x1e80100-camss.yaml        | 69 ++++++++++++++++++++--
> >  1 file changed, 65 insertions(+), 4 deletions(-)
> > 

-- 
With best wishes
Dmitry

