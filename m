Return-Path: <linux-arm-msm+bounces-101811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEG+IgB+0WmrKQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:09:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E207839C8F3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:09:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DC57300D167
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 21:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C4B2BDC26;
	Sat,  4 Apr 2026 21:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YCJAtpgm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rf9xqeBi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18C3208D0
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 21:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336866; cv=none; b=C5TPoARYVYGHhZUcbnVWVBQsH014jeGwww2C6qh0AFAfSwu14B134U2+5p9Q5JsK8rGbVCaSH3/SCUWXu56cl1fUromnmCXrpkdUGyf+ef9/ncHeMTRyC/byBw7ArUOh/j88arWPscHfm6ugud3speZh/opaJrx+fsIsjk+wcdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336866; c=relaxed/simple;
	bh=7eu/0u7pGY+lBhiiWNwsX7l/njF8oc2Kw58KXloTqD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0TStUiYRW9OKYkFrSlY020+/nLu3rRCXzzvlWCUIn32t53qm75/5bwbR0KwA88LO4l1zyfkwF3yDg83uSbhk1mLN3QvnASZFvzMcsZqBV58z2of3ImSC6N6FbUksHNyR2CVMO/llkl3K+644iDUJMoWq74OPEz0aglHKfFHGmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YCJAtpgm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rf9xqeBi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6342YA8D3990038
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 21:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j3hsR0HuhyaSEZPjBzwmlPNT
	WNcIt84wryNaoCw6ros=; b=YCJAtpgmfiV6BMdOhObjsEVLqWyOy0qQGpGW0TgI
	sT3qSA3zAtmx6v5FGD4ZffV78rJ+stxnIomn8JiV2DHcul2/648aTJ4c6Yp0Tuzf
	lw6iCNtStaAEdzLB3x44N0nCGlKYsN8IJczXyEer224Cj4PvWoNdi2oxzIvlD7kQ
	cNez3SRYBSkawmJ4IWkiH66fYgxiDXv1Met2Cu0oj7lSqkZrZ5ZRKUGgzMGaJU+f
	ZNDf1Ffw4BPqrNmlVdnZ0ID/b3+n9JtEgQ4h7snpUmGyrzeMEJTBQyOs5Y5CYTty
	Rfk9YYjIXFYld3lsFC4xWf0aL+/EDMwsTFjs0kVyiPbPhA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasyfhjwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 21:07:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d63962d83so54706491cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 14:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775336864; x=1775941664; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j3hsR0HuhyaSEZPjBzwmlPNTWNcIt84wryNaoCw6ros=;
        b=Rf9xqeBirEsYcH5uRrTxfxYrl4Yu5H/4aR7B54L+AxBfiz/4t56/IxoFyt6N7JzXUE
         RuFdNXdyfvrFyAWYMRUvne8vO6hYfBoNh/xtG6EjLNR1cQyJyjcnV1wIhGqC1jlO9cLK
         UlG/3NNNWToNRUJTYGqOV63G5urdrtmA3Nf2/MAvQ7q1R7VxyKssokaxqfTt8xNjMM7d
         rMP31XWk0J96c/rkezQ5k93iaWH8dryJ3FCTVzrelg6I7iCrreP2SAp8s+Uamz6NZuu1
         wHlKi5Ta1EPmBmY3PwUM1YfnMuW9E1StestwWnnIzlH9yqasn4uH8Z/AJBNspvjJundU
         30JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775336864; x=1775941664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3hsR0HuhyaSEZPjBzwmlPNTWNcIt84wryNaoCw6ros=;
        b=VgrJ8+f8+lfCe3m3tcn+EUw8tVrpKR/3B2NRTU5SOxgRZ8O4nz0pVrO3pjdwTH0Pcr
         +wDzCpxcNn1VtSAHAlGoML3vj0M96OHqf3bCrNZTYzF+K212pH/9vjDqyhS6bOG6TFOJ
         hCn8ueG7qRnCL/mDR3w6BM35oKeMNQ8MpDiJ7je6cW6+XrReBhO3jASowTo0KPk+7HXE
         kUW/8hjgsD/3MjGk74kCizKkDD4aJf8QV7EI+kiD+rHqGNpu71OMHopuISEg2uCRpxB8
         axv3LqyKAl9H7/8AKVdLX1pfSErzLk8BoXdlkdwyH9Eb4bCsnwFJ5+IRJtKSqqHgfzrW
         ti4w==
X-Forwarded-Encrypted: i=1; AJvYcCW1F5XaztCJVpfCIrVjpkj2vJ9F5UmdWkeRRZK78gHHqrfZmsB8BTNlBwv7ThWj8V5W3p4Ygu1weGv3sFBe@vger.kernel.org
X-Gm-Message-State: AOJu0YwYBqjql0c9IpULccslJImav14eniHkyz2AxddL7P+IyzfbQqKC
	AxbQxn2L7M3/dBg8ZqVLLQ9cdpGVXRkmxq6WrvQ7LSBtdYA9FbVFW3N8wM35YUam42+elfRbzpl
	QQbExdn4UNKZfqNQKXKQifd/gUDdvlJ67S1qJHo9kb6DSpEjSFraezsmcxAW4ayY9vhZf
