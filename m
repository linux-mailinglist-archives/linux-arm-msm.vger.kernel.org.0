Return-Path: <linux-arm-msm+bounces-70933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAD0B37182
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 19:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA2D8367C43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 17:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00AE130ACEA;
	Tue, 26 Aug 2025 17:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZrnQRgWA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E175D3164A6
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 17:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756230189; cv=none; b=RegAhe1yIeSw+cRhtrz8VOS6DjEFOtyM0KjUVVV5Jr8+Si4mRHU8eOhhC227ZXvt4smeY+/+nfescMJZNatYCDVr5MGyVhIIR+gdGjmbXi+7r9XLb5FSKu0qwh0wBjUyiZqwTmKWWE0Xe+27tTTb2WYOQtY5ioKqWWlpvb3tsUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756230189; c=relaxed/simple;
	bh=bfnwVVloFhicPWzS7Y+TjlD2Uktumm4IK3dYzF+i4A4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uSolK5a7y4cXA4Ywlpzgqbf1CApKsApRU20kehG1niQVlBIFXTwoyVv3/kKcx4jygbzjCk8Q4trJXawUJ4dV6SShc29qUsh6N2L4+3AahYg3l9W96c5D4IsE2LJvJ1P2Y8BLZfhz/IPcpCs3rEvzeRRZaxPaGAKNwcla/Z0RzVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZrnQRgWA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QG4qrh002894
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 17:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xoedk/PMBK7pIAev2tYhMB+hGdIr3Of+XAwj6Xe0YVM=; b=ZrnQRgWAcP58BLSW
	5DMhu4AflIYc19Rsoo9nSSY0p4nKaLIw50jyGnXnYSzXFPul9RE5MvBTVxWE63Th
	6cpBHY6bKzz/X3+7zIy5ubkelnsR43OzuEiLtnXFmnmt9NXJ33rd1l1LWID3cu2J
	qGtf3YPlVHXRfYiad+nFavb5Ai6qCFZbvPE6hY5dzzS5AE0WpLAdxbKT4XdCcZ6B
	FCXp90p+h+djQcqRFgdwEAHA4LVip8dvHWB5HVCOjOUcSdCimGiUifTqT8mgjRci
	w+vKx+VCy+CInoISZqi0veuFxpNpnIJdZMPKlqr6pCReBo7O2+yaKizzNBtHbEGi
	KGCZRA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5we1pc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 17:43:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-248942647c5so728035ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 10:43:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756230185; x=1756834985;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xoedk/PMBK7pIAev2tYhMB+hGdIr3Of+XAwj6Xe0YVM=;
        b=kDB7YunVUgxknm6DDbfTYZKGMK2n3oBNm+yPKIESQZR7PryuLTJq8/+HlBRyPXCvp8
         /QvhEQD3FfYUbWZhTg2tzXLzXu6gfGJj4sBlKeW5DHgrau7rhJII2n5A+LGH/FaJRkKj
         Hglc30szfJkIvMGmKrAcEdoc9I2wWG1R7VHWWEiNurKEZPVVfxowCMFnKpNvT6T8B3W5
         +37yLgmugQb/gF/LWuaxRgJiQ4bVEE1JSLO+zZ4EqAR6OkCq0xPXG352VX33jXXPxobi
         WayCE9J6hvVM+d8C1hFt/sSRxBWN8d0OxlZY6d2X9o4YAT5+VtjI+8pROftFGmNwbTNQ
         Xp2A==
X-Gm-Message-State: AOJu0YzsaHeF9F7gZNyDPyZxbIWL3q0DEdx4+i9s2K1JgUTApyZfzJj5
	zcVxb4LhehKv4zCD0uz+N6BOAeQEF+mPGndEevwc0pjtrHrE0I8kcU3fMVVk9PDJFFL+aXuryQt
	gsbnMQwbnvNyzkGfetJ1H2Lvr2QFSLn81+3LFsWcJnbXqy5Ojcra3il/voldVlFS2Gwc8
X-Gm-Gg: ASbGncvvvViE4i3VNkSiobP4AK6PhsnDU0foNE/D7WDR39J+40f/XjSdZxgDmGePzyl
	QI+qjmZNl3JNOl5Jl1BuNbrbJwT96n8Lc1TeWdu8GY7GAHoazLiAfluVEYy7TBDbCf+ALuhazw3
	AhfPRUaP7VP7AohT3alBJzU9zUOBU9IMQQaXCFsFZT91LsQQ0/WlRBxImuJZccJPTuo65VLPQlN
	8R0WyUlOl1VFNOwEak2sQEwpOIoZsIfQ7DKaf1o0cfPQkkBseFzYsVVlTYmby2pBeuT5RFYqCCi
	lZB7x0G01E98lwIG+MUmUaiRxQ6q9clnN1fNDomegzoRJ0TE4psZnnFgB8q4anMKEu8G7hhxXGj
	eaIMwlQrXpbBzqSJ06FnJ
X-Received: by 2002:a17:902:f64c:b0:23f:b00a:d4c with SMTP id d9443c01a7336-248753a24e5mr30192145ad.2.1756230185171;
        Tue, 26 Aug 2025 10:43:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgXGumLPD8X74PC7IR8NcXfZiks8xk1E3jrVCWqnrTZoC+Lrzn8dfDYWV8lxkbiMkU71Rl3g==
X-Received: by 2002:a17:902:f64c:b0:23f:b00a:d4c with SMTP id d9443c01a7336-248753a24e5mr30191585ad.2.1756230184508;
        Tue, 26 Aug 2025 10:43:04 -0700 (PDT)
Received: from [10.71.114.175] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24668779fcbsm101621345ad.8.2025.08.26.10.43.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 10:43:03 -0700 (PDT)
Message-ID: <052bdaf1-37b2-4ee8-af6a-68912a152955@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 10:43:01 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] PCI: dwc: Add ECAM support with iATU configuration
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_vpernami@quicinc.com, mmareddy@quicinc.com
References: <20250822-ecam_v4-v7-0-098fb4ca77c1@oss.qualcomm.com>
 <20250822-ecam_v4-v7-4-098fb4ca77c1@oss.qualcomm.com>
 <a158c4f5-e9c3-48c2-b440-fa9dc281b276@oss.qualcomm.com>
 <c89fc295-0dfa-4910-838d-3520272cb26b@oss.qualcomm.com>
Content-Language: en-US
From: Mayank Rana <mayank.rana@oss.qualcomm.com>
In-Reply-To: <c89fc295-0dfa-4910-838d-3520272cb26b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ALNhs4C4lHw1F4LWpw1i2lSd7hWTsVkb
X-Proofpoint-ORIG-GUID: ALNhs4C4lHw1F4LWpw1i2lSd7hWTsVkb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX8GO42i6sJPZu
 bU7NR0IwT5G/De9LQdfbWIjVggayDjh9w81I21I5OyVDBtJmHOxM5hfl/K7gVnJBjnrFMZicQHN
 hNDDJT9u8zCPY7kR3dl64grpM1LXGuiFskB6rWIGD5tFeqrhvTN/5JRHdPa6kY+12bC/66076OS
 uOi5di96XIrEO+fhJeT7wkH7Aad9hs6jNb1jDA8Vdqrg2euTjuRkSZtjJaPsWokyVgDNowgN/fo
 oBS078m9Y0D361RRJijhtefiu0JLCkCBjPkFuFKMMIiqTVCYqWVn2hDQYO9sq20R5TyDnwEn7K/
 0xixEgjtNdyiBdC7SRFH+vKDzPnHtqOKMQD0JaFBqysYvBe8R6XnKtAW3k1Rz5PbIbKhOVkH2+Q
 06rS2EsN
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68adf22a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=CH8LhjkbK6pyuAcbkdYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033



On 8/26/2025 5:46 AM, Krishna Chaitanya Chundru wrote:
> 
> 
> On 8/25/2025 11:35 PM, Mayank Rana wrote:
>> Hi Krishna
>>
>> On 8/22/2025 2:27 AM, Krishna Chaitanya Chundru wrote:
>>> The current implementation requires iATU for every configuration
>>> space access which increases latency & cpu utilization.
>>>
>>> Designware databook 5.20a, section 3.10.10.3 says about CFG Shift 
>>> Feature,
>>> which shifts/maps the BDF (bits [31:16] of the third header DWORD, which
>>> would be matched against the Base and Limit addresses) of the incoming
>>> CfgRd0/CfgWr0 down to bits[27:12]of the translated address.
>>>
>>> Configuring iATU in config shift feature enables ECAM feature to 
>>> access the
>>> config space, which avoids iATU configuration for every config access.
>>>
>>> Add "ctrl2" into struct dw_pcie_ob_atu_cfg  to enable config shift 
>>> feature.
>>>
>>> As DBI comes under config space, this avoids remapping of DBI space
>>> separately. Instead, it uses the mapped config space address returned 
>>> from
>>> ECAM initialization. Change the order of dw_pcie_get_resources() 
>>> execution
>>> to achieve this.
>>>
>>> Enable the ECAM feature if the config space size is equal to size 
>>> required
>>> to represent number of buses in the bus range property.
>>
>> Also add 256 MB alignment requirement for using iATU config shift mode 
>> here.
>>
>>> Signed-off-by: Krishna Chaitanya Chundru 
>>> <krishna.chundru@oss.qualcomm.com>
>>> ---
>>>   drivers/pci/controller/dwc/Kconfig                |   1 +
>>>   drivers/pci/controller/dwc/pcie-designware-host.c | 131 +++++++++++ 
>>> ++++++++---
>>>   drivers/pci/controller/dwc/pcie-designware.c      |   2 +-
>>>   drivers/pci/controller/dwc/pcie-designware.h      |   5 +
>>>   4 files changed, 124 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/ 
>>> controller/dwc/Kconfig
>>> index 
>>> ff6b6d9e18ecfa44273e87931551f9e63fbe3cba..a0e7ad3fb5afec63b0f919732a50147229623186 100644
>>> --- a/drivers/pci/controller/dwc/Kconfig
>>> +++ b/drivers/pci/controller/dwc/Kconfig
>>> @@ -20,6 +20,7 @@ config PCIE_DW_HOST
>>>       bool
>>>       select PCIE_DW
>>>       select IRQ_MSI_LIB
>>> +    select PCI_HOST_COMMON
>>>   config PCIE_DW_EP
>>>       bool
>>> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/ 
>>> drivers/pci/controller/dwc/pcie-designware-host.c
>>> index 
>>> 952f8594b501254d2b2de5d5e056e16d2aa8d4b7..abb93265a19fd62d3fecc64f29f37baf67291b40 100644
>>> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
>>> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
>>> @@ -413,6 +413,81 @@ static void 
>>> dw_pcie_host_request_msg_tlp_res(struct dw_pcie_rp *pp)
>>>       }
>>>   }
>>> +static int dw_pcie_config_ecam_iatu(struct dw_pcie_rp *pp)
>>> +{
>>> +    struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>>> +    struct dw_pcie_ob_atu_cfg atu = {0};
>>> +    resource_size_t bus_range_max;
>>> +    struct resource_entry *bus;
>>> +    int ret;
>>> +
>>> +    bus = resource_list_first_type(&pp->bridge->windows, 
>>> IORESOURCE_BUS);
>>> +
>>> +    /*
>>> +     * Root bus under the host bridge doesn't require any iATU 
>>> configuration
>>> +     * as DBI region will be used to access root bus config space.
>>> +     * Immediate bus under Root Bus, needs type 0 iATU configuration 
>>> and
>>> +     * remaining buses need type 1 iATU configuration.
>>> +     */
>>> +    atu.index = 0;
>>> +    atu.type = PCIE_ATU_TYPE_CFG0;
>>> +    atu.parent_bus_addr = pp->cfg0_base + SZ_1M;
>>> +    /* 1MiB is to cover 1 (bus) * 32 (devices) * 8 (functions) */
>>> +    atu.size = SZ_1M;
>>> +    atu.ctrl2 = PCIE_ATU_CFG_SHIFT_MODE_ENABLE;
>>> +    ret = dw_pcie_prog_outbound_atu(pci, &atu);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    bus_range_max = resource_size(bus->res);
>>> +
>>> +    if (bus_range_max < 2)
>>> +        return 0;
>>> +
>>> +    /* Configure remaining buses in type 1 iATU configuration */
>>> +    atu.index = 1;
>>> +    atu.type = PCIE_ATU_TYPE_CFG1;
>>> +    atu.parent_bus_addr = pp->cfg0_base + SZ_2M;
>>> +    atu.size = (SZ_1M * bus_range_max) - SZ_2M;
>>> +    atu.ctrl2 = PCIE_ATU_CFG_SHIFT_MODE_ENABLE;
>>> +
>>> +    return dw_pcie_prog_outbound_atu(pci, &atu);
>>> +}
>>> +
>>> +static int dw_pcie_create_ecam_window(struct dw_pcie_rp *pp, struct 
>>> resource *res)
>>> +{
>>> +    struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>>> +    struct device *dev = pci->dev;
>>> +    struct resource_entry *bus;
>>> +
>>> +    bus = resource_list_first_type(&pp->bridge->windows, 
>>> IORESOURCE_BUS);
>>> +    if (!bus)
>>> +        return -ENODEV;
>>> +    pp->cfg = pci_ecam_create(dev, res, bus->res, 
>>> &pci_generic_ecam_ops);
>>> +    if (IS_ERR(pp->cfg))
>>> +        return PTR_ERR(pp->cfg);
>>> +
>>> +    pci->dbi_base = pp->cfg->win;
>>> +    pci->dbi_phys_addr = res->start;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static bool dw_pcie_ecam_enabled(struct dw_pcie_rp *pp, struct 
>>> resource *config_res)
>>> +{
>>> +    struct resource *bus_range;
>>> +    u64 nr_buses;
>>
>> As change is using Synopsis IP based iATU config shift mode 
>> functionality, it is must that ECAM/DBI base address has to be 256 MB 
>> aligned. Hence add change to check against alignment.
>>
> Just to clarify this is not Synopsis IP requirement it is PCie
> requirement. PCIe spec 6, sec 7.2.2 says "base address of the range is
> aligned to a 2(n+20)-byte memory address boundary". n is 8 here.
Clarify what is n is suggesting here ?

Agree. ECAM is PCIe spec defined feature, and it doesn't suggest how
PCIe controller handle iATU configuration to support ECAM mode. The ECAM 
address alignment requirement is based on the size of the access being 
performed, and it needs to be naturally aligned i.e. 32-bit access must 
be 4-byte aligned.

As here you are explicitly configuring iATU once using config shift mode 
to support ECAM, this brings 256 MB requirement with Synopsis PCIe
controller. Even for bus range 1, We need 256 MB alignment requirement
with Synopsys PCIe controller when using iATU config shift mode. The 
iATU of controller uses bits [27:12] of the original address to form 
bits [31:16] (BDF location) of the outgoing CFG TLP when using iATU 
config shift mode.

We can have ECAM mode support without using iATU config shift mode in 
which all config space access will require to reconfigure iATU for each 
config space access, and doesn't need to hold this alignement 
requirement of 256 MB.

Regards,
Mayank>
> I will add this info as a comment.
>> #define IS_256MB_ALIGNED(x) IS_ALIGNED(x, SZ_256M)
>>
>> if (!IS_256MB_ALIGNED(config_res->start))
>>            return false;
>>
> Ack.
> 
> - Krishna Chaitanya.
>>> +
>>> +    bus_range = resource_list_first_type(&pp->bridge->windows, 
>>> IORESOURCE_BUS)->res;
>>> +    if (!bus_range)
>>> +        return false;
>>> +
>>> +    nr_buses = resource_size(config_res) >> PCIE_ECAM_BUS_SHIFT;
>>> +
>>> +    return !!(nr_buses >= resource_size(bus_range));
>>> +}
>>> +
>>>   static int dw_pcie_host_get_resources(struct dw_pcie_rp *pp)
>>>   {
>>>       struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>>> @@ -422,10 +497,6 @@ static int dw_pcie_host_get_resources(struct 
>>> dw_pcie_rp *pp)
>>>       struct resource *res;
>>>       int ret;
>>> -    ret = dw_pcie_get_resources(pci);
>>> -    if (ret)
>>> -        return ret;
>>> -
>>>       res = platform_get_resource_byname(pdev, IORESOURCE_MEM, 
>>> "config");
>>>       if (!res) {
>>>           dev_err(dev, "Missing \"config\" reg space\n");
>>> @@ -435,9 +506,32 @@ static int dw_pcie_host_get_resources(struct 
>>> dw_pcie_rp *pp)
>>>       pp->cfg0_size = resource_size(res);
>>>       pp->cfg0_base = res->start;
>>> -    pp->va_cfg0_base = devm_pci_remap_cfg_resource(dev, res);
>>> -    if (IS_ERR(pp->va_cfg0_base))
>>> -        return PTR_ERR(pp->va_cfg0_base);
>>> +    pp->ecam_enabled = dw_pcie_ecam_enabled(pp, res);
>>> +    if (pp->ecam_enabled) {
>>> +        ret = dw_pcie_create_ecam_window(pp, res);
>>> +        if (ret)
>>> +            return ret;
>>> +
>>> +        pp->bridge->ops = (struct pci_ops 
>>> *)&pci_generic_ecam_ops.pci_ops;
>>> +        pp->bridge->sysdata = pp->cfg;
>>> +        pp->cfg->priv = pp;
>>> +    } else {
>>> +        pp->va_cfg0_base = devm_pci_remap_cfg_resource(dev, res);
>>> +        if (IS_ERR(pp->va_cfg0_base))
>>> +            return PTR_ERR(pp->va_cfg0_base);
>>> +
>>> +        /* Set default bus ops */
>>> +        pp->bridge->ops = &dw_pcie_ops;
>>> +        pp->bridge->child_ops = &dw_child_pcie_ops;
>>> +        pp->bridge->sysdata = pp;
>>> +    }
>>> +
>>> +    ret = dw_pcie_get_resources(pci);
>>> +    if (ret) {
>>> +        if (pp->cfg)
>>> +            pci_ecam_free(pp->cfg);
>>> +        return ret;
>>> +    }
>>>       /* Get the I/O range from DT */
>>>       win = resource_list_first_type(&pp->bridge->windows, 
>>> IORESOURCE_IO);
>>> @@ -476,14 +570,10 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>>>       if (ret)
>>>           return ret;
>>> -    /* Set default bus ops */
>>> -    bridge->ops = &dw_pcie_ops;
>>> -    bridge->child_ops = &dw_child_pcie_ops;
>>> -
>>>       if (pp->ops->init) {
>>>           ret = pp->ops->init(pp);
>>>           if (ret)
>>> -            return ret;
>>> +            goto err_free_ecam;
>>>       }
>>>       if (pci_msi_enabled()) {
>>> @@ -525,6 +615,14 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>>>       if (ret)
>>>           goto err_free_msi;
>>> +    if (pp->ecam_enabled) {
>>> +        ret = dw_pcie_config_ecam_iatu(pp);
>>> +        if (ret) {
>>> +            dev_err(dev, "Failed to configure iATU in ECAM mode\n");
>>> +            goto err_free_msi;
>>> +        }
>>> +    }
>>> +
>>>       /*
>>>        * Allocate the resource for MSG TLP before programming the iATU
>>>        * outbound window in dw_pcie_setup_rc(). Since the allocation 
>>> depends
>>> @@ -560,8 +658,6 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>>>           /* Ignore errors, the link may come up later */
>>>           dw_pcie_wait_for_link(pci);
>>> -    bridge->sysdata = pp;
>>> -
>>>       ret = pci_host_probe(bridge);
>>>       if (ret)
>>>           goto err_stop_link;
>>> @@ -587,6 +683,10 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>>>       if (pp->ops->deinit)
>>>           pp->ops->deinit(pp);
>>> +err_free_ecam:
>>> +    if (pp->cfg)
>>> +        pci_ecam_free(pp->cfg);
>>> +
>>>       return ret;
>>>   }
>>>   EXPORT_SYMBOL_GPL(dw_pcie_host_init);
>>> @@ -609,6 +709,9 @@ void dw_pcie_host_deinit(struct dw_pcie_rp *pp)
>>>       if (pp->ops->deinit)
>>>           pp->ops->deinit(pp);
>>> +
>>> +    if (pp->cfg)
>>> +        pci_ecam_free(pp->cfg);
>>>   }
>>>   EXPORT_SYMBOL_GPL(dw_pcie_host_deinit);
>>> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/ 
>>> pci/controller/dwc/pcie-designware.c
>>> index 
>>> 4684c671a81bee468f686a83cc992433b38af59d..6826ddb9478d41227fa011018cffa8d2242336a9 100644
>>> --- a/drivers/pci/controller/dwc/pcie-designware.c
>>> +++ b/drivers/pci/controller/dwc/pcie-designware.c
>>> @@ -576,7 +576,7 @@ int dw_pcie_prog_outbound_atu(struct dw_pcie *pci,
>>>           val = dw_pcie_enable_ecrc(val);
>>>       dw_pcie_writel_atu_ob(pci, atu->index, PCIE_ATU_REGION_CTRL1, 
>>> val);
>>> -    val = PCIE_ATU_ENABLE;
>>> +    val = PCIE_ATU_ENABLE | atu->ctrl2;
>>>       if (atu->type == PCIE_ATU_TYPE_MSG) {
>>>           /* The data-less messages only for now */
>>>           val |= PCIE_ATU_INHIBIT_PAYLOAD | atu->code;
>>> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/ 
>>> pci/controller/dwc/pcie-designware.h
>>> index 
>>> ceb022506c3191cd8fe580411526e20cc3758fed..f770e160ce7c538e0835e7cf80bae9ed099f906c 100644
>>> --- a/drivers/pci/controller/dwc/pcie-designware.h
>>> +++ b/drivers/pci/controller/dwc/pcie-designware.h
>>> @@ -20,6 +20,7 @@
>>>   #include <linux/irq.h>
>>>   #include <linux/msi.h>
>>>   #include <linux/pci.h>
>>> +#include <linux/pci-ecam.h>
>>>   #include <linux/reset.h>
>>>   #include <linux/pci-epc.h>
>>> @@ -169,6 +170,7 @@
>>>   #define PCIE_ATU_REGION_CTRL2        0x004
>>>   #define PCIE_ATU_ENABLE            BIT(31)
>>>   #define PCIE_ATU_BAR_MODE_ENABLE    BIT(30)
>>> +#define PCIE_ATU_CFG_SHIFT_MODE_ENABLE    BIT(28)
>>>   #define PCIE_ATU_INHIBIT_PAYLOAD    BIT(22)
>>>   #define PCIE_ATU_FUNC_NUM_MATCH_EN      BIT(19)
>>>   #define PCIE_ATU_LOWER_BASE        0x008
>>> @@ -387,6 +389,7 @@ struct dw_pcie_ob_atu_cfg {
>>>       u8 func_no;
>>>       u8 code;
>>>       u8 routing;
>>> +    u32 ctrl2;
>>>       u64 parent_bus_addr;
>>>       u64 pci_addr;
>>>       u64 size;
>>> @@ -425,6 +428,8 @@ struct dw_pcie_rp {
>>>       struct resource        *msg_res;
>>>       bool            use_linkup_irq;
>>>       struct pci_eq_presets    presets;
>>> +    bool            ecam_enabled;
>>> +    struct pci_config_window *cfg;
>>>   };
>>>   struct dw_pcie_ep_ops {
>>>
>> Regards,
>> Mayank


