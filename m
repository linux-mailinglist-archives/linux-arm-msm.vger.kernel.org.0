Return-Path: <linux-arm-msm+bounces-67069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7D0B15ACE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 10:38:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2F3518A6A4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 08:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 232B5268C40;
	Wed, 30 Jul 2025 08:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HeCycuwz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F91318CC1C
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 08:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753864712; cv=none; b=quqdl0s2lbU3UCgidaRFRA2977GlDuhXa2ywXNzZDx9IogJVjcE+oKzUDFcHwkLU/l39WvZkbKSJnxx2er+6kDufXVnSXeROV2lemZ4ukkep1lbjCptSKpZqu1loZ9Y/P6cG9CRQSLfgEMCCWdLvDJ3wy2NGoV/+BDYb/LBC9jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753864712; c=relaxed/simple;
	bh=Q6l3IpqKbOqB7OSeobIhjRaEzAZYWHwA59c2iSf50F4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tqgHU2muBvGqahr21uMfyZhx6Gi6HgL4jfiZqScCn0iWujEiu7rbgfnibatiNOQ8ZpdUoWZe/lKvBJwrpcVbAzePZ4IRSE9sD/VsyzHH8xfzdRgHTup2emp64ZE8JBU7BHsYPvhBNvlSYRhy1Z/POre+fcBbhl95f76N2hInSow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HeCycuwz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U5Elar003999
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 08:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iI/nNXs+f9KkWZ1yxsWzsQrCvk0IJuyKWclGYTpMJOM=; b=HeCycuwz3XWsPdv8
	Akbyi5AOL1FtXNcdQTs1bdp0TEP5J7OJ6tyxBOlHhZwSrbD8GuAQwc8n9+BACdGZ
	fMaULoIxcbDVH+tRz9uIcT5bDCJ9hEInhxDUQEBh0FRqA1mOohlKiJSIMEMm0lst
	uKJ1ODSrcKBKHUaHvq18x0EnwLKYvRCS9Wz9+upoPN8isvAeRcxGj0FqXah5SB8a
	gvLu9NXezJEdFDirAYU6nuP8j/PRrudLFyXsgxEfVOqt+WututFRi1MmUmA1BERK
	gwIbvdzLNfeee06RtunxhsIsSvM5WvdE2RF+ndcNx5GhAk4aB1RHRFfc5gpMts+Q
	5ylz6A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2jxes-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 08:38:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e34ba64a9fso46882985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 01:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753864708; x=1754469508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iI/nNXs+f9KkWZ1yxsWzsQrCvk0IJuyKWclGYTpMJOM=;
        b=ClvXLs61J2KXmL0zmoTH3NITY3a0SQLc/C0AJeMktF3I/qFC7lZVi/3KfkIVUmi1Rs
         0tA00kUp6Zhmz3BW76RgdKt2PD44cVL9JV/ofDtu/Ou6NtWb8olzPQn1lyu5aX5C9m++
         KE6/E+QZw2SXKFMd6eSJhK0pWzPM/Vjuf3qZVOvAFfn9FRTvQETyfAmd5yxZeJCvvpc2
         coyvVnA2w4qFnV/vBW2jZHHo/hSeVCM6ux4bkIGjWQLQ4RwPO2yU5CyUZMsaEz6SCyhB
         +w0r0U5KQVAmMTCXPgYf4d5rUmmJl4ecAl8eHf8A8dvYf4eTxUeG8iv1X8D4LISEo9lZ
         DAeA==
X-Forwarded-Encrypted: i=1; AJvYcCUE+S4UBPCSAz3hTnzxRJ4i48IX6qokCuwW+rl7ud2Q9xrJ23hCushiwmjrh2e2QSIsxwSm9Rsbk2hNDmKd@vger.kernel.org
X-Gm-Message-State: AOJu0YzI8qXZMpEw45UgzYGX2Jeee2nSUtmjNVfuQxKJv7x1sonXObRI
	IPvV0dcMIyGjdLXCSjSnPPS6reb4UqaDeUdonlhEnObUhkc4dQ0DnzBrJ5TKmNTbmHeBifBQQQH
	gqbHb3cWT1QBar1PPPKUTyXSHqDWOAwAPb9Eyp8sTlVN/5YXXd1qN6JKUO/oUQ0m1Kzt1
