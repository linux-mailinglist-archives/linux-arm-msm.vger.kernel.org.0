Return-Path: <linux-arm-msm+bounces-81239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D65B3C4DA07
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 13:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B47A74F69AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 12:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43411351FAC;
	Tue, 11 Nov 2025 12:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aP+bf9so";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HzUadAkw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E220357711
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762863235; cv=none; b=j3SJfyLYSfvBAqoIImW9v6db/Wblq2/X1tkg3fd9bthnwS0OA2SzVPvMRDedx8xrhkZVRYOIKd37qagWPjsebmElXH77Tcsp7H8C67mXoqD+95q3zaMpV4ezxpp1XQxphPsK+DsRGQBYZHWrOF1qWNGVyIF4+OzhIcx0FscwTeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762863235; c=relaxed/simple;
	bh=xdmR3eERZWwZ05yyx09SGkEALCl2y3uliCa5xdEL3Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKfI1kkDqWSsBAXGqK7ddTG2K/111VJ/ZvCVRvtxzYBDHEEPvsQ6+wN37H/AnOM9shIfg/Qfb/TL4oz6aKkJI/O7KlIYDkIWbAX3m60h67nc9jFN+gpCkPQxopKUY2aOt8T4pVIXumq95pHej1/CYZporH70L+elpCZ+qJkH03s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aP+bf9so; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HzUadAkw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBGNHW2425570
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:13:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wcoRpwtQ83TE2nxIPk4SaxNN
	R0hLbOYyb8v5x+ZJclE=; b=aP+bf9soyVQ65bJm3Ri/fPqq/tujPJg7Y1TLcA5b
	CVv0H/nNLCy+rBjVVlFdYyVsot0N9qc5Gry3NU3xFXDjWz8s2jSzJmbWFT1p70iu
	/ChQL41V8MiygQ0812BUsQqIPaYbuW1/rTOgeIww3sPBqmSDFHJLZsuDcffujxvm
	qjSuL+UAwRbVYfOl9TxSOfImTv6UF6wSC2gpWJ0bd3lEPwB8FNCUF9K8hBQlFQKW
	gCanA1FCICCRMeTS74ucfP7LN6rxcROQncSrnzUa5guCSIu1CLnZyOBtmSrJz7A3
	ixZPiY9rzz8cT47pvx64eu7Rv+WWEHjgh2LI9gCntSRBWA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ac2350hud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:13:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed79dd4a47so115480421cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 04:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762863232; x=1763468032; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wcoRpwtQ83TE2nxIPk4SaxNNR0hLbOYyb8v5x+ZJclE=;
        b=HzUadAkwr8RFV6BfD7KY54F/qGS6VRHPgoxBislWM6PNwyc39glFuVJu66gyhDCUQk
         QuB8MaEq2mbd7vxE/6tBJCl3NRcBcvp+sbUoBrxJxqkrZIx6rbPOCn715BWCcevkQGSy
         xXKY5qSgtEBNe7UCu93JJqMZfja+xUqkElUcjTNUhquQUUxbJBfDlAoo9ZJlGCyKmBws
         93MD5Rc+8kGwAfbWQuotgzbMAsETLoMWzxW9Cgsrlg7jodt72086QfsoGjCjnfwpdLOg
         tOHwvZSdfX2Cel6FDh6mJGIdMM6ZGEzroBNdUSeGt1Iuk0wVDU3g2fmjm6cItiREs6+s
         dVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762863232; x=1763468032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wcoRpwtQ83TE2nxIPk4SaxNNR0hLbOYyb8v5x+ZJclE=;
        b=adBJk8xHpvop269QUnmUD9+/NdvS2nN1+jJkd6km+A3nzwj11BLFsmMujymNjtV+TR
         AlAoZshSiMCWNWRjvVGwQSh05Gtbp6t8DC+Gcc06Uq3ULadNzVhEbGlvVesFciX0KUpY
         Ru5UPPB8Jb/fQqsCltnX62Fz3IlKxEdFlyxlFd5j1ibdzVv27yh0dp+s9gEuB8DZ4Dcg
         ofbIcixYLyRYU/jsFpmtsJCzGRW5kEeB9g2nmclEKUaLpwYRdNRjmIKBhpKKWHikGJ4u
         2+X+2oqFegFdtLHkwl8x2lSpNIZ7s+gOP/NsJW98wjW7WiqkAjef6Ie5Duu3wWN48uFd
         hsCg==
X-Forwarded-Encrypted: i=1; AJvYcCVbagnQWtt/mgfdMbMJDYmXJqkNhEZPg376+NbTSKToPQQoxTc20ByeBAT9mgCuYJAS6sXfzZ1N7IrnJeB9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6EchJySFYIbdflXmfwTvg4yb9nTfdqQ+TGoLILIQwSckgdjlL
	cy8QB2XKl8X/A19C499A0apik4sxKA1aiANozC6TpqeyKvvBLpXhVMDT3AK7oZGKgsjp3oyTfEo
	urEmIut6IjL4f8vTNGR40gedPE5Lj3hPAloug/G9hC1i/PCvDpKsBbYPOCIheY04uUCYW
