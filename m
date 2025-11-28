Return-Path: <linux-arm-msm+bounces-83781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 304A3C922AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 14:45:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1FD954E3828
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 13:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA4622A4F8;
	Fri, 28 Nov 2025 13:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D40JwBYc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dFikcREW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD4B32AACF
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 13:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764337512; cv=none; b=jDil5F/EVEG0TXWkDC5P0yEbhA7mGGbEIwPE22LqCbQuwFF//4FzX/BJKOBEK049bGhVcV1SKOTFiDyMRuMsr8OlDQuJ6OI6ZkjMtQlbZvUNiifmqZ5PizWLt9KK+byA9CEREpfkvyqXqASu2lXocLhLxRDramn5/zVu61CtvQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764337512; c=relaxed/simple;
	bh=HcZSMtPxYYDm2H+B4ynOD3NDlKaC/gZ94QvNAf73zK0=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=QFPpz6HrJWBZjEaO00/ZMxQNw0B0mQuUpOJc3olYvvB4TYdueg2Mo1KuQSUFZoca+3Nzmqkxo4SVuOB4vy910MelORzsBppa0VvGSUY5UQQSzV1lRljpk1OelVHSMKbR3ZB0t8QSB+4tMiBDLgYk844FtT8nv+Nn0JyxFZluRNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D40JwBYc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dFikcREW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8PBEw3919383
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 13:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6YyryhNyygboe2JvHqFf5MSM
	jhcrOpz4yYfzU98fo3A=; b=D40JwBYcqs5NnYnL8h52mHgXRtiJNyGmwQoJE7cS
	6GY9GALwqf7VFRYVUnZbpZWhBmb1h6PjxVXEYjLdvnh73HGCSUSu3NJSkhwCAszW
	e/xvrwtjU5QWYtRlCvcCh/myw4IkL9w7GT6vf0QyIrCS8DWxwJiGU5DKXlOLuv1g
	zQihRlOLAe2iPFqxHHE4kAr0wfwan7xpiXo6ZI7fqrTzIbldLrQ3/vrB5Ajdhui4
	4vC5jmZvAHoDRjbZEit0KYBB3hQTxd0yRv7POReM4WdnFKKCYQLUVpCoKTqBVoEd
	CcaPreSzHWnlwwWvNq9GFbirrIzAQ9Yifsj1kyku3CN3ng==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apq66k3gr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 13:45:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2955f0b8895so27877025ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 05:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764337502; x=1764942302; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YyryhNyygboe2JvHqFf5MSMjhcrOpz4yYfzU98fo3A=;
        b=dFikcREWHKShL56oU2cKb3ZW5M8I36refBX1l8a5I+g7HVHbWpjaPTC6/8f9SVvfCr
         4mfA5QgwutOJ+k3LJ8wfxWU6xgeqNGWWE+7OlCYVhjdRWAowbYmYpP4FJgA8bAgChXVZ
         Y3R5/IYm/CIaLZzeuyOVdirDdx/oDaymO2NPQo2tArEPBfIuCx3ashpBDa/6YwgI1ZTS
         0rqdh+bnRfVHV2UPAMdEfb+vuDgF88FvPSB8EkvRjx+OPQAuOaSaAwGh3Mw4GHQkl0OU
         mWNcnwAvsKLZ6zvgTmc2n4osQttXnXYH9H/Zi9yF3VPUVnTMx+NpSEpGSN+EpkX+cVyI
         +8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764337502; x=1764942302;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6YyryhNyygboe2JvHqFf5MSMjhcrOpz4yYfzU98fo3A=;
        b=Rh3Q581fgdk+mZVAEZ/EjxnktThbMEBFxV50/CJwBZGn/5ZoAh1NT4hiWq/dxSR8jc
         6w8rWZnld3Q8o+CtmbPXwIaoZ72/slDXKVMey2BtGxyoiUZtjhPJk2GKAUBFbqtiRool
         G5OGnqBPIeEkMoPThqdcCJTCCGWRX8UAVjLIMbhJaqkF+wZhP7BMijGGM9gkdxPMsBaB
         w42BPc/AxfLK340Ao1CWWuapUPnTvZvVHY12AOgf35zpiFhCFZsjHsctTjgzYZyTjD7d
         96kRW98/1/O5VRbOQ76uVpt7v3i05Odd4boqE2w9o3ChXJ+pyNaYguLawARPVYM+FhFB
         BQNg==
