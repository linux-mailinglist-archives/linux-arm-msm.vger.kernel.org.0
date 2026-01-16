Return-Path: <linux-arm-msm+bounces-89449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5557D337EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 17:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5DC6A300FED5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 16:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC60832939B;
	Fri, 16 Jan 2026 16:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p61F1MCf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PvY+kstN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD3133A03F
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 16:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580958; cv=none; b=A3NZwCv/VAaqv7dP7/yw8YIiuq9kTsMC+GH04JVXJpBdDMVYJLbqYc2lqPAe2rXSP8Dn4EzhZrTI+yi7CfyjyjHjv1izSzdb5nWBgj7hqLV1Yv0WoaY6s7cGEiQKdwpTtCB/5QlOqbD7PHEZX2c12M4r/trrJ/kxmyUIAKxBG28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580958; c=relaxed/simple;
	bh=/SwR1BLE0lxfGu5yjNKOHyLxTZzq91O9zIvcFmkDxvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KhJfQHo5XZ4apcLp4B56tSQSosZV1L5KC4fhlm5mskfELk3SFcVn+D1cc/wZbxmJASe41cfVHTQM1zFU0YIffBCy6kCFVjLJfJzbAfkc1P3TyYsBxDG4lv3xf3PZAjSuPzvOj1YEdOYSnLoRDp2PuzjXWwZOKo0sci5LaVB3jSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p61F1MCf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PvY+kstN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GG2S6j3714139
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 16:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CjFEZON/7JSdtKLahU+OuTK4
	OLmr/nUMnMTE/9ddKws=; b=p61F1MCfeJBhwc40UJBIbQaEI5wqUfrTyk3ABvob
	fsFHRnSmjGswKC3Kgj3yVNEbP+GDVe0E9hCUjwC/4myB7nlWxj/6CYQDh93RG3fl
	sQhJONmIYlevt+YFpos02Sj2co87pLdz127d4lYeEzSWuw9CGTEA5yD11N9QaeLH
	E55F1sVlcQgkfSujSTCZijE9RWF5M8F77knxXcZMRRFuqAMZo7/x3ys3Y8PuXmoS
	nUe7OKhbGDOrfEmpr2DcAppo0zuVVJHrt21JhyWiSQ3Ab7+qSwhZaXsxUHL2oPA3
	FTehd2Gitz0wvFmKteBHrfCdBxEAX5OGYIZBg5qOoI5aag==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96pav6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 16:29:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a69b7813so242417785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 08:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768580956; x=1769185756; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CjFEZON/7JSdtKLahU+OuTK4OLmr/nUMnMTE/9ddKws=;
        b=PvY+kstNwzGDxpFA4eMFySHih6wGivtb9HuIl26G6AZkcURvPXFVYbXarm6xHjOEQa
         FFERfaQHEDV9NG3FKSQvJSpf1sjsEpCJ9nxr6caiyMuftUCfXzQqawnypoknyY2oPxq0
         Pf3E7NP99nlkZFV46VQ2FxT4tMi8B0NwOicp2NYtBs9aowLag5YnSffEsQhpoKai/nu0
         HwocNck2gSTc3IPCtW4/1sF0yCGyy7SCU33tUxyg5rvP+wBv5wKFeJbKWAV16ggWKgZQ
         hq4AxS5dVAFXSgi+h3Sij/kC5SXUxe4VMj7e38iPTJUdhuT6hmjcKRxHBirpAtRhe89f
         Wufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768580956; x=1769185756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CjFEZON/7JSdtKLahU+OuTK4OLmr/nUMnMTE/9ddKws=;
        b=SdbNY+2VJarE4LV8bTSNXcRq/RqSP2ODpEGVQyhgWFCx1/pU3a6zGRV3R2OxmG4z4M
         i6SOcRfvggnvRpHItC6eyQB1m5rIAt1ROuLDqB9FtZeJCnC4UaqIt9eZ/KFvQREa+jXd
         9xTYLfZA4Ys/IbuPZVZXGZVFm54WrSSruaqELmErR1FpboBJOWeSM6eblxfBfURs1hAR
         1lGr5go3h1RPzHGKB9pTDGRSQ+Q4L2aeLysOz0v+BYe3da/kAbSsrSgU60XkAeIxZJPt
         DxNwXeDQssz+n7Y5M6m8W4wLK2dWY6u7HO70E+s1MsXc9GGh6vNZkBNtvMVaUhghKB+t
         SqkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXgjoecyIxGjQX5nW6Hp3A7ERks0oHqolUaIlOKLvokobG/eeQ5Yuz+i1RuRA5DtNmcsAz/sAHKpcQojSm@vger.kernel.org
X-Gm-Message-State: AOJu0YyGSDz29d644myK1ApPKl5We1qQL6gAH4m2raGwCL/lhVzWokIp
	fA8OTqhwF+WVaWgVAdkKfngs+IxkR/T1DLwzkd6jy42QIVBJQLg3Drbd71jo3rNKYNuScSIi5eq
	YjVUW+H8SQ93ZII2Ssn6kIEuSraXOauXr1QkvfGwW2JjN5X1db2EuN+NGvS/sz0r9BOfS
