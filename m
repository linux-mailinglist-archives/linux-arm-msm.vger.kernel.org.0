Return-Path: <linux-arm-msm+bounces-77865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D75BECC78
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 11:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B00DA62432C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 09:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068B828D8DF;
	Sat, 18 Oct 2025 09:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gRrEm74c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5607E2571C2
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 09:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760779523; cv=none; b=W3bAydPY7UI48RVnDReETuS3EiEJmK/CzMEBI/Gll7Tv0Z7XhaNVAmSkviPFKP9B7Jgti/rXiR+eVE2AIWpS77kuQcOX474HkNXQyXLcfUNqFegX+Vmz4P+touCsIfCQyVUaAjXib82l0Qi2ak3Bd7KkNTISW5MpLxfdiW/enOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760779523; c=relaxed/simple;
	bh=KVvDpU8cWny/IsaxMprp6ClDCn/39UbEnGQXzrbslOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NXrCYm7yUxs8mU1tQ/TDak5hiTZ0VDqNMzwn9ONtRNg88i3GWH5T5jeJQ3tzUtB4VQqq35sJaZ9BVgjKO/6ySOGujyYlkha70wF8/9IWVHfZxEwlarpcHFAwQCQf+QWdFZgBiz1ACkf/6TRB90FRSoBQFHloDRzRjwtV/Rpr36M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gRrEm74c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59I81bQW030703
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 09:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Ogq17zuJgrBwLUyHJBik8HaQnFhDvO3zs76wTR60B8=; b=gRrEm74cJNddd5J5
	L7OqH4b23apE0h3ZZVZvReRKwBnUQuC0u7DWT9hvZ0XvbrUEOMzYtzwXkhSpXre2
	nTvughkUEX8YFnnluPtF7XD0x5rADgyo71/cTg8BbVdSCZKK/Oi9o17y3tG9NhdW
	l8nbLKlT70fhYhbLbS2HAdCLBmr85vrQ3ssz2NHD/9n3E2Bx5THqYQ2jjApFNm8y
	2N8zGEZUrzBiXvDViPxNAHrQ5IadV3DXkjeYVmEaZV/sZa0iC8U4x1XucmnuOHya
	8qeqt822I8uV3u7ogzvM1B/I7NBUWtHKzTvkWZy8cMuC66l0uUdN0O4J3gjDwlaP
	21Gakg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08p8rvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 09:25:20 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b62da7602a0so1979534a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 02:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760779519; x=1761384319;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Ogq17zuJgrBwLUyHJBik8HaQnFhDvO3zs76wTR60B8=;
        b=tuHNVng1LRIByz80KcQZnPBJIyKO7OzgqLaWz6jIdTjgJXsCc2bHMMzLTDwRY5UfL7
         G3LNg1RECOKtoJmFqUlunPtUoOaONvt0nkywZUZy2r8rq/Hcy/nDj4+y8lflJM1iVNEu
         WcaVF37/hRat0j+Jloa4rj4KRCVFoqyVuEkyA8Ew3jHubn6cU9GsexvSVxPy+CuncqzJ
         cGNMfC1dcUg5p1aE7jt6i6lS9+Y66GyOlq9WD75NGid5IYctvn1AS14x60K6B9QJKiBh
         zpaWavG4maBgDXEkC8pV5Ho+ZK4zs8ig0xf8WnR41SD/u2Mtk3+4wCs3iW2AsWzq5X4X
         q/1w==
X-Forwarded-Encrypted: i=1; AJvYcCWS9fOPM47lbm+NFE+NB05cR3KnQZrivb4iLwZAu1AYr69jk5sTIVS3DZ15WViPWk8CqnSPYsgg9uLNdQP4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy30nDgYignQ5dJuxAvnvAoNkvcyrY/wK3Oz3cZ3hhTP65nKv5H
	0p50vMo3ckK1We1rGKgalktjt2IOWg7VPxuzqfeDLWv+Zw/hRXYeQOPN80WUEhsTkrKrb+Orkfk
	AO1nHXXxdZVH5nGIo+Dnu5RNAJ/7Dtu0ZKjqNPEFrgKMw0QWqdiE5M0Apw29E8UYHutA6
