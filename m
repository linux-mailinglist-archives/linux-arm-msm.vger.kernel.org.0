Return-Path: <linux-arm-msm+bounces-67012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF76B14ECF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 15:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97E2A5438B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 13:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACC0C1B413D;
	Tue, 29 Jul 2025 13:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f8uyGyDb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17521A316E
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 13:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753797232; cv=none; b=Fah+epqvqTvhCNZ7IQaUh7bzBpbf2hUP38qzJlfVlA5kN6AL/LB14HeEprKZbPX9ZcTZrTUKRx8OIgRgW9VRGzG9woH7WpVo3OpiFOMgYmJow6lOWXVLaPt1S89FqttBAMdgb9bSwrvFQtV5xm1L922BO7XB1ta9X60OjDLMKr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753797232; c=relaxed/simple;
	bh=7KGd7j82dDK+ybam3fPzsTNJLqBsuymq0GgV9H6+e4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r17kTa2mvFeJ1jCq7LPTZRfJAUWR0e+Awa/0py7Q0zSBah/2+amsM0LeeSa3Al4yyi8vALHykvv9+D0d1YwuViRFqtol5nwFFwrGrxKNyX13cvJOgt48MlHgZvFHhYS4HltuMNkMFjTMbvP8bathJSH8ilnHuRO842mJK9knY60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f8uyGyDb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T9Slld030056
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 13:53:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uIz2sC5rEvjeL5lDn/RzFAavsZ2n0Q13ZJnx4oJFPBI=; b=f8uyGyDbhemwKOn8
	iFRaSRVt3n5zuPyusne6/n6UyImffomcNSmo7wRFQ8O+DHCdGM+s56Tybz2Yd5nt
	fXI/5YpxUJow8wXke+xRfygm4WEsrJC6wGzoEKdJ2svj1QOsoyXNbjoAw7ZpbGUs
	+psQp2QXMj0Ip7Txngg0jOc0jlN3NOTUcmCoh6qVlSdjgFMVWQ+ebEqvGRilmTci
	5jijlFQKSrlhVHEyBGHXV7ccxUA3odPaj23e+8nu4bVduvmWNqiUdlbu+4FZ2wT2
	Y2EQizrsFzP5FgrtW4JDMCwg7J9Vm13eR+ojDCuIE5DrKIJRan5oR6qGJv3qN1ix
	HZdDrA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbm07d0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 13:53:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e2b5396898so27182685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 06:53:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753797229; x=1754402029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uIz2sC5rEvjeL5lDn/RzFAavsZ2n0Q13ZJnx4oJFPBI=;
        b=qdfoT7sZvxQD1oHiJkzLARTXADjEntEiTkyNK4lYfZ6H1ekVqS/pvN1yb7tigWkzI2
         07mhRteG2rDP0paQlFKVk0BB6+EGPzusspuf8yJiQOPB1fTItpCRr7ABRBUPkP2hReEg
         s+XTpjuycjEElFreEdaA7zN2YqjDGtnlNo+wpdxsPYpCv3f8cAASQyurT3gbrc9iXQP0
         EmD03EHXwkfwrE60Kt9bwlA6LAzqkfRtUr0F3oCLwpTSQyzGFAs2Ly7yG6a286j1WYe5
         6TLRN568NwVNSuIuq1RHq+ZxjJFCy9sXkqLFyLJKttqOmk7o1PWdTDxx83pCmUeUCWLB
         5wLA==
X-Forwarded-Encrypted: i=1; AJvYcCWErQEc3iDfFOjLJ8pztVVCizcCvOEmNeV4KUf545ODSDtRUOllw5/yJ3PgioLJtwjSSBoScRmbiiamv7Oe@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6DzF3qTx9bnZjEBBSABCPN8QSKa0UqL3xZMMvWUVIOwDpsjFo
	ucMg/Cvg2cvRUsafT3iJsx5e0iHdH+pUiD72ihdIR2vSCm8Y8oqg8fAuNDPXG2URt3tn//a3CrV
	7zflXp2lNJFEu+TjzKEXsRnjgegDt+sF6AJkHdrPQqfujtlPW05pCdVUZsd75sFFyRBD2
