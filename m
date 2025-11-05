Return-Path: <linux-arm-msm+bounces-80380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD5CC3380F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 01:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E65E934E374
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 00:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF3823958A;
	Wed,  5 Nov 2025 00:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m8qH3CG2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DCZtTfAm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AA222D7B9
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 00:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762303624; cv=none; b=Uw29BI2mnda4AFLwAyX/xFkk7Zm9LSsr56ePznx++UHiiofrxQsYUXxYI/CZELFQavLuUXDK7mvvXN/BGlGA3v5m1ULKPPKod/Txjqwqa97Kr8hhs5WDNWmC7GHYHmmkOGfQU3CjiK44ZXza2DO8cSHFhH4zJsb5L4s1Xl6FYdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762303624; c=relaxed/simple;
	bh=6F8Ze2HqT338sAZLldmfyih2VX+hoXm90QpRHVpFcA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WJOekmOXZBJG8W/ZQIkskBPOxdtW/pduVhm+7AfJQScQjso/lPuGxQ3LkVX8BL0cvaJmGauZMa5m5HVULSD4OzeGZqigMTEv/oRCfdzc9bk24HoAMomEMSBRDCWr+FRVS+8IBkDoBcIecnVxgj/ki97cITx/awg7SqV8na9L060=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m8qH3CG2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DCZtTfAm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4KfwWR2996894
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 00:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=20DVmm7uuh12nXsj8hrA392r
	YXJpIcLN5xeBu9rny2Q=; b=m8qH3CG2VGn2+/23AvEF4QD+vI3GWfmZAryiX9df
	JxnDeT+IIkincnsOzjeClIbX2XV4jmqXC7K3rVmIjDAzjd23JkhNDYlvPlVBKv+r
	bfaV2o64BFn0S6DS/a4giayUnYKvoyAT3TwMz/oSXYQllG+yjuHNoWRO8+lbG3pl
	FsUR8tgRrPu0pnL/UklFxbVhBC5YWctOt3IQweTqmn7ZTmz4JQ8qkuWOoGfbhgS9
	X8woIPsicN4rHVUhiJ2/mlxEDc9kZLHLX/RH9jikOAMZxGMRLsUFHxlUTTBz/oBU
	mkWXpa6eXOYrPnmr1m1xZnAtq1EO1zTqe3lZEc8iwn1/5w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7c7jk16m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 00:47:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-88f81cf8244so2542126685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 16:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762303621; x=1762908421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=20DVmm7uuh12nXsj8hrA392rYXJpIcLN5xeBu9rny2Q=;
        b=DCZtTfAmZEBfbJhHIHblDf+akQk0PgX7GzI/STqSFvE54TrGQO5B3NgMg6WBTyShxb
         S4mKw+fIs4Xyr0IuXYEpm9D+xzUkcE4HgUKqHH3NOTKUmSaeggF4QbVh3zAil2P8ib81
         v2igHsWlrPkaJ5w4KZm0Fmfs9xO6SiGHDwp8mFu/DEdKuvyots5MvpoYa0NeHKac/kJA
         kwsfOfrwf37If6Sh13V3xP9cjpFLg/KOLVkkjvEQTTg1506ROTJhB0/xCi0eqvB5ck7S
         Rsk3dy1pgIpHsZZ0njismTbxbyb4E4J/h84RsOs6dA3xt7VNPTO9wdvC9BBdNPcusqZp
         t0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762303621; x=1762908421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20DVmm7uuh12nXsj8hrA392rYXJpIcLN5xeBu9rny2Q=;
        b=eeZDsJuYZCi06SAaT7dQxtV79YHaZF8g1+lz/u8Fs5eXFmCTJs/DBg3W1hPAxjrLnJ
         JTgrbNJrATvg3iVPk4Yaxz3wrvoMpBWw7HQAvBLU1Axta09EH/joRDmQ93Uum1yXKtZ4
         ngx2eLlFRyH8UTzCsOwNCm49khfadxAnlg15XU3YcWJq9oRnc4vpZfRzIR2IqBXGGcM/
         C0t54jJV9wvAeCUOjf1ov91XXWGKlKwaoICjX27Ms07RnPvHIytU0lQAwWw26iDISJHq
         XBM29dZobxRPTIxaiNXeqYOg8g9ybgx8pFaCQwFoZEdLANX5J6b8nvoGENxD9w/NB5u0
         ZASw==
X-Gm-Message-State: AOJu0YxZ5UUwS8rmK9eyNWWzVJBlb05m6PK+SrZmz/2lz/M0a2CSrv9q
	HSXwYINr8kqCJ/5vnNK6W+i3foXZpISxIf0Skf9lryMMHeXzsPp+CvzlMaUi2eVXwLXqDy93h5O
	GE5E5MWYtp/gx4jvu+O9oZZwOZu2jmC4TINc6X68Shg9YL9IGukdLkZerN8VHeBRRC1v8
