Return-Path: <linux-arm-msm+bounces-67975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3123B1D425
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 10:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AABAB1884F81
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 08:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FFD02185B1;
	Thu,  7 Aug 2025 08:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zw0Hlf4P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D590D1B7F4
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 08:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754554550; cv=none; b=tOc9c/ddoEjhrjlqJrZWhYsWbJsjn9j4v5RehXqhjFGOO6G4yF/3tpczvmyN0BUwM0VhiMDbY1GgnM8NNt31SiagaqBjj/NX8lQ8lymiiMMHG0sTTX4EyGkEYgF46aAEJwtKFJk/luNj7JkpvKEwDIVziP+SWrZyopTiGgjXAk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754554550; c=relaxed/simple;
	bh=r7B6Q+7VnOlSFD9dmRU69c6xXNsKJZl6lpeNkdeAlW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tMWrqia+xWObDSdRsn+aNc+u1ZpSJDQ/61qL4XlJEiPPhqb0cGRxbyKbFQ4nKISMow29jWhyBu5qrbbtpUowlTeN8dFnvKf0+cdnZbHuEN/iUphTzLJuu2Y0Rk4balFfLXQgOs5JDeoRMvjbcpvrQ5+ZYS0CbjOi/VfO2xEiN+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zw0Hlf4P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57723WYU013404
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 Aug 2025 08:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8FFkztz/vOpS42siZaTzrJaru4LZfNmwJ6q9DN41I/Q=; b=Zw0Hlf4PZ+FqrUk2
	meWkuRneDRHwocs9It4DIeEOTI0KAJIwAK3QcCnNNUaq3LaBzpVE4wIYeE9sdLJH
	HGQF2wv7yH20XDwoHYLAjuMDAzEBeHKTeEMlbJ75UUcI0pjrD0DExHbG2RvpDWVr
	XIZNyMJP89xuUgf+nSAHGqXmYMxZiLmRCXs8WEY8NoWq6IfD9MTGwCMLvFF6W2no
	DDn9ptcD4weuqS/fzSgx7uHQs/RPHM8holEp5JzkXVw6/s7DBOskZnBqI9sbnz/Q
	7ngqwm7mE0CT81iwMAjeFmABHKyC1/YK+Z5JywDJfuiXWGus50O1tYL3KKXiAux/
	ZC/5Bg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpvvwj1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 08:15:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23fe28867b7so9619085ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 01:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754554547; x=1755159347;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8FFkztz/vOpS42siZaTzrJaru4LZfNmwJ6q9DN41I/Q=;
        b=kQmyMPiHTuMlRu/dMRGAlBdc080tn2vQSgt1kCONEGRpUFQaDtU5NkXkxPys0b3bE5
         CwlDxP8ySAXm5CFwYSSurZ6mmto3tYXXI6/WzwLOZMsc9npCpfFksXTcW+EWmMUlOl7d
         hKjHq4FzxcChBITm6lHyU2IocpEywUmcj8JNguNYLRXmpDJK48RZ+GQ97VKUWtkDz6gz
         jJul5W8tAMcqhmdyAGM6AvQOW1Aij4UCNHYAKVa5INaLzK9gSBNw0v9FfDHLMg4uV8Cq
         EqMMUK8LELs3WFb3QJlAfwP7lhoLp4Xj6N1x49KVraJHXhvwJ8ctgw3YlWE8mnbJXWnf
         IM0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXSy2i6iRyVBkWngAQGXCueaqrgcw326+nEC5arL5LfY66YnLhOp7s8oCRYXeynorOynWmeLFdY3PD7KCO8@vger.kernel.org
X-Gm-Message-State: AOJu0YycD80hVtVpSAkdWoGJJgi05JuX0isu4HOqebBK2/aPftzIando
	y0XwTxGQIxlbVJgPk+B62bgSqME5duL19/PkEsHrr2S0YuaH/3qi4oLjZ/L05bBmDZSImAipqRp
	hkIsesAbwIkaW5XfcNub5UoVaXhnDpNvBGovKFrj3y+a9GTWatN2gtJy/7hY2nYMy1sXK9bVr/M
	D4
X-Gm-Gg: ASbGnct2VKOrPHsnCHjus+xV8BZujOefcqXv5ps1z33lhjl7w5Z4a6C6RFORHciXVX1
	+hdU4tmPB9TAC51zET+A8bWkNfjrPpm4xPBzDMZZRQwBtNm5ivU/U5gRlOAAsheBCCTRn7UBNYf
	ufsOy/LRwt1O5dDNgcVXqJY3uFyl7NlMDD44ZsoDRSu/gxO9nTsn0cH65Y0KKZnWxG41YxbUGjk
	N7+E1KXqwqMkht7HYVxEGdBCyEgPR2djsLlaCNRzzyBuR+4yHsG4Fdfcmh/rMiGbVs7Ur/bq9VQ
	pWitVaTU8l60z/OipeubAokR1wqIuwIvSS5w3VErzcGQVlZhRCeigKHVn8oovfCpzjlZsQmndg=
	=
X-Received: by 2002:a17:903:189:b0:240:3d07:9ea4 with SMTP id d9443c01a7336-242a0a91131mr91223225ad.7.1754554547103;
        Thu, 07 Aug 2025 01:15:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzSnmBX83MC5kqRMV7W1QAuTOZBWwPl92I78BofL/XeVsXz8pCRHuSkr0ugBp8auFgWzSvVA==
