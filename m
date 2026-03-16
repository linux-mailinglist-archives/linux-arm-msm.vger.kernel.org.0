Return-Path: <linux-arm-msm+bounces-97838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFYaAOWPt2neSwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 06:06:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC45294B3B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 06:06:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F138130137A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 05:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2BD3264C1;
	Mon, 16 Mar 2026 05:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5FuCJdK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ngoj6nnu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FF12BEFFF
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 05:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773637602; cv=none; b=XhqnJAwzToAGttUvJw91lD1p6e+Z0uc2bQPf2x9iugbBfW4GtamLa8NQXuvxcNnlEzLbASZu5ErECYfNUBrcWx2OyseE8Rhibzh/DRCeQJWpYoSqPnlz2hhAK61J0rc5cj0qj2z9DuFlmpqAEOr57GkTUQXxl8jqKPNyah8tEt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773637602; c=relaxed/simple;
	bh=75a8s4cKGm7+10c01zsvahwh2i/HgyFa3IeYL+aD0ek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eiU37620vvMEaY0WlY2MVRe8I3gcasLdQlUzrA3dPT6AlErCR5UcoNTQ38PNgtIS7wur+XVmEOcJvuByFc1wj3SQzqg1CQ9HbFP1B1N8+uvLWkStALsF3i6kvavCtFeSEAE56EoQypeRr8xvU2CORogrO5tMUScqfWu09fEi3KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5FuCJdK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ngoj6nnu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62FKY7tx3328229
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 05:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H0rXwYZw49ux9UnyBDwy/3943rXzLigavQY3aeK/Q4Y=; b=A5FuCJdKfMuoyqxD
	9rAexqLttc378B9YmfrtYfzbI8gdSk7zQFdUfJ68B5orUcCCgKSq2m3PhxLnXN+o
	3SpVud03w9b7AdcHIMABY0rzoVZ2lm5ZW5taWXHqYCDZvalUdwZqoyeRN+hbpwlp
	BFZRfXrgOCWxyiUo7gWgUeFTtcDS2PsAeejdD0hnN6iOwz+KUJlRl9Keh0+bmEz6
	6pNQFZTG4EdSfANUfJSVXDQTHQGaVKgIcGFLGRbtxGTIPFNL6EhqCXtDZUu+9CPk
	OZ/uW3mRCGQl4Bq1QyXc8r3dADsIj+rGG6n1VJO9AjHb9jfSKs3k5KbvZLkQc2+1
	r/3nFA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03qm9ed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 05:06:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0560c1320so81388315ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 22:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773637599; x=1774242399; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H0rXwYZw49ux9UnyBDwy/3943rXzLigavQY3aeK/Q4Y=;
        b=Ngoj6nnuG9gpgFFXqiicyNS5+N1CDP0xuvJUBQicVCjP7eWdFn+r2p+OPh9thG9l9N
         FW9vY7T5oFrs3JcXgxRUUqao4ODBRI75bUw89nVc8fKZQXeEJKPQNPQz+MaB+XglGlBR
         MKihUyljYrSoke70OWJ117pwsJiogBKPfo3dfrFqXnD4YiL4bDAGFp6deK676Mf11IV5
         6/+kVrZJOeXoNEW2iuiy3BSNPdOICCY1dm6pYjIgwgIF2GeZJ0DSfI9CGkMi2DrGkdl8
         UxGgY9Ar2/TTDvDMqTddGSNkb0txOn8m0ZZmHQht90Dk6rZ3InArNomukhYsozKxby1L
         XGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773637599; x=1774242399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0rXwYZw49ux9UnyBDwy/3943rXzLigavQY3aeK/Q4Y=;
        b=p35C5VRxaLzZTyP6AVxApFG6NXwIP6W1kTNtKzHxnqy7uXOQvNrgGCgMaJfSxOf2g9
         DUmi9O5fG6P7YNwnsRU44JjYx77zVss37N6ViEMhFGPZT9L7uUM5m03qvj1rSrgx1bRL
         HnOnAfRIPx85F/rOue0k8nrRBQf7z4Q/LZghnAuVfORBro0rGxFwGOtKucR10UDL1omY
         pJWAvdZ7JSYc1MBWMRzd/O2IcMHqRE/8RAF/fsyufdj6u7X1Wzwpm9WVwFwY3RjxaEB4
         zT4z0rU8BbdkSo5GXyrevZbTVDMTB+titHuKu0XiIl+5VcGtRToOy7qDR00JgArVdzVw
         qvfw==