X-Gm-Gg: ASbGnct9jB3DUEtvLlTUtdJXalo4Cy1JZ5HaN+9vmYSXgChCe1DDSRIX1h1hUjk698N
	+y5vTG2pUBwqCXiI+FW/34LbwH6PAX7wni9nuqqToAYlT1Z0xAeF7XXcb/DhUdqdN2w+gWzbH32
	y7Oz7NP7dyW3HeNTwrk/47ERxlwpyMpgoKV0rn3ooXH1HekCWmuMGNSonZKkrlRit3TxUSMtSNF
	Lx74/HY5xXKvPubWE/vdJTSFyYkXvmrXECwwPq2XYB9cskYHINJO3DvAbQ05cigbwNd1JPQl/eh
	jPuH0v8IJTFUVSvSzkYaY4KS3zp3oYq8m4k0XxYD9ZZ+deehfAUF0wkD8QiU7Zpi2vOf3z8RGpW
	4BwLoKwpV+3vgkjy13xN3B5pZRrkDU/kTXGY=
X-Received: by 2002:a05:6a20:4323:b0:2f4:a8f:7279 with SMTP id adf61e73a8af0-334a862e040mr9773296637.54.1760779519412;
        Sat, 18 Oct 2025 02:25:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVWG8EuY0mF3PY3ppTV5mDlwk0Eq3Yi16l3SLbLvJeJ2thfHVArqaxLIVoNfb4IQQemIbABg==
X-Received: by 2002:a05:6a20:4323:b0:2f4:a8f:7279 with SMTP id adf61e73a8af0-334a862e040mr9773276637.54.1760779518866;
        Sat, 18 Oct 2025 02:25:18 -0700 (PDT)
Received: from [192.168.29.113] ([49.43.226.255])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76673a86sm2132488a12.10.2025.10.18.02.25.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Oct 2025 02:25:18 -0700 (PDT)
Message-ID: <0bc6eb69-029d-45f4-a723-c003ecbb11e5@oss.qualcomm.com>
Date: Sat, 18 Oct 2025 14:55:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] PCI: dwc: Fix ECAM enablement when used with vendor
 drivers
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <helgaas@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Ron Economos <re@w6rz.net>
References: <20251017-ecam_fix-v1-1-f6faa3d0edf3@oss.qualcomm.com>
 <20251017191005.GA1041995@bhelgaas>
 <mtxez55p4hfvtmhcnwtxeetzqxydyq5e4g5zsdhytxpzgvgeqn@s7asinok5l22>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <mtxez55p4hfvtmhcnwtxeetzqxydyq5e4g5zsdhytxpzgvgeqn@s7asinok5l22>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX7pL5DqHW2zHL
 GzI6thnP+vnB55v45reNUHRTjBAEbDhlHQkNHwhj1/PAh7Zr9TH10WIukLfYhF+6ZvooEVnzMav
 OQDNcDdf3vu1YURsT6Ajk/eEsKLEnsG/5FAD2hpbrD8ZqlIgykDd1ivY58kDre+ktZmNi2uDgwi
 OGuUl/y6/mHzQuS5c16bR1HS9yIL0gqO7O/RC6yu4a2StdJv57VL4CPCXGP6l5g1URyVI3bz1h6
 Lor0qTCbQT89T2geL0DrOIckzC7QBkP8x6JLe2ncSSDkRXoWjfg5QkoQGQ0qRrdcPQa7RqRRE2t
 bMPJ8DwaciP46aGS1NnQHvrIeYr9DhTJ1z+PTUIQGgm99IKNNzNQAre0mpk2MTBy1AU6+Q1jq0x
 +MQhgPSf3Y0o6zE7hTwe7czfJEdz0Q==
X-Proofpoint-GUID: irkdUYKuFZVBpI7pnFH6NYx6SmHZveAI
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f35d00 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=r8OtbAjNO6w9l/f+plF4pQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=HaFmDPmJAAAA:8 a=EUspDBNiAAAA:8 a=UQbOXMLpRsKdYNi8uUUA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=nmWuMzfKamIsx3l42hEX:22
X-Proofpoint-ORIG-GUID: irkdUYKuFZVBpI7pnFH6NYx6SmHZveAI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-18_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000



