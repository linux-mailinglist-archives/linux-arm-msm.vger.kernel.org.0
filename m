Return-Path: <linux-arm-msm+bounces-105094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IWhJ2928WkxhAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 05:09:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE98748E92F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 05:09:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27995306A57A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 03:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA821224B04;
	Wed, 29 Apr 2026 03:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CKWBnnyx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tafkcv9c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C48308F15
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 03:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777431907; cv=none; b=SKGO5AwAhKoZ8ekRrJL3msveU3URuICXytEhakl43wGZwe6SCSgXH0wqLij7Kxm/9Zw/42EgxY7iLStXMy1XXkuhgMw4EQ5mhTRaWRHiAMvKYs1f5A0qey+QwrG3YOGbHd44mTUNNzMP00mI5vIVOIi+yu18IxEjVvwN54IB6d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777431907; c=relaxed/simple;
	bh=2GGUiaHFX5KqOrq3sYTX7GQ9oHEzmTcuK0OpVgkkJC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UcxRvOTd/wrwbBc737+CA3dFUjqrbgq3idvh9O1tC2El3kCPyxrbNUcvfg/1s6V2V37sx4S6EnSqtON9goDH8RH2ELpAj7tXnDCUD6HFZtRzKmizmpNbvc3U8rzaVOPqbXi1NmBXWJd+erQqJVVs59QRK5+FkDpIOILaWItbgPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CKWBnnyx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tafkcv9c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SH0aoU831095
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 03:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DvpF9N/gAyKtXmKaTyV2WHzu+7iolN9prQ5oE9ZY/7I=; b=CKWBnnyxEvDgCE8D
	00r0hxa8rUY5rWZR0chUO27fCEA2MsqSVfdgvwRt3cBLHx25nwas3fXU9PStCOVQ
	w7MkaSDQEpqnEIlIUIfJhAQMaQ9hy23XDqB+AHddc9iz8QONch/IzCzNaERn7Yiq
	xyKJ8sHHP3N6TFwbCz+dYXd1eJD5paV8MLDmDiNh2DYVFjV0JtmysO0lZlmojGl0
	t0TBEIiiQsLkN3oDE+4EUdNMB5nSdbtXF3oitlc++9+V080gXRQAIiVOBW6DPL9n
	ZE2JfZIMKE2zMA4MXWqmx24JcF30n0HPaOkqPKrFTjmEPX/9E16VKACeNKJeajFi
	DVPQGQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0wq9sh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 03:05:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b465bf993cso123704045ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 20:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777431904; x=1778036704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DvpF9N/gAyKtXmKaTyV2WHzu+7iolN9prQ5oE9ZY/7I=;
        b=Tafkcv9cW0pMGZv5/cBxU8et4zLkSZUGBLJDH95oXU8YEejyt4MFkTj5MMCiJNtL1o
         Y9RgQzkGFnSqOczfrGbsHvfO4jlZb6Qp/0hS2ItfZ7TQjs1nTi68tHprya6NJlorD2tn
         SELxYidjjqofknBlEVrOWPNhKkBmXhUT6khnPhSMwGDPP/PZmOyner15xNur9PdPeMlE
         KVjNjFCXsgVSWMIfXRSZe8f9RAypUFmBprfsEKthKMRtgGrdUk0NzHT1NmsJERsq6tZo
         FObiDQ82xeXCrvY3YNif4OLihC4U6p1t8dhYzeJfNt26GS43RB1sonbzQvy1p81MXzMo
         O7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777431904; x=1778036704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DvpF9N/gAyKtXmKaTyV2WHzu+7iolN9prQ5oE9ZY/7I=;
        b=rCGWozUGRDFNiBJ+PxaU5mC7a8YQt3e9v5CTYiEdy/JJmEVF7pSj4FYBJeu42WjgO0
         NXMWPG4Ge5KJbGZNJoy4XIvffDq2oNQ59+Tqc9H4iRqn7nIvAWl62QELY0HQVkud6tc/
         o3kLzJozhZpHEp91saovI+2Do8e4vtnv1P/3ZVwg4Zm/QbCa2uwSt6NawQY/POL2iKtK
         uBePm1MoN7GqGjXFxg63wfgJDyWYzdgn9IR5DRgBkYGWhpSLCWE8Y0NiGRqu5wwgf9Qe
         FXSGOHsbIT1KEAvc1PUbaPgjrpRf2Ze4HNt4cRhdeycapbf/KgwlaVcdwy/z+C4vqAFi
         TzYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/08gKnige7bycBABnbbumg7JSWvRWjeH7F3X4aja+PJ2EWcgXZvoA5V+zTunu+1h69WVdIOk5MvB7leDoM@vger.kernel.org