X-Forwarded-Encrypted: i=1; AJvYcCXcZ6q0nWA7Qn/UepR7R6eBRN5MkiaUlKmGRg7jpzxyvXfr56zneemfBpK+9c9uII/ZuaRBOqwlOUKCWo91@vger.kernel.org
X-Gm-Message-State: AOJu0YyeJZhwrwOXyb7Iw/Ld6G/rszyMM61SQlN6nDFkbDm7xSwcRFgA
	mxYAAxTesS7mD3UJ5vZKABmWCUolLmbrhJpYWi1TyEeAhoJ1lNFdnnHQGKqWdYrHgWNCf/bvm9G
	IopWeGOmBZrx7cg1Zmoxc8XfWR80XylW7PuYDkQ0CMDd1G6BCJwFx3ub77iau84W6bV4d
X-Gm-Gg: ATEYQzyy5zPF38tdZ7q7RJ9Z/irlRkAqdvFVEQw63tR5TzLyKq6LTruJ4UqRVdX66Is
	CwzdwA6hJRjpKkSfksfm3K48KIPhHVAT5NQbcvHzEdJiB1iRP9SbpN7KznxvEzxL9dbasRz9EoJ
	9cMyylUBsrdi5hrT0dYYNWLJAjupC8Fe/E1kfnuNLJk82GXzK9qLBuBkM/8yuVxIuQcGrL4Fkmc
	3IK0OhTrz+eVGK+GoGm0NuqSyXX0Xre70RJUTOsyX/vBybqHXCtdIIvXo50YNzrGrkfjNxStHaW
	nrZ9cSz/o9LCTJIP9urPpBgB7qVgTvKx2m1MLo1VBILj4jTIQgcIK/kZmfwE/BlT5894MDMODZY
	NtXxu81nVBu7aEE78EuqOgq2RRcE3zp7yjgY1BE9AW1xjZyjoWR9gLQ==
X-Received: by 2002:a17:903:46cc:b0:2aa:d608:ec55 with SMTP id d9443c01a7336-2aecab1f70fmr137915435ad.28.1773637598880;
        Sun, 15 Mar 2026 22:06:38 -0700 (PDT)
X-Received: by 2002:a17:903:46cc:b0:2aa:d608:ec55 with SMTP id d9443c01a7336-2aecab1f70fmr137915215ad.28.1773637598434;
        Sun, 15 Mar 2026 22:06:38 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b058c97bc1sm17889835ad.90.2026.03.15.22.06.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 22:06:38 -0700 (PDT)
Message-ID: <1693abf1-fa52-4e62-8b0c-3b53b6617735@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:36:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] PCI/ASPM: Add helper to encode L1SS T_POWER_ON
 fields
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com
References: <20260311-t_power_on_fux-v3-0-9b1f1d09c6f3@oss.qualcomm.com>
 <20260311-t_power_on_fux-v3-1-9b1f1d09c6f3@oss.qualcomm.com>
 <fwa3hatuesbbsnk3o34nhi6ohpozkr74rmnqbqwxmesh5bws3r@abidzslkrily>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <fwa3hatuesbbsnk3o34nhi6ohpozkr74rmnqbqwxmesh5bws3r@abidzslkrily>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gOoW56oIP3mZ5kt3xFP5ZA67btYB-y4H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAzNiBTYWx0ZWRfX/WKNBrlp19pv
 +SHzvjrz1Ay65E8pSpLH/yQdbMz7HltV6gHZ+r/ZbXR0IbMYLNE9UjYRgpJPplZ1p+z4kHCPHJS
 ZAwKfcMtVFweJ5bLWEeEmCoREW8e70c6WIL1V9qvUwcal7ax2b1xYew7DIhbUrrZr/mII0S+Bgu
 eO/26Kdk3esVCYjgkKZb31+Gq468hOUEW4eTgqDmOZ3Vi+lEAN183j9++hMAfgJ7q6+oHf3iL1O
 F1ggma8GzHNU4dRWgYNbbsWTLhGKRpXcekIcBX2yjr23CpqBwZcMNMEVXfa8Xs+DEIQQHbBucBr
 vUywyBwaqiju/yVP36jteN3LNM/lQDNtgpiapxOzmywOGI5+rUVLOrG7qCC2ZTyYKyV/HO5DqtZ
 OL2hFMSv4BtMo+Br9JpNce4S2vqgoPvO3hskVCg9NyFbFCs+VoTUsCCGOay7Q3taNhTMR3zH225
 PBFcd+6Len7f1SrKhGA==
