Return-Path: <linux-arm-msm+bounces-66213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C70B0EE46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 11:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E2F83A4C76
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 09:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C770285C8C;
	Wed, 23 Jul 2025 09:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V7zfWItt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80AB285070
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 09:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753262507; cv=none; b=B7nv8wHT9IN0jfo23n9yXrpZKFuCQ4uVq7gZWiB7+xBMKkUvQUE2+reAU747ERAe9apdvopKmmnon62q0mZO+ciaSZNUELJZrHST2w63OFUhI6WVjLmqz+FnbD+lTk4ix9ILMJiyGQYR3PE7RDyS2xQ8L0UdPxXsXLbdwshcIn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753262507; c=relaxed/simple;
	bh=lhb31hAfmJWv+pFCSk8uxuRQUATQK2rglMLyJJynjCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nO8OEvAPx/7rjyTY4f9gZ7qJWxXQ2RaB7M1h76AetsZ+CFreSh4nYwoY6ShED6NB5XXSkfU2bH/j49jFOe2TUAjOu1ONlHfDb6jgGDCLz1/DBgWnBgeix6wfVmjJn6f3Ozf7u8cQG9uDACKj0YOMFiuKXfa0dTAm7wzVqL0KDV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V7zfWItt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9FEx5007882
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 09:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nb/6O3iiOkNyz5fp5T+ekQVrNaBGU510DuWWGBJBlD4=; b=V7zfWItt8+wifj2c
	wRGy4DMLzDM013wvEXJwXusO5btF7AzB+r6aldVoaL5uO4VAa6viLxSt+a4Pmgt3
	HcKWLrUAeu7vl7TThd4d8/7sGJcCtgCIdAuy9cPKWRqj1CTQG05IF7dbC3oS+7eU
	m48Pm468vZl/Gtt4NnuL+y7V1RBIq2ci8OfqdxKGSSMx7a9P7y82wn0LqzV0lQIQ
	i/c6t3dCmbMZtg+wNAN389e0dJElI7niMdLrT8Xij8HFmEVn+kSd2dut2gcFD16l
	7JfeqonA4DxqDUvnLzzWwKF1fUXnAWFLzbWeN6sTddgjYz6dt1q1PS4yjIw4kSy1
	XiDzgg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qckfg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 09:21:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3132e7266d3so6548831a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 02:21:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753262503; x=1753867303;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nb/6O3iiOkNyz5fp5T+ekQVrNaBGU510DuWWGBJBlD4=;
        b=q3jNFCGeYTpD5m6TUvRb6YmoSMmg3uUDw2XEsCBOZu0Fb4bbFmZjLN6ZBWmouJo5G0
         j6ieJow5Kx9StBUSQwJgh8FzrdztTfFiI3ZnrLJjEcSeHQV1PgIm35HRvAAe1xRGYnr8
         GybzEXts5n1xIcOEIzd0BAMCnHstIEZCD4INamitkawDfCmGsu1+qv+eunJS7aG9TE+l
         k0z6YBK/0y5UgLyEq5ch5NNf406Gqd8HPQPWMFfp7bojvpNl/CoSaqV9H4MVI2p3qIhH
         Ij+GOCAG7FvalvivFOOBYH7cQ9U3iczyJMxoA51k/Xl287rFgc65JYrhwmI5ISQIGYZY
         mGuA==
X-Forwarded-Encrypted: i=1; AJvYcCXaYcESkKnAk2IqBLlBEQV3NW9m5/GewjJwMRkI1c/ucozQRiU6yDTtV6VCrQi9ToKDzk837OEdrOC4jVy6@vger.kernel.org
X-Gm-Message-State: AOJu0YxDxnSBrzkNAvXPPemmohw9uFbZbZXz4KGvIxNLsvyfESsFCQVG
	mQe5LYsUe5DdI7tZD9VdbAXdT4Bv6uqXcTbGdIB/xkQi0uwq72MOg9W5+oP2nSgy8ZQtv6HwNBu
	83EsdXfNGNubdkdCXr03h7DhS9k1gBEqFPr1pAL6abG4amxRXijNgOEkY0koNOsQkyGj/
X-Gm-Gg: ASbGncuhQQcM2pCGIDm2LBOHcUAAOj/8qpQPsDMqT+gMzLsGKSLeXKaZwhzaPgpxTQ/
	8+o7zMITpotSFs/3aeBKDNm6N5gXvM3A5gZ9Hou6ASXT044UuSgDMxJGiuaMs3ing7mBLah9f7W
	AyMFwj3ZxQ6nGLeW9qIIPybPD16VlAAfL3kLXslZINDDKkgcH9Fo9vrrnYTnj7rbUgEMjdloUA7
	2t+hXrIjSzlvf/BdSdOUqH9INqJ+yeEtZBrUnneHVV/x5bGJRNWRGjKDCnOp/UCDmzPTMUJPaqa
	O7xM9mTArNJtlNdUZPfyNA6+Q1MLQhFDHXUrd62zOLA+qtzi9V6VBns09YJQl+9ih94=
