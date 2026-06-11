Return-Path: <linux-arm-msm+bounces-112810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IrAfI8cYK2pu2gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 22:21:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 896B6675181
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 22:21:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YYlqyOcu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=f9wjlJtq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112810-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112810-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C1039302B14A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 20:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5692374A1E;
	Thu, 11 Jun 2026 20:17:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD2F368946
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:17:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781209066; cv=none; b=rBYj9tARbg03sJQ+INy4bQi/q2Am5OppdJf7BziC6tEDc1TkdsqmlldnEd8aZEEIqAw5uZBunl6uPiwuY+Q1jQqqzxU8nDtE0S0d584LK76W60vKY2dszuWukJBFhUHNLD2PIuJ5BPZvx8wVFPgH+mB/6r/xZEJUNWGTf4bt+a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781209066; c=relaxed/simple;
	bh=DEFzM9pXZjoiCXMOLYWdhHfA61XJJYsjWM9qvuHFVSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DrMHIIygb/akzKNeyyuNR8czazLXMkcVzdzuqPxDL+vHLKlNKfUNAW5V/yi4zBzjDBWc1RPfo9mMvkTt0FKHF4hEFjrJoJrJ4mNf1pVAmZMTZCFUmFnO65b2N8DHzRpa34qEcd7pBxTPp/KdMcMf/sgc3lg1bgtLYzu22rqOXHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YYlqyOcu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f9wjlJtq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ49jC4111802
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9dSIL3f/lhstR7XBW0gRBnx+
	J0TbGOFQQgQzZUkFx2U=; b=YYlqyOcuNltzgMs7FrR3n5oiX34sYCUwZ/Xf9/rd
	MErXAos1iLNMlikcBn46+57ZPygnE+krVxT8qnR9BsKSz0ckkovQomkKHWy2s/bS
	x95D2pDC6KyVWhM7xdBEoB5ul9urTtY2/uoTlj19eRaXfQ1WA5jTF7hl1AU9riAY
	OxE/d1lhp815TCDR7O0p0YmFZjo+Ww6YJZGCBZ80W3VgKO8YgLpjxfnmDk1kfVDc
	xGmhy3Q7kS4xCg/5/PPkpytHAQvWZWSXkoLTU9trGTFlO1JYxeSuMuvEiPsKNLWu
	wegh/cG0LcTh4NoLXxFo/lU/sd0FISzy/F/4fGQz+evuUQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er014h7ng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:17:44 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963b11561bbso125065241.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 13:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781209063; x=1781813863; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9dSIL3f/lhstR7XBW0gRBnx+J0TbGOFQQgQzZUkFx2U=;
        b=f9wjlJtqsevDqeZ//ufLdJAPYCGo4dAsxlYma7OVRNmtrycRO8vW20NCm6q6Bgz4rm
         KozVPQn8X95ZRUPsw09Z2D54WfX5M40DjGNt3pX7Rk/+BpFqxhUhTMnpiWSvorkBHxj4
         omvxRE/vWikFaZju/bcLHif55bVBfbnlShLps2GZjrOFmoqCBOFG2410vUNTcCn7bsVn
         AJU/a35mRYrdLMwC1dBXHdF8zpCA9wZEnVV9ug4GY2RzUHK0BtGafd8Qe1XMTJyUOXCA
         p0hQKh1JlrbX3zKjTwnkuO1KYx+jTQFNlhKVwKulqpw19xCxDqT9Wch0cAnriqiQ001b
         vXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781209063; x=1781813863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9dSIL3f/lhstR7XBW0gRBnx+J0TbGOFQQgQzZUkFx2U=;
        b=DcDRbitp37Kqck4KfUpNVJakOB+dmSoawK65GzAxAx9WwjBjhS6vzRhL9ZySMYgwhs
         AxYsg/5o53c2uyR9XuRTL6yeF+WoqzcDxiA/07IXg9NSGLUW1+72noW1evdz/xL1CVz4
         cFZq5AWHu1hk/9Cca77zHvWf2O49jbiEZQMYy6IIMwhY8j3x2d0MKm7MtO2o23uTxQD4
         Tjm5z7JoGyqzyNwHB7oJug/vkEq/HlItFKRerjVfT3lWJ74xGUuOzBmD7eciOY/s2/YN
         jy6FwMdWChBkhYL+NL/A8Ck2s9TShuiKd6DSfZcXiVAGkqUrwVj1bLTkLQlmWa+2m9hx
         gwzw==
X-Forwarded-Encrypted: i=1; AFNElJ/P8fMG0V/Qx/WdMkFCb/GnXlTe2G6xsd99aTpWRYFrSAO/YZQcaoBhdyqwwGWVcUdQada3kiF09TrfP1IF@vger.kernel.org
X-Gm-Message-State: AOJu0Yza3I8qIittGjcngBLDIu/Y0dixZzskigiVsRS1OAfhVdGDot6f
	dRD8zbZLg38Z+0Im4S9OcH+kxBT0j29T10lwVmPU/pT9xAaMRx/MdXJLVfh9o4G5k2LiZwOnhRU
	BZ3nzLuwc2Hy2BXrIFs+4i9VfPl2zeimp5lkNs6+gdrIwl1ZCCWXatCGhvxWBnZTAzqJ7
