Return-Path: <linux-arm-msm+bounces-58692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF60AABD58F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 12:52:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E5D33A77AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 10:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CCFD2701A1;
	Tue, 20 May 2025 10:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G2kGfE39"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928B226B0AD
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 10:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747738342; cv=none; b=sYH7d3Y0I2eNp1UyL3hV6xTqgT084g8R+lMoP4FE4sjl1n7en16oE9h+2oeMGXZac8xGHGd97zTLfIvVvc2fYR/lJN3vk7h15dPcj3Ri+LkrH8eRhTTygaRtliVz9xbERbu1ykpfzN+9VJvX32I18T0+3bjOXA8UrpAqXYWap4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747738342; c=relaxed/simple;
	bh=Oa9k0noCv5pfsZvbyv4j1AKu0STBRVDPhxiDXfVsT8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YsEDBzj6JCE7bLQO6bsdHM1H9z/8fkcupn8cwX7S+rJx59/oGeY2y8nZ2xoHAvoS/Hgz7H55v0uNH1QhM3Ho3dY8EvjHbr/5CGx6xTaKA0ChYKmgSc32gVafptDoUDM0JtSoUHbfLuJ/94FL7Q8o+Z6n2cpyg9rmfDI8ftrLFOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G2kGfE39; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K7nMKt005266
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 10:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iu6hQ3FOP9u9YuNt9OId1rpc
	oHm2k7ZRa3DQfZxPW7A=; b=G2kGfE39xHXtJo3JfPN9p5Gbsjy6vaDU78zvVggd
	AjNF77Cj64hMIZVcIkerHarinstxprWv0Up9BBc9pUu+TLfRGRs4PnUH8D1NvdDc
	VHu+S+9PzQoCoryGCTmWAgf/iT7AMy4iL91HZALsh3BcUoDbOGErbnnmFGFvptxB
	3B5wdgF8rxl76WznhcKzJKWhTFDVg7kNrMkT37VLPmDY9J2mBj2dbt9n5CODS6nm
	/C2V946jtTtjlSYNn8C8XR6WSYG1zZ6WDwODyiA3niI9heI6SdvSLLa8vX6AcstA
	d4xMglzrhiwYUmZYn7GX5+TZAF78n0Q4XYFZ0XD15gqeWQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4yh67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 10:52:19 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-4e145d6b458so3646687137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 03:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747738336; x=1748343136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iu6hQ3FOP9u9YuNt9OId1rpcoHm2k7ZRa3DQfZxPW7A=;
        b=feCnJ1enMt71AczrWvVgwEet/pApgGkOQjzpkLCyHgI3q/hHJqbAomamSlhHMrCBDW
         rAnpER6iodR4BWVcI8X6aqV+gentxjo/r95VlH98zz4yqOSgxL0uJrvUaVcXOwHNGDbH
         obV5yrCVFaH+hgFgnh8XmmcYfGFQKDcIcxo7/26R4Yhhd5uXkMiogy0btnLljWJRSEMj
         aA7BU6yAK0t3+zXT++Q+YhS1EBH99mwdyz0S09AEoB5NvlhHLSo1gAqqAUX1t9n7EQAI
         B9go64/DWwOSOrJ/ipzzXB/mpnwMjyMofjKkN4qhBKHL5iSbdh+W4ENNRZbagpIFUGWI
         owlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcqsz3FzvX4ZSXvXvYYlqZkPTR3+mzp0na22u0qcjl3uv/Migr5r0vXhCFNCBvcl2ESEpgMIF/8rtK2lFx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7y9jOONiwaWgKuL0+HY3f516+FQaFHHL6JpgKwDQNK87/NzXC
	39bJPOiunmdSx5ephBsfwPaQzv6Dqlw5rTppzYSTzfWD6cnAYNDRMdv3gSZJx7tUojhUxb4SNpO
	XP1kKe8PQIELDvDL2XFU83GdLsH2tdoMmETbnau+D8JrKiCfYYfOKZmAL5y9ks0QBWU+vhGU2JO
	bj
