Return-Path: <linux-arm-msm+bounces-111954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +1gbNlMNJ2pgqwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:43:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C355659CFD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:43:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Z/MZx9wx";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WMN8KRtC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111954-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111954-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3BD64309472F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 18:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD1E3E2750;
	Mon,  8 Jun 2026 18:36:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6982F39B5
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 18:36:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780943771; cv=none; b=aJ4HmziMFg9esIbwf+7S/8beSIg0E8yOFmbzElixdqqB9mE9wXa9U5nw2qfUFsp2PT+MAKXbr9I38ghKas2X6udcjnjUZFN508BRz4hIo9XfqASSMsuR77/OsoSbFV+A0vt034MoXS8BWWIgz82nz23CjYuKy61phW/eCPXz0UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780943771; c=relaxed/simple;
	bh=+X4pezE2922d596Af5ASfQnVu1TRws/IydngxFVvotI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YE9hzCnLfe/gabrrCCteRSHVr0vkVjnFs2NJRlyYVqFzUxNLTBn+5rSoJUgfad5SQFWONICEYdAxWurcDAYt3S/RxyG+DL91xiDIShNtgzroiLBJO8tYLIkt025HdNpU8k7KF+ml/F44uzboiXAdomucte8t5BHHEuWN0xezgBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z/MZx9wx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WMN8KRtC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFawm3588524
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 18:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wxwTllO3Xeua002xBaThYp49
	lPGhAz0Nblos69p+78w=; b=Z/MZx9wxfzFDrntwSanVF38O3t2EX9uPwECseMfW
	Ahi9H2LtV/Z0fBwxAmmwTcavWbBkTNnBu0nvTm/778OT/8lrDfH+nkpVrL+ybERl
	Z24corn04QuL2vAttWEG3cNngAdbtuo0OyN0x/p79VZAdbEVs58128Av+PrW7M9u
	zjwD4V1WhFWGyCSJjCv9r5hJCBazsPeikKIgsEznKRvjrCdYoTWWY8YJHnrLz898
	JCxiJi6c/Ss8RWGF/ectf+d/dXY72LID53/pRnLhr0XcEHYqAE+A0RInLf1tGBc8
	1bJG5TGEdKxJkNXY+d2sk2X7zJeoYxkPitCb4oqTW/kmKg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun42d7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 18:36:09 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6798c46f723so2562426137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 11:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780943769; x=1781548569; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wxwTllO3Xeua002xBaThYp49lPGhAz0Nblos69p+78w=;
        b=WMN8KRtCc2LSPoUQ0kYAPVjcLCUq5yz2d2qXOPs7s/fS7+HsojawuC5LzUBA9gZbhq
         9LgtKSovtiiRnpOwWSx/Xi1F63wvqBRZWeodBSGpav3ocPiHaJFYauEstLwC1i+V75s5
         jxq4OZBQ584dzl3163D1HYyvnNiyzz2/LAP9/NmZqWdKk4ZQTyFfvZNshl17SrB5Lxft
         q45Z7gsxzUwhVoy7ZJMU6UhmC2rWOLoCSwc/BwNAjB38TB0ORhVl5Tu1UXW4dPwLgKS2
         EEpeqLggAwGJO/o388wwRnZkHYYUMMznyUo4oE12NWqf7GyzXoHZaQobOq/UF1q4oh1R
         hB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780943769; x=1781548569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxwTllO3Xeua002xBaThYp49lPGhAz0Nblos69p+78w=;
        b=GW3mlQ55GorZ9USfSF+UHVawAcnia5RBM1UzulD2xLQLyRgIMsbey9FcQuehvk0Igz
         R6m23Z8jZXEXSrKSHuq+tfF/3nJzt+AQGCKnBk/abXhFJ70CizmNLeKhNtOTgx1yR+AI
         CQRjr4Gxhja81l5ywvTYOIFQs8N9wsmncdMkorObXCoNDw0+ojhFk+m6uJZgsxAr+UWS
         eUO8TY05Sm5HZiOwaFTQaa2SYVAAbGGqBuXwELZvZoXbvX+kWgmPmt2jTlQwfNWSDG44
         OEeYNN3h9pWE70qSvjDY5f79zfUC+N6UuYj1RRA5roIrlZAcJUpCw3ZnMkr7sTfmI7lO
         M0Bw==
X-Forwarded-Encrypted: i=1; AFNElJ9UMS0B52hP4G/ELTKUvLk8LCLWhZftKDQwVrgRhn4SmlXXf/iq8AIbSKs5ytJ60inXKKYUcszNUbg8cGkn@vger.kernel.org
X-Gm-Message-State: AOJu0YzR4Rf1aHEIurrnLH5KXcXlDa7Xb3d5/3AsM6VRQOzIh+9vvjHf
	XZlq5q5wdXgU/dGhtO+PAQVBGeM+fHnA8My0E5qo1KM0ZXrPsiMBo5d1+WZvvwOa9hoapuRZuno
	jpS99amzUKiYp+1jjsuh5Jc7NGnZcVp5WspE9+D4FmC/dJFJgdiVD8d6bOu1Z7CSL/WPI
