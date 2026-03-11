Return-Path: <linux-arm-msm+bounces-96904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKtMJx8vsWkVrwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:00:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF3625FDE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:00:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0630E32128C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 08:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ABD43BB9E3;
	Wed, 11 Mar 2026 08:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhs5fZMy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F69iKgYQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E493F3B6358
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 08:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773218253; cv=none; b=aIzJkm7JmKwtqh6Zww1vRt9YNdAg4bIHKJr72IuUScriZ4BJk3DGZnVlzaEDYYb67nQ7ni8TCN6h8XpWL+Z0ES2oPwqZGrb6qcYGoZI15YJRNkyYPGIPDQBKbHLgL2O40BwcE32/VKCSP8al6wskPp//qielDdh6xmTw755D5y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773218253; c=relaxed/simple;
	bh=x7L8prCT6Rl0yO0Ys8jD1kk7ROA4hOyc92FdG9z+IgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AFIOwuUMY6z7HrAzIMPxT1b4b07Ja9Oee/farOdBauxva5xJWTz4J2q1Hq2DE2GWKhdutek3MGPuTG35eF83SI5yDi7cnekBf/AeD0lCWMhkfyeVaX9zvHG+12+Tw8wTITuNh0awl+wf8Bt465GZRsoTRrsBGjfzZrtWm8Io6N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hhs5fZMy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F69iKgYQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B7Q4iD2030858
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 08:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v6shnDKy0mTtNDl8IP4ADRHwgFmAxB+//orXLuR5fLg=; b=hhs5fZMyvtxS8Nuu
	ytOLTRbVQ6fk7Nn3abZLkq4nk10BNPQgEP4xkSb75GAgLxtR8jfPQVALSNIK7cQt
	rEnKprQJPKQQe1prkq0IYawtPRkKqGL5DB9X1vgxK+SrSJXxiM+5raitEo0U0ZyF
	FJAjzHYw04iSe5osB9V/zMgrMm+hsPFXESQdDQi96rffkrjJNsmgL5axWCcr6Yxw
	Vk/i3gIeCLyIRyRiSzbBoTD1flcFtkou7t41nocrIfOv3n0aiXLrvweArTeVorNZ
	nxMd2wy/5pcqZREwyaV1LBEyNeUoLSvKiQtOPXTiBUtacHJtPkm1iEgB+nCoybAy
	AC9j6w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu40h07xy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 08:37:31 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82984060901so582838b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773218249; x=1773823049; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v6shnDKy0mTtNDl8IP4ADRHwgFmAxB+//orXLuR5fLg=;
        b=F69iKgYQMNbNeTeQHthCQDZJ6PIu5B8wxSWDMgmUarO96eavRJHFFRotJCZuEN1tOG
         G6gdvhQnwdo84yrxxbeNtzCVy15ePVE+PeAEMvZJlGNkrxPKrpoZHLHNkC9TBje28fCQ
         dB2/xYUZtoO5mZdP3wiDEyRoTFrikHAW3G/jjD07n6Dw/PTCvNRThzQmOWoERvo3qjJe
         UQhmJypH1d3KOdOUYAon+wZ8jIVZvZgzjaFoDUHMa3uZojsb/FRn9RF4EDQNx2wINE9Z
         o/0zrI43TG38j3kiouWQc09NGzMfvbF8l9R+gH2XO094o+FUo/VwPywIU2RQogpOQ0X/
         /MQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773218249; x=1773823049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6shnDKy0mTtNDl8IP4ADRHwgFmAxB+//orXLuR5fLg=;
        b=lv/ohGQzdnxUBiK4EvZ6knMcrgLqEcI4o26dbJAQxFhjwelt8N1Il+qefDiq2wcpGC
         jlXUSBgubgM+qcRpfl6ORBSs29P5nj6eVb22hVUo285n/UCrDRQL/HF+esiXQL/GCRa5
         0eB7Jhke7WgDGovW1RdTcbJN5u/0vCLUMhJ0+1L86QOtlToM0ybGg5nacFWV0afAAtKE
         4MRSgyF8Se+/EqL0Wni6hSCiWLqJvQPPw6GqaezOsDvCb2KkzipRlzU1Fr0NeSXE20Pz
         dHwRPh2XglVbR75OmHspztPNSlY+X3dLOgSp07u1eVCSzV4MWR8+la4kdCMS4ALdCbNe
         gbDg==
