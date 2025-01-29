Return-Path: <linux-arm-msm+bounces-46500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE81A21C38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 12:29:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 881B8161FCB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 11:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594D519DF60;
	Wed, 29 Jan 2025 11:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vy8/RZuh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2959186615
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 11:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738150192; cv=none; b=HYDL7Jt5uRzJwlG5SlaoS1s39wvCjFQOk0sZAxGbCcC2ZIGXdd1+/LaeH4mfQKXfQ9osCFtA2EvwjAyjhl2ZAGsoDvMP0TcylS9oINWTDF7DbDM4W0A0IROJURbQi2khY5C06jX66yXbVZRcs3JT+cnERvYTmgdaxc7NsWv664Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738150192; c=relaxed/simple;
	bh=3s886Jw7KGXuHd6mFj5w9paPQmLHIEJE2yq98VVa5HE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QdVRb36JDjLRc8xBGKDt8LMLKa4vpbsHT/bzz9zk2swHW8iWTNr/pUMhVvLnPX8ZsG8g2rsax5Zd/xENFQUzKmBkNIjTEjtNfr8/CGUtQaqaACrCgmJ2yj6b0H3kayFw5NaaW/QuXDKEOqy95LbvF9/gIxe+VMbvcS/cFsvS7zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vy8/RZuh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T6SLei009997
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 11:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i9PrfLAmZgIMy86J/BuBNlzLt3qqCa2AcRVAnqXESEw=; b=Vy8/RZuhDVNhraUs
	ot/qrCqm0JWxEceWKB8RNHxPkb/aj15NWXMCVQCyQLYtS8scUB7QejOgsyNDQbiZ
	3AZGk5YK7btmmxhK9Ir91jZpL6mydaX+oiuOrcz1nnaPsKeOKm7PKn3GboJRxmWU
	23l4jaKDE3Qw8JLa/3bpYU05xpawqGhvOet1SRr9feqUXF7zS410O9P8AdtgrQSx
	7YcmXntDvQh0q2KEcDRbBdgSUMAk+B7o/Q9kGCdNutJXq+GFt+BrgEMMlWDCqM3g
	H+mFgNB25GrqOtMlNR241Wf5yRw7k+UfhFAVcjAVeMjiPjQ9LOqVMIlsNdWYQcvy
	7kOr8g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ff33rftf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 11:29:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7be6f20f0a4so102035085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 03:29:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738150188; x=1738754988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i9PrfLAmZgIMy86J/BuBNlzLt3qqCa2AcRVAnqXESEw=;
        b=ExKqVyV1/ad3e6prnsOzQAqn3xLSu3mw4vBCnc6of+NvAQokcYCQUGuedCdW1fredM
         6T2f3nG7dSeP1Ders7HM0jDD0baSGt1B/XfX31m1GOAQGOKyWegQq/SBjb9v39hsxkZs
         cIUr6vBYKI1OQHxnG/kfMnyrsEyKh4Vb9cIq2fja2aP59qSAgsys7DHKFB3l8tBWtB1C
         xs+gNamnQ8PUZXI/rfWGnL7msNfRX+J+x7WBMq6S4b+LBtBL0OkQPOyggSc4E2Nns5rH
         d9bY9yqHfi45tD6K2WeqQWvtnZYN2nmLB8oU/8JPMGJ/fAfJfe8k2Ely8k7rmNtnXdJk
         P66w==
X-Forwarded-Encrypted: i=1; AJvYcCVNVRXjibwCD9xFvNQD5peig6kH9gpWSztjNMAgQi8gXZ59amuN19XwA9RsCiKewh5tlHxZ2bOlnT/212Jr@vger.kernel.org
X-Gm-Message-State: AOJu0YxMX730RK3vzTwcdGpJrwjkNmzzJiZJlN0Tl72/1RZx5JngqaY8
	fhPSc5Vqz0gfBv2Ke8WQRZN2Pb+4yfaXQhya0ZCd0z4c6kRIUEwVg28iPSpjmN4r9F1ijvfbz/K
	YIlMFCjf0FUM5JY7DFR8dgqfDx3Wj3u/6F/1W1WtdVjZEaC7Stvi0WCDJH3L57aDi