X-Gm-Gg: ASbGncs+4IhW0u5iFaIsXErPCQuhWP6Lv/SEYghKMwW1PkL4jM5q5uScbPZcb+FezRa
	GXCZIU9XxfzLJgxE2QXkLmNPyLYbtAwauqJfVYdl2yRrUwVe89wviGzGaowB8rciMSMLmyFBKhq
	tciobHWp25qHRscX2h7ubJFCFyxWb8Tl4AfiCfD/n1tnb4KVK6/kN34fFrOX2parG8MpgaXjHwQ
	JrEg1jMNQqglcbNs8w5V/HJZ1ltalgrOxUDW0PTtBsuJSsK8fJC0oIjp8kG6aXjuM25cDKRpS83
	VCgljmmuyKfR9P/NtupVXAE7zh4iQ+M8OW+ZqboJ/MiGsONPaV96fFW0ersjwssEW8N5FkDK6K4
	TbxuY5HXP0iP5iQSKzg==
X-Received: by 2002:a05:620a:4502:b0:7e3:2e02:4849 with SMTP id af79cd13be357-7e66d73f600mr4097485a.9.1753797228641;
        Tue, 29 Jul 2025 06:53:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2rZ50HIoP3F9/NtATSvU3RTcoTLz7GUYh9uMTOF98nuj610nPOwpQK2hdrfHtttMfHeiLQw==
X-Received: by 2002:a05:620a:4502:b0:7e3:2e02:4849 with SMTP id af79cd13be357-7e66d73f600mr4093185a.9.1753797228016;
        Tue, 29 Jul 2025 06:53:48 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6156591fe7bsm1187250a12.51.2025.07.29.06.53.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 06:53:47 -0700 (PDT)
Message-ID: <c67d7d8c-ae39-420f-b48b-d7454deb1fc9@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 15:53:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/10] dt-bindings: clock: ipq9574: Rename NSS CC
 source clocks to drop rate
To: Luo Jie <quic_luoj@quicinc.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Georgi Djakov <djakov@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Anusha Rao <quic_anusha@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20250710-qcom_ipq5424_nsscc-v3-0-f149dc461212@quicinc.com>
 <20250710-qcom_ipq5424_nsscc-v3-5-f149dc461212@quicinc.com>
 <20250710225412.GA25762-robh@kernel.org>
 <93082ccd-40d2-4a6b-a526-c118c1730a45@oss.qualcomm.com>
 <2f37c7e7-b07b-47c7-904b-5756c4cf5887@quicinc.com>
 <a383041e-7b70-4ffd-ae15-2412b2f83770@oss.qualcomm.com>
 <830f3989-d1ac-4b7c-8888-397452fe0abe@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <830f3989-d1ac-4b7c-8888-397452fe0abe@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=6888d26d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=RShGOoz45MAMUC7vXQcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDEwNyBTYWx0ZWRfX27t930sOIjGh
 cnWRvAfhX/EMYAE7/UFBAMo7oq4RGxdZJ0ARR/H2zVDQSjm/mQhovaneN0Ob47XmnaaUCJQwbYZ
 RlXhXH1Rpw9gZaZP1xSI6Z1cISr/9iT8Q/4IYOAXKR2ijOTNUyBwYXTDrs/yXn5ImYrHM3KEme2
 VlpbKbkG7ikyrtE/Xs/CZW6qo3FF1/FKtLSEuFSJCcgtUenvqiVFMz/4HorAadqCm16FZSSU66H
 zi9P8pM453hylrD9jGEPLzDtHaBZFInXI9orMaHjt1ab9TN98rECKGqgP/MzYJ5GvHBiDlq3LSc
 aGeXyK//GLroP8i/ALF427aBZJLyD2Yg1kTqpCMfql6HXmC+ZiCe1raV45370fD7PPNPA48Vrj8
 2UalRLi9ew3ao5KR+qQWWvEhsJAYD0gY6eONuyruZvot1KQsMhi0RsVK1y1geAQFyMQCY3H0