X-Gm-Gg: ASbGncsPu92489mzOPFOsVeCYrTA959joMAlFFVq1drN2AXA6kfxEFGIKwk4ESftFVR
	FAW7xzhxpFLydvuzc8MTpko6lQMLsXBY4p/r1rhh8u1xCA0AuEh/j+V+HU+wPxgBkBRLlaghM4k
	2CpG0Q6C48QQavqOhLkhLIDSMaSQ2WzkEzwOA8xxnyLpBxt7sN0kWruGJntGrR5YHEI1HimjmbJ
	ln7vyqhQntvvbVQPxNQeuQpSnB9vPzhcrlCGFy5IzGYSjltDJfzpgIHXtSkW5SM530OuBDJDwpa
	TzBulQ0QnyXBx+/M8MvQCVdbEM4vp5/i+hwNsiyoelyImT7oJ8Wb08nvTvTgQORttdSXjtCKx5A
	=
X-Received: by 2002:a05:6102:3c9d:b0:4de:ed21:480a with SMTP id ada2fe7eead31-4dfa6ca6a7amr15704301137.25.1747738336135;
        Tue, 20 May 2025 03:52:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKLSIG2Onln6gXMObDRG2o81ByYnYJZsZgsh86zfCf5MH9TVDxED5HmWvf5vBdtOWBgkCTTg==
X-Received: by 2002:a05:620a:44cf:b0:7c5:95e6:ce1d with SMTP id af79cd13be357-7cd4608ea23mr2402476385a.0.1747738324922;
        Tue, 20 May 2025 03:52:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f47csm2282736e87.237.2025.05.20.03.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 03:52:04 -0700 (PDT)
Date: Tue, 20 May 2025 13:52:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, bryan.odonoghue@linaro.org,
        todor.too@gmail.com, rfoss@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qcs615: Add support for camss
Message-ID: <gsj7aya7lr3quuw56n6p3utvz27qaqn5rxoihkvecsgfy4itu3@zoekpc7fyabs>
References: <20250520-qcs615-adp-air-camss-v1-0-ac25ca137d34@quicinc.com>
 <20250520-qcs615-adp-air-camss-v1-1-ac25ca137d34@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-qcs615-adp-air-camss-v1-1-ac25ca137d34@quicinc.com>
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682c5ee3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=Sj07yxY_p6yHqL6ZhSQA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: pmgmV2wcqM9zEtzkM_ZL5BJZity780Qv
X-Proofpoint-GUID: pmgmV2wcqM9zEtzkM_ZL5BJZity780Qv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA4OSBTYWx0ZWRfX0Pj8OgvcN/1L
 6brxf/6LHSulnhBoyfzvo3BjWQU/0x3rfTT0o8Q0IRz1Yy72gdi0tFw4q/F5EtjYbTpR3H4z0Ya
 CQIAlWEfw2t7Th3T4nBv1N/dGyDiVyxK1G65mNCQXjWGBwuKQ+Dmoy5yGah7z+stXcMNALHs+4H
 GmZZoOG1ztYwlp0B7c2Uwngddkx1/fUZjmtHYz+ICED8Is4K6aau3XLHaYDTaDc6A40Ytk9JQzn
 TWcFWrmdYOkfO2YlCXbbJpsMEB54z8wPzr0x0zC+Vq+AuTgFUQhRrDZuZAh0cNj9czjKmSfLeCx
 u4T8qjAxEdi5Bd86R7FE0FXG4YkrekiJhbB6cPRjeI8qJ3MZqCXxj80OK/sPZe0XX0cA2TVujof
 lp+WIg2D93KW3sqGhnfNpQh4VcM8fe0wQ0Gdt1kk8wAR9KRFE3qp2hH9VZy6nk0EK16bwFG+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=767 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200089

On Tue, May 20, 2025 at 04:56:51PM +0800, Wenmeng Liu wrote:
> Add support for the camera subsystem on the QCS615 Qualcomm SoC. This
> includes bringing up the CSIPHY, CSID, VFE/RDI interfaces.
> 
> QCS615 provides
> - 2 x VFE, 3 RDI per VFE
> - 1 x VFE Lite, 4 RDI per VFE
> - 2 x CSID
> - 1 x CSID Lite
> - 3 x CSI PHY
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 133 +++++++++++++++++++++++++++++++++++
>  1 file changed, 133 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index 47e350f175860e7b06f7b2c13fed75a65e489c8a..535251efc6b559447482b9ecc67ca26e7efbbb8c 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -3242,6 +3242,139 @@ videocc: clock-controller@ab00000 {
>                          #power-domain-cells = <1>;
>                  };
>  
> +		camss: camss@acb3000 {

camss: isp@acb3000 {}


-- 
With best wishes
Dmitry

