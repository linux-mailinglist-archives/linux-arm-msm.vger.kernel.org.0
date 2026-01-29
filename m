Return-Path: <linux-arm-msm+bounces-91139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDTZMCAge2lPBgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 09:53:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F86ADC97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 09:53:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B4DE2300D247
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 08:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1727D37C0EC;
	Thu, 29 Jan 2026 08:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EUD6iwYP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fYpY7Nbu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E557377543
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 08:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769676273; cv=none; b=T1zBb5PGPaO2+ZJskSdwtxkbynAKGK/DAKTR5u5KEixHLZcu55r9Ldm4uhmJ15BhI3Ie2kf0V3BjQkVd1eO36K2GYMj6cz5BjPl9IOjj9NgdsXWe+qh13OiVCY7oHPorUwoKdrZFemITb1ISSJkvFe14Jjqh5KN92BLITJa8sic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769676273; c=relaxed/simple;
	bh=66pb9YdKGOXrnljgEXmlZlI7h4bsCMV4O6UC+UUEzJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKysjwWxZCbklxpiqV+a2pdbdzyQ+bGpGtQ5m+c/DZ55i73YvvDcKyZy6ktmJH4X55byizoPRznwsMoAVkTtdgVWZEkfqiSppMs/0TMLVJQwBQrs/5o+bC0DcupCyFkeFIU38G1ohWeA48q60NQWq1l38srofjW4RwA7vou9G88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EUD6iwYP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fYpY7Nbu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T2p2OZ2150699
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 08:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2fw6gz4VUsc0OQodRgHV+88H
	0+YIRIVJ1Np6V0umM0s=; b=EUD6iwYPA86gRwRKLHjraPTcuDxB+SJOjoyb1Tkz
	+gJgln33dCrmxjLB1DfC66AtgUB18ezxN1nANBEGrWZ2WfghgNNrgc7m5uxXz88R
	BXqwlCKglIZz9HPZJ6zm7xZoc4lPX2O/I1Q4xa2aRMkUTtf2MFmW/Wj9Upl6bfqv
	ZW+NXV2uTA1BO23MsFIrDc7EP1+Hfisueyy6zh5hD45whk8Ne4dfu9dlYm/j0vzg
	Sbzh1Crqf7e6R5YscTWHTavbiY4+XKXC0bYk/CmTR6kh0e7U5AhQ7f2c4prZGTYZ
	staawRBwWf8xVnZLVT3OSEeumV+DyAGnp6uRv2fYgwgvMg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byph3apb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 08:44:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a291e7faso314681085a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 00:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769676271; x=1770281071; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2fw6gz4VUsc0OQodRgHV+88H0+YIRIVJ1Np6V0umM0s=;
        b=fYpY7NbuM3p/ldQeeNqWvQvvgdJGge0SIo+TmZQsX9v32R4GeLcUaG6Yp8VnIsCA57
         TS3SgxG4MSV/to4d0/bWiVzgqQFwAaVaxqkblacmCS8P1w+Ff3iMhaFfQDpj/5Z/PMv1
         TM0wSs7Ofw/6zt8jVW5nMNw3WHJePzHzUyy4RGg8Yi3imjlp6Lcxk8dNEQYjWk3XLgNR
         RjcKHTOp0j8ctEPsZmIi8BC1ZYaoIm7bl77k4iMfukuP7ghqiz029kF7m0T1AL3fVut7
         qFci+mN1HAeXta9xoRhESttUYQDcZh6lNF9Pv1t9qIuVERWvhUL4q9Z8y+Rs6hKn8Es1
         TJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769676271; x=1770281071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2fw6gz4VUsc0OQodRgHV+88H0+YIRIVJ1Np6V0umM0s=;
        b=X4DVmmfuQfcXAl/EKys4iAkB4AUO6iu2tf9ZBtf/Awe4/JGCCoYY0lVcFHO/bRnpys
         qhviDLJ/c/7Xoid00jABVqid4XHSLyxMuCmof2gwG0rVz+Zdw7FyydpZcxPSeUSNOk5m
         i/9M0ENvqbc0HjlEB4VwBzW6o9kt9ZwMecJMs1GVDdPDDxyxp2lLDlyVft20/qSp/xqL
         EP6WlH2D15QFWYbrAgZhTLF1IdO9sqrwXENiw3lX6ZbmHXz4WBTnqkjVaDQsXJ7PyTiE
         yhbSgYdszo9RgZVOVt7PcawOUPpWT+NuzfGFlE5EFecS6h+IGatHqx3oHg/dwK7eGRMa
         kPhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtXmUa2QrAb597LA6qQ+Q0qpN458T/Dt/Hh5qOJChtosADTsPc/PCCl0436FvZ7E/103jbhABae9NXtrzu@vger.kernel.org
