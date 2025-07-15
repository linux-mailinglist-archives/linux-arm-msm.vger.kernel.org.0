Return-Path: <linux-arm-msm+bounces-65016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C8DB05784
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 12:09:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29505560486
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 10:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FBDC2D29BF;
	Tue, 15 Jul 2025 10:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tzh9VO3/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9BB22DFB5
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 10:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752574191; cv=none; b=s5YSMhqLgfW2X73B6UrY/6EXlrtHnPHlAGjubuSo/u0JYYwMDFHQnrPz2snrqtGclGM0n9gc8ifBf3I7z7nws7JtwmnKX9emwtJz3KYNRQyI914uMkEz1GSkwqWxubd+83GHSK8KSrpzB+y1EwZ6RnVBt67GQoUVGZOMXbHzUmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752574191; c=relaxed/simple;
	bh=i+gH7R0LZRVIIIuYrUj5ZHZ2SixenD8ZXHuSoR9aPY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HMH9uiwigTuu+I0HuW0h1nT4O3voBe4KB3gnMrfHN5g+YcsvJo/xI0MCA4psDk+hGs635xVS5eF94KOUdfU5X5MM8pmo99MYVeZ0C8P8Ff6S5gH1h6khvOZqX8AgVaGTnJn4l0jO5yoskRg/AxFUFpoNYfJ/3Kbp46VtYOgMS9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tzh9VO3/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F5x7ib017991
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 10:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p/9yPeCO/DS01G52hKx0pmh8Iyn7M6trOa1KExfG4Fg=; b=Tzh9VO3/UhkfHXiL
	gRXOgUowcGJmhRtEl3SS/6PqtsHwzKmxonGt/FvvYtHL3SVaz5HHePbWOs5OnfIm
	8TBvU4VyqJOb6v//P0V4Ruk0qqP1j91JUrTdfGWgDpmssohpb44PP/4fTBo/2l1h
	wF5kMuLThOH/gUmVm0ZXfncX1eXO2aY6g/MW4tz8eQQQH2T5ecluEU/L2clwSYoo
	7IK3uekaQ7htGH4dthfoo79zMeCQ/5I7uNJ8/N0o8/wZ6aksF5fJXfqHRChVASbX
	tgKf2+tHQX9Txuc93PkCITZRtpwefATgUob6WQl1KYVZmQz9lMYtt5bxm8478wfp
	VOX/sQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufut7p2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 10:09:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e0003c5851so27892285a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 03:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752574188; x=1753178988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p/9yPeCO/DS01G52hKx0pmh8Iyn7M6trOa1KExfG4Fg=;
        b=RWbFS9eLu7iXP9+vx6UEe9XBVusth15KktxLW10/jGOXInqx4RmF+CZ7WqDmKyuoi9
         PPOHZU7TpUAfDjG7EACn11CwgsqdEMhnlhzpY/wfDjDv2GILbTFUsV240g6cBzxaQe+Y
         dzEdZ2b0t8w0axGKs6dUXchsbjy6jhAVidY2tN7/Q+GF300FaQW2rvSOp7gyoawUFHOr
         sxPudCIMnwBqW0zSRTMBxROUSkEQRzgYzMf3O/gKHX+FlFxzvQ4H4fvgN6ezlPYpqVHx
         hwhZpGIvZ0gGw7qmD0JX+NRcEjfPhp58E74CHNm7WhA/kr3Yw2da5qwtUazZsJC/V6aj
         +rbQ==
X-Gm-Message-State: AOJu0Yy36E7D9PDOdE9UWE1M+wM//thoLzGPyYttqLmWmUuHXNlZbc0r
	2/bpfHs9KXcE7cZhcC5wMxM/udLf8ts0cKCYpT8LZ2r9PLb63Z9hKT1VVQ9v6hEmkmMh6B4W9gd
	lunUiXxzwhmK7us9B/l9gPyCQ1VRl0XtllN4tQmxK/J9wQ7vCjUwbuvddt/nvLyZAIsUt
