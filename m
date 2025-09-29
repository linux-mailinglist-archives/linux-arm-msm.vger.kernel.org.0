Return-Path: <linux-arm-msm+bounces-75447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F50BA7E1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 05:54:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F3EC3C2673
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 03:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A628211499;
	Mon, 29 Sep 2025 03:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QRYZC0dV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1271DE881
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 03:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759118074; cv=none; b=kFaivFNIbvXIAu6x4AT1rD4rIbIdUdfTYHURARsrwrvl+zUyPqZWk+SsgOkMJljHwqnlWlio8MIK8AkjoX8jbZPO9lmje34AMLL99uGbLI/AU68QacYh62TqEOKICUYlHW/tnQRNwm10ywgxzjnKAaApnSehsMBlpQ4GDMtaR7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759118074; c=relaxed/simple;
	bh=ZgxPc7jFvUfo8e5NtggRb7C8nqmi6ZL8Hl0RkT2XVZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hclgwlzul+8j1C/8nrGEeuRUpSXxSnmye9JqweFAoVyxtYB9tjpw4Kvi+YyBoISws0K7sKNJJ8lAwi+NKC+sHLl/VuMKuY5ZoEtTgBCJkCDLgvct1G/Yy0+otjMN4XxaIavTRhCdjmLi6BeRaUq5Vl7KU0Ut6RU99qgM8hVENzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QRYZC0dV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SNF2Am012767
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 03:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4greNtdLmdKbk4oGv4Sp7lDz5yvjNosCueZfHE8CDt0=; b=QRYZC0dVYJPuoLpC
	3oHa2TjGFh3mFhhxs8ugjyBxXLp8EaSudWfSwtKWPYcW2JPXodh4pgr2UPeaMSGe
	hx5V8jzyGC3p/gabZbYyhyAAcXJqW97vkPJu5aJ6r5cTVq9E2Fbw4ex8lsAqCpyr
	1UTUz5wiXJjnOkK9Sro4fEYd5Ov/7eg/xeKBbNFt+SP1M7ksikWrGOflxBpNkQ9Y
	xYc+B5DohC5b2oEYRsUeTvxwlR+lEbDjUPdhTAndle7LIqSCv7gW1zf4IpAxsyuz
	T/XmCGdjx4lNS6ZOYzvOLnwktlyQdqGSYYD4iOaVsya/3+YDcA4f2su8SFy9Gscj
	jN3R4A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e977kjwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 03:54:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77b73bddbdcso3521933b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 20:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759118072; x=1759722872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4greNtdLmdKbk4oGv4Sp7lDz5yvjNosCueZfHE8CDt0=;
        b=UtNnIcfMJZEtClzIcJsP0LdA/WM/jsxsM6Rtjpoj+3pYwnAm1C1grRC2smc7N+jauO
         tg2B2V72IHLOiXE+Dyku+AP20ZpT8JwYjTNszmALecbtd0dXRrN/kSFBQ2z3MfoFBFWr
         T+dpVLSWTiyNdQWbz8AVkHIMcUo2M/fi8KSmzaYq21FYjCjzBz1pXULhbKooQX6O71mm
         iHk95hbHN6ED8LCrBqK2ltrWUDCpN9WYe4ZOy/e8nQB6Jppc1/PkFFTnylyiaKAK1BEG
         I3nUCRHLtXoy+ZAGa1rtqKjQqILeAD/P/7ktdsSBAmWCMSIPLdmpheOqPYp6Fpbl+93B
         R58Q==
X-Gm-Message-State: AOJu0YwgCs77rOMVZi7T2oWE9oAp+kp+MlJHqmRbkqxxZDd/MEOtTR4X
	ZMEAEEZQVMryK5PiuM1lwoaTcw/CuVATYEsLscVKgov5P+UxrLVySABA3hPFHAfEqfgMgvLMRAA
	P12W0u84x61Qx3h/Ad2TdBrdeVLkF7cb4vd0rrFSGox+IyEK7xB7ildPLg60IAvMNpPpp