On 10/18/2025 8:39 AM, Manivannan Sadhasivam wrote:
> On Fri, Oct 17, 2025 at 02:10:05PM -0500, Bjorn Helgaas wrote:
>> On Fri, Oct 17, 2025 at 05:10:53PM +0530, Krishna Chaitanya Chundru wrote:
>>> When the vendor configuration space is 256MB aligned, the DesignWare
>>> PCIe host driver enables ECAM access and sets the DBI base to the dw_pcie_ecam_conf_map_busstart
>>> of the config space. This causes vendor drivers to incorrectly program
>>> iATU regions, as they rely on the DBI address for internal accesses.
>>>
>>> To fix this, avoid overwriting the DBI base when ECAM is enabled.
>>> Instead, introduce a custom ECAM PCI ops implementation that accesses
>>> the DBI region directly for bus 0 and uses ECAM for other buses.
>>>
>>> Fixes: f6fd357f7afb ("PCI: dwc: Prepare the driver for enabling ECAM mechanism using iATU 'CFG Shift Feature'")
>>> Reported-by: Ron Economos <re@w6rz.net>
>>> Closes: https://lore.kernel.org/all/eac81c57-1164-4d74-a1b4-6f353c577731@w6rz.net/
>>> Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>> ---
>>>   drivers/pci/controller/dwc/pcie-designware-host.c | 28 +++++++++++++++++++----
>>>   1 file changed, 24 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
>>> index 20c9333bcb1c4812e2fd96047a49944574df1e6f..e92513c5bda51bde3a7157033ddbd73afa370d78 100644
>>> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
>>> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
>>> @@ -23,6 +23,7 @@
>>>   #include "pcie-designware.h"
>>>   
>>>   static struct pci_ops dw_pcie_ops;
>>> +static struct pci_ops dw_pcie_ecam_ops;
>>>   static struct pci_ops dw_child_pcie_ops;
>>>   
>>>   #define DW_PCIE_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS		| \
>>> @@ -471,9 +472,6 @@ static int dw_pcie_create_ecam_window(struct dw_pcie_rp *pp, struct resource *re
>>>   	if (IS_ERR(pp->cfg))
>>>   		return PTR_ERR(pp->cfg);
>>>   
>>> -	pci->dbi_base = pp->cfg->win;
>>> -	pci->dbi_phys_addr = res->start;
>>> -
>>>   	return 0;
>>>   }
>>>   
>>> @@ -529,7 +527,7 @@ static int dw_pcie_host_get_resources(struct dw_pcie_rp *pp)
>>>   		if (ret)
>>>   			return ret;
>>>   
>>> -		pp->bridge->ops = (struct pci_ops *)&pci_generic_ecam_ops.pci_ops;
>>> +		pp->bridge->ops = &dw_pcie_ecam_ops;
>>>   		pp->bridge->sysdata = pp->cfg;
>>>   		pp->cfg->priv = pp;
>>>   	} else {
>>> @@ -842,12 +840,34 @@ void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn,
>>>   }
>>>   EXPORT_SYMBOL_GPL(dw_pcie_own_conf_map_bus);
>>>   
>>> +static void __iomem *dw_pcie_ecam_conf_map_bus(struct pci_bus *bus, unsigned int devfn, int where)
>>> +{
>>> +	struct pci_config_window *cfg = bus->sysdata;
>>> +	struct dw_pcie_rp *pp = cfg->priv;
>>> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>>> +	unsigned int busn = bus->number;
>>> +
>>> +	if (busn > 0)
>>> +		return pci_ecam_map_bus(bus, devfn, where);
>>
>> Is there a way to avoid the "root bus is bus 00" assumption here?  It
>> looks like something like this might work (it inverts the condition
>> to take care of the root bus special case first):
>>
>>    if (bus == pp->bridge->bus) {
>>      if (PCI_SLOT(devfn) > 0)
>>        return NULL;
>>
>>      return pci->dbi_base + where;
>>    }
>>
>>    return pci_ecam_map_bus(bus, devfn, where);
>>
> 
> I guess it will work.
> 
>>> +	if (PCI_SLOT(devfn) > 0)
>>> +		return NULL;
>>
>> This essentially says only one function (00.0) can be on the root bus.
>> I assume that someday that will be relaxed and there may be multiple
>> Root Ports and maybe RCiEPs on the root bus, so it would be nice if we
>> didn't have to have this check.
>>
>> What happens without it?  Does the IP return the ~0 data that the PCI
>> core would interpret as "there's no device here"?
>>
> 
> I hope the read returns ~0, but the idea is to catch the invalid access before
> trying to read/write. In case of multi Root Port design, I don't think we have a
> way to identify it. So maybe it is safe to remove this check.
>
For multi root port we may need to revisit this, currently along with
dbi there are some other registers iATU, elbi etc. So there might be
chances to read these registers like iATU as part of enumeration and
these can return non ~0 values which will have adverse effects.
So we should have this check for now.

- Krishna Chaitanya.

> - Mani
> 

