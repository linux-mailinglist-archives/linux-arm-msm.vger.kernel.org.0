Return-Path: <linux-arm-msm+bounces-84857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C29CB1ACA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 02:57:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50421300A373
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 01:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0202922A4EB;
	Wed, 10 Dec 2025 01:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jo40O+Zp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ETfZ9yPX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7331FBC8C
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 01:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765331756; cv=none; b=Hq/hI+hplge8JAybDaBlir4f6sEVFo+6h6/mCvCFZ+teJab0xWSlsi6Jtfph98ybXoBb3jZ3GUhOjpRc8CLDvSv2XIPppcyBBnuOUHFP8F/DqcL1q63eHuUUeMChTnwM+WrqSM9AcdyMYvSKejmo256eiSRvjg7VygLwDxB3ydw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765331756; c=relaxed/simple;
	bh=DKLuJf/JXfx0yQ4P8Pqgx98d6NTEQ2xj8uZxS47Qf88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZmBEup+ohE1StwS0/0nplu9+E9qKfnXfYSqy4Pq3EZm/GlKn8QtdhRSKb+MJJPzfcO/pHaCWJstBVNK0pgPo/KOnWh+akTaeM6EcNfh/rJL/W1i1BUue7P/IpYiTWQFex5WE0wYDxQ83Eie4dL1Bq/NWGwyhbJZd8e6S5x9LJ7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jo40O+Zp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ETfZ9yPX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA0OSb91373551
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 01:55:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qAgt24CjLNqR+WvXK3Cl+58W
	cP9a5/vRqB+dhz4UKy4=; b=jo40O+ZpP1Pkrn5fAs9YrBw17xorA6CAwjXi5Omk
	vUEpsooiyknXzmZP+Cha5FQ62VA4z6sBJKISUdYHmr9nBL5yrGOtEZ9NFZ8Z7hSG
	i1ABh52icIy4JlPaNqwc+ATLc0Iv8VOWHczWfX1d97V9WWGVkzZ1rtqtdBNRtnzO
	jrhH4dqmqh4Pk9pmeN6EWGE5IsPQjr4xq+1CWpqcN4XiCjtygXybDOOCq3UIbMlC
	IzoDv5CmzyRka+ug9fktIR5f0/UsNt2ddLGP0Pejo4KohjDN3DFRPn6WpSlbW2f5
	XhSVnDbMtjodA/0njMo3eMJ1XjGprwRH1+ZVs6mG7NhWzg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axvm68pd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 01:55:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee0c1d1b36so8394321cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 17:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765331753; x=1765936553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qAgt24CjLNqR+WvXK3Cl+58WcP9a5/vRqB+dhz4UKy4=;
        b=ETfZ9yPXYw3dPyrcpl1sRKTSwwbzbMdInN1GTYQFJG3d42EB59JMfUuIjzJMvBGY65
         PEMe++vuWzIRifxyCHoH6mvowD07zvGL4wifBL+d9FvrH1PhbB+2e0EV5f0uhXuyKSGA
         XiCc5K9avQg4yXByddnqTpy5KXFskbZfQXkcM/NRle711ZiONx9+1yfB9SKtfOWSNRek
         YqgiF7CrqBlvAphqBzgAS/Gj/pep3o2f3BTKTr3so5VS6mPGVhEThKF7nwdSoIfxWtDs
         D6HiF6JOpM/P3gRRIEMni+FAUT16OJxAuEi4givZm49J3GJm9i/xl60Mzu7K+2Mk4mi0
         Zcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765331753; x=1765936553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qAgt24CjLNqR+WvXK3Cl+58WcP9a5/vRqB+dhz4UKy4=;
        b=OThKpHTsD55c61YSfwF0xgYvXpLL8LMpuvX5P4avaJyvRKUG+DxfCq3P7ff18SKl5H
         cf0kLvyWUfVkLZgntzl19vmrRGl8oJPjk4bFIsPS8evcueC0btl6p1mYUEkhF7jg7ohW
         Oz7OMvctzTtqcDX6ysP4BGnpGvEgB7jmdifTAiFqZYGqhoydvKc0vpx6KRs0CF59FOtk
         biUbCLVS9B/seBz3B5CKd0/yeCkOuOxJdV+O1DWNYQDgKJu8HOkEVHxvVZFBE9npLxvs
         CrUn7SE7RP3GKWfIjIayHlB891mBYUsLFPgjqKaqgH5QLSOhL0YJVqt0GuZKQjfTkF5c
         2u5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1fnshIqkGT5BUUtiRggqsDH+cDOtGMBaR1FS9rUsxWyImxlotncf9ihz5pk6SkcJ+KGt+GXLHon5kNrnZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy57EyYQV7BgJAjaevZRsRJFDIaNvz9TW8sR/9bnmtRwJrdhTqA
	b95PUoQsL0qStw8daxFH0Voi6530WkO76Fa1tZHoLfky+0BMHLyc8aVvM/oBTfEiVVVc20g6qOb
	+uc8/rB7ODESjRCn0YGYWXAA2m4TeaAfae3LbEkUdkV1OimZkqEHb2gKV08Xbl/eemK0Z