X-Forwarded-Encrypted: i=1; AJvYcCWQenAEdtZLLl7y6KfORPvCJX/pp+Z5qKzmibin5eKuYxipAf8HOpRPfCB5SinwVAZ5X9F1WsJc5gNMbheA@vger.kernel.org
X-Gm-Message-State: AOJu0YzEd+begOZ+x7aTd+uKYPgsdkNuxujWMyjUtKLloZECZ4eoV5Sk
	JpS9+B34LUZxdPE72yzyZEKpNCPKJSIkafgjwEQmgi+AfE39jT/ja5W5kO9yJJCUfu27BLjqk1N
	25GEn4y3+HiwrHSzRLBwEIDgNcBfJAMTO8JQfffJzHbvHHrL2Id+6se4GKYC0VBCa5/QD
X-Gm-Gg: ATEYQzyehGZ6Jt4D6VIrqjqHS3eO2jWoxnV4USDvPetWfMtV+Z3B+BBKIMmB5vfZaBw
	qXc7rNi66tOyUZjjb0orK3UouPRPTXiNP+laU3NyKzjoXFWvjU8OspBS9iL6PcaCCWkoq2jcMEN
	onMyfDotIjX0NkWYxLjb98H52iUfFrR2BTE2Mox3ALBTTWrSIMS7f2rwT/9EteUNwmXwIh2W+nN
	/6VovbtXsXSM5MQ3rE5I9bjT+3kLdqnNHWitd78vfHBKqGQS4NVoAwYwOvFFG6YKQstaJVj+Iw9
	jR7VifW4PWp8ItZxzgn8ypdOujH2fMCUgDQHKBgN5AwEjTp3UypFfG2H/euH0aebUQtcjEMIX3U
	XG/VgxjzF/6fTxTz8R3UPKIq1U28bmePM73exHjMbK2i5dpd37sYO9A==
X-Received: by 2002:a05:6a00:349a:b0:81f:4e1c:1d3b with SMTP id d2e1a72fcca58-829f7ae6a79mr1535909b3a.23.1773218249457;
        Wed, 11 Mar 2026 01:37:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:349a:b0:81f:4e1c:1d3b with SMTP id d2e1a72fcca58-829f7ae6a79mr1535869b3a.23.1773218248955;
        Wed, 11 Mar 2026 01:37:28 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6df3b14sm1736918b3a.20.2026.03.11.01.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 01:37:28 -0700 (PDT)
Message-ID: <cd192707-1f8e-4ad7-8be5-470415fb4e95@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 14:07:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/4] PCI: Add support for resetting the Root Ports in a
 platform specific way
To: manivannan.sadhasivam@oss.qualcomm.com,
        Bjorn Helgaas <bhelgaas@google.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Niklas Cassel <cassel@kernel.org>,
        Wilfred Mallawa
 <wilfred.mallawa@wdc.com>,
        Lukas Wunner <lukas@wunner.de>, Richard Zhu <hongxing.zhu@nxp.com>,
        Brian Norris <briannorris@chromium.org>,
        Wilson Ding <dingwei@marvell.com>, Frank Li <Frank.Li@nxp.com>
References: <20260310-pci-port-reset-v7-0-9dd00ccc25ab@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260310-pci-port-reset-v7-0-9dd00ccc25ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA3MSBTYWx0ZWRfX2dBZ08rtJzQ2
 df6zAfHtVqVV7jYEDczTU/rKOSr5x8eqGNsX46WUGEKY4eE7PIJmGWn+iiJ5cxHBShfSol8oOXz
 0b0/LiBPEMaWsl8xC+QPP5TSvdaCFZYTnPQOmgSzYM9ihefUJJkJgEh/Hd0gwBPvwROrbeyLHts
 rvVPkeHJB2DxxdjsRFtvjP7cdFcFX+Idm0LaUrJ219arqFftl7FI0SJa2X+7u9bFPvC9iMzmizU
 55tmszmnoPHKMWVXzTTGRsQtzKzqBk3uIluPUchF3IEEjJ21HjfQ5ql9ruG321vG2HHfr2jHogu
 3Wbkjyh4Nrm0o8AMxijuJQU25v3ezxbi/lm7YGUDog0ogL+wr6i9ISu2R9mvjuyy5/hdup/CDWD
 iVBpgSi6Thj4AgtkmaHJ/mRemuSxJHNSvjbPo20iG1PfaW7s7momuyUxmOhX6PiA2iTWnrXQvGT
 OqEY4eXLS4mBisn1+oA==
X-Proofpoint-ORIG-GUID: eU7mZrMo3zxdVTdzxqAUvQs3pQd6T3fZ
X-Authority-Analysis: v=2.4 cv=YJ+SCBGx c=1 sm=1 tr=0 ts=69b129cb cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=lJ8DZ0MjVbnDIa4D:21 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ImqNvw3yTObJCdT6Mg8A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: eU7mZrMo3zxdVTdzxqAUvQs3pQd6T3fZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110071
X-Rspamd-Queue-Id: 6DF3625FDE0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96904-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,google.com,linux.ibm.com,gmail.com,kernel.org,sntech.de,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Action: no action