X-Gm-Gg: Acq92OHL5CyAHR9mG7JbOXK+u4lA9aUKk1DRv38KeYu9DUGLmxYjk7sDTxNtkM/IM+h
	aMT98nA94rNCfEU9W7U9UJDJxtQBU81iye3ttrOgsCg7vbqgGk7JiLL2DwTHb4y2OYkZG+OrF++
	w5Wf5HEGYfy6YLAyq2N++kswChZZdwrNyxaCLVdnscCRSzNJBJxK3FFbitSFvaM6cVFE6NDi6lM
	CRKEd6Px1lczyFEPuzU8mKL87FK6xCQ+Tdup0gxcHM+5WZSKC7dm/1asI7lgfTtGRLY3PpdBi9f
	KdeIsUZP8FKDeToFZPybr3Yy9J2bOR+lL6cuGuy9+aQ3azzjriZyU0jMGULU1vjk0OWs5TusXFl
	1dLjLSDMrCrXgXGUVx9JlyzTXWIdktcaxphoVYaiyXc5+KreanvjBmjRKcKmL+yxALRsZ+jOWTr
	YLdTIfgEemYUAVI5tPfDGnjdhx80P+j4Fj4rM=
X-Received: by 2002:a05:6102:370f:b0:631:d3e4:efc4 with SMTP id ada2fe7eead31-71d59fe3bbfmr2378705137.11.1781209063132;
        Thu, 11 Jun 2026 13:17:43 -0700 (PDT)
X-Received: by 2002:a05:6102:370f:b0:631:d3e4:efc4 with SMTP id ada2fe7eead31-71d59fe3bbfmr2378684137.11.1781209062669;
        Thu, 11 Jun 2026 13:17:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2cb3f4desm121518e87.29.2026.06.11.13.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:17:41 -0700 (PDT)
Date: Thu, 11 Jun 2026 23:17:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: Add Shikra IQ2390S SoM platform
Message-ID: <37vgpqv5rir2rdunvl27dv5kydybdwehinytow733cmkscue47@e6pnlxwklnq6>
References: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
 <20260611-shikra-dt-v5-4-103ed26a8529@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-shikra-dt-v5-4-103ed26a8529@oss.qualcomm.com>
X-Proofpoint-GUID: 8Vp2K1Eci2JhYGodNksT5sNzlWLbmXAq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIwMyBTYWx0ZWRfX0ArMCXBvADJf
 SQWc4yPXAqSezk4HoABxri05U/PnCtMp5rIPgH6WXrmuqzhAmXg9hfxOIRR3jIQ9++SMIvhfNu+
 2lKmZcNsxzG2qs3rWtzDpFibT9+JoNY=
X-Authority-Analysis: v=2.4 cv=Qp9uG1yd c=1 sm=1 tr=0 ts=6a2b17e8 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=MSeU50jLikp4iQrAx_QA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIwMyBTYWx0ZWRfX/yJlRsQEaNNH
 6pGV445LsdQCvb10hhaKYNOElNkvOE6dnF151jYHawjtY7DN8Xj2z88bX9S2mpA+BK86O1B9QY5
 PtrYLR/e0IyWEaevWiiRL8SJS3Rrcd1Pa8ZMAFPIg+RMnmUeEyuB0cbQrAPRFp64dc97ha/K52f
 FsHpg1dczhrAU1HqNJiKm9KkbtJmap1H5oKuy088TXx109HxigOrpki5awGt3J32Lm0La7wotXq
 l/67YPo3TbuonBTZ+oVdyMPZK3Otmcx9Apk6pVErCsKWMPMG4J44Iiy3Owc2JWeNe6uwkWXRWLj
 OEPf4KPC3SLTkxsnBih4qd6LmMrUUVptWBRYj2Z6HGmjxUJkFfdyCVA3l6cyjI9Jb3Fvf1sgaiu
 175S1jlhUhi2WC0Pk3goq02JERnG+Cc7jhr/7fKyhYbPJ3Ee+JDlN2DMIIIxrs+zalU6FVB//5+
 /Z9cy3XIUOfqZQmw4kQ==
X-Proofpoint-ORIG-GUID: 8Vp2K1Eci2JhYGodNksT5sNzlWLbmXAq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110203
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112810-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:komal.bajaj@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:monish.chunara@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 896B6675181

On Thu, Jun 11, 2026 at 03:40:11PM +0530, Komal Bajaj wrote:
> Add device tree include for the IQ2390S variant of the Shikra
> System-on-Module, an industrial compute module integrating the Shikra
> SoC and PMIC for industrial IoT applications, designed to mount on
> carrier boards.
> 
>   - shikra-iqs-som.dtsi: Industrial SoM without modem (PM8150 PMIC)
> 
> The DTSI includes the common shikra.dtsi and adds PM8150 PMIC regulator
> definitions specific to this variant.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 170 +++++++++++++++++++++++++++
>  1 file changed, 170 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

