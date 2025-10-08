Return-Path: <linux-arm-msm+bounces-76476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C03F0BC64B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 20:31:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 331024E6DF8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 18:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC02A2BD58A;
	Wed,  8 Oct 2025 18:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M1IQ5W2M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403A11F9EC0
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 18:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759948275; cv=none; b=agm3ZjkAhSot1LqPj/DMVTVI9sW1A+35fD97NUbe1Mz2iekeO0QWoJYmYKvCaMJhGuSnEuvRaPNmW1jiyCzo/BqYVZLcuEIEoNJVfH7k8RHYlaQKQGan0NzQzO7Zd5k7Dw8Ckjl5am8ZA+O/OcsXU74a0hGgSmEBj60ypG9M+x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759948275; c=relaxed/simple;
	bh=OogXdKkIvLZJMEkHkVX9LD3bgFRmz60xSvAhqaYh7b4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQEsnMJV2dPXqF342ODJyduNOGFkJjjTdBa6lNPaeI4O0D3lPwHC6dVe3WzDZUxDTfNLsuhM8KGvOyE1lOeedkAaxa6XHbNUlG/FqbhtOESR/zKtkUTZhMWUvjOFtBGSTe08HYHUrvxFtfxeyhVdHS4MLsuVZM44XONAG2KbVbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M1IQ5W2M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5GpF006715
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 18:31:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8ZrtUOclJ/U1N5OLRJux0uSH
	lgak+fmTzi1yZZM2c58=; b=M1IQ5W2MMPzf9WbUYXL63sHIBxJmDjASPkNojiak
	ob7YtqTqAbmxWrw+Y6lymfD9imIUrj8NsM6OFX02yMTYWHyKZTq06Gi+Uz29dkrc
	DtKqJthsF5V70FhaHdOPvqhyzjQE2405GiLdZdISvPFYW+PrGzipLpPZt/eztqeH
	em1PpP8+xmHlH1OKkhd9PMB5QLKwxjIOHGSNqoZ1VGg2F8h7Wmzb0e8cPcrr94m7
	RnF3Vx+gwX+1KeP3AbUrpOXqRRu6SQYgX0VfJrzB3qkCaUijgjr+LzshZwRTnFXz
	nwqr5cZ+NLIeeU89cuYTrMluA34sg1z5r5hvct3Xu1OWtg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ng867-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 18:31:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e1015c48c8so32991291cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 11:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759948272; x=1760553072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZrtUOclJ/U1N5OLRJux0uSHlgak+fmTzi1yZZM2c58=;
        b=Ml8sAfdDaKSkIzr55YIRgHfGNDdbFvTtPXtvza89wcAhvfHoZcBp/QoJrITvwPoyzh
         Xr+UcJRUj1fDLZwAcrMA+R5uAxinK8h3Q4ahjdLAEL0CwEomUQpcoIGKWOjSUP+jyz7L
         aH7BngnfhwRJprFWwK4xLXB6pK1Ix4iAeON4kT/Skb3/ak5hjFEzcjx9WILbVQUveYDh
         d4pSAOGQWERjhIN1PCH3LmRFXNPPFfryHz1c9F+NK2rwfMuw0kqkAKoeVmG75JHuyHxV
         mqESsTJeaWqshKKDscQR7UPIKmFNMy0+cLyadMZJLlq+d1yNOLu4duFvjya0oWKdY3Dx
         XonA==
X-Forwarded-Encrypted: i=1; AJvYcCWtyrKTX7V7U0RP6XhH7Q2iPw/qwpZiJ3zn9Tpk+AYESouHJT86xwY08B8ABvIGwD7oCrle/w6tJ0bIGrhz@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8VTK3r8NIqGx6oMZ6RUT1yAKWj1o7EzcggXVF2BUp//T9FcIV
	BqYYksFICJoBA+3hxH15aUcNtesXzHIKmjtd9oI1SskIfaN45yqV6o1ZWP/p1mTHI1dHj7T3dqg
	KWGMep8S/Qbr7fhO4bo6YGBdsZ9nmDB3aSCXYDWzYnFxWFnNogXB1/SNJ8fIo1Ah8ha6r