X-Gm-Gg: AY/fxX7EcTK689MJOFWf4MvvSA+PGfJTqFGvL/AlqC8Z3KYTVbtXFXoflFtVxn/bNX2
	k3hChhnlIk6MAUifrHBRoP/ZGodAd6vi0q/oHGZWjBdE3WsIii+k8CZVwzBA5oAC4saBAUneh5r
	jm7tNRXMFu0c1gtVGDe4kQNUV/1X31Uq3VozxX9vjEJBFAEmcoatf5AR2jUuv5glXb+hXdIdb67
	MxIhOHKciAGuEuxIvnmmzsGqwTVggLpT/Alsh7LgU6ym3sbJOdd/JYnIqPqLPQ7eOrOPfbQWUG8
	CgV9NJkgLXenXV0SQf/x5WwstavdPgikzMDZTBUWNNlQizfk0hp96Xa7nvy5Qh7Q2kiFR55/HA+
	NG2b4WL04hDxIR5tLgzMHX8PKuwIeyLDB6sKVuDhlZh/Fn3DgJY6DzJDAsvdqz8UsDs3T4Hl7MY
	8z37oGUZqC1G1zzmbhcLi8KfQ=
X-Received: by 2002:a05:620a:1707:b0:8c6:a26b:7e92 with SMTP id af79cd13be357-8c6a68bdb62mr462246185a.15.1768580955794;
        Fri, 16 Jan 2026 08:29:15 -0800 (PST)
X-Received: by 2002:a05:620a:1707:b0:8c6:a26b:7e92 with SMTP id af79cd13be357-8c6a68bdb62mr462241185a.15.1768580955253;
        Fri, 16 Jan 2026 08:29:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf34dd0dsm887335e87.26.2026.01.16.08.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 08:29:14 -0800 (PST)
Date: Fri, 16 Jan 2026 18:29:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: milos-fairphone-fp6: Add Hall Effect
 sensor
Message-ID: <syvoq2q2zol7vx7u42c4ypsh6d2ambz575ygegkn5t4pbqifpv@p7wkafrfulc5>
References: <20260116-fp6-hall-sensor-v1-1-69275c6bd809@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116-fp6-hall-sensor-v1-1-69275c6bd809@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDExOSBTYWx0ZWRfX31G/oV0hEaq3
 b75PkBTDCsf5NLJBONg8fR755yE5t4pa8jyMqCIIU91bPcDwgVwqo912ahUXZqZ82INHSTz8fa3
 ynWGNafvDGwEMl4DihqR2MikG0iCF3rCNUluF3gMyzvrSiVC/cwCXzitkTzYJgduTP4cc2wk7E6
 H0qBkxNTnuR0TDeI6LJoKtO/LJM9oLvYs7dtrYPUGplumttd0gb+1MUQW0T3NVWRFhuuwC75uSl
 zU4XUTPVyc66/Sr8VEgc9DInCMKu9GsfZW/l/6A/pRZiz0rv7K0jqeMJpXM0zssv/CDKJBC49BZ
 4cqi2IYAK5ckcStUic8L+AKNqc4JeXJHY5ipK6G5GoR27Prvvsz7CkNthths2Kfgcv/rnjSFm04
 Po/DMLeY2N8yXg/TYFMaHSo00z9X6sJc3Q2BsCrEUdWfjP0MRvhTEKULqV90C8KAx9S40jf/Zq/
 NE64qn5SBwjaNpOgBjA==
X-Authority-Analysis: v=2.4 cv=M7ZA6iws c=1 sm=1 tr=0 ts=696a675c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=p04JXNiKSxiIgApV0UoA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: euJwu27votfFM7RDp3eGUDzRhnRlJ4cN
X-Proofpoint-ORIG-GUID: euJwu27votfFM7RDp3eGUDzRhnRlJ4cN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160119

On Fri, Jan 16, 2026 at 03:22:52PM +0100, Luca Weiss wrote:
> Add a node for the Hall Effect sensor, used to detect whether the Flip
> Cover is closed or not.
> 
> The sensor is powered through vreg_l10b, so let's put a
> regulator-always-on on that to make sure the sensor gets power.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> index 7629ceddde2a..98b3fc654206 100644
> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> @@ -32,6 +32,16 @@ gpio-keys {
>  		pinctrl-0 = <&volume_up_default>;

It would be nice to add pinctrl for it too.

>  		pinctrl-names = "default";
>  
> +		/* Powered by the always-on vreg_l10b */
> +		event-hall-sensor {
> +			label = "Hall Effect Sensor";
> +			gpios = <&tlmm 70 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <EV_SW>;
> +			linux,code = <SW_LID>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +
>  		key-volume-up {
>  			label = "Volume Up";
>  			gpios = <&pm7550_gpios 6 GPIO_ACTIVE_LOW>;
> @@ -316,6 +326,8 @@ vreg_l10b: ldo10 {
>  			regulator-min-microvolt = <1800000>;
>  			regulator-max-microvolt = <1800000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			/* Hall sensor VDD */
> +			regulator-always-on;
>  		};
>  
>  		vreg_l11b: ldo11 {
> 
> ---
> base-commit: ef1c7b875741bef0ff37ae8ab8a9aaf407dc141c
> change-id: 20260116-fp6-hall-sensor-1049f2f872ac
> 
> Best regards,
> -- 
> Luca Weiss <luca.weiss@fairphone.com>
> 

-- 
With best wishes
Dmitry