X-Forwarded-Encrypted: i=1; AJvYcCXX1mwuulbSlLrMsMaUNoVjh6qVc6+UEI9JH4ACxMnQ++uP/BAzQtVBaobNIuNG8/Sb2/Kxje6uI0ET/XhP@vger.kernel.org
X-Gm-Message-State: AOJu0YwOfL2Yd2V52um546s1MogDW5kEj98+IseLoGu+rN0swzPJJO+M
	uy/7O/gckFPlh4odorx0PQbq5AANOwn4BrSL7QK8jNWtUOCTvijnCClvhYLpM8FvLlHQC3aC3QX
	gk5djgqQrZsC6R6eThWCKm1aX1AvFsGSzuXLJjlWfhwuysrn8vhcjklgdfV4UHcp/SeQO
X-Gm-Gg: ASbGnctAbsDg+wpcG21yczW87xRAEJ1tAirlW1bibP+y8HIoEv2sSuS1dFHFIfegLgc
	UgBrGFrlv2VbZlvXCTVBQjWlLjYEPeIW0Nkju9VYHMUOI0yb9/MRv4CRJV9LUNEHn9HwlVHOxAx
	gZ7iM1MMNiRnWbbTcFZcoflb1F4E65FnC8r+PfWiPFY0aF2ZKQzQWnDMNmnwy/cF88IIGJBPwH7
	+i8Hga3/100r4JV7FYRjQGcnQ4I6Ol815ILxpnm93duDvEe7JUOfM9mFUgTnJpPqXYSMuoVhraZ
	f/hLAT3hkfRwmglBXCm7sw4GUYx0OkhkEVH/vFXz+u+yOFAH64HG5Crm4/BVg9wkTCXZS7h8pHp
	SNyQhlZm0rzN1BNi1qHrY4cKIaFNaJ+FJgRBM1x02DQ==
X-Received: by 2002:a17:902:ea0f:b0:295:28a4:f0c6 with SMTP id d9443c01a7336-29b6bd53abamr329509795ad.0.1764337501439;
        Fri, 28 Nov 2025 05:45:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9TkAK8Rmvf0zxxdLd2ijdUeVHt1sgppFq66t5hDBI6qct1c8VXLlLvqtfClJadzxEfdM7VA==
X-Received: by 2002:a17:902:ea0f:b0:295:28a4:f0c6 with SMTP id d9443c01a7336-29b6bd53abamr329509475ad.0.1764337500900;
        Fri, 28 Nov 2025 05:45:00 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce445927sm47808035ad.37.2025.11.28.05.44.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 05:45:00 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------1nJtw7LajxHAbIw02IPdWaj5"
Message-ID: <cabf4c20-095b-4579-adc1-146a566b19b9@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 19:14:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] PCI: dwc: Support ECAM mechanism by enabling iATU
 'CFG Shift Feature'
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Jingoo Han
 <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar
 <alim.akhtar@samsung.com>,
        Jonathan Chocron <jonnyc@amazon.com>, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250909-controller-dwc-ecam-v9-0-7d5b651840dd@kernel.org>
 <20250909-controller-dwc-ecam-v9-4-7d5b651840dd@kernel.org>
 <alpine.DEB.2.21.2511280256260.36486@angie.orcam.me.uk>
 <c7aea2b3-6984-40f5-8234-14d265dabefc@oss.qualcomm.com>
 <alpine.DEB.2.21.2511280755440.36486@angie.orcam.me.uk>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <alpine.DEB.2.21.2511280755440.36486@angie.orcam.me.uk>
X-Proofpoint-GUID: z_php4T6i62qzINR36ptMaTIccDT7Plf
X-Proofpoint-ORIG-GUID: z_php4T6i62qzINR36ptMaTIccDT7Plf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDEwMCBTYWx0ZWRfX4cMDM9uSewof
 e7p8MF3pjonML3MEeukeXOxH+mJw2+CpTvdedCUqMD8Xd/EEKp0hGvgbTZ/Qw9/OGdwGxrCx72X
 9QEngEiS+bhBSZMYf7MXR6ugheiSEZAJ5GRhPf4791wV4ATD5WzM4GQeL0ZEUnKKj56hVqttBmj
 JcA81gDFfkA3hp03SVRcaWiDQojTA+s/EpKLjV+grDiTBrd40dRymr5I/dARmTF1sWbXgEFmlD6
 HisgK/BMbylXCDUkLmKSVmwTzcFYyXKgPvHdycQUlyliLg3337MEhdDq3a8EOqFf/n4b0QLMfXU
 In8QDOOxj22mdVTgcmitxjd20NzvGBCFIucsVtG/Cpv7ZtmRWngCZxJazIeaRVOEyFyFc/qR4os
 7MkUsd0MTna55Rzjm2bMQTkphQNoOA==