X-Received: by 2002:a17:90b:3f8f:b0:312:639:a058 with SMTP id 98e67ed59e1d1-31e5082e792mr3737788a91.27.1753262503160;
        Wed, 23 Jul 2025 02:21:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEt87+pV3bznhTxSzIjTAcYlS83i2dw2B8Ky3HyJPtNmRuAysXZs8ygxv0dO+g66ulY7n8p3A==
X-Received: by 2002:a17:90b:3f8f:b0:312:639:a058 with SMTP id 98e67ed59e1d1-31e5082e792mr3737742a91.27.1753262502629;
        Wed, 23 Jul 2025 02:21:42 -0700 (PDT)
Received: from [10.217.216.26] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2ff63683sm7223957a12.41.2025.07.23.02.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 02:21:42 -0700 (PDT)
Message-ID: <ff05ceaf-6e32-4d66-ac2b-a1b55f41adbb@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 14:51:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] dt-bindings: clock: qcom: Add bindings documentation
 for the Glymur TCSR
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, andersson@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_rjendra@quicinc.com, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
 <20250716152017.4070029-3-pankaj.patil@oss.qualcomm.com>
 <20250721-striped-defiant-hippo-6dee44@kuoka>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20250721-striped-defiant-hippo-6dee44@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA3OCBTYWx0ZWRfXwbEqhC9Z7FRe
 WKvdgFyWnqOUPJ0koWXZwXAgszqiHCdikVHY9yO4rXW6JtT1HMlpHjcP/mP8keYkvGVOXeEh6yU
 wbi23xgHTCOe4sBH9uKijeY2bz7vkR9gwtXcvYbZncASlHbRlN8t3rTZ2xCABEG1NO0K0F6W3ru
 J9YkjTp2wh87lTeLk3T0nzkOKs29Av6N5tq6p8dK8Cca1ZKAzRyDNZMDgFKzIB4GYZzIBBssRtc
 Hy5jbfX+sW3ry3G6dMjlcHJFVRa0btyZpjWs2X8E/DySideUAhH8IkVlYUT+hFkD7pNVguJEW0/
 eizZp7VcB2WexmhSrYZaKwOZLuzNeQvbi/Wg5GpDlxu79fIUuuJln/6yUO/yEWTtN/PwvX/CyGi
 Y1Rjh7e7K/recz84iS74dk0tmYaxuuMuv9hUgs7NJFArN5+n4j98fZAoAHG8rSxotqpAC1H0
X-Proofpoint-ORIG-GUID: VpdvZ9xRXL3nfIPopxnbETBlNlIKka8g
X-Proofpoint-GUID: VpdvZ9xRXL3nfIPopxnbETBlNlIKka8g
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=6880a9a8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=CvYCOFMdU_owP9l6gQwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230078



On 7/21/2025 2:49 PM, Krzysztof Kozlowski wrote:
> On Wed, Jul 16, 2025 at 08:50:12PM +0530, Pankaj Patil wrote:
>> From: Taniya Das <taniya.das@oss.qualcomm.com>
>>
>> The Glymur TCSR block provides CLKREF clocks for EDP, PCIe, and USB. Add
>> this to the TCSR clock controller binding together with identifiers for
>> the clocks
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> 
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
> And same for documentation...
>

Will fix this as well.


>> ---
>>  .../bindings/clock/qcom,sm8550-tcsr.yaml      |  3 +++
>>  .../dt-bindings/clock/qcom,glymur-tcsrcc.h    | 24 +++++++++++++++++++
>>  2 files changed, 27 insertions(+)
>>  create mode 100644 include/dt-bindings/clock/qcom,glymur-tcsrcc.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
>> index f3afbb25e868..9fbf88836782 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
>> @@ -8,12 +8,14 @@ title: Qualcomm TCSR Clock Controller on SM8550
>>  
>>  maintainers:
>>    - Bjorn Andersson <andersson@kernel.org>
>> +  - Taniya Das <taniya.das@oss.qualcomm.com>
>>  
>>  description: |
>>    Qualcomm TCSR clock control module provides the clocks, resets and
>>    power domains on SM8550
>>  
>>    See also:
>> +  - include/dt-bindings/clock/qcom,glymur-tcsr.h
>>    - include/dt-bindings/clock/qcom,sm8550-tcsr.h
>>    - include/dt-bindings/clock/qcom,sm8650-tcsr.h
>>    - include/dt-bindings/clock/qcom,sm8750-tcsr.h
>> @@ -22,6 +24,7 @@ properties:
>>    compatible:
>>      items:
>>        - enum:
>> +          - qcom,glymur-tcsr
>>            - qcom,sar2130p-tcsr
>>            - qcom,sm8550-tcsr
>>            - qcom,sm8650-tcsr
>> diff --git a/include/dt-bindings/clock/qcom,glymur-tcsrcc.h b/include/dt-bindings/clock/qcom,glymur-tcsrcc.h
>> new file mode 100644
>> index 000000000000..72614226b113
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/qcom,glymur-tcsrcc.h
> 
> Filename matching compatible.
> 
> Best regards,
> Krzysztof
> 


Yes, I will take care.
-- 
Thanks,
Taniya Das