X-Gm-Gg: ASbGncvhJxHai7zLbzHrnjaJE7MNOMCUgUkegjhniZihK3Us6wOJmLrDE70Ojr6aMWJ
	vWbgMftHhiExa7iebOXpN6FK8LVr8hyW37LEss6nm2H2IVXYfVjP2ZpxSuCpIQvBw+VXu2aYWmj
	Mvltx/vHCNv1fVSc+O8sbp0rJsBlQdmGyF+WJ1s/279Q/S0+p2KkkRn5WjYrL2thvBlthELUI31
	ZSLFMTwvsBsN+9vxcXIpxvqxRccwoCEL4pfm3Sdyh2k7yuuyN0JZ0gMflN6/1ETQ1srENadi+Lg
	aEGBrmRXFL+8rTrejjn6Hszo/uTuLR7nPfvEvGcVVcy2x9sDGibeyf9/RIc=
X-Received: by 2002:a05:620a:44cf:b0:7b6:e6a4:9668 with SMTP id af79cd13be357-7bffcda31f7mr141973985a.14.1738150188146;
        Wed, 29 Jan 2025 03:29:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHynGvu6Ug8OraeY+OA2aupmuSuiuP/SB6khBf0TMgvAsKh45ahlHKh8fb7ty74dKqVRcTTRg==
X-Received: by 2002:a05:620a:44cf:b0:7b6:e6a4:9668 with SMTP id af79cd13be357-7bffcda31f7mr141971985a.14.1738150187750;
        Wed, 29 Jan 2025 03:29:47 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc186283efsm8669980a12.18.2025.01.29.03.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 03:29:46 -0800 (PST)
Message-ID: <d928e662-07ac-4255-8d6f-adeaefb3db46@oss.qualcomm.com>
Date: Wed, 29 Jan 2025 12:29:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add PHY register retention
 support
To: neil.armstrong@linaro.org, Manivannan Sadhasivam <mani@kernel.org>,
        Qiang Yu <quic_qianyu@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>, vkoul@kernel.org,
        kishon@kernel.org, p.zabel@pengutronix.de, abel.vesa@linaro.org,
        manivannan.sadhasivam@linaro.org, quic_devipriy@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
References: <20250121094140.4006801-1-quic_wenbyao@quicinc.com>
 <20250121094140.4006801-3-quic_wenbyao@quicinc.com>
 <CAA8EJppXQpDrdXzJsTE7HWs=POt7yFAw0JVZFabN6Ks3fhZiWQ@mail.gmail.com>
 <a2cc5a5a-6cbd-7564-a8df-8af2a652de2f@quicinc.com>
 <ya27ma6iah7ts6sj35payj6ek4z7m6y5v4pnxd6wtqrp3cbyta@ypvrzwa4bnfv>
 <188a9efd-718e-4ac5-b89a-29f2713e1dba@quicinc.com>
 <20250124070829.oar3hlkshkpam57d@thinkpad>
 <88c29161-17a8-40c6-a94b-c894de15ca37@oss.qualcomm.com>
 <df1f825f-66a4-4bab-9ca4-90d594f2cb36@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <df1f825f-66a4-4bab-9ca4-90d594f2cb36@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6yrWBktOpuKodGKpkP_a-1FPaRsccbLa
X-Proofpoint-GUID: 6yrWBktOpuKodGKpkP_a-1FPaRsccbLa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501290093