On 3/10/2026 7:31 PM, Manivannan Sadhasivam via B4 Relay wrote:
> Hi,
>
> Currently, in the event of AER/DPC, PCI core will try to reset the slot (Root
> Port) and its subordinate devices by invoking bridge control reset and FLR. But
> in some cases like AER Fatal error, it might be necessary to reset the Root
> Ports using the PCI host bridge drivers in a platform specific way (as indicated
> by the TODO in the pcie_do_recovery() function in drivers/pci/pcie/err.c).
> Otherwise, the PCI link won't be recovered successfully.
>
> So this series adds a new callback 'pci_host_bridge::reset_root_port' for the
> host bridge drivers to reset the Root Port when a fatal error happens.
>
> Also, this series allows the host bridge drivers to handle PCI link down event
> by resetting the Root Ports and recovering the bus. This is accomplished by the
> help of the new 'pci_host_handle_link_down()' API. Host bridge drivers are
> expected to call this API (preferrably from a threaded IRQ handler) with
> relevant Root Port 'pci_dev' when a link down event is detected for the port.
> The API will reuse the pcie_do_recovery() function to recover the link if AER
> support is enabled, otherwise it will directly call the reset_root_port()
> callback of the host bridge driver (if exists).
>
> For reference, I've modified the pcie-qcom driver to call
> pci_host_handle_link_down() API with Root Port 'pci_dev' after receiving the
> LDn global_irq event and populated 'pci_host_bridge::reset_root_port()'
> callback to reset the Root Ports.
>   
> Testing
> -------
>
> Tested on Qcom Lemans AU Ride platform with Host and EP SoCs connected over PCIe
> link. Simulated the LDn by disabling LTSSM_EN on the EP and I could verify that
> the link was getting recovered successfully.
>
> Changes in v7:
> - Dropped Rockchip Root port reset patch due to reported issues. But the series
>    works on other platforms as tested by others.
> - Added pci_{lock/unlock}_rescan_remove() to guard pci_bus_error_reset() as the
>    device could be removed in-between due to Native hotplug interrupt.
> - Rebased on top of v7.0-rc1
> - Link to v6: https://lore.kernel.org/r/20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com
>
> Changes in v6:
> - Incorporated the patch: https://lore.kernel.org/all/20250524185304.26698-2-manivannan.sadhasivam@linaro.org/
> - Link to v5: https://lore.kernel.org/r/20250715-pci-port-reset-v5-0-26a5d278db40@oss.qualcomm.com
>
> Changes in v5:
> * Reworked the pci_host_handle_link_down() to accept Root Port instead of
>    resetting all Root Ports in the event of link down.
> * Renamed 'reset_slot' to 'reset_root_port' to avoid confusion as both terms
>    were used interchangibly and the series is intended to reset Root Port only.
> * Added the Rockchip driver change to this series.
> * Dropped the applied patches and review/tested tags due to rework.
> * Rebased on top of v6.16-rc1.
>
> Changes in v4:
> - Handled link down first in the irq handler
> - Updated ICC & OPP bandwidth after link up in reset_slot() callback
> - Link to v3: https://lore.kernel.org/r/20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org
>
> Changes in v3:
> - Made the pci-host-common driver as a common library for host controller
>    drivers
> - Moved the reset slot code to pci-host-common library
> - Link to v2: https://lore.kernel.org/r/20250416-pcie-reset-slot-v2-0-efe76b278c10@linaro.org
>
> Changes in v2:
> - Moved calling reset_slot() callback from pcie_do_recovery() to pcibios_reset_secondary_bus()
> - Link to v1: https://lore.kernel.org/r/20250404-pcie-reset-slot-v1-0-98952918bf90@linaro.org
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
For entire series,
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

- Krishna Chaitanya.
> ---
> Manivannan Sadhasivam (4):
>        PCI/ERR: Add support for resetting the Root Ports in a platform specific way
>        PCI: host-common: Add link down handling for Root Ports
>        PCI: qcom: Add support for resetting the Root Port due to link down event
>        misc: pci_endpoint_test: Add AER error handlers
>
>   drivers/misc/pci_endpoint_test.c         |  20 +++++
>   drivers/pci/controller/dwc/pcie-qcom.c   | 143 ++++++++++++++++++++++++++++++-
>   drivers/pci/controller/pci-host-common.c |  35 ++++++++
>   drivers/pci/controller/pci-host-common.h |   1 +
>   drivers/pci/pci.c                        |  21 +++++
>   drivers/pci/pcie/err.c                   |   6 +-
>   include/linux/pci.h                      |   1 +
>   7 files changed, 221 insertions(+), 6 deletions(-)
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20250715-pci-port-reset-4d9519570123
>
> Best regards,