X-Gm-Gg: ASbGncvwbzv9MdoOqQl7nXy2Qrjh9cCpfVdNBGQauFOCRAEfewgRWM0iu0P3GuvkDrx
	Q7F+VR4vdrTXr6VbfJqBoiLCBv656kNImUJ5d3yu3kWzk3qXx3Vcy5HfdaWc9Y8ja9vS3XhFK+2
	jSagQbDOxyOtsdamdc5S0yOZZlk1s3oSOb3FDR+j2tK1SObDvcLESfmbXm1hBkiIoVfzIkom4YH
	Tk83UcnXpEy5QJhXppr1S1AAK9s69X8KgaosQjCu2XnfyMYlPI3znYoJTb+N2ryuNxlMU5kbxbN
	O9Q5pwxrDeV5pikYie2RrQXjqZjtaNzmw4HwLdTLa4axSniLb3tHM+gxAPsvI3/oL2vRFStY4jJ
	P0zpluArlwq9W/1miaA==
X-Received: by 2002:a05:620a:2892:b0:7e3:328f:61fa with SMTP id af79cd13be357-7e66ef91861mr169464285a.5.1753864707692;
        Wed, 30 Jul 2025 01:38:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVI2jZ37bBekKEznTg/czn6Oni5IYIGSxIKihzZfZqwE+jSvddcQoWat/7kn9i13M2e0uZOg==
X-Received: by 2002:a05:620a:2892:b0:7e3:328f:61fa with SMTP id af79cd13be357-7e66ef91861mr169462085a.5.1753864707288;
        Wed, 30 Jul 2025 01:38:27 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61544a81df7sm3370018a12.59.2025.07.30.01.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 01:38:26 -0700 (PDT)
Message-ID: <134a6436-18b1-4b21-aa19-5e7411c1678d@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 10:38:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] cpufreq: qcom-nvmem: Enable cpufreq for ipq5424
To: Viresh Kumar <viresh.kumar@linaro.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, rafael@kernel.org, ilia.lin@kernel.org,
        djakov@kernel.org, quic_srichara@quicinc.com, quic_mdalam@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20250730081316.547796-1-quic_varada@quicinc.com>
 <20250730081316.547796-4-quic_varada@quicinc.com>
 <20250730082852.oxy3tjjtdrykrzne@vireshk-i7>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250730082852.oxy3tjjtdrykrzne@vireshk-i7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UR0U-nts3NVE2Cpf6-ZzZjtTSvSSW_tw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA1NyBTYWx0ZWRfX7Mi+VkE8ptCR
 NQ073+6FuC8WeHszqooHF9A55aLptti0W+6N/0w7VNNGe8KyJLHDm9x/bN4x5N/K2Wu/9b3Ox13
 0WTykGE7tt2NEKI07w0S+YSfkZ0vRCDSMLdYGnXG6OJe2/jr4vfMNinS/1rHZ8I1jyQEYRedBoJ
 DH1W7IcpaUJZNUEYSQ1yXzxYiY8WaHlJQ5fJId89hreBrjaXSPGZqTvu6BUdQgzo2LAopfe1W6a
 TnrAeSlXnTZRLSZMeKJilqq369f+SRp7kwpCOpDiQ+MKOze87DmHw9rs28vItGQ6WtXmuWYpw8Y
 585MsJYdX0oCALfex/KI3V8jq7wAJsDkLzP68BQlMktvye2sf39bU5F0cTbj6T94doApr06SX5S
 PQGIgEk/ejFTNXRDBwnslVTheLmJKSvvZthfSOIf7QgMeThT5s4gysDPajoEi/cLlYfkKWJn
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=6889da04 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=-57h1Q5dCNsLzJNHLckA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: UR0U-nts3NVE2Cpf6-ZzZjtTSvSSW_tw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_03,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300057

On 7/30/25 10:28 AM, Viresh Kumar wrote:
> On 30-07-25, 13:43, Varadarajan Narayanan wrote:
>> From: Md Sadre Alam <quic_mdalam@quicinc.com>
>>
>> IPQ5424 have different OPPs available for the CPU based on
>> SoC variant. This can be determined through use of an eFuse
>> register present in the silicon.
>>
>> Added support for ipq5424 on nvmem driver which helps to
>> determine OPPs at runtime based on the eFuse register which
>> has the CPU frequency limits. opp-supported-hw dt binding
>> can be used to indicate the available OPPs for each limit.
>>
>> nvmem driver also creates the "cpufreq-dt" platform_device after
>> passing the version matching data to the OPP framework so that the
>> cpufreq-dt handles the actual cpufreq implementation.
>>
>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> [ Changed '!=' based check to '==' based check ]
>> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
>> ---
>> v2: Add Reviewed-by: Konrad
>>     Change speed bin check to == instead of !=
>> --
>>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 5 +++++
>>  2 files changed, 6 insertions(+)
> 
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> Lemme know if you want me to pick this one.

Please go ahead

Konrad