X-Gm-Gg: ASbGncv/bT63vGiPyQF4uZA/u6B46+mDItUjX0pIK0/q9nmRPHCh7Vx28re3Tbl+5rt
	RW1ajOepIH8tYSljp/T1b5QbsbJcCu5A/xaQ4+HRrCr0KGFoTTaev52G3BuWWNzZqu8vm3SVItf
	5gpm3KUEFRkQg0/95E2MizB7rbSwUpOqOsfmongKxJZkqwvhgYCNfojQoErYkf/M0CvnNm85+rq
	XZrYntCdlGnQEcDh7oOUIOklaX8kFdiUVI8qt/f7XOcbF5sL97Yvj7AobHa3pKuaFz5kixVMWCN
	x0fvs+H3/FHf2DUOHR6hjdL8eIE2H0k0DxNphlV6ZGnDyNRbcQbh9eszyqEJo7D6HycZRjFEhm+
	6zZVHjpY7I80liHZiLkc35G8t+2sslLItOnKFIu0SDsHbiEskm/XzVVUAaaaq2QbJqwAiAKe7Ic
	oo+47HyG8dZ8POMNhwSrJZVqc=
X-Received: by 2002:a05:622a:241:b0:4ee:27a9:958d with SMTP id d75a77b69052e-4f1a9aefc6dmr52953291cf.16.1765331752987;
        Tue, 09 Dec 2025 17:55:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGK5XK3i3G3Us0uj0x5snz5jiGDnyHy4S/JJpNtTObFaEy+FoqP2sYHhTDnJM9LoVKGdlTvXA==
X-Received: by 2002:a05:622a:241:b0:4ee:27a9:958d with SMTP id d75a77b69052e-4f1a9aefc6dmr52953131cf.16.1765331752469;
        Tue, 09 Dec 2025 17:55:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e2c2sm5815838e87.63.2025.12.09.17.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 17:55:51 -0800 (PST)
Date: Wed, 10 Dec 2025 03:55:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 5/9] arm64: dts: qcom: pm8550vs: Disable different
 PMIC SIDs by default
Message-ID: <jyyamotpswptzirtido6iufroxpdu3dyqkf4zs3hkfqj6mt6f2@sklyrpyahzjb>
References: <20251210-sm7635-fp6-initial-v4-0-b05fddd8b45c@fairphone.com>
 <20251210-sm7635-fp6-initial-v4-5-b05fddd8b45c@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210-sm7635-fp6-initial-v4-5-b05fddd8b45c@fairphone.com>
X-Proofpoint-GUID: ZK2f9P6H6Ys2VY9n21_kLLzBJIT4OLmW
X-Proofpoint-ORIG-GUID: ZK2f9P6H6Ys2VY9n21_kLLzBJIT4OLmW
X-Authority-Analysis: v=2.4 cv=Ztbg6t7G c=1 sm=1 tr=0 ts=6938d329 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=BWpuR-d3BRky3lTXAc8A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAxNSBTYWx0ZWRfX5xt+FkDVUq4+
 RIeqLDOuB25NXD65cIjeJ+SsFL2HpfXaKMDybmx4h4t4b/0VN6kh1Lw7jVb8hl3VsZB78EMboAm
 155S2hgN5hU0jiIlJaQhcFodcZdERz8ABCLPqDbuTGdWLGjX43tFRhAC/l51kdgMo7o4Jk4NGnW
 JmiKR5o0dtSypMcezJlH2Zt98FiRE+D/V3XtxEsDO4dALvKcp4ZWvz6a3KyCaYcSQNjeThqHn8j
 H2RHZIqy1jEFmPqXRw46/bPyHJVcPEWMkx+qtdjyKry5tzDY+BF8A4xbjoD4lcegdp6aJvkdNjS
 md7ahBC06PeQdDiCp9ETV0jfxNCYMPr1z8UQ9Y7gVuThIoy0HFmA1NMk8Ggm85DxoSh0TY8slf1
 7N2Wzabv56oN5lbTl+vkINCqgsdQ2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100015

