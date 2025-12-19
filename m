Return-Path: <linux-arm-msm+bounces-85896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C638CCD01AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 14:43:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 846B4302037C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 13:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E14A3246E8;
	Fri, 19 Dec 2025 13:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LTKRMoF6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jRKAbA4u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BBC322DBB
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 13:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766151831; cv=none; b=qaxYVEN1adX9nuzkWoL4jcs08juBDs3TqUMBNMUnNPETkwUD7xqe025aFV/9R84F+Uf/EtiknioAnCpUuV6XsWz3saUYzEDdaCoqTEFBvp6+pefIwcSAmJbVGztuQXQc+OBPTDbH2UeZnmhjz8bqWMbFBAmRfYU5vzcxv0F79Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766151831; c=relaxed/simple;
	bh=oFLsgKIg2EZaknsWgbNEO2r2tq8tmVeVCyF5A1Joi1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ETPWRB31iM/IPkTzxAhhY+mGzEqjKEf3fU3WUcxtS77plJ9a3rSUX7o6JYMI5pZ0/ka1IStyGQRJ+WKk97kkhMvK+UIMOmkPtkkRbfOM8bNB8rTXyEodegy6MrveLXesE/ru/8L0ibDc9THCgI3guafsu+wiusFhvf/s8ENXsOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LTKRMoF6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jRKAbA4u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBOlAu091844
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 13:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KQbe3hZ6e6uBs/ScF4jML/h6jE0P8lWUgWjLsEOE81E=; b=LTKRMoF690rPMXo5
	Wbiz+Y4c+uCwbpZJVQpz46VffmilPUtftSvmR6922+WbVtfbE4Mizkr1+OFsXj0O
	veZNrPikLKRyqbaAlmbwKlUe1GeLl7nCEW3uT5O6oK5g0YdEdJpX5Sik2RBZ3Ew0
	XLjCjEjDcmM9Yp3NwGaoLOrOTGG0W6sHugUerhbpLnZ/wTXEB+7uMixVMqV7P7/7
	9sA+LP6SPyZcPdLxmJ5+zkMV4UfhbJ03dJFiugxSaV5YoUVEn29HjoyK5RMIkL2A
	wcDS5A+k5e44inl70b0nmsCukGHyrOHUKAA1xLI4+OcB/bzkHOWhl8gnUxqlddAj
	j3rZ+w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2eatmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 13:43:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee07f794fcso4095261cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 05:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766151828; x=1766756628; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KQbe3hZ6e6uBs/ScF4jML/h6jE0P8lWUgWjLsEOE81E=;
        b=jRKAbA4uSys5yqT3okYWNBv0Qho3Ofdujp1+VBpqx6cVYi8jgnwWCk1Dsxqm8baquq
         IanX+P2vhtU89ElCxPkWaELk8CwUGRpbrb9YJtR6Wi20yl5Mc+0w+d/g3qrY0gnR7UaV
         9dR1/yl7GtexVOADV/igXESGTwYCSAHwA8W04rXH3FzmlEJVcQHyogxYgkNSOUvayID8
         EO/E7kW18HMjQfOD/3Arj/uaadSPZH+1EGzt2k259aoYSSnoUNgq4RaL4NK52Z9/F0xt
         0pUEycg7Scy6Z5Fa+qDs4pOAEGgmyfLpIXtuaPB3ftkP0s1lQgpvCiw9Ro6v/c0UKhEI
         nr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766151828; x=1766756628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KQbe3hZ6e6uBs/ScF4jML/h6jE0P8lWUgWjLsEOE81E=;
        b=N2Q4Ft0czZlIz7hvqrn0mwOx3V2Y3x659PjY2W+bVgl7AVUVlyV+9m7qrDMAyv2Ckc
         Tuy+LhEYhpi9Mt35ynUXbIPPRokkSOHb7yn0hoWHXPbXAEtZn/sQt4ujMx+UuOm1vNJt
         xLE6kdPQlojr7JH+c9AkNlwsZGjO5+MkIkmaXvBxxhQmutIcFRt7oHX17oWJnKet2YY8
         uXm+lJd7qVTe6lv3Hf/5ha2HiTTNzNPuiFjHQLcRp5QVupqpVk7W/uyk1N0n8RWb7AcX
         lHIJTJSpHCXMftfyDHRHjdNH5jf2/u15ALnfdevC/+fxJJbVN33kPP9+D/+XuVOUpCe6
         m3KQ==
X-Gm-Message-State: AOJu0YzFXzK4988DRQCPQElcF+VW4ZUbOo+KZWCV8lzR8ds2eYB6OCXC
	FkL21CxZxsh3+C6G23w2NaEFaIyDB+y6Gq7ZN0OFCSLW/tZ9Z+xnNyCubr1YkSG+w4ue59Z+jtg
	YzmKH7rXJ0iM7jriTM+sawzewtlY/cbvZrMpU/cX8OuDdO2oSDm7CRdqum4xs7y6caB9B
