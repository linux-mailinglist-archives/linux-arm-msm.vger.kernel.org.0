Return-Path: <linux-arm-msm+bounces-52547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFF4A71D2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 18:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76A8A188857E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 17:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D402A23BCE1;
	Wed, 26 Mar 2025 17:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iaf4Gejf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A3323AE64
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 17:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743010448; cv=none; b=Syx3yljQY+qi2s7RHImdB+uL31dgIa2w4pH/bSDHoerMkaJz/dPTcDbNN+UpssX1CXLTW2hjZxw6bCs3lbe8hKj6OW/v0NaO34PyMlLCwhvVwF9D4glmyXdQmnrWDjVBX4m+YujXYy7kT1qF7OzVT5z5qASu+l0APBPoImH47X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743010448; c=relaxed/simple;
	bh=TshgAFtyv5Gr+4/wXY0hrRMqxkHhiwNlwhq5rWwU3Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4ELraDi2uJDkWH+iaUyLdGJJOw1XIfh9FuCKvAq5dj0nIi8kgZFs9XhhsTeBKCWbueBczivoPCVFhjyVp7eY7eJuV8QGLBnt3d+SPLtwDv9WccZTMjUres5fwEpFyWOrjprHA3zYDyw/q8a4v/ASs4RWYugVuBHh3DMY4Y0hrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iaf4Gejf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QEiO6R015022
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 17:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0dPgSCIRGo94m6zrHPu6fd9s
	lXLX2m3rPOIFR+j5fAs=; b=iaf4GejfTDQUzZkBdycMOSBp1SM5r6Yc59mDIJc8
	uKeSm1lMokXp/VQdRH2USGI6OZXjv6Fv5PmUUwl+j1heP1O9ftMdYbvIHXjPLuOI
	E/DUSJLcc5QTXC95lYMh8l6HbpGY6Bj4DrE2okNrFXG7HwMWmHcy8rcfoN2KAvz8
	kO7W6DHNMHJBy5YxYyIfqI9l71UEfMPzdGTK3lTtX0o5tt1IoXfAJqF/c0X5DYCW
	j7QqNhcrOWFxOBxGAPOait/aMuXCREfYGq61Rzq33J1WZnhi7QdGurkwQExXfOEZ
	ssd3+s7H1cyv2kF5Go2hzeRNpSMg59ita5OmX77nvVR6qg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mb9mt302-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 17:34:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5750ca8b2so19438585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 10:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743010445; x=1743615245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dPgSCIRGo94m6zrHPu6fd9slXLX2m3rPOIFR+j5fAs=;
        b=A+/OqGcJqMVNyW73g1PbPPkWwksasIoXYE97VooJG920rklCkA7iH2OTkPwiTjqpi2
         SicP9ARA2Yp9jYT7MG0+i2kqoh/OBzoQsLnosVCW9adT1pmrMreKul0bQQ4Nyjl9XVRB
         bvbcqWnENvSlZzzEjcmhcd2Sp8703HzpRv7qNSmv2cY7ABidVCjfif+RPbssmNeLxzmf
         VrT++AHE8yT+2+7V86hJTSYm4DgwaC+G5iNuH/mNCejFG/5l4XrjYt4lZpRZBpzHGTj2
         TgOmzPj6bGCE/ik7Mxh8p27o46OhGW50FvzNYLa3lIizspYDudJ8JM6KGVH7nyK27ePp
         NWXw==
X-Forwarded-Encrypted: i=1; AJvYcCWyiJj9hfETTak+OGov8ktHG1GMlM194rwEsksidHJGS/SsaofcPAar/MswqfXZh45kEXOQOx+NzttOV2K6@vger.kernel.org
X-Gm-Message-State: AOJu0YxmoTfQJq1beyvMjPY96VRQc77ZTG1C04uZJ8zmZyHOsdxD6ikg
	aktqHsJ1w86j2sX1IgiiVaRbuxgjBzNeCIP/BUhJgcNeyWPvUUxguAcg+P3JuBmlc1+I0Yn7EzI
	P0i2EFYSBoHkJ8gNVbDnfPawcd+v1HIqAJXSMYKUt8dV5mKqAofUg3v9q9KM0zoQn