X-Gm-Message-State: AOJu0YwdPHKafHdwYVzOKecv7blUC/Z72uu/v466vegE0+/lzgfWuKiP
	of9h9EFsUxbRcQWlRDVd2cgDkiTPQDfm1guC8DGDX260zOPtAYyPExPVQMSOzWZWGvs1ckZXiGc
	IHHrtpgeP0/Ke+53wHqolmC7t0g/wXs87pZUnAz1BxgkXYlREu3pEtvGNITH3kn81L2vw
X-Gm-Gg: AeBDievnxGDUBKbTuz1dYKZzLRwukamuiAoMB8CJPhFnxcNsU+I7JTp6RU6BfD71ffI
	kMTes3wsjHZA1LHsR9o4UchFT1TEjK5TbDDKFZSuMAzgaGRrF0Li95hHaabI8NlCVzqBRxc3REd
	bibC34dXtX4rLkMO8khHlzVJmOnPbhpDTEn3E2F3oRU0e5jZ+poXyy0KZUhowlziUsB2Ppfr15g
	Y/6xXRlfCTU+iVFHUJufSr7RyDA/0SDN0pyR3IG/z+WGy+7A7G+6+V1+zqyid7UAHtMOzD8sIHZ
	dAErvbe/V3RWs0CWXHBioxOcTEXXGsk2Opmu6nd/nO4geAd5+PVbFA4DTLWXCBxtR9v0B6wMLqJ
	dq81Ji/AQmHxEGKS/JBAt4RFebSOpsiLihNZqhm32bkHD0LMet7aEXnFKjHyD057kfg==
X-Received: by 2002:a17:902:eec2:b0:2b4:5f67:5914 with SMTP id d9443c01a7336-2b987442b4fmr14370715ad.33.1777431904455;
        Tue, 28 Apr 2026 20:05:04 -0700 (PDT)
X-Received: by 2002:a17:902:eec2:b0:2b4:5f67:5914 with SMTP id d9443c01a7336-2b987442b4fmr14370415ad.33.1777431903925;
        Tue, 28 Apr 2026 20:05:03 -0700 (PDT)
Received: from [10.92.193.222] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988940d08sm5813365ad.43.2026.04.28.20.04.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 20:05:03 -0700 (PDT)
Message-ID: <28c30ddb-f46a-458d-9680-eac1ce8c5b68@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 08:34:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] PCI/ASPM: Add helper to encode L1SS T_POWER_ON
 fields
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        Shawn Lin <shawn.lin@rock-chips.com>
References: <20260428-t_power_on_fux-v5-0-f1ef926a91ff@oss.qualcomm.com>
 <20260428-t_power_on_fux-v5-1-f1ef926a91ff@oss.qualcomm.com>
 <bc3a5f58-676a-3634-6b8f-bffc91d25265@linux.intel.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <bc3a5f58-676a-3634-6b8f-bffc91d25265@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rU95zUEKM_Wwjc8Rnldg0uBhkkWSQegu
X-Proofpoint-ORIG-GUID: rU95zUEKM_Wwjc8Rnldg0uBhkkWSQegu
X-Authority-Analysis: v=2.4 cv=BfDoFLt2 c=1 sm=1 tr=0 ts=69f17561 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=Zlw8WEmqWycuYniGgb4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDAyNiBTYWx0ZWRfXwugvxCTi6VcG
 a9bQ1Hqj/UnaG+/Gcfr/pZ0Ua+5XMpKx9FEKNlIMera6FYtQQMxloAUNR2w3aA5Y7ebgXtBSexO
 L4Hgilsmpf7l79iq6K2zmmnljvymK8qNhB62dcQdNoaamuvmKNpI4aZMBvB43s+WWnxGD1QmZzf
 iuIW8+R10EtMzBIuNW9p++pzQht6/db0EIgUOZzFVi5gQ8I6REZAtjXz/z762susgG+yJ77Z7zv
 8XhdlClzFYmxvu91OXhT3Fu/7ix/onIQtDfJ2EvweKs2Q+YMnGHf9xgpkF1NvDLJq3SScMkh8Hi
 +y2c6n5q6uj03Da9LI9T4IIdriX9+tun3cfW/87AxvmdAr2wTJFv6AyyQ5BHQd6rjApfqVWVRYA
 PMsZ6wCvqMOkNMBYtiJSj/yo2wZig0cXjw2hUi1Yb22SKs4HwGqps6PAM+mbfTEwgfgNYvz2DBu
 bCs8KCS+uWAY/7/af5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290026
