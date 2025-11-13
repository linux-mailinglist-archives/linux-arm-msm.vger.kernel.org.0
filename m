Return-Path: <linux-arm-msm+bounces-81512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5A5C559DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 05:04:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D5F73345FCF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 04:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F388E1CAA92;
	Thu, 13 Nov 2025 04:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hubZx4GB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T3D9hfi8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF7123BD02
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 04:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763006643; cv=none; b=iPfwB28VBDDujcWqdIEW5Kglh8YqYuI+UJcJegkZa3oD7874bObCK4g4udIb+Kojkom1bwIVnB05iHrGCZH+jk4zQ091olFk3o/KqrDSW3jrxTt6qci0w8LeGLjBhlanrxSatVr13oaRrNzPZ9BoEJCUWJvjLG0YujDiH0Uf9og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763006643; c=relaxed/simple;
	bh=MUNKng4zuK+De37mxEJHBIec28nwsSOTnrrVaNWMjNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TCQnMnf/eIclBAiYU8U/f3W2XyCfza14SHKQYyWKR+sw3hGBM92mmC6t2Xer0VzdN7jRTbM3gsWe96taXuH/27qiN3I5pexy0Hzkw/mazsSbL5SVQjwYB+N3GCxYXSbRnhojZycT7gnjboImfOJB7q2vTkvi9FVX8qW+ZZ1Zy1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hubZx4GB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T3D9hfi8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD11MZ12962626
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 04:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GPJpt5Oy7kmUT5fCIU62vIFh0Ga6M8GbNgzCpubObcg=; b=hubZx4GBqbrSTc3R
	1h4jlACAdfrSicm9jWER9qtwrtE+eBGZIC5ZHqGME3cYJ9bvtUfWvwcw2KCcVKR+
	kk6nmTs8RJP41XBlEfhrOW2xrH3rXNmyifpcBgNuIPYRcrEv4ILo2GvXxlzibOqs
	AGFJr29/LKkU88n1MpnoTakzVmC7bXxa4dqInxr4oSw0vreIBjb5twCwk9IwixJm
	40Zp7msJHAIW7pen9JwPeCP6ItaVkXEF6waS4u8HPvbpoT2wOgkRyd5Ags+DpMwH
	qrlL0AP12FbWU5EY0EuUFUkjhmCBaTiY3p7PKk7NpfZXjOUT3PIcTQh8aCz1J0Lo
	tIn/rw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acwbpt12m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 04:04:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29557f43d56so4678005ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 20:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763006640; x=1763611440; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GPJpt5Oy7kmUT5fCIU62vIFh0Ga6M8GbNgzCpubObcg=;
        b=T3D9hfi8wWWMstKFzFkUGIpR41wRAOTPy1oxuJq4/ZUJ1wnwcBiAmkHO5YrPj1pTum
         lDWIJAmZ82b0q9N+eeUBuVOqVnNd8R8/OJzHpuyWDvuJ/9idXJje1X4cG4v9ka5jZUhO
         Eqc4ulYSKUFk3HPTGQ5NOzr3t80eSUusHFglD3Zi21ddrQdh63QAQ8jR2cQ2s2EnQw+C
         xxuvjhR3xDr9fZpjmqCPnqd2rEg9XwlQECs09Fgr410bB1j6yl8J8EP9cim85ivmg6M1
         tlmEQ5eU1ccPH+TnxYVs48XcGupYAwKHAQZeHezjtiJWtj78gPcrUJBvnfLm2E8TzMVT
         xI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763006640; x=1763611440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GPJpt5Oy7kmUT5fCIU62vIFh0Ga6M8GbNgzCpubObcg=;
        b=MX4q4SuE9GsViEG8daXdJH8kFdgsZwVSO/ZhfBXLe2nm6WyIMzV4IsW4lrfzIJFePm
         p9Mjir+FAESSPQ0M95xEjDpkSvQb4V3RQZGeRYt1QhqF7gf0iv4vKYhV+ExLTLFIVUhI
         lPh+VjSWcCxkPjqLfMErrKbstS9LocrkCzqlbfwbJvV3PlZzUuH6Fa8Mglj6s9dBMtzM
         qYxM2qqo5+JOKYhRSUPNOxnSrZeSKiJ1eJuVzFws09cKEcotDBFwLBJIwDUiaOLUeQCb
         UGxbGua4BG22jxFqjk94ELCjX3sbUEZaChLJnKUODMatGkMCGgOuH7o9RI8PMtVlDjrQ
         c5UA==
X-Forwarded-Encrypted: i=1; AJvYcCXfVPWbVlqlfYp1yqE0yYl2EI1lEi2fcQxqnAq4VX0F9BQO3N6JIEprBj96mWYM52FzP0eOMB73+CJjwsLN@vger.kernel.org
X-Gm-Message-State: AOJu0YxR5zcTM7qcTkSQuTbQRwXEHx3yVEAQ9tGbAZPYlKiwgAADJIGq
	iOW4648435Nfl+wRVSyBwa4nCVl0NzVVr5hD6vPZDdOtxSNz/tXltHe7rA+GbafCkFQwo10BDsK
	kyNRnJIu87NH9i4ZZpWVy2+ok0/X31G3C1fYV7wde6vvcQE7vfkgglY7ScspWo0zhWsIM
