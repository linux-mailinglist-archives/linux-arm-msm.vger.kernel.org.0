Return-Path: <linux-arm-msm+bounces-94206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8F3UFMe6n2n5dQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 04:15:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D0D1A0653
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 04:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DA02A3033E36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 03:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B72A23806A1;
	Thu, 26 Feb 2026 03:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QZKqc4lq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DogaII8U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4592D30F95C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 03:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772075652; cv=none; b=SB1rDTei1uyPUJTtIn0ZMajuDEYd4WB7mOF0JAb18Yzb0G9xi+zUjsko909LeUR/RbRhtI0GmGVrdh1xmkdLIgj+AuiV0Ol/8PCC+P9N/Jno8vxGehC+clh6lM9iqz/5bvdyU/O7XbgQaBMGQJSdoSMuSwOKzTZQYJode+1CkcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772075652; c=relaxed/simple;
	bh=J1xHw1qbCKqF3aM3go5V2bONriN4J0Hcrm2VWJVSw7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dNbzmQ6d0iMcIJW2RJGtB/3VIJJ/IK+Lg53tfyVfx9/tKTT7ve7Yd8OV1N4fpf5YXxkIGC6exLIw1qSlCzCT/5lwI7du4L64oryEEpERTT+hlSkO8wvEyCbUqmeVCNh+5XbhrJbtbFuT/WAUjpVemLneK9yYzu5UqFlhpEbtfQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QZKqc4lq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DogaII8U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PH3mQB1195799
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 03:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1K92gqYypLmBe6WD82hk7pcV
	Cx1m3R23a+EMVYYqH1w=; b=QZKqc4lqwWEDRy+onAjqn1xheOUqxzYw+NrJsOww
	FSC9f/J4k64ZqJCTvbFIUb2E6ezLXe2ikbZIScBYwq8sPTepZwcDemqXqcBoOQfE
	b1Y0GWkglcmb4f/KbKikIRyEKiPoTqqcHkAWZVumSem2gPkaGHKU6alPVu+1KgQ0
	OycSaBYK1kiF2orC9TI55HAJqY7QrxMucfstCbLoOKPKSsX7Pj4uGVDoi0S3+va6
	3xzgNrjZthyrnDYyk9TZrqcAR4/Tt/uGvYsboWdLsryOfR549ew0m45Dm9s2be0s
	AvER/KPBgMvNtWvUtcNCieULSZOX/jpzSo3PCfXb/jpDVQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj559hht6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 03:14:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71304beb4so188099085a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 19:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772075648; x=1772680448; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1K92gqYypLmBe6WD82hk7pcVCx1m3R23a+EMVYYqH1w=;
        b=DogaII8UjRNfcelEM/6/4tMTqwd/F3ezMSmXNiCIg4GTCgpvgbXxAaYjAxzDu90PJM
         8Av0avfjUPvhzI57rdBJEGOYsIgqrWlefcVNvCV5KK5sZzBmqZkWw9HVXGGa4jqwfvsH
         PD4OlTal3QNgyYvRTPE+zOI6Nkq8i1QjQP9D2zpXmhwXAcmiWtD63fj+nbvu7ac+TK5S
         Z781/mDD9LPe0lo+4PeU7jxBdJtVR6E+ndSilAVeIb8M1r7nG530zJx7SvtTN5n1R3J+
         e4ooPvNBf75IiS2VrHyScLCaUbdkn37O9JiGVTKKI7u+pm+r3d5eK6O5MGBnJF9Tp3g/
         9uoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772075648; x=1772680448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1K92gqYypLmBe6WD82hk7pcVCx1m3R23a+EMVYYqH1w=;
        b=pptH++HcqA3h3XWJtNbcHnek0Jnr+0yTNWbBqb+qaZ9RUoGB5mA3SVlnQ4aeFodZT4
         xo//Q5H94tPdqi+tqy59IsPqruiizPNfNUolwuozK2aM1qLmvvD3IJF5wBRnsWikC8bA
         yfnO5oiHZ2XQJtNfRrdkyofMLn8+oc9ZfZfmPWAevFvIDsb7GV7v6iPoAmpbB7TWMrCY
         +SufGThMsSvc7TUTl9kFFJZmSkGSDz39tbPTiNrjm67ftmGDXwF6I5F3zJuvoAKDej/k
         W8SORnNFqygf73vw3jHXvYNDTF1s2ImrreMNwirpg8LARtjeq5od8V4iUVrBM+vUHMp4
         Hqpg==
X-Forwarded-Encrypted: i=1; AJvYcCX2VEBUe+CJxEraKIG8PBC0DjobJZe5xQiCXrNT7jtr9Dr/b5Si4voKXBOa+fQXeIfLqhmFvoqEYJ3Ixcu6@vger.kernel.org
X-Gm-Message-State: AOJu0YwbcMM27N5zu4kx7u/MeNH5XwmynGFyAGnFs4KALBHB5fQQaiBG
	j8AKw3TcgvOgPRFZqh2PHZlqKkCCpLq/sHyjV3ZiI+PVpfozmwGTQ3NdfaqD7EbEiioY8ObbhvC
	7GPKWHwmvnXHtzz+E69FT1JCflbflsHngUGMTVQ4Dsbg0M+Kr9/UYy+B68KZjSZv7BHfA
