Return-Path: <linux-arm-msm+bounces-60709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D1FAD2CB6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 06:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 999153B0529
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 04:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EE091D7999;
	Tue, 10 Jun 2025 04:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ir40oDxu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A006720E711
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 04:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529938; cv=none; b=nA6Dk+NyS+2qhXooQpqm/DUOPfGO7aRiCwgtpBFWnTi/CGVfIADEc/37UU/QJGIR1ku6VF+sGjmd0sby9rNPwOvimy/Bc591KOWq7zGeLEX0PN5sUduicTZ7IqM61+Hh4s+XBGAU6z+Wlg8Efn3lPmEwEzk5ufGYf5ZOfbn5rLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529938; c=relaxed/simple;
	bh=TB4ZNWBCjvGt5BSqyUv7p1TpCvZYbANGsyyzTWwm7fs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZbrYvpSvpap1NYXcGex76AvZd2OCcy87loEx85jx1JI8JpY3H/CjZNbAfQHeBAesxWzLedaApBwTOIQci+sEEqZ5Q+94INI7dZX9dgsXVY3Enwi1wILB3or4xyoDhMfq4YDGiASBQPK43DW+NFTWV+PapgCgUgtmr7vkjwikmNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ir40oDxu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559KP2v4017798
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 04:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVojJfQxCgn9ocPcE61oqYb8TABL5BLk+mOuJMx8dC0=; b=Ir40oDxuy+0dK6Tu
	pPQsgqXKAczMfd4hQshrPn32D2SrqDbreazix7cjUZzU5cncbpNmD3jxNndEnrwY
	m1Qfjbpf6Dr7dbEILXFR/vOc7cCz8asnrAkMemp/1IY5ykFN3LPwkJy8yAav/JXA
	T7cfmB1ZbCHwCD4J+d32gcOfV822mHPTKakvYuhXEItCJk5yH31jNN/ZTIYDt0Ue
	O+KD8VgYEMOP5IkU8T70lSDREdDZAKB4q6nXxldU9adIVXfbSUUbD11XVu/TVKdV
	1k/1kXhDDTZxkS3RwBEAS5NEUi57fim20VYnCoMVSY4J5/EkF0BXwMhU6NabtRiS
	Nu38xA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4766mcgvf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 04:32:15 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748269c6516so2952695b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 21:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749529934; x=1750134734;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QVojJfQxCgn9ocPcE61oqYb8TABL5BLk+mOuJMx8dC0=;
        b=hm8li7XiB6ft75H713v4qiL6Jvvyy3oavZfbCjZ431sW8dH4KnhMKc8U4+a7rZky3p
         2pd63eqUvwDolWwIhCIuVLuH0kHIZN0ljM8orNQLiaGZp6uNtoEAj0CEkoDskPuhml0o
         f2QCI52wKLhbvL3l8HiPpF8m92wyQcs/0AY9nVu5LrFDUPUUCq9YwjrpAfDqvr0R252J
         KJljO2KadKXybbRgl9Bq9RPme8nrROBlYqR5kQoGgNfUk3wWzn2ZU+BvCVlu5RuIc4OW
         1w6fUHW+aZjXV92zZ+4ri4r0nLIy+VVgHforbMMiPymZFx95LWmtcO8fuzWBYaDaXPog
         0lXw==
X-Forwarded-Encrypted: i=1; AJvYcCW0V+Z+HIYjYweYB11rAF1Im3tEyIdjwhOJcNhSy68HlDTE0Obd/WxIEqWhwC7bObdXspbvk4U+XH9RwWce@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjsuq2kh02BESeIcYQN3oc4LLpo3laAAX45F2BN1aTZrxQ+c3d
	K/TkW7NtvrvI7HiRc96Mwwm/AbUiU5LeqWgfTxx3uEDdhLzZ+SuluF8fsssZqZaaIrvYT69vkrN
	2UiMQxMA+YHkn9JYLyOAlKwHyxHTCHLgB+J84LCI7EF3hfxkUG77E7cl6OS15xz9phhhL
X-Gm-Gg: ASbGncuIegu88yBl6cvLasaPjeSfvBU4sgjEbn93HdQMkL2wOga7w5XpE4+Ted+FWWf
	WRGU+Y4iv3uZginKBv80El0IZ5H3yYOOBf5SouJdScFU4sVSBFudUcrVsIFt0af9E3GRCJgDYX8
	15qeReondzIsjw0buXxeP90UM9WM6G7sQDpCHALt9I/asTcsqA+WAjbO4CtkX8WgXD+HkXbZ6i9
	oO13cm6fFowcf4xFfq/j2YT99Mq6BDKZeHt7D1Ok2q/Q6RtlZ9AyYkYpo40o9hk9WqPKY+B24g9
	bXRnnUxe7m51wPRrVYbKJCfpdIDrLR5mUIFG5UDjZjbVSZTFJV13