X-Gm-Gg: ASbGncviPwG3elkcajR3CNxfKmpoCQK1ISfMPYgW8JUVYppFViXDK/rXldPK3ZonJbb
	rgh8IuwQKzevecgWmG0TNGd+wCaySm6GU0PZZPjCbdS8cIACVgvkqYy9ruUVkbqhVkFy9t+kfBo
	utYzpkYoN0cu9L2H82cL9xDUypYnq834/IG2oho+z3Ei1m2/G9bs95xh8/8NBhq5vYdcaXFuKOm
	yVAgKV862BQBOgm5hHgBy4VI/7PlxG0gdo65aezUZGo5MYZu/apHrQa7J354OjZJUqcSY4bB/3e
	Oxh4RNF3urEIdwoOWGT03iWUgNOYX0JmsqXFMHK3jao42+C3azO9m533J/crYgUX4daNQMiZNrL
	818CY3cnHVUOE9NsfZb6VzJrBOKOtf8wYVe60CRYvig3FrdPp8+ArtbCdq+E+NNT9kdqHUNbhfN
	K5us8iECS0tBQo
X-Received: by 2002:a05:620a:4044:b0:8ab:7ac3:3271 with SMTP id af79cd13be357-8b220b14872mr232600585a.36.1762303620882;
        Tue, 04 Nov 2025 16:47:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMkUX7jC+eXTRNJvJBEYnUpg6UwMXTsq4CChhPcvUGcohxQhFgjhegR3VopNF4Y97oL3PhWg==
X-Received: by 2002:a05:620a:4044:b0:8ab:7ac3:3271 with SMTP id af79cd13be357-8b220b14872mr232597685a.36.1762303620300;
        Tue, 04 Nov 2025 16:47:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5943437ed06sm1178233e87.16.2025.11.04.16.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 16:46:59 -0800 (PST)
Date: Wed, 5 Nov 2025 02:46:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Piyush Raj Chouhan <pc1598@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, tony.luck@intel.com,
        gpiccoli@igalia.com, david@ixit.cz
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sm8150: Move usb-role-switch
 property to common dtsi
Message-ID: <caf3qjqs45lbmb4fb5mj7qordkh5yb37iftwro6y6jitn5fhj5@eb62whwvo5g4>
References: <20251104221657.51580-1-pc1598@mainlining.org>
 <20251104221657.51580-3-pc1598@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104221657.51580-3-pc1598@mainlining.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDAwNCBTYWx0ZWRfXx1aO6KHXNr1f
 x5qbDKtIyvsfDrC6sVjSJDKnybmVjVW98zpstbjPdoGigJtou74v+LMTzhEn973kU6hAD7aKCeC
 zYTWArfijLho9Dgg32FuZl0ZovjX/Tj864peNZ+dgecniB92yfl3S+0pefWeCWfZhVkhIeG0PEe
 NKyOoMUN5Vgev72xM/WRTrZ+GvA+WnGOwg+PHo1nDl84N/Mg1MmLJ5DAyDl0DbIyzZSGOsI9z1/
 zP8D3LFOds+ffbxGShXWhnBb+cNVmaVYYz4pBjDbY7oT9qB30YjVkCN4ttl7u8A0P107i7MRoKr
 r9DiBwwTg61g2Z5ptfqO/QwGQk2XWRtUM10ANDcqUpDxLEDke5v/3cYNRHWZ/GDtrPZRG2RpPGT
 Lbl2LhehywQWJaq0XbsjZOL5VvceOg==
X-Proofpoint-ORIG-GUID: xMcfTlB96_SDmARAhsIgQLIHly169pca
X-Proofpoint-GUID: xMcfTlB96_SDmARAhsIgQLIHly169pca
X-Authority-Analysis: v=2.4 cv=DvNbOW/+ c=1 sm=1 tr=0 ts=690a9e86 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=OuZLqq7tAAAA:8 a=qM2R4nZWQg-DivYOzAMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050004

On Wed, Nov 05, 2025 at 03:46:56AM +0530, Piyush Raj Chouhan wrote:
> Signed-off-by: Piyush Raj Chouhan <pc1598@mainlining.org>

Missing commit message

> ---
>  arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 1 -
>  arch/arm64/boot/dts/qcom/sm8150.dtsi    | 2 ++
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
> index 0339a572f34d..29afee6160cd 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
> @@ -693,7 +693,6 @@ &usb_2 {
>  
>  &usb_1_dwc3 {
>  	dr_mode = "otg";

You can drop this line too, it's the default.

> -	usb-role-switch;
>  };
>  
>  &usb_1_dwc3_hs {
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index acdba79612aa..cd05975dacd1 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -3661,6 +3661,8 @@ usb_1_dwc3: usb@a600000 {
>  				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
>  				phy-names = "usb2-phy", "usb3-phy";
>  
> +				usb-role-switch;
> +
>  				ports {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> -- 
> 2.51.2
> 

-- 
With best wishes
Dmitry