X-Gm-Message-State: AOJu0YzOoPobCtmzi3GqC6ff2smTb4mi4N6AalN3zQw1XjKyU8lqhzUg
	noCXekNdVIUalwdg8l4ZKXaS2h5HaWYM6g7cyekOLcG8kN5AhWvV9Mkx8CwTJwfZXENOflqtNIG
	MHsFaYF636rpy82d9UKnPjIOfXFELcnh0EOyHT7S9atLcIuhFDH5QX0BayyzCtIaKIhBS
X-Gm-Gg: AZuq6aIpmq3BYE6mQKQs0fxCrDwQxnosV2Pp5//wusW5h+Gw2xQp7rXUOvL0CPfS3mu
	1D3tvEiszpMxO3MCQdyuyQCuOhxfsUYV4pfrowqjwmweNpCEubq0FEGUYLFcWyWTwdG1y6dZD1z
	XT6waEDoKk78p5+7lXdDqfOqebicwDBIlGprEUqSLcuvXuTMLBrZnkV7a7toVx5kbmJENy/Js7d
	/LrUP6d+8Gg3bCoxSVKMZuyQyDxFd0MTQhWzfiFN8R4sGRqbPLzmt+09yd95AYuaRGNA403QBjf
	juEH78A8BuiabOTp6KDIRI0Obx+9KVVrwkhtMMRqcqQamq3GoZqNFwEAbmQA3AVitZeqrj1o24R
	CRkQo8l0dBiJ/oyG6VcjDwsOq
X-Received: by 2002:a05:620a:a105:b0:8c7:c25:9e53 with SMTP id af79cd13be357-8c70c25a132mr976826185a.59.1769676270446;
        Thu, 29 Jan 2026 00:44:30 -0800 (PST)
X-Received: by 2002:a05:620a:a105:b0:8c7:c25:9e53 with SMTP id af79cd13be357-8c70c25a132mr976823385a.59.1769676269943;
        Thu, 29 Jan 2026 00:44:29 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-481a5e09b70sm5151555e9.15.2026.01.29.00.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 00:44:29 -0800 (PST)
Date: Thu, 29 Jan 2026 10:44:27 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: document the Eliza Top
 Level Mode Multiplexer
Message-ID: <xl2n6r6cdvtdu5p5ygwm7sil3sdzqvafzxun4je3zi5s45jins@ltwlrs7y7mqk>
References: <20260127-eliza-pinctrl-v2-0-1faf78efdc2e@oss.qualcomm.com>
 <20260127-eliza-pinctrl-v2-1-1faf78efdc2e@oss.qualcomm.com>
 <20260128-hot-camel-of-acumen-eef9f2@quoll>
 <aizrc6xysfwzygdsfeuc2raccq7efmwg5bn6v33t2de6ugvzgi@z3ipf3i25ulf>
 <eda9a855-912f-48ac-974d-09d557a24bda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eda9a855-912f-48ac-974d-09d557a24bda@kernel.org>
X-Authority-Analysis: v=2.4 cv=Z93h3XRA c=1 sm=1 tr=0 ts=697b1def cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8ISVNiB3LqybwHucwhQA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: kTO4uDf6wBdMocS2FKwxnYegiHNOrH1-
X-Proofpoint-GUID: kTO4uDf6wBdMocS2FKwxnYegiHNOrH1-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA1NCBTYWx0ZWRfX8Rrc2dAUZblb
 MYr+xo0VaByz+XzAKmw5sXw0aaKbQ3y+FcOqIsd4g5V+Pq+TB8LafFGIwa1c9F82+nKZEmdVC+8
 MIVGgyYcly4Qt9BnW7nKljsRppYJsVsXo6FR/7bhoN1b8n7+wuuPCphjtuWWOdtuX1pT1bVdYaO
 A20EWuFhh1RFZqBf4Y7m4q+qMRnrUoGFDVurUwtftdbi7eSUit9wrlp1Mz70oKaSToI9Bh415jl
 oJMe5e29xKHhDwYeSh9IvBWLtkHkn/TORAgheB7ArAK7o53B/Mu4FfO6Kr7qjm3jYlf5JMB3Ojr
 KCv2SsG/bmgHNSziH+H6SsHGKeJuVpeiBKommSkWQQV4l7d1n/x1wA9WlcZ1BVrQOWaGXy9Xlp3
 V2Yg9XCaS4bPd4VAzmQ2VL2ucnH81qv0dVn+D6+T6xoBrottMr37gHiSkgyEqxmzAcvac/12brJ
 X0Auhy6Vx4F3ejzmfMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_01,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290054
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91139-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E7F86ADC97
X-Rspamd-Action: no action

On 26-01-28 20:58:25, Krzysztof Kozlowski wrote:
> On 28/01/2026 18:22, Abel Vesa wrote:
> >>
> >>> +
> >>> +  gpio-line-names:
> >>> +    maxItems: 185
> >>
> >> 186, your first GPIO is 0 and last is 185.
> > 
> > Actually it is 0 through 184. The 185 is ufs reset.
> 
> Then the gpio pattern is not correct.

Yep. Will fix.

> 
> > 
> >>
> >> After fixing these two:
> >>
> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Best regards,
> Krzysztof