X-Gm-Gg: Acq92OFeK7+Saz9NMW7l6V1FzqAsIvZY5H8ZtRLaAths6bf+ZtvzTT6ranPCX7foPf9
	wkfv0jgJEN1SKLTkvOQZlc3jnvdYHAOlTuv/i/gTuI/CwtxOfmIrDCnsDyxgXuVPf3NZxS1RSBY
	ruw8WKkpUebMn38ctMujMS5g2wcD67ZZPCDwBLH/vMJ7e1DT3vZYKQE6pexaBqUgegafWLuY+Eo
	OzMdIXGSOOfaJo/GbuGkiLBvl55N/DI3Q7f4UNEggEAvafV0tWJkb9hSpaXIBKRsr2lprYl7Eks
	xpI3YoPMVnDH0dYcjIItiKgP0kT0Gxt8K3H7kgLxUzF7UhWJoXRHmgY+pieMUuTWEklFCTHQY5d
	28nFjgQxkfDS1RSDSw15rJVfIg1NY0hMb2FMST3hOr700gOKJvWbk3E5u4pqWH3k5nuASk5kv8q
	KVNxMZwzKmDa5JsC2t21q+7rRL4+D+kWG5tQbC7wn1eh7d1w==
X-Received: by 2002:a05:6102:3749:b0:5ff:c5c8:2734 with SMTP id ada2fe7eead31-6ff0610cd27mr7976931137.25.1780943768607;
        Mon, 08 Jun 2026 11:36:08 -0700 (PDT)
X-Received: by 2002:a05:6102:3749:b0:5ff:c5c8:2734 with SMTP id ada2fe7eead31-6ff0610cd27mr7976915137.25.1780943768168;
        Mon, 08 Jun 2026 11:36:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abf66e37sm51078631fa.5.2026.06.08.11.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 11:36:05 -0700 (PDT)
Date: Mon, 8 Jun 2026 21:36:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v5 3/4] clk: qcom: smd-rpm: Add missing RF_CLK1/RF_CLK2
 clocks support on Agatti
Message-ID: <a5crn75rxxqtf26ke6552b27ar4xrglkrwdgw2sfnkuli53ymd@2gapkkkcx4o4>
References: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
 <20260608-shikra-gcc-rpmcc-clks-v5-3-94cefe092ee3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608-shikra-gcc-rpmcc-clks-v5-3-94cefe092ee3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE3NCBTYWx0ZWRfX/H/hctU8dhTr
 dzlEZlsNIUy/HlSmKDDddfeAMfeqPiaBmG8OuaqCFlRbYZ2hM85oykIPGwwh8gya44aZ8sPWyor
 afb1xZXWQclAzkyxOvkAUam4W6fXSiU994hWa6H9mAiaAFGxeSZ7Rhxmbi4ELLd5+H8+R6Y9zUa
 QQ5NsvKME8inAKK5sotP8VuZ3b1n6Fj7SAlgMtrSP9kRjbJF4GXMp6BplWQ5mLkQKLQShUhicsb
 nb1hb3gnBIghwnx1+RZtfxwvx01gANz1QUYIDzDmdjryr9VmhlwydAN62LyO7WKuUiv67wvoJN7
 sWKr8SIE0ux6tHghtytq4/E+ngIuDHqqnCnXzfq1MVHZ2cRC74IHxeeYPWqBaQI8inlpWIoUpqN
 VakirQU93FWX6xAW4/tqhVDcbYugGaW0VcOQUy1O1mCZJZ7dQRY8jXHC5z3XisqImLQqY627M5f
 paGcjy+zQ37KRUd0gmQ==
X-Proofpoint-ORIG-GUID: R4ia8aoqxvkqFVvTpvOFwpt10v0Nz6Cn
X-Authority-Analysis: v=2.4 cv=ZY4t8MVA c=1 sm=1 tr=0 ts=6a270b99 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=G-4fGFNKO6kq0i09DNwA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: R4ia8aoqxvkqFVvTpvOFwpt10v0Nz6Cn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080174
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-111954-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,redhat.com,oss.qualcomm.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,2gapkkkcx4o4:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C355659CFD

On Mon, Jun 08, 2026 at 05:51:51PM +0530, Imran Shaik wrote:
> Add support for missing RF_CLK1/RF_CLK2 clocks on Qualcomm Agatti (QCM2290)
> SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-smd-rpm.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