X-Proofpoint-ORIG-GUID: gOoW56oIP3mZ5kt3xFP5ZA67btYB-y4H
X-Authority-Analysis: v=2.4 cv=ZbQQ98VA c=1 sm=1 tr=0 ts=69b78fdf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=0zj2Sjq5_81KAJ-Os-gA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160036
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97838-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8AC45294B3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/16/2026 10:21 AM, Manivannan Sadhasivam wrote:
> On Wed, Mar 11, 2026 at 06:10:38PM +0530, Krishna Chaitanya Chundru wrote:
>> Add a shared helper to encode the PCIe L1 PM Substates T_POWER_ON
>> parameter into the T_POWER_ON_Scale and T_POWER_ON_Value fields.
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
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/pci.h       |  2 ++
>>   drivers/pci/pcie/aspm.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 45 insertions(+)
>>
>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>> index 13d998fbacce6698514d92500dfea03cc562cdc2..48964602d802e114a6a2481df3fb75d9e178a31b 100644
>> --- a/drivers/pci/pci.h
>> +++ b/drivers/pci/pci.h
>> @@ -1105,6 +1105,7 @@ void pcie_aspm_pm_state_change(struct pci_dev *pdev, bool locked);
>>   void pcie_aspm_powersave_config_link(struct pci_dev *pdev);
>>   void pci_configure_ltr(struct pci_dev *pdev);
>>   void pci_bridge_reconfigure_ltr(struct pci_dev *pdev);
>> +void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value);
>>   #else
>>   static inline void pcie_aspm_remove_cap(struct pci_dev *pdev, u32 lnkcap) { }
>>   static inline void pcie_aspm_init_link_state(struct pci_dev *pdev) { }
>> @@ -1113,6 +1114,7 @@ static inline void pcie_aspm_pm_state_change(struct pci_dev *pdev, bool locked)
>>   static inline void pcie_aspm_powersave_config_link(struct pci_dev *pdev) { }
>>   static inline void pci_configure_ltr(struct pci_dev *pdev) { }
>>   static inline void pci_bridge_reconfigure_ltr(struct pci_dev *pdev) { }
>> +static inline void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value) { }
>>   #endif
>>   
>>   #ifdef CONFIG_PCIE_ECRC
>> diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
>> index 21f5d23e0b61bd7e1163cc869fe9356d1ab87b34..d7f9ae9e48c25dbc2d9b4887e2f74623688098e0 100644
>> --- a/drivers/pci/pcie/aspm.c
>> +++ b/drivers/pci/pcie/aspm.c
>> @@ -525,6 +525,49 @@ static u32 calc_l12_pwron(struct pci_dev *pdev, u32 scale, u32 val)
>>   	return 0;
>>   }
>>   
>> +/**
>> + * pcie_encode_t_power_on - Encode T_POWER_ON into scale and value fields
>> + * @t_power_on_us: T_POWER_ON time in microseconds
>> + * @scale: Encoded T_POWER_ON_Scale (0..2)
>> + * @value: Encoded T_POWER_ON_Value
> Nit:
>
> s/T_POWER_ON_Scale/T_POWER_ON Scale
> s/T_POWER_ON_Value/T_POWER_ON Value
>
> Same everywhere.
>
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
>> +{
>> +	u8 maxv = FIELD_MAX(PCI_L1SS_CTL2_T_PWR_ON_VALUE);
> Since this API is for changing the 'capabilities register', you should use
> PCI_L1SS_CAP_P_PWR_ON_VALUE.
Ack.

- Krishna Chaitanya.
>> +	/*
>> +	 * T_POWER_ON_Value ("value") is a 5-bit field with max
>> +	 * value of 31.
> Use max 80 columns for comments.
>
> - Mani
>


