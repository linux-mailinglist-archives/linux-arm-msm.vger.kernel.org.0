Return-Path: <linux-arm-msm+bounces-108678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TTYoF8yHDWquygUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:07:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D0858B56F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7D6933014270
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A7EC3D3480;
	Wed, 20 May 2026 10:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ASPZoaiw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gq7LWZSh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2F53D0932
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271620; cv=none; b=UNJH2ADv2VyFRwBd2BG4HZurVk440Z1GWpJc/+xngcPn1Ag2yK8r1tLuueO1twW44z2UoP7lRTdUCibu4oMoH9TOOKMXt23Gs1Zvt5Y6KBdhcLFQf/mHl/Iz5XOCckdf1kTRG43JaEjOQItCCOTp7FO50w5mXc8OUI66oFqCb9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271620; c=relaxed/simple;
	bh=j0UihkY+EzAeIyTlsNC4or/FEgB+Bl32BBoQvSHVKuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aPvHR4VlU84OiU9RLMHCK/0VDw7+70ZWiLGEykV0gRno7aL90TO6m3cV45NvjfdmEEMbbvOBVwGctBDKKHk7YO1AiVdkG/xU+HRk402NDNkJgzIaFYM1ohXmnsJpSake7GQglLPogmgfxzM4mqkiC9xLFFFXk5/xReEY3vwL46Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ASPZoaiw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gq7LWZSh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7COdn1725548
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AGX+vAIPNPfSe9tyWRc0yWm/
	nuyWTcL1gkeha8UOlUw=; b=ASPZoaiwYTm34SroNifykAyTtqWWxXB7hxODcog1
	1Edg0MwNF+FlAzI/Cs3kCo1OQdd1Oa08swvOX+Af2bB0zt9fxSuu5WHXFW7sfYhN
	QVedubnhFR/muuTRL6nh5O90iE2wWQkPWwYPdcar/LxSvvpNXSnhOJKriVdShhGh
	VY7znRr1cOkxhtWqqDdEPbHKLe2Frh5sdcvBJJbfPxLlzdES6/qrcZCwSC09lNZs
	uV7p2Bbnc35zT6jfh+YlinvG1DSG74tDdYwtQRukkdZaFqBH4LvcTUnfW1OyUTEe
	lqx+tKjwzYTO2s4h+IFFyYlzYPynALW0knraRIFGgi1wLg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qm7fh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:06:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5162ee45a77so122304591cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 03:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779271617; x=1779876417; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AGX+vAIPNPfSe9tyWRc0yWm/nuyWTcL1gkeha8UOlUw=;
        b=gq7LWZShvj4M8vV6lBdIJmQyFtFcO+nqA19Ht5IQuGd5wLXO5vUXDriLZOqAyVQdnZ
         87Ltuv76vrjcFVK6fiMA+2gS8UGDPaEOt7niYPyzR9JAJ7jAXdxp0rBfuD2NkUCPixlu
         xZWvEVX0QHaDQbhL03B0aufd9FJvO4xznPbwYii7bflI2A5BeLYvzftqag/S9SolZUjd
         UIEw4TzsIc4SZg+x499EnZ3JjrPl1DopkkrShD6Sap42c5Y7JL+5OFQjYG8wZt3JrN+6
         tCXE1G3NZWMKi951beOH/dsmSynbzyga4YJHFAtgFi/MfroNKOmqUD/bjkPSx+YZ1peI
         jQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779271617; x=1779876417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGX+vAIPNPfSe9tyWRc0yWm/nuyWTcL1gkeha8UOlUw=;
        b=AZ4cjm9jgKAXVLw9XpFRy05ENYiukrdl8WirxP4TW10zxIx7q0bVGINW3QzPgc9p3/
         ad0XeAH1R9YvIr+QHdchcrTh/xvVPPP9EYifhL6UFu1ZdfSP5ufw6AE5pDyf5eRsCl/v
         jQBhOkK15lWmCXzlfe4v9i6DaYagOwVa9VCaDfC67JDMkHSWMnyut3c5YSFcgSliBFAf
         cDSVFDflRoxtQUFQLmRqU+MeczFHkGN8+BWjYUpqV+I5byHRWLVIErjsCGSj5NwLl6xk
         X3xPLF5sTIzYTWxcGRQAsxOdd7c1g7CQltmRVlsptk+XkEVmr2jBV7j7Gdclp29rguP3
         1Vkw==
X-Forwarded-Encrypted: i=1; AFNElJ9ez1sMH66GvFZFil1t5ZhGx8iKYRQqUrMVTwaIh6TJl+qe7xwJ1ioUi6J0R5HOqVGRBwQP3V8tKq4rMaHN@vger.kernel.org
X-Gm-Message-State: AOJu0YyH+zg8/E/4gbaI6d/qcjY8uzJ+BfreY/yaeg2MLQxRfftEiwOd
	+MI89XT9o3RxVqvcrL5Ri4FEou8HQfyS/L9JUHkcazZ7i4qhEea9EgziD+XnQvVVcdVqKMI9hDi
	OP5RZYf/zDaEFhBuYTtL/V11ucGF42Vcnz12AdQk8pbYsLy9uNgZkiSHsN/BJKdZb2Zrb
