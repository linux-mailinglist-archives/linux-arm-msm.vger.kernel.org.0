Return-Path: <linux-arm-msm+bounces-64647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 058D2B02783
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 01:12:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78CD77AFA17
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 23:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AFE922256B;
	Fri, 11 Jul 2025 23:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AM69r9AB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EB61F2BAB
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 23:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752275526; cv=none; b=YVcPwOpY7jvXa/T3cTjsaH/n8hVH79ofJn9F4ozRkBqHJLJH1IEWuOg+wihBsVPVRf3HPMJa/8lra07Zr9d9rS+uZt3Jt4g/esoDJ5K0Xk76jmm/buoXuNDgUL2Yx/oHRLMnYD6vXZL0XE3ER2AgHPHs51mEUz05JI/rCj9BnuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752275526; c=relaxed/simple;
	bh=iOwLrKCkhVKAxQZXp38HLHfRncvgRuif6BiGmmhGRos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Me+2klSTVOyoHjwjmpqZ1XzkptO8E5r1E3Ic/tqIRmShj6HPs7xkp23L1Ta9ogOgvn9Ao++fPtdxyiyuVuaHCVGFgM3zVGipSgPrclvt3UFfHqnu3m+fRpBJK6xeKhH0VmSaRDl3kj3y0FWdTqgv2K9zUgNszvKrNYUzOiZO23U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AM69r9AB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAhrXH008618
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 23:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0PpsrmMj0uiPokNCQ1Eqhmb2HaTUqbDl1MR+USJW6LE=; b=AM69r9ABrIKlQY4s
	YxvXrJg3dr1YOkoMN/GSblbDv2QbivqBF22HGq+bXcKJEk7KLQiiAsbq/A1GWWhk
	FE9fFuCzFLb/2jH3edDr0HjaNnP9vEuL+t8pmMQ1/3XfCihqy489xCSPoZ8eFQLG
	7i7Wxj+jZclQEVZZmWKMomCFGMYLWiGOT3BYZKLLCsQQsRcjbD74DfRbzY40NMx+
	F5ykAy+u/jXlpNkVH40wRQvxiZww30ViGur6KVDBjOMgTAm4rr1nR6ifu0v7QiOb
	rs+VnAdMC3/wmL+hI27ytiJlyBOQ6tV8gQd5zK1K4h9u+sdLvCJY3z06XruS3MFm
	taMmzw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcga27q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 23:12:03 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b2c37558eccso2173423a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 16:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752275523; x=1752880323;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0PpsrmMj0uiPokNCQ1Eqhmb2HaTUqbDl1MR+USJW6LE=;
        b=ilwLV2ST/jZO5A6CDQoR4a0n3GOVRoz6wLsrYQ+oGDalBX33FyFlTbomsIjAOPq4Ul
         1Z6/+LpfWYYU7UJMO59/PlA/TkKCdqqGgWG4/I9LIf5YFd7T6WM1JBD5APEAuMNJJ/tA
         YgBWPNQOZBTq92vgnoQS2SOWYDVvLbVT0fGIyD3FCAfleHj7MYsuQ15cYMgfG8h8wJkS
         K0gbIskK+9L6QF/F3N9Sowlb97jQlboHbcLIzsOm6xrGCPjWTellWo12+PBh1RqXmfjZ
         BuYGJ+MBF4O/WKJMkgS3lAZsekBuI58vXNQy7MiQqKh9PnT0YqTkVt5kZyd26p1Fj8mw
         yMgg==
X-Forwarded-Encrypted: i=1; AJvYcCVc7sxrFfebmxF6S9I1VGYw6IzqubAq7DU9I44AUeA72bCCfE9aX0ujYo+qz2ezC/U7ykbM73tUYwOO4PVu@vger.kernel.org
X-Gm-Message-State: AOJu0YxkVyfp5o751o88D9Rtc5S9RGe39mDEXfU6QNQfq4gEl8eyDiRm
	cPBXIQ7RGGfeK6MerVBLMjKfseLuT0qaY4RNjsZnFv75Wgz3THpma2UPTBWE2Qffe8mTOyUmfQe
	MO/IV3H0fDxxhatFnA86Nabi/Eaj2ZCO4CGuUlPooAG1vqPXfO4GAP2ECNsUfzT08dYwd
