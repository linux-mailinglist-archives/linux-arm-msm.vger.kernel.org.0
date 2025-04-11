Return-Path: <linux-arm-msm+bounces-53936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A84A8530F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 07:29:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 271399A23D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 05:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A78827CCC6;
	Fri, 11 Apr 2025 05:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pi/no4Xy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A562427CB01
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 05:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744349368; cv=none; b=kHB1zByqYbUTzUQCAxgyF7wiNFWzavb3efwd/jPy6H/MIJtZXsGeSgjpVKe58/X/JqKRHE3YX4iJsnAR12YvvlIsVTwCGlomIxjaeXlmETJA3ZUC6BwdvMDso5GQzLPJ6WPbh0oz9k060NdQMMGwFIQBhXBxEBzaB9D7I0jGcpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744349368; c=relaxed/simple;
	bh=TyvjaogtjTDx/T8QlFwk2AxVNIIPeTdvsx9AidCmtAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QdJc303XP6fHoHyRtgfJcU1wCfEHdzN/zrDUWG/FVCpjcQIzLC/Zk9qbEJdvWdPA2xde6N15obWjgkgVUBZxVHZCvnFgVh45geAsYnwn1J5XVjjE88DXsZQlo2eHZNICIhTTIyWshaD8nP9rZgLMin+RI9G9lZu8sfeIXjotwFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pi/no4Xy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B1ZIaV006870
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 05:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KUbjZYN3IQWyjpUUVwIb4CXGeBKGLs02G7FDkNMNVZU=; b=Pi/no4XyzIyab+op
	Y5QgktvJ4g/CjERWmNC8zs8ybBEJW9j0H0w6niTth9tfQHuHpwZvraMS0sC43Dd7
	sBhk/scAt6SsfeUrGne0tJWjpd6Zrj6L0b33C/+HEukdCMHfwpHyW+RIc+4cYREe
	5xAMwVk0dWXFdYcg0hWan9GHY4ub2bAWajFoz9YQvmJzjAkKREUjH2r+YwHUXUGT
	xA01nTWZRJK1eDTfzCW32a1tUaJ51cgboR6jVedoL9KpfTLuUcziFwNsmkCExkHx
	SiZps+z8JACvKyJ1h63O5tIqdiZdjIwNxNm9JyH0rtcNIqiAyl6VFmHlIRoTd+uE
	/5wIBQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45xeh3j9e0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 05:29:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-736b431ee0dso1229635b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 22:29:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744349364; x=1744954164;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KUbjZYN3IQWyjpUUVwIb4CXGeBKGLs02G7FDkNMNVZU=;
        b=Ukm1N6kuzUZR1me7y804miMrS9zOpUP1DL0cdzq0uc1J4mxgDQTEyaEssHH+erLeGb
         sEFQVr52dmKnhwOhgAz8DQl9amYsKBSnkLP8NzrK6DVFN8+/oAD2IGZA7aAQmrV1czhn
         1UHskCmTGV126SCIorXeNCyYHGDEsUlmGCNM4YYqemkXJgdgvu+eHR8U7knD3Wvs3oB3
         0HfQosvNW7vj6fDh5IzSGGLeRLyQykQHNv7b0iB3jJAklyn05hmLJ1s5mDojZfCPkNR5
         XQEwFHEIDecXHrob8JF1Z+eKlGMi7shc9bw6xftcW0BbGlRcC7698z5GAx8H6Rqq8TmB
         6jlQ==
X-Gm-Message-State: AOJu0YxkrtxdxpOnjExduQE7OBOPH4PJAcR/CiBw+TabbzgYljtZr4XB
	E7fMMsgZ6scpzjhhrPMKxpM1gp98BR+Sx0nriHRlCx5SuzVbBWzimF/CNmomCL7dVt/qtAGDcjO
	ZOjvOPBAuwhb8FC3uAj8ifGdsDUbNj9PnY529zSetVQiK1+jKgGalq7pcH7VxUW8B
X-Gm-Gg: ASbGncvItPKmWoEeZR+gFtwHlq3YMBYFJIXjZK/5VLcLn/V6YqEWI0Q6r4MHaIe/uBH
	grstrQWlUXR1eioeCswnIugQLCd2XMWfmZrofjvGERFYZVWOYAxoYlztAs25/PbravnQdI6ZsO0
	i+wxrMJAtnAGQ1U6rT/6iDbdTdxaAtIB+FCv2wEvxRlhXitPeNPZ/xWlq5m0xVBBwiV6yNZEz4B
	+vNnQ58EbbQRfohDz1xk3bU60tJpj92qOCTTgPTGbE9dUxtTBhDN+gyKN/bfOtfJKW5HTRhgB5h
	OJzU4v+hoLcGASYrN49jxqDLLPcQ81brYU3ggBDM+Z3qWNvoJxzi
X-Received: by 2002:a05:6a00:ac2:b0:736:39d4:ccf6 with SMTP id d2e1a72fcca58-73bd11e6d4amr2204609b3a.8.1744349363881;
        Thu, 10 Apr 2025 22:29:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKdA+yoEfaH4SyvUyAodpSjhJ93TtNdrQMglLHoYzjAgSJgmykhbyYfCXYlFjunZmyz1dJbQ==
X-Received: by 2002:a05:6a00:ac2:b0:736:39d4:ccf6 with SMTP id d2e1a72fcca58-73bd11e6d4amr2204583b3a.8.1744349363309;
        Thu, 10 Apr 2025 22:29:23 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230e34asm581481b3a.137.2025.04.10.22.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 22:29:22 -0700 (PDT)
Message-ID: <7ecc8079-1110-4692-a257-09c4ea2041ad@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 10:59:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 5/6] watchdog: qcom-wdt: add support to read the
 restart reason from IMEM
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
 <20250408-wdt_reset_reason-v1-5-e6ec30c2c926@oss.qualcomm.com>
 <e02e7431-2e30-4e65-b04b-15fbb0bcd8d0@roeck-us.net>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <e02e7431-2e30-4e65-b04b-15fbb0bcd8d0@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VbH3PEp9 c=1 sm=1 tr=0 ts=67f8a8b5 cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=WtALBppYY-rU2wiDHIEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: EHUH2cx0gXpZh-bDQTYdBsli3lrX2rUQ
X-Proofpoint-ORIG-GUID: EHUH2cx0gXpZh-bDQTYdBsli3lrX2rUQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 mlxlogscore=911 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110038


On 4/8/2025 6:03 PM, Guenter Roeck wrote:
>>   static int qcom_wdt_probe(struct platform_device *pdev)
>>   {
>>       struct device *dev = &pdev->dev;
>> @@ -267,7 +303,9 @@ static int qcom_wdt_probe(struct platform_device 
>> *pdev)
>>       wdt->wdd.parent = dev;
>>       wdt->layout = data->offset;
>>   -    if (readl(wdt_addr(wdt, WDT_STS)) & 1)
>> +    ret = qcom_wdt_get_restart_reason(wdt);
>> +    if (ret == -ENOENT &&
>> +        readl(wdt_addr(wdt, WDT_STS)) & 1)
>>           wdt->wdd.bootstatus = WDIOF_CARDRESET;
>
> This ignores all other error returns from qcom_wdt_get_restart_reason(),
> but in that function it generates several dev_err(). Either make those
> messages less than an error, or treat them as error and drop out here. 


Thanks for pointing this out. I will handle these errors in the next 
version.