X-Gm-Gg: ASbGnctveLIxnBf6T5Qrxagsr3lD6tgLpwF/+UcntZg7FFJqdIjmDUUqOPhGRgW2hdA
	ie7vdBaJSG1bOd1GKYjVCj5CJJN4h8OwyXjTUjmhggvjN/RwNwRHPcT7d0/BTJYRN+aHrRqyonj
	x++3ILzcE352go4wWkUNT6Ft3n4P1VznHHNSE6VosLCOwdOmsSHrJEEmKFpaeXmqQon4gUbhqjM
	XIztlUgN475mSeNa1cBlltJZza5Qe5+42FiSFSkIjmLbPJxNYEBaWzRrq3baAil+c0irKUrqoIy
	2gEOvDe2y4mOVCvEnNogCNIRRC2ER2HJ9okJJFhzISGUiazwXNtyYWTs/tdP8pOGQSTRqbRhtdY
	utnfs/6eb13i53fuaxIjK
X-Received: by 2002:a05:620a:294a:b0:7d5:c29a:b41d with SMTP id af79cd13be357-7e33c732767mr48852585a.6.1752574187608;
        Tue, 15 Jul 2025 03:09:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEucUXdsrXGUZIWwqatrgphc74gzCF2olPTtlwfbIxpe9espEQV4QYSpJZP78hbow6C50+e0A==
X-Received: by 2002:a05:620a:294a:b0:7d5:c29a:b41d with SMTP id af79cd13be357-7e33c732767mr48850285a.6.1752574187039;
        Tue, 15 Jul 2025 03:09:47 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c94f2bcdsm7032397a12.4.2025.07.15.03.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 03:09:46 -0700 (PDT)
Message-ID: <b5a68138-4eca-4bdd-8f72-d80236b02c0a@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 12:09:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: sm8750: Add Iris VPU v3.5
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250714-b4-sm8750-iris-dts-v1-0-93629b246d2e@linaro.org>
 <20250714-b4-sm8750-iris-dts-v1-1-93629b246d2e@linaro.org>
 <5dd36649-821c-450e-bdcc-871735d10059@linaro.org>
 <15b8b9e0-a211-4102-9b68-994c8ab50a7a@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <15b8b9e0-a211-4102-9b68-994c8ab50a7a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e7gGSbp/ c=1 sm=1 tr=0 ts=687628ec cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=DXF70n8Wv7XxJ0iPIvEA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: frWr7AHYvHi-zDt9XZa8Id_4l8REw8UU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA5MSBTYWx0ZWRfX05UVo9lYBkDy
 GESdDJ9wgJ1nr+6viSLgH+2J7z88fkKxuR0UjKm95ZHA1Izw2MHkOQzpofoqd7Vh9GinZBbPXgG
 qu7I+zOapE/LGsBcPdVcM/B8NyUMeC6qgPgizg8TfwNEQ/SVD0P2wvNGYi6+dtp8pljjvcqoGhc
 jQ0Sdtk1l6VKUmx031ceeiPCqaxgHuojLhOOfPCFiLNyXfPis7j0CMspL0FxTWwLKc+aofOokgH
 BGpoUVEPmsZMz46rRzWYh1g39ShYYLwkebsPMbDPLtsGjySnXnfedF2TJu8JOje7X/oc6do4hEr
 H/dESIHHNTpS0qmlKlVZWvAnIjuQusUbBcjGUlN5IYlCuOOc4j4R6MNkT0IDlVzid8ek2dbFrRR
 nyQmwm6LO7O/dOU6m8sQiFzFKlkVh5FP7qo8NcqH9Fu/JLk2hCIDy/YYeEo2JRn/MRZ3yJ9m
X-Proofpoint-ORIG-GUID: frWr7AHYvHi-zDt9XZa8Id_4l8REw8UU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=767 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150091

On 7/15/25 12:07 PM, Krzysztof Kozlowski wrote:
> On 15/07/2025 11:32, Krzysztof Kozlowski wrote:
>> On 14/07/2025 15:55, Krzysztof Kozlowski wrote:
>>> +
>>> +		videocc: clock-controller@aaf0000 {
>>> +			compatible = "qcom,sm8750-videocc";
>>> +			reg = <0x0 0x0aaf0000 0x0 0x10000>;
>>> +			clocks = <&bi_tcxo_div2>,
>>> +				 <&gcc GCC_VIDEO_AHB_CLK>;
>>> +			power-domains = <&rpmhpd RPMHPD_MMCX>;
>>
>> This is incomplete, need second power domain and I did not check against
>> qcom,sm8750-videocc schema before sending. I will send a v2 a bit later
>> (maybe some reviews pop up).
> 
> Heh, no. The DTS here is correct. The videocc bindings are not correct
> (and that's not my patch).

Well, you want two power domains here in either case..

Konrad

