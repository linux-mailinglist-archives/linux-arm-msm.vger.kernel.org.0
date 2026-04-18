Return-Path: <linux-arm-msm+bounces-103603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZAorNRy342nUKAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 18:53:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6E7421B3A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 18:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DCA4E302446C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 16:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36CFD31196F;
	Sat, 18 Apr 2026 16:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ldsVvAHm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jo+g1Gi+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFF8142E83
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 16:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776531226; cv=none; b=pxSv08mWa3nqrUHlNpUjbqUhtL1iK/rHzK/lyiphSVp36jfZXKFTZuP8BlX8DkhMEvTdIwdHUipSeA5yw2G6johMNiIe1U5IQRFGMuZ+55AeO7E3l7bTiW0mqlko5LXO2wJrVOgzpJChgP06K2HU71MNBBVWuH391g2/2X69lUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776531226; c=relaxed/simple;
	bh=G8BA4GtiMeYXrZll3CjeinMZCeGPFznzndL8XdzQmnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L1bieOXaQTRiChKHVe/4j+4wkZyEm3xNLGbVguLsh8cwFexMLLghadsyvzfC19Je8/EeBgPAMqBZ2agpo0pElT0RRV0Zd7iPbvA7Urf6YY81SNVwrPRl0vsSl5b07mSXCD2Fydyo6UqSPg3mMHQ5zmRsJNKNmjxjhRNRdQJ9JSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ldsVvAHm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jo+g1Gi+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63I4U5dt3535739
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 16:53:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lGsFMBmvE1oENRyczQSMgz3G
	ExFRiYlReX0j6dGJPuI=; b=ldsVvAHm9Ysf0Z9/sA0ynBYE0foFlS2owl5wTshf
	//p/YlQ1x42a6BlfJPXjjdP9OcbYadrULNa+HjLhPZJmPAqTIksixwp0CZl8QCFa
	oQ9ShZFiVdkYrSmVP8eOxqY1CBfnHcLLe8wVhPwYan0/sXUJYX5BA9Z3S34zaoQp
	JOnK8mVqXEE/9MGqUNAN5PpxuPM47M1yNuSWd9Bw3AjCSsLZiuo3V/s2Im518XZN
	UV0Bep3upVsVOi4+40+vhNoZe5C/eP2O8U7HI1MdHZoCv7zUSV7xR4Y6QwQIy3F1
	V9TGEiU8oIIdvfuT+Uo7gNtxAkA/kZjX6zg/lIcPpmgADw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkyanhevt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 16:53:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d58bed44aso2163521cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 09:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776531223; x=1777136023; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lGsFMBmvE1oENRyczQSMgz3GExFRiYlReX0j6dGJPuI=;
        b=jo+g1Gi+puH7F6ZZ/Gq7GlcWSA+N5NUVGqW9cCRetHoc51JPVW2Y2UVEXQQs1D5CuN
         ui5xndXDq2O0dSEHRERLCOPAohpBjATone2/D9TgO1FJz1gzqr+fzcdiKw+aZ0LIlBH7
         GdtoGJNnSIdmdSCw7YnesYGReOobvFGcSxwSsF7vvqeLRB7x2VNdXLpgsURWwS9goPO1
         ENjNEK5Z4V6Zb/bLDJFBLq4hY9uI9yHF3mp6tqQa78k9NZjI9s2gLkfALydnF3Z7cVkc
         QTeIQstxB0GMA1eLSjZrC/MsBMJEv186Sk9xENk0M+P+QvLkLGZqWhm4JQ+YQy8zEfib
         FxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776531223; x=1777136023;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lGsFMBmvE1oENRyczQSMgz3GExFRiYlReX0j6dGJPuI=;
        b=K8XlElnI+VHeM39cxaiqFEDKvtwjOTj6yw95841LSHyjXCt69pHWM3LYd3IT0Lq4Sl
         002cAFw9Xhn5ql+lNasZAcp2kA16TaWcI+LvEoKDj3vsi+gZd1lvjcAKQ1/CK7+l+biY
         +fHkQAEVFlGvvNVEjqWPX91h666KKJZ31VR7cuoKvBQ9h2CzVRdN1w4dhV08ZxuILAeS
         zuRi2iCTGJjbPCtBT5JTMVbx1oDS9bdwq/EJf731221YWZPpVF3XHevIdxWQ9uIG3njr
         ey81WHT4PRd1c03WiujTjCLNbT9OGmzLeANXa5KyPTJtucAQ+H6V4HW5TPbrEnCldYBa
         aS/Q==
X-Forwarded-Encrypted: i=1; AFNElJ+6UcAH2U/WSh2toVmie6QdLAX9va9/2tQ72dH58ZiPKHBaaU0no68Lv+WAuCnKAIkIjRcq8u8t0cZM0k8x@vger.kernel.org
X-Gm-Message-State: AOJu0YxeA4w3mqThjh7CltfJcqJHB6GvBF3n62uyFoOPBIfvd28tmlLV
	NzoH4CIcL4wi1JlYlfXiqAlg4rTCUqYkrGrWmRNFn6WygndXItzT5GgGHdCNvlXegPos5IHeHIA
	u/0BDhyBWO96doO1SmLDN/caGCl993kX0hyhHK/6OEUYeoNAHocfJ9uy6/How/DI8AeIa