X-Gm-Gg: AeBDieumiryf035i/3vgQIb3BNE9GSZVjJlsFUjI4DGeuKNUQ1EJ11t4wYy1bc917MS
	kbN5wRzD9wN0aDihNbVbUJ4DevBoPlqiFqOsqGY0k6FCNAmTF7PPKXqccJbBbfvyYci4nBedZ3B
	UjSvCeO+02KrXB3c/9O4EL6OGcjAmihORmEFCMihoceTicZFM2eKPKVsoA+aG1x8AqoGtYM21an
	d+0BAA6GG6fbdMGaqeBfcsUVeG1wLj/zsdqvcneFs77axQb/+Pb1jXtMFWovdXQwBtdp3wRLUhV
	/G6PWZ1/AGntUmkk9gjIBvfOXtbZQJ4QDmrbO/QRVhZnbpU3yWhh5VPIQXINcrKo1XbsvBKIuhJ
	ZPveBMn4UXIcq2sKhwpPaHFEcXd7u33XD4I7VAzY0Scq1DDrLaaX0U2vCc7V8N//jDsqv0neLPb
	6n3tAoZGmV21+T+qiCUZRA9+V5NNA7oYy1tWA=
X-Received: by 2002:a05:622a:4119:b0:50d:5b07:feca with SMTP id d75a77b69052e-50d62c31c4amr113918291cf.38.1775336864052;
        Sat, 04 Apr 2026 14:07:44 -0700 (PDT)
X-Received: by 2002:a05:622a:4119:b0:50d:5b07:feca with SMTP id d75a77b69052e-50d62c31c4amr113918111cf.38.1775336863689;
        Sat, 04 Apr 2026 14:07:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd1fdd274sm22739501fa.14.2026.04.04.14.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:07:41 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:07:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jsandom@axon.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sm8550-hdk: update PCIe port label
 reference
Message-ID: <bzbxyduvwlk42yj6mchu2denfvhqemahdeuuwxgzpbz52kmhn5@roukkyhpdbwf>
References: <20260404-rb5gen2-dts-v1-0-895f8fc494fc@axon.com>
 <20260404-rb5gen2-dts-v1-2-895f8fc494fc@axon.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404-rb5gen2-dts-v1-2-895f8fc494fc@axon.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwMCBTYWx0ZWRfX+mVuq1PBYEMM
 dp2enmPAIPx44zEbd60VbLXmOhsXxch7KeLmCdwr4xLVpk+1mdehPe/VmPjxruBCyeXPUPRTtsb
 Zc9OLZI4ZKM6GB5KeyySh1eJvtVZ5xYS+rAvkEiMfbD13CQEvI/cmI5ErxTbYRQbVx1IISEHMrK
 0X1RN9CnpZZLX+NGAzDLpJWfqOg3nx/82iYrSz0enS7lXxu52dXhfhR6iG4Y3Ss+3X7eg81LJzn
 gTOx6XWOHhGFO3TkJGSW2ngwWAO2ybNb8gPB2ztv2Xa0HVuT6QlIdYOZSCYTxITBbKEOkOpUgEV
 v734Kdm2kHe1pi7HhUWvaW9O9jNfbSPYIUYkhZmr5iMnkg9XCd1GCj4Z4akt5K23jdxd1NHIe/w
 d5AtriYMeNbX1RsjDiyZh+j+ePdGWRUrkvC6PzJ9rEeruQFRk/tBTEa+JhwGk52d9HFxPaKJZDO
 mGJw3ihTanDgvRbIt+Q==
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69d17da0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=h77gEMGJAAAA:8
 a=WW_2m0qt-0cxhXHWDy0A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=PYyYjrCoJcZo81GydsRF:22
X-Proofpoint-ORIG-GUID: QTdSpiRpYfThqBKkZrwIqsNM0PB8uETv
X-Proofpoint-GUID: QTdSpiRpYfThqBKkZrwIqsNM0PB8uETv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040200
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101811-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,axon.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E207839C8F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 04, 2026 at 10:50:55AM +0100, Joe Sandom via B4 Relay wrote:
> From: Joe Sandom <jsandom@axon.com>
> 
> Update the pcieport0 reference to pcie0_port0 to match the label
> rename in sm8550.dtsi.

This one (and the next one) should be squashed with the port label
rename.

> 
> Signed-off-by: Joe Sandom <jsandom@axon.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> index ee13e6136a8259d28540e718851e094f74ead278..e821b731bdc496c872703723df02ae9b9b0233b5 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> @@ -1012,7 +1012,7 @@ &pcie0 {
>  	status = "okay";
>  };
>  
> -&pcieport0 {
> +&pcie0_port0 {
>  	wifi@0 {
>  		compatible = "pci17cb,1107";
>  		reg = <0x10000 0x0 0x0 0x0 0x0>;
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry

