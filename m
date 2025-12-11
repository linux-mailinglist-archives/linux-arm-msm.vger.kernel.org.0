Return-Path: <linux-arm-msm+bounces-84978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB876CB4D1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 06:52:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0DF7300F310
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 05:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC19F2D7DCF;
	Thu, 11 Dec 2025 05:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mGBQbx14";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OsP96+QT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB672D6E5B
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 05:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765431889; cv=none; b=tD1+oeDpUgsctidMPwRB0XMIZfVyzHGUqhias5mLRR28zVKiVAbLKq/b+QOvqMEn1uICJikEjVJyx2Hay/o2hTD8fc+Pd3+eS36sxUKRAl60Jflb/cdeSL8RCBQVoMd/6dkMy4cowYx/0/F9usF6Ml7mHyDS5APCuo6Do6r7tsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765431889; c=relaxed/simple;
	bh=SzxaHVHPjqDlmBpQu5Xm2YNMObWyx8B6VBrtONyU0s0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FLUpdcCx6RhhjrkMjeRLUf+IyFj/+zyHrhHGPcsEeYitL27fb20SAbTAgqAWUIK4tuL35bz4sVcqLWFus+H65svnLDgLSQlbXvsLreqVXFuIE1NOLHJHwxGE+/YDN4tysm9QQm/fdSi/4jbyBK6/JhwxTyOgjOj5ffsx3FhL4Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGBQbx14; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OsP96+QT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB348lk388524
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 05:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JLG2w+C3sTszdx4VirmlaHOi
	FL5gN+K2jZmVYvVT/j8=; b=mGBQbx14LnZEz0Emgk0KwuJjoz2lMbaSeFM/9Qq/
	JLTR8SLPUjwowuVwEyVWNPWImBAy8h4FOa0My0wyAr0qS3cjwfQ5I8NLGJo41n6d
	uI9jM/Ow+5l0bGXgPNhf0BEOnOHYlLq8Rr06uhe3HvQI1GxiZPoiIMDoYlp2nyB3
	G388bNB9ewU0UeQ5d8Pby3MpxcnPAecZnAzW0Mpp9dJlaVN6rldmT7Yh1r44Zgex
	UrEJ09L7I7s+tdw4TcaMglVU9Gus5KU5v3dGHScqMjNZqxnA6iInY59H30zZ9Sqt
	lNh/A2p9X/WNyP1lnhwrSLz/xK7ojDEF+o7O4vkUbLyhNw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aynqp0crq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 05:44:46 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-55b1c1055b0so417834e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 21:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765431886; x=1766036686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JLG2w+C3sTszdx4VirmlaHOiFL5gN+K2jZmVYvVT/j8=;
        b=OsP96+QTQ8LNqYFPJWDqmvxvEMZ/7vhOc6MlNR68dKRQGV7njBQRCo9Av0RMx04R+O
         2RvmbV9BBcpRDnuE2ML+tJYajI7WoQ7KJoX5ukP5VzNYHGqmZn5xA0AbtQU7Fix5qW7a
         hp6O8Rmq9QSEJF7f8Tm1pKcSySUsLaIPljKkTGn0alphvaWxraxMcS4cQVIwQB4xRuJc
         F/hGHvSMz5u9iwXEoWra4z7T4V2eNOxW7/x+zZdaoFDNjZpG2lfV9T9mvt7N0GQ+oKge
         zGU+yl6b7tyn8Q2LMY0p61RiqghPbsDw+lEvNuNGcpxi4qwC80HziiapRa2Yy3sVDypG
         h0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765431886; x=1766036686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JLG2w+C3sTszdx4VirmlaHOiFL5gN+K2jZmVYvVT/j8=;
        b=MUL5l6JYXrus1JRUDa3r1Uv2JcPs1/qPv6mJZWfaTyl9jG4HV6zF33v6M0R4PfgqEB
         SMVQlrf769UDhGj8gA+bBuR/wTHcCcqJ+U/ve+7ZCuHU/OjcBINIud50rhIZOrg7bk6a
         ZpZRHlHd14+JyLT5tyHqZV565pTgnuRsrsJ7MIuqQs5TRT1YTqyroOwkEv5o1WARAkpA
         VBKsQ3S3j3vvSEtPpemCs2n9jcgOR82P0JYTllbt7ksj3xkb2vfVCzErHl7bjdGKsJE3
         EwFbBsBOcae16zYv2ZHgM93wt4wSnyLuxiS63vO5hK1L9uRRI7w5DFAQMifoStXz3cSA
         Lihw==
X-Forwarded-Encrypted: i=1; AJvYcCVrGiwGSR41+IwWphut+a/pdJayGi+ZSeWX7SghctXDaoyAyiTTQQuxvIV6zvZpLca9+nrZJqbyvbrnxcgF@vger.kernel.org
X-Gm-Message-State: AOJu0YxRxkxIRMxbVVTzJvJtYSNKRZDP3ydlnLiB8FL74lzgBTBJJMTd
	gM8H7cDtvSV9JuJX7oyh0hRx0oH2Uipswr8e4/mqpx0VV0oMkzx1RnubbTFGKvJeuAGvn7vaI3b
	vBBBfsiUdNxGDRpCnhmAPhk0Ma7wRA6FMfaTWkUo5LCe4tZirRMmnIv66/sBrifbRAeRL
X-Gm-Gg: AY/fxX57cU63oHSe2RfqRkcKyGSGAeGAO2+74it5t0ooR/v+UB4ajESrFzunEsptEGC
	vCJ5IBC8heYrwyHwpXDRpeEej7U4wYiw0KPHDvU8U3ZL+mniS7P89rKXNA4On6sZKfPLnQcxMne
	UEmoJDU6+BHeb6nrndVBtXVyqOkDJqxMeJubXRQvxrU5tt/8Tb4Cv/+EkyhJ3STMc2r0MDqWsMN
	M8V8D74vA88CfCPfn+skyi7u09PghlvEWhrmoaEkKnyfdZytB/E1z65/jPqb01F3oqJL6vD7CJf
	HUPTxrrPXcn7EieTRIryW3PHxJF+XLYwtcgRQzqNXjtHaCL8DYwSDFIrFWQr87GM21c0mU656/q
	G8bpHtoCiEkYF+e0hzx05sR72Kuz9ZRyK2EibUQCrAEUj20jvTNACU3yqsPXwzSOs1cNRI4jFGK
	p78HXMmrOWwp+g4RzfZ8g5COI=
X-Received: by 2002:a05:6122:32c4:b0:54a:a048:45a4 with SMTP id 71dfb90a1353d-55fcfc5104amr1538457e0c.16.1765431886195;
        Wed, 10 Dec 2025 21:44:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGfi2cilvQl8uWCLP+ABlqrwXcWpY35vi39IvBW1eJLuXb5tc9Q5Oi12IXGio+bfFJJkuxng==
X-Received: by 2002:a05:6122:32c4:b0:54a:a048:45a4 with SMTP id 71dfb90a1353d-55fcfc5104amr1538441e0c.16.1765431885725;
        Wed, 10 Dec 2025 21:44:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fbca6c62esm3887871fa.32.2025.12.10.21.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 21:44:45 -0800 (PST)
Date: Thu, 11 Dec 2025 07:44:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: Introduce Kaanapali SoC
Message-ID: <drbc2hb5hv36s2bzxaalfnr6lcer7zfyexnya3xpi6ltlhw6et@6gu5s7wfwm26>
References: <20251210-knp-dts-v3-0-8dcd52f055c2@oss.qualcomm.com>
 <20251210-knp-dts-v3-3-8dcd52f055c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210-knp-dts-v3-3-8dcd52f055c2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDAzOCBTYWx0ZWRfX2OJrqJ74lffN
 wpqNoXjrIOwx6MFpcdwUjiVsT0eOJRAKBBfpOv1M0ly7A6Jd6gGV61leOokapWx+2hgKW+DDdBc
 CuJtfMgqMPVzDGPkxKfKxhyeKKJ9N7MRqWEomKtxQWhzf9Kt/5E6pnUMKzwfX41OjZ7ua4Bew77
 PFtIzpDFutog1F/byVf17ZMvvw5OWXwzRrK6fj1Xtb3oZhAxGe2PGzFPMUfI3ymA1BG47n2XIf0
 KY3DqbujpFDRT9SoJEWGxGLB4R1J24F2ZhcJFX1HdNtpnFXoXG0Gbzs1UeI2Oa3T7ci/R9kgg0C
 oF4jiAQWrvu1SfqJEg2b1sgAl056sRs6R8e+ofBxiUKYo1wZEGYJgnZMdnuQr2rZfIlpqbv3uXC
 yzJ0eOBbwX3c7oyNRMmS4XUqSGmerg==