X-Gm-Gg: AeBDiesvFlxSr5LezchLLI6zjnWU5SU+qOaUvaSHEMcTynWHqyUFq6D/0Q1kaBxfs2h
	1GQrWZHxbEASZ5fnHjQjC/c4LgAPWyvwG0rYFEaBPTxLJcGU6SGEnyF1NZ3KG9FLlRxvgHueNCt
	nFe3QqYsRJ4iqsF4NwcJcLhieggtomm2JOkCJ7BpbGA/1lKFjcjuBQ/nYvWs/Y8BWF+FYIoFe5T
	0XGm/eXR1IlJ7ACJFcKMGOE0nKRN5f/rSGr8RWilltYATEqXCk+bujRK9lIntbC4Q5HPkgzQe78
	NWf8baOuSh8Vx+VdIxJDniaWOgbKkafaW3ozTRtEvG6hjLnvTwQVVI58rAphyJWEBHEifVp6viw
	TvT7pKh910MGBZy8k3wnyh5MIHlOKhoVWRtKQIBLrQnkZKild5TkvwymjxzwoC0IbFM4L0e5RSX
	zzuXdhU5v9S3iDjXX2phebuI1/j9uwiZZCAkqBK9GFlN/Gdg==
X-Received: by 2002:a05:622a:987:b0:50d:6b4e:ea3c with SMTP id d75a77b69052e-50e368283dcmr110159341cf.4.1776531223124;
        Sat, 18 Apr 2026 09:53:43 -0700 (PDT)
X-Received: by 2002:a05:622a:987:b0:50d:6b4e:ea3c with SMTP id d75a77b69052e-50e368283dcmr110159041cf.4.1776531222631;
        Sat, 18 Apr 2026 09:53:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a41d85f704sm456531e87.44.2026.04.18.09.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 09:53:41 -0700 (PDT)
Date: Sat, 18 Apr 2026 19:53:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux@smankusors.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH 08/10] ARM: dts: qcom: msm8960: add SMSM & SPS
Message-ID: <u7buljdmiu2kf5unlqs2jh5u24ymteyrfvbb2drc6ntsei2mqq@yuhjpchgpgh3>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-8-007fda9d6134@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-msm8960-wifi-v1-8-007fda9d6134@smankusors.com>
X-Proofpoint-GUID: 4lQeMxG51_HzEsADaaE2yKPpSrTpsF4I
X-Proofpoint-ORIG-GUID: 4lQeMxG51_HzEsADaaE2yKPpSrTpsF4I
X-Authority-Analysis: v=2.4 cv=SNFykuvH c=1 sm=1 tr=0 ts=69e3b717 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=wxLWbCv9AAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=j179qWkWid5eCuaOytsA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE2NyBTYWx0ZWRfXyAZqSG13qSF1
 VHaLy3lcDuKzF4dxiWwusHjONoAJuccCH2BjYaZWBsggy5eYhFOSFFdSTX9AUQ/wVLEOJnqY2CL
 F1ulqyjsWy9xYQBA0rZVltVpm7rvJKTaKkfwhXjS7wGFxiOLIb6g6++Fyt0ELVHY16uB+8jX+7R
 9GoPCJCOm/mlCCVnLCxbQz+ZnvyCtQc0E6+LNRVTOivM4zynksgYCUJTipNBhIySsZLwv5Go01A
 58AsG23tq1cEgmW/TdHsMJeDg4comvBau7Yp6sRMegnRVeQmm7fc9HpBdUXdZkZ+lcgALogEogF
 UycQnafI7YnipFv7HMAzgQCRvbQwXYcioK7k1iVoApTdY3ARbDPDLS8UjjuZhIkj7NmpqW5z/jb
 jpwlJoT8ePC6RKsqdFpdzxJZ7jhhuCO+AbgxREk8WVKNtDSqXvdFyU4R/i2+Kc37G3UA1m8dVHf
 8O9q1etWyLOdQ2wJvpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_05,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180167
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-103603-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,smankusors.com:email,qualcomm.com:dkim,qualcomm.com:email,0.0.0.0:email,0.0.0.3:email,0.184.161.160:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.61.9.0:email,0.185.218.32:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4D6E7421B3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 01:55:35AM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Add the Shared Memory State Machine node to coordinate state transitions
> between the Applications processor and the Riva subsystem.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> index 218cf3158dfb..107c5613aa4a 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> @@ -109,6 +109,31 @@ smem {
>  		hwlocks = <&sfpb_mutex 3>;
>  	};
>  
> +	smsm {
> +		compatible = "qcom,smsm";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		qcom,ipc-1 = <&l2cc 8 4>;
> +		qcom,ipc-2 = <&l2cc 8 14>;
> +		qcom,ipc-3 = <&l2cc 8 23>;
> +		qcom,ipc-4 = <&sps_sic_non_secure 0x4094 0>;
> +
> +		apps_smsm: apps@0 {
> +			reg = <0>;
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		wcnss_smsm: wcnss@3 {
> +			reg = <3>;
> +			interrupts = <GIC_SPI 204 IRQ_TYPE_EDGE_RISING>;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};

Are there other SMSMs (modem, Q6, DSPS)? If so and if you are going to
send another revision, could you please add those?

Anyway,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> +	};
> +
>  	soc: soc {
>  		compatible = "simple-bus";
>  		ranges;
> @@ -455,6 +480,11 @@ clock-controller@4000000 {
>  				      "hdmipll";
>  		};
>  
> +		sps_sic_non_secure: interrupt-controller@12100000 {
> +			compatible = "qcom,msm8960-sps-sic", "syscon";

This one is exactly the same as the block on APQ8064.

> +			reg = <0x12100000 0x10000>;
> +		};
> +
>  		sdcc3: mmc@12180000 {
>  			compatible = "arm,pl18x", "arm,primecell";
>  			reg = <0x12180000 0x2000>;
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry

