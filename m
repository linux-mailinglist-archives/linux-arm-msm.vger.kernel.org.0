Return-Path: <linux-arm-msm+bounces-75098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F699B9F4E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 14:41:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C1A17AAD0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 12:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3077259C9F;
	Thu, 25 Sep 2025 12:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U3fPaKv+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB622586C7
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758804060; cv=none; b=DW/JzRLEuvPMMNlGodaXFfXOTaNkNgwKyE/sGdnmp0qT2chJkiqggXlN5l4FtuNt1VpSxLRFUD2eL1C1wIW9FkWcI2ojbfaIEqWtb82/SyurAXo7AcjRhghdyflLqU/tOkrMSRwyTliON5M5gXV4Y9f3li9FrpSyi3J7OIRvkc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758804060; c=relaxed/simple;
	bh=/OW6lUzbxwLTin4WGTyiZmS+jyErbQBXnuGUK9x0WhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fW8hNUE/llxgbNjcholoJWX5Rs+QIQAnWoVf3ISc6hxtDdlxD3T7REgCEeMc/gv2P0/wiAkV/nUqCNDuXPFpPVqbG8nfFgKh7unAvTt/E+FbRagCQisVCnvBUkSvJCR+sJ0BtTMr46iqn6XxZDyhXQMxxpmTj99o3SZ3e9d8CmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U3fPaKv+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9tCu3018069
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dX+D1iEBGYVg/0mxMRj6tDbZ+sqLumaACcaW1rJwVnE=; b=U3fPaKv+C8fOIdnw
	t5i1BryuxendNApb3lk/owoc6A5CE4t0vAa3NI8mDAAC3qHAVtaBhSFTLGqNz3EB
	tP5g8V2xNQetfm3aA3RrP9O8h3w0TkDYST0iHxwNh9AXOGN6FDgv0BI9KAF4OvMp
	TGTdXl//VhIgrh4BNBU8JjdVMq5s80ErxArZOVk6paM2Ds+3JSbCQTWTEHQWR0oI
	0M++lemmEHjGYwkgjbKZuB6E8HyGadPzrIM3kJ4RKFY7E6NxkIsdzOc0lrEPdxO1
	DweyXwInQwxYE6A80i99eY93gkQFMz9ioplLTHPapeY3OJd6mpR3N0K3+zEOtyqa
	W5jaKg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kkc206-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:40:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7cc365ab519so2272496d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 05:40:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758804057; x=1759408857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dX+D1iEBGYVg/0mxMRj6tDbZ+sqLumaACcaW1rJwVnE=;
        b=J/KKXHT7M8YVcMRztU6HDcGxivE+KdVBLDk+bgw9BHqUQYCQGjNfmpnEIC3/PBQw3w
         bZnMIFtKXvUefW7bMtGkEhfHGtORq2KWqIFhmY9rhX32WEYKniyaKYiNbUWZFNMib6FZ
         i9/Ked+VQBDISYErw71WxGFMcCU6icAnGaXEjXRtx4ExUwyQ3F9ChdFn/6VVbqJktPLv
         GVIDzxyrBTPqgva0TI2qLbaVyZTTfTDnP6Od2Jt+Fq6JVwGxJxoe/JhMeiYMnFbEYVl2
         2r8WAuwz/WegeB7FN/u5vTX6aHZekHnkzJ/RhytE18WoRh8k5LI9N0NTmWojKi+QCGQj
         udqg==
X-Gm-Message-State: AOJu0Yz0IdQ68eA8/jMfl2WpIZxw7AHn54XhJBF0H1S3YWuRlIdCnoHn
	gyy0a+aRaoDRfW26r0pkNb9O6L2BQ18Mwb5xE/39b1jFEB+HN1Ahj19tq20ewlFIK0dt1jQxa19
	D3SNBuOwdLymr8JqTD08VgyTZw8tODAn0HPgZl0EluXgZhTgJVlBXqHfsUcBQTY9VTLfP
