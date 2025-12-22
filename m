Return-Path: <linux-arm-msm+bounces-86216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 906DECD59B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 11:34:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 554F53058A0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D65E30C600;
	Mon, 22 Dec 2025 10:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gzhKcOo6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Olzfmtf2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE29F23D7FC
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766399499; cv=none; b=nkIuFkmDis3eW8Q9QqUHkI5tEZc1L86V4Wn6Zmi7qOg5NtTCykqrfW4N/BbYrkYmZnTyCnfW0E4EPSSYA2UGGLWj+cbK1C0r3pgjoqjo0Ek+3SbJ26hVTk4PByS7T8puDJ4GBsT9VK6iS1VibyAEPIajaa7Piq05lUxa0SLfXJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766399499; c=relaxed/simple;
	bh=XZz1xE+YE9rIrAv8TPfmjsTJZft86uRH+WeioLmBXPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hg0cAyv/MRxuftvbeyx4IDPpe5B1963rmA42IGK1MntGazjKs3U3YEBQpKY96WJBGBbxl0BwS43kg+rLFJcdaQMRglkNbyEn/ilXQEkPDU1lKc/QWxou2IBX12fLfUE3xpb8RhD+v8jR3fhtcYZy1wYfhYxXTak48IJttX04zC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gzhKcOo6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Olzfmtf2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM6ad3R4118419
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sd3ZsPbmm/TqCzyvuwxbyZGAw0bOEcr60FfnyA+uFck=; b=gzhKcOo6lqBBJNa3
	c3Kn6JGPrLuJ4l9ysd+FN10JKgh+8loTKnkeQiFD+rHdHMjGA6ISKqRevxuNMeHz
	IMKM8cO1nts5Y7VYIvlLhvgXKOLlGS0j6xM6Lj6zgJp9pCDmfKbSfLI4w86klXpy
	UcNl1/J60YdBRQlfqizypQN2sc55NdaZKmx9PfGV/z9hU2HcmI/YSm39ej6IKdIr
	mu+kD82d3FfbmWSm5vqpL3tK+Tr+aXeL7yU2UaZAsKJP9ZRiEr5QuAuLvamdUyMH
	StVRu713dKM+6ytUtYCDpU8dA6LjPH+Cu2g8+uMsP57P9niQ1hoWzC+PaPeCNuPS
	7lj/jg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b70v28pd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:31:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c7d0c5ed2so4246809a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 02:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766399496; x=1767004296; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sd3ZsPbmm/TqCzyvuwxbyZGAw0bOEcr60FfnyA+uFck=;
        b=Olzfmtf2RP+s3H/yxmUDixQCSKpJNG752UR5bSCUSGwnP1OYgiZcw8PlEHaFXHZK8E
         ZMqdiaHWvjbuFpotSP3CqVI3P06KxPGxVssCCccMOXmY4KsWcRuYAfdRVS9Cpy48Ljsh
         tNaap2kcKuS1PE2nqsBS+ONpiRe5+hYoGqmzOusZKmqGJ2d96qIF2xV7KEC6PD3clic7
         EhOPPFot6nBzSe+X4zfcRASsO2xqr48G0+nQUlXhFEMu6V/d3Kz5N0ifTl7Pasbx9l1z
         1rDzQ2fw0GN6LrOTJtb4PAOU6I3BakQm9ZeDgTOpzxl9F3lNsBHFAbQIYCCwTXEqoNKZ
         EWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766399496; x=1767004296;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sd3ZsPbmm/TqCzyvuwxbyZGAw0bOEcr60FfnyA+uFck=;
        b=OT19hpKZfwGQAWeQAXVWlN/eBSg9WfxhxgcvO8rz0EzQbPI374OPFx2zFcDzGTAGZ5
         W9/Ew3BcZ9MTbRVuHxhhg6Y6u5IsV595qBulBdlyd7CTCWKb/8K3ZgIpgHDIjkh/k/lp
         HGneiDx3bmhaN9OMNK3amT2BsUNbWPGL0/Cydue65RK8DiNYRrNQXW5krbJrfXrL6uOX
         /MmQtHrD4tgRi6IjXfgHFd28VIiCIoaLWggCFg0lK55hTmsPxqW1aGnLO6nXi3MZG5E/
         fGCT+i8Pn1gQkCz5fCzxK9E/E50RVGYc6bPK1VuN/L0Hn1TkREjCicM3A6ni1RAwQoed
         Hzzg==
X-Forwarded-Encrypted: i=1; AJvYcCXoAH2s40PUShEYNMcKq+0+TdZp3W9K7CcgpjTlceScXq9MechcwA18xPN71h+xNCky3M1/NoV55zYjzH2F@vger.kernel.org
X-Gm-Message-State: AOJu0YwlExoylv+luZM83AOeQBmYRf41zAmqp+1sqM2/j9FP1R9WGbm/
	icFGsx48nHjTNFatxbO86PhzMJhrVeSrLec+z0/pFTEm2Csr2ogUMLNOVwTYH4wN/M9NvVfqLT8
	pMQzoXg+xQGzqSHm/FnVd4CRe3P76aCFesiCTmty2V4gFt3dwByrEeY9MszvWQUUwhHLf
