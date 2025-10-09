Return-Path: <linux-arm-msm+bounces-76564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D969CBC80D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 10:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C89874EBEB9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 08:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C024A267AF6;
	Thu,  9 Oct 2025 08:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j6qfo6vi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9F8BA4A
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 08:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759998635; cv=none; b=KTZSqjbjANrxmTw8kckwZ2ZQbgm+Dw7s86jKulXRUKJSJnsvHRs6U9VGTtvs/8aTS/cDvq1wntFoXsYyPv1EWRHGlSNlD4GJ8W8k8R1bhEFn1/r5PNR2GHpgXzYRgJgaxyyoD0kvxNPfZOL7YNfcAFylrUiaroMvgZqiBFhWl6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759998635; c=relaxed/simple;
	bh=Yik1lCD+6pysTAtwdHRwwvFfBNMr818rNdMLqahUX4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tGnbM8olcjV8y5w5jdpur9QUOIeqatfFOqRocJNyS/bv30t0AaR7vXkOYIS/2Mv+Kiu85fxqjORnd6PWnRdY35cMPmXWQipWJA/19jNmlsX6GQXKaTo+FQHKCnXuuRFU+/iu3nJpjMzKYRFqNFXWqbCll50qTt/9YA/ObHJt4wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j6qfo6vi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EX8b011045
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 08:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7HTgaT4ZswdTpx8zdvGpuveahmBL/mFIrkaXl3UDcPo=; b=j6qfo6viKW2KIP+Z
	91nAc1f1Tbqingi58MPXav6NVX262j0KkFyMcSryctzY8COqSJti8ml80odhdg1f
	BVSHKA8gZUqXR1tnsI3vM77Oz4L/FUhgxQMtByFQVUb4SZRBjpmLYXQp2Y3KGv3c
	FzZLOrb++esxWDmzJ3I7dFNS14DuICil83ouIRVV32DTi3HFl1UpI8aivzN7HHM5
	SzdN8ht+6cLBu1yU7ZByTZ4+6i/CKifgrYJmJZxQpv5NgytFMgb0NNz8b0PW7oov
	XImmKEv22dShRyyI+zmlwV9OPwYL+1kwfjj5D1xgi2CF1OdfwbdET95cglT5d+Xs
	sv9IZw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv9aa237-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 08:30:31 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-795ac54d6f8so2417236d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 01:30:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759998631; x=1760603431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7HTgaT4ZswdTpx8zdvGpuveahmBL/mFIrkaXl3UDcPo=;
        b=d3DtlalTmObuk0dbFdFlefj5zBz5BnWA9xQ+HfhiDN+m6RP8TwbhPWQ124L0ZnzhD4
         MKOQRopf/lElAeUSkCxtM1IjwasrML+v41ZRBVYIxT8Ye2jH+gBQMEv2TSPQKtHe0tMF
         MH0wG6L7uOxA3YvwxBn4QjrubYfb3T2AcweXilz92y3xBM5IsfwRRaEx867OnTIbrfu2
         C0c/E+UqOzi4236zaDWcX41T0Jc1t1sFJC9+TpzktUPWYz+m069/pjFu/ppenDKHSLMP
         7K1MbqCfkcs7x3c3eAvYEMbLWa7wWhTDYqvPYfZxAXCRzz6AweQ4/sUoM1fM6iMEQnCj
         fbyw==
X-Gm-Message-State: AOJu0YzLqwHss9oY3+hkQT/FlDHy8VqfotLVeDWMbL3w0rJxFMnN9Pjh
	OxVmGsCtP9nPPMa3VXF9ib0EJEGourrK+CFCU1Zob7866sQbONSUrU+kH3uwp2nkFwx6X7SCz1G
	SEm6MJ6F8EEyxS985/29Fcxhg6arNtvZmFYSoOn/gi2MnH0m/BT5J+qtRBuweDRDyFDE8
X-Gm-Gg: ASbGncvrf8xo+0sjLmuoZ5HPGvkmvlSAJTWmReoUbvwCmoHirLRmCU3aBVXv2uwN8n7
	sd/h9OQjhTjmSEd+crO5NNX4198WGiciLTLbAynucugwyo0t5ybV5hFO80SpCjU1HhD18371QQK
	iyqPh+YZnssugpdXXmo/WDvqUgJMees9A4zZT+DOp1wN7XwQIG6t3F8+DjvWC1qjXeJAzHH/rmJ
	iy9KOBcxfUmgm2G8iw+s/GPDgyX82qfRgbhcm/qxmjU+idWaZhxd8z0T4Gzb9ghplMbkbUz/+8D
	hdopwVsnxz8pL1IzxxTlk5IqV7s8emadBkyH9G7dT8YOTMSdcGAL1f48T3m/qFVKZz8nQl4renb
	exd4iyYTYUJjWHWXuqMUiVQJwT/g=