X-Authority-Analysis: v=2.4 cv=BYHVE7t2 c=1 sm=1 tr=0 ts=6929a75f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=r77TgQKjGQsHNAKrUKIA:9 a=bdmupUJtxhvzhX6DKHMA:9 a=QEXdDO2ut3YA:10
 a=x4N52Ti7FsAKUhfMTz8A:9 a=B2y7HmGcmWMA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280100

This is a multi-part message in MIME format.
--------------1nJtw7LajxHAbIw02IPdWaj5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/28/2025 2:07 PM, Maciej W. Rozycki wrote:
> On Fri, 28 Nov 2025, Krishna Chaitanya Chundru wrote:
>
>>>> Designware databook r5.20a, sec 3.10.10.3 documents the 'CFG Shift
>>>> Feature'
>>>> of the internal Address Translation Unit (iATU). When this feature is
>>>> enabled, it shifts/maps the BDF contained in the bits [27:12] of the
>>>> target
>>>> address in MEM TLP to become BDF of the CFG TLP. This essentially
>>>> implements the Enhanced Configuration Address Mapping (ECAM) mechanism as
>>>> defined in PCIe r6.0, sec 7.2.2.
>>>    So this broke a parallel port on my HiFive Unmatched machine (a SiFive
>>> FU740-C000 based system), the driver no longer registers the device, no
>>> /dev/parport0 anymore.
>> Hi Maciej, can you share us lspci -vvv o/p with working & non working case and
>> also can you point us parport driver. - Krishna Chaitanya.
>   I'm not sure what you mean as to the parport driver; it's standard stuff:
>
> $ zgrep PARPORT /proc/config.gz
> CONFIG_PARPORT=y
> CONFIG_PARPORT_PC=y
> # CONFIG_PARPORT_SERIAL is not set
> CONFIG_PARPORT_PC_FIFO=y
> CONFIG_PARPORT_1284=y
> # CONFIG_PATA_PARPORT is not set
> # CONFIG_I2C_PARPORT is not set
> # CONFIG_USB_SERIAL_MOS7715_PARPORT is not set
> $
>
> I've attached output from `lspci -xxxx' so that you can decode it yourself
> however you need, though I fail to see anything standing out there.
>
>   If you can't figure out what's going on here, then I'll try to poke at
> the driver to see what exactly it is that causes it to fail there, but I'm
> a little constrained on the resources and completely unfamiliar with the
> ECAM feature (and the lack of documentation for the DW IP does not help).
>
>   I have no slightest idea why it should cause a regression such as this,
> it seems totally unrelated.  Yet it's 100% reproducible.  Could this be
> because it's the only device in the system that actually uses PCI/e port
> I/O?
Hi Maciej, Can you try attached patch and let me know if that is helping 
you or not. - Krishna Chaitanya.
> # cat /proc/ioports
> 00000000-0000ffff : pcie@e00000000
>    00001000-00002fff : PCI Bus 0000:01
>      00001000-00002fff : PCI Bus 0000:02
>        00001000-00002fff : PCI Bus 0000:05
>          00001000-00002fff : PCI Bus 0000:06
>            00001000-00001fff : PCI Bus 0000:07
>            00001000-00001007 : 0000:07:00.0
>            00001000-00001002 : parport0
>            00001003-00001007 : parport0
>            00001008-0000100b : 0000:07:00.0
>            00001008-0000100a : parport0
>            00002000-00002fff : PCI Bus 0000:08
>            00002000-00002fff : PCI Bus 0000:09
>            00002000-000020ff : 0000:09:01.0
>            00002100-0000217f : 0000:09:02.0
> #
>
> (Hmm, indentation does not appear correct to me for buses below 0000:07.)
>
>    Maciej

--------------1nJtw7LajxHAbIw02IPdWaj5
Content-Type: text/plain; charset=UTF-8;
 name="0001-PCI-qcom-Enable-iATU-mapping-for-memory-IO-regions.patch"
Content-Disposition: attachment;
 filename*0="0001-PCI-qcom-Enable-iATU-mapping-for-memory-IO-regions.patc";
 filename*1="h"