X-Authority-Analysis: v=2.4 cv=dZeNHHXe c=1 sm=1 tr=0 ts=693a5a4e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=rz-J1vZrXhXIdLqqZeEA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: nG0gQ8Z_pX8cgbgCKkr-WHLdUPAYWq-L
X-Proofpoint-ORIG-GUID: nG0gQ8Z_pX8cgbgCKkr-WHLdUPAYWq-L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512110038

On Wed, Dec 10, 2025 at 07:05:04PM -0800, Jingyi Wang wrote:
> Kaanapali is Snapdragon SoC from Qualcomm.
> 
> Features added in this patch:
> - CPUs with PSCI idle states and cpufreq
> - Interrupt-controller with PDC wakeup support
> - Timers, TCSR Clock Controllers
> - Reserved Shared memory
> - GCC and RPMHCC
> - TLMM
> - Interconnect with CPU BWMONs
> - QuP with UART
> - SMMU
> - RPMhPD
> - UFS with Inline Crypto Engine
> - LLCC
> - Watchdog
> - SD Card
> - PCIe
> 
> Written with help from Raviteja Laggyshetty (added interconnect nodes),
> Taniya Das (added Clock Controllers and cpufreq), Jishnu Prakash
> (added RPMhPD), Nitin Rawat (added UFS), Gaurav Kashyap (added ICE),
> Manish Pandey (added SD Card) and Qiang Yu (added PCIe).
> 
> Co-developed-by: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
> Signed-off-by: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1606 +++++++++++++++++++++++++++++++
>  1 file changed, 1606 insertions(+)
> 
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		pdp_mem: pdp-region@81300000 {

please drop -region, please be consistent

> +			reg = <0x0 0x81300000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		aop_cmd_db_mem: aop-cmd-db@81c60000 {
> +			compatible = "qcom,cmd-db";
> +			reg = <0x0 0x81c60000 0x0 0x20000>;
> +			no-map;
> +		};
> +
> +		smem_mem: smem@81d00000 {
> +			compatible = "qcom,smem";
> +			reg = <0x0 0x81d00000 0x0 0x200000>;
> +			hwlocks = <&tcsr_mutex 3>;
> +			no-map;
> +		};
> +
> +		pdp_ns_shared_mem: pdp-ns-shared-region@81f00000 {

please drop -region

> +			reg = <0x0 0x81f00000 0x0 0x100000>;
> +			no-map;
> +		};
> +

> +
> +		pcie0: pcie@1c00000 {
> +			device_type = "pci";
> +			compatible = "qcom,kaanapali-pcie", "qcom,pcie-sm8550";
> +			reg = <0 0x01c00000 0 0x3000>,

0x0 instead of 0 (here and in other reg entries).

> +			      <0 0x40000000 0 0xf1d>,
> +			      <0 0x40000f20 0 0xa8>,
> +			      <0 0x40001000 0 0x1000>,
> +			      <0 0x40100000 0 0x100000>,
> +			      <0 0x01c03000 0 0x1000>;
> +			reg-names = "parf",
> +				    "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "config",
> +				    "mhi";
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			ranges = <0x01000000 0 0x00000000 0 0x40200000 0 0x100000>,

Also 0x0 here

> +				 <0x02000000 0 0x40300000 0 0x40300000 0 0x23d00000>;
> +

-- 
With best wishes
Dmitry