X-Received: by 2002:a17:903:189:b0:240:3d07:9ea4 with SMTP id d9443c01a7336-242a0a91131mr91222775ad.7.1754554546546;
        Thu, 07 Aug 2025 01:15:46 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef65d2sm178661625ad.31.2025.08.07.01.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 01:15:46 -0700 (PDT)
Message-ID: <7118392a-2a19-44a4-97c0-d5e8a3190c08@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 13:45:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] bus: mhi: host: pci_generic: Read
 SUBSYSTEM_VENDOR_ID for VF's to check status
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vivek.Pernamitta@quicinc.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
References: <20250710-sriov_vdev_next-20250630-v2-0-4bd862b822e8@quicinc.com>
 <20250710-sriov_vdev_next-20250630-v2-2-4bd862b822e8@quicinc.com>
 <luaoyvwqp3fpvqgybhstnnrutn46ry3tyfxw2launvnxzfvyqo@pdfdpfocfq6k>
 <1c79cda0-2645-4f88-a05f-9082e305fad4@oss.qualcomm.com>
 <tynmkh4isrbi473zh6t4kd5bswrthxy3garhgpzafq6n2wrmqk@rfanfjgciyqv>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <tynmkh4isrbi473zh6t4kd5bswrthxy3garhgpzafq6n2wrmqk@rfanfjgciyqv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eKfaYhyGxH8ugvE8jU5B3XFiNRdAphXd
X-Authority-Analysis: v=2.4 cv=GttC+l1C c=1 sm=1 tr=0 ts=689460b4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=uIgEQj9WjdynuVTCvEgA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: eKfaYhyGxH8ugvE8jU5B3XFiNRdAphXd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX93tWYqu+aKCH
 8QbB7WMy9DK4ODLYv+D73H7FiMEwBE7GKlo09/QAL76Zg3uhPU0AkSIbaDMkS9ofxJuNcKhppkY
 CY6srb1e4ut4dM8YxHKXVNwoAN4CwWmmPYHyV6hcZ5SCVCETC6Te1zxQ1zcIWMnOTNbiiErGmfy
 q/rT6mDP9uDjBfslm7ppQDVpBYl57DtstEfdsXgneRvaxEydZhXGjCm24xvP8CtAhWtZScrxtO1
 BBeaTqXfqM+dnUD7m44eq3IjvgxmxgT25dC2A+IfvWO+evVEKySvgAWbS4yr2aCrSLtiE3jdTRG
 6SuoYNyOQ089JI6hpd8m8fX6Ke6Lne7TufQZACkcChWKW4dBUGG54fbn4CXoBa/ahdOrayZrH3H
 oNi8ogsR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009



On 8/7/2025 1:43 PM, Manivannan Sadhasivam wrote:
> On Thu, Aug 07, 2025 at 12:39:26PM GMT, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 8/6/2025 10:29 PM, Manivannan Sadhasivam wrote:
>>> On Thu, Jul 10, 2025 at 02:28:33PM GMT, Vivek.Pernamitta@quicinc.com wrote:
>>>> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
>>>>
>>>> In SRIOV enabled devices, the VF DEVICE/VENDOR ID register returns FFFFh
>>>> when read (PCIe SRIOV spec-3.4.1.1). Therefore, read the PCIe
>>>> SUBSYSTEM_VENDOR_ID to check if the device is active.
>>>>
>>>> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
>>>> Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>>> ---
>>>>    drivers/bus/mhi/host/pci_generic.c | 6 ++++--
>>>>    1 file changed, 4 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
>>>> index 7d0ac1c34ddf95ace2a85e5f08884f51604d9b0f..4bafe93b56c54e2b091786e7fcd68a36c8247b8e 100644
>>>> --- a/drivers/bus/mhi/host/pci_generic.c
>>>> +++ b/drivers/bus/mhi/host/pci_generic.c
>>>> @@ -1025,8 +1025,10 @@ static bool mhi_pci_is_alive(struct mhi_controller *mhi_cntrl)
>>>>    	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
>>>>    	u16 vendor = 0;
>>>> -	if (pci_read_config_word(pdev, PCI_VENDOR_ID, &vendor))
>>>> -		return false;
>>>> +	if (pdev->is_virtfn)
>>>> +		pci_read_config_word(pdev, PCI_SUBSYSTEM_VENDOR_ID, &vendor);
>>>> +	else
>>>> +		pci_read_config_word(pdev, PCI_VENDOR_ID, &vendor);
>>>
>>> You should not read the sub Vendor ID for VF. PCIe spec suggests reading the PF
>>> Vendor ID for VF. So you should just use pci_physfn() API as below:
>>>
>>> 	pci_read_config_word(pci_physfn(pdev), PCI_VENDOR_ID, &vendor);
>>>
>>> This will work for both PF and VF.
>>>
>> This will defeat the purpose of having health check monitor for VF,
>> as we are always reading PF vendor ID and will not know VF status at all.
> 
> Do we really have a usecase to perform health check for VFs? Health check is
> supposed to happen for devices that can fail abruptly.
> 
yeah as VF is not a physical link we can disable health check monitor
for VF's in the probe itself.

- Krishna Chaitanya.
> - Mani
> 