X-Gm-Gg: AY/fxX7nktS9MlyfB/GCw0fOOFCzaNdQV6EK2wAWkjqX4ORhjuLGJ0rgkC7J2QRWCqR
	SQOyGunS+l/m1m2s4XLn1ejY8pX9EAMkw3BWk4rUanEbFpjs9hDMJgo8ibvCa6/PCGJRavLMRk3
	AsNxg+yC3tWNZ0uepVBvy94xZh88eEIXaXTU4roBX0WCBb/TyJAP+7GXzxuc6Cs7INKt5vzg6f6
	qT9wTY4eglQojweFqG7gX7N2oapMBmEpG5/EyBjUQvBaOjRmlmOXlhAzirf9DFTeHuosJYLdyrw
	OCkMlgPU8vntuSxn1hHITlM4tEGm0zrqIlVLrjruYFVpTWeNCJT63JgytlpNmDwRXkP+w3yEJv1
	O/0fhCtyRELr93W7sx59JRPKz8ZFC61IDOU5VWzMbhWJ0
X-Received: by 2002:a05:6a20:7285:b0:352:3695:fa64 with SMTP id adf61e73a8af0-376a94bf23emr10821133637.37.1766399496205;
        Mon, 22 Dec 2025 02:31:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEuhGQa6gBuPSQ7RJMYPiXhgGuMHU1tafo5ELmcsVLK1rusMvXx55oS11VPo8V4uxFpTc3UrA==
X-Received: by 2002:a05:6a20:7285:b0:352:3695:fa64 with SMTP id adf61e73a8af0-376a94bf23emr10821111637.37.1766399495655;
        Mon, 22 Dec 2025 02:31:35 -0800 (PST)
Received: from [10.217.219.25] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bc68ab5sm9256293a12.17.2025.12.22.02.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 02:31:35 -0800 (PST)
Message-ID: <54a25608-57d3-452c-a838-952d0935ef37@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 16:01:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] net: mhi: Enable Ethernet interface support
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam <mani@kernel.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org
References: <20251209-vdev_next-20251208_eth_v6-v6-0-80898204f5d8@quicinc.com>
 <20251209-vdev_next-20251208_eth_v6-v6-1-80898204f5d8@quicinc.com>
 <5a137b11-fa08-40b5-b4b4-79d10844a5b7@lunn.ch>
 <eaf79686-9fcb-4330-8017-83a4e4923985@oss.qualcomm.com>
 <a8e6a25a-24c6-4739-a9cc-0e0621f093ed@lunn.ch>
Content-Language: en-US
From: vivek pernamitta <vivek.pernamitta@oss.qualcomm.com>
In-Reply-To: <a8e6a25a-24c6-4739-a9cc-0e0621f093ed@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ijERextHiI0-K9TmlXbFjPmA-las2Wfg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5NSBTYWx0ZWRfX40RdzupErIbW
 7K28wzUaNxke4OtvbdguVtUOzkl5tzGfxb73LlQ2RiOEOhnMHnxaGUj09vpwZ96GOI7/n5aRLb5
 XphVilyZhFSygaCejEB3sj8vmCUE93YgL05TOIybB4v2QKU8o+7fOMN6e11Qevch9XDp8sYVn+Z
 l1LhMqQlsgd9AOHZ5wkr78bK3iAzfFbsK0f/Un4W34biVC6yD1QB/bRvFcogUyS1dRwRlplUNX2
 AytRwirujPErt8WygxF08FXmjwNJfDU0HM1sRAxYIySdvkc+iZBlP1zaiFipMgBBvsX4utIIdqJ
 CStrAF1RR8ZFtoqhYKPquVgkK8SgjtWHCv2bav1jWwW72W9UL5t/J6aEykdeztxT2nQFtMLwjf2
 7WQBknQNU0wtY3w+6Dvi9zJoRlSRjnQep96E+DLD0gcecXskNa6jT1rfzkgvhtvcQpUHbj0xTlC
 1RgYYSt/DYGuII4jPsQ==
X-Authority-Analysis: v=2.4 cv=YOKSCBGx c=1 sm=1 tr=0 ts=69491e08 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P-IC7800AAAA:8 a=82xI_hd8Nmh2SGOlAZoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: ijERextHiI0-K9TmlXbFjPmA-las2Wfg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220095



On 12/10/2025 10:20 PM, Andrew Lunn wrote:
> On Wed, Dec 10, 2025 at 10:46:11AM +0530, vivek pernamitta wrote:
>>
>> On 12/9/2025 7:06 PM, Andrew Lunn wrote:
>>
>>                  ndev = alloc_netdev(sizeof(struct mhi_net_dev), info->netname,
>>          -                           NET_NAME_PREDICTABLE, mhi_net_setup);
>>          +                           NET_NAME_PREDICTABLE, info->ethernet_if ?
>>          +                           mhi_ethernet_setup : mhi_net_setup);
>>
>>      Is the name predictable? I thought "eth%d" was considered
>>      NET_NAME_ENUM?
>>
>>      https://elixir.bootlin.com/linux/v6.18/source/net/ethernet/eth.c#L382
>>
>>              Andrew
>>
>> For Ethernet-type devices, the interface name will follow the standard
>> convention: eth%d,
>> For normal IP interfaces, the interface will be created as mhi_swip%d/
>> mhi_hwip%d.
>> The naming will depend on the details provided through struct mhi_device_info.
> 
> Take a look again at my question. Why is NET_NAME_PREDICTABLE correct?
> Justify it. Especially given what alloc_etherdev_mqs() does.
> 
> 	Andrew

You’re right—eth%d should use NET_NAME_ENUM. I’ll update the patch to 
use NET_NAME_ENUM for both Ethernet-type interfaces and for non-Ethernet 
(SW/HW IP) interfaces.
Thanks for the pointer.

Regards
Vivek