X-Rspamd-Queue-Id: EE98748E92F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com,rock-chips.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-105094-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,rock-chips.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/28/2026 2:57 PM, Ilpo Järvinen wrote:
> On Tue, 28 Apr 2026, Krishna Chaitanya Chundru wrote:
>
>> Add a shared helper to encode the PCIe L1 PM Substates T_POWER_ON
>> parameter into the T_POWER_ON Scale and T_POWER_ON Value fields.
>>
>> This helper can be used by the controller drivers to change the
>> default/wrong value of T_POWER_ON in L1ss capability register to
>> avoid incorrect calculation of LTR_L1.2_THRESHOLD value.
>>
>> The helper converts a T_POWER_ON time specified in microseconds into
>> the appropriate scale/value encoding defined by the PCIe spec r7.0,
>> sec 7.8.3.2. Values that exceed the maximum encodable range are clamped
>> to the largest representable encoding.
>>
>> Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
>> Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>  drivers/pci/pci.h       |  6 ++++++
>>  drivers/pci/pcie/aspm.c | 40 ++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 46 insertions(+)
>>
>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>> index 4a14f88e543a..c379befe1ebe 100644
>> --- a/drivers/pci/pci.h
>> +++ b/drivers/pci/pci.h
>> @@ -1110,6 +1110,7 @@ void pcie_aspm_pm_state_change(struct pci_dev *pdev, bool locked);
>>  void pcie_aspm_powersave_config_link(struct pci_dev *pdev);
>>  void pci_configure_ltr(struct pci_dev *pdev);
>>  void pci_bridge_reconfigure_ltr(struct pci_dev *pdev);
>> +void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value);
>>  #else
>>  static inline void pcie_aspm_remove_cap(struct pci_dev *pdev, u32 lnkcap) { }
>>  static inline void pcie_aspm_init_link_state(struct pci_dev *pdev) { }
>> @@ -1118,6 +1119,11 @@ static inline void pcie_aspm_pm_state_change(struct pci_dev *pdev, bool locked)
>>  static inline void pcie_aspm_powersave_config_link(struct pci_dev *pdev) { }
>>  static inline void pci_configure_ltr(struct pci_dev *pdev) { }
>>  static inline void pci_bridge_reconfigure_ltr(struct pci_dev *pdev) { }
>> +static inline void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value)
>> +{
>> +	*scale = 0;
>> +	*value = 0;
>> +}
>>  #endif
>>  
>>  #ifdef CONFIG_PCIE_ECRC
>> diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
>> index 925373b98dff..457d469b8d49 100644
>> --- a/drivers/pci/pcie/aspm.c
>> +++ b/drivers/pci/pcie/aspm.c
>> @@ -525,6 +525,46 @@ static u32 calc_l12_pwron(struct pci_dev *pdev, u32 scale, u32 val)
>>  	return 0;
>>  }
>>  
>> +/**
>> + * pcie_encode_t_power_on - Encode T_POWER_ON into scale and value fields
>> + * @t_power_on_us: T_POWER_ON time in microseconds
>> + * @scale: Encoded T_POWER_ON Scale (0..2)
>> + * @value: Encoded T_POWER_ON Value
>> + *
>> + * T_POWER_ON is encoded as:
>> + *   T_POWER_ON(us) = scale_unit(us) * value
>> + *
>> + * where scale_unit is selected by @scale:
>> + *   0: 2us
>> + *   1: 10us
>> + *   2: 100us
>> + *
>> + * If @t_power_on_us exceeds the maximum representable value, the result
>> + * is clamped to the largest encodable T_POWER_ON.
>> + *
>> + * See PCIe r7.0, sec 7.8.3.2.
>> + */
>> +void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value)
> Hi,
>
> I don't know how the type for t_power_on_us was picked but if it was 
> arbitrary decision, I suggest you just go with 32-bit input.
The maximum value of the T power ON is 3100us, so we are using u16 here.

- Krishna Chaitanya.
> That would also remove the u32 -> u16 truncate done in the other patches 
> of your series which would potentially corrupt the number (I assume 
> numbers that big would be invalid but they could alias to small u16 
> numbers).
>
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>
>> +{
>> +	u8 maxv = FIELD_MAX(PCI_L1SS_CAP_P_PWR_ON_VALUE);
>> +
>> +	/* T_POWER_ON_Value ("value") is a 5-bit field with max value of 31. */
>> +	if (t_power_on_us <= 2 * maxv) {
>> +		*scale = 0; /* Value times 2us */
>> +		*value = DIV_ROUND_UP(t_power_on_us, 2);
>> +	} else if (t_power_on_us <= 10 * maxv) {
>> +		*scale = 1; /* Value times 10us */
>> +		*value = DIV_ROUND_UP(t_power_on_us, 10);
>> +	} else if (t_power_on_us <= 100 * maxv) {
>> +		*scale = 2; /* value times 100us */
>> +		*value = DIV_ROUND_UP(t_power_on_us, 100);
>> +	} else {
>> +		*scale = 2;
>> +		*value = maxv;
>> +	}
>> +}
>> +EXPORT_SYMBOL(pcie_encode_t_power_on);
>> +
>>  /*
>>   * Encode an LTR_L1.2_THRESHOLD value for the L1 PM Substates Control 1
>>   * register.  Ports enter L1.2 when the most recent LTR value is greater
>>
>>