On Wed, Dec 10, 2025 at 10:43:29AM +0900, Luca Weiss wrote:
> Keep the different PMIC definitions in pm8550vs.dtsi disabled by
> default, and only enable them in boards explicitly.
> 
> This allows to support boards better which only have pm8550vs_c, like
> the Milos/SM7635-based Fairphone (Gen. 6).
> 
> Note: I assume that at least some of these devices with PM8550VS also
> don't have _c, _d, _e and _g, but this patch is keeping the resulting
> devicetree the same as before this change, disabling them on boards that
> don't actually have those is out of scope for this patch.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/pm8550vs.dtsi                   |  8 ++++++++
>  arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi             | 16 ++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8550-hdk.dts                  | 16 ++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8550-mtp.dts                  | 16 ++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8550-qrd.dts                  | 16 ++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts          | 16 ++++++++++++++++
>  .../boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts     | 16 ++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8650-hdk.dts                  | 16 ++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8650-mtp.dts                  | 16 ++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8650-qrd.dts                  | 16 ++++++++++++++++
>  10 files changed, 152 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8550vs.dtsi b/arch/arm64/boot/dts/qcom/pm8550vs.dtsi
> index 6426b431616b..7b5898c263ad 100644
> --- a/arch/arm64/boot/dts/qcom/pm8550vs.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8550vs.dtsi
> @@ -98,6 +98,8 @@ pm8550vs_c: pmic@2 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> +		status = "disabled";
> +

Would it be better to split pm8550vs into 4 files rather than disabling
irrelevant bits?

