Return-Path: <linux-arm-msm+bounces-97292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJlyKNR2s2mwWgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 03:30:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0630527CBFD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 03:30:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FECA30977DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 02:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72E62D063E;
	Fri, 13 Mar 2026 02:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cpuW1Zbu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MEeSUV+A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C653385BC
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 02:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773369025; cv=none; b=YWfJHBGB8H2pDUi275NCUtWzHBOfHKAe70/ESgmfPmzrOr9QVTEoYgdRDdVoIsJ8Lga7/DUT3Z932FS/Uy9GtmgrDReH+OdkfwBqUsdN6z3bqPadtJqZ1j1UGWvvFZsq0/tGnCjssx9jgEYQhzPqRGRW6GPyL8JT9kOa5P0F9/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773369025; c=relaxed/simple;
	bh=1mtvmne0tmxkO3D2a/M0/PRV2aYePIwwey0xdsi8mGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r6gePNk4r9rsjH7x3KDPElrlJ7FOYMyLLC5n786B3S/xaL+pbyL7XAbLINDKomH1yFsKa57O+iY+idA/0l22+b2AxvhhfvimNHd9vtUpC8H4MO2SVbZc6IrkcXbD8YnOmu2hSnQfNhcgm9BgINEbJlfE582wAkrffDECm8rBPrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cpuW1Zbu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MEeSUV+A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CK6CQg263571
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 02:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8rF3pgw9E7TZJDepMMXR1Wf/
	wF3jxsQj25ywibbe0Vg=; b=cpuW1ZbuYYNmgaYb9x6Z1YyB9AXFDlKYhEZ/+0ij
	vhB71mPGLZ3GRBX1J980fZSimZGydS9yg/sAqhKrWqOuQb5dbUYJBjZ6AeiTi2Ha
	oj/n3qaXjhJaWZrT5oozUg/b2SlHSrRFfB2xBMRyG2nGCQqsOiHBTwXGMznFvCqg
	Xnc345cu8b5yaI1odBcBBB7w8fEN+uD3p3lvbQBe6oM2kFZngo0ChDKR8GyBUwja
	CCrtcO9N7tkGg0f9v0EMZ1qZVoZ859/yzpdnbS2A9YZOfwLSkKYGtbpRlzkqIWbz
	u4GmIrD45eoq1zapfiskMHXvuEsaqQ9lKLuB5RgOFneZ9g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4ym68k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 02:30:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd773dd409so273842585a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 19:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773369021; x=1773973821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8rF3pgw9E7TZJDepMMXR1Wf/wF3jxsQj25ywibbe0Vg=;
        b=MEeSUV+A8BhWNyF0NEW3+TcgCtmtCdLS/0lFZ6iJa+uVNhgoLj2PFm8lam+N9Kk0fB
         2hKcR7Fp4jNOKWuNfOWx8FQN/IeoQTnFl2T4/YF7GEHMewWYvFlTV6eeRDhD7qdOdOmR
         4J+hbLtNcsdkVcBeiQguKLQ1ULYTT+RyBIbMYr2ziIoVt403FntFjY7812+0/+L1QLuU
         BiBXDfm3te/sLXqF2ZXqctIQ/4YKhddkzYA7yjq7FpC79hJCndeWrNoAH5eUwQHiQuGU
         RLgG2HK8P3uhQZqkBGqXIjxI2kgFTvPDa5nPTkXFQhZezMQQ6+H0U4WcOQfH9WI3j7xn
         Q77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773369021; x=1773973821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8rF3pgw9E7TZJDepMMXR1Wf/wF3jxsQj25ywibbe0Vg=;
        b=mQ1oHksXvFT1j0HAe2R/GQOCeX2sUX9J/r5NOESoApVkFeYdm34yhyXiYdEP7xCPwK
         tBeMqlPqIjOuNbhTlaySAY6E3ZNz8W9j50YnIhRYS+S1We2a63QDC6pwC8S9ngk4yRWJ
         yrWodM2tzrxYar3RnpYkOPNLL1URj90b+PUv5Z47q1XsOkKK906ZSZ7tqRnGtWa556Kv
         syuQidZJ/bVkQFYZWqFgyX3xEwoCL2fvUiIUczK34kknFFAa+5AiaUv/su5louHQEcPG
         bF+bsVEqoiAyYKJV/0jQQzqN04s7VNeESPxyJrsnXuIpqpOxsRUx3sJZEhmONGYH9+/b
         aalQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9U5nsKNIbtgKL8oXrVhhOIVVBq7+ukXgFanzsGrQBtVIKmao6xhl7WABPsdPO1i4YTbDHZSyQM5mNqJaO@vger.kernel.org
X-Gm-Message-State: AOJu0Yyki4Tb9lpb+gf2qahKzIEWasKQrYRpVlBeLSvjZRhXfuHBlBeg
	ocDg4/WQ8oQdRR+iboog97fCM3v1Z1F6mXCfUgqkzjJC0NN6KN6SrrAbpzxBQzoNlcaEDvNAYmp
	BlR+0kRLJXovkofhqehXMeRjwb1dlziwJcMMLPTg9XFdzfjcoof8greo0gXAJc1weuwyp