X-Gm-Gg: ASbGnctTAomj7tQrWoqghhGnolci8diEwW9wo78o42UqesfHNT9JEIaK/gKboGLf4nt
	5y26lbxiYoHJL2roVIK3OyV7zmRAbi5k7bVQ41LkmP/7GgDRjWwsPn/IeTP1V57SiI09QOkEOUV
	js7mq+Celp7hVhm04VffK+n4PTKYClFfhMB6VWIHJe3LRPaQMvWryJGD5MQQN+ylB2eofwKELk+
	M7PR1KMfhs2kBP7nFlq1wiRUOFBDn3kXTuM1H3EP3dycGQvqGNFlAoFZBXPXPYPEibP27usvALe
	O+PIigx9R4plIiKhq2ROOFD9kKEUhWW2S26ghc8hUNlye7BgutTi273xEymmzy0zI6jR
X-Received: by 2002:a05:6a20:d43:b0:220:3252:bb7b with SMTP id adf61e73a8af0-2312080596dmr8768278637.31.1752275523083;
        Fri, 11 Jul 2025 16:12:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeK7rgvIuioPJc9Djm6BWHu8SfUaUakg+lxMCli0qXD/9xlsegC+9TSbITmlPNQmxFFiKNlw==
X-Received: by 2002:a05:6a20:d43:b0:220:3252:bb7b with SMTP id adf61e73a8af0-2312080596dmr8768238637.31.1752275522626;
        Fri, 11 Jul 2025 16:12:02 -0700 (PDT)
Received: from [192.168.29.92] ([49.43.227.1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd59f1sm5742585b3a.3.2025.07.11.16.11.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 16:12:02 -0700 (PDT)
Message-ID: <b9647055-a9f2-4016-a7b1-81c15a0d82c1@oss.qualcomm.com>
Date: Sat, 12 Jul 2025 04:41:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/11] PCI: qcom: Add support for PCIe
 pre/post_link_speed_change()
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20250711212952.GA2308100@bhelgaas>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250711212952.GA2308100@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=68719a44 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=4nqOr+EkFiuPl9GB/B4vcQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=40onBu3kYIFXMOwlT5wA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: qUwIO0gF0VtJIbLZ3IqRmuGeuo2BsvdE
X-Proofpoint-GUID: qUwIO0gF0VtJIbLZ3IqRmuGeuo2BsvdE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDE3NiBTYWx0ZWRfX+XtE1AGZhyip
 v4KOfYFgPf67YQE1FeUQUO1tRyCNooVht5jy/Sf7DHdTFemT9EEBHPTBt1lv0a2XmXhXYjnmDuA
 eqF49YcHS1/77E2yfQGoeakVhArcGB8s7BLAPwTe4VBCgZ1Ye+xYiqakpQ20Ul2IN5+vHpHiaI4
 wRiJmb5or8krs4Ekj/LAIhT65vUM8USlZXVPBL6YZvgVg++BqrRdYUyr7Fotxav9A9CUvixjwW1
 Sev8UjBggGgEK/SC5vwDJ03XPkCocOVpW78EvKPalWXyvvJBFxgPJGVVUTYlTvVZqrgiXfy4XiD
 en90eLVLfHMEUjW7p+j2Ihz+Je6CMyGMXJOBdy6OhGvGiCGD0/EIaO9UXOdTEDiRIFyJDQymqWd
 VCoY7M8okVDIbbngovXMfZndQbIEpydrL0UveD+AKWY6sW89QCCjw/DxzjMZLfQv5zHLARbq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110176



On 7/12/2025 2:59 AM, Bjorn Helgaas wrote:
> On Mon, Jun 09, 2025 at 04:21:29PM +0530, Krishna Chaitanya Chundru wrote:
>> QCOM PCIe controllers need to disable ASPM before initiating link
>> re-train. So as part of pre_link_speed_change() disable ASPM and as
>> part of post_link_speed_change() enable ASPM back.
> 
> Is this a QCOM defect?  Or is there something in the PCIe spec about
This is QCOM issue only.
> needing to disable ASPM during retrain?  What about
> pcie_retrain_link()?  Does that work on QCOM?
After disabling ASPM will work pcie_retrain_link().

- Krishna Chaitanya.
> 
>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>> @@ -276,10 +276,16 @@ struct qcom_pcie {
>>   	struct dentry *debugfs;
>>   	bool suspended;
>>   	bool use_pm_opp;
>> +	int aspm_state; /* Store ASPM state used in pre & post link speed change */
> 
> Whatever this is, it's definitely not an int.  Some kind of unsigned
> thing of specified size, at least.