X-Gm-Gg: AY/fxX4QO3IW9Oymn/P92+eyVAJKv/I326+I8heFdkDzXzSqruV/iHf8Z4TbU4XrlvU
	Q/S9Cuccm19tC1KCdgVbnXCNbUSHXT5lCPcGEDiM92Wq/jXTdRJUI2+4K5oV6QsjQZv8Ir7iujN
	fTZqL071VW+Cs83VEGTi70ZEMqYP0NHrDtPmcfhGQAAS+dbuzda+i9xclkKr5vIf/Uyi+tyK9BI
	9TvAQR9w3NXqLUOaceV5yTW6orwIeJ4VdhpNS+FgoK+v4E4YpaVJvguqCDcZeAqXNNjoUrXTPCy
	6SQVfHc5QjwA9WRiS7l2III58NGYv2mQFKJT9MnGOoZ3/ojBP0fxHDraWkRCH3UG1y0Wvg0DJFE
	yRy6wZ1pZEDhOms+2jo5WDZ8uEk7oayvWSZmf88ByPMbLW82eX6wFTJy26TFWrUlv6Q==
X-Received: by 2002:a05:620a:3729:b0:8b2:f090:b165 with SMTP id af79cd13be357-8c08fd0ae72mr313421185a.4.1766151827709;
        Fri, 19 Dec 2025 05:43:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3ECtDaeC8gTe02D89fDp/cz2mg8FoUJmBWG9ord6vjwL8dUAutfAtgt13sLbsPLrNUF+wxA==
X-Received: by 2002:a05:620a:3729:b0:8b2:f090:b165 with SMTP id af79cd13be357-8c08fd0ae72mr313418885a.4.1766151827224;
        Fri, 19 Dec 2025 05:43:47 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91494dd3sm2191576a12.21.2025.12.19.05.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 05:43:46 -0800 (PST)
Message-ID: <b67ad9fd-872f-41da-8f97-34a8403f165a@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 14:43:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] arm64: dts: qcom: ipq9574: add wcss remoteproc nodes
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, krzk+dt@kernel.org,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <20251219043425.888585-4-mr.nuke.me@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219043425.888585-4-mr.nuke.me@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDExNCBTYWx0ZWRfX9JTDcJv4Oj8H
 rH7L+/VaKnWJPtb3dlhV00LyZPOQrj3dSrzWcaEfqqQekAxyO5cupetIejRGR08nJYBryn2qFct
 uoF7EJx+A7fBbEal+s3gj9vjsqxU1Nv4RqIVzRSJQ/jd+KO/9IubsU4QrEew/pQFs6QvHjE12UX
 yikoMoh0v2+6fGxgbLhyfzZIHyO5DF46hP/BLSLAe9ENWgk8d5Tcs43+nVMX/5Dyl5WPB1HtIRb
 ITLptmSF8LfXQoXy2zjhz9uGc7vplqAQ/oZ4wUAEgcFhNsje+L/cOKmsKO8pfh3rSHstxNE7WfE
 OrdmwDhTbdRL5ZZb2zfnN9kr4DvHyZOYGECDf10HuaxED6l6PgngiCPlT6u8Ii76RlGeoSKBUUB
 n8GaHimc6blC3aTM5XOAq/rwBjgsdlgrvgmn1pE+XetK8pMiyCpMzNEL7wl6p3+2Dw8NZqKFNAQ
 iYSDNkLo+ePpNh1/E+Q==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=69455694 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=a8igmC5W8dcvx-CyMYMA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 06ypjN6dgd2bkGeOPxG7yuhYkx9ugCQW
X-Proofpoint-GUID: 06ypjN6dgd2bkGeOPxG7yuhYkx9ugCQW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_04,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190114

On 12/19/25 5:34 AM, Alexandru Gagniuc wrote:
> The WCSS remoteproc is typically used by ath11k to load wifi firmware
> to the Hexagon q6 procesor. Add the nodes required to bring up this
> processor.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---

[...]

> +		q6v5_wcss: remoteproc@cd00000 {
> +			compatible = "qcom,ipq9574-wcss-pil";
> +			reg = <0x0cd00000 0x4040>,
> +			      <0x004ab000 0x20>;
> +			reg-names = "qdsp6",
> +				    "rmb";

Hmm.. this "rmb" region is really:

0x0 PS_HOLD (write here to reset the chip, if the TZ lets you..)
..
0x8 SSCAON_CONFIG (essentially a syscon which you write to from your driver)
0xc SSCAON_STATUS (same)

But we've been describing things this way for years.. I don't know if it's
worth changing, especially since the rproc driver really assumes this to
be the case

Konrad

