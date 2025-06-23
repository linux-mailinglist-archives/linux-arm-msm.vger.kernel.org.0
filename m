Return-Path: <linux-arm-msm+bounces-62023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87478AE3B9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 12:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15D107A8AA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 10:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D9F23ABA8;
	Mon, 23 Jun 2025 10:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="idEa+NPg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A471323A9B0
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750672879; cv=none; b=hPwL1RUHN32RMtsyXN8odHhgvcMR6+OJLk943slSLo8gJlosJh/Z0yF9m+8zKJzVn6OX430wQd0BnPfNcTIpwOhHl/O8ZWNFZD4LHy438qrktNPsKevvDAw/A8jZFp5OicxZEdaCSJC/uJYG3qbakLFOdypL6ULUalEdoKPg2BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750672879; c=relaxed/simple;
	bh=hEzR9f/pVzdnR2q2Os57Kxsn5Q7ojiITh9etL1uva70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fMdYUB91oLsQF/Kc08Oz9PziBh++qVFEZRlCXgxCQvIE+oUnUn6M3FRflg6XGiwRg4O4jqB5zb4NnHPBgA0DBKkZOqTkAlv3RE8wN1R/tvp1xRtQPuck4y3FYZfNUu+jXM9Om266ubx29+mW3+bqyn3iz6xJWhrRH9Lj/a0UnTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=idEa+NPg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9delE014609
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dmI4axmiuDRIOEMjY4CzWX76Iufc77l66VOjnoaKHVY=; b=idEa+NPgqx09x+m+
	cNjBPTuW5rQDkrBctBYo3ir0rnZ7yzd5RAq6uk2PGlx2K/ZKReaLtFCc62OirhQm
	q3uX8T+Pp0g0fdh04rKHDC3scyO1eRtOs3LJsgZvIVRgoCx+z0bRlQad6n0k92SM
	SD97gQAseLfFavE7ajvZhsXDpWMERYc5HLaw+ucGvRa7WzwNDhYdo2Vv6GIDG9Es
	p4qoHaafYWvo62kQj4RDwxSYJ0Do+ktzllnWDSoo+1WO0ybH+GUfL5EbwMW4Nmjh
	CZgbZtBW8QOVPCkwFVta3IroxGKlLaa1555KcOTA5qj2SLzNy1jFsV/DQgFI3YoK
	Xj304w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5hasb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:01:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3ea727700so65098985a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 03:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750672875; x=1751277675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dmI4axmiuDRIOEMjY4CzWX76Iufc77l66VOjnoaKHVY=;
        b=U/Lqum5iwH0xcXPiVjJ+V4ETv/Wr7V+9MoBLn73yQsG5Kiglk6RIk33TRJQyFUHw3z
         G+vV9qdNf5m3H+JZCp/Poi9vOz+GRlh+yP5l945SfMB40jgURAnoldKkFsg4m9aCwgGg
         GSCCY2WgyAVJ2S3JV1+HdDW3QSvzSLrzjJdUFI0Ayhch3H1D1eItA6R4JFU9oJfuR2sO
         nnmdHL1pxF0ldmPd9FdYIHCIX2MMjGDcbdoeN3uwgqfli+rrknWgj5V6KZ7g8MSYq8k7
         fECW7GUOBfvtll4PfaIkpV6jUN1pIF2QEkO8655D/z8nkgtsl0hmzpZOEvS2lkJtbvQ6
         mZ8w==
X-Forwarded-Encrypted: i=1; AJvYcCV9Ayg0Wcl9uVO6oGg1ZlJpOewEzHk/+X+lnwCiqnNaax034JvZ8t2E0LZvlSEq45PTHN5ELqNp+2H+Bj9W@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh8PBvGibo3RyfTaWM20IpJXdW5Ha5b1201MPnYYu7R4n1We3i
	zUQx13VZwvFket0LcPI51gP3j5OIDXn7mn+PsMv2UKi0v1pouHlo0uOdD7zfn3pdD+lLfQZKes8
	kJCSt0kqgIgWTNfPkJIKOS3a/mWdY1ENwsSYBlMRv88wj1sPgl9r5oFn0dHme6quDsOpI