X-Gm-Gg: ASbGnctSLA8UF7v2QMIgX2bUx7ioEkJiHRk7de0wCdbz09RIAdt8XFR5sYU24vgyjt2
	3XJEAF0zaO3RakGaVaxAtW9ydq4MoHXfi50Apkt4l3pUlrsTqBQ/m9KBE62V9mh8TpEYQfS7RCs
	WvSvYPl83g8AZemSU5JynfvlaJQ2cNp6BFT3b92TLAZYTYfhCsRPyVScnfERWEwVxP0vyex+TpM
	eg4X/7rtkZGTXVafslZRa7Kw/hcLOu24G3nC/Y11pVX14qbsMjBxbLXEj4dET8YSDxaRM0cyxxH
	2+UO9yx+DaNaDv3EjiBnR1pWnU0TDpjxTg8ChiOS/QUXCGfoIVdfRq4wWetz1ldJKIExTqFhTBf
	jrIt3NNnNfDZb7nR4TqhPOL6I+n6nlcI=
X-Received: by 2002:a17:903:286:b0:298:8ec:9993 with SMTP id d9443c01a7336-2984edc8d47mr70965435ad.38.1763006640456;
        Wed, 12 Nov 2025 20:04:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGoFRhJNw42eQuq+D0QE8iC+rBpNLW5HJcqLuc033QSYVpJfp+TOEttapJRjQnS91FE3zxN/A==
X-Received: by 2002:a17:903:286:b0:298:8ec:9993 with SMTP id d9443c01a7336-2984edc8d47mr70965115ad.38.1763006639930;
        Wed, 12 Nov 2025 20:03:59 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0c35sm7753505ad.52.2025.11.12.20.03.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 20:03:59 -0800 (PST)
Message-ID: <44c7b4a8-33ce-4516-81bf-349b5e555806@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 09:33:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] schemas: pci: Document PCIe T_POWER_ON
To: Lukas Wunner <lukas@wunner.de>
Cc: andersson@kernel.org, robh@kernel.org, manivannan.sadhasivam@linaro.org,
        krzk@kernel.org, helgaas@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, lpieralisi@kernel.org, kw@linux.com,
        conor+dt@kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
        quic_vbadigan@quicinc.com
References: <20251110112947.2071036-1-krishna.chundru@oss.qualcomm.com>
 <aRHdiYYcn2uZkLor@wunner.de>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <aRHdiYYcn2uZkLor@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NvjcssdJ c=1 sm=1 tr=0 ts=691558b1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pqN9LwBUSSWNe87m4-kA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: WDNInOjSJVDUsJvvz6NmC4uezRCazCCR
X-Proofpoint-ORIG-GUID: WDNInOjSJVDUsJvvz6NmC4uezRCazCCR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDAyNCBTYWx0ZWRfX0L+x+SWEFf43
 Mk+8isVKv43+d364XxVex4ftjC07UMHpQ9iVGoYwxyVIYGtVuoFYGLlEmWNJXKxKLuTb2jwN+qh
 F/Ak65iEIu4uzOBBvV6QU2zo1JGGMq3sd3cxXgsbeylAWGkXMGzlqNBAgIQ8FykeNey9GAsXbZ9
 Cnyr1N/PcwPgGiw1Hh9k3i6Bh3O4zvO84s+Rx7gBKXX14jYJV51aTYKyBQnLQ9vMv5M2ntNKR02
 tjssI28H7mQuERlc41uayCJIpcu8SuGP0ABLgcTIqb8stm08mrjWJAGXQTQ1eYazSJJsHfwrAq9
 rn4bjDTrm7wfFRhyJ8T7VMBFtxzBH7YQAiGop7jnjU14T1apxtcevzT3nTicEuYrv57EgTRFAT2
 r/DWZMIK1nkrsmCK1FzuFqRtUBl+JQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130024


On 11/10/2025 6:11 PM, Lukas Wunner wrote:
> On Mon, Nov 10, 2025 at 04:59:47PM +0530, Krishna Chaitanya Chundru wrote:
>>  From PCIe r6, sec 5.5.4 & Table 5-11 in sec 5.5.5 T_POWER_ON is the
> Please use the latest spec version as reference, i.e. PCIe r7.0.
ack.
>> minimum amount of time(in us) that each component must wait in L1.2.Exit
>> after sampling CLKREQ# asserted before actively driving the interface to
>> ensure no device is ever actively driving into an unpowered component and
>> these values are based on the components and AC coupling capacitors used
>> in the connection linking the two components.
>>
>> This property should be used to indicate the T_POWER_ON for each Root Port.
> What's the difference between this property and the Port T_POWER_ON_Scale
> and T_POWER_ON_Value in the L1 PM Substates Capabilities Register?
>
> Why do you need this in the device tree even though it's available
> in the register?

This value is same as L1 PM substates value, some controllers needs to 
update this
value before enumeration as hardware might now program this value 
correctly[1].

[1]: [PATCH] PCI: qcom: Program correct T_POWER_ON value for L1.2 exit 
timing

<https://lore.kernel.org/all/20251104-t_power_on_fux-v1-1-eb5916e47fd7@oss.qualcomm.com/>- 
Krishna Chaitanya.

> Thanks,
>
> Lukas