X-Received: by 2002:a05:6214:1044:b0:87b:b675:c079 with SMTP id 6a1803df08f44-87bb675c186mr12246736d6.3.1759998631004;
        Thu, 09 Oct 2025 01:30:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxlPJRCpbLQ6ivOfg2hVAFykebyx7Vvi70Xjr7c1nZL6mafrBDfwdqfN+PARl4iBAAaoCM1w==
X-Received: by 2002:a05:6214:1044:b0:87b:b675:c079 with SMTP id 6a1803df08f44-87bb675c186mr12246586d6.3.1759998630513;
        Thu, 09 Oct 2025 01:30:30 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f3cdbe65sm1852980a12.21.2025.10.09.01.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 01:30:30 -0700 (PDT)
Message-ID: <5b46bf0e-f91d-4b65-9365-059c33b54661@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 10:30:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/24] arm64: dts: qcom: glymur: Add display clock
 controller device
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-22-24b601bbecc0@oss.qualcomm.com>
 <3c886104-937f-4d2e-ade0-fd525d56dabc@oss.qualcomm.com>
 <a0a70337-6474-4568-9006-dda66371fe7e@oss.qualcomm.com>
 <8465759d-8d50-48c6-b5e9-26e08045304c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8465759d-8d50-48c6-b5e9-26e08045304c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMiBTYWx0ZWRfX+TQ/NmA8uHMs
 ZRlhbxz91dFhu5zY8C+wwgnmuyT4wAg83as/kyl56sdBCCiGmiz7qU4XlcpyYpZ+6HxWmf/kBvg
 EfxkxCWYVUb0K1yY6aRIPJurSfzwoH58YsoVou2Bk9Q3d//ItH3Z2+cX3chA6E7fB4ATbMm25QY
 C8Ifd/qtjKODhgLMkZXuDzuPc5wl16AjppM75oIH025ZJ12bV+8C19M5iDLbO7XQ06YTdmTcI3I
 mprECMFbHZAMEtDzAlt1OGK0vUig4mfejVZuZFxgpSYNjv+DEQO96vH6mVmu2WGGeOgEuGL7Gtg
 7MEnOABqGBHoa9/vSt+WusuNrEeNDdTgPm7jvXGq5qh2gV/FQEIJl9DTvlp0oAANgE2SHcJ+U/I
 IKmpAS1rNob9J3s2rX4EPJERYI8/Qw==
X-Proofpoint-GUID: 9xJim5JQtY3zf39B17C5_F6BMmtF3PKy
X-Proofpoint-ORIG-GUID: 9xJim5JQtY3zf39B17C5_F6BMmtF3PKy
X-Authority-Analysis: v=2.4 cv=JPk2csKb c=1 sm=1 tr=0 ts=68e772a7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=TbWexrlifh4ZZoSOPjcA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080122

On 10/9/25 7:12 AM, Taniya Das wrote:
> 
> 
> On 9/29/2025 9:24 AM, Taniya Das wrote:
>>
>>
>> On 9/25/2025 4:03 PM, Konrad Dybcio wrote:
>>> On 9/25/25 8:32 AM, Pankaj Patil wrote:
>>>> From: Taniya Das <taniya.das@oss.qualcomm.com>
>>>>
>>>> Support the display clock controller for GLYMUR SoC.
>>>>
>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> +		dispcc: clock-controller@af00000 {
>>>> +			compatible = "qcom,glymur-dispcc";
>>>> +			reg = <0 0x0af00000 0 0x20000>;
>>>> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
>>>> +				 <&sleep_clk>,
>>>> +				 <0>, /* dp0 */
>>>> +				 <0>,
>>>> +				 <0>, /* dp1 */
>>>> +				 <0>,
>>>> +				 <0>, /* dp2 */
>>>> +				 <0>,
>>>> +				 <0>, /* dp3 */
>>>> +				 <0>,
>>>> +				 <0>, /* dsi0 */
>>>> +				 <0>,
>>>> +				 <0>, /* dsi1 */
>>>> +				 <0>,
>>>> +				 <0>,
>>>> +				 <0>,
>>>> +				 <0>,
>>>> +				 <0>;
>>>> +			power-domains = <&rpmhpd RPMHPD_MMCX>;
>>>> +			required-opps = <&rpmhpd_opp_turbo>;
>>
>> The SVS level didn't work when Abel tried out. I will check with Abel again.
>>
> 
> Abel offline confirmed LOW SVS level worked for him and I will update
> the level to use "rpmhpd_opp_low_svs".

Thanks!

Konrad