X-Received: by 2002:a05:6a00:806:b0:737:9b:582a with SMTP id d2e1a72fcca58-74827f3dab7mr22525866b3a.24.1749529934155;
        Mon, 09 Jun 2025 21:32:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7R6T2DzqqmZ8Jol0wT/yDgeRhUuXAjB/gYgVGkR+i9HNrdnkufPipZQ3OQAkvTjhT+YzTpw==
X-Received: by 2002:a05:6a00:806:b0:737:9b:582a with SMTP id d2e1a72fcca58-74827f3dab7mr22525827b3a.24.1749529933756;
        Mon, 09 Jun 2025 21:32:13 -0700 (PDT)
Received: from [10.92.214.105] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af7b2aesm6771668b3a.61.2025.06.09.21.32.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 21:32:13 -0700 (PDT)
Message-ID: <c1e34051-1c7c-0ac3-f447-6c86254cddd9@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 10:02:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 2/2] PCI/portdrv: Add support for PCIe wake interrupt
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Helgaas <bhelgaas@google.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, Sherry Sun <sherry.sun@nxp.com>
References: <20250609162930.GA749610@bhelgaas>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250609162930.GA749610@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T8KMT+KQ c=1 sm=1 tr=0 ts=6847b54f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IGDvqKsIrZGBqitOJ9wA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: DQVxhrHuzkochtPmeWh_hGB2tNeTWWV4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDAzMiBTYWx0ZWRfX9FcRNPRbkz7Q
 UYECbAmmjkWWdmKGRBBhR2tm6eF2EsDnBorZQO8QW1WVwrLuyzw1uhx2Rv056qyXiBYPDYV4Xno
 bidJD3cnntTS4pZhFHR8hRYIucORdzqDfMZUDULa0ffOnzKJhDaYDY29NgfrfQSdtvvQNkVwp91
 9yVIA1LoQOA0/x+muo35eoGTdScnLZ6m6QOkTloxX1CbyEEs/52xeg54EKMOnEdEW7XAWrD8f2V
 S7yGbm5ndcdZhvO6vBJDFC33vWw7C8RdjlRjpgIhoP9+VKbRH+GW8B8lR/ONzjZeJN7FN1XeFyX
 rNy5batkaG3djEazCtYN+QBBpaZF1o17Irp3/tvpCVsM0G8/bjq4JE3aJMusd0kfKDdofKOkPiv
 BCpIKndFihb8vlYG3WEl0rtvMGSvdOJ/2YRfx+8mAXj9jspBlY67eQ9WU5B/Hk6kvZht8x3k
X-Proofpoint-GUID: DQVxhrHuzkochtPmeWh_hGB2tNeTWWV4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_01,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 phishscore=0
 mlxlogscore=815 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100032



On 6/9/2025 9:59 PM, Bjorn Helgaas wrote:
> On Mon, Jun 09, 2025 at 11:27:49AM +0530, Krishna Chaitanya Chundru wrote:
>> On 6/6/2025 1:56 AM, Bjorn Helgaas wrote:
>>> On Thu, Jun 05, 2025 at 10:54:45AM +0530, Krishna Chaitanya Chundru wrote:
>>>> PCIe wake interrupt is needed for bringing back PCIe device state
>>>> from D3cold to D0.
> 
>>>> +	wake = devm_fwnode_gpiod_get(&pdev->dev, of_fwnode_handle(dn),
>>>> +				     "wake", GPIOD_IN, NULL);
>>>
>>> I guess this finds "wake-gpio" or "wake-gpios", as used in
>>> Documentation/devicetree/bindings/pci/qcom,pcie.yaml,
>>> qcom,pcie-sa8775p.yaml, etc?  Are these names specified in any generic
>>> place, e.g.,
>>> https://github.com/devicetree-org/dt-schema/tree/main/dtschema/schemas/pci?
>>>
>> I created a patch to add them in common schemas:
>> https://lore.kernel.org/all/20250515090517.3506772-1-krishna.chundru@oss.qualcomm.com/
> 
> Thanks.  I think it will help other DT writers if we can include a
> link to the relevant dtschema commit in this commit log.
Hi Bjorn,

I have added this link to the cover letter, I will add the link to
this commit in my next patch as this make sense to be added here.

- Krishna Chaitanya.