X-Proofpoint-ORIG-GUID: URwtEtqfQ4TSyIDCxWFzzMGeFEHeTQbE
X-Proofpoint-GUID: URwtEtqfQ4TSyIDCxWFzzMGeFEHeTQbE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290107

On 7/18/25 5:51 PM, Luo Jie wrote:
> 
> 
> On 7/18/2025 5:28 PM, Konrad Dybcio wrote:
>> On 7/18/25 11:12 AM, Luo Jie wrote:
>>>
>>>
>>> On 7/11/2025 8:15 PM, Konrad Dybcio wrote:
>>>> On 7/11/25 12:54 AM, Rob Herring wrote:
>>>>> On Thu, Jul 10, 2025 at 08:28:13PM +0800, Luo Jie wrote:
>>>>>> Drop the clock rate suffix from the NSS Clock Controller clock names for
>>>>>> PPE and NSS clocks. A generic name allows for easier extension of support
>>>>>> to additional SoCs that utilize same hardware design.
>>>>>
>>>>> This is an ABI change. You must state that here and provide a reason the
>>>>> change is okay (assuming it is). Otherwise, you are stuck with the name
>>>>> even if not optimal.
>>>>
>>>> The reason here seems to be simplifying the YAML.. which is not a good
>>>> reason really..
>>>>
>>>> I would instead suggest keeping the clocks list as-is for ipq9574 (this
>>>> existing case), whereas improving it for any new additions
>>>>
>>>> Konrad
>>>
>>> Thanks Rob and Konrad for the comments.
>>>
>>> "nss_1200" and "nss" refer to the same clock pin on different SoC.
>>> As per Krzystof's previous comment on V2, including the frequency
>>> as a suffix in the clock name is not required, since only the
>>> frequencies vary across different IPQ SoCs, while the source clock
>>> pins for 'PPE' and 'NSS' clocks are the same. Hence this ABI change
>>> was deemed necessary.
>>>
>>> By removing the frequency suffix, the device tree bindings becomes
>>> more flexible and easier to extend for supporting new hardware
>>> variants in the future.
>>>
>>> Impact due to this ABI change: The NSS clock controller node is only
>>> enabled for the IPQ9574 DTS. In this patch series, the corresponding
>>> DTS changes for IPQ9574 are also included to align with this ABI
>>> change.
>>
>> The point of an ABI is to keep exposing the same interface without
>> any change requirements, i.e. if a customer ships the DT from
>> torvalds/master in firmware and is not willing to update it, they
>> can no longer update the kernel without a workaround.
>>
>>> Please let me know if further clarification or adjustments are needed.
>>
>> What we're asking for is that you don't alter the name on the
>> existing platform, but use a no-suffix version for the ones you
>> introduce going forward
>>
>> i.e. (pseudo-YAML)
>>
>> if:
>>    properties:
>>      compatible:
>>        - const: qcom,ipq9574-nsscc
>> then:
>>    properties:
>>      clock-names:
>>        items:
>>          - clockname_1200
>> else:
>>    properties:
>>      clock-names:
>>        items:
>>          - clockname # no suffix
>>
>> Konrad
> 
> We had adopted this proposal in version 2 previously, but as noted in
> the discussion linked below, Krzysztof had suggested to avoid using the
> clock rate in the clock names when defining the constraints for them.
> However I do agree that we should keep the interface for IPQ9574
> unchanged and instead use a generic clock name to support the newer
> SoCs.
> 
> https://lore.kernel.org/all/20250701-optimistic-esoteric-swallow-d93fc6@krzk-bin/
> 
> Request Krzysztof to provide his comments as well, on whether we can
> follow your suggested approach to avoid breaking ABI for IPQ9574.

Krzysztof, should the bindings be improved-through-breaking, or should
there simply be a new YAML with un-suffixed entries, where new platforms
would be added down the line?

Konrad

