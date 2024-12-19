Return-Path: <linux-arm-msm+bounces-42860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B279F8714
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 22:35:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF4E616F331
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 21:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 892F21B9835;
	Thu, 19 Dec 2024 21:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="StYEXxLF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34CD1B6CF1
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 21:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734644095; cv=none; b=OlZqTVpmOQEi5boWBKD5fbkBvlEf+Z5hVb7KaXVUYeATNkvNXgN7S90jnRcZeJQhgR5DbNHXaA19fti1VsPBs+OA6gqL42f0iDG/6HqQbJ1Cm3jhjp05C9x5n07xEuCSmBDtNQqM3Vj5tXxrKfNbd16chZ9V2QpwjLBNXUhyFZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734644095; c=relaxed/simple;
	bh=EDwfbnFQhamTwYpt13p2WAt2bfbKSJIxLOy57KvYyn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K8ksqBYO97uNL/0L+4B8+IUM9beqRaqQgZ3VY3stNhwyiZ1pSYSemsHLqQehObCRnnvSl3aIMfTD9NXgIqd6pUJBSnqiaQQO2pUU0G5ZrpZDtDHCHd1tevmuu+NXCcCfeiLOmtzSsG93/L0prELb4kpOHHhM7baJ1g4lMXlRZEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=StYEXxLF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJL0eoN017209
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 21:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tnnxDdh3Ddg+joVXVofvYsyNFGq/oIrBrCCuqTFAbSA=; b=StYEXxLFeccHNWFy
	y5+0OMtPgPNPInYzVqSdUq62t7Cg1MQwNDlTsihdmh9OVmxukCtyrNyTQpl7uRcX
	ofu64Sbyh5Eka7Rixcsevc8RGjrVGQ5r7zhxz9ocf40WPNof+JoDwj14y5MLww/7
	xG3U4/uHnGcUrhWYzfaLxojEZht77NcvROjaETObLQTnH5jIMXvmuwZEdHkqSI0k
	w9ujDZzOQQ2c1XVHIq6lRscI4vtwwEe7uCgNekXf7l+EUqrovO/3OIv9UTceTJsY
	RxP+L7JNhE2KOqN86mq6sBGFAz7o+c9VSq3uf15OURiP9PXxDG3xbVGndo6O27H0
	znAnPA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mu1dg37h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 21:34:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4679fb949e8so3006051cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 13:34:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734644092; x=1735248892;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tnnxDdh3Ddg+joVXVofvYsyNFGq/oIrBrCCuqTFAbSA=;
        b=SCVCnvt1ck3lp22aDb4YLFu0q8nmi7LHgzZH+kWStvUnGqSCu7nRB+ohT69fQPCKLe
         dkskqHxQI6+lcKHcqq22TQ3Pw65LUAqLgRa80mPglO/4Ufsdtmrd9eHUOvCQPHT31pQX
         HnoB/+sjRRxGfUdS475hLNQ+6L71wNwRughr2pf7tb+uwFQUMek8lZ3vYdztOhd6rJCl
         pfpXe/4Hrbi6bhFnxq1QnmQSixpL0ltD7vqQcaIKchP1JT6yTSoaSYhHsQx9JzN09bW/
         aNPY5P1WgNuKM2QWDBKZdaKqS8qYjykXx0jebNZqqYuCILirHaMWOf/PKasZ2+RXOeX3
         BsYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPr2IL3jIiDC0pEwqyU4ACXEdUj13wsIyZ1r6W5PInLJNivsY4DQvTGhs8rQQWKJ8V2CujfvbVVUZB2gq7@vger.kernel.org
X-Gm-Message-State: AOJu0YyQg8zjEoEZ5UHObNrtsvI2mYqZzOMiMkOeUCfx8KuRM2k9+knQ
	JBZjw2MQW+fQvTBXJ8ABe3e9L2KEXVJhutkoV5cfp+RVuF8ekN4UtsjBBYOd+b8wMZQtpaOsbOR
	NtepRFiVx2wyNlZuPuw6o6d2W5oLgn89zFTwktbh3gaoBV5x4D/4nmi2MRoVdQ2KY
X-Gm-Gg: ASbGncvYfwRM4WEZ4u0KjCnggCArTrTegfZrni/HtA/u+RC65Dw+C36JoWJgX5erkKJ
	2uWRdrrK3rAt1QCLPrloUVlF53QqqeSN/xEIZ9DkwJSGZmS92ZkDHKSPqE4rvnXW9O7onaQJKLU
	YprY5Z7DlIv9TROIWdFUBDpPsNxHfTrpEfpAr9PbEtmFJ318dLSZtevN1kUIb1Vdq8UH+v8APb3
	3C2MUsTJI38otTkDEc2LcJD3ZdYow5CeDG4D5JGHyizMpGmp3+b9MxA868jdpI5YPZ3Op6wCBtS
	rinMzREAp/fLz7RP/qk/BfnoLEe6ogEzpw4=
X-Received: by 2002:a05:622a:391:b0:467:6bbf:c1ab with SMTP id d75a77b69052e-46a4a8b605amr3437961cf.3.1734644091797;
        Thu, 19 Dec 2024 13:34:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVjawbA10Ym60gE7irfkFrd/QhB0O9kTyh4GjAE2jzgSGUi1LyX7S4W/jTHrm9J8Pl6KGrUA==
X-Received: by 2002:a05:622a:391:b0:467:6bbf:c1ab with SMTP id d75a77b69052e-46a4a8b605amr3437771cf.3.1734644091398;
        Thu, 19 Dec 2024 13:34:51 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80675a6ddsm1006047a12.3.2024.12.19.13.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 13:34:50 -0800 (PST)
Message-ID: <a33c3da8-0f38-4194-9eb5-249cf6848928@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 22:34:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: ipq5332-rdp441: Enable PCIe phys
 and controllers
To: Varadarajan Narayanan <quic_varada@quicinc.com>, bhelgaas@google.com,
        lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        vkoul@kernel.org, kishon@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, p.zabel@pengutronix.de,
        quic_nsekar@quicinc.com, dmitry.baryshkov@linaro.org,
        quic_srichara@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: Praveenkumar I <quic_ipkumar@quicinc.com>
References: <20241217100359.4017214-1-quic_varada@quicinc.com>
 <20241217100359.4017214-6-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241217100359.4017214-6-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KKd6-SGpMH7gJeMuB8zZeERI0_ozZbXK
X-Proofpoint-GUID: KKd6-SGpMH7gJeMuB8zZeERI0_ozZbXK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=989
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190171

On 17.12.2024 11:03 AM, Varadarajan Narayanan wrote:
> From: Praveenkumar I <quic_ipkumar@quicinc.com>
> 
> Enable the PCIe controller and PHY nodes for RDP 441.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v3: Reorder nodes alphabetically
>     Fix commit subject
> ---
>  arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts | 74 +++++++++++++++++++++
>  1 file changed, 74 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts b/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
> index 846413817e9a..2be23827b481 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
> @@ -32,6 +32,32 @@ &sdhc {
>  	status = "okay";
>  };
>  
> +&pcie0_phy {
> +	status = "okay";
> +};
> +
> +&pcie0 {

Node names with suffixes sort below node names without suffixes

Python's PartialEq for strings works well for determining this

>>> 'pcie0_phy' < 'pcie0'
False

>>> 'a' < 'b'
True

> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie0_default>;

Please follow this order:

property-n
property-names

> +
> +	perst-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
> +	status = "okay";

And keep a newline before status

Konrad