X-Gm-Gg: ASbGnctsWXVNCdCFi6zVmPFE4jRdxEPJqDwbHaINjgj0VsuZrc2jlj6L8Lsb5EoaEle
	9IRp2aBxTsotw8gB1GIqZqUKVZwD+oCC6jk5iry7aKL6U6UlJgX4p2ep+4yTtnunTMNGXKCEd4i
	fgExq4jQ6W1JU/qWRYvn/K9jf7PHdGAMa9MhVGQkK2ZW7wna928wFmtIXtLMXWfxEg3H+awG2PQ
	DZeYFrpHsnbVRVJj+eBIRLLoC2kC4bfMx/nBxlumfDEtKQWzvzo1c47aIvDvsctFLmzKy68/kvD
	SqLwpqPvvEo9n8AxJ9BSAFZfZ7oIUwkDXGn1RilqUV1A4+v7rNfjCWY/Mh3CHevxwNo=
X-Received: by 2002:a05:6a00:2395:b0:772:397b:b270 with SMTP id d2e1a72fcca58-78100fcf632mr13590994b3a.10.1759118071853;
        Sun, 28 Sep 2025 20:54:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2r20Nsx0mZ0boHn8hMxT8AW4ANlluUVZDARoW/YbMmCXP9ImTSzIHu1YYxNmhr//RZpnyzw==
X-Received: by 2002:a05:6a00:2395:b0:772:397b:b270 with SMTP id d2e1a72fcca58-78100fcf632mr13590974b3a.10.1759118071380;
        Sun, 28 Sep 2025 20:54:31 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.31.98])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c279f8sm9954388b3a.98.2025.09.28.20.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 20:54:31 -0700 (PDT)
Message-ID: <a0a70337-6474-4568-9006-dda66371fe7e@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 09:24:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/24] arm64: dts: qcom: glymur: Add display clock
 controller device
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <3c886104-937f-4d2e-ade0-fd525d56dabc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _eNhdokoX4SsCvMqZNKD8Ey57CPYs27e
X-Proofpoint-ORIG-GUID: _eNhdokoX4SsCvMqZNKD8Ey57CPYs27e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfXzffgplSUOdQn
 qO6u+4o+KMMSBeRKRtSf3oj/rJFQaQ1Ut60V+ni+pbsgS43mmD8p9xoAjZ79tprGfcf5NFWrLlz
 6l550nVZ2T4ktltimyk6iBa9/zpa79wCGNFz53o9xJ6Mztv71IfKdcfgnqMtSi28o+9uZNBuhol
 oBS8p6sIHX7TJ1IgOE7963Rdg6JGVklyCnTHsp9MpwxSzxpLk/CmxvnFqhpfQ1QSau1gU4LP3CJ
 rRwYk+6DCMW5/oVZFkJW3NTyciZ0navXykFQgG/rbelJj+94wnnSB2uePcOJuGiIbaqXOrfxoep
 CeJ+zNVuSKhsmSHK+2/f6roSI4fBYXa44sMDjwvnwM7q6LFGjjSlOEW5SYw+/TtxS2JGCObc5/E
 Ousz6AmRTocg33GxzljnK+I3qC/Naw==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68da02f8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=YGGbjFxyX1jBzPa45jwK0A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=kGSp5kWzczO3mCTFYtUA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_01,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043



On 9/25/2025 4:03 PM, Konrad Dybcio wrote:
> On 9/25/25 8:32 AM, Pankaj Patil wrote:
>> From: Taniya Das <taniya.das@oss.qualcomm.com>
>>
>> Support the display clock controller for GLYMUR SoC.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		dispcc: clock-controller@af00000 {
>> +			compatible = "qcom,glymur-dispcc";
>> +			reg = <0 0x0af00000 0 0x20000>;
>> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
>> +				 <&sleep_clk>,
>> +				 <0>, /* dp0 */
>> +				 <0>,
>> +				 <0>, /* dp1 */
>> +				 <0>,
>> +				 <0>, /* dp2 */
>> +				 <0>,
>> +				 <0>, /* dp3 */
>> +				 <0>,
>> +				 <0>, /* dsi0 */
>> +				 <0>,
>> +				 <0>, /* dsi1 */
>> +				 <0>,
>> +				 <0>,
>> +				 <0>,
>> +				 <0>,
>> +				 <0>;
>> +			power-domains = <&rpmhpd RPMHPD_MMCX>;
>> +			required-opps = <&rpmhpd_opp_turbo>;

The SVS level didn't work when Abel tried out. I will check with Abel again.

> 
> Really odd!
> 
> Konrad

-- 
Thanks,
Taniya Das