X-Gm-Gg: Acq92OE8QHlUrKrWHBEojl8iRZtEiTs6PqQkakL1YxUaC9x+wXgXP5iDYgSliLCPVtk
	9fiqpPGmP3TjeILAEh9LxkjcPCCUm4nsDCjfVQQAkkKJ6m3n3O8HE7PM+YLnj1NEF6vJx3UhQ25
	8Mi+K4BGOvW+XYB+LaFakvwmKuMrRMIVeTGGv/5EfXXh9aJfHNi4wxfZObvTHS1pSCnLqv8TXGr
	xh8e+K65EE4hBtpY6LvSvsGcH9ldXmM5bvmHqHO5oCc++LtWRIU/uzrV1Q8W7wL0jZYqm7Z2+Ip
	HCAAMXgRpivJsAds8DoEum74LMo1bGTbevZTmhhleuO7OpkvWDkjUSPjYYTFqT5fzZGFtzuqdOj
	io8AS5ngFhqlKNz3dYWhV27ytfgtvnITPjNi5xfnRMttMQG7ZxjrGvwxFviRVzCM1rgIG0lN4ch
	pdI0l0XidAt2KHiQO0gl+W4b5SRUlkLzbX8Gg=
X-Received: by 2002:a05:622a:418a:b0:50b:4b2f:1606 with SMTP id d75a77b69052e-5165a02aaf6mr311883301cf.15.1779271617272;
        Wed, 20 May 2026 03:06:57 -0700 (PDT)
X-Received: by 2002:a05:622a:418a:b0:50b:4b2f:1606 with SMTP id d75a77b69052e-5165a02aaf6mr311882841cf.15.1779271616797;
        Wed, 20 May 2026 03:06:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a906c3ed96sm4935907e87.0.2026.05.20.03.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 03:06:55 -0700 (PDT)
Date: Wed, 20 May 2026 13:06:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: typec: Add Cypress CYPD6129 UCSI
 controller compatible
Message-ID: <kckacvc2bltflnfqcanuthjyaf4sel6qdrd4rec3t4srtnnm2x@clskftxo5uqx>
References: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
 <20260520093902.2064730-2-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520093902.2064730-2-akash.kumar@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NyBTYWx0ZWRfXx3JDSWiBrGN9
 oonFCFrigtfy5aZqeSZ2sKXx/bIXcCkr1ay7fYGPzFxpUgBcZkvoMVTT+7UDmoSdH5V0sVTNGVE
 tDq6LtEW/GhLlFBN6IR/qIRIZJRU0/R5HOaK9A7IxaGBO74T0QjBFBPRE7tVTwZkaxjaQtRYtdY
 ijpOteJsFhtDnPcZydljFzqf5/FnFlUx7kVRujlmBt/+4HLQyI1LIv5NQFxH2DQ+3Ez6HKHfXUa
 R4cZre1EP8a2YhlbvibIa9rxkydxCJkCdM860n5ZV4u86aYSBJhL64miB4IXx5iGnWDavMC0eFL
 fFBWOi2UhnRg6UeBoC8tV2cvVRYc34PhHPT9fMKfPMLXhbQPjjp3fVkkgVGlMhBwC7aC6TZS2bN
 qOj+sPVWZWY35/zdVy6TK/4qiP0Q7pjUzkf6xljikT16yN4MVVwXivHG8gzykhLXNTCObXOf8nV
 byMyEOBZv0VQBqkUZ6A==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0d87c2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=u223MC-wQ-mL75DatgYA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: KSz7JIGa1QumJ6nuNt7iveeNaaAYELrY
X-Proofpoint-ORIG-GUID: KSz7JIGa1QumJ6nuNt7iveeNaaAYELrY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200097
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108678-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 55D0858B56F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 03:07:32PM +0530, Akash Kumar wrote:
> Document the "cypress,cypd6129" compatible string for the Cypress/Infineon
> EZ-PD CCGx UCSI controller.
> 
> The CYPD6129 is compatible with the existing CCGx binding, so allow it as a
> valid compatible and permit the existing "cypress,cypd4226" fallback where
> appropriate.
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
> ---
>  .../bindings/usb/cypress,cypd4226.yaml        | 73 ++++++++++++++-----
>  1 file changed, 55 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> index 0620d82508c1..90769c43ac95 100644
> --- a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> +++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> @@ -15,7 +15,13 @@ description:
>  
>  properties:
>    compatible:
> -    const: cypress,cypd4226
> +    oneOf:
> +      - enum:
> +          - cypress,cypd6129
> +          - cypress,cypd4226
> +      - items:
> +          - const: cypress,cypd6129
> +          - const: cypress,cypd4226

Missied it. So, is it a separate value or is it compatible, always
having cypress,cypd4226 as a fallback?

>  
>    '#address-cells':
>      const: 1

-- 
With best wishes
Dmitry