X-Gm-Gg: ASbGncsZrxJy1Odu6XaZb3rumdhINeyWJvbtV8UWE/WtUxVV6xQJHsHiCcn7wMTRF6C
	CqVm7FLEixmkgp1lgHE52QrMcxLj0q/scKptmUApsT8ZeXQJ4zmrRXib8rYk1ejrPH/1xqrqqCG
	KKU3GP1cq5gY1ScldnnZX7BSOBWLhGXCHt0zlBii+p3zShAV6z1eJt0PBPI/JcfEIHWp6+L55Q5
	7LZ8p5J4nm9TaYPzIRrcp0tWddiB9zdmc1NzQKCrrLDvqI+/9fu85wGTZTHQUQqBbNqn642hTse
	qXtXuLdI85llhagd4B86Cf9P4Z1n6ooU1Eh/DGXSylqpd//kcbcE1aGMidoVIXiUmsO6wcWdT+Q
	bjUM=
X-Received: by 2002:a05:620a:254e:b0:7c5:9731:3c7b with SMTP id af79cd13be357-7c5eda64e74mr103975185a.36.1743010444963;
        Wed, 26 Mar 2025 10:34:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIW4iWtJXJZ4BR3cmnmQ77b7rUp5cXZSrlIpZZ7FtHJRSk3jk1K4yfBMbabN1sqPi7i+rOyw==
X-Received: by 2002:a05:620a:254e:b0:7c5:9731:3c7b with SMTP id af79cd13be357-7c5eda64e74mr103967885a.36.1743010444340;
        Wed, 26 Mar 2025 10:34:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad650826fsm1896825e87.167.2025.03.26.10.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 10:34:02 -0700 (PDT)
Date: Wed, 26 Mar 2025 19:34:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sa8775p: add QCrypto node
Message-ID: <tlwqz7qfdunrpsbjhk3kl3tz6zbkthv737pjvnphbz73zdqaph@7xcimtpeplbv>
References: <20250227180817.3386795-1-quic_yrangana@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227180817.3386795-1-quic_yrangana@quicinc.com>
X-Authority-Analysis: v=2.4 cv=cs+bk04i c=1 sm=1 tr=0 ts=67e43a8d cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=XIGxjvZd5PgJVFysyh4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 9Cl7kfaGP7xw3WGexHC8YSUSsl-wriQu
X-Proofpoint-ORIG-GUID: 9Cl7kfaGP7xw3WGexHC8YSUSsl-wriQu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_08,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 bulkscore=0 mlxlogscore=897 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260107

On Thu, Feb 27, 2025 at 11:38:16PM +0530, Yuvaraj Ranganathan wrote:
> The initial QCE node change is reverted by the following patch 
> https://lore.kernel.org/all/20250128115333.95021-1-krzysztof.kozlowski@linaro.org/
> because of the build warning,
> 
>   sa8775p-ride.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
>     ...
>     'qcom,sa8775p-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
> 
> Add the QCE node back that fix the warnings.
> 
> Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 23049cc58896..b0d77b109305 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -2418,6 +2418,18 @@ cryptobam: dma-controller@1dc4000 {
>  				 <&apps_smmu 0x481 0x00>;
>  		};
>  
> +		crypto: crypto@1dfa000 {
> +			compatible = "qcom,sa8775p-qce", "qcom,sm8150-qce", "qcom,qce";
> +			reg = <0x0 0x01dfa000 0x0 0x6000>;
> +			dmas = <&cryptobam 4>, <&cryptobam 5>;
> +			dma-names = "rx", "tx";
> +			iommus = <&apps_smmu 0x480 0x00>,
> +				 <&apps_smmu 0x481 0x00>;
> +			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE0 0
> +					 &mc_virt SLAVE_EBI1 0>;

QCOM_ICC_TAG_ALWAYS

> +			interconnect-names = "memory";
> +		};
> +
>  		stm: stm@4002000 {
>  			compatible = "arm,coresight-stm", "arm,primecell";
>  			reg = <0x0 0x4002000 0x0 0x1000>,
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