X-Gm-Gg: ATEYQzyI9Vg69i/2RIWZ5jGi/VqVPkRgqJZQRDIer1uLSx7DHUDPdAuBNKAfLxDrc7l
	FMbdztrOqgyhIWUbvm6miNg8w17H9y/s6dmmb4UY8EfBQ60mJ3jerq8G1obd62b/sCNXabLDP7y
	sipuYCgzyyfpjjm5+OO9FQRJFwZ1ndWFxP0uf+sXjtjiqMkW9B1nldiZiBWkmihw3sUKI7xmTNu
	xQ/KBiDRmhwEqc+QdzkuuV2Y70Micy5M8YZeZ+yxyHc3w5xhvnLOwKfENwNXJq31fvaGHJuKYXt
	jDydzZMUQdCq7CUFfi+TTq0u+UkkEbx3Ajbwh/S+Mz2IWPwjHFBAnbD5y/g46LchjktoKWp5+72
	EdWCWZkQsPSRKdKhcDAaGrISMMXD09SRFZfElnL31tOB3iNQggQ+PY36hoE8q6bVpZLWOYomym8
	rTzQPPh/YWQz6dBu9ANllkzti13kBE29r/ZEo=
X-Received: by 2002:a05:620a:3708:b0:8ca:4288:b175 with SMTP id af79cd13be357-8cb8ca769cemr2368039685a.55.1772075648481;
        Wed, 25 Feb 2026 19:14:08 -0800 (PST)
X-Received: by 2002:a05:620a:3708:b0:8ca:4288:b175 with SMTP id af79cd13be357-8cb8ca769cemr2368037485a.55.1772075648029;
        Wed, 25 Feb 2026 19:14:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a109df868bsm254666e87.70.2026.02.25.19.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 19:14:07 -0800 (PST)
Date: Thu, 26 Feb 2026 05:14:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: lemans-evk: Enable the tertiary
 USB controller
Message-ID: <hjyady72fcatibog4gl4hjjlhsbev7etn6py5hmbefqd7e5jp5@tyxeb5hwgz2n>
References: <20260225093155.4162177-1-swati.agarwal@oss.qualcomm.com>
 <20260225093155.4162177-4-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225093155.4162177-4-swati.agarwal@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: w9ayVZHrElYFBgUlhmJ9iGRhsfqaf8zY
X-Proofpoint-GUID: w9ayVZHrElYFBgUlhmJ9iGRhsfqaf8zY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAyNiBTYWx0ZWRfX9b0YJ9GiQQsj
 OWtgRHOf5mjgjKcPtVHMcCg+YJdZhcFAb0HMDVpMXVf0pxrU+0XJ2KLcOBGIIziLrsV7d1E2mD4
 tEO7/kLh22IpcIo6csyYXgIuP9YUfSZivzQWBLn82dLrWD/qHPa5MhwR8nEoD6dOTzew99T3Qh/
 LLMcSd+Fn33ChlLu/IWvQq0uiq87+b/KVffi3ZdG1DTaI+doTt+QOTfAf69M6BJB2diL4iIryvP
 gMV1qDcN5SFsYjhPGNY9JkmAqKe3+0F49Kz4dHcDiU/6whgjYaMY1/PyaqyAHcqV/e8E6ym3o7L
 JP23YJ14XnZlmMS7rQj4gR6lce5nHJHQFjQtsQzBHcOsemffFe8Y3e7Xeq3AASYDcL6Y3/PbC7j
 NlhYJXvz5goIxmeMssjk+ZWzHIZvyWcQQD89eDJkZEIJOsr+5e9Q+b8o3mtWPy0TntCceBa/uRC
 ZfEFFejrV00euoXSgEw==
X-Authority-Analysis: v=2.4 cv=TcybdBQh c=1 sm=1 tr=0 ts=699fba81 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=VGCbv80CQZbRCFdKXesA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260026
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94206-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B5D0D1A0653
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 03:01:55PM +0530, Swati Agarwal wrote:
> Enable the tertiary usb controller connected to micro usb port in OTG mode
> on Lemans EVK platform.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 52 +++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> @@ -141,6 +160,15 @@ vbus_supply_regulator_0: regulator-vbus-supply-0 {
>  		enable-active-high;
>  	};
>  
> +	vbus_supply_regulator_2: vbus-supply-regulator-2 {

The regulator nodes in this file are named regulator-foo. Why are you
deviating from that?

> +		compatible = "regulator-fixed";
> +		regulator-name = "USB2_VBUS";
> +		gpio = <&pmm8654au_1_gpios 9 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		enable-active-high;
> +	};
> +
>  	vmmc_sdc: regulator-vmmc-sdc {
>  		compatible = "regulator-fixed";
>  

-- 
With best wishes
Dmitry