On 29.01.2025 9:29 AM, neil.armstrong@linaro.org wrote:
> On 25/01/2025 14:10, Konrad Dybcio wrote:
>> On 24.01.2025 8:08 AM, Manivannan Sadhasivam wrote:
>>> + Mayank (with whom I discussed this topic internally)
>>>
>>> On Fri, Jan 24, 2025 at 02:22:01PM +0800, Qiang Yu wrote:
>>>>
>>>> On 1/22/2025 5:43 PM, Dmitry Baryshkov wrote:
>>>>> On Wed, Jan 22, 2025 at 03:17:39PM +0800, Wenbin Yao (Consultant) wrote:
>>>>>> On 1/21/2025 6:36 PM, Dmitry Baryshkov wrote:
>>>>>>> On Tue, 21 Jan 2025 at 11:43, Wenbin Yao <quic_wenbyao@quicinc.com> wrote:
>>>>>>>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>>>>>>>
>>>>>>>> Currently, BCR reset and PHY register setting are mandatory for every port
>>>>>>>> before link training. However, some QCOM PCIe PHYs support no_csr reset.
>>>>>>>> Different than BCR reset that is used to reset entire PHY including
>>>>>>>> hardware and register, once no_csr reset is toggled, only PHY hardware will
>>>>>>>> be reset but PHY registers will be retained,
>>>>>>> I'm sorry, I can't parse this.
>>>>>> The difference between no_csr reset and bcr reset is that no_csr reset
>>>>>> doesn't reset the phy registers. If a phy is enabled in UEFI, its registers
>>>>>> are programed. After Linux boot up, the registers will not be reset but
>>>>>> keep the value programmed by UEFI if we only do no_csr reset, so we can
>>>>>> skip phy setting.
>>>>> Please fix capitalization of the abbreviations (PHY, BCR) and add
>>>>> similar text to the commit message.
>>>>>
>>>>>>>> which means PHY setting can
>>>>>>>> be skipped during PHY init if PCIe link was enabled in booltloader and only
>>>>>>>> no_csr is toggled after that.
>>>>>>>>
>>>>>>>> Hence, determine whether the PHY has been enabled in bootloader by
>>>>>>>> verifying QPHY_START_CTRL register. If it is programmed and no_csr reset is
>>>>>>>> present, skip BCR reset and PHY register setting, so that PCIe link can be
>>>>>>>> established with no_csr reset only.
>>>>>>> This doesn't tell us why we want to do so. The general rule is not to
>>>>>>> depend on the bootloaders at all. The reason is pretty simple: it is
>>>>>>> hard to update bootloaders, while it is relatively easy to update the
>>>>>>> kernel. If the hardware team issues any kind of changes to the
>>>>>>> programming tables, the kernel will get them earlier than the
>>>>>>> bootloader.
>>
>> We're assuming that if a product has shipped, the sequences used to power up
>> the PHY in the bootloader (e.g. for NVMe) are already good.
>>
>> If some tragedy happens and an erratum is needed, we can always introduce a
>> small override with the existing driver infrastructure (i.e. adding a new
>> entry with a couple registers worth of programming sequence, leaving the other
>> values in tact)
> 
> Assuming Linux will be always ran directly after the bootloader is a wild assumption.

Situations like

[normal boot chain] -> [... (resets the PHY and doesn't reprogram it)] -> Linux

are both so unlikely and so intentional-by-the-user that it doesn't seem
worth considering really.

If whatever sits in the middle *must* hard-reset the phy, it can save the
register state beforehand and restore them after the reset

> Yes, we should make use the noscr if the PHY is always programmed, but we should be
> always able to reprogram the PHY entirely to recover a faulty programmation.

We aren't considering any possibility of faulty programming - it's either
programmed, or not. And if the values configured by the bootloader are wrong,
the device's firmware is considered faulty.

Most devices probably follow the exact same magic values as our reference
boards (though these values relate to analog characteristics, so perhaps not
*all* of them, which is another argument for keeping the BL state) and these
are extensively tested internally before any production devices make it out
the door. Any updates deep into the product life are most likely just "nice
to have"s and not anything critical, and as I've mentioned, we can still have
overrides with the current logic inside this driver.

Konrad