X-Gm-Gg: ASbGncuSyUHOb1AoYf07WxmlOjEsdMglIrrL55tRbej1f4Y9Jbn5EQQVMS3VJpMUwU4
	jfZGdj9Qjhg8YReaMvipg82yJwcD51v8STiciQuUNgy+X8ljEqIYcCn7wsvN6FEu1Z4Slz+TOFQ
	cz7alK/bgWAOCnBZo7H/Jm8crIqSL5zfCQbVeMMfCUVh9qk3l+B7Xdz+LhNYYo3O53SQnxpx84v
	7dwz+9hLPTUPgtfkjvMnYlRufyNX7C11JIZjowseBhAVk9ulDVCHnBZ3aKgSJcI1u5/5FZwnP7l
	793bLFNBSW50W6W4VoL+mFtzVW2OG7FlLieu4vTit406z9RC87UUjcogAiuLB+Q0Lvky6YPJAlU
	UTwZr1CUvqwT1zWTmTGc6CQcnzx5iKDbYy1YBFISIARunMnrtGbt4xr/OqtjwA3UmHKwK6Eyspu
	+CAeHU9B7koboD
X-Received: by 2002:ac8:7fd5:0:b0:4e8:8934:6df1 with SMTP id d75a77b69052e-4eda4feae5bmr143959071cf.79.1762863231052;
        Tue, 11 Nov 2025 04:13:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHspHKQ+CLNVRcypu8hhRWfYAeta+BzgOtl4xKcJcK4aas4ChOSoXpfc6iUuhi55jU0CPLDOg==
X-Received: by 2002:ac8:7fd5:0:b0:4e8:8934:6df1 with SMTP id d75a77b69052e-4eda4feae5bmr143958801cf.79.1762863230613;
        Tue, 11 Nov 2025 04:13:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a0b75f2sm4830694e87.54.2025.11.11.04.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 04:13:49 -0800 (PST)
Date: Tue, 11 Nov 2025 14:13:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: hamoa-iot-evk: Enable TPM
 (ST33) on SPI11
Message-ID: <bppszvihd4ropnwljshsbx7ppxzbh3qfza7ocf5gnyff4igeyj@g25l3mekylgz>
References: <20251111-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-v2-0-101a801974b6@oss.qualcomm.com>
 <20251111-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-v2-2-101a801974b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-v2-2-101a801974b6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA5NyBTYWx0ZWRfX8bDzAZlnnOs1
 hKrZNmCMBJrHab5qaxlL33rEw5V2tk+dTHSXP4UlaRf9xXt8Qsz1+yDwAsy1C52SfzBiS2qjuUg
 wgNEZsJXQL8fJzYNdY+xG3C27Q0pK2e3BaRKfsc8aCk9R1t0XCbd/ZtNWZbrqYu18gNFxjIiFO8
 rdXVzdb+3rTfmTwbhq+3hZw6VN/Vh+tMUhU/2RZWoB/OGIMOaMzpHu4yP0SSa6zFWdSCmZaypKX
 s43A5rKY21VFA2i98xEMS8P36A8fNUSgyZ4vl/jBnY3Tj7BnYW+iMOCdNanaHeAJ9zSvzVzoVzj
 Eu0fHWuw8bcMI4H8PwNLjz1QtCXpNxfcCeleFc0/0UKeRbSeUTnvKzz8O0XMbEcC/ztzfcFWPEm
 nE05YNhzV404CYbEOeErgJyNTMMeQA==
X-Proofpoint-ORIG-GUID: jW9Zq3N5L6kqyOZbs1s1dq5JXQDN5hnV
X-Proofpoint-GUID: jW9Zq3N5L6kqyOZbs1s1dq5JXQDN5hnV
X-Authority-Analysis: v=2.4 cv=O8I0fR9W c=1 sm=1 tr=0 ts=69132880 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=pkoaJ9_ZSZekED1SlcUA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511110097

On Tue, Nov 11, 2025 at 05:28:56PM +0530, Khalid Faisal Ansari wrote:
> Enable ST33HTPM TPM over SPI11 on the Hamoa IoT EVK by adding the
> required SPI and TPM nodes.
> 
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> index 08465f761e88..aecaebebcef5 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> @@ -921,7 +921,7 @@ &spi11 {
>  	status = "okay";
>  
>  	tpm@0 {
> -		compatible = "st,st33htpm-spi";
> +		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";

What prevents this patch from being squashed into the previous one?

>  		reg = <0>;
>  		spi-max-frequency = <20000000>;
>  	};
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