>  		pm8550vs_c_temp_alarm: temp-alarm@a00 {
>  			compatible = "qcom,spmi-temp-alarm";
>  			reg = <0xa00>;
> @@ -122,6 +124,8 @@ pm8550vs_d: pmic@3 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> +		status = "disabled";
> +
>  		pm8550vs_d_temp_alarm: temp-alarm@a00 {
>  			compatible = "qcom,spmi-temp-alarm";
>  			reg = <0xa00>;
> @@ -146,6 +150,8 @@ pm8550vs_e: pmic@4 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> +		status = "disabled";
> +
>  		pm8550vs_e_temp_alarm: temp-alarm@a00 {
>  			compatible = "qcom,spmi-temp-alarm";
>  			reg = <0xa00>;
> @@ -170,6 +176,8 @@ pm8550vs_g: pmic@6 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> +		status = "disabled";
> +
>  		pm8550vs_g_temp_alarm: temp-alarm@a00 {
>  			compatible = "qcom,spmi-temp-alarm";
>  			reg = <0xa00>;
> diff --git a/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi b/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
> index e6ac529e6b72..e6ebb643203b 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
> @@ -366,6 +366,22 @@ &pm8550b_eusb2_repeater {
>  	vdd3-supply = <&vreg_l5b_3p1>;
>  };
>  
> +&pm8550vs_c {
> +	status = "okay";
> +};
> +
> +&pm8550vs_d {
> +	status = "okay";
> +};
> +
> +&pm8550vs_e {
> +	status = "okay";
> +};
> +
> +&pm8550vs_g {
> +	status = "okay";
> +};
> +
>  &sleep_clk {
>  	clock-frequency = <32764>;
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> index 599850c48494..ee13e6136a82 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> @@ -1107,6 +1107,22 @@ &pm8550b_eusb2_repeater {
>  	vdd3-supply = <&vreg_l5b_3p1>;
>  };
>  
> +&pm8550vs_c {
> +	status = "okay";
> +};
> +
> +&pm8550vs_d {
> +	status = "okay";
> +};
> +
> +&pm8550vs_e {
> +	status = "okay";
> +};
> +
> +&pm8550vs_g {
> +	status = "okay";
> +};
> +
>  &pon_pwrkey {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> index f430038bd402..94ed1c221856 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> @@ -789,6 +789,22 @@ &pm8550b_eusb2_repeater {
>  	vdd3-supply = <&vreg_l5b_3p1>;
>  };
>  
> +&pm8550vs_c {
> +	status = "okay";
> +};
> +
> +&pm8550vs_d {
> +	status = "okay";
> +};
> +
> +&pm8550vs_e {
> +	status = "okay";
> +};
> +
> +&pm8550vs_g {
> +	status = "okay";
> +};
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> index 05c98fe2c25b..3fd261377a0c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> @@ -1003,6 +1003,22 @@ &pm8550b_eusb2_repeater {
>  	vdd3-supply = <&vreg_l5b_3p1>;
>  };
>  
> +&pm8550vs_c {
> +	status = "okay";
> +};
> +
> +&pm8550vs_d {
> +	status = "okay";
> +};
> +
> +&pm8550vs_e {
> +	status = "okay";
> +};
> +
> +&pm8550vs_g {
> +	status = "okay";
> +};
> +
>  &pon_pwrkey {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
> index b4ef40ae2cd9..81c02ee27fe9 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
> @@ -533,6 +533,22 @@ volume_up_n: volume-up-n-state {
>  	};
>  };
>  
> +&pm8550vs_c {
> +	status = "okay";
> +};
> +
> +&pm8550vs_d {
> +	status = "okay";
> +};
> +
> +&pm8550vs_e {
> +	status = "okay";
> +};
> +
> +&pm8550vs_g {
> +	status = "okay";
> +};
> +
>  &pon_pwrkey {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
> index d90dc7b37c4a..0e6ed6fce614 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
> @@ -661,6 +661,22 @@ focus_n: focus-n-state {
>  	};
>  };
>  
> +&pm8550vs_c {
> +	status = "okay";
> +};
> +
> +&pm8550vs_d {
> +	status = "okay";
> +};
> +
> +&pm8550vs_e {
> +	status = "okay";
> +};
> +
> +&pm8550vs_g {
> +	status = "okay";
> +};
> +
>  &pm8550vs_g_gpios {
>  	cam_pwr_a_cs: cam-pwr-a-cs-state {
>  		pins = "gpio4";
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> index 5bf1af3308ce..eabc828c05b4 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> @@ -1046,6 +1046,22 @@ &pm8550b_eusb2_repeater {
>  	vdd3-supply = <&vreg_l5b_3p1>;
>  };
>  
> +&pm8550vs_c {
> +	status = "okay";
> +};
> +
> +&pm8550vs_d {
> +	status = "okay";
> +};
> +
> +&pm8550vs_e {
> +	status = "okay";
> +};
> +
> +&pm8550vs_g {
> +	status = "okay";
> +};
> +
>  &pon_pwrkey {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
> index c67bbace2743..bb688a5d21c2 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
> @@ -692,6 +692,22 @@ &pm8550b_eusb2_repeater {
>  	vdd3-supply = <&vreg_l5b_3p1>;
>  };
>  
> +&pm8550vs_c {
> +	status = "okay";
> +};
> +
> +&pm8550vs_d {
> +	status = "okay";
> +};
> +
> +&pm8550vs_e {
> +	status = "okay";
> +};
> +
> +&pm8550vs_g {
> +	status = "okay";
> +};
> +
>  &qupv3_id_1 {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> index b2feac61a89f..809fd6080a99 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> @@ -1002,6 +1002,22 @@ &pm8550b_eusb2_repeater {
>  	vdd3-supply = <&vreg_l5b_3p1>;
>  };
>  
> +&pm8550vs_c {
> +	status = "okay";
> +};
> +
> +&pm8550vs_d {
> +	status = "okay";
> +};
> +
> +&pm8550vs_e {
> +	status = "okay";
> +};
> +
> +&pm8550vs_g {
> +	status = "okay";
> +};
> +
>  &qup_i2c3_data_clk {
>  	/* Use internal I2C pull-up */
>  	bias-pull-up = <2200>;
> 
> -- 
> 2.52.0
> 

-- 
With best wishes
Dmitry