Content-Transfer-Encoding: base64

RnJvbSBhZDAwMjY2MWMyZTU1OWVlM2VjNTIzYjAwZTIzOTQ4NDA3OTY4Y2Q3IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBLcmlzaG5hIENoYWl0YW55YSBDaHVuZHJ1IDxrcmlz
aG5hLmNodW5kcnVAb3NzLnF1YWxjb21tLmNvbT4KRGF0ZTogRnJpLCAyOCBOb3YgMjAyNSAx
Njo0NDoxNyArMDUzMApTdWJqZWN0OiBbUEFUQ0hdIFBDSTogcWNvbTogRW5hYmxlIGlBVFUg
bWFwcGluZyBmb3IgbWVtb3J5ICYgSU8gcmVnaW9ucwoKU2lnbmVkLW9mZi1ieTogS3Jpc2hu
YSBDaGFpdGFueWEgQ2h1bmRydSA8a3Jpc2huYS5jaHVuZHJ1QG9zcy5xdWFsY29tbS5jb20+
Ci0tLQogLi4uL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWRlc2lnbndhcmUtaG9zdC5jIHwg
MjQgKysrKysrKysrKysrKystLS0tLQogZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNp
ZS1kZXNpZ253YXJlLmMgIHwgIDMgKysrCiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9w
Y2llLWRlc2lnbndhcmUuaCAgfCAgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS1ob3N0LmMgYi9kcml2ZXJzL3BjaS9jb250cm9s
bGVyL2R3Yy9wY2llLWRlc2lnbndhcmUtaG9zdC5jCmluZGV4IGU5MjUxM2M1YmRhNS4uYTYw
ZjE1MzlmYWRjIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ll
LWRlc2lnbndhcmUtaG9zdC5jCisrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3Bj
aWUtZGVzaWdud2FyZS1ob3N0LmMKQEAgLTM2LDYgKzM2LDcgQEAgc3RhdGljIHN0cnVjdCBw
Y2lfb3BzIGR3X2NoaWxkX3BjaWVfb3BzOwogCiAjZGVmaW5lIElTXzI1Nk1CX0FMSUdORUQo
eCkgSVNfQUxJR05FRCh4LCBTWl8yNTZNKQogCitzdGF0aWMgaW50IGR3X3BjaWVfaWF0dV9z
ZXR1cChzdHJ1Y3QgZHdfcGNpZV9ycCAqcHApOwogc3RhdGljIGNvbnN0IHN0cnVjdCBtc2lf
cGFyZW50X29wcyBkd19wY2llX21zaV9wYXJlbnRfb3BzID0gewogCS5yZXF1aXJlZF9mbGFn
cwkJPSBEV19QQ0lFX01TSV9GTEFHU19SRVFVSVJFRCwKIAkuc3VwcG9ydGVkX2ZsYWdzCT0g
RFdfUENJRV9NU0lfRkxBR1NfU1VQUE9SVEVELApAQCAtNDI3LDEzICs0MjgsMTcgQEAgc3Rh
dGljIGludCBkd19wY2llX2NvbmZpZ19lY2FtX2lhdHUoc3RydWN0IGR3X3BjaWVfcnAgKnBw
KQogCiAJYnVzID0gcmVzb3VyY2VfbGlzdF9maXJzdF90eXBlKCZwcC0+YnJpZGdlLT53aW5k
b3dzLCBJT1JFU09VUkNFX0JVUyk7CiAKKwlyZXQgPSBkd19wY2llX2lhdHVfc2V0dXAocHAp
OworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKIAkvKgogCSAqIFJvb3QgYnVzIHVuZGVy
IHRoZSBob3N0IGJyaWRnZSBkb2Vzbid0IHJlcXVpcmUgYW55IGlBVFUgY29uZmlndXJhdGlv
bgogCSAqIGFzIERCSSByZWdpb24gd2lsbCBiZSB1c2VkIHRvIGFjY2VzcyByb290IGJ1cyBj
b25maWcgc3BhY2UuCiAJICogSW1tZWRpYXRlIGJ1cyB1bmRlciBSb290IEJ1cywgbmVlZHMg
dHlwZSAwIGlBVFUgY29uZmlndXJhdGlvbiBhbmQKIAkgKiByZW1haW5pbmcgYnVzZXMgbmVl
ZCB0eXBlIDEgaUFUVSBjb25maWd1cmF0aW9uLgogCSAqLwotCWF0dS5pbmRleCA9IDA7CisJ
YXR1LmluZGV4ID0gcHAtPm9iX2F0dV9pbmRleDsKIAlhdHUudHlwZSA9IFBDSUVfQVRVX1RZ
UEVfQ0ZHMDsKIAlhdHUucGFyZW50X2J1c19hZGRyID0gcHAtPmNmZzBfYmFzZSArIFNaXzFN
OwogCS8qIDFNaUIgaXMgdG8gY292ZXIgMSAoYnVzKSAqIDMyIChkZXZpY2VzKSAqIDggKGZ1
bmN0aW9ucykgKi8KQEAgLTQ0MywxOSArNDQ4LDI2IEBAIHN0YXRpYyBpbnQgZHdfcGNpZV9j
b25maWdfZWNhbV9pYXR1KHN0cnVjdCBkd19wY2llX3JwICpwcCkKIAlpZiAocmV0KQogCQly
ZXR1cm4gcmV0OwogCisKIAlidXNfcmFuZ2VfbWF4ID0gcmVzb3VyY2Vfc2l6ZShidXMtPnJl
cyk7CiAKIAlpZiAoYnVzX3JhbmdlX21heCA8IDIpCiAJCXJldHVybiAwOwogCisJcHAtPm9i
X2F0dV9pbmRleCsrOworCiAJLyogQ29uZmlndXJlIHJlbWFpbmluZyBidXNlcyBpbiB0eXBl
IDEgaUFUVSBjb25maWd1cmF0aW9uICovCi0JYXR1LmluZGV4ID0gMTsKKwlhdHUuaW5kZXgg
PSBwcC0+b2JfYXR1X2luZGV4OwogCWF0dS50eXBlID0gUENJRV9BVFVfVFlQRV9DRkcxOwog
CWF0dS5wYXJlbnRfYnVzX2FkZHIgPSBwcC0+Y2ZnMF9iYXNlICsgU1pfMk07CiAJYXR1LnNp
emUgPSAoU1pfMU0gKiBidXNfcmFuZ2VfbWF4KSAtIFNaXzJNOwogCWF0dS5jdHJsMiA9IFBD
SUVfQVRVX0NGR19TSElGVF9NT0RFX0VOQUJMRTsKIAotCXJldHVybiBkd19wY2llX3Byb2df
b3V0Ym91bmRfYXR1KHBjaSwgJmF0dSk7CisJcmV0ID0gZHdfcGNpZV9wcm9nX291dGJvdW5k
X2F0dShwY2ksICZhdHUpOworCWlmICghcmV0KQorCQlwcC0+b2JfYXR1X2luZGV4Kys7CisK
KwlyZXR1cm4gcmV0OwogfQogCiBzdGF0aWMgaW50IGR3X3BjaWVfY3JlYXRlX2VjYW1fd2lu
ZG93KHN0cnVjdCBkd19wY2llX3JwICpwcCwgc3RydWN0IHJlc291cmNlICpyZXMpCkBAIC05
NDIsNyArOTU0LDcgQEAgc3RhdGljIGludCBkd19wY2llX2lhdHVfc2V0dXAoc3RydWN0IGR3
X3BjaWVfcnAgKnBwKQogCQlkZXZfd2FybihwY2ktPmRldiwgIlJhbmdlcyBleGNlZWQgb3V0
Ym91bmQgaUFUVSBzaXplICglZClcbiIsCiAJCQkgcGNpLT5udW1fb2Jfd2luZG93cyk7CiAK
LQlwcC0+bXNnX2F0dV9pbmRleCA9IGk7CisJcHAtPm9iX2F0dV9pbmRleCA9IGk7CiAKIAlp
ID0gMDsKIAlyZXNvdXJjZV9saXN0X2Zvcl9lYWNoX2VudHJ5KGVudHJ5LCAmcHAtPmJyaWRn
ZS0+ZG1hX3JhbmdlcykgewpAQCAtMTExMyw3ICsxMTI1LDcgQEAgc3RhdGljIGludCBkd19w
Y2llX3BtZV90dXJuX29mZihzdHJ1Y3QgZHdfcGNpZSAqcGNpKQogCXZvaWQgX19pb21lbSAq
bWVtOwogCWludCByZXQ7CiAKLQlpZiAocGNpLT5udW1fb2Jfd2luZG93cyA8PSBwY2ktPnBw
Lm1zZ19hdHVfaW5kZXgpCisJaWYgKHBjaS0+bnVtX29iX3dpbmRvd3MgPD0gcGNpLT5wcC5v
Yl9hdHVfaW5kZXgpCiAJCXJldHVybiAtRU5PU1BDOwogCiAJaWYgKCFwY2ktPnBwLm1zZ19y
ZXMpCkBAIC0xMTIzLDcgKzExMzUsNyBAQCBzdGF0aWMgaW50IGR3X3BjaWVfcG1lX3R1cm5f
b2ZmKHN0cnVjdCBkd19wY2llICpwY2kpCiAJYXR1LnJvdXRpbmcgPSBQQ0lFX01TR19UWVBF
X1JfQkM7CiAJYXR1LnR5cGUgPSBQQ0lFX0FUVV9UWVBFX01TRzsKIAlhdHUuc2l6ZSA9IHJl
c291cmNlX3NpemUocGNpLT5wcC5tc2dfcmVzKTsKLQlhdHUuaW5kZXggPSBwY2ktPnBwLm1z
Z19hdHVfaW5kZXg7CisJYXR1LmluZGV4ID0gcGNpLT5wcC5vYl9hdHVfaW5kZXg7CiAKIAlh
dHUucGFyZW50X2J1c19hZGRyID0gcGNpLT5wcC5tc2dfcmVzLT5zdGFydCAtIHBjaS0+cGFy
ZW50X2J1c19vZmZzZXQ7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
ZHdjL3BjaWUtZGVzaWdud2FyZS5jIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNp
ZS1kZXNpZ253YXJlLmMKaW5kZXggYzY0NDIxNjk5NWY2Li5kMjdiNDY5YjQxN2IgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS5jCisr
KyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS5jCkBAIC00
NzgsNiArNDc4LDkgQEAgaW50IGR3X3BjaWVfcHJvZ19vdXRib3VuZF9hdHUoc3RydWN0IGR3
X3BjaWUgKnBjaSwKIAogCWxpbWl0X2FkZHIgPSBwYXJlbnRfYnVzX2FkZHIgKyBhdHUtPnNp
emUgLSAxOwogCisJaWYgKGF0dS0+aW5kZXggPiBwY2ktPm51bV9vYl93aW5kb3dzKQorCQly
ZXR1cm4gLUVOT1NQQzsKKwogCWlmICgobGltaXRfYWRkciAmIH5wY2ktPnJlZ2lvbl9saW1p
dCkgIT0gKHBhcmVudF9idXNfYWRkciAmIH5wY2ktPnJlZ2lvbl9saW1pdCkgfHwKIAkgICAg
IUlTX0FMSUdORUQocGFyZW50X2J1c19hZGRyLCBwY2ktPnJlZ2lvbl9hbGlnbikgfHwKIAkg
ICAgIUlTX0FMSUdORUQoYXR1LT5wY2lfYWRkciwgcGNpLT5yZWdpb25fYWxpZ24pIHx8ICFh
dHUtPnNpemUpIHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3Bj
aWUtZGVzaWdud2FyZS5oIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNp
Z253YXJlLmgKaW5kZXggZTk5NWY2OTJhMWVjLi42OWQwYmQ4YjNjNTcgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS5oCisrKyBiL2Ry
aXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS5oCkBAIC00MjMsOCAr
NDIzLDggQEAgc3RydWN0IGR3X3BjaWVfcnAgewogCXN0cnVjdCBwY2lfaG9zdF9icmlkZ2Ug
ICpicmlkZ2U7CiAJcmF3X3NwaW5sb2NrX3QJCWxvY2s7CiAJREVDTEFSRV9CSVRNQVAobXNp
X2lycV9pbl91c2UsIE1BWF9NU0lfSVJRUyk7CisJaW50CQkJb2JfYXR1X2luZGV4OwogCWJv
b2wJCQl1c2VfYXR1X21zZzsKLQlpbnQJCQltc2dfYXR1X2luZGV4OwogCXN0cnVjdCByZXNv
dXJjZQkJKm1zZ19yZXM7CiAJYm9vbAkJCXVzZV9saW5rdXBfaXJxOwogCXN0cnVjdCBwY2lf
ZXFfcHJlc2V0cwlwcmVzZXRzOwotLSAKMi4zNC4xCgo=

--------------1nJtw7LajxHAbIw02IPdWaj5--

