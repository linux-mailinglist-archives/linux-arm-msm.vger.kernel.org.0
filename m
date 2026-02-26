Return-Path: <linux-arm-msm+bounces-94231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFO2ABDyn2kyfAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 08:11:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3CE1A1AC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 08:11:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C73A5310BE30
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 07:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1D113921F2;
	Thu, 26 Feb 2026 07:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c80x/QBx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AJ62k9/E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8857D3921E3
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 07:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772089585; cv=none; b=WitFj0AjBYBgCU85o6AnHtSyBwV9BZrXAOvb4iMnkVHumMnQ/QwvPrDmQU161OU7udANetQzK3VKnmHo4bjo1WECjCy8PLcX/TefbQ+QKeuO4nigqS+1KO2H1D9BnwmJM30zIw/Bu0RPyPtFFgUJuz42G+iM9LWrql+hpS3sW7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772089585; c=relaxed/simple;
	bh=skYUTt1S55c3aKh1OBmCfcq3RjOj2bcu/aZItNeR7sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HXSbkV2pLug4h9wkI2lCsnXuZM7uQbv434v1UFfD4Nuwq6fPJ2bRV3KlTslGtq3An6YtRXuieuKQJa5IUPtFdcXK+wFMDvmQ5H+Eze23G70KW5SCobiLvASsa8J0di6uDAokTsc8do51LNaso/EjW1VKUONj/R0oMz9unHz8HJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c80x/QBx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AJ62k9/E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4VEKo3778162
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 07:06:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SfMuvAb6FWQHq4T5TxcP+sxw
	r41xZa31PMCfcZBQd/M=; b=c80x/QBx4waC/W/jw0Ub+XNfcXDmFsYiCF6G9U78
	0qpDn34cCCbrpRKVf6JG2quKiVanC/p0OohApydEHiHMrQCGzCJzNoaHzWdrzWeP
	+E7zyqlVwZi281DJfnlztf35ZPWJPdWfiNNcgfwhrCyXN+iJ7IWPPzQcNxValBV1
	mojW6Mhe2XDdxnYumcoS+sgO8ub7WkSe8so8vu3YO7etNH68qHQG4Ss7uVVhIIZi
	0MOSx5oEJxkXErILmo9dOlQadrx4gNw478YgLjHn127lMNDDeDVkKcYUIb2BFFQ4
	mIdt8U4S65b1kgtdvLt/oj/nyleGNA/hKR9Pk4ef8V9B1A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjae0s57g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 07:06:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70ab7f67fso571895585a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 23:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772089583; x=1772694383; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SfMuvAb6FWQHq4T5TxcP+sxwr41xZa31PMCfcZBQd/M=;
        b=AJ62k9/EttfJnafXbCcsMtAMl47IltsfgM/OM6uPU5kjW6CmQ7kh4s93/vgoplcoe6
         RrPkD7X686cMtZt00LePNF02GSvOOuTeOJw8HwiGIASXN6avfEgfA5RJo8KH+GuhhzLg
         cnr44tJVVgZmLWDNJ1Qb1nytc+lJiIvMYjgWrUpA0NmuFqXduq8XvgP1D/CCYYdKHc+r
         tW0jIf0Lpv3yzUg+u5xq985lEExK3KzJbAA4dRM9qX5s/vPPIYG/FUjSv7W7QXawrikR
         Ez8yFYpbsVk6NjRkOt3jp7Inw1LzYjf29Ups9YT4EAcm6yfoDyIyiTMvM2v+qhaQFuqS
         k/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772089583; x=1772694383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SfMuvAb6FWQHq4T5TxcP+sxwr41xZa31PMCfcZBQd/M=;
        b=quQuelG1wnczbACtYoFCE50LTSDd2wIyc7NmW+OaFA5FsoBUqZFgODpXN+WV6KNuvQ
         M7czP6ksi56Y/hvioRsoQ3sRyydNpnNKLlsvhWUAg+0aehIrSWh5WbeLcGcI2wMon7qc
         mwFrK+8wmyzakRCYuschpVklUjNx/sb8zCapdkFa72j1PmSUwLqGDZOkmi7AUr6Tz4Tr
         5yikG7pHEVOzh6tt1fLeCpwsZSoqDQ4rFw0n9GW2ARPJzH8k96IozGImzFwuVmnUQlZo
         AHHTVsofpR13jBYm7dIHV9wu73FPBsm5cw7UjIrYnudFZ5HEnP3+0YIXq6fVqgnqTEow
         6yfw==
X-Forwarded-Encrypted: i=1; AJvYcCWwudYr5GvlRckkdnbYS2XAEdDPzUOCwQ2oBY1zyirBVE0q7/qeeW+oek7VpvKhQ0tZdJR9rW25IdnSdegI@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn8Q2Z/KXeVRq40FA66uNJI1oNyobj6pGFQC+cKg0NCyaB0+0B
	xJPvSBTFQqpk1X8kKI30/KMAjcJPzn0BhV5CvOUCWN/ICsjZfG+/nYw+qe86TLBp3RCchkZCV5L
	KblJw/omsWpJ5Eojb7k0vmOvV7vgCYkfPG+MKO5SLoajYFOb0C35RzQOrTJX5Sk8KTiwO