X-Gm-Gg: ATEYQzzH4jJfC1tlmufBzY4eIH+GNeNM5RWnWId9fTvx4/OPxZgYC4RN9WrqJtYMcGq
	k+PsG9jFpAkZgz5PJYHo19HGfCK4fi+cnn7KxaaCaf/uDr9Ndv8/1oSH+GV7Wni5sT74hLlv8ly
	HMa36mTXNCPETegW2GMNcKXEhOMKs9IIYH6whv8nAv0rF6nzsDX8KfNEFsQIcWSPTdGkwfEvDo1
	xrJbx62XSpAfkcW+LRRp/av/mBUhCMK+m0kOUoZkthfQJr3gKexubx+wipsXUJU58by8wkyuhJE
	LrBVl/hW3mxvYJ5Jb/mjP1l3wm2KmYf7jNt/otWLHv1Gc0WPpuV9uNvo04pCQgNIOcrF5/t2Pxk
	zbLcHZlzQbdH7ZiSt+EUFLUkYPvqC+JcPUWlq8IZtIUWZDs5pRh2YQXADZdv/1bqgnA5xR/1NEP
	F2NY1dvQoCkyd2CJKSppEbXKIwX+cTri8Py5o=
X-Received: by 2002:a05:620a:40c2:b0:8cd:8751:2b1d with SMTP id af79cd13be357-8cdb59ec19fmr296165085a.5.1773369020984;
        Thu, 12 Mar 2026 19:30:20 -0700 (PDT)
X-Received: by 2002:a05:620a:40c2:b0:8cd:8751:2b1d with SMTP id af79cd13be357-8cdb59ec19fmr296162385a.5.1773369020499;
        Thu, 12 Mar 2026 19:30:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162b82sm1268902e87.56.2026.03.12.19.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 19:30:19 -0700 (PDT)
Date: Fri, 13 Mar 2026 04:30:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: x1e80100: Add deepest idle state
Message-ID: <5iego6aoed32zjkbs67tfyi4df6almzain7fxcgll374maazyy@w6icqysf7oft>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
 <20260312-hamoa_pdc-v1-4-760c8593ce50@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-hamoa_pdc-v1-4-760c8593ce50@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDAxOSBTYWx0ZWRfX8zw5OPSA91km
 C/uzeeC8nhW/WyLavHj729V6tzepCeF8AhVAZVKTAaJJfENv/wM4aFuKmxiSgbKJ3Fn5bk5CVi8
 iRtp6wwEK8V9jpUBcsZYUP+zJuzswh+j2RyDJChqeKBe4bPOyaNZDyBZXZiWphk594My0EMiCFw
 q3z3kjdvWGdra2MN2mbmYCikpHF9ZTv3JAKvpczCujBVHw3Oc1/u/BQFW4NZeH0RSh6c3dmp2eu
 1GT2S9E9sFywl1G/CS69KQZihZbn8eO0a8MfUdtOfLs4YAeNts4VocaJfY885sajV6G51EHf087
 1bgRyQvmn/AbF2GbQQGF/N0SLS22fue7TEsBozyEsn5Cvlg893FLnrzldyHYxZ67bmP8TQNIbjm
 TWfNvc4OaOmNoJmKQtItoUpPVCeBuU9X6/RZo+M/deLt8KUwFAinEzMb4utoa5EMzALJ6G1NCyy
 /CChoqDVyalShbx4WbQ==
X-Proofpoint-ORIG-GUID: ZoCWM7FKvNF2P7vxddymabv6WbtSrZEd
X-Authority-Analysis: v=2.4 cv=C+7kCAP+ c=1 sm=1 tr=0 ts=69b376bf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=1HwcBtEQVsHtarQ3u4UA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ZoCWM7FKvNF2P7vxddymabv6WbtSrZEd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130019
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97292-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[b220000:email,oss.qualcomm.com:dkim,af00000:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0630527CBFD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 09:26:38PM +0530, Maulik Shah wrote:
> Add deepest idle state along with pdc config reg to make GPIO IRQs work
> as wakeup capable interrupts in deepest idle state.
> 
> Add QMP handle to allow PDC device to place a SoC level low power mode
> restriction.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index ebecf43e0d462c431540257e299e3ace054901fd..8f560fd140661ad720fec979eabe3ca8ffb34273 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -290,6 +290,14 @@ cluster_cl5: cluster-sleep-1 {
>  				exit-latency-us = <4000>;
>  				min-residency-us = <7000>;
>  			};
> +
> +			domain_ss3: domain-sleep-0 {
> +				compatible = "domain-idle-state";
> +				arm,psci-suspend-param = <0x0200c354>;
> +				entry-latency-us = <2800>;
> +				exit-latency-us = <4400>;
> +				min-residency-us = <9000>;
> +			};
>  		};
>  	};
>  
> @@ -447,7 +455,7 @@ cluster_pd2: power-domain-cpu-cluster2 {
>  
>  		system_pd: power-domain-system {
>  			#power-domain-cells = <0>;
> -			/* TODO: system-wide idle states */
> +			domain-idle-states = <&domain_ss3>;
>  		};
>  	};
>  
> @@ -6013,8 +6021,10 @@ dispcc: clock-controller@af00000 {
>  
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,x1e80100-pdc", "qcom,pdc";
> -			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
> -
> +			reg = <0 0x0b220000 0 0x30000>,

As you are touching these lines, 0x0 instead of just 0, please.

> +			      <0 0x174000f0 0 0x64>,
> +			      <0 0x0b2045e8 0 0x4>;
> +			qcom,qmp = <&aoss_qmp>;
>  			qcom,pdc-ranges = <0 480 42>, <42 251 5>,
>  					  <47 522 52>, <99 609 32>,
>  					  <131 717 12>, <143 816 19>;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