X-Gm-Gg: ASbGnct8osxnFF9TGKePzeTfZhWQtLmtX7f2viaY+vTkQpw6Wf65MwVvNOJvDpZEAJ+
	0ir4Q4NvHm4g+8IlTwaPKqm0PMKjHmU5O+W9QflodDnq3dyM3PyQodGf8BxnF3s2YUMnKAlMlXu
	Kr0ylpYBPQXbtAQCAhRG2EVjEHscCmkamhXIYHemY3i0CLuY8LOgMtQ7AJQS5iPMlGsQBU34QtK
	vpjqvZ6d380iQqHxcR64CASjUdrVsDOYKzEJjiSvZYGHBfCuCLtOzE+hFGDupytGho+3hWUkkLu
	njHJhX2GGQ5B1oPPJ+bSb/7G3dBO/Nzvj5YXAp6Ri/nNuUHBqpPbUYuyssNIUDI7xCG9aAJYRdj
	B0Pc=
X-Received: by 2002:a05:620a:26aa:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7d3f98e252fmr557149585a.6.1750672875167;
        Mon, 23 Jun 2025 03:01:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFd0DfyOKsfHiqaekfIPWUjRqgIfAWTnyptuHPnWpwgrdGU6UXcEE9cVKR04xkNRWtBD8aFqQ==
X-Received: by 2002:a05:620a:26aa:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7d3f98e252fmr557147385a.6.1750672874595;
        Mon, 23 Jun 2025 03:01:14 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18cbd8easm5770386a12.67.2025.06.23.03.01.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 03:01:13 -0700 (PDT)
Message-ID: <cf1c9d32-9034-4d22-8be6-2abacb3ece56@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 12:01:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8180x: Add video clock controller
 node
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250623-sc8180x-videocc-dt-v1-1-9d210c140600@quicinc.com>
 <7c55acd5-6d30-42a3-aec6-2d7aa2a640b0@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7c55acd5-6d30-42a3-aec6-2d7aa2a640b0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GcqhAo6xfgcOeVtpTy4IWxPhf1SUo-FT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA1OSBTYWx0ZWRfX4hkmOD/6LtMu
 cY4C/9BdZ5R9HIA8zQem93TGdpy4LAI6h0NbhRwenF5RGgwNf6XDzkCETe3bFnffG5sA0ha6ee9
 1ky8ON3f8MRjhFiZUw/1L+Hv0LqsG3uhf65l+hYQVVF0JAgI+I1mJt4NXeYtNHFgWU4PBn6wMnE
 3w6/PHqjGe/MGLsKSlABXN+t2V//JhjvV/Be0I0+SKuAEUCouf/26cyYVbtEOtX8oKoO7PCe8Gq
 sxG8gJWFcehRaMZYsHp7bkDHoyo1O6R/PwpagjT0TChNYdK6J93xgJ3lQATusIX2RUPyMNucUoG
 vM9Swjmmht9FR2ZhnXFvfpmaSuC9wzTxmbmJDCqPX5jXHMx22K4TT16p0ba4mriT7zjyVBRwzO7
 +5WvJyzteg7Str70IFk/3kaiGuBcbkVoGTQhQM+wZLoulrD4peTzzUfHXsFrLSRcH5ZGGjHL
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685925ec cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=t5UmTshxakG7yEKo4UwA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: GcqhAo6xfgcOeVtpTy4IWxPhf1SUo-FT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=934 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230059

On 6/23/25 10:44 AM, Krzysztof Kozlowski wrote:
> On 23/06/2025 10:14, Satya Priya Kakitapalli wrote:
>> Add device node for video clock controller on Qualcomm
>> SC8180X platform.
>>
>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>> ---
>> Add device node for video clock controller on Qualcomm
>> SC8180X platform.
>> ---
>>  arch/arm64/boot/dts/qcom/sc8180x.dtsi | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
>> index b74ce3175d209b569e634073662307964158b340..4590c2ff68a9885d8047d728bbf2dea0236d5b8f 100644
>> --- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
>> @@ -10,6 +10,7 @@
>>  #include <dt-bindings/clock/qcom,gpucc-sm8150.h>
>>  #include <dt-bindings/clock/qcom,rpmh.h>
>>  #include <dt-bindings/clock/qcom,sc8180x-camcc.h>
>> +#include <dt-bindings/clock/qcom,videocc-sm8150.h>
>>  #include <dt-bindings/interconnect/qcom,icc.h>
>>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
>>  #include <dt-bindings/interconnect/qcom,sc8180x.h>
>> @@ -2943,6 +2944,19 @@ usb_sec_dwc3_ss: endpoint {
>>  			};
>>  		};
>>  
>> +		videocc: clock-controller@ab00000 {
> Why are you adding the same multiple times? This was added A YEAR AGO,
> so you clearly send us some complete outdated ancient tree!

It seems like you're confusing something, there is no videocc node in
sc8180x.dtsi

Konrad