X-Gm-Gg: ATEYQzzUd/sTKvZdkR9jXvUZwZ/n6L96BKTJ8scYl9gE9xYwldibmt4Ao1srpC5TUob
	9U1kRyPeehFBnmYLZYwwLRjhMSdInNbKlO7H7XpwK3t/lPpP5Mgz3S82l3bicPeLBJIvGs1SRSX
	WpciXPVGhU9lEfXms/1NBPKuh39TFXqizHDNtOcRqYZZbhDUv6/BrDIDD28aemRCitTWh1BsG8/
	+mA11q+7jW7BkTpDtbVoPD4xyrAhcimoR2ptKbLLTJiS4UxiaOvTcerlq8uUW4LXmUnxZaljyfb
	Atefh2psIH/bDSp5vKN8WI4mR16w77XBzXgltPC9DsifpndQY/r2QOEp9ltU26gAX7+8AUT50gZ
	VsNoc/f6CK2oXmgljKWI4/iCFGHqeYgv5CtXSjeu9O8vQ772l8XZz7ZcR3oCLYqmd/2848X8Xg3
	Kd0t/lpsi9N89WNMj8IxJwx3FQsLqvoxp17JU=
X-Received: by 2002:a05:620a:3722:b0:8c6:ffe3:49e4 with SMTP id af79cd13be357-8cbbd010217mr418892685a.52.1772089582718;
        Wed, 25 Feb 2026 23:06:22 -0800 (PST)
X-Received: by 2002:a05:620a:3722:b0:8c6:ffe3:49e4 with SMTP id af79cd13be357-8cbbd010217mr418890985a.52.1772089582318;
        Wed, 25 Feb 2026 23:06:22 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a109df2cdfsm469132e87.85.2026.02.25.23.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 23:06:21 -0800 (PST)
Date: Thu, 26 Feb 2026 09:06:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: lemans-evk: Enable the tertiary
 USB controller
Message-ID: <ogtehltf7onbtwnn7kvkjhjyfoh4zhjltgzq4gf3f3lwoyhkmt@le3lrprfdvgw>
References: <20260226060835.608239-1-swati.agarwal@oss.qualcomm.com>
 <20260226060835.608239-4-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226060835.608239-4-swati.agarwal@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA2MiBTYWx0ZWRfXx5fYBmFcrisz
 oLf7QUanCx1EMvPptIlk1onfbvMm017kCAzPsfwN5SqqOgDwA2448U7SnyJbF7Tsfnr90POAyc+
 ejnhs0+3D7OsoeUvY93YfcJQYbnbQ68cBCQwxEReFKm7ysmpSBdG2ituwUp5VvFMrly99YaaSwV
 V1GHnBJWENFVdb3bVhfdvfF+gjtbn6wS+rkWsbbLLFIYJY7tiwr3vRYP96AzeI2r2lLBF9jC45e
 /NYAZWZSO3Wcw+eolXd/v3aEAeNIDF/grpHoyiDP+fpSbL5zsdxPgkMMGvtDHHqYTs3FRrcGsyQ
 8j7urjrQkjzNtYwjdb5u9bV6iA8Xk7ufpWGq40R6j/6YKWm/MYu6XyjWw/V36DdCtT9KWkuwqiU
 vdGqluUKDQOlBU0iIWuNw9jZH0SjVhwDS8H5oM5eql1snamBZazBw7Cdf5L5rgIKwy5hdsKJTS1
 k4QHkxjFBXH3zj71Rag==
X-Authority-Analysis: v=2.4 cv=O7Q0fR9W c=1 sm=1 tr=0 ts=699ff0ef cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=7qqFDEp5lsRhK64s0KcA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Ne_8qFLs45f8o4SObQDnI4zzyRXwffp5
X-Proofpoint-GUID: Ne_8qFLs45f8o4SObQDnI4zzyRXwffp5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260062
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94231-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4A3CE1A1AC1
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 11:38:35AM +0530, Swati Agarwal wrote:
> Enable the tertiary usb controller connected to micro usb port in OTG mode
> on Lemans EVK platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 52 +++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> @@ -132,6 +151,15 @@ platform {
>  		};
>  	};
>  
> +	usb2_vbus: regulator-usb2-vbus {

What is the name (and the label) for the VBus regulator for the first
connector? It's visible just under your chunk. Why your chunk doesn't
use a similar name?

> +		compatible = "regulator-fixed";
> +		regulator-name = "usb2_vbus";
> +		gpio = <&pmm8654au_1_gpios 9 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		enable-active-high;
> +	};
> +
>  	vbus_supply_regulator_0: regulator-vbus-supply-0 {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vbus_supply_0";

-- 
With best wishes
Dmitry