X-Gm-Gg: ASbGncv+AgtvMKE1GdSfzTzx3C0ugrLK7XcbPe8CV2DC/VAyPAXrmMdBwsgQH09yI3X
	G+Dllo6zIvO5XHASLrYvz1ZxKIuxOJ/BPkHqKMR+CWrrvJ3AzRl6KE8iRGGUBfq8bX4YR5itkhF
	QhxAssBA62LtMMQQ3/hV3zL6At/tUQ3pLNOXrfj7ssjnEIZbFbp1rqNko1cyj6mMy2OcekXgL+l
	89dBsI79yGCHEoJ9V7IrPlW4Ab2OYdB40MDGvrWev234TjLWxaoga+RFvVyyJXAOLj+9v62CTDT
	x7YLhQ1iFWvqik3tpl/5hmQpbKHJ1cbADpXYbSVqeDV9ROsWZXVfKgw6Fy1mi2sZGi0Zdv7ofpz
	sMcQ1bzu2kCjuN1s9/BxMC07syq5R1y+l7cvsMUEkMUOf7bH5GRGX8HV/SQ==
X-Received: by 2002:a05:622a:1818:b0:4d5:eedd:6882 with SMTP id d75a77b69052e-4e6de7d4b17mr116741771cf.12.1759948272146;
        Wed, 08 Oct 2025 11:31:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJtSpqKBSZKvXYXxQCgdKyC4eKRCPk5+UecIUdKH5ytFi4FHdeM06tgDluKM6vR+E1V+nfug==
X-Received: by 2002:a05:622a:1818:b0:4d5:eedd:6882 with SMTP id d75a77b69052e-4e6de7d4b17mr116741061cf.12.1759948271489;
        Wed, 08 Oct 2025 11:31:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907ad9e45fsm232657e87.70.2025.10.08.11.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 11:31:09 -0700 (PDT)
Date: Wed, 8 Oct 2025 21:31:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: lemans-evk: Add OTG support for
 primary USB controller
Message-ID: <6t5u7pwzztqbkso6nq35y6ohtjywkbacf5cug6gmtfnmnulamc@h4sbsli2bfxe>
References: <20251008180036.1770735-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008180036.1770735-1-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXyONszxLP3054
 V6BBhR3IBr9uh9HHYPi6EgOt250bBUTRNTk9dB6OrURybd1SeOEu8jQugjWgtnkVixwHsaTpSOC
 q15yO13HZshahmfBHYo4KnszkFzfwWqhimS7RA5V94py3JYtGUzlxeytEbm33d2IAq9NI2qf/yM
 uVFB58qidSfJ2HZ466Ers74buspDNVpQciojf1ejHmVvEkpkqVku05PHJmvt/6cYDaXsScYwD5w
 MoeFw3hHd6aEDesAdhlMqC+qXF3NznqFInrwW8plLyEJ5cK/2giikHObiXSi9ivLGumM8bPwrMv
 rhJguXkE23KlnagJ87Rg/1aokK8q5tlKwmKl+1bc3r83fwnJSh6rxz6bvfff7rPLuNCYv+SKRej
 ufxtIBOTxuuIZx4zNYQpdoGkjdRzog==
X-Proofpoint-ORIG-GUID: JSRnA7hovFqiD4CMZSFMREbsrSPHh6uR
X-Proofpoint-GUID: JSRnA7hovFqiD4CMZSFMREbsrSPHh6uR
X-Authority-Analysis: v=2.4 cv=VK3QXtPX c=1 sm=1 tr=0 ts=68e6adf1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WIxSJfHCS5-6cMSheEwA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Wed, Oct 08, 2025 at 11:30:36PM +0530, Krishna Kurapati wrote:
> Enable OTG support for primary USB controller on EVK Platform. Add
> HD3SS3220 Type-C port controller present between Type-C port and SoC
> that provides role switch notifications to controller.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> Changes in v2:
> Removed redundant property of dr_mode setting.
> Added power-role property in connector node.
> 
> Link to driver and bindings:
> https://lore.kernel.org/all/20251008175750.1770454-1-krishna.kurapati@oss.qualcomm.com/
> 
> Link to v1:
> https://lore.kernel.org/all/20251002172946.589061-1-krishna.kurapati@oss.qualcomm.com/
> 
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 122 +++++++++++++++++++++++-
>  1 file changed, 121 insertions(+), 1 deletion(-)
> 
> @@ -751,9 +849,31 @@ &ufs_mem_phy {
>  };
>  
>  &usb_0 {
> -	dr_mode = "peripheral";
> +	usb-role-switch;

This should be a part of the SoC DT.

>  
>  	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +
> +			usb3_hs_ep: endpoint {
> +				remote-endpoint = <&usb0_con_hs_ep>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			usb3_role_switch: endpoint {

This is SS lanes endpoint, please name it accordingly

> +				remote-endpoint = <&hd3ss3220_out_ep>;
> +			};
> +		};
> +
> +	};
>  };
>  
>  &usb_0_hsphy {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