X-Gm-Gg: ASbGncszgRs7xu1DYJqUq0lbwRoTk2wh77Z5gAit7e2FGhvqcP7ac6JE2EXt2o4dmm/
	dWWoPvcLzls4rTTotAtqQ+Xthyr+kGZSCvnwUuOp1bHoMHQf5VNUycFUhIU9EaecAWCuvql0DbH
	YqJR5k1gFCqTmA5On3w1rxvUMfrl8gNxLRboXOEkc9JBMCmVuIP9E3eStYous1kMlyZZ2XADUhU
	FsneWYsZ8SW6GEFN/WqVtGQ2xZeyIxvR/86j69+09/Q97J+AJ3rstz1ruSUSF+khWPn9KV0qF9F
	wn5fX9jn0wEFSIYU8CrkkRLcszj2o1PI3qNV+uA2DiGc+sg/l/huZNps7sM8w5pwk41sL2QrdTO
	d/OcaqA44SKHdsmI8GEAJUw==
X-Received: by 2002:a05:6214:ccd:b0:78d:5496:9c37 with SMTP id 6a1803df08f44-7fc4517a623mr30484326d6.3.1758804056880;
        Thu, 25 Sep 2025 05:40:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXVJM0xECADX1ZAwjsmy3/RHWCnfUiY4Eb/4L8Ww/2YsN/Z1WGetVGzxOOKsKP6XRMousjmw==
X-Received: by 2002:a05:6214:ccd:b0:78d:5496:9c37 with SMTP id 6a1803df08f44-7fc4517a623mr30483966d6.3.1758804056184;
        Thu, 25 Sep 2025 05:40:56 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3af4cccsm1148079a12.37.2025.09.25.05.40.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 05:40:55 -0700 (PDT)
Message-ID: <f4e7a388-54fd-42a7-8960-be6a3de7ec6a@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 14:40:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: document the RPMh
 Network-On-Chip interconnect in Kaanapali SoC
To: Eugen Hristev <eugen.hristev@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Georgi Djakov
 <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-interconnect-v1-0-4c822a72141c@oss.qualcomm.com>
 <20250924-knp-interconnect-v1-1-4c822a72141c@oss.qualcomm.com>
 <ea291acc-bfdc-4a04-ba60-fc59a55ada28@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ea291acc-bfdc-4a04-ba60-fc59a55ada28@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3fQQVDUGJ0zKMP1XbvokYK7W1RA_DSbd
X-Proofpoint-ORIG-GUID: 3fQQVDUGJ0zKMP1XbvokYK7W1RA_DSbd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX4kU1ppx7N2VA
 meRn3PQe1o2QkpOmLGMjRtTyMmULmf4ZcgitAmmb3IgRRwuzJDsxb0AKV/PoKIr3lYagisiH2iS
 tpHe+xf4iy9mE9DG4LRUr0wq6IRL6amb3S3DcWwKGOPckgEtg+i3MnrKu/xQ2bgyVGe0bemcun8
 rzj9w3pjISMiNhIXhAzrpFRzEqhQl2r/9+wycEOMj7+F3dSEHlrkAn0isy5Hicvgsux9cRxUduU
 SrhUAr7VrxksKVqA737fFFLp1q0XuQS6lr+Zs6gPQZk2n1rAL/RiqVpvRs1HpZpfAKEiM5xpoUZ
 vWJvQSgkqrjVFw7fSoUqc3ncnkMP05zgsIhd1dbDjVhf07rftT6/EEkEs95nxAklKy61ZQWjX7H
 2TR6wUZ2
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d53859 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=o1Okg1vRPMB1M1hlrKAA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

On 9/25/25 10:57 AM, Eugen Hristev wrote:
> 
> 
> On 9/25/25 02:02, Jingyi Wang wrote:
>> From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
>>
>> Document the RPMh Network-On-Chip Interconnect of the Kaanapali platform.
>>
>> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---

[...]

>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,kaanapali-aggre-noc
> 
> Hi,
> 
> Does Kaanapali have a single aggre node, or there are several ?
> On previous SoC, I see there are two (aggre1 and aggre2).
> Also in your driver (second patch), I notice aggre1_noc and aggre2_noc .
> It would make sense to accurately describe here the hardware.

They're physically separate

Konrad

