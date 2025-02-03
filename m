Return-Path: <linux-arm-msm+bounces-46776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 615D3A25CE2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 15:40:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DE011669AA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE834209F26;
	Mon,  3 Feb 2025 14:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FulfmFw1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595DB207E03
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 14:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738592862; cv=none; b=aElqVmhi6zZhUiKCxSHUGy60KgjJb8u3OxXER4tG1OOa/9LiZ/FIjcRiFbUYThcai1OcjxbDWIrAGsHdQkoc4yuGsqL62jd8n+yFaYoGZOhxK02KHMjDOzBGdEYjBca/uK+HbBgGxTb3EM4eqkZFavkLrmvlTEY86e+heIppayo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738592862; c=relaxed/simple;
	bh=Xf3vzzTJsIfG9mnXoUhr4AozPJo5ITepH/R/LGvc98I=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CX7ecm6C5lJdOyoipzykKQq1l2R8JYBloSb1pkwaywdfl3/jBLq7S+6EA/IPJC2Q7VjQgsHc75xzjTKkY7e+5OgDwS7zTsfEscE7h6gR8m5IlJGjzMC7bl17IQUl1RxYRqflrX+M517IpxjV8M4b0mfLIFIrteq5zazT7+SusG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FulfmFw1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513BHH6R012514
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Feb 2025 14:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z32PzU4coYuXq8q2uocAQsG8D+C94sos2b3J/CWJZq4=; b=FulfmFw1t2Ennp2z
	JuUIoHD5+vFcsKnMhgiZInDaeSwdiwhZi+Wh4kzXFDs0ErEZrfx+QCF2lCKmLxxQ
	DDgdRs3AldJR3QhAEYRu0BmzHZyhMLd8qiSRhVMsOX1MP/LpaehabeELV/Wwll5j
	kGdtkKuGw0/ucpKNLlQGHpsxNNcQZHu3an8Ehut11H+1iafCmFrkQY5fxuIIxwah
	pZhC7Rzy7E35/I8FNlTcZa1GQfT90XvR4/rP6rWhBDZfavewXhqZrUBXA/67TR6G
	u6v6LCB9RGrODakW9Wy+DjlXGL7/3mrfwnno6gfvdePokgs9DFiroLj8LW71GgIO
	JD+syg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jvsu8k6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 14:27:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b6fee34f95so23589385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 06:27:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738592859; x=1739197659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z32PzU4coYuXq8q2uocAQsG8D+C94sos2b3J/CWJZq4=;
        b=B6wGxQMKyx3vncVGuc8/CVI7/Rs2n5XHk8dExYyVwnyRBE3vqByKihixeC1lcShQ0s
         Lo5ma0qk0ImXcH3sEx7vxewJnyeQOBPYQv63yWFXmkZ7hBpP/lS4v95ERirAP1PHOvd+
         qx7wAtMs5j5DstpK0px+7ku5oZFoyac0K5lnSa+YNPl4xq5YvlH+s1SXco+76TFtK2B4
         JMmxhaiovdBg1fYkZZfQuo3d1nenEvfQMaJmDg8+UrLiLfBcS7lmX3JB9Sv0uFyzftaS
         TZ1XS1sGqAf30x7/6tP7Jq/ub4m41SNJP7WuxTwRtKdih+gxJqIjQkYG55NWDV5XjbPz
         x3og==
X-Forwarded-Encrypted: i=1; AJvYcCWxRe1miRpvGrdeQEtHaivLeYkhwAt3y3k/Nl7tXuE03dTSsMefIcJRi2YSZW6D5hZBqvY3IWXXjJWvzrnq@vger.kernel.org
X-Gm-Message-State: AOJu0YwyuOJVUCO3pOlTQ9IWh9F+k1KO1pKTiXzeriaISpJATniV4WzB
	J5WVUQhqTokBL3pxjhL6oa3zLWOcyHvCdYFcGh+M9Ywyc/uO0KTCo9jUm3xE1yw+cUJaT0cgKsT
	ObZNb+9LtgJ+rx1dzNpwx7GB+zhR+T4vETdt3rGqWMSggB8jYY/EKK8JUqCi+MnDd
X-Gm-Gg: ASbGncsL/LzBm1pgHadAGjGlpzIpycqqdIRj3r+Sr5JUCQZn9JZwERekwx8lfK9EJHz
	Lc3EVs41fUk0LC5neMhPqtcc1ZSSv/sgn1TWkbDmIwk5Q/TUfYlCJhKHUfLXJ+MuGJBl+0ajy+5
	nIhTXA64tHEiHglUx9Hk36SK6wU1rmEZqIgrrnICvulKUSzH9jjaD9DxEGq5RzQV1vGNB8rk14I
	oJLItSnvcVF0H8obi1mDlZomBCQIRATtRSYIduNr1Bs8vhwYI3Jhxr8HLVxGB1lQazIc55hQwXD
	PQRXjPGahMW2/6bAdl5xB0rLS4knBjGCgEsii3Fc3x7HF6tMYcoAdQxPNHw=
X-Received: by 2002:a05:620a:248c:b0:7b6:6bff:d141 with SMTP id af79cd13be357-7bffcd9d787mr1107873485a.13.1738592859178;
        Mon, 03 Feb 2025 06:27:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCVB1pFxx3ztPneFspzL94a8IE8Ob7/aW9iut9z+QQesefeV02zB01674x4dFFcNyiIcTNaw==
X-Received: by 2002:a05:620a:248c:b0:7b6:6bff:d141 with SMTP id af79cd13be357-7bffcd9d787mr1107846485a.13.1738592852050;
        Mon, 03 Feb 2025 06:27:32 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc7240608dsm8039781a12.47.2025.02.03.06.27.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 06:27:31 -0800 (PST)
Message-ID: <716ce859-7bc4-47b9-9a1d-005427bfdf3d@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 15:27:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sa8775p: Partially revert "arm64:
 dts: qcom: sa8775p: add QCrypto nodes"
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
References: <20250128115333.95021-1-krzysztof.kozlowski@linaro.org>
 <2b07b8ea-9c7c-4f37-8d01-d14d1e82aff9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2b07b8ea-9c7c-4f37-8d01-d14d1e82aff9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FY9IzpkuerYIcuENkoi8dzlfsDSzN1e4
X-Proofpoint-GUID: FY9IzpkuerYIcuENkoi8dzlfsDSzN1e4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 clxscore=1015 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030106

On 3.02.2025 3:09 PM, Konrad Dybcio wrote:
> On 28.01.2025 12:53 PM, Krzysztof Kozlowski wrote:
>> Partially revert commit 7ff3da43ef44 ("arm64: dts: qcom: sa8775p: add
>> QCrypto nodes") by dropping the untested QCE device node.  Devicetree
>> bindings test failures were reported on mailing list on 16th of January
>> and after two weeks still no fixes:
>>
>>   sa8775p-ride.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
>>     ...
>>     'qcom,sa8775p-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
>>
>> Reported-by: Rob Herring <robh@kernel.org>
>> Closes: https://lore.kernel.org/all/CAL_JsqJG_w9jyWjVR=QnPuJganG4uj9+9cEXZ__UAiCw2ZYZZA@mail.gmail.com/
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> +Yuvaraj Ranganathan, please resubmit your original series with the
> required fixes, or this patch will need to avoid build warnings

will need to be merged* is probably what I was trying to type

Konrad

